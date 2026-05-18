1. Tabela: Paciente
Chave Primária: ID_Paciente (identificador único).

Campos Obrigatórios: Nome completo, data de nascimento e contacto.

Restrição de Valor Único (Sem repetições): Cartão de Cidadão (CC) e Número de Identificação de Saúde.

Campos Opcionais: Seguro de saúde e contactos de familiares.

2. Tabelas do Corpo Clínico: Especialidade e Médico
Tabela Especialidade:

Função: Guardar o nome da área médica (ex: Cardiologia, Fisioterapia, etc.).

Tabela Médico:

Chave Primária: ID próprio do médico.

Campos: Nome do doutor e número da cédula profissional.

Restrição de Valor Único: Número da cédula profissional.

Chave Estrangeira: Ligação que aponta para a tabela Especialidade (permite filtrar os médicos pelas suas áreas na hora de marcar).

3. Tabela: Serviço
Características: Funciona de maneira independente.

Campos: ID único (Chave Primária), nome do procedimento e preço.

Objetivo do Preço: Saber quanto cobrar e ajudar na faturação da clínica.

4. Tabela: Consulta (O ponto principal do sistema)
Chave Primária: ID_Consulta.

Campos de Controlo: Data e hora exata da marcação.

Chaves Estrangeiras (Cruzamento de dados): Ligação aos IDs da tabela Paciente, da tabela Médico e da tabela Serviço.

Campo Obrigatório "Estado":

Restrição de Verificação (Check): Apenas aceita as opções "Agendada", "Realizada" ou "Cancelada".

Utilidade: Gerir as faltas e verificar quem trabalhou.

5. Vista (View): Consultas_DoDia
Função: Funciona como um filtro automático na base de dados para a receção.

Como funciona: Junta a informação e mostra apenas as consultas marcadas para o próprio dia, evitando tabelas enormes.

Dados exibidos (Os 4 mais importantes):

1. Nome do paciente

2. Médico

3. Serviço

4. Hora certa da consulta

Benefícios: Check-in mais rápido, diminuição de filas e organização dos consultórios sem perder tempo com registos antigos.
