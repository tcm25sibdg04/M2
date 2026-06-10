import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {DbDataSource} from '../datasources';
import {Servico, ServicoRelations} from '../models';

export class ServicoRepository extends DefaultCrudRepository<
  Servico,
  typeof Servico.prototype.id,
  ServicoRelations
> {
  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
  ) {
    super(Servico, dataSource);
  }
}
