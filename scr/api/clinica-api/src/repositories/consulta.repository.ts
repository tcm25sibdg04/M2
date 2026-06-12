import {inject, Getter} from '@loopback/core';
import {DefaultCrudRepository, repository, BelongsToAccessor} from '@loopback/repository';
import {DbDataSource} from '../datasources';
import {Consulta, ConsultaRelations, Paciente, Medico, Servico} from '../models';
import {PacienteRepository} from './paciente.repository';
import {MedicoRepository} from './medico.repository';
import {ServicoRepository} from './servico.repository';

export class ConsultaRepository extends DefaultCrudRepository<
  Consulta,
  typeof Consulta.prototype.id,
  ConsultaRelations
> {

  public readonly paciente: BelongsToAccessor<Paciente, typeof Consulta.prototype.id>;

  public readonly medico: BelongsToAccessor<Medico, typeof Consulta.prototype.id>;

  public readonly servico: BelongsToAccessor<Servico, typeof Consulta.prototype.id>;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource, @repository.getter('PacienteRepository') protected pacienteRepositoryGetter: Getter<PacienteRepository>, @repository.getter('MedicoRepository') protected medicoRepositoryGetter: Getter<MedicoRepository>, @repository.getter('ServicoRepository') protected servicoRepositoryGetter: Getter<ServicoRepository>,
  ) {
    super(Consulta, dataSource);
    this.servico = this.createBelongsToAccessorFor('servico', servicoRepositoryGetter,);
    this.registerInclusionResolver('servico', this.servico.inclusionResolver);
    this.medico = this.createBelongsToAccessorFor('medico', medicoRepositoryGetter,);
    this.registerInclusionResolver('medico', this.medico.inclusionResolver);
    this.paciente = this.createBelongsToAccessorFor('paciente', pacienteRepositoryGetter,);
    this.registerInclusionResolver('paciente', this.paciente.inclusionResolver);
  }
}
