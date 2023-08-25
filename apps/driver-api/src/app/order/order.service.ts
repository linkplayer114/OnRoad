import { InjectPubSub } from '@ptc-org/nestjs-query-graphql';
import { HttpService } from '@nestjs/axios';
import { Injectable, Logger } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Point } from '@ridy/database';
import { DriverStatus } from '@ridy/database/enums/driver-status.enum';
import { OrderStatus } from '@ridy/database/enums/order-status.enum';
import { PaymentStatus } from '@ridy/database/enums/payment-status.enum';
import { RequestActivityType } from '@ridy/database/enums/request-activity-type.enum';
import { PaymentEntity } from '@ridy/database/payment.entity';
import { RequestActivityEntity } from '@ridy/database/request-activity.entity';
import { RequestEntity } from '@ridy/database/request.entity';
import { SharedDriverService } from '@ridy/order/shared-driver.service';
import { SharedFleetService } from '@ridy/order/shared-fleet.service';
import { OrderRedisService } from '@ridy/redis/order-redis.service';
import { ForbiddenError } from '@nestjs/apollo';
import { RedisPubSub } from 'graphql-redis-subscriptions';
import { firstValueFrom } from 'rxjs';
import { In, Repository } from 'typeorm';

@Injectable()
export class OrderService {
  constructor(
    @InjectRepository(RequestEntity)
    public orderRepository: Repository<RequestEntity>,
    @InjectRepository(RequestActivityEntity)
    public activityRepository: Repository<RequestActivityEntity>,
    @InjectRepository(PaymentEntity)
    public paymentRepository: Repository<PaymentEntity>,
    private driverService: SharedDriverService,
    private orderRedisService: OrderRedisService,
    private sharedFleetService: SharedFleetService,
    @InjectPubSub()
    private pubSub: RedisPubSub,
    private httpService: HttpService,
  ) {}

  async cancelOrder(orderId: number): Promise<RequestEntity> {
    let order = await this.orderRepository.findOneBy({ id: orderId });
    const allowedStatuses = [OrderStatus.DriverAccepted, OrderStatus.Arrived];
    if (order == null || !allowedStatuses.includes(order.status)) {
      throw new ForbiddenError('CANCEL_NOT_ALLOWED');
    }
    await this.orderRepository.update(order.id, {
      status: OrderStatus.DriverCanceled,
      finishTimestamp: new Date(),
      costAfterCoupon: 0,
    });
    order = await this.orderRepository.findOneBy({ id: order.id });
    const payments = await this.paymentRepository.find({
      where: {
        userType: 'client',
        userId: order.riderId.toString(),
        status: PaymentStatus.Authorized,
        orderNumber: order.id.toString(),
      },
      order: { id: 'DESC' },
    });
    for (let payment of payments) {
      await firstValueFrom(
        this.httpService.get<{ status: 'OK' | 'FAILED' }>(
          `${process.env.GATEWAY_SERVER_URL}/cancel_preauth?id=${payment.transactionNumber}`,
        ),
      );
    }
    await this.driverService.updateDriverStatus(
      order.driverId,
      DriverStatus.Online,
    );
    return order;
  }

  async expireOrders(orderIds: number[]) {
    this.orderRedisService.expire(orderIds);
    this.orderRepository.update(orderIds, { status: OrderStatus.Expired });
    for (const requestId of orderIds) {
      this.activityRepository.insert({
        requestId,
        type: RequestActivityType.Expired,
      });
    }
  }

  async getOrdersForDriver(driverId: number): Promise<RequestEntity[]> {
    const driver = await this.driverService.driverRepo.findOneOrFail({
      where: { id: driverId },
      relations: {
        enabledServices: true,
      },
    });
    Logger.log(`getting orders for driver ${JSON.stringify(driver)}`);
    const orderIds = (
      await this.orderRedisService.getForDriver(driverId, driver.searchDistance)
    ).map((id) => parseInt(id));
    Logger.log(`got order ids ${JSON.stringify(orderIds)}`);
    let orders = await this.orderRepository.find({
      where: {
        id: In(orderIds),
        serviceId: In(driver.enabledServices.map((service) => service.id)),
        status: In([
          OrderStatus.NoCloseFound,
          OrderStatus.NoCloseFound,
          OrderStatus.Found,
          OrderStatus.Booked,
          OrderStatus.Requested,
        ]),
      },
      relations: ['service', 'options'],
    });
    Logger.log(`got orders ${JSON.stringify(orders)}`);
    for (let order of orders) {
      const fleetIds = await this.sharedFleetService.getFleetIdsInPoint(
        order.points[0],
      );
      if (
        fleetIds.length > 0 &&
        (!fleetIds.includes(driver.fleetId) || driver.fleetId == null)
      ) {
        orders = orders.filter((_order) => _order.id != order.id);
      }
    }
    Logger.log(
      `got filtered orders by fleet criteria ${JSON.stringify(orders)}`,
    );

    return orders;
  }
}
