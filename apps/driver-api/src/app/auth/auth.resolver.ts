import { Args, CONTEXT, Int, Mutation, Query, Resolver } from '@nestjs/graphql';
import { JwtService } from '@nestjs/jwt';

import { DriverService } from '../driver/driver.service';
import { LoginDTO } from './dto/login.dto';
import { LoginInput } from './dto/login.input';
import { VersionStatus } from '@ridy/database/enums/version-status.enum';
import { DriverDTO } from '../driver/dto/driver.dto';
import { Inject, UseGuards } from '@nestjs/common';
import { GqlAuthGuard } from './jwt-gql-auth.guard';
import { UserContext } from './authenticated-user';
import { SharedDriverService } from '@ridy/order/shared-driver.service';
import { ForbiddenError } from '@nestjs/apollo';
import { auth } from 'firebase-admin';

@Resolver()
export class AuthResolver {
  constructor(
    private driverService: DriverService,
    private sharedDriverService: SharedDriverService,
    private jwtService: JwtService,
    @Inject(CONTEXT)
    private userContext: UserContext,
  ) {}

  @Mutation(() => LoginDTO)
  async login(
    @Args('input', { type: () => LoginInput }) input: LoginInput,
  ): Promise<LoginDTO> {
    const decodedToken = await auth().verifyIdToken(input.firebaseToken);
    const number = (
      decodedToken.firebase.identities.phone[0] as string
    ).substring(1);
    const user = await this.driverService.findOrCreateUserWithMobileNumber(
      number,
    );
    const payload = { id: user.id };
    return {
      jwtToken: this.jwtService.sign(payload),
    };
  }

  @Query(() => VersionStatus)
  async requireUpdate(
    @Args('versionCode', { type: () => Int }) versionCode: number,
  ) {
    if (
      process.env.MANDATORY_VERSION_CODE != null &&
      versionCode < parseInt(process.env.MANDATORY_VERSION_CODE)
    ) {
      return VersionStatus.MandatoryUpdate;
    }
    if (
      process.env.OPTIONAL_VERSION_CODE != null &&
      versionCode < parseInt(process.env.OPTIONAL_VERSION_CODE)
    ) {
      return VersionStatus.OptionalUpdate;
    }
    return VersionStatus.Latest;
  }

  @Mutation(() => DriverDTO)
  @UseGuards(GqlAuthGuard)
  async deleteUser() {
    return this.sharedDriverService.deleteById(this.userContext.req.user.id);
  }

  @Mutation(() => LoginDTO)
  async skipVerification(@Args('mobileNumber') mobileNumber: string) {
    if (process.env.DEMO_MODE !== 'true') {
      throw new ForbiddenError('Not in demo mode');
    }
    if (mobileNumber.startsWith('+')) {
      mobileNumber = mobileNumber.substring(1);
    }
    const user = await this.driverService.findOrCreateUserWithMobileNumber(
      mobileNumber,
    );
    const payload = { id: user.id };
    return {
      jwtToken: this.jwtService.sign(payload),
    };
  }
}
