import {Entity, model, property, belongsTo} from '@loopback/repository';
import {Especialidade} from './especialidade.model';

@model()
export class Medico extends Entity {
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
  nome: string;

  @property({
    type: 'string',
    required: true,
  })
  cedula: string;

  @belongsTo(() => Especialidade, {name: 'especialidade'})
  id_especialidade: number;

  constructor(data?: Partial<Medico>) {
    super(data);
  }
}

export interface MedicoRelations {
  // describe navigational properties here
}

export type MedicoWithRelations = Medico & MedicoRelations;
