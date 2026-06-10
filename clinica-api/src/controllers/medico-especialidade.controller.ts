import {
  repository,
} from '@loopback/repository';
import {
  param,
  get,
  getModelSchemaRef,
} from '@loopback/rest';
import {
  Medico,
  Especialidade,
} from '../models';
import {MedicoRepository} from '../repositories';

export class MedicoEspecialidadeController {
  constructor(
    @repository(MedicoRepository)
    public medicoRepository: MedicoRepository,
  ) { }

  @get('/medicos/{id}/especialidade', {
    responses: {
      '200': {
        description: 'Especialidade belonging to Medico',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Especialidade),
          },
        },
      },
    },
  })
  async getEspecialidade(
    @param.path.number('id') id: typeof Medico.prototype.id,
  ): Promise<Especialidade> {
    return this.medicoRepository.especialidade(id);
  }
}
