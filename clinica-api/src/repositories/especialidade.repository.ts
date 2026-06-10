import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {DbDataSource} from '../datasources';
import {Especialidade, EspecialidadeRelations} from '../models';

export class EspecialidadeRepository extends DefaultCrudRepository<
  Especialidade,
  typeof Especialidade.prototype.id,
  EspecialidadeRelations
> {
  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
  ) {
    super(Especialidade, dataSource);
  }
}
