\# Monitorização de Condições Marítimas e Alertas para Atividades Costeiras



\## 1. Identificação do projeto



\- \*\*Autor:\*\* David Pinheiro

\- \*\*Número de estudante:\*\* 25444

\- \*\*Curso:\*\* Licenciatura Engenharia de Sistemas Informáticos

\- \*\*Unidade curricular:\*\* Integração de Sistemas de Informação

\- \*\*Ano letivo:\*\* 2026/2027



\## 2. Descrição do projeto



O projeto tem como objetivo desenvolver uma solução de integração de dados para a monitorização das condições marítimas e a identificação de situações de risco em zonas costeiras.



A solução utiliza processos ETL (\*Extract, Transform, Load\*) para recolher dados de fontes externas, transformar e validar a informação e armazenar os resultados numa base de dados PostgreSQL.



São utilizadas as seguintes fontes e ferramentas:



\- \*\*Open-Meteo Marine API:\*\* recolha de dados marítimos, incluindo altura e período das ondas.

\- \*\*IPMA:\*\* recolha de comunicados e informação relevante através de um feed RSS/XML.

\- \*\*KNIME Analytics Platform:\*\* implementação dos workflows de integração, transformação e carregamento dos dados.

\- \*\*PostgreSQL:\*\* armazenamento dos dados recolhidos, observações marítimas e alertas.

\- \*\*Grafana:\*\* visualização dos dados através de dashboards.

\- \*\*Docker Compose:\*\* execução dos serviços de suporte, incluindo PostgreSQL, Grafana e Mailpit.

\- \*\*Mailpit:\*\* teste local do envio de mensagens de email, sem necessidade de enviar mensagens reais aos destinatários.



A solução pretende facilitar a consulta das condições marítimas, identificar níveis de risco e disponibilizar informação útil para a monitorização costeira.



\## 3. Estrutura dos ficheiros entregues



A entrega está organizada nas seguintes pastas e ficheiros:



| Pasta/Ficheiro | Descrição |

|---|---|

| `README.md` | Identificação do autor, descrição do projeto e instruções de execução. |

| `doc/` | Relatório final do projeto em PDF. |

| `knime/` | Workflows KNIME exportados, responsáveis pelos processos de recolha, transformação e carregamento dos dados. |

| `data/input/` | Ficheiros de entrada utilizados para testes ou processamento, quando aplicável. |

| `data/output/` | Ficheiros de saída gerados pelos processos, como CSV ou JSON, quando aplicável. |

| `docker/` | Ficheiros de configuração necessários para executar os serviços através do Docker Compose. |

| `sql/` | Scripts SQL para criar, configurar ou consultar as tabelas da base de dados. |



Os workflows e os ficheiros de dados incluídos na entrega devem corresponder às versões finais utilizadas no projeto. Não são incluídas palavras-passe, tokens ou outras credenciais pessoais.



\## 4. Ferramentas necessárias



Para executar a solução, são necessárias as seguintes ferramentas:



1\. \*\*Docker Desktop\*\*, com o Docker Compose disponível.

2\. \*\*KNIME Analytics Platform\*\*, para abrir e executar os workflows.

3\. \*\*Um navegador Web\*\*, para aceder ao Grafana e à interface do Mailpit.

4\. \*\*Acesso à Internet\*\*, para recolher dados das fontes externas.

5\. \*\*Os ficheiros do projeto\*\*, incluindo as configurações Docker, os scripts SQL e os workflows exportados.



\## 5. Como executar a solução



\### 5.1. Iniciar os serviços Docker



Abrir um terminal, como o PowerShell, e navegar até à pasta do projeto.



```powershell

cd "..\\TP1\\monitorizacao-maritima"

```



Entrar na pasta que contém o ficheiro `docker-compose.yml`. 



```powershell

cd docker

docker compose up -d

docker compose ps

```



O último comando permite verificar o estado dos serviços.



A configuração deverá disponibilizar os seguintes serviços:



\- PostgreSQL: porta `5432`.

\- Grafana: porta `3000`.

\- Mailpit SMTP: porta `1025`.

\- Interface Web do Mailpit: porta `8025`.



Se o ficheiro Compose estiver noutra localização, os comandos devem ser ajustados à estrutura efetiva da entrega.



\### 5.2. Confirmar o acesso à base de dados



Com o serviço PostgreSQL em execução, é possível abrir uma sessão no terminal:



```powershell

docker exec -it costeiro-db psql -U admin -d maritime

```



Para listar as tabelas existentes:



```sql

\\dt

```



Para consultar algumas observações marítimas:



```sql

SELECT \*

FROM public.observations

ORDER BY observed\_at DESC

LIMIT 10;

```



Para consultar os alertas registados:



