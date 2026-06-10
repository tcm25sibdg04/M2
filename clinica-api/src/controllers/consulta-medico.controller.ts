import {
  repository,
} from '@loopback/repository';
import {
  param,
  get,
  getModelSchemaRef,
} from '@loopback/rest';
import {
  Consulta,
  Medico,
} from '../models';
import {ConsultaRepository} from '../repositories';

export class ConsultaMedicoController {
  constructor(
    @repository(ConsultaRepository)
    public consultaRepository: ConsultaRepository,
  ) { }

  @get('/consultas/{id}/medico', {
    responses: {
      '200': {
        description: 'Medico belonging to Consulta',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Medico),
          },
        },
      },
    },
  })
  async getMedico(
    @param.path.number('id') id: typeof Consulta.prototype.id,
  ): Promise<Medico> {
    return this.consultaRepository.medico(id);
  }
}
