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
  Servico,
} from '../models';
import {ConsultaRepository} from '../repositories';

export class ConsultaServicoController {
  constructor(
    @repository(ConsultaRepository)
    public consultaRepository: ConsultaRepository,
  ) { }

  @get('/consultas/{id}/servico', {
    responses: {
      '200': {
        description: 'Servico belonging to Consulta',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Servico),
          },
        },
      },
    },
  })
  async getServico(
    @param.path.number('id') id: typeof Consulta.prototype.id,
  ): Promise<Servico> {
    return this.consultaRepository.servico(id);
  }
}