```sql

SELECT \*

FROM public.alerts

ORDER BY created\_at DESC

LIMIT 10;

```



Para sair da sessão PostgreSQL:



```sql

\\q

```



Se a base de dados ainda não estiver inicializada, devem ser executados os scripts SQL disponibilizados na pasta `sql/`, pela ordem indicada nesses ficheiros. Não devem ser eliminados volumes ou dados existentes durante a configuração.



\### 5.3. Executar os workflows no KNIME



1\. Abrir o KNIME Analytics Platform.

2\. Importar ou abrir os workflows exportados que se encontram na pasta `knime/`.

3\. Confirmar a configuração dos nós de ligação às APIs e à base de dados.

4\. Verificar se os endereços, credenciais e parâmetros de ligação correspondem ao ambiente local.

5\. Executar os nós do workflow pela ordem necessária, desde a recolha dos dados até ao respetivo carregamento.

6\. Verificar os resultados das transformações e confirmar que os dados foram inseridos ou atualizados na base de dados.



Os workflows são responsáveis pela recolha dos dados das fontes externas, pela transformação e validação da informação e pelo carregamento dos resultados nas tabelas correspondentes.



A execução deve respeitar as dependências entre os workflows, caso o processo esteja dividido em vários ficheiros.



\### 5.4. Consultar o dashboard no Grafana



Depois de iniciar os serviços Docker, abrir o navegador e aceder a:



http://localhost:3000



Iniciar sessão com as credenciais configuradas no Grafana.



Se o dashboard for entregue em formato JSON:



1\. Aceder à secção de dashboards.

2\. Selecionar a opção de importação.

3\. Escolher o ficheiro JSON disponibilizado na entrega.

4\. Selecionar ou configurar a fonte de dados PostgreSQL.

5\. Confirmar que as consultas utilizam as tabelas e colunas existentes na base de dados.

6\. Guardar o dashboard e verificar os painéis apresentados.



Os resultados apresentados dependem dos dados existentes na base de dados e da configuração das consultas.



\### 5.5. Testar os emails através do Mailpit



Com o serviço Mailpit em execução, abrir:



http://localhost:8025



Na configuração de envio de email, utilizar os parâmetros SMTP locais:



\- \*\*Servidor SMTP:\*\* `localhost` quando o envio é feito a partir do KNIME executado no computador.

\- \*\*Porta:\*\* `1025`.

\- \*\*Autenticação:\*\* de acordo com a configuração local do serviço.

\- \*\*Encriptação:\*\* sem TLS para o teste local padrão.



Se o envio for efetuado a partir de outro contentor Docker, o endereço do servidor SMTP deverá corresponder ao nome do serviço na rede Docker, e não necessariamente a `localhost`.



O Mailpit permite verificar as mensagens geradas durante os testes sem as enviar para destinatários reais. O envio deve ser testado depois de o mecanismo de alertas estar configurado.



\## 6. Verificação dos resultados



Após executar os workflows, devem ser efetuadas as seguintes verificações:



\- Confirmar que os pedidos às fontes externas foram concluídos com sucesso.

\- Verificar se os dados foram transformados para o formato esperado.

\- Confirmar a existência de registos nas tabelas PostgreSQL utilizadas.

\- Verificar se os níveis de risco e as mensagens de alerta foram calculados corretamente.

\- Confirmar que o Grafana apresenta os dados existentes na base de dados.

\- Quando aplicável, confirmar que os emails de teste aparecem na interface do Mailpit.



A ausência de registos ou de mensagens pode indicar que o workflow ainda não foi executado, que a fonte externa não disponibilizou dados ou que existe algum problema de configuração.



\## 7. Limitações e pressupostos



A execução depende da disponibilidade das fontes externas, da configuração correta dos serviços Docker e das ligações do KNIME à base de dados.



Os dados apresentados durante os testes podem não representar as condições marítimas em tempo real no momento da consulta.



As mensagens de email são testadas localmente através do Mailpit, salvo se existir uma configuração adicional de envio para um servidor SMTP real.



\## 8. Relatório e demonstração



O relatório final encontra-se na pasta `doc/`.



\*\*Vídeo de demonstração:\*\* \[[Video Demonstração](https://alunosipca-my.sharepoint.com/personal/a25444_alunos_ipca_pt/_layouts/15/stream.aspx?id=%2Fpersonal%2Fa25444%5Falunos%5Fipca%5Fpt%2FDocuments%2FISI%5FTP01%5Fa25444%2Emp4&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&ga=1&referrer=StreamWebApp%2EWeb&referrerScenario=AddressBarCopied%2Eview%2Ecfad1942%2Dc7aa%2D48bb%2D93e8%2Da2b713eac24b)].




