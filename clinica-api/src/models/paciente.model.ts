import {Entity, model, property} from '@loopback/repository';

@model()
export class Paciente extends Entity {
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
  nascimento: string;

  @property({
    type: 'string',
    required: true,
  })
  telefone: string;

  @property({
    type: 'string',
    required: true,
  })
  cc: string;

  @property({
    type: 'string',
    required: true,
  })
  num_saude: string;

  @property({
    type: 'string',
  })
  seguro?: string;

  @property({
    type: 'string',
  })
  telefone_extra?: string;


  constructor(data?: Partial<Paciente>) {
    super(data);
  }
}

export interface PacienteRelations {
  // describe navigational properties here
}

export type PacienteWithRelations = Paciente & PacienteRelations;
