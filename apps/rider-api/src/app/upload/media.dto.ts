import { IDField } from '@ptc-org/nestjs-query-graphql';
import { ID, ObjectType } from '@nestjs/graphql';

@ObjectType('Media')
export class MediaDTO {
  @IDField(() => ID)
  id: number;
  address: string;
  base64?: string;
}
