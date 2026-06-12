import {inject, Getter} from '@loopback/core';
import {DefaultCrudRepository, repository, BelongsToAccessor} from '@loopback/repository';
import {DbDataSource} from '../datasources';
import {Medico, MedicoRelations, Especialidade} from '../models';
import {EspecialidadeRepository} from './especialidade.repository';

export class MedicoRepository extends DefaultCrudRepository<
  Medico,
  typeof Medico.prototype.id,
  MedicoRelations
> {

  public readonly especialidade: BelongsToAccessor<Especialidade, typeof Medico.prototype.id>;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource, @repository.getter('EspecialidadeRepository') protected especialidadeRepositoryGetter: Getter<EspecialidadeRepository>,
  ) {
    super(Medico, dataSource);
    this.especialidade = this.createBelongsToAccessorFor('especialidade', especialidadeRepositoryGetter,);
    this.registerInclusionResolver('especialidade', this.especialidade.inclusionResolver);
  }
}
