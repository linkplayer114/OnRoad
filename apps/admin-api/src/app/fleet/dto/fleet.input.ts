import { InputType } from '@nestjs/graphql';
import { Point } from '@ridy/database';

@InputType()
export class FleetInput {
  name!: string;
  phoneNumber: string;
  mobileNumber: string;
  accountNumber: string;
  commissionSharePercent!: number;
  commissionShareFlat!: number;
  feeMultiplier?: number;
  address?: string;
  exclusivityAreas?: Point[][];
}
