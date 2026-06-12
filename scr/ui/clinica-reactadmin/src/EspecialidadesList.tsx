import { List, Datagrid, TextField, NumberField } from "react-admin";

export const EspecialidadesList = () => (
  <List>
    <Datagrid rowClick="edit">
      <NumberField source="id" />
      <TextField source="nome" />
    </Datagrid>
  </List>
);