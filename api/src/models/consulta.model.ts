import {Entity, model, property, belongsTo} from '@loopback/repository';
import {Paciente} from './paciente.model';
import {Medico} from './medico.model';
import {Servico} from './servico.model';

@model()
export class Consulta extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
    required: true,
  })
  data_hora: string;

  @property({
    type: 'string',
  })
  estado?: string;
  @belongsTo(() => Paciente, {name: 'paciente'})
  id_paciente: number;

  @belongsTo(() => Medico, {name: 'medico'})
  id_medico: number;

  @belongsTo(() => Servico, {name: 'servico'})
  id_servico: number;

  constructor(data?: Partial<Consulta>) {
    super(data);
  }
}

export interface ConsultaRelations {
  // describe navigational properties here
}

export type ConsultaWithRelations = Consulta & ConsultaRelations;
