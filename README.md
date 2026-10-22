#  Monitorização de Condições Marítimas e Alertas para Atividades Costeiras

Projeto desenvolvido no âmbito da unidade curricular de **Integração de Sistemas de Informação**, com o objetivo de recolher, integrar e analisar dados marítimos e informação de risco costeiro.

---

## 1. Identificação do projeto

| Elemento | Informação |
|---|---|
| **Autor** | David Pinheiro |
| **Número de estudante** | 25444 |
| **Curso** | Licenciatura em Engenharia de Sistemas Informáticos |
| **Unidade curricular** | Integração de Sistemas de Informação |
| **Ano letivo** | 2026/2027 |

## 2. Descrição do projeto

O projeto consiste no desenvolvimento de uma solução de integração de dados para a monitorização das condições marítimas e a identificação de potenciais situações de risco em zonas costeiras.

A solução utiliza processos ETL (*Extract, Transform, Load*) para recolher dados de fontes externas, transformar e validar a informação e armazenar os resultados numa base de dados PostgreSQL. Os dados são posteriormente disponibilizados para consulta e visualização através de dashboards.

### Fontes de dados e tecnologias utilizadas

| Tecnologia | Finalidade |
|---|---|
| **Open-Meteo Marine API** | Recolha de dados marítimos, incluindo altura e período das ondas. |
| **IPMA — RSS/XML** | Recolha e tratamento de comunicados publicados pelo IPMA. |
| **KNIME Analytics Platform** | Implementação dos workflows de recolha, transformação e carregamento de dados. |
| **PostgreSQL** | Armazenamento das observações marítimas, alertas e comunicados. |
| **Grafana** | Visualização dos dados através de dashboards. |
| **Docker Compose** | Execução e gestão dos serviços de suporte. |
| **Mailpit** | Teste local do envio de emails associados aos alertas. |

O objetivo é disponibilizar informação organizada que permita acompanhar as condições marítimas, consultar os níveis de risco e verificar os alertas produzidos pelo sistema.

## 3. Estrutura dos ficheiros entregues

A entrega está organizada de acordo com a seguinte estrutura:

```text
tp01-25444/
├── README.md
├── docs/
│   └── 25444_doc.pdf
├── knime/
│   └── workflows KNIME
├── data/
│   ├── input/
│   └── output/
├── database/
│   └── costeiro_backup.sql
├── node-red/
│   └── flows.json
├── sql/
│   └── init.sql
├── video/
│   └── ISI_TP01_a25444.mp4
├── grafana/
│   └── Monitorização Marítima.json
└── docker/
    └── docker-compose.yml
```

| Pasta ou ficheiro | Descrição |
|---|---|
| `README.md` | Identificação, descrição e instruções de execução do projeto. |
| `doc/` | Relatório final em formato PDF. |
| `knime/` | Workflows KNIME utilizados nos processos de integração de dados. |
| `data/input/` | Ficheiros de entrada utilizados, quando aplicável. |
| `data/output/` | Exemplos de ficheiros gerados, como CSV ou JSON, quando aplicável. |
| `database/` | Scripts SQL e consultas utilizados na base de dados. |
| `grafana/` | Exportação JSON do dashboard, quando incluída. |
| `docker/` | Configuração Docker Compose, caso o ficheiro esteja guardado nesta pasta. |

A estrutura apresentada deve corresponder aos ficheiros efetivamente incluídos na entrega. Se o ficheiro `docker-compose.yml` estiver na raiz do projeto, as instruções de execução devem ser ajustadas à sua localização.

## 4. Requisitos de execução

Para executar a solução, são necessárias as seguintes ferramentas:

- **Docker Desktop**, com suporte para Docker Compose.
- **KNIME Analytics Platform**, para abrir e executar os workflows.
- **Navegador Web**, para aceder ao Grafana e ao Mailpit.
- **Ligação à Internet**, para recolher informação das fontes externas.
- **Ficheiros do projeto**, incluindo os workflows, a configuração Docker e os scripts SQL.

## 5. Como executar a solução

### 5.1. Iniciar os serviços Docker

Abrir o PowerShell na pasta que contém o ficheiro `docker-compose.yml`.

Executar:

```powershell
docker compose up -d
```

Para verificar o estado dos serviços:

```powershell
docker compose ps
```

O ambiente utiliza os seguintes serviços e portas:

| Serviço | Porta | Finalidade |
|---|---:|---|
| PostgreSQL | `5432` | Base de dados. |
| Grafana | `3000` | Visualização dos dados. |
| Mailpit SMTP | `1025` | Receção local de emails de teste. |
| Interface Web do Mailpit | `8025` | Consulta das mensagens recebidas. |

Os nomes dos contentores e os parâmetros de ligação devem corresponder à configuração Docker utilizada.

### 5.2. Aceder à base de dados PostgreSQL

Com o contentor PostgreSQL em execução, abrir uma sessão através do PowerShell:

```powershell
docker exec -it costeiro-db psql -U admin -d maritime
```

Para listar as tabelas:

```sql
\dt
```

Para consultar as observações marítimas mais recentes:

