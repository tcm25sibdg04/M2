import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where,
} from '@loopback/repository';
import {
  post,
  param,
  get,
  getModelSchemaRef,
  patch,
  put,
  del,
  requestBody,
  response,
} from '@loopback/rest';
import {Especialidade} from '../models';
import {EspecialidadeRepository} from '../repositories';

export class EspecialidadeController {
  constructor(
    @repository(EspecialidadeRepository)
    public especialidadeRepository : EspecialidadeRepository,
  ) {}

  @post('/especialidades')
  @response(200, {
    description: 'Especialidade model instance',
    content: {'application/json': {schema: getModelSchemaRef(Especialidade)}},
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Especialidade, {
            title: 'NewEspecialidade',
            exclude: ['id'],
          }),
        },
      },
    })
    especialidade: Omit<Especialidade, 'id'>,
  ): Promise<Especialidade> {
    return this.especialidadeRepository.create(especialidade);
  }

  @get('/especialidades/count')
  @response(200, {
    description: 'Especialidade model count',
    content: {'application/json': {schema: CountSchema}},
  })
  async count(
    @param.where(Especialidade) where?: Where<Especialidade>,
  ): Promise<Count> {
    return this.especialidadeRepository.count(where);
  }

  @get('/especialidades')
  @response(200, {
    description: 'Array of Especialidade model instances',
    content: {
      'application/json': {
        schema: {
          type: 'array',
          items: getModelSchemaRef(Especialidade, {includeRelations: true}),
        },
      },
    },
  })
  async find(
    @param.filter(Especialidade) filter?: Filter<Especialidade>,
  ): Promise<Especialidade[]> {
    return this.especialidadeRepository.find(filter);
  }

  @patch('/especialidades')
  @response(200, {
    description: 'Especialidade PATCH success count',
    content: {'application/json': {schema: CountSchema}},
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Especialidade, {partial: true}),
        },
      },
    })
    especialidade: Especialidade,
    @param.where(Especialidade) where?: Where<Especialidade>,
  ): Promise<Count> {
    return this.especialidadeRepository.updateAll(especialidade, where);
  }

  @get('/especialidades/{id}')
  @response(200, {
    description: 'Especialidade model instance',
    content: {
      'application/json': {
        schema: getModelSchemaRef(Especialidade, {includeRelations: true}),
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Especialidade, {exclude: 'where'}) filter?: FilterExcludingWhere<Especialidade>
  ): Promise<Especialidade> {
    return this.especialidadeRepository.findById(id, filter);
  }

  @patch('/especialidades/{id}')
  @response(204, {
    description: 'Especialidade PATCH success',
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Especialidade, {partial: true}),
        },
      },
    })
    especialidade: Especialidade,
  ): Promise<void> {
    await this.especialidadeRepository.updateById(id, especialidade);
  }

  @put('/especialidades/{id}')
  @response(204, {
    description: 'Especialidade PUT success',
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() especialidade: Especialidade,
  ): Promise<void> {
    await this.especialidadeRepository.replaceById(id, especialidade);
  }

  @del('/especialidades/{id}')
  @response(204, {
    description: 'Especialidade DELETE success',
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.especialidadeRepository.deleteById(id);
  }
}
