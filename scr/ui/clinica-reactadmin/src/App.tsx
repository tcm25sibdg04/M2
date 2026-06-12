import { 
  Admin, Resource, 
  List, Datagrid, TextField, NumberField,
  Edit, Create, SimpleForm, TextInput, NumberInput
} from "react-admin";
// @ts-ignore
import lb4Provider from "ra-data-loopback4";

const baseDataProvider = lb4Provider("http://localhost:3000");

const dataProvider = {
  ...baseDataProvider,
  getList: async (resource: any, params: any) => {
    try {
      return await baseDataProvider.getList(resource, params);
    } catch (error) {
      const response = await fetch(`http://localhost:3000/${resource}`);
      const data = await response.json();
      return {
        data: data.map((item: any) => ({ ...item, id: item.id || item._id })),
        total: data.length,
      };
    }
  },
};

const EspecialidadesList = () => (
  <List><Datagrid rowClick="edit"><NumberField source="id" /><TextField source="nome" /></Datagrid></List>
);
const EspecialidadesEdit = () => (
  <Edit><SimpleForm><NumberInput source="id" disabled /><TextInput source="nome" /></SimpleForm></Edit>
);
const EspecialidadesCreate = () => (
  <Create><SimpleForm><TextInput source="nome" /></SimpleForm></Create>
);

const ServicosList = () => (
  <List><Datagrid rowClick="edit"><NumberField source="id" /><TextField source="nome" /><NumberField source="preco" /></Datagrid></List>
);
const ServicosEdit = () => (
  <Edit><SimpleForm><NumberInput source="id" disabled /><TextInput source="nome" /><NumberInput source="preco" /></SimpleForm></Edit>
);
const ServicosCreate = () => (
  <Create><SimpleForm><TextInput source="nome" /><NumberInput source="preco" /></SimpleForm></Create>
);

const PacientesList = () => (
  <List>
    <Datagrid rowClick="edit">
      <NumberField source="id" />
      <TextField source="nome" />
      <TextField source="nascimento" />
      <TextField source="telefone" />
      <TextField source="cc" />
      <TextField source="num_saude" />
      <TextField source="seguro" />
    </Datagrid>
  </List>
);
const PacientesEdit = () => (
  <Edit>
    <SimpleForm>
      <NumberInput source="id" disabled />
      <TextInput source="nome" />
      <TextInput source="nascimento" />
      <TextInput source="telefone" />
      <TextInput source="cc" />
      <TextInput source="num_saude" />
      <TextInput source="seguro" />
    </SimpleForm>
  </Edit>
);
const PacientesCreate = () => (
  <Create>
    <SimpleForm>
      <TextInput source="nome" />
      <TextInput source="nascimento" />
      <TextInput source="telefone" />
      <TextInput source="cc" />
      <TextInput source="num_saude" />
      <TextInput source="seguro" />
    </SimpleForm>
  </Create>
);

const MedicosList = () => (
  <List>
    <Datagrid rowClick="edit">
      <NumberField source="id" />
      <TextField source="nome" />
      <TextField source="cedula" />
      <TextField source="id_especialidade" label="Id Especialidade" />
    </Datagrid>
  </List>
);
const MedicosEdit = () => (
  <Edit>
    <SimpleForm>
      <NumberInput source="id" disabled />
      <TextInput source="nome" />
      <TextInput source="cedula" />
      <NumberInput source="id_especialidade" />
    </SimpleForm>
  </Edit>
);
const MedicosCreate = () => (
  <Create>
    <SimpleForm>
      <TextInput source="nome" />
      <TextInput source="cedula" />
      <NumberInput source="id_especialidade" />
    </SimpleForm>
  </Create>
);

const ConsultasList = () => (
  <List>
    <Datagrid rowClick="edit">
      <NumberField source="id" />
      <TextField source="data_hora" label="Data/Hora" />
      <TextField source="estado" />
      <TextField source="id_paciente" label="Id Paciente" />
      <TextField source="id_medico" label="Id Médico" />
      <TextField source="id_servico" label="Id Serviço" />
    </Datagrid>
  </List>
);
const ConsultasEdit = () => (
  <Edit>
    <SimpleForm>
      <NumberInput source="id" disabled />
      <TextInput source="data_hora" />
      <TextInput source="estado" />
      <NumberInput source="id_paciente" />
      <NumberInput source="id_medico" />
      <NumberInput source="id_servico" />
    </SimpleForm>
  </Edit>
);
const ConsultasCreate = () => (
  <Create>
    <SimpleForm>
      <TextInput source="data_hora" />
      <TextInput source="estado" />
      <NumberInput source="id_paciente" />
      <NumberInput source="id_medico" />
      <NumberInput source="id_servico" />
    </SimpleForm>
  </Create>
);

export const App = () => (
  <Admin dataProvider={dataProvider}>
    <Resource name="especialidades" list={EspecialidadesList} edit={EspecialidadesEdit} create={EspecialidadesCreate} />
    <Resource name="servicos" list={ServicosList} edit={ServicosEdit} create={ServicosCreate} />
    <Resource name="pacientes" list={PacientesList} edit={PacientesEdit} create={PacientesCreate} />
    <Resource name="medicos" list={MedicosList} edit={MedicosEdit} create={MedicosCreate} />
    <Resource name="consultas" list={ConsultasList} edit={ConsultasEdit} create={ConsultasCreate} />
  </Admin>
);