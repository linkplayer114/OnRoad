import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { RiderEntity } from '@ridy/database/rider-entity';
import { SharedRiderService } from '@ridy/order/shared-rider.service';
import { auth } from 'firebase-admin';

@Injectable()
export class AuthService {
  constructor(
    private riderService: SharedRiderService,
    private jwtService: JwtService,
  ) {}

  async validateUser(firebaseToken: string): Promise<RiderEntity> {
    const decodedToken = await auth().verifyIdToken(firebaseToken);
    const number = (
      decodedToken.firebase.identities.phone[0] as string
    ).substring(1);
    const user = await this.riderService.findOrCreateUserWithMobileNumber(
      number,
    );
    return user;
  }

  async loginUser(user: RiderEntity): Promise<TokenObject> {
    const payload = { id: user.id };
    return {
      token: this.jwtService.sign(payload),
    };
  }
}

export type TokenObject = { token: string };
