import { IDField } from '@ptc-org/nestjs-query-graphql';
import { ID, ObjectType } from '@nestjs/graphql';

@ObjectType('CarModel')
export class CarModelDTO {
  @IDField(() => ID)
  id: number;
  name: string;
}
