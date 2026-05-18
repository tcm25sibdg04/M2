O nosso projeto prático tem como objetivo desenvolver um sistema de informação, em
que queremos informatizar e organizar de forma eficiente a marcação de consultas numa
clínica médica, o registo unificado de pacientes e a gestão do corpo clínico.
De facto, o nosso modelo de dados estrutura-se em torno de cinco entidades: Paciente,
Médico, Especialidade, Serviço e Consulta. Teremos tudo especificado e detalhado de
cada entidade para garantir que a informação flua de forma lógica: por exemplo, cada
paciente possui um registo único que se cruza com a agenda/disponibilidade de um
médico de uma determinada área/especialidade quando agenda uma consulta.
Será necessário um controlo rigoroso na integridade dos dados no que toca,
particularmente, ao Estado das consultas. O sistema teria estados como: Agendada,
Realizada e Cancelada, tendo assim uma gestão clínica entre o Trabalho e Faltas.
Além disso, para otimizar a operação diária de receção, a especificação, prevê a
implementação das ConsultasDoDia. Esta tem como objetivo simplificar a visualização
da agenda diária, facilitando desta forma o check-in dos pacientes e a organização dos
respetivos consultórios.

A primeira entidade, o Paciente, armazena o registo unificado de cada utente, incluindo
atributos importantes como o nome completo, data de nascimento, contacto, cartão de
cidadão e o respetivo número de identificação de saúde e seguro se o tiver, e familiares.

O Médico é caracterizado pela sua célula profissional e nome, possuindo uma ligação
direta á entidade Especialidade, que define a área de atuação clínica (como Cardiologia,
Fisioterapia, Pneumologia...). Esta relação permite então um corpo clínico bem
estruturado, facilitando a filtragem de profissionais no momento do agendamento.

O ponto de convergência de todo o sistema é a entidade Consulta, que funciona como o
elo entre o Paciente, o Médico e o Serviço prestado. Cada registo de consulta deve conter
a respetiva data e hora específicas, além de estar identificado o procedimento médico
(Serviço) a ser realizado.

Para cumprir os requisitos técnicos de controlo rigoroso, a consulta possui um atributo
obrigatório de Estado, que gere o ciclo de vida do agendamento através das opções 
'Agendada', 'Realizada' ou 'Cancelada'. Este controlo é essencial para a gestão de faltas e
para a faturação da clínica.

Por fim, a eficiência do sistema é, de certa forma, reforçada pela criação da vista
ConsultasDoDia, uma ferramenta essencial para a operação diária da clínica. Isto
funciona como um filtro inteligente que simplifica os dados armazenados das diversas
tabelas, permitindo que a receção visualize apenas o que é prioritário: o nome do
paciente, o médico responsável, o serviço e a hora exata do atendimento para o dia em
questão. Deste modo, não é necessário navegar por registos grandes, esta funcionalidade
permite uma gestão imediata da agenda, garantindo que o fluxo de trabalho na unidade de
saúde seja mais rápida, ágil e focada nas necessidades do momento.






<img width="1314" height="697" alt="DIAGRAMA" src="https://github.com/user-attachments/assets/09bdb300-b6ec-49ec-9861-454710f419ad" />