```sql
SELECT *
FROM public.observations
ORDER BY observed_at DESC
LIMIT 10;
```

Para consultar os alertas registados:

```sql
SELECT *
FROM public.alerts
ORDER BY created_at DESC
LIMIT 10;
```

Para verificar a existência de alertas de risco elevado (`ALTO`):

```sql
SELECT COUNT(*) AS total_riscos_altos
FROM public.alerts
WHERE UPPER(TRIM(risk_level)) = 'ALTO';
```

Para sair da sessão PostgreSQL:

```sql
\q
```

Se a base de dados ainda não estiver inicializada, devem ser executados os scripts SQL necessários, pela ordem adequada. Antes de restaurar um backup, deve ser utilizada uma base de dados de destino apropriada, evitando sobrescrever dados existentes.

### 5.3. Executar os workflows no KNIME

1. Abrir o KNIME Analytics Platform.
2. Importar ou abrir os workflows incluídos na pasta `knime/`.
3. Confirmar a configuração dos nós responsáveis pelos pedidos às APIs.
4. Verificar a configuração da ligação à base de dados PostgreSQL.
5. Executar os workflows, respeitando as dependências entre os processos.
6. Verificar os resultados das transformações e o carregamento dos dados.

Os workflows realizam a recolha, transformação e validação da informação proveniente das fontes externas e o respetivo carregamento nas tabelas configuradas.

A execução depende da disponibilidade das fontes de dados e da configuração correta das ligações utilizadas.

### 5.4. Consultar o dashboard no Grafana

Depois de iniciar os serviços Docker, abrir:

**http://localhost:3000**

Iniciar sessão com as credenciais configuradas localmente.

Se o dashboard for disponibilizado em formato JSON:

1. Aceder à secção de dashboards.
2. Selecionar a opção de importação.
3. Escolher o ficheiro JSON incluído na pasta `grafana/`.
4. Configurar ou selecionar a fonte de dados PostgreSQL.
5. Confirmar que as consultas correspondem às tabelas e colunas existentes.
6. Guardar o dashboard e verificar os resultados apresentados.

O Grafana apresenta indicadores obtidos a partir da base de dados PostgreSQL através de consultas SQL. Os resultados dependem dos dados disponíveis e da configuração das consultas.

### 5.5. Testar o envio de emails através do Mailpit

Com o serviço Mailpit em execução, abrir:

**http://localhost:8025**

Para os testes locais, a configuração SMTP utilizada pelo KNIME, quando executado no computador, é:

| Parâmetro | Valor |
|---|---|
| Servidor SMTP | `localhost` |
| Porta | `1025` |
| Encriptação | Sem TLS, na configuração local padrão |
| Autenticação | Conforme a configuração do serviço |

Se o envio for realizado a partir de outro contentor Docker, deve ser utilizado o nome do serviço SMTP na rede Docker, em vez de assumir que `localhost` corresponde ao Mailpit.

O Mailpit permite consultar as mensagens recebidas durante os testes sem as enviar para destinatários reais.

## 6. Verificação dos resultados

Após a execução dos workflows, devem ser verificadas as seguintes condições:

- Os pedidos às fontes externas são executados corretamente.
- Os dados são transformados para o formato esperado.
- Os registos são armazenados nas tabelas PostgreSQL correspondentes.
- Os níveis de risco e as mensagens de alerta são calculados de acordo com as regras configuradas.
- O dashboard do Grafana apresenta os dados disponíveis na base de dados.
- Quando aplicável, as mensagens de teste aparecem na interface do Mailpit.

A ausência de registos ou de mensagens pode indicar que o workflow ainda não foi executado, que a fonte externa não disponibilizou dados ou que existe um problema de configuração.

## 7. Limitações e pressupostos

- A execução depende da disponibilidade das fontes externas e da ligação à Internet.
- Os resultados apresentados dependem dos dados recolhidos e da data da última execução dos workflows.
- Os dados de teste não devem ser interpretados como uma confirmação das condições marítimas em tempo real.
- O Mailpit é utilizado para testes locais de email, salvo se existir uma configuração adicional de envio através de um servidor SMTP real.
- As credenciais e os parâmetros de ligação podem ter de ser ajustados ao ambiente onde o projeto é executado.

## 8. Relatório e demonstração

O relatório final encontra-se na pasta `docs/`.

**Vídeo de demonstração:** [[Vídeo de Demonstração](https://alunosipca-my.sharepoint.com/personal/a25444_alunos_ipca_pt/_layouts/15/stream.aspx?id=%2Fpersonal%2Fa25444%5Falunos%5Fipca%5Fpt%2FDocuments%2FISI%5FTP01%5Fa25444%2Emp4&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&ga=1&referrer=StreamWebApp%2EWeb&referrerScenario=AddressBarCopied%2Eview%2Ecfad1942%2Dc7aa%2D48bb%2D93e8%2Da2b713eac24b)]

O vídeo apresenta a execução e os principais componentes da solução desenvolvida.

---

**Projeto 01 — Integração de Sistemas de Informação | 2026/2027**
