import {Entity, model, property} from '@loopback/repository';

@model()
export class Especialidade extends Entity {
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


  constructor(data?: Partial<Especialidade>) {
    super(data);
  }
}

export interface EspecialidadeRelations {
  // describe navigational properties here
}

export type EspecialidadeWithRelations = Especialidade & EspecialidadeRelations;
