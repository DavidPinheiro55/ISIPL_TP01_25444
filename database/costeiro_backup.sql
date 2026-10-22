--
-- PostgreSQL database dump
--

\restrict QIYSCK7YmN3anLRMIitWzGhAQZsMftdVY0eq9k0GfXwszrsnEg6SEF1aRd2U0yK

-- Dumped from database version 16.15 (Debian 16.15-1.pgdg13+2)
-- Dumped by pg_dump version 16.15 (Debian 16.15-1.pgdg13+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alerts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alerts (
    id bigint NOT NULL,
    location_name text NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    risk_level text NOT NULL,
    message text NOT NULL,
    email_sent boolean DEFAULT false,
    observation_id bigint,
    email_sent_at timestamp with time zone,
    email_attempts integer DEFAULT 0 NOT NULL,
    last_error text
);


--
-- Name: alerts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alerts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alerts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alerts_id_seq OWNED BY public.alerts.id;


--
-- Name: ipma_comunicados; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ipma_comunicados (
    id bigint NOT NULL,
    titulo text NOT NULL,
    ligacao text,
    data_publicacao timestamp without time zone,
    descricao text,
    fonte text DEFAULT 'IPMA_RSS'::text NOT NULL,
    importado_em timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: ipma_comunicados_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ipma_comunicados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ipma_comunicados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ipma_comunicados_id_seq OWNED BY public.ipma_comunicados.id;


--
-- Name: observations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.observations (
    id bigint NOT NULL,
    location_name text NOT NULL,
    observed_at timestamp with time zone NOT NULL,
    wave_height_m numeric(6,2),
    wave_period_s numeric(6,2),
    ipma_warning_level text,
    risk_level text NOT NULL,
    risk_reason text,
    source text NOT NULL,
    ingested_at timestamp with time zone DEFAULT now()
);


--
-- Name: observations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.observations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: observations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.observations_id_seq OWNED BY public.observations.id;


--
-- Name: alerts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alerts ALTER COLUMN id SET DEFAULT nextval('public.alerts_id_seq'::regclass);


--
-- Name: ipma_comunicados id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ipma_comunicados ALTER COLUMN id SET DEFAULT nextval('public.ipma_comunicados_id_seq'::regclass);


--
-- Name: observations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.observations ALTER COLUMN id SET DEFAULT nextval('public.observations_id_seq'::regclass);


--
-- Data for Name: alerts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.alerts (id, location_name, created_at, risk_level, message, email_sent, observation_id, email_sent_at, email_attempts, last_error) FROM stdin;
1	Foz do Arelho	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.8m com periodo de 12.1s	f	664	\N	0	\N
2	Foz do Arelho	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.76m com periodo de 12.0s	f	665	\N	0	\N
3	Furadouro	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.18m com periodo de 12.2s	f	276	\N	0	\N
4	Cascais	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.3m com periodo de 12.05s	f	856	\N	0	\N
5	Praia Grande (Sintra)	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.56m com periodo de 12.2s	f	807	\N	0	\N
6	Ericeira	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.22m com periodo de 12.1s	f	756	\N	0	\N
7	Nazaré	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.8m com periodo de 11.7s	f	620	\N	0	\N
8	Pedrógão	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.6m com periodo de 12.2s	f	518	\N	0	\N
9	Espinho	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.0m com periodo de 11.75s	f	230	\N	0	\N
10	Ericeira	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.54m com periodo de 11.55s	f	765	\N	0	\N
11	Foz do Arelho	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.68m com periodo de 11.8s	f	667	\N	0	\N
12	Peniche	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.16m com periodo de 11.6s	f	706	\N	0	\N
13	Praia Grande (Sintra)	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.34m com periodo de 12.2s	f	805	\N	0	\N
14	Praia Grande (Sintra)	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.5m com periodo de 11.35s	f	815	\N	0	\N
15	Peniche	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.72m com periodo de 11.85s	f	714	\N	0	\N
16	Espinho	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.04m com periodo de 11.95s	f	228	\N	0	\N
17	Pedrógão	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.4m com periodo de 11.55s	f	523	\N	0	\N
18	Caminha	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.42m com periodo de 11.45s	f	39	\N	0	\N
19	Pedrógão	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.22m com periodo de 11.15s	f	526	\N	0	\N
20	Foz do Arelho	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.74m com periodo de 12.3s	f	662	\N	0	\N
21	Póvoa de Varzim	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.06m com periodo de 11.5s	f	131	\N	0	\N
22	Matosinhos	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.02m com periodo de 11.65s	f	178	\N	0	\N
23	Leirosa	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.72m com periodo de 12.2s	f	471	\N	0	\N
24	Praia Grande (Sintra)	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.62m com periodo de 11.7s	f	812	\N	0	\N
25	Leirosa	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.18m com periodo de 11.9s	f	465	\N	0	\N
26	Barra (Aveiro)	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.02m com periodo de 11.95s	f	325	\N	0	\N
27	São Pedro de Moel	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.6m com periodo de 12.2s	f	563	\N	0	\N
28	Leirosa	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.26m com periodo de 11.0s	f	479	\N	0	\N
29	Cascais	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.2m com periodo de 11.55s	f	861	\N	0	\N
30	Caminha	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.74m com periodo de 11.7s	f	33	\N	0	\N
31	Praia Grande (Sintra)	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.44m com periodo de 11.25s	f	816	\N	0	\N
32	Caminha	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.68m com periodo de 11.5s	f	31	\N	0	\N
33	Pedrógão	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.34m com periodo de 11.4s	f	524	\N	0	\N
34	Caminha	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.78m com periodo de 11.75s	f	34	\N	0	\N
35	Ericeira	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.64m com periodo de 11.8s	f	763	\N	0	\N
36	Nazaré	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.94m com periodo de 12.25s	f	614	\N	0	\N
37	Figueira da Foz	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.22m com periodo de 11.9s	f	424	\N	0	\N
38	Leirosa	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.4m com periodo de 12.2s	f	466	\N	0	\N
39	Nazaré	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.96m com periodo de 11.95s	f	617	\N	0	\N
40	Foz do Arelho	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.44m com periodo de 11.15s	f	672	\N	0	\N
41	Leirosa	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.32m com periodo de 11.15s	f	478	\N	0	\N
42	Nazaré	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.56m com periodo de 11.15s	f	624	\N	0	\N
43	Leirosa	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.22m com periodo de 10.9s	f	480	\N	0	\N
44	Furadouro	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.04m com periodo de 11.6s	f	280	\N	0	\N
45	Figueira da Foz	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.1m com periodo de 12.2s	f	419	\N	0	\N
46	Furadouro	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.16m com periodo de 12.15s	f	274	\N	0	\N
47	Leirosa	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.64m com periodo de 11.9s	f	473	\N	0	\N
48	Figueira da Foz	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.1m com periodo de 11.6s	f	426	\N	0	\N
49	Praia Grande (Sintra)	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.6m com periodo de 11.55s	f	813	\N	0	\N
50	Leirosa	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.56m com periodo de 11.75s	f	474	\N	0	\N
51	Praia Grande (Sintra)	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.44m com periodo de 12.25s	f	806	\N	0	\N
52	Caminha	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.36m com periodo de 11.35s	f	40	\N	0	\N
53	Furadouro	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.18m com periodo de 12.15s	f	277	\N	0	\N
54	Leirosa	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.66m com periodo de 12.35s	f	468	\N	0	\N
55	São Pedro de Moel	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.6m com periodo de 11.35s	f	575	\N	0	\N
56	Peniche	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.82m com periodo de 12.05s	f	712	\N	0	\N
57	São Pedro de Moel	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.94m com periodo de 12.0s	f	569	\N	0	\N
58	Espinho	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.04m com periodo de 11.85s	f	226	\N	0	\N
59	São Pedro de Moel	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.98m com periodo de 12.3s	f	566	\N	0	\N
60	Pedrógão	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.36m com periodo de 12.2s	f	515	\N	0	\N
61	Nazaré	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.38m com periodo de 11.9s	f	610	\N	0	\N
62	Peniche	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.52m com periodo de 11.1s	f	719	\N	0	\N
63	Leirosa	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.5m com periodo de 11.6s	f	475	\N	0	\N
64	São Pedro de Moel	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.9m com periodo de 11.9s	f	570	\N	0	\N
65	Furadouro	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.0m com periodo de 11.4s	f	281	\N	0	\N
66	Foz do Arelho	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.7m com periodo de 12.3s	f	661	\N	0	\N
67	Nazaré	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.16m com periodo de 11.55s	f	609	\N	0	\N
68	Peniche	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.58m com periodo de 11.25s	f	718	\N	0	\N
69	Pedrógão	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.6m com periodo de 12.1s	f	519	\N	0	\N
70	Cascais	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.1m com periodo de 11.4s	f	863	\N	0	\N
71	São Pedro de Moel	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.54m com periodo de 11.2s	f	576	\N	0	\N
72	Ericeira	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.6m com periodo de 12.2s	f	759	\N	0	\N
73	Caminha	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.56m com periodo de 11.65s	f	37	\N	0	\N
74	Figueira da Foz	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.3m com periodo de 12.2s	f	421	\N	0	\N
75	Caminha	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.72m com periodo de 11.65s	f	32	\N	0	\N
76	Furadouro	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.14m com periodo de 12.0s	f	278	\N	0	\N
77	Póvoa de Varzim	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.02m com periodo de 11.5s	f	133	\N	0	\N
78	Furadouro	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.08m com periodo de 11.8s	f	279	\N	0	\N
79	Praia Grande (Sintra)	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.16m com periodo de 12.0s	f	804	\N	0	\N
80	Ericeira	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.5m com periodo de 12.3s	f	758	\N	0	\N
81	Ericeira	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.04m com periodo de 11.8s	f	755	\N	0	\N
82	Figueira da Foz	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.04m com periodo de 11.45s	f	427	\N	0	\N
83	São Pedro de Moel	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.98m com periodo de 12.35s	f	565	\N	0	\N
84	Caminha	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.5m com periodo de 11.55s	f	38	\N	0	\N
85	Póvoa de Varzim	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.02m com periodo de 11.25s	f	129	\N	0	\N
86	Praia Grande (Sintra)	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.66m com periodo de 12.0s	f	809	\N	0	\N
87	Peniche	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.34m com periodo de 11.85s	f	707	\N	0	\N
88	Matosinhos	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.0m com periodo de 11.7s	f	179	\N	0	\N
89	Cascais	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.2m com periodo de 12.15s	f	855	\N	0	\N
90	Leirosa	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.76m com periodo de 12.3s	f	470	\N	0	\N
91	São Pedro de Moel	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.84m com periodo de 11.8s	f	571	\N	0	\N
92	Nazaré	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.68m com periodo de 11.4s	f	622	\N	0	\N
93	Caminha	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.06m com periodo de 10.4s	f	28	\N	0	\N
94	Caminha	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.48m com periodo de 11.2s	f	30	\N	0	\N
95	Pedrógão	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.24m com periodo de 12.05s	f	514	\N	0	\N
96	Ericeira	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.66m com periodo de 11.9s	f	762	\N	0	\N
97	Nazaré	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.62m com periodo de 11.25s	f	623	\N	0	\N
98	Matosinhos	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.0m com periodo de 11.7s	f	180	\N	0	\N
99	Foz do Arelho	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.6m com periodo de 11.55s	f	669	\N	0	\N
100	Foz do Arelho	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.56m com periodo de 11.4s	f	670	\N	0	\N
101	Peniche	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.7m com periodo de 12.15s	f	709	\N	0	\N
102	Peniche	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.52m com periodo de 12.05s	f	708	\N	0	\N
103	Praia Grande (Sintra)	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.66m com periodo de 11.8s	f	811	\N	0	\N
104	Peniche	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.62m com periodo de 11.4s	f	717	\N	0	\N
105	Peniche	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.74m com periodo de 12.15s	f	710	\N	0	\N
106	Ericeira	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.42m com periodo de 11.35s	f	767	\N	0	\N
107	Pedrógão	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.58m com periodo de 11.95s	f	520	\N	0	\N
108	Póvoa de Varzim	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.04m com periodo de 11.5s	f	132	\N	0	\N
109	Ericeira	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.58m com periodo de 11.7s	f	764	\N	0	\N
110	Ericeira	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.66m com periodo de 12.0s	f	761	\N	0	\N
111	São Pedro de Moel	2026-10-22 20:59:38.604761+00	ALTO	Onda de 4.0m com periodo de 12.2s	f	567	\N	0	\N
112	Leirosa	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.38m com periodo de 11.3s	f	477	\N	0	\N
113	Foz do Arelho	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.52m com periodo de 12.2s	f	660	\N	0	\N
114	Foz do Arelho	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.16m com periodo de 11.75s	f	658	\N	0	\N
115	Pedrógão	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.04m com periodo de 11.75s	f	513	\N	0	\N
116	Furadouro	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.0m com periodo de 11.95s	f	273	\N	0	\N
117	Pedrógão	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.52m com periodo de 11.8s	f	521	\N	0	\N
118	Caminha	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.22m com periodo de 11.1s	f	42	\N	0	\N
119	Peniche	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.68m com periodo de 11.7s	f	715	\N	0	\N
120	Nazaré	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.74m com periodo de 11.55s	f	621	\N	0	\N
121	Cascais	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.16m com periodo de 11.45s	f	862	\N	0	\N
122	Figueira da Foz	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.0m com periodo de 12.05s	f	418	\N	0	\N
123	Caminha	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.26m com periodo de 10.75s	f	29	\N	0	\N
124	Caminha	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.3m com periodo de 11.25s	f	41	\N	0	\N
125	Peniche	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.78m com periodo de 11.95s	f	713	\N	0	\N
126	Pedrógão	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.5m com periodo de 12.25s	f	516	\N	0	\N
127	Peniche	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.48m com periodo de 11.0s	f	720	\N	0	\N
128	São Pedro de Moel	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.8m com periodo de 12.3s	f	564	\N	0	\N
129	Leirosa	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.52m com periodo de 12.35s	f	467	\N	0	\N
130	Espinho	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.04m com periodo de 11.95s	f	227	\N	0	\N
131	Pedrógão	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.62m com periodo de 12.25s	f	517	\N	0	\N
132	Cascais	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.3m com periodo de 11.85s	f	858	\N	0	\N
133	Ericeira	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.48m com periodo de 11.45s	f	766	\N	0	\N
134	São Pedro de Moel	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.66m com periodo de 11.45s	f	574	\N	0	\N
135	Cascais	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.08m com periodo de 12.2s	f	854	\N	0	\N
136	Foz do Arelho	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.76m com periodo de 12.2s	f	663	\N	0	\N
137	Pedrógão	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.28m com periodo de 11.3s	f	525	\N	0	\N
138	Praia Grande (Sintra)	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.66m com periodo de 11.9s	f	810	\N	0	\N
139	Cascais	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.3m com periodo de 11.95s	f	857	\N	0	\N
140	Caminha	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.64m com periodo de 11.7s	f	36	\N	0	\N
141	Furadouro	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.16m com periodo de 12.25s	f	275	\N	0	\N
142	Nazaré	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.92m com periodo de 12.3s	f	613	\N	0	\N
143	Pedrógão	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.12m com periodo de 10.95s	f	528	\N	0	\N
144	Caminha	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.1m com periodo de 10.9s	f	44	\N	0	\N
145	São Pedro de Moel	2026-10-22 20:59:38.604761+00	ALTO	Onda de 4.0m com periodo de 12.1s	f	568	\N	0	\N
146	Praia Grande (Sintra)	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.56m com periodo de 11.45s	f	814	\N	0	\N
147	Foz do Arelho	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.72m com periodo de 11.9s	f	666	\N	0	\N
148	Nazaré	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.86m com periodo de 11.8s	f	619	\N	0	\N
149	São Pedro de Moel	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.42m com periodo de 12.0s	f	562	\N	0	\N
150	Ericeira	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.38m com periodo de 11.25s	f	768	\N	0	\N
151	Cascais	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.26m com periodo de 11.65s	f	860	\N	0	\N
152	São Pedro de Moel	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.78m com periodo de 11.7s	f	572	\N	0	\N
153	Caminha	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.02m com periodo de 10.8s	f	45	\N	0	\N
154	Ericeira	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.68m com periodo de 12.1s	f	760	\N	0	\N
155	Nazaré	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.56m com periodo de 12.1s	f	611	\N	0	\N
156	Foz do Arelho	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.5m com periodo de 11.25s	f	671	\N	0	\N
157	Nazaré	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.9m com periodo de 11.9s	f	618	\N	0	\N
158	Figueira da Foz	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.28m com periodo de 12.15s	f	422	\N	0	\N
159	Foz do Arelho	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.64m com periodo de 11.65s	f	668	\N	0	\N
160	Leirosa	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.78m com periodo de 12.35s	f	469	\N	0	\N
161	São Pedro de Moel	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.2m com periodo de 11.7s	f	561	\N	0	\N
162	Espinho	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.04m com periodo de 11.9s	f	229	\N	0	\N
163	Figueira da Foz	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.16m com periodo de 11.75s	f	425	\N	0	\N
164	Caminha	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.16m com periodo de 11.0s	f	43	\N	0	\N
165	São Pedro de Moel	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.72m com periodo de 11.55s	f	573	\N	0	\N
166	Cascais	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.06m com periodo de 11.3s	f	864	\N	0	\N
167	Pedrógão	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.46m com periodo de 11.7s	f	522	\N	0	\N
168	Figueira da Foz	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.24m com periodo de 12.05s	f	423	\N	0	\N
169	Leirosa	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.44m com periodo de 11.45s	f	476	\N	0	\N
170	Leirosa	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.7m com periodo de 12.05s	f	472	\N	0	\N
171	Cascais	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.3m com periodo de 11.75s	f	859	\N	0	\N
172	Foz do Arelho	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.34m com periodo de 12.0s	f	659	\N	0	\N
173	Peniche	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.64m com periodo de 11.55s	f	716	\N	0	\N
174	Caminha	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.7m com periodo de 11.75s	f	35	\N	0	\N
175	Ericeira	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.42m com periodo de 12.3s	f	757	\N	0	\N
176	Pedrógão	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.18m com periodo de 11.05s	f	527	\N	0	\N
177	Figueira da Foz	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.2m com periodo de 12.2s	f	420	\N	0	\N
178	Praia Grande (Sintra)	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.66m com periodo de 12.1s	f	808	\N	0	\N
179	Peniche	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.78m com periodo de 12.15s	f	711	\N	0	\N
180	Póvoa de Varzim	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.08m com periodo de 11.4s	f	130	\N	0	\N
181	Nazaré	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.74m com periodo de 12.25s	f	612	\N	0	\N
182	Nazaré	2026-10-22 20:59:38.604761+00	ALTO	Onda de 4.0m com periodo de 12.05s	f	616	\N	0	\N
183	Nazaré	2026-10-22 20:59:38.604761+00	ALTO	Onda de 3.98m com periodo de 12.15s	f	615	\N	0	\N
\.


--
-- Data for Name: ipma_comunicados; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ipma_comunicados (id, titulo, ligacao, data_publicacao, descricao, fonte, importado_em) FROM stdin;
1	Aviso de Sismo Sentido no Arquipélago dos Açores  22-10-2026  16:14	https://www.ipma.pt/pt/geofisica/comunicados/	2026-10-22 17:11:27	 Informação Sismológica Titulo: Aviso de Sismo Sentido no Arquipélago dos Açores 22-10-2026 16:14 O Instituto Português do Mar e da Atmosfera informa que no dia 22-10-2026 pelas 16:14 (hora local) foi registado nas estações da Rede Sísmica do Arquipélago dos Açores, um sismo de magnitude 4.3 (Richter) e cujo epicentro se localizou a cerca de 40 km a Oeste de Ginetes (S. Miguel). Este sismo, de acordo com a informação disponível até ao momento, não causou danos pessoais ou materiais e foi sentido com intensidade máxima III (escala de Mercalli modificada) na nas freguesias de Arrifes, Candelária, Mosteiros e Ponta Delgada (São Sebastião),São Miguel.Foi ainda sentido com menor intensidade nas freguesias de Nossa Senhora da Conceição, São Pedro e Praia da Vitória (Santa Cruz),Terceira. Se a situação o justificar serão emitidos novos comunicados. A localização do epicentro de um sismo é um processo físico e matemático complexo que depende do conjunto de dados, dos algoritmos e dos modelos de propagação das ondas sísmicas. Agências diferentes podem produzir resultados ligeiramente diferentes. Do mesmo modo, as determinações preliminares são habitualmente corrigidas posteriormente, pela integração de mais informação. Em todos os casos acompanhe sempre as indicações dos serviços de proteção civil. Toda e qualquer utilização do conteúdo deste comunicado deverá sempre fazer referência à fonte. Data de Edição: Qui, 22 Out 2026 17:11:27 	IPMA_RSS	2026-10-22 20:58:41.808678+00
2	Aviso de Sismo no Arquipélago dos Açores  21-10-2026  12:07	https://www.ipma.pt/pt/geofisica/comunicados/	2026-10-21 12:16:30	 Informação Sismológica Titulo: Aviso de Sismo no Arquipélago dos Açores 21-10-2026 12:07 O Instituto Português do Mar e da Atmosfera informa que no dia 21-10-2026 pelas 12:07 (hora local) foi registado nas estações da Rede Sísmica do Arquipélago dos Açores, um sismo de magnitude 3.0 (Richter) e cujo epicentro se localizou a cerca de 14 km a Oeste-Noroeste dos Mosteiros (S. Miguel). Até à  elaboração deste comunicado não foi recebida nenhuma informação confirmando que este sismo tenha sido sentido. Se a situação o justificar serão emitidos novos comunicados. A localização do epicentro de um sismo é um processo físico e matemático complexo que depende do conjunto de dados, dos algoritmos e dos modelos de propagação das ondas sísmicas. Agências diferentes podem produzir resultados ligeiramente diferentes. Do mesmo modo, as determinações preliminares são habitualmente corrigidas posteriormente, pela integração de mais informação. Em todos os casos acompanhe sempre as indicações dos serviços de proteção civil. Toda e qualquer utilização do conteúdo deste comunicado deverá sempre fazer referência à fonte. Data de Edição: Qua, 21 Out 2026 12:16:30 	IPMA_RSS	2026-10-22 20:58:41.808678+00
3	Aviso de Sismo Sentido no Arquipélago dos Açores  20-10-2026  18:07	https://www.ipma.pt/pt/geofisica/comunicados/	2026-10-20 20:33:04	 Informação Sismológica Titulo: Aviso de Sismo Sentido no Arquipélago dos Açores 20-10-2026 18:07 O Instituto Português do Mar e da Atmosfera informa que no dia 20-10-2026 pelas 18:07 (hora local) foi registado nas estações da Rede Sísmica do Arquipélago dos Açores, um sismo de magnitude 5.2 (Richter) e cujo epicentro se localizou a cerca de 40 km a Oeste de Ginetes (S. Miguel). Este sismo, de acordo com a informação disponível até ao momento, não causou danos pessoais ou materiais e foi sentido com intensidade máxima IV/V (escala de Mercalli modificada) nas freguesias de Fajã de Baixo, Mosteiros, Ponta Delgada (São Sebastião), Ponta Delgada (São José), Ponta Delgada (São Pedro), Relva, Rosto do Cão (Livramento), Rosto do Cão (São Roque), São Vicente Ferreira, Pilar da Bretanha, Santa Clara, Fenais da Ajuda, Rabo de Peixe, Ribeira Grande (Conceição) e Vila Franca do Campo (São Miguel) [São Miguel]. Foi ainda sentido com menor intensidade nas freguesias de Achadinha, Arrifes, Capelas, Covoada, Fajã de Cima, Fenais da Luz, Feteiras, Ginetes, Remédios, Santa Bárbara, Santo António, Faial da Terra, Furnas, Calhetas, Lomba da Maia, Maia, Pico da Pedra, Porto Formoso, Ribeira Grande (Matriz), Ribeira Seca, Ribeirinha, Água de Alto, Vila Franca do Campo (São Pedro) [São Miguel], Nossa Senhora da Conceição, Porto Judeu, Posto Santo, Vila de São Sebastião, Agualva, Lajes, Praia da Vitória (Santa Cruz), Vila Nova e Porto Martins [Terceira]. Se a situação o justificar serão emitidos novos comunicados. A localização do epicentro de um sismo é um processo físico e matemático complexo que depende do conjunto de dados, dos algoritmos e dos modelos de propagação das ondas sísmicas. Agências diferentes podem produzir resultados ligeiramente diferentes. Do mesmo modo, as determinações preliminares são habitualmente corrigidas posteriormente, pela integração de mais informação. Em todos os casos acompanhe sempre as indicações dos serviços de proteção civil. Toda e qualquer utilização do conteúdo deste comunicado deverá sempre fazer referência à fonte. Data de Edição: Ter, 20 Out 2026 20:33:04 	IPMA_RSS	2026-10-22 20:58:41.808678+00
4	Aviso de Sismo Sentido no Continente  15-10-2026  21:34	https://www.ipma.pt/pt/geofisica/comunicados/	2026-10-15 23:24:57	 Informação Sismológica Titulo: Aviso de Sismo Sentido no Continente 15-10-2026 21:34 O Instituto Português do Mar e da Atmosfera informa que no dia 15-10-2026 pelas 21:34 (hora local) foi registado nas estações da Rede Sísmica do Continente, um sismo de magnitude 4.2 (Richter) e cujo epicentro se localizou a cerca de 10 km a Sul de Ponferrada (ESP). Este sismo, de acordo com a informação disponível até ao momento, não causou danos pessoais ou materiais e foi sentido com intensidade máxima II-III (escala de Mercalli modificada) na região de NE Bragança. Se a situação o justificar serão emitidos novos comunicados. A localização do epicentro de um sismo é um processo físico e matemático complexo que depende do conjunto de dados, dos algoritmos e dos modelos de propagação das ondas sísmicas. Agências diferentes podem produzir resultados ligeiramente diferentes. Do mesmo modo, as determinações preliminares são habitualmente corrigidas posteriormente, pela integração de mais informação. Em todos os casos acompanhe sempre as indicações dos serviços de proteção civil. Toda e qualquer utilização do conteúdo deste comunicado deverá sempre fazer referência à fonte. Data de Edição: Qui, 15 Out 2026 23:24:57 	IPMA_RSS	2026-10-22 20:58:41.808678+00
5	Aviso de Sismo no Arquipélago dos Açores  03-10-2026  10:54	https://www.ipma.pt/pt/geofisica/comunicados/	2026-10-03 11:02:05	 Informação Sismológica Titulo: Aviso de Sismo no Arquipélago dos Açores 03-10-2026 10:54 O Instituto Português do Mar e da Atmosfera informa que no dia 03-10-2026 pelas 10:54 (hora local) foi registado nas estações da Rede Sísmica do Arquipélago dos Açores, um sismo de magnitude 3.5 (Richter) e cujo epicentro se localizou a cerca de 20 km a Sul-Sudoeste dos Ilhéus das Formigas (S. Miguel). Até à  elaboração deste comunicado não foi recebida nenhuma informação confirmando que este sismo tenha sido sentido. Se a situação o justificar serão emitidos novos comunicados. A localização do epicentro de um sismo é um processo físico e matemático complexo que depende do conjunto de dados, dos algoritmos e dos modelos de propagação das ondas sísmicas. Agências diferentes podem produzir resultados ligeiramente diferentes. Do mesmo modo, as determinações preliminares são habitualmente corrigidas posteriormente, pela integração de mais informação. Em todos os casos acompanhe sempre as indicações dos serviços de proteção civil. Toda e qualquer utilização do conteúdo deste comunicado deverá sempre fazer referência à fonte. Data de Edição: Sáb, 03 Out 2026 11:02:05 	IPMA_RSS	2026-10-22 20:58:41.808678+00
\.


--
-- Data for Name: observations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.observations (id, location_name, observed_at, wave_height_m, wave_period_s, ipma_warning_level, risk_level, risk_reason, source, ingested_at) FROM stdin;
1	Caminha	2026-10-21 23:00:00+00	2.46	10.55	\N	MODERADO	Onda de 2.46m com periodo de 10.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
2	Caminha	2026-10-22 00:00:00+00	2.42	10.55	\N	MODERADO	Onda de 2.42m com periodo de 10.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
3	Caminha	2026-10-22 01:00:00+00	2.36	10.50	\N	MODERADO	Onda de 2.36m com periodo de 10.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
4	Caminha	2026-10-22 02:00:00+00	2.32	10.50	\N	MODERADO	Onda de 2.32m com periodo de 10.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
5	Caminha	2026-10-22 03:00:00+00	2.28	10.50	\N	MODERADO	Onda de 2.28m com periodo de 10.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
6	Caminha	2026-10-22 04:00:00+00	2.26	10.55	\N	MODERADO	Onda de 2.26m com periodo de 10.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
7	Caminha	2026-10-22 05:00:00+00	2.22	10.60	\N	MODERADO	Onda de 2.22m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
8	Caminha	2026-10-22 06:00:00+00	2.20	10.60	\N	MODERADO	Onda de 2.2m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
9	Caminha	2026-10-22 07:00:00+00	2.18	10.65	\N	MODERADO	Onda de 2.18m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
10	Caminha	2026-10-22 08:00:00+00	2.16	10.65	\N	MODERADO	Onda de 2.16m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
11	Caminha	2026-10-22 09:00:00+00	2.16	10.65	\N	MODERADO	Onda de 2.16m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
12	Caminha	2026-10-22 10:00:00+00	2.16	10.65	\N	MODERADO	Onda de 2.16m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
13	Caminha	2026-10-22 11:00:00+00	2.16	10.60	\N	MODERADO	Onda de 2.16m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
14	Caminha	2026-10-22 12:00:00+00	2.18	10.50	\N	MODERADO	Onda de 2.18m com periodo de 10.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
15	Caminha	2026-10-22 13:00:00+00	2.22	10.40	\N	MODERADO	Onda de 2.22m com periodo de 10.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
16	Caminha	2026-10-22 14:00:00+00	2.24	10.25	\N	MODERADO	Onda de 2.24m com periodo de 10.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
17	Caminha	2026-10-22 15:00:00+00	2.28	10.10	\N	MODERADO	Onda de 2.28m com periodo de 10.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
18	Caminha	2026-10-22 16:00:00+00	2.30	9.90	\N	MODERADO	Onda de 2.3m com periodo de 9.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
19	Caminha	2026-10-22 17:00:00+00	2.34	9.75	\N	MODERADO	Onda de 2.34m com periodo de 9.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
20	Caminha	2026-10-22 18:00:00+00	2.36	9.65	\N	MODERADO	Onda de 2.36m com periodo de 9.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
21	Caminha	2026-10-22 19:00:00+00	2.40	9.55	\N	MODERADO	Onda de 2.4m com periodo de 9.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
22	Caminha	2026-10-22 20:00:00+00	2.42	9.50	\N	MODERADO	Onda de 2.42m com periodo de 9.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
23	Caminha	2026-10-22 21:00:00+00	2.50	9.50	\N	MODERADO	Onda de 2.5m com periodo de 9.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
24	Caminha	2026-10-22 22:00:00+00	2.56	9.55	\N	MODERADO	Onda de 2.56m com periodo de 9.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
25	Caminha	2026-10-22 23:00:00+00	2.64	9.65	\N	MODERADO	Onda de 2.64m com periodo de 9.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
26	Caminha	2026-10-23 00:00:00+00	2.78	9.85	\N	MODERADO	Onda de 2.78m com periodo de 9.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
27	Caminha	2026-10-23 01:00:00+00	2.92	10.10	\N	MODERADO	Onda de 2.92m com periodo de 10.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
28	Caminha	2026-10-23 02:00:00+00	3.06	10.40	\N	ALTO	Onda de 3.06m com periodo de 10.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
29	Caminha	2026-10-23 03:00:00+00	3.26	10.75	\N	ALTO	Onda de 3.26m com periodo de 10.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
30	Caminha	2026-10-23 04:00:00+00	3.48	11.20	\N	ALTO	Onda de 3.48m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
31	Caminha	2026-10-23 05:00:00+00	3.68	11.50	\N	ALTO	Onda de 3.68m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
32	Caminha	2026-10-23 06:00:00+00	3.72	11.65	\N	ALTO	Onda de 3.72m com periodo de 11.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
33	Caminha	2026-10-23 07:00:00+00	3.74	11.70	\N	ALTO	Onda de 3.74m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
34	Caminha	2026-10-23 08:00:00+00	3.78	11.75	\N	ALTO	Onda de 3.78m com periodo de 11.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
35	Caminha	2026-10-23 09:00:00+00	3.70	11.75	\N	ALTO	Onda de 3.7m com periodo de 11.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
36	Caminha	2026-10-23 10:00:00+00	3.64	11.70	\N	ALTO	Onda de 3.64m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
37	Caminha	2026-10-23 11:00:00+00	3.56	11.65	\N	ALTO	Onda de 3.56m com periodo de 11.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
38	Caminha	2026-10-23 12:00:00+00	3.50	11.55	\N	ALTO	Onda de 3.5m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
39	Caminha	2026-10-23 13:00:00+00	3.42	11.45	\N	ALTO	Onda de 3.42m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
40	Caminha	2026-10-23 14:00:00+00	3.36	11.35	\N	ALTO	Onda de 3.36m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
41	Caminha	2026-10-23 15:00:00+00	3.30	11.25	\N	ALTO	Onda de 3.3m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
42	Caminha	2026-10-23 16:00:00+00	3.22	11.10	\N	ALTO	Onda de 3.22m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
43	Caminha	2026-10-23 17:00:00+00	3.16	11.00	\N	ALTO	Onda de 3.16m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
44	Caminha	2026-10-23 18:00:00+00	3.10	10.90	\N	ALTO	Onda de 3.1m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
45	Caminha	2026-10-23 19:00:00+00	3.02	10.80	\N	ALTO	Onda de 3.02m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
46	Caminha	2026-10-23 20:00:00+00	2.96	10.70	\N	MODERADO	Onda de 2.96m com periodo de 10.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
47	Caminha	2026-10-23 21:00:00+00	2.88	10.65	\N	MODERADO	Onda de 2.88m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
48	Caminha	2026-10-23 22:00:00+00	2.82	10.60	\N	MODERADO	Onda de 2.82m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
49	Esposende	2026-10-21 23:00:00+00	2.02	10.40	\N	MODERADO	Onda de 2.02m com periodo de 10.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
50	Esposende	2026-10-22 00:00:00+00	1.98	10.40	\N	MODERADO	Onda de 1.98m com periodo de 10.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
51	Esposende	2026-10-22 01:00:00+00	1.96	10.35	\N	MODERADO	Onda de 1.96m com periodo de 10.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
52	Esposende	2026-10-22 02:00:00+00	1.92	10.35	\N	MODERADO	Onda de 1.92m com periodo de 10.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
53	Esposende	2026-10-22 03:00:00+00	1.90	10.35	\N	MODERADO	Onda de 1.9m com periodo de 10.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
54	Esposende	2026-10-22 04:00:00+00	1.86	10.40	\N	MODERADO	Onda de 1.86m com periodo de 10.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
55	Esposende	2026-10-22 05:00:00+00	1.84	10.40	\N	MODERADO	Onda de 1.84m com periodo de 10.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
56	Esposende	2026-10-22 06:00:00+00	1.82	10.40	\N	MODERADO	Onda de 1.82m com periodo de 10.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
57	Esposende	2026-10-22 07:00:00+00	1.82	10.40	\N	MODERADO	Onda de 1.82m com periodo de 10.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
58	Esposende	2026-10-22 08:00:00+00	1.80	10.40	\N	MODERADO	Onda de 1.8m com periodo de 10.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
59	Esposende	2026-10-22 09:00:00+00	1.80	10.35	\N	MODERADO	Onda de 1.8m com periodo de 10.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
60	Esposende	2026-10-22 10:00:00+00	1.82	10.25	\N	MODERADO	Onda de 1.82m com periodo de 10.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
61	Esposende	2026-10-22 11:00:00+00	1.82	10.15	\N	MODERADO	Onda de 1.82m com periodo de 10.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
62	Esposende	2026-10-22 12:00:00+00	1.82	10.05	\N	MODERADO	Onda de 1.82m com periodo de 10.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
63	Esposende	2026-10-22 13:00:00+00	1.84	9.95	\N	MODERADO	Onda de 1.84m com periodo de 9.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
64	Esposende	2026-10-22 14:00:00+00	1.84	9.80	\N	MODERADO	Onda de 1.84m com periodo de 9.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
65	Esposende	2026-10-22 15:00:00+00	1.88	9.60	\N	MODERADO	Onda de 1.88m com periodo de 9.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
66	Esposende	2026-10-22 16:00:00+00	1.90	9.45	\N	MODERADO	Onda de 1.9m com periodo de 9.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
67	Esposende	2026-10-22 17:00:00+00	1.94	9.25	\N	MODERADO	Onda de 1.94m com periodo de 9.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
68	Esposende	2026-10-22 18:00:00+00	1.98	9.10	\N	MODERADO	Onda de 1.98m com periodo de 9.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
69	Esposende	2026-10-22 19:00:00+00	2.00	8.95	\N	MODERADO	Onda de 2.0m com periodo de 8.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
70	Esposende	2026-10-22 20:00:00+00	2.04	8.90	\N	MODERADO	Onda de 2.04m com periodo de 8.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
71	Esposende	2026-10-22 21:00:00+00	2.08	8.95	\N	MODERADO	Onda de 2.08m com periodo de 8.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
72	Esposende	2026-10-22 22:00:00+00	2.14	9.05	\N	MODERADO	Onda de 2.14m com periodo de 9.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
73	Esposende	2026-10-22 23:00:00+00	2.18	9.15	\N	MODERADO	Onda de 2.18m com periodo de 9.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
74	Esposende	2026-10-23 00:00:00+00	2.26	9.30	\N	MODERADO	Onda de 2.26m com periodo de 9.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
75	Esposende	2026-10-23 01:00:00+00	2.36	9.45	\N	MODERADO	Onda de 2.36m com periodo de 9.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
76	Esposende	2026-10-23 02:00:00+00	2.44	9.65	\N	MODERADO	Onda de 2.44m com periodo de 9.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
77	Esposende	2026-10-23 03:00:00+00	2.54	9.95	\N	MODERADO	Onda de 2.54m com periodo de 9.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
78	Esposende	2026-10-23 04:00:00+00	2.62	10.25	\N	MODERADO	Onda de 2.62m com periodo de 10.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
79	Esposende	2026-10-23 05:00:00+00	2.72	10.55	\N	MODERADO	Onda de 2.72m com periodo de 10.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
80	Esposende	2026-10-23 06:00:00+00	2.76	10.80	\N	MODERADO	Onda de 2.76m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
81	Esposende	2026-10-23 07:00:00+00	2.78	10.95	\N	MODERADO	Onda de 2.78m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
82	Esposende	2026-10-23 08:00:00+00	2.82	11.10	\N	MODERADO	Onda de 2.82m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
83	Esposende	2026-10-23 09:00:00+00	2.78	11.20	\N	MODERADO	Onda de 2.78m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
84	Esposende	2026-10-23 10:00:00+00	2.76	11.20	\N	MODERADO	Onda de 2.76m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
85	Esposende	2026-10-23 11:00:00+00	2.72	11.20	\N	MODERADO	Onda de 2.72m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
86	Esposende	2026-10-23 12:00:00+00	2.74	11.15	\N	MODERADO	Onda de 2.74m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
87	Esposende	2026-10-23 13:00:00+00	2.78	11.05	\N	MODERADO	Onda de 2.78m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
88	Esposende	2026-10-23 14:00:00+00	2.80	10.95	\N	MODERADO	Onda de 2.8m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
89	Esposende	2026-10-23 15:00:00+00	2.76	10.85	\N	MODERADO	Onda de 2.76m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
90	Esposende	2026-10-23 16:00:00+00	2.70	10.70	\N	MODERADO	Onda de 2.7m com periodo de 10.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
91	Esposende	2026-10-23 17:00:00+00	2.66	10.60	\N	MODERADO	Onda de 2.66m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
92	Esposende	2026-10-23 18:00:00+00	2.62	10.50	\N	MODERADO	Onda de 2.62m com periodo de 10.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
93	Esposende	2026-10-23 19:00:00+00	2.58	10.40	\N	MODERADO	Onda de 2.58m com periodo de 10.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
94	Esposende	2026-10-23 20:00:00+00	2.54	10.35	\N	MODERADO	Onda de 2.54m com periodo de 10.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
95	Esposende	2026-10-23 21:00:00+00	2.44	10.30	\N	MODERADO	Onda de 2.44m com periodo de 10.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
96	Esposende	2026-10-23 22:00:00+00	2.34	10.25	\N	MODERADO	Onda de 2.34m com periodo de 10.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
97	Póvoa de Varzim	2026-10-21 23:00:00+00	2.20	10.55	\N	MODERADO	Onda de 2.2m com periodo de 10.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
98	Póvoa de Varzim	2026-10-22 00:00:00+00	2.16	10.55	\N	MODERADO	Onda de 2.16m com periodo de 10.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
99	Póvoa de Varzim	2026-10-22 01:00:00+00	2.12	10.50	\N	MODERADO	Onda de 2.12m com periodo de 10.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
100	Póvoa de Varzim	2026-10-22 02:00:00+00	2.08	10.50	\N	MODERADO	Onda de 2.08m com periodo de 10.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
101	Póvoa de Varzim	2026-10-22 03:00:00+00	2.06	10.55	\N	MODERADO	Onda de 2.06m com periodo de 10.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
102	Póvoa de Varzim	2026-10-22 04:00:00+00	2.02	10.55	\N	MODERADO	Onda de 2.02m com periodo de 10.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
103	Póvoa de Varzim	2026-10-22 05:00:00+00	2.00	10.60	\N	MODERADO	Onda de 2.0m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
104	Póvoa de Varzim	2026-10-22 06:00:00+00	1.98	10.60	\N	MODERADO	Onda de 1.98m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
105	Póvoa de Varzim	2026-10-22 07:00:00+00	1.96	10.60	\N	MODERADO	Onda de 1.96m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
106	Póvoa de Varzim	2026-10-22 08:00:00+00	1.94	10.60	\N	MODERADO	Onda de 1.94m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
107	Póvoa de Varzim	2026-10-22 09:00:00+00	1.94	10.60	\N	MODERADO	Onda de 1.94m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
108	Póvoa de Varzim	2026-10-22 10:00:00+00	1.94	10.55	\N	MODERADO	Onda de 1.94m com periodo de 10.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
109	Póvoa de Varzim	2026-10-22 11:00:00+00	1.94	10.50	\N	MODERADO	Onda de 1.94m com periodo de 10.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
110	Póvoa de Varzim	2026-10-22 12:00:00+00	1.94	10.45	\N	MODERADO	Onda de 1.94m com periodo de 10.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
111	Póvoa de Varzim	2026-10-22 13:00:00+00	1.94	10.40	\N	MODERADO	Onda de 1.94m com periodo de 10.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
112	Póvoa de Varzim	2026-10-22 14:00:00+00	1.94	10.30	\N	MODERADO	Onda de 1.94m com periodo de 10.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
113	Póvoa de Varzim	2026-10-22 15:00:00+00	1.96	10.15	\N	MODERADO	Onda de 1.96m com periodo de 10.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
114	Póvoa de Varzim	2026-10-22 16:00:00+00	2.00	10.00	\N	MODERADO	Onda de 2.0m com periodo de 10.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
115	Póvoa de Varzim	2026-10-22 17:00:00+00	2.02	9.85	\N	MODERADO	Onda de 2.02m com periodo de 9.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
116	Póvoa de Varzim	2026-10-22 18:00:00+00	2.04	9.70	\N	MODERADO	Onda de 2.04m com periodo de 9.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
117	Póvoa de Varzim	2026-10-22 19:00:00+00	2.06	9.50	\N	MODERADO	Onda de 2.06m com periodo de 9.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
118	Póvoa de Varzim	2026-10-22 20:00:00+00	2.08	9.40	\N	MODERADO	Onda de 2.08m com periodo de 9.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
119	Póvoa de Varzim	2026-10-22 21:00:00+00	2.12	9.40	\N	MODERADO	Onda de 2.12m com periodo de 9.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
120	Póvoa de Varzim	2026-10-22 22:00:00+00	2.16	9.45	\N	MODERADO	Onda de 2.16m com periodo de 9.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
121	Póvoa de Varzim	2026-10-22 23:00:00+00	2.20	9.50	\N	MODERADO	Onda de 2.2m com periodo de 9.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
122	Póvoa de Varzim	2026-10-23 00:00:00+00	2.28	9.60	\N	MODERADO	Onda de 2.28m com periodo de 9.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
123	Póvoa de Varzim	2026-10-23 01:00:00+00	2.38	9.70	\N	MODERADO	Onda de 2.38m com periodo de 9.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
124	Póvoa de Varzim	2026-10-23 02:00:00+00	2.46	9.85	\N	MODERADO	Onda de 2.46m com periodo de 9.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
125	Póvoa de Varzim	2026-10-23 03:00:00+00	2.60	10.15	\N	MODERADO	Onda de 2.6m com periodo de 10.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
126	Póvoa de Varzim	2026-10-23 04:00:00+00	2.74	10.50	\N	MODERADO	Onda de 2.74m com periodo de 10.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
127	Póvoa de Varzim	2026-10-23 05:00:00+00	2.88	10.80	\N	MODERADO	Onda de 2.88m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
128	Póvoa de Varzim	2026-10-23 06:00:00+00	2.94	11.05	\N	MODERADO	Onda de 2.94m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
129	Póvoa de Varzim	2026-10-23 07:00:00+00	3.02	11.25	\N	ALTO	Onda de 3.02m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
130	Póvoa de Varzim	2026-10-23 08:00:00+00	3.08	11.40	\N	ALTO	Onda de 3.08m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
131	Póvoa de Varzim	2026-10-23 09:00:00+00	3.06	11.50	\N	ALTO	Onda de 3.06m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
132	Póvoa de Varzim	2026-10-23 10:00:00+00	3.04	11.50	\N	ALTO	Onda de 3.04m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
133	Póvoa de Varzim	2026-10-23 11:00:00+00	3.02	11.50	\N	ALTO	Onda de 3.02m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
134	Póvoa de Varzim	2026-10-23 12:00:00+00	2.98	11.40	\N	MODERADO	Onda de 2.98m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
135	Póvoa de Varzim	2026-10-23 13:00:00+00	2.96	11.25	\N	MODERADO	Onda de 2.96m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
136	Póvoa de Varzim	2026-10-23 14:00:00+00	2.92	11.10	\N	MODERADO	Onda de 2.92m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
137	Póvoa de Varzim	2026-10-23 15:00:00+00	2.88	10.95	\N	MODERADO	Onda de 2.88m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
138	Póvoa de Varzim	2026-10-23 16:00:00+00	2.84	10.75	\N	MODERADO	Onda de 2.84m com periodo de 10.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
139	Póvoa de Varzim	2026-10-23 17:00:00+00	2.80	10.60	\N	MODERADO	Onda de 2.8m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
140	Póvoa de Varzim	2026-10-23 18:00:00+00	2.74	10.50	\N	MODERADO	Onda de 2.74m com periodo de 10.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
141	Póvoa de Varzim	2026-10-23 19:00:00+00	2.70	10.40	\N	MODERADO	Onda de 2.7m com periodo de 10.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
142	Póvoa de Varzim	2026-10-23 20:00:00+00	2.64	10.35	\N	MODERADO	Onda de 2.64m com periodo de 10.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
143	Póvoa de Varzim	2026-10-23 21:00:00+00	2.56	10.30	\N	MODERADO	Onda de 2.56m com periodo de 10.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
144	Póvoa de Varzim	2026-10-23 22:00:00+00	2.50	10.25	\N	MODERADO	Onda de 2.5m com periodo de 10.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
145	Matosinhos	2026-10-21 23:00:00+00	2.16	10.60	\N	MODERADO	Onda de 2.16m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
146	Matosinhos	2026-10-22 00:00:00+00	2.12	10.60	\N	MODERADO	Onda de 2.12m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
147	Matosinhos	2026-10-22 01:00:00+00	2.10	10.65	\N	MODERADO	Onda de 2.1m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
148	Matosinhos	2026-10-22 02:00:00+00	2.06	10.65	\N	MODERADO	Onda de 2.06m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
149	Matosinhos	2026-10-22 03:00:00+00	2.02	10.65	\N	MODERADO	Onda de 2.02m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
150	Matosinhos	2026-10-22 04:00:00+00	2.00	10.70	\N	MODERADO	Onda de 2.0m com periodo de 10.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
151	Matosinhos	2026-10-22 05:00:00+00	1.96	10.70	\N	MODERADO	Onda de 1.96m com periodo de 10.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
152	Matosinhos	2026-10-22 06:00:00+00	1.94	10.70	\N	MODERADO	Onda de 1.94m com periodo de 10.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
153	Matosinhos	2026-10-22 07:00:00+00	1.92	10.70	\N	MODERADO	Onda de 1.92m com periodo de 10.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
154	Matosinhos	2026-10-22 08:00:00+00	1.90	10.70	\N	MODERADO	Onda de 1.9m com periodo de 10.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
155	Matosinhos	2026-10-22 09:00:00+00	1.90	10.70	\N	MODERADO	Onda de 1.9m com periodo de 10.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
156	Matosinhos	2026-10-22 10:00:00+00	1.88	10.75	\N	MODERADO	Onda de 1.88m com periodo de 10.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
157	Matosinhos	2026-10-22 11:00:00+00	1.88	10.75	\N	MODERADO	Onda de 1.88m com periodo de 10.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
158	Matosinhos	2026-10-22 12:00:00+00	1.88	10.75	\N	MODERADO	Onda de 1.88m com periodo de 10.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
159	Matosinhos	2026-10-22 13:00:00+00	1.88	10.75	\N	MODERADO	Onda de 1.88m com periodo de 10.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
160	Matosinhos	2026-10-22 14:00:00+00	1.88	10.70	\N	MODERADO	Onda de 1.88m com periodo de 10.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
161	Matosinhos	2026-10-22 15:00:00+00	1.90	10.60	\N	MODERADO	Onda de 1.9m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
162	Matosinhos	2026-10-22 16:00:00+00	1.90	10.40	\N	MODERADO	Onda de 1.9m com periodo de 10.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
163	Matosinhos	2026-10-22 17:00:00+00	1.92	10.25	\N	MODERADO	Onda de 1.92m com periodo de 10.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
164	Matosinhos	2026-10-22 18:00:00+00	1.94	10.10	\N	MODERADO	Onda de 1.94m com periodo de 10.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
165	Matosinhos	2026-10-22 19:00:00+00	1.94	9.90	\N	MODERADO	Onda de 1.94m com periodo de 9.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
166	Matosinhos	2026-10-22 20:00:00+00	1.96	9.80	\N	MODERADO	Onda de 1.96m com periodo de 9.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
167	Matosinhos	2026-10-22 21:00:00+00	1.98	9.75	\N	MODERADO	Onda de 1.98m com periodo de 9.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
168	Matosinhos	2026-10-22 22:00:00+00	2.02	9.75	\N	MODERADO	Onda de 2.02m com periodo de 9.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
169	Matosinhos	2026-10-22 23:00:00+00	2.04	9.75	\N	MODERADO	Onda de 2.04m com periodo de 9.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
170	Matosinhos	2026-10-23 00:00:00+00	2.12	9.80	\N	MODERADO	Onda de 2.12m com periodo de 9.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
171	Matosinhos	2026-10-23 01:00:00+00	2.20	9.90	\N	MODERADO	Onda de 2.2m com periodo de 9.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
172	Matosinhos	2026-10-23 02:00:00+00	2.28	10.05	\N	MODERADO	Onda de 2.28m com periodo de 10.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
173	Matosinhos	2026-10-23 03:00:00+00	2.42	10.30	\N	MODERADO	Onda de 2.42m com periodo de 10.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
174	Matosinhos	2026-10-23 04:00:00+00	2.58	10.65	\N	MODERADO	Onda de 2.58m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
175	Matosinhos	2026-10-23 05:00:00+00	2.72	10.95	\N	MODERADO	Onda de 2.72m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
176	Matosinhos	2026-10-23 06:00:00+00	2.82	11.20	\N	MODERADO	Onda de 2.82m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
177	Matosinhos	2026-10-23 07:00:00+00	2.92	11.50	\N	MODERADO	Onda de 2.92m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
178	Matosinhos	2026-10-23 08:00:00+00	3.02	11.65	\N	ALTO	Onda de 3.02m com periodo de 11.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
179	Matosinhos	2026-10-23 09:00:00+00	3.00	11.70	\N	ALTO	Onda de 3.0m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
180	Matosinhos	2026-10-23 10:00:00+00	3.00	11.70	\N	ALTO	Onda de 3.0m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
181	Matosinhos	2026-10-23 11:00:00+00	2.98	11.65	\N	MODERADO	Onda de 2.98m com periodo de 11.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
182	Matosinhos	2026-10-23 12:00:00+00	2.94	11.55	\N	MODERADO	Onda de 2.94m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
183	Matosinhos	2026-10-23 13:00:00+00	2.90	11.35	\N	MODERADO	Onda de 2.9m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
184	Matosinhos	2026-10-23 14:00:00+00	2.86	11.20	\N	MODERADO	Onda de 2.86m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
185	Matosinhos	2026-10-23 15:00:00+00	2.82	11.00	\N	MODERADO	Onda de 2.82m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
186	Matosinhos	2026-10-23 16:00:00+00	2.76	10.80	\N	MODERADO	Onda de 2.76m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
187	Matosinhos	2026-10-23 17:00:00+00	2.72	10.65	\N	MODERADO	Onda de 2.72m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
188	Matosinhos	2026-10-23 18:00:00+00	2.66	10.55	\N	MODERADO	Onda de 2.66m com periodo de 10.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
189	Matosinhos	2026-10-23 19:00:00+00	2.62	10.45	\N	MODERADO	Onda de 2.62m com periodo de 10.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
190	Matosinhos	2026-10-23 20:00:00+00	2.56	10.40	\N	MODERADO	Onda de 2.56m com periodo de 10.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
191	Matosinhos	2026-10-23 21:00:00+00	2.50	10.35	\N	MODERADO	Onda de 2.5m com periodo de 10.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
192	Matosinhos	2026-10-23 22:00:00+00	2.44	10.30	\N	MODERADO	Onda de 2.44m com periodo de 10.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
193	Espinho	2026-10-21 23:00:00+00	2.22	10.80	\N	MODERADO	Onda de 2.22m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
194	Espinho	2026-10-22 00:00:00+00	2.18	10.80	\N	MODERADO	Onda de 2.18m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
195	Espinho	2026-10-22 01:00:00+00	2.14	10.85	\N	MODERADO	Onda de 2.14m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
196	Espinho	2026-10-22 02:00:00+00	2.10	10.85	\N	MODERADO	Onda de 2.1m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
197	Espinho	2026-10-22 03:00:00+00	2.06	10.85	\N	MODERADO	Onda de 2.06m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
198	Espinho	2026-10-22 04:00:00+00	2.04	10.85	\N	MODERADO	Onda de 2.04m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
199	Espinho	2026-10-22 05:00:00+00	2.00	10.85	\N	MODERADO	Onda de 2.0m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
200	Espinho	2026-10-22 06:00:00+00	1.98	10.85	\N	MODERADO	Onda de 1.98m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
201	Espinho	2026-10-22 07:00:00+00	1.96	10.85	\N	MODERADO	Onda de 1.96m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
202	Espinho	2026-10-22 08:00:00+00	1.94	10.85	\N	MODERADO	Onda de 1.94m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
203	Espinho	2026-10-22 09:00:00+00	1.94	10.90	\N	MODERADO	Onda de 1.94m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
204	Espinho	2026-10-22 10:00:00+00	1.92	10.90	\N	MODERADO	Onda de 1.92m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
205	Espinho	2026-10-22 11:00:00+00	1.92	10.95	\N	MODERADO	Onda de 1.92m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
206	Espinho	2026-10-22 12:00:00+00	1.92	11.00	\N	MODERADO	Onda de 1.92m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
207	Espinho	2026-10-22 13:00:00+00	1.90	11.05	\N	MODERADO	Onda de 1.9m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
208	Espinho	2026-10-22 14:00:00+00	1.90	11.05	\N	MODERADO	Onda de 1.9m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
209	Espinho	2026-10-22 15:00:00+00	1.90	11.00	\N	MODERADO	Onda de 1.9m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
210	Espinho	2026-10-22 16:00:00+00	1.90	10.90	\N	MODERADO	Onda de 1.9m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
211	Espinho	2026-10-22 17:00:00+00	1.90	10.80	\N	MODERADO	Onda de 1.9m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
212	Espinho	2026-10-22 18:00:00+00	1.92	10.65	\N	MODERADO	Onda de 1.92m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
213	Espinho	2026-10-22 19:00:00+00	1.92	10.55	\N	MODERADO	Onda de 1.92m com periodo de 10.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
214	Espinho	2026-10-22 20:00:00+00	1.94	10.40	\N	MODERADO	Onda de 1.94m com periodo de 10.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
215	Espinho	2026-10-22 21:00:00+00	1.96	10.30	\N	MODERADO	Onda de 1.96m com periodo de 10.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
216	Espinho	2026-10-22 22:00:00+00	1.98	10.20	\N	MODERADO	Onda de 1.98m com periodo de 10.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
217	Espinho	2026-10-22 23:00:00+00	2.00	10.15	\N	MODERADO	Onda de 2.0m com periodo de 10.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
218	Espinho	2026-10-23 00:00:00+00	2.08	10.15	\N	MODERADO	Onda de 2.08m com periodo de 10.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
219	Espinho	2026-10-23 01:00:00+00	2.14	10.15	\N	MODERADO	Onda de 2.14m com periodo de 10.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
220	Espinho	2026-10-23 02:00:00+00	2.22	10.25	\N	MODERADO	Onda de 2.22m com periodo de 10.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
221	Espinho	2026-10-23 03:00:00+00	2.36	10.50	\N	MODERADO	Onda de 2.36m com periodo de 10.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
222	Espinho	2026-10-23 04:00:00+00	2.52	10.80	\N	MODERADO	Onda de 2.52m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
223	Espinho	2026-10-23 05:00:00+00	2.66	11.10	\N	MODERADO	Onda de 2.66m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
224	Espinho	2026-10-23 06:00:00+00	2.78	11.40	\N	MODERADO	Onda de 2.78m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
225	Espinho	2026-10-23 07:00:00+00	2.92	11.65	\N	MODERADO	Onda de 2.92m com periodo de 11.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
226	Espinho	2026-10-23 08:00:00+00	3.04	11.85	\N	ALTO	Onda de 3.04m com periodo de 11.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
227	Espinho	2026-10-23 09:00:00+00	3.04	11.95	\N	ALTO	Onda de 3.04m com periodo de 11.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
228	Espinho	2026-10-23 10:00:00+00	3.04	11.95	\N	ALTO	Onda de 3.04m com periodo de 11.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
229	Espinho	2026-10-23 11:00:00+00	3.04	11.90	\N	ALTO	Onda de 3.04m com periodo de 11.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
230	Espinho	2026-10-23 12:00:00+00	3.00	11.75	\N	ALTO	Onda de 3.0m com periodo de 11.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
231	Espinho	2026-10-23 13:00:00+00	2.96	11.60	\N	MODERADO	Onda de 2.96m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
232	Espinho	2026-10-23 14:00:00+00	2.92	11.40	\N	MODERADO	Onda de 2.92m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
233	Espinho	2026-10-23 15:00:00+00	2.86	11.25	\N	MODERADO	Onda de 2.86m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
234	Espinho	2026-10-23 16:00:00+00	2.82	11.05	\N	MODERADO	Onda de 2.82m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
235	Espinho	2026-10-23 17:00:00+00	2.76	10.90	\N	MODERADO	Onda de 2.76m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
236	Espinho	2026-10-23 18:00:00+00	2.70	10.80	\N	MODERADO	Onda de 2.7m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
237	Espinho	2026-10-23 19:00:00+00	2.66	10.70	\N	MODERADO	Onda de 2.66m com periodo de 10.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
238	Espinho	2026-10-23 20:00:00+00	2.60	10.60	\N	MODERADO	Onda de 2.6m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
239	Espinho	2026-10-23 21:00:00+00	2.54	10.55	\N	MODERADO	Onda de 2.54m com periodo de 10.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
240	Espinho	2026-10-23 22:00:00+00	2.48	10.50	\N	MODERADO	Onda de 2.48m com periodo de 10.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
241	Furadouro	2026-10-21 23:00:00+00	2.28	10.95	\N	MODERADO	Onda de 2.28m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
242	Furadouro	2026-10-22 00:00:00+00	2.22	10.95	\N	MODERADO	Onda de 2.22m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
243	Furadouro	2026-10-22 01:00:00+00	2.18	11.00	\N	MODERADO	Onda de 2.18m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
244	Furadouro	2026-10-22 02:00:00+00	2.12	11.00	\N	MODERADO	Onda de 2.12m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
245	Furadouro	2026-10-22 03:00:00+00	2.10	11.00	\N	MODERADO	Onda de 2.1m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
246	Furadouro	2026-10-22 04:00:00+00	2.06	11.05	\N	MODERADO	Onda de 2.06m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
247	Furadouro	2026-10-22 05:00:00+00	2.04	11.05	\N	MODERADO	Onda de 2.04m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
248	Furadouro	2026-10-22 06:00:00+00	2.02	11.05	\N	MODERADO	Onda de 2.02m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
249	Furadouro	2026-10-22 07:00:00+00	1.98	11.05	\N	MODERADO	Onda de 1.98m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
250	Furadouro	2026-10-22 08:00:00+00	1.96	11.05	\N	MODERADO	Onda de 1.96m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
251	Furadouro	2026-10-22 09:00:00+00	1.96	11.05	\N	MODERADO	Onda de 1.96m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
252	Furadouro	2026-10-22 10:00:00+00	1.94	11.10	\N	MODERADO	Onda de 1.94m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
253	Furadouro	2026-10-22 11:00:00+00	1.94	11.15	\N	MODERADO	Onda de 1.94m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
254	Furadouro	2026-10-22 12:00:00+00	1.94	11.20	\N	MODERADO	Onda de 1.94m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
255	Furadouro	2026-10-22 13:00:00+00	1.94	11.30	\N	MODERADO	Onda de 1.94m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
256	Furadouro	2026-10-22 14:00:00+00	1.94	11.30	\N	MODERADO	Onda de 1.94m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
257	Furadouro	2026-10-22 15:00:00+00	1.94	11.25	\N	MODERADO	Onda de 1.94m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
258	Furadouro	2026-10-22 16:00:00+00	1.92	11.15	\N	MODERADO	Onda de 1.92m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
259	Furadouro	2026-10-22 17:00:00+00	1.92	11.05	\N	MODERADO	Onda de 1.92m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
260	Furadouro	2026-10-22 18:00:00+00	1.92	10.95	\N	MODERADO	Onda de 1.92m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
261	Furadouro	2026-10-22 19:00:00+00	1.94	10.80	\N	MODERADO	Onda de 1.94m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
262	Furadouro	2026-10-22 20:00:00+00	1.94	10.70	\N	MODERADO	Onda de 1.94m com periodo de 10.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
263	Furadouro	2026-10-22 21:00:00+00	1.94	10.60	\N	MODERADO	Onda de 1.94m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
264	Furadouro	2026-10-22 22:00:00+00	1.96	10.50	\N	MODERADO	Onda de 1.96m com periodo de 10.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
265	Furadouro	2026-10-22 23:00:00+00	1.96	10.45	\N	MODERADO	Onda de 1.96m com periodo de 10.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
266	Furadouro	2026-10-23 00:00:00+00	2.04	10.40	\N	MODERADO	Onda de 2.04m com periodo de 10.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
267	Furadouro	2026-10-23 01:00:00+00	2.12	10.40	\N	MODERADO	Onda de 2.12m com periodo de 10.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
268	Furadouro	2026-10-23 02:00:00+00	2.20	10.45	\N	MODERADO	Onda de 2.2m com periodo de 10.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
269	Furadouro	2026-10-23 03:00:00+00	2.36	10.65	\N	MODERADO	Onda de 2.36m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
270	Furadouro	2026-10-23 04:00:00+00	2.50	11.00	\N	MODERADO	Onda de 2.5m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
271	Furadouro	2026-10-23 05:00:00+00	2.66	11.30	\N	MODERADO	Onda de 2.66m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
272	Furadouro	2026-10-23 06:00:00+00	2.82	11.60	\N	MODERADO	Onda de 2.82m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
273	Furadouro	2026-10-23 07:00:00+00	3.00	11.95	\N	ALTO	Onda de 3.0m com periodo de 11.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
274	Furadouro	2026-10-23 08:00:00+00	3.16	12.15	\N	ALTO	Onda de 3.16m com periodo de 12.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
275	Furadouro	2026-10-23 09:00:00+00	3.16	12.25	\N	ALTO	Onda de 3.16m com periodo de 12.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
276	Furadouro	2026-10-23 10:00:00+00	3.18	12.20	\N	ALTO	Onda de 3.18m com periodo de 12.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
277	Furadouro	2026-10-23 11:00:00+00	3.18	12.15	\N	ALTO	Onda de 3.18m com periodo de 12.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
278	Furadouro	2026-10-23 12:00:00+00	3.14	12.00	\N	ALTO	Onda de 3.14m com periodo de 12.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
279	Furadouro	2026-10-23 13:00:00+00	3.08	11.80	\N	ALTO	Onda de 3.08m com periodo de 11.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
280	Furadouro	2026-10-23 14:00:00+00	3.04	11.60	\N	ALTO	Onda de 3.04m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
281	Furadouro	2026-10-23 15:00:00+00	3.00	11.40	\N	ALTO	Onda de 3.0m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
282	Furadouro	2026-10-23 16:00:00+00	2.94	11.15	\N	MODERADO	Onda de 2.94m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
283	Furadouro	2026-10-23 17:00:00+00	2.90	10.95	\N	MODERADO	Onda de 2.9m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
284	Furadouro	2026-10-23 18:00:00+00	2.84	10.80	\N	MODERADO	Onda de 2.84m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
285	Furadouro	2026-10-23 19:00:00+00	2.80	10.70	\N	MODERADO	Onda de 2.8m com periodo de 10.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
286	Furadouro	2026-10-23 20:00:00+00	2.74	10.65	\N	MODERADO	Onda de 2.74m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
287	Furadouro	2026-10-23 21:00:00+00	2.68	10.60	\N	MODERADO	Onda de 2.68m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
288	Furadouro	2026-10-23 22:00:00+00	2.62	10.55	\N	MODERADO	Onda de 2.62m com periodo de 10.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
289	Barra (Aveiro)	2026-10-21 23:00:00+00	2.22	10.90	\N	MODERADO	Onda de 2.22m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
290	Barra (Aveiro)	2026-10-22 00:00:00+00	2.16	10.90	\N	MODERADO	Onda de 2.16m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
291	Barra (Aveiro)	2026-10-22 01:00:00+00	2.12	10.90	\N	MODERADO	Onda de 2.12m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
292	Barra (Aveiro)	2026-10-22 02:00:00+00	2.06	10.90	\N	MODERADO	Onda de 2.06m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
293	Barra (Aveiro)	2026-10-22 03:00:00+00	2.04	10.90	\N	MODERADO	Onda de 2.04m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
294	Barra (Aveiro)	2026-10-22 04:00:00+00	2.00	10.95	\N	MODERADO	Onda de 2.0m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
295	Barra (Aveiro)	2026-10-22 05:00:00+00	1.98	10.95	\N	MODERADO	Onda de 1.98m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
296	Barra (Aveiro)	2026-10-22 06:00:00+00	1.96	10.95	\N	MODERADO	Onda de 1.96m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
297	Barra (Aveiro)	2026-10-22 07:00:00+00	1.92	10.95	\N	MODERADO	Onda de 1.92m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
298	Barra (Aveiro)	2026-10-22 08:00:00+00	1.90	10.95	\N	MODERADO	Onda de 1.9m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
299	Barra (Aveiro)	2026-10-22 09:00:00+00	1.88	10.95	\N	MODERADO	Onda de 1.88m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
300	Barra (Aveiro)	2026-10-22 10:00:00+00	1.88	11.00	\N	MODERADO	Onda de 1.88m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
301	Barra (Aveiro)	2026-10-22 11:00:00+00	1.86	11.00	\N	MODERADO	Onda de 1.86m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
302	Barra (Aveiro)	2026-10-22 12:00:00+00	1.86	11.05	\N	MODERADO	Onda de 1.86m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
303	Barra (Aveiro)	2026-10-22 13:00:00+00	1.84	11.10	\N	MODERADO	Onda de 1.84m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
304	Barra (Aveiro)	2026-10-22 14:00:00+00	1.84	11.10	\N	MODERADO	Onda de 1.84m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
305	Barra (Aveiro)	2026-10-22 15:00:00+00	1.84	11.10	\N	MODERADO	Onda de 1.84m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
306	Barra (Aveiro)	2026-10-22 16:00:00+00	1.84	11.05	\N	MODERADO	Onda de 1.84m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
307	Barra (Aveiro)	2026-10-22 17:00:00+00	1.84	11.00	\N	MODERADO	Onda de 1.84m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
308	Barra (Aveiro)	2026-10-22 18:00:00+00	1.84	10.90	\N	MODERADO	Onda de 1.84m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
309	Barra (Aveiro)	2026-10-22 19:00:00+00	1.84	10.75	\N	MODERADO	Onda de 1.84m com periodo de 10.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
310	Barra (Aveiro)	2026-10-22 20:00:00+00	1.84	10.65	\N	MODERADO	Onda de 1.84m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
311	Barra (Aveiro)	2026-10-22 21:00:00+00	1.86	10.55	\N	MODERADO	Onda de 1.86m com periodo de 10.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
312	Barra (Aveiro)	2026-10-22 22:00:00+00	1.86	10.45	\N	MODERADO	Onda de 1.86m com periodo de 10.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
313	Barra (Aveiro)	2026-10-22 23:00:00+00	1.88	10.35	\N	MODERADO	Onda de 1.88m com periodo de 10.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
314	Barra (Aveiro)	2026-10-23 00:00:00+00	1.94	10.25	\N	MODERADO	Onda de 1.94m com periodo de 10.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
315	Barra (Aveiro)	2026-10-23 01:00:00+00	2.02	10.20	\N	MODERADO	Onda de 2.02m com periodo de 10.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
316	Barra (Aveiro)	2026-10-23 02:00:00+00	2.08	10.20	\N	MODERADO	Onda de 2.08m com periodo de 10.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
317	Barra (Aveiro)	2026-10-23 03:00:00+00	2.20	10.35	\N	MODERADO	Onda de 2.2m com periodo de 10.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
318	Barra (Aveiro)	2026-10-23 04:00:00+00	2.34	10.55	\N	MODERADO	Onda de 2.34m com periodo de 10.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
319	Barra (Aveiro)	2026-10-23 05:00:00+00	2.46	10.80	\N	MODERADO	Onda de 2.46m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
320	Barra (Aveiro)	2026-10-23 06:00:00+00	2.60	11.10	\N	MODERADO	Onda de 2.6m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
321	Barra (Aveiro)	2026-10-23 07:00:00+00	2.76	11.50	\N	MODERADO	Onda de 2.76m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
322	Barra (Aveiro)	2026-10-23 08:00:00+00	2.90	11.75	\N	MODERADO	Onda de 2.9m com periodo de 11.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
323	Barra (Aveiro)	2026-10-23 09:00:00+00	2.94	11.90	\N	MODERADO	Onda de 2.94m com periodo de 11.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
324	Barra (Aveiro)	2026-10-23 10:00:00+00	2.98	11.95	\N	MODERADO	Onda de 2.98m com periodo de 11.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
325	Barra (Aveiro)	2026-10-23 11:00:00+00	3.02	11.95	\N	ALTO	Onda de 3.02m com periodo de 11.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
326	Barra (Aveiro)	2026-10-23 12:00:00+00	2.98	11.85	\N	MODERADO	Onda de 2.98m com periodo de 11.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
327	Barra (Aveiro)	2026-10-23 13:00:00+00	2.96	11.70	\N	MODERADO	Onda de 2.96m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
328	Barra (Aveiro)	2026-10-23 14:00:00+00	2.92	11.55	\N	MODERADO	Onda de 2.92m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
329	Barra (Aveiro)	2026-10-23 15:00:00+00	2.88	11.35	\N	MODERADO	Onda de 2.88m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
330	Barra (Aveiro)	2026-10-23 16:00:00+00	2.84	11.15	\N	MODERADO	Onda de 2.84m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
331	Barra (Aveiro)	2026-10-23 17:00:00+00	2.80	10.95	\N	MODERADO	Onda de 2.8m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
332	Barra (Aveiro)	2026-10-23 18:00:00+00	2.76	10.80	\N	MODERADO	Onda de 2.76m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
333	Barra (Aveiro)	2026-10-23 19:00:00+00	2.70	10.70	\N	MODERADO	Onda de 2.7m com periodo de 10.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
334	Barra (Aveiro)	2026-10-23 20:00:00+00	2.66	10.60	\N	MODERADO	Onda de 2.66m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
335	Barra (Aveiro)	2026-10-23 21:00:00+00	2.60	10.55	\N	MODERADO	Onda de 2.6m com periodo de 10.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
336	Barra (Aveiro)	2026-10-23 22:00:00+00	2.56	10.50	\N	MODERADO	Onda de 2.56m com periodo de 10.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
337	Mira	2026-10-21 23:00:00+00	2.04	11.15	\N	MODERADO	Onda de 2.04m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
338	Mira	2026-10-22 00:00:00+00	2.00	11.15	\N	MODERADO	Onda de 2.0m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
339	Mira	2026-10-22 01:00:00+00	1.96	11.10	\N	MODERADO	Onda de 1.96m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
340	Mira	2026-10-22 02:00:00+00	1.92	11.10	\N	MODERADO	Onda de 1.92m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
341	Mira	2026-10-22 03:00:00+00	1.88	11.10	\N	MODERADO	Onda de 1.88m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
342	Mira	2026-10-22 04:00:00+00	1.86	11.15	\N	MODERADO	Onda de 1.86m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
343	Mira	2026-10-22 05:00:00+00	1.82	11.15	\N	MODERADO	Onda de 1.82m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
344	Mira	2026-10-22 06:00:00+00	1.80	11.15	\N	MODERADO	Onda de 1.8m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
345	Mira	2026-10-22 07:00:00+00	1.78	11.10	\N	BAIXO	Onda de 1.78m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
346	Mira	2026-10-22 08:00:00+00	1.76	11.10	\N	BAIXO	Onda de 1.76m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
347	Mira	2026-10-22 09:00:00+00	1.74	11.10	\N	BAIXO	Onda de 1.74m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
348	Mira	2026-10-22 10:00:00+00	1.72	11.10	\N	BAIXO	Onda de 1.72m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
349	Mira	2026-10-22 11:00:00+00	1.70	11.15	\N	BAIXO	Onda de 1.7m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
350	Mira	2026-10-22 12:00:00+00	1.70	11.20	\N	BAIXO	Onda de 1.7m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
351	Mira	2026-10-22 13:00:00+00	1.70	11.25	\N	BAIXO	Onda de 1.7m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
352	Mira	2026-10-22 14:00:00+00	1.70	11.30	\N	BAIXO	Onda de 1.7m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
353	Mira	2026-10-22 15:00:00+00	1.70	11.30	\N	BAIXO	Onda de 1.7m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
354	Mira	2026-10-22 16:00:00+00	1.68	11.30	\N	BAIXO	Onda de 1.68m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
355	Mira	2026-10-22 17:00:00+00	1.68	11.25	\N	BAIXO	Onda de 1.68m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
356	Mira	2026-10-22 18:00:00+00	1.68	11.15	\N	BAIXO	Onda de 1.68m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
357	Mira	2026-10-22 19:00:00+00	1.66	11.05	\N	BAIXO	Onda de 1.66m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
358	Mira	2026-10-22 20:00:00+00	1.66	10.95	\N	BAIXO	Onda de 1.66m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
359	Mira	2026-10-22 21:00:00+00	1.68	10.85	\N	BAIXO	Onda de 1.68m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
360	Mira	2026-10-22 22:00:00+00	1.68	10.80	\N	BAIXO	Onda de 1.68m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
361	Mira	2026-10-22 23:00:00+00	1.70	10.70	\N	BAIXO	Onda de 1.7m com periodo de 10.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
362	Mira	2026-10-23 00:00:00+00	1.74	10.60	\N	BAIXO	Onda de 1.74m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
363	Mira	2026-10-23 01:00:00+00	1.80	10.50	\N	MODERADO	Onda de 1.8m com periodo de 10.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
364	Mira	2026-10-23 02:00:00+00	1.84	10.45	\N	MODERADO	Onda de 1.84m com periodo de 10.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
365	Mira	2026-10-23 03:00:00+00	1.92	10.55	\N	MODERADO	Onda de 1.92m com periodo de 10.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
366	Mira	2026-10-23 04:00:00+00	2.02	10.70	\N	MODERADO	Onda de 2.02m com periodo de 10.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
367	Mira	2026-10-23 05:00:00+00	2.10	10.90	\N	MODERADO	Onda de 2.1m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
368	Mira	2026-10-23 06:00:00+00	2.18	11.25	\N	MODERADO	Onda de 2.18m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
369	Mira	2026-10-23 07:00:00+00	2.26	11.65	\N	MODERADO	Onda de 2.26m com periodo de 11.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
370	Mira	2026-10-23 08:00:00+00	2.34	11.95	\N	MODERADO	Onda de 2.34m com periodo de 11.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
371	Mira	2026-10-23 09:00:00+00	2.36	12.15	\N	MODERADO	Onda de 2.36m com periodo de 12.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
372	Mira	2026-10-23 10:00:00+00	2.40	12.25	\N	MODERADO	Onda de 2.4m com periodo de 12.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
373	Mira	2026-10-23 11:00:00+00	2.42	12.25	\N	MODERADO	Onda de 2.42m com periodo de 12.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
374	Mira	2026-10-23 12:00:00+00	2.48	12.20	\N	MODERADO	Onda de 2.48m com periodo de 12.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
375	Mira	2026-10-23 13:00:00+00	2.56	12.05	\N	MODERADO	Onda de 2.56m com periodo de 12.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
376	Mira	2026-10-23 14:00:00+00	2.62	11.90	\N	MODERADO	Onda de 2.62m com periodo de 11.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
377	Mira	2026-10-23 15:00:00+00	2.54	11.80	\N	MODERADO	Onda de 2.54m com periodo de 11.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
378	Mira	2026-10-23 16:00:00+00	2.46	11.65	\N	MODERADO	Onda de 2.46m com periodo de 11.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
379	Mira	2026-10-23 17:00:00+00	2.38	11.50	\N	MODERADO	Onda de 2.38m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
380	Mira	2026-10-23 18:00:00+00	2.34	11.30	\N	MODERADO	Onda de 2.34m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
381	Mira	2026-10-23 19:00:00+00	2.30	11.10	\N	MODERADO	Onda de 2.3m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
382	Mira	2026-10-23 20:00:00+00	2.26	10.90	\N	MODERADO	Onda de 2.26m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
383	Mira	2026-10-23 21:00:00+00	2.22	10.80	\N	MODERADO	Onda de 2.22m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
384	Mira	2026-10-23 22:00:00+00	2.20	10.75	\N	MODERADO	Onda de 2.2m com periodo de 10.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
385	Figueira da Foz	2026-10-21 23:00:00+00	2.58	11.25	\N	MODERADO	Onda de 2.58m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
386	Figueira da Foz	2026-10-22 00:00:00+00	2.52	11.25	\N	MODERADO	Onda de 2.52m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
387	Figueira da Foz	2026-10-22 01:00:00+00	2.46	11.20	\N	MODERADO	Onda de 2.46m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
388	Figueira da Foz	2026-10-22 02:00:00+00	2.40	11.20	\N	MODERADO	Onda de 2.4m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
389	Figueira da Foz	2026-10-22 03:00:00+00	2.36	11.20	\N	MODERADO	Onda de 2.36m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
390	Figueira da Foz	2026-10-22 04:00:00+00	2.30	11.20	\N	MODERADO	Onda de 2.3m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
391	Figueira da Foz	2026-10-22 05:00:00+00	2.26	11.20	\N	MODERADO	Onda de 2.26m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
392	Figueira da Foz	2026-10-22 06:00:00+00	2.22	11.20	\N	MODERADO	Onda de 2.22m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
393	Figueira da Foz	2026-10-22 07:00:00+00	2.18	11.20	\N	MODERADO	Onda de 2.18m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
394	Figueira da Foz	2026-10-22 08:00:00+00	2.14	11.20	\N	MODERADO	Onda de 2.14m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
395	Figueira da Foz	2026-10-22 09:00:00+00	2.12	11.20	\N	MODERADO	Onda de 2.12m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
396	Figueira da Foz	2026-10-22 10:00:00+00	2.10	11.20	\N	MODERADO	Onda de 2.1m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
397	Figueira da Foz	2026-10-22 11:00:00+00	2.08	11.25	\N	MODERADO	Onda de 2.08m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
398	Figueira da Foz	2026-10-22 12:00:00+00	2.08	11.30	\N	MODERADO	Onda de 2.08m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
399	Figueira da Foz	2026-10-22 13:00:00+00	2.06	11.35	\N	MODERADO	Onda de 2.06m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
400	Figueira da Foz	2026-10-22 14:00:00+00	2.06	11.40	\N	MODERADO	Onda de 2.06m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
401	Figueira da Foz	2026-10-22 15:00:00+00	2.06	11.45	\N	MODERADO	Onda de 2.06m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
402	Figueira da Foz	2026-10-22 16:00:00+00	2.04	11.50	\N	MODERADO	Onda de 2.04m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
403	Figueira da Foz	2026-10-22 17:00:00+00	2.04	11.50	\N	MODERADO	Onda de 2.04m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
404	Figueira da Foz	2026-10-22 18:00:00+00	2.02	11.45	\N	MODERADO	Onda de 2.02m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
405	Figueira da Foz	2026-10-22 19:00:00+00	2.02	11.40	\N	MODERADO	Onda de 2.02m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
406	Figueira da Foz	2026-10-22 20:00:00+00	2.00	11.30	\N	MODERADO	Onda de 2.0m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
407	Figueira da Foz	2026-10-22 21:00:00+00	2.00	11.20	\N	MODERADO	Onda de 2.0m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
408	Figueira da Foz	2026-10-22 22:00:00+00	2.00	11.10	\N	MODERADO	Onda de 2.0m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
409	Figueira da Foz	2026-10-22 23:00:00+00	2.00	11.00	\N	MODERADO	Onda de 2.0m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
410	Figueira da Foz	2026-10-23 00:00:00+00	2.04	10.90	\N	MODERADO	Onda de 2.04m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
411	Figueira da Foz	2026-10-23 01:00:00+00	2.06	10.75	\N	MODERADO	Onda de 2.06m com periodo de 10.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
412	Figueira da Foz	2026-10-23 02:00:00+00	2.10	10.70	\N	MODERADO	Onda de 2.1m com periodo de 10.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
413	Figueira da Foz	2026-10-23 03:00:00+00	2.20	10.75	\N	MODERADO	Onda de 2.2m com periodo de 10.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
414	Figueira da Foz	2026-10-23 04:00:00+00	2.32	10.80	\N	MODERADO	Onda de 2.32m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
415	Figueira da Foz	2026-10-23 05:00:00+00	2.42	11.00	\N	MODERADO	Onda de 2.42m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
416	Figueira da Foz	2026-10-23 06:00:00+00	2.62	11.35	\N	MODERADO	Onda de 2.62m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
417	Figueira da Foz	2026-10-23 07:00:00+00	2.80	11.75	\N	MODERADO	Onda de 2.8m com periodo de 11.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
418	Figueira da Foz	2026-10-23 08:00:00+00	3.00	12.05	\N	ALTO	Onda de 3.0m com periodo de 12.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
419	Figueira da Foz	2026-10-23 09:00:00+00	3.10	12.20	\N	ALTO	Onda de 3.1m com periodo de 12.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
420	Figueira da Foz	2026-10-23 10:00:00+00	3.20	12.20	\N	ALTO	Onda de 3.2m com periodo de 12.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
421	Figueira da Foz	2026-10-23 11:00:00+00	3.30	12.20	\N	ALTO	Onda de 3.3m com periodo de 12.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
422	Figueira da Foz	2026-10-23 12:00:00+00	3.28	12.15	\N	ALTO	Onda de 3.28m com periodo de 12.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
423	Figueira da Foz	2026-10-23 13:00:00+00	3.24	12.05	\N	ALTO	Onda de 3.24m com periodo de 12.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
424	Figueira da Foz	2026-10-23 14:00:00+00	3.22	11.90	\N	ALTO	Onda de 3.22m com periodo de 11.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
425	Figueira da Foz	2026-10-23 15:00:00+00	3.16	11.75	\N	ALTO	Onda de 3.16m com periodo de 11.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
426	Figueira da Foz	2026-10-23 16:00:00+00	3.10	11.60	\N	ALTO	Onda de 3.1m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
427	Figueira da Foz	2026-10-23 17:00:00+00	3.04	11.45	\N	ALTO	Onda de 3.04m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
428	Figueira da Foz	2026-10-23 18:00:00+00	2.98	11.30	\N	MODERADO	Onda de 2.98m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
429	Figueira da Foz	2026-10-23 19:00:00+00	2.92	11.15	\N	MODERADO	Onda de 2.92m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
430	Figueira da Foz	2026-10-23 20:00:00+00	2.86	11.00	\N	MODERADO	Onda de 2.86m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
431	Figueira da Foz	2026-10-23 21:00:00+00	2.82	10.90	\N	MODERADO	Onda de 2.82m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
432	Figueira da Foz	2026-10-23 22:00:00+00	2.76	10.80	\N	MODERADO	Onda de 2.76m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
433	Leirosa	2026-10-21 23:00:00+00	2.96	11.35	\N	MODERADO	Onda de 2.96m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
434	Leirosa	2026-10-22 00:00:00+00	2.90	11.30	\N	MODERADO	Onda de 2.9m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
435	Leirosa	2026-10-22 01:00:00+00	2.84	11.25	\N	MODERADO	Onda de 2.84m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
436	Leirosa	2026-10-22 02:00:00+00	2.78	11.20	\N	MODERADO	Onda de 2.78m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
437	Leirosa	2026-10-22 03:00:00+00	2.72	11.20	\N	MODERADO	Onda de 2.72m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
438	Leirosa	2026-10-22 04:00:00+00	2.66	11.25	\N	MODERADO	Onda de 2.66m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
439	Leirosa	2026-10-22 05:00:00+00	2.60	11.25	\N	MODERADO	Onda de 2.6m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
440	Leirosa	2026-10-22 06:00:00+00	2.54	11.25	\N	MODERADO	Onda de 2.54m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
441	Leirosa	2026-10-22 07:00:00+00	2.50	11.25	\N	MODERADO	Onda de 2.5m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
442	Leirosa	2026-10-22 08:00:00+00	2.44	11.25	\N	MODERADO	Onda de 2.44m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
443	Leirosa	2026-10-22 09:00:00+00	2.42	11.25	\N	MODERADO	Onda de 2.42m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
444	Leirosa	2026-10-22 10:00:00+00	2.40	11.30	\N	MODERADO	Onda de 2.4m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
445	Leirosa	2026-10-22 11:00:00+00	2.38	11.35	\N	MODERADO	Onda de 2.38m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
446	Leirosa	2026-10-22 12:00:00+00	2.36	11.40	\N	MODERADO	Onda de 2.36m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
447	Leirosa	2026-10-22 13:00:00+00	2.36	11.45	\N	MODERADO	Onda de 2.36m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
448	Leirosa	2026-10-22 14:00:00+00	2.34	11.50	\N	MODERADO	Onda de 2.34m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
449	Leirosa	2026-10-22 15:00:00+00	2.34	11.55	\N	MODERADO	Onda de 2.34m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
450	Leirosa	2026-10-22 16:00:00+00	2.32	11.60	\N	MODERADO	Onda de 2.32m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
451	Leirosa	2026-10-22 17:00:00+00	2.32	11.60	\N	MODERADO	Onda de 2.32m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
452	Leirosa	2026-10-22 18:00:00+00	2.30	11.55	\N	MODERADO	Onda de 2.3m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
453	Leirosa	2026-10-22 19:00:00+00	2.30	11.50	\N	MODERADO	Onda de 2.3m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
454	Leirosa	2026-10-22 20:00:00+00	2.28	11.45	\N	MODERADO	Onda de 2.28m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
455	Leirosa	2026-10-22 21:00:00+00	2.28	11.35	\N	MODERADO	Onda de 2.28m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
456	Leirosa	2026-10-22 22:00:00+00	2.26	11.25	\N	MODERADO	Onda de 2.26m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
457	Leirosa	2026-10-22 23:00:00+00	2.26	11.15	\N	MODERADO	Onda de 2.26m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
458	Leirosa	2026-10-23 00:00:00+00	2.30	11.00	\N	MODERADO	Onda de 2.3m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
459	Leirosa	2026-10-23 01:00:00+00	2.32	10.85	\N	MODERADO	Onda de 2.32m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
460	Leirosa	2026-10-23 02:00:00+00	2.36	10.80	\N	MODERADO	Onda de 2.36m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
461	Leirosa	2026-10-23 03:00:00+00	2.48	10.85	\N	MODERADO	Onda de 2.48m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
462	Leirosa	2026-10-23 04:00:00+00	2.62	10.95	\N	MODERADO	Onda de 2.62m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
463	Leirosa	2026-10-23 05:00:00+00	2.74	11.15	\N	MODERADO	Onda de 2.74m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
464	Leirosa	2026-10-23 06:00:00+00	2.96	11.50	\N	MODERADO	Onda de 2.96m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
465	Leirosa	2026-10-23 07:00:00+00	3.18	11.90	\N	ALTO	Onda de 3.18m com periodo de 11.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
466	Leirosa	2026-10-23 08:00:00+00	3.40	12.20	\N	ALTO	Onda de 3.4m com periodo de 12.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
467	Leirosa	2026-10-23 09:00:00+00	3.52	12.35	\N	ALTO	Onda de 3.52m com periodo de 12.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
468	Leirosa	2026-10-23 10:00:00+00	3.66	12.35	\N	ALTO	Onda de 3.66m com periodo de 12.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
469	Leirosa	2026-10-23 11:00:00+00	3.78	12.35	\N	ALTO	Onda de 3.78m com periodo de 12.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
470	Leirosa	2026-10-23 12:00:00+00	3.76	12.30	\N	ALTO	Onda de 3.76m com periodo de 12.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
471	Leirosa	2026-10-23 13:00:00+00	3.72	12.20	\N	ALTO	Onda de 3.72m com periodo de 12.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
472	Leirosa	2026-10-23 14:00:00+00	3.70	12.05	\N	ALTO	Onda de 3.7m com periodo de 12.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
473	Leirosa	2026-10-23 15:00:00+00	3.64	11.90	\N	ALTO	Onda de 3.64m com periodo de 11.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
474	Leirosa	2026-10-23 16:00:00+00	3.56	11.75	\N	ALTO	Onda de 3.56m com periodo de 11.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
475	Leirosa	2026-10-23 17:00:00+00	3.50	11.60	\N	ALTO	Onda de 3.5m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
476	Leirosa	2026-10-23 18:00:00+00	3.44	11.45	\N	ALTO	Onda de 3.44m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
477	Leirosa	2026-10-23 19:00:00+00	3.38	11.30	\N	ALTO	Onda de 3.38m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
478	Leirosa	2026-10-23 20:00:00+00	3.32	11.15	\N	ALTO	Onda de 3.32m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
479	Leirosa	2026-10-23 21:00:00+00	3.26	11.00	\N	ALTO	Onda de 3.26m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
480	Leirosa	2026-10-23 22:00:00+00	3.22	10.90	\N	ALTO	Onda de 3.22m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
481	Pedrógão	2026-10-21 23:00:00+00	2.90	11.25	\N	MODERADO	Onda de 2.9m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
482	Pedrógão	2026-10-22 00:00:00+00	2.84	11.25	\N	MODERADO	Onda de 2.84m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
483	Pedrógão	2026-10-22 01:00:00+00	2.78	11.20	\N	MODERADO	Onda de 2.78m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
484	Pedrógão	2026-10-22 02:00:00+00	2.72	11.20	\N	MODERADO	Onda de 2.72m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
485	Pedrógão	2026-10-22 03:00:00+00	2.66	11.20	\N	MODERADO	Onda de 2.66m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
486	Pedrógão	2026-10-22 04:00:00+00	2.60	11.15	\N	MODERADO	Onda de 2.6m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
487	Pedrógão	2026-10-22 05:00:00+00	2.54	11.15	\N	MODERADO	Onda de 2.54m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
488	Pedrógão	2026-10-22 06:00:00+00	2.48	11.15	\N	MODERADO	Onda de 2.48m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
489	Pedrógão	2026-10-22 07:00:00+00	2.44	11.15	\N	MODERADO	Onda de 2.44m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
490	Pedrógão	2026-10-22 08:00:00+00	2.38	11.15	\N	MODERADO	Onda de 2.38m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
491	Pedrógão	2026-10-22 09:00:00+00	2.36	11.15	\N	MODERADO	Onda de 2.36m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
492	Pedrógão	2026-10-22 10:00:00+00	2.34	11.20	\N	MODERADO	Onda de 2.34m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
493	Pedrógão	2026-10-22 11:00:00+00	2.32	11.25	\N	MODERADO	Onda de 2.32m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
494	Pedrógão	2026-10-22 12:00:00+00	2.30	11.30	\N	MODERADO	Onda de 2.3m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
495	Pedrógão	2026-10-22 13:00:00+00	2.30	11.35	\N	MODERADO	Onda de 2.3m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
496	Pedrógão	2026-10-22 14:00:00+00	2.28	11.40	\N	MODERADO	Onda de 2.28m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
497	Pedrógão	2026-10-22 15:00:00+00	2.26	11.45	\N	MODERADO	Onda de 2.26m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
498	Pedrógão	2026-10-22 16:00:00+00	2.26	11.50	\N	MODERADO	Onda de 2.26m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
499	Pedrógão	2026-10-22 17:00:00+00	2.24	11.50	\N	MODERADO	Onda de 2.24m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
500	Pedrógão	2026-10-22 18:00:00+00	2.24	11.45	\N	MODERADO	Onda de 2.24m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
501	Pedrógão	2026-10-22 19:00:00+00	2.22	11.40	\N	MODERADO	Onda de 2.22m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
502	Pedrógão	2026-10-22 20:00:00+00	2.22	11.35	\N	MODERADO	Onda de 2.22m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
503	Pedrógão	2026-10-22 21:00:00+00	2.22	11.25	\N	MODERADO	Onda de 2.22m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
504	Pedrógão	2026-10-22 22:00:00+00	2.20	11.20	\N	MODERADO	Onda de 2.2m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
505	Pedrógão	2026-10-22 23:00:00+00	2.20	11.10	\N	MODERADO	Onda de 2.2m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
506	Pedrógão	2026-10-23 00:00:00+00	2.22	11.00	\N	MODERADO	Onda de 2.22m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
507	Pedrógão	2026-10-23 01:00:00+00	2.26	10.90	\N	MODERADO	Onda de 2.26m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
508	Pedrógão	2026-10-23 02:00:00+00	2.28	10.85	\N	MODERADO	Onda de 2.28m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
509	Pedrógão	2026-10-23 03:00:00+00	2.40	10.85	\N	MODERADO	Onda de 2.4m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
510	Pedrógão	2026-10-23 04:00:00+00	2.50	10.85	\N	MODERADO	Onda de 2.5m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
511	Pedrógão	2026-10-23 05:00:00+00	2.62	11.00	\N	MODERADO	Onda de 2.62m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
512	Pedrógão	2026-10-23 06:00:00+00	2.82	11.30	\N	MODERADO	Onda de 2.82m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
513	Pedrógão	2026-10-23 07:00:00+00	3.04	11.75	\N	ALTO	Onda de 3.04m com periodo de 11.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
514	Pedrógão	2026-10-23 08:00:00+00	3.24	12.05	\N	ALTO	Onda de 3.24m com periodo de 12.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
515	Pedrógão	2026-10-23 09:00:00+00	3.36	12.20	\N	ALTO	Onda de 3.36m com periodo de 12.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
516	Pedrógão	2026-10-23 10:00:00+00	3.50	12.25	\N	ALTO	Onda de 3.5m com periodo de 12.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
517	Pedrógão	2026-10-23 11:00:00+00	3.62	12.25	\N	ALTO	Onda de 3.62m com periodo de 12.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
518	Pedrógão	2026-10-23 12:00:00+00	3.60	12.20	\N	ALTO	Onda de 3.6m com periodo de 12.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
519	Pedrógão	2026-10-23 13:00:00+00	3.60	12.10	\N	ALTO	Onda de 3.6m com periodo de 12.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
520	Pedrógão	2026-10-23 14:00:00+00	3.58	11.95	\N	ALTO	Onda de 3.58m com periodo de 11.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
521	Pedrógão	2026-10-23 15:00:00+00	3.52	11.80	\N	ALTO	Onda de 3.52m com periodo de 11.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
522	Pedrógão	2026-10-23 16:00:00+00	3.46	11.70	\N	ALTO	Onda de 3.46m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
523	Pedrógão	2026-10-23 17:00:00+00	3.40	11.55	\N	ALTO	Onda de 3.4m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
524	Pedrógão	2026-10-23 18:00:00+00	3.34	11.40	\N	ALTO	Onda de 3.34m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
525	Pedrógão	2026-10-23 19:00:00+00	3.28	11.30	\N	ALTO	Onda de 3.28m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
526	Pedrógão	2026-10-23 20:00:00+00	3.22	11.15	\N	ALTO	Onda de 3.22m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
527	Pedrógão	2026-10-23 21:00:00+00	3.18	11.05	\N	ALTO	Onda de 3.18m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
528	Pedrógão	2026-10-23 22:00:00+00	3.12	10.95	\N	ALTO	Onda de 3.12m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
529	São Pedro de Moel	2026-10-21 23:00:00+00	3.26	11.40	\N	ALTO	Onda de 3.26m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
530	São Pedro de Moel	2026-10-22 00:00:00+00	3.20	11.40	\N	ALTO	Onda de 3.2m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
531	São Pedro de Moel	2026-10-22 01:00:00+00	3.12	11.35	\N	ALTO	Onda de 3.12m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
532	São Pedro de Moel	2026-10-22 02:00:00+00	3.06	11.30	\N	ALTO	Onda de 3.06m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
533	São Pedro de Moel	2026-10-22 03:00:00+00	3.00	11.30	\N	ALTO	Onda de 3.0m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
534	São Pedro de Moel	2026-10-22 04:00:00+00	2.92	11.25	\N	MODERADO	Onda de 2.92m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
535	São Pedro de Moel	2026-10-22 05:00:00+00	2.86	11.25	\N	MODERADO	Onda de 2.86m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
536	São Pedro de Moel	2026-10-22 06:00:00+00	2.80	11.25	\N	MODERADO	Onda de 2.8m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
537	São Pedro de Moel	2026-10-22 07:00:00+00	2.72	11.25	\N	MODERADO	Onda de 2.72m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
538	São Pedro de Moel	2026-10-22 08:00:00+00	2.66	11.25	\N	MODERADO	Onda de 2.66m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
539	São Pedro de Moel	2026-10-22 09:00:00+00	2.62	11.25	\N	MODERADO	Onda de 2.62m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
540	São Pedro de Moel	2026-10-22 10:00:00+00	2.60	11.30	\N	MODERADO	Onda de 2.6m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
541	São Pedro de Moel	2026-10-22 11:00:00+00	2.56	11.30	\N	MODERADO	Onda de 2.56m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
542	São Pedro de Moel	2026-10-22 12:00:00+00	2.54	11.35	\N	MODERADO	Onda de 2.54m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
543	São Pedro de Moel	2026-10-22 13:00:00+00	2.54	11.35	\N	MODERADO	Onda de 2.54m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
544	São Pedro de Moel	2026-10-22 14:00:00+00	2.52	11.40	\N	MODERADO	Onda de 2.52m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
545	São Pedro de Moel	2026-10-22 15:00:00+00	2.50	11.45	\N	MODERADO	Onda de 2.5m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
546	São Pedro de Moel	2026-10-22 16:00:00+00	2.50	11.50	\N	MODERADO	Onda de 2.5m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
547	São Pedro de Moel	2026-10-22 17:00:00+00	2.48	11.50	\N	MODERADO	Onda de 2.48m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
548	São Pedro de Moel	2026-10-22 18:00:00+00	2.46	11.50	\N	MODERADO	Onda de 2.46m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
549	São Pedro de Moel	2026-10-22 19:00:00+00	2.44	11.50	\N	MODERADO	Onda de 2.44m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
550	São Pedro de Moel	2026-10-22 20:00:00+00	2.42	11.45	\N	MODERADO	Onda de 2.42m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
551	São Pedro de Moel	2026-10-22 21:00:00+00	2.42	11.40	\N	MODERADO	Onda de 2.42m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
552	São Pedro de Moel	2026-10-22 22:00:00+00	2.40	11.35	\N	MODERADO	Onda de 2.4m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
553	São Pedro de Moel	2026-10-22 23:00:00+00	2.40	11.25	\N	MODERADO	Onda de 2.4m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
554	São Pedro de Moel	2026-10-23 00:00:00+00	2.42	11.15	\N	MODERADO	Onda de 2.42m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
555	São Pedro de Moel	2026-10-23 01:00:00+00	2.44	11.05	\N	MODERADO	Onda de 2.44m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
556	São Pedro de Moel	2026-10-23 02:00:00+00	2.46	11.00	\N	MODERADO	Onda de 2.46m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
557	São Pedro de Moel	2026-10-23 03:00:00+00	2.56	10.95	\N	MODERADO	Onda de 2.56m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
558	São Pedro de Moel	2026-10-23 04:00:00+00	2.66	10.90	\N	MODERADO	Onda de 2.66m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
559	São Pedro de Moel	2026-10-23 05:00:00+00	2.76	11.00	\N	MODERADO	Onda de 2.76m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
560	São Pedro de Moel	2026-10-23 06:00:00+00	2.98	11.30	\N	MODERADO	Onda de 2.98m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
561	São Pedro de Moel	2026-10-23 07:00:00+00	3.20	11.70	\N	ALTO	Onda de 3.2m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
562	São Pedro de Moel	2026-10-23 08:00:00+00	3.42	12.00	\N	ALTO	Onda de 3.42m com periodo de 12.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
563	São Pedro de Moel	2026-10-23 09:00:00+00	3.60	12.20	\N	ALTO	Onda de 3.6m com periodo de 12.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
564	São Pedro de Moel	2026-10-23 10:00:00+00	3.80	12.30	\N	ALTO	Onda de 3.8m com periodo de 12.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
565	São Pedro de Moel	2026-10-23 11:00:00+00	3.98	12.35	\N	ALTO	Onda de 3.98m com periodo de 12.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
566	São Pedro de Moel	2026-10-23 12:00:00+00	3.98	12.30	\N	ALTO	Onda de 3.98m com periodo de 12.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
567	São Pedro de Moel	2026-10-23 13:00:00+00	4.00	12.20	\N	ALTO	Onda de 4.0m com periodo de 12.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
568	São Pedro de Moel	2026-10-23 14:00:00+00	4.00	12.10	\N	ALTO	Onda de 4.0m com periodo de 12.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
569	São Pedro de Moel	2026-10-23 15:00:00+00	3.94	12.00	\N	ALTO	Onda de 3.94m com periodo de 12.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
570	São Pedro de Moel	2026-10-23 16:00:00+00	3.90	11.90	\N	ALTO	Onda de 3.9m com periodo de 11.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
571	São Pedro de Moel	2026-10-23 17:00:00+00	3.84	11.80	\N	ALTO	Onda de 3.84m com periodo de 11.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
572	São Pedro de Moel	2026-10-23 18:00:00+00	3.78	11.70	\N	ALTO	Onda de 3.78m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
573	São Pedro de Moel	2026-10-23 19:00:00+00	3.72	11.55	\N	ALTO	Onda de 3.72m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
574	São Pedro de Moel	2026-10-23 20:00:00+00	3.66	11.45	\N	ALTO	Onda de 3.66m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
575	São Pedro de Moel	2026-10-23 21:00:00+00	3.60	11.35	\N	ALTO	Onda de 3.6m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
576	São Pedro de Moel	2026-10-23 22:00:00+00	3.54	11.20	\N	ALTO	Onda de 3.54m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
577	Nazaré	2026-10-21 23:00:00+00	3.28	11.35	\N	ALTO	Onda de 3.28m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
578	Nazaré	2026-10-22 00:00:00+00	3.22	11.30	\N	ALTO	Onda de 3.22m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
579	Nazaré	2026-10-22 01:00:00+00	3.14	11.30	\N	ALTO	Onda de 3.14m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
580	Nazaré	2026-10-22 02:00:00+00	3.08	11.25	\N	ALTO	Onda de 3.08m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
581	Nazaré	2026-10-22 03:00:00+00	3.02	11.25	\N	ALTO	Onda de 3.02m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
582	Nazaré	2026-10-22 04:00:00+00	2.94	11.25	\N	MODERADO	Onda de 2.94m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
583	Nazaré	2026-10-22 05:00:00+00	2.88	11.25	\N	MODERADO	Onda de 2.88m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
584	Nazaré	2026-10-22 06:00:00+00	2.82	11.25	\N	MODERADO	Onda de 2.82m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
585	Nazaré	2026-10-22 07:00:00+00	2.74	11.25	\N	MODERADO	Onda de 2.74m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
586	Nazaré	2026-10-22 08:00:00+00	2.68	11.25	\N	MODERADO	Onda de 2.68m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
587	Nazaré	2026-10-22 09:00:00+00	2.64	11.25	\N	MODERADO	Onda de 2.64m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
588	Nazaré	2026-10-22 10:00:00+00	2.62	11.25	\N	MODERADO	Onda de 2.62m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
589	Nazaré	2026-10-22 11:00:00+00	2.58	11.25	\N	MODERADO	Onda de 2.58m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
590	Nazaré	2026-10-22 12:00:00+00	2.56	11.30	\N	MODERADO	Onda de 2.56m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
591	Nazaré	2026-10-22 13:00:00+00	2.54	11.30	\N	MODERADO	Onda de 2.54m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
592	Nazaré	2026-10-22 14:00:00+00	2.52	11.35	\N	MODERADO	Onda de 2.52m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
593	Nazaré	2026-10-22 15:00:00+00	2.50	11.40	\N	MODERADO	Onda de 2.5m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
594	Nazaré	2026-10-22 16:00:00+00	2.50	11.45	\N	MODERADO	Onda de 2.5m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
595	Nazaré	2026-10-22 17:00:00+00	2.48	11.45	\N	MODERADO	Onda de 2.48m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
596	Nazaré	2026-10-22 18:00:00+00	2.46	11.45	\N	MODERADO	Onda de 2.46m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
597	Nazaré	2026-10-22 19:00:00+00	2.44	11.45	\N	MODERADO	Onda de 2.44m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
598	Nazaré	2026-10-22 20:00:00+00	2.42	11.40	\N	MODERADO	Onda de 2.42m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
599	Nazaré	2026-10-22 21:00:00+00	2.40	11.35	\N	MODERADO	Onda de 2.4m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
600	Nazaré	2026-10-22 22:00:00+00	2.40	11.30	\N	MODERADO	Onda de 2.4m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
601	Nazaré	2026-10-22 23:00:00+00	2.38	11.25	\N	MODERADO	Onda de 2.38m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
602	Nazaré	2026-10-23 00:00:00+00	2.40	11.15	\N	MODERADO	Onda de 2.4m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
603	Nazaré	2026-10-23 01:00:00+00	2.44	11.05	\N	MODERADO	Onda de 2.44m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
604	Nazaré	2026-10-23 02:00:00+00	2.46	10.95	\N	MODERADO	Onda de 2.46m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
605	Nazaré	2026-10-23 03:00:00+00	2.56	10.90	\N	MODERADO	Onda de 2.56m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
606	Nazaré	2026-10-23 04:00:00+00	2.64	10.85	\N	MODERADO	Onda de 2.64m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
607	Nazaré	2026-10-23 05:00:00+00	2.74	10.90	\N	MODERADO	Onda de 2.74m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
608	Nazaré	2026-10-23 06:00:00+00	2.96	11.20	\N	MODERADO	Onda de 2.96m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
609	Nazaré	2026-10-23 07:00:00+00	3.16	11.55	\N	ALTO	Onda de 3.16m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
610	Nazaré	2026-10-23 08:00:00+00	3.38	11.90	\N	ALTO	Onda de 3.38m com periodo de 11.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
611	Nazaré	2026-10-23 09:00:00+00	3.56	12.10	\N	ALTO	Onda de 3.56m com periodo de 12.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
612	Nazaré	2026-10-23 10:00:00+00	3.74	12.25	\N	ALTO	Onda de 3.74m com periodo de 12.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
613	Nazaré	2026-10-23 11:00:00+00	3.92	12.30	\N	ALTO	Onda de 3.92m com periodo de 12.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
614	Nazaré	2026-10-23 12:00:00+00	3.94	12.25	\N	ALTO	Onda de 3.94m com periodo de 12.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
615	Nazaré	2026-10-23 13:00:00+00	3.98	12.15	\N	ALTO	Onda de 3.98m com periodo de 12.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
616	Nazaré	2026-10-23 14:00:00+00	4.00	12.05	\N	ALTO	Onda de 4.0m com periodo de 12.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
617	Nazaré	2026-10-23 15:00:00+00	3.96	11.95	\N	ALTO	Onda de 3.96m com periodo de 11.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
618	Nazaré	2026-10-23 16:00:00+00	3.90	11.90	\N	ALTO	Onda de 3.9m com periodo de 11.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
619	Nazaré	2026-10-23 17:00:00+00	3.86	11.80	\N	ALTO	Onda de 3.86m com periodo de 11.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
620	Nazaré	2026-10-23 18:00:00+00	3.80	11.70	\N	ALTO	Onda de 3.8m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
621	Nazaré	2026-10-23 19:00:00+00	3.74	11.55	\N	ALTO	Onda de 3.74m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
622	Nazaré	2026-10-23 20:00:00+00	3.68	11.40	\N	ALTO	Onda de 3.68m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
623	Nazaré	2026-10-23 21:00:00+00	3.62	11.25	\N	ALTO	Onda de 3.62m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
624	Nazaré	2026-10-23 22:00:00+00	3.56	11.15	\N	ALTO	Onda de 3.56m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
625	Foz do Arelho	2026-10-21 23:00:00+00	3.18	11.30	\N	ALTO	Onda de 3.18m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
626	Foz do Arelho	2026-10-22 00:00:00+00	3.12	11.25	\N	ALTO	Onda de 3.12m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
627	Foz do Arelho	2026-10-22 01:00:00+00	3.06	11.25	\N	ALTO	Onda de 3.06m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
628	Foz do Arelho	2026-10-22 02:00:00+00	3.00	11.20	\N	ALTO	Onda de 3.0m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
629	Foz do Arelho	2026-10-22 03:00:00+00	2.92	11.20	\N	MODERADO	Onda de 2.92m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
630	Foz do Arelho	2026-10-22 04:00:00+00	2.86	11.20	\N	MODERADO	Onda de 2.86m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
631	Foz do Arelho	2026-10-22 05:00:00+00	2.78	11.20	\N	MODERADO	Onda de 2.78m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
632	Foz do Arelho	2026-10-22 06:00:00+00	2.72	11.20	\N	MODERADO	Onda de 2.72m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
633	Foz do Arelho	2026-10-22 07:00:00+00	2.66	11.20	\N	MODERADO	Onda de 2.66m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
634	Foz do Arelho	2026-10-22 08:00:00+00	2.60	11.20	\N	MODERADO	Onda de 2.6m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
635	Foz do Arelho	2026-10-22 09:00:00+00	2.56	11.20	\N	MODERADO	Onda de 2.56m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
636	Foz do Arelho	2026-10-22 10:00:00+00	2.52	11.20	\N	MODERADO	Onda de 2.52m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
637	Foz do Arelho	2026-10-22 11:00:00+00	2.48	11.20	\N	MODERADO	Onda de 2.48m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
638	Foz do Arelho	2026-10-22 12:00:00+00	2.46	11.25	\N	MODERADO	Onda de 2.46m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
639	Foz do Arelho	2026-10-22 13:00:00+00	2.42	11.25	\N	MODERADO	Onda de 2.42m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
640	Foz do Arelho	2026-10-22 14:00:00+00	2.40	11.30	\N	MODERADO	Onda de 2.4m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
641	Foz do Arelho	2026-10-22 15:00:00+00	2.38	11.35	\N	MODERADO	Onda de 2.38m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
642	Foz do Arelho	2026-10-22 16:00:00+00	2.38	11.35	\N	MODERADO	Onda de 2.38m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
643	Foz do Arelho	2026-10-22 17:00:00+00	2.36	11.40	\N	MODERADO	Onda de 2.36m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
644	Foz do Arelho	2026-10-22 18:00:00+00	2.34	11.40	\N	MODERADO	Onda de 2.34m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
645	Foz do Arelho	2026-10-22 19:00:00+00	2.34	11.40	\N	MODERADO	Onda de 2.34m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
646	Foz do Arelho	2026-10-22 20:00:00+00	2.32	11.40	\N	MODERADO	Onda de 2.32m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
647	Foz do Arelho	2026-10-22 21:00:00+00	2.30	11.35	\N	MODERADO	Onda de 2.3m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
648	Foz do Arelho	2026-10-22 22:00:00+00	2.30	11.30	\N	MODERADO	Onda de 2.3m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
649	Foz do Arelho	2026-10-22 23:00:00+00	2.28	11.25	\N	MODERADO	Onda de 2.28m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
650	Foz do Arelho	2026-10-23 00:00:00+00	2.30	11.15	\N	MODERADO	Onda de 2.3m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
651	Foz do Arelho	2026-10-23 01:00:00+00	2.30	11.10	\N	MODERADO	Onda de 2.3m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
652	Foz do Arelho	2026-10-23 02:00:00+00	2.32	11.00	\N	MODERADO	Onda de 2.32m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
653	Foz do Arelho	2026-10-23 03:00:00+00	2.40	10.90	\N	MODERADO	Onda de 2.4m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
654	Foz do Arelho	2026-10-23 04:00:00+00	2.50	10.80	\N	MODERADO	Onda de 2.5m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
655	Foz do Arelho	2026-10-23 05:00:00+00	2.58	10.85	\N	MODERADO	Onda de 2.58m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
656	Foz do Arelho	2026-10-23 06:00:00+00	2.78	11.10	\N	MODERADO	Onda de 2.78m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
657	Foz do Arelho	2026-10-23 07:00:00+00	2.96	11.45	\N	MODERADO	Onda de 2.96m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
658	Foz do Arelho	2026-10-23 08:00:00+00	3.16	11.75	\N	ALTO	Onda de 3.16m com periodo de 11.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
659	Foz do Arelho	2026-10-23 09:00:00+00	3.34	12.00	\N	ALTO	Onda de 3.34m com periodo de 12.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
660	Foz do Arelho	2026-10-23 10:00:00+00	3.52	12.20	\N	ALTO	Onda de 3.52m com periodo de 12.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
661	Foz do Arelho	2026-10-23 11:00:00+00	3.70	12.30	\N	ALTO	Onda de 3.7m com periodo de 12.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
662	Foz do Arelho	2026-10-23 12:00:00+00	3.74	12.30	\N	ALTO	Onda de 3.74m com periodo de 12.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
663	Foz do Arelho	2026-10-23 13:00:00+00	3.76	12.20	\N	ALTO	Onda de 3.76m com periodo de 12.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
664	Foz do Arelho	2026-10-23 14:00:00+00	3.80	12.10	\N	ALTO	Onda de 3.8m com periodo de 12.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
665	Foz do Arelho	2026-10-23 15:00:00+00	3.76	12.00	\N	ALTO	Onda de 3.76m com periodo de 12.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
666	Foz do Arelho	2026-10-23 16:00:00+00	3.72	11.90	\N	ALTO	Onda de 3.72m com periodo de 11.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
667	Foz do Arelho	2026-10-23 17:00:00+00	3.68	11.80	\N	ALTO	Onda de 3.68m com periodo de 11.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
668	Foz do Arelho	2026-10-23 18:00:00+00	3.64	11.65	\N	ALTO	Onda de 3.64m com periodo de 11.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
669	Foz do Arelho	2026-10-23 19:00:00+00	3.60	11.55	\N	ALTO	Onda de 3.6m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
670	Foz do Arelho	2026-10-23 20:00:00+00	3.56	11.40	\N	ALTO	Onda de 3.56m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
671	Foz do Arelho	2026-10-23 21:00:00+00	3.50	11.25	\N	ALTO	Onda de 3.5m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
672	Foz do Arelho	2026-10-23 22:00:00+00	3.44	11.15	\N	ALTO	Onda de 3.44m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
673	Peniche	2026-10-21 23:00:00+00	3.22	11.25	\N	ALTO	Onda de 3.22m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
674	Peniche	2026-10-22 00:00:00+00	3.16	11.20	\N	ALTO	Onda de 3.16m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
675	Peniche	2026-10-22 01:00:00+00	3.10	11.20	\N	ALTO	Onda de 3.1m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
676	Peniche	2026-10-22 02:00:00+00	3.04	11.15	\N	ALTO	Onda de 3.04m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
677	Peniche	2026-10-22 03:00:00+00	2.98	11.15	\N	MODERADO	Onda de 2.98m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
678	Peniche	2026-10-22 04:00:00+00	2.90	11.15	\N	MODERADO	Onda de 2.9m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
679	Peniche	2026-10-22 05:00:00+00	2.84	11.15	\N	MODERADO	Onda de 2.84m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
680	Peniche	2026-10-22 06:00:00+00	2.78	11.15	\N	MODERADO	Onda de 2.78m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
681	Peniche	2026-10-22 07:00:00+00	2.70	11.15	\N	MODERADO	Onda de 2.7m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
682	Peniche	2026-10-22 08:00:00+00	2.64	11.15	\N	MODERADO	Onda de 2.64m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
683	Peniche	2026-10-22 09:00:00+00	2.60	11.15	\N	MODERADO	Onda de 2.6m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
684	Peniche	2026-10-22 10:00:00+00	2.56	11.15	\N	MODERADO	Onda de 2.56m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
685	Peniche	2026-10-22 11:00:00+00	2.52	11.15	\N	MODERADO	Onda de 2.52m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
686	Peniche	2026-10-22 12:00:00+00	2.50	11.20	\N	MODERADO	Onda de 2.5m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
687	Peniche	2026-10-22 13:00:00+00	2.48	11.20	\N	MODERADO	Onda de 2.48m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
688	Peniche	2026-10-22 14:00:00+00	2.46	11.25	\N	MODERADO	Onda de 2.46m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
689	Peniche	2026-10-22 15:00:00+00	2.44	11.25	\N	MODERADO	Onda de 2.44m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
690	Peniche	2026-10-22 16:00:00+00	2.42	11.30	\N	MODERADO	Onda de 2.42m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
691	Peniche	2026-10-22 17:00:00+00	2.40	11.30	\N	MODERADO	Onda de 2.4m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
692	Peniche	2026-10-22 18:00:00+00	2.38	11.30	\N	MODERADO	Onda de 2.38m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
693	Peniche	2026-10-22 19:00:00+00	2.36	11.35	\N	MODERADO	Onda de 2.36m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
694	Peniche	2026-10-22 20:00:00+00	2.34	11.35	\N	MODERADO	Onda de 2.34m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
695	Peniche	2026-10-22 21:00:00+00	2.32	11.35	\N	MODERADO	Onda de 2.32m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
696	Peniche	2026-10-22 22:00:00+00	2.32	11.30	\N	MODERADO	Onda de 2.32m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
697	Peniche	2026-10-22 23:00:00+00	2.30	11.25	\N	MODERADO	Onda de 2.3m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
698	Peniche	2026-10-23 00:00:00+00	2.32	11.15	\N	MODERADO	Onda de 2.32m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
699	Peniche	2026-10-23 01:00:00+00	2.32	11.05	\N	MODERADO	Onda de 2.32m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
700	Peniche	2026-10-23 02:00:00+00	2.34	10.95	\N	MODERADO	Onda de 2.34m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
701	Peniche	2026-10-23 03:00:00+00	2.44	10.85	\N	MODERADO	Onda de 2.44m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
702	Peniche	2026-10-23 04:00:00+00	2.52	10.75	\N	MODERADO	Onda de 2.52m com periodo de 10.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
703	Peniche	2026-10-23 05:00:00+00	2.62	10.75	\N	MODERADO	Onda de 2.62m com periodo de 10.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
704	Peniche	2026-10-23 06:00:00+00	2.80	10.95	\N	MODERADO	Onda de 2.8m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
705	Peniche	2026-10-23 07:00:00+00	2.98	11.30	\N	MODERADO	Onda de 2.98m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
706	Peniche	2026-10-23 08:00:00+00	3.16	11.60	\N	ALTO	Onda de 3.16m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
707	Peniche	2026-10-23 09:00:00+00	3.34	11.85	\N	ALTO	Onda de 3.34m com periodo de 11.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
708	Peniche	2026-10-23 10:00:00+00	3.52	12.05	\N	ALTO	Onda de 3.52m com periodo de 12.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
709	Peniche	2026-10-23 11:00:00+00	3.70	12.15	\N	ALTO	Onda de 3.7m com periodo de 12.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
710	Peniche	2026-10-23 12:00:00+00	3.74	12.15	\N	ALTO	Onda de 3.74m com periodo de 12.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
711	Peniche	2026-10-23 13:00:00+00	3.78	12.15	\N	ALTO	Onda de 3.78m com periodo de 12.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
712	Peniche	2026-10-23 14:00:00+00	3.82	12.05	\N	ALTO	Onda de 3.82m com periodo de 12.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
713	Peniche	2026-10-23 15:00:00+00	3.78	11.95	\N	ALTO	Onda de 3.78m com periodo de 11.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
714	Peniche	2026-10-23 16:00:00+00	3.72	11.85	\N	ALTO	Onda de 3.72m com periodo de 11.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
715	Peniche	2026-10-23 17:00:00+00	3.68	11.70	\N	ALTO	Onda de 3.68m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
716	Peniche	2026-10-23 18:00:00+00	3.64	11.55	\N	ALTO	Onda de 3.64m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
717	Peniche	2026-10-23 19:00:00+00	3.62	11.40	\N	ALTO	Onda de 3.62m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
718	Peniche	2026-10-23 20:00:00+00	3.58	11.25	\N	ALTO	Onda de 3.58m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
719	Peniche	2026-10-23 21:00:00+00	3.52	11.10	\N	ALTO	Onda de 3.52m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
720	Peniche	2026-10-23 22:00:00+00	3.48	11.00	\N	ALTO	Onda de 3.48m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
721	Ericeira	2026-10-21 23:00:00+00	3.16	11.45	\N	ALTO	Onda de 3.16m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
722	Ericeira	2026-10-22 00:00:00+00	3.12	11.45	\N	ALTO	Onda de 3.12m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
723	Ericeira	2026-10-22 01:00:00+00	3.08	11.40	\N	ALTO	Onda de 3.08m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
724	Ericeira	2026-10-22 02:00:00+00	3.04	11.40	\N	ALTO	Onda de 3.04m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
725	Ericeira	2026-10-22 03:00:00+00	2.98	11.35	\N	MODERADO	Onda de 2.98m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
726	Ericeira	2026-10-22 04:00:00+00	2.92	11.35	\N	MODERADO	Onda de 2.92m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
727	Ericeira	2026-10-22 05:00:00+00	2.86	11.30	\N	MODERADO	Onda de 2.86m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
728	Ericeira	2026-10-22 06:00:00+00	2.80	11.30	\N	MODERADO	Onda de 2.8m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
729	Ericeira	2026-10-22 07:00:00+00	2.72	11.25	\N	MODERADO	Onda de 2.72m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
730	Ericeira	2026-10-22 08:00:00+00	2.66	11.25	\N	MODERADO	Onda de 2.66m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
731	Ericeira	2026-10-22 09:00:00+00	2.62	11.25	\N	MODERADO	Onda de 2.62m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
732	Ericeira	2026-10-22 10:00:00+00	2.56	11.25	\N	MODERADO	Onda de 2.56m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
733	Ericeira	2026-10-22 11:00:00+00	2.52	11.25	\N	MODERADO	Onda de 2.52m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
734	Ericeira	2026-10-22 12:00:00+00	2.48	11.30	\N	MODERADO	Onda de 2.48m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
735	Ericeira	2026-10-22 13:00:00+00	2.46	11.30	\N	MODERADO	Onda de 2.46m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
736	Ericeira	2026-10-22 14:00:00+00	2.42	11.35	\N	MODERADO	Onda de 2.42m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
737	Ericeira	2026-10-22 15:00:00+00	2.40	11.35	\N	MODERADO	Onda de 2.4m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
738	Ericeira	2026-10-22 16:00:00+00	2.40	11.40	\N	MODERADO	Onda de 2.4m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
739	Ericeira	2026-10-22 17:00:00+00	2.38	11.40	\N	MODERADO	Onda de 2.38m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
740	Ericeira	2026-10-22 18:00:00+00	2.36	11.40	\N	MODERADO	Onda de 2.36m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
741	Ericeira	2026-10-22 19:00:00+00	2.36	11.45	\N	MODERADO	Onda de 2.36m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
742	Ericeira	2026-10-22 20:00:00+00	2.34	11.45	\N	MODERADO	Onda de 2.34m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
743	Ericeira	2026-10-22 21:00:00+00	2.32	11.45	\N	MODERADO	Onda de 2.32m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
744	Ericeira	2026-10-22 22:00:00+00	2.32	11.45	\N	MODERADO	Onda de 2.32m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
745	Ericeira	2026-10-22 23:00:00+00	2.30	11.40	\N	MODERADO	Onda de 2.3m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
746	Ericeira	2026-10-23 00:00:00+00	2.30	11.35	\N	MODERADO	Onda de 2.3m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
747	Ericeira	2026-10-23 01:00:00+00	2.28	11.25	\N	MODERADO	Onda de 2.28m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
748	Ericeira	2026-10-23 02:00:00+00	2.28	11.20	\N	MODERADO	Onda de 2.28m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
749	Ericeira	2026-10-23 03:00:00+00	2.32	11.10	\N	MODERADO	Onda de 2.32m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
750	Ericeira	2026-10-23 04:00:00+00	2.38	11.00	\N	MODERADO	Onda de 2.38m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
751	Ericeira	2026-10-23 05:00:00+00	2.42	11.00	\N	MODERADO	Onda de 2.42m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
752	Ericeira	2026-10-23 06:00:00+00	2.56	11.10	\N	MODERADO	Onda de 2.56m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
753	Ericeira	2026-10-23 07:00:00+00	2.70	11.30	\N	MODERADO	Onda de 2.7m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
754	Ericeira	2026-10-23 08:00:00+00	2.84	11.55	\N	MODERADO	Onda de 2.84m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
755	Ericeira	2026-10-23 09:00:00+00	3.04	11.80	\N	ALTO	Onda de 3.04m com periodo de 11.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
756	Ericeira	2026-10-23 10:00:00+00	3.22	12.10	\N	ALTO	Onda de 3.22m com periodo de 12.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
757	Ericeira	2026-10-23 11:00:00+00	3.42	12.30	\N	ALTO	Onda de 3.42m com periodo de 12.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
758	Ericeira	2026-10-23 12:00:00+00	3.50	12.30	\N	ALTO	Onda de 3.5m com periodo de 12.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
759	Ericeira	2026-10-23 13:00:00+00	3.60	12.20	\N	ALTO	Onda de 3.6m com periodo de 12.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
760	Ericeira	2026-10-23 14:00:00+00	3.68	12.10	\N	ALTO	Onda de 3.68m com periodo de 12.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
761	Ericeira	2026-10-23 15:00:00+00	3.66	12.00	\N	ALTO	Onda de 3.66m com periodo de 12.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
762	Ericeira	2026-10-23 16:00:00+00	3.66	11.90	\N	ALTO	Onda de 3.66m com periodo de 11.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
763	Ericeira	2026-10-23 17:00:00+00	3.64	11.80	\N	ALTO	Onda de 3.64m com periodo de 11.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
764	Ericeira	2026-10-23 18:00:00+00	3.58	11.70	\N	ALTO	Onda de 3.58m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
765	Ericeira	2026-10-23 19:00:00+00	3.54	11.55	\N	ALTO	Onda de 3.54m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
766	Ericeira	2026-10-23 20:00:00+00	3.48	11.45	\N	ALTO	Onda de 3.48m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
767	Ericeira	2026-10-23 21:00:00+00	3.42	11.35	\N	ALTO	Onda de 3.42m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
768	Ericeira	2026-10-23 22:00:00+00	3.38	11.25	\N	ALTO	Onda de 3.38m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
769	Praia Grande (Sintra)	2026-10-21 23:00:00+00	3.20	11.50	\N	ALTO	Onda de 3.2m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
770	Praia Grande (Sintra)	2026-10-22 00:00:00+00	3.16	11.50	\N	ALTO	Onda de 3.16m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
771	Praia Grande (Sintra)	2026-10-22 01:00:00+00	3.14	11.45	\N	ALTO	Onda de 3.14m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
772	Praia Grande (Sintra)	2026-10-22 02:00:00+00	3.10	11.45	\N	ALTO	Onda de 3.1m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
773	Praia Grande (Sintra)	2026-10-22 03:00:00+00	3.04	11.45	\N	ALTO	Onda de 3.04m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
774	Praia Grande (Sintra)	2026-10-22 04:00:00+00	2.98	11.40	\N	MODERADO	Onda de 2.98m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
775	Praia Grande (Sintra)	2026-10-22 05:00:00+00	2.92	11.40	\N	MODERADO	Onda de 2.92m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
776	Praia Grande (Sintra)	2026-10-22 06:00:00+00	2.86	11.35	\N	MODERADO	Onda de 2.86m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
777	Praia Grande (Sintra)	2026-10-22 07:00:00+00	2.78	11.35	\N	MODERADO	Onda de 2.78m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
778	Praia Grande (Sintra)	2026-10-22 08:00:00+00	2.72	11.30	\N	MODERADO	Onda de 2.72m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
779	Praia Grande (Sintra)	2026-10-22 09:00:00+00	2.66	11.30	\N	MODERADO	Onda de 2.66m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
780	Praia Grande (Sintra)	2026-10-22 10:00:00+00	2.62	11.30	\N	MODERADO	Onda de 2.62m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
781	Praia Grande (Sintra)	2026-10-22 11:00:00+00	2.56	11.30	\N	MODERADO	Onda de 2.56m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
782	Praia Grande (Sintra)	2026-10-22 12:00:00+00	2.52	11.30	\N	MODERADO	Onda de 2.52m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
783	Praia Grande (Sintra)	2026-10-22 13:00:00+00	2.50	11.35	\N	MODERADO	Onda de 2.5m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
784	Praia Grande (Sintra)	2026-10-22 14:00:00+00	2.46	11.35	\N	MODERADO	Onda de 2.46m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
785	Praia Grande (Sintra)	2026-10-22 15:00:00+00	2.44	11.35	\N	MODERADO	Onda de 2.44m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
786	Praia Grande (Sintra)	2026-10-22 16:00:00+00	2.44	11.40	\N	MODERADO	Onda de 2.44m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
787	Praia Grande (Sintra)	2026-10-22 17:00:00+00	2.42	11.40	\N	MODERADO	Onda de 2.42m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
788	Praia Grande (Sintra)	2026-10-22 18:00:00+00	2.40	11.40	\N	MODERADO	Onda de 2.4m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
789	Praia Grande (Sintra)	2026-10-22 19:00:00+00	2.38	11.45	\N	MODERADO	Onda de 2.38m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
790	Praia Grande (Sintra)	2026-10-22 20:00:00+00	2.36	11.45	\N	MODERADO	Onda de 2.36m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
791	Praia Grande (Sintra)	2026-10-22 21:00:00+00	2.34	11.45	\N	MODERADO	Onda de 2.34m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
792	Praia Grande (Sintra)	2026-10-22 22:00:00+00	2.34	11.45	\N	MODERADO	Onda de 2.34m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
793	Praia Grande (Sintra)	2026-10-22 23:00:00+00	2.32	11.45	\N	MODERADO	Onda de 2.32m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
794	Praia Grande (Sintra)	2026-10-23 00:00:00+00	2.32	11.40	\N	MODERADO	Onda de 2.32m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
795	Praia Grande (Sintra)	2026-10-23 01:00:00+00	2.30	11.35	\N	MODERADO	Onda de 2.3m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
796	Praia Grande (Sintra)	2026-10-23 02:00:00+00	2.30	11.25	\N	MODERADO	Onda de 2.3m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
797	Praia Grande (Sintra)	2026-10-23 03:00:00+00	2.34	11.15	\N	MODERADO	Onda de 2.34m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
798	Praia Grande (Sintra)	2026-10-23 04:00:00+00	2.36	11.05	\N	MODERADO	Onda de 2.36m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
799	Praia Grande (Sintra)	2026-10-23 05:00:00+00	2.40	11.00	\N	MODERADO	Onda de 2.4m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
800	Praia Grande (Sintra)	2026-10-23 06:00:00+00	2.52	11.10	\N	MODERADO	Onda de 2.52m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
801	Praia Grande (Sintra)	2026-10-23 07:00:00+00	2.66	11.25	\N	MODERADO	Onda de 2.66m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
802	Praia Grande (Sintra)	2026-10-23 08:00:00+00	2.78	11.45	\N	MODERADO	Onda de 2.78m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
803	Praia Grande (Sintra)	2026-10-23 09:00:00+00	2.96	11.70	\N	MODERADO	Onda de 2.96m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
804	Praia Grande (Sintra)	2026-10-23 10:00:00+00	3.16	12.00	\N	ALTO	Onda de 3.16m com periodo de 12.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
805	Praia Grande (Sintra)	2026-10-23 11:00:00+00	3.34	12.20	\N	ALTO	Onda de 3.34m com periodo de 12.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
806	Praia Grande (Sintra)	2026-10-23 12:00:00+00	3.44	12.25	\N	ALTO	Onda de 3.44m com periodo de 12.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
807	Praia Grande (Sintra)	2026-10-23 13:00:00+00	3.56	12.20	\N	ALTO	Onda de 3.56m com periodo de 12.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
808	Praia Grande (Sintra)	2026-10-23 14:00:00+00	3.66	12.10	\N	ALTO	Onda de 3.66m com periodo de 12.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
809	Praia Grande (Sintra)	2026-10-23 15:00:00+00	3.66	12.00	\N	ALTO	Onda de 3.66m com periodo de 12.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
810	Praia Grande (Sintra)	2026-10-23 16:00:00+00	3.66	11.90	\N	ALTO	Onda de 3.66m com periodo de 11.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
811	Praia Grande (Sintra)	2026-10-23 17:00:00+00	3.66	11.80	\N	ALTO	Onda de 3.66m com periodo de 11.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
812	Praia Grande (Sintra)	2026-10-23 18:00:00+00	3.62	11.70	\N	ALTO	Onda de 3.62m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
813	Praia Grande (Sintra)	2026-10-23 19:00:00+00	3.60	11.55	\N	ALTO	Onda de 3.6m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
814	Praia Grande (Sintra)	2026-10-23 20:00:00+00	3.56	11.45	\N	ALTO	Onda de 3.56m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
815	Praia Grande (Sintra)	2026-10-23 21:00:00+00	3.50	11.35	\N	ALTO	Onda de 3.5m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
816	Praia Grande (Sintra)	2026-10-23 22:00:00+00	3.44	11.25	\N	ALTO	Onda de 3.44m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
817	Cascais	2026-10-21 23:00:00+00	2.88	11.55	\N	MODERADO	Onda de 2.88m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
818	Cascais	2026-10-22 00:00:00+00	2.86	11.55	\N	MODERADO	Onda de 2.86m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
819	Cascais	2026-10-22 01:00:00+00	2.82	11.55	\N	MODERADO	Onda de 2.82m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
820	Cascais	2026-10-22 02:00:00+00	2.80	11.55	\N	MODERADO	Onda de 2.8m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
821	Cascais	2026-10-22 03:00:00+00	2.74	11.50	\N	MODERADO	Onda de 2.74m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
822	Cascais	2026-10-22 04:00:00+00	2.70	11.50	\N	MODERADO	Onda de 2.7m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
823	Cascais	2026-10-22 05:00:00+00	2.64	11.45	\N	MODERADO	Onda de 2.64m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
824	Cascais	2026-10-22 06:00:00+00	2.58	11.40	\N	MODERADO	Onda de 2.58m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
825	Cascais	2026-10-22 07:00:00+00	2.52	11.40	\N	MODERADO	Onda de 2.52m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
826	Cascais	2026-10-22 08:00:00+00	2.46	11.35	\N	MODERADO	Onda de 2.46m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
827	Cascais	2026-10-22 09:00:00+00	2.42	11.35	\N	MODERADO	Onda de 2.42m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
828	Cascais	2026-10-22 10:00:00+00	2.36	11.35	\N	MODERADO	Onda de 2.36m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
829	Cascais	2026-10-22 11:00:00+00	2.32	11.35	\N	MODERADO	Onda de 2.32m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
830	Cascais	2026-10-22 12:00:00+00	2.30	11.35	\N	MODERADO	Onda de 2.3m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
831	Cascais	2026-10-22 13:00:00+00	2.26	11.40	\N	MODERADO	Onda de 2.26m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
832	Cascais	2026-10-22 14:00:00+00	2.24	11.40	\N	MODERADO	Onda de 2.24m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
833	Cascais	2026-10-22 15:00:00+00	2.22	11.40	\N	MODERADO	Onda de 2.22m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
834	Cascais	2026-10-22 16:00:00+00	2.22	11.45	\N	MODERADO	Onda de 2.22m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
835	Cascais	2026-10-22 17:00:00+00	2.20	11.45	\N	MODERADO	Onda de 2.2m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
836	Cascais	2026-10-22 18:00:00+00	2.18	11.45	\N	MODERADO	Onda de 2.18m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
837	Cascais	2026-10-22 19:00:00+00	2.18	11.50	\N	MODERADO	Onda de 2.18m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
838	Cascais	2026-10-22 20:00:00+00	2.16	11.50	\N	MODERADO	Onda de 2.16m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
839	Cascais	2026-10-22 21:00:00+00	2.14	11.50	\N	MODERADO	Onda de 2.14m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
840	Cascais	2026-10-22 22:00:00+00	2.12	11.50	\N	MODERADO	Onda de 2.12m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
841	Cascais	2026-10-22 23:00:00+00	2.10	11.50	\N	MODERADO	Onda de 2.1m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
842	Cascais	2026-10-23 00:00:00+00	2.10	11.45	\N	MODERADO	Onda de 2.1m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
843	Cascais	2026-10-23 01:00:00+00	2.08	11.40	\N	MODERADO	Onda de 2.08m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
844	Cascais	2026-10-23 02:00:00+00	2.08	11.35	\N	MODERADO	Onda de 2.08m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
845	Cascais	2026-10-23 03:00:00+00	2.10	11.25	\N	MODERADO	Onda de 2.1m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
846	Cascais	2026-10-23 04:00:00+00	2.14	11.15	\N	MODERADO	Onda de 2.14m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
847	Cascais	2026-10-23 05:00:00+00	2.16	11.10	\N	MODERADO	Onda de 2.16m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
848	Cascais	2026-10-23 06:00:00+00	2.28	11.15	\N	MODERADO	Onda de 2.28m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
849	Cascais	2026-10-23 07:00:00+00	2.38	11.30	\N	MODERADO	Onda de 2.38m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
850	Cascais	2026-10-23 08:00:00+00	2.50	11.45	\N	MODERADO	Onda de 2.5m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
851	Cascais	2026-10-23 09:00:00+00	2.66	11.70	\N	MODERADO	Onda de 2.66m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
852	Cascais	2026-10-23 10:00:00+00	2.82	12.00	\N	MODERADO	Onda de 2.82m com periodo de 12.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
853	Cascais	2026-10-23 11:00:00+00	2.98	12.20	\N	MODERADO	Onda de 2.98m com periodo de 12.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
854	Cascais	2026-10-23 12:00:00+00	3.08	12.20	\N	ALTO	Onda de 3.08m com periodo de 12.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
855	Cascais	2026-10-23 13:00:00+00	3.20	12.15	\N	ALTO	Onda de 3.2m com periodo de 12.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
856	Cascais	2026-10-23 14:00:00+00	3.30	12.05	\N	ALTO	Onda de 3.3m com periodo de 12.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
857	Cascais	2026-10-23 15:00:00+00	3.30	11.95	\N	ALTO	Onda de 3.3m com periodo de 11.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
858	Cascais	2026-10-23 16:00:00+00	3.30	11.85	\N	ALTO	Onda de 3.3m com periodo de 11.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
859	Cascais	2026-10-23 17:00:00+00	3.30	11.75	\N	ALTO	Onda de 3.3m com periodo de 11.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
860	Cascais	2026-10-23 18:00:00+00	3.26	11.65	\N	ALTO	Onda de 3.26m com periodo de 11.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
861	Cascais	2026-10-23 19:00:00+00	3.20	11.55	\N	ALTO	Onda de 3.2m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
862	Cascais	2026-10-23 20:00:00+00	3.16	11.45	\N	ALTO	Onda de 3.16m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
863	Cascais	2026-10-23 21:00:00+00	3.10	11.40	\N	ALTO	Onda de 3.1m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
864	Cascais	2026-10-23 22:00:00+00	3.06	11.30	\N	ALTO	Onda de 3.06m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
865	Carcavelos	2026-10-21 23:00:00+00	2.30	11.60	\N	MODERADO	Onda de 2.3m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
866	Carcavelos	2026-10-22 00:00:00+00	2.28	11.60	\N	MODERADO	Onda de 2.28m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
867	Carcavelos	2026-10-22 01:00:00+00	2.26	11.60	\N	MODERADO	Onda de 2.26m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
868	Carcavelos	2026-10-22 02:00:00+00	2.24	11.55	\N	MODERADO	Onda de 2.24m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
869	Carcavelos	2026-10-22 03:00:00+00	2.20	11.50	\N	MODERADO	Onda de 2.2m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
870	Carcavelos	2026-10-22 04:00:00+00	2.14	11.50	\N	MODERADO	Onda de 2.14m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
871	Carcavelos	2026-10-22 05:00:00+00	2.10	11.45	\N	MODERADO	Onda de 2.1m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
872	Carcavelos	2026-10-22 06:00:00+00	2.06	11.40	\N	MODERADO	Onda de 2.06m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
873	Carcavelos	2026-10-22 07:00:00+00	2.02	11.40	\N	MODERADO	Onda de 2.02m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
874	Carcavelos	2026-10-22 08:00:00+00	1.98	11.35	\N	MODERADO	Onda de 1.98m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
875	Carcavelos	2026-10-22 09:00:00+00	1.94	11.35	\N	MODERADO	Onda de 1.94m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
876	Carcavelos	2026-10-22 10:00:00+00	1.92	11.30	\N	MODERADO	Onda de 1.92m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
877	Carcavelos	2026-10-22 11:00:00+00	1.88	11.30	\N	MODERADO	Onda de 1.88m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
878	Carcavelos	2026-10-22 12:00:00+00	1.86	11.30	\N	MODERADO	Onda de 1.86m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
879	Carcavelos	2026-10-22 13:00:00+00	1.82	11.35	\N	MODERADO	Onda de 1.82m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
880	Carcavelos	2026-10-22 14:00:00+00	1.80	11.35	\N	MODERADO	Onda de 1.8m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
881	Carcavelos	2026-10-22 15:00:00+00	1.80	11.40	\N	MODERADO	Onda de 1.8m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
882	Carcavelos	2026-10-22 16:00:00+00	1.78	11.40	\N	BAIXO	Onda de 1.78m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
883	Carcavelos	2026-10-22 17:00:00+00	1.78	11.45	\N	BAIXO	Onda de 1.78m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
884	Carcavelos	2026-10-22 18:00:00+00	1.78	11.45	\N	BAIXO	Onda de 1.78m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
885	Carcavelos	2026-10-22 19:00:00+00	1.76	11.45	\N	BAIXO	Onda de 1.76m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
886	Carcavelos	2026-10-22 20:00:00+00	1.76	11.45	\N	BAIXO	Onda de 1.76m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
887	Carcavelos	2026-10-22 21:00:00+00	1.74	11.45	\N	BAIXO	Onda de 1.74m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
888	Carcavelos	2026-10-22 22:00:00+00	1.72	11.45	\N	BAIXO	Onda de 1.72m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
889	Carcavelos	2026-10-22 23:00:00+00	1.70	11.45	\N	BAIXO	Onda de 1.7m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
890	Carcavelos	2026-10-23 00:00:00+00	1.70	11.40	\N	BAIXO	Onda de 1.7m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
891	Carcavelos	2026-10-23 01:00:00+00	1.70	11.35	\N	BAIXO	Onda de 1.7m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
892	Carcavelos	2026-10-23 02:00:00+00	1.70	11.30	\N	BAIXO	Onda de 1.7m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
893	Carcavelos	2026-10-23 03:00:00+00	1.72	11.20	\N	BAIXO	Onda de 1.72m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
894	Carcavelos	2026-10-23 04:00:00+00	1.74	11.10	\N	BAIXO	Onda de 1.74m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
895	Carcavelos	2026-10-23 05:00:00+00	1.76	11.05	\N	BAIXO	Onda de 1.76m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
896	Carcavelos	2026-10-23 06:00:00+00	1.84	11.10	\N	MODERADO	Onda de 1.84m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
897	Carcavelos	2026-10-23 07:00:00+00	1.92	11.20	\N	MODERADO	Onda de 1.92m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
898	Carcavelos	2026-10-23 08:00:00+00	2.00	11.35	\N	MODERADO	Onda de 2.0m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
899	Carcavelos	2026-10-23 09:00:00+00	2.12	11.60	\N	MODERADO	Onda de 2.12m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
900	Carcavelos	2026-10-23 10:00:00+00	2.26	11.85	\N	MODERADO	Onda de 2.26m com periodo de 11.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
901	Carcavelos	2026-10-23 11:00:00+00	2.38	12.05	\N	MODERADO	Onda de 2.38m com periodo de 12.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
902	Carcavelos	2026-10-23 12:00:00+00	2.46	12.05	\N	MODERADO	Onda de 2.46m com periodo de 12.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
903	Carcavelos	2026-10-23 13:00:00+00	2.54	12.00	\N	MODERADO	Onda de 2.54m com periodo de 12.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
904	Carcavelos	2026-10-23 14:00:00+00	2.62	11.90	\N	MODERADO	Onda de 2.62m com periodo de 11.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
905	Carcavelos	2026-10-23 15:00:00+00	2.62	11.80	\N	MODERADO	Onda de 2.62m com periodo de 11.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
906	Carcavelos	2026-10-23 16:00:00+00	2.60	11.70	\N	MODERADO	Onda de 2.6m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
907	Carcavelos	2026-10-23 17:00:00+00	2.60	11.60	\N	MODERADO	Onda de 2.6m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
908	Carcavelos	2026-10-23 18:00:00+00	2.56	11.50	\N	MODERADO	Onda de 2.56m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
909	Carcavelos	2026-10-23 19:00:00+00	2.52	11.45	\N	MODERADO	Onda de 2.52m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
910	Carcavelos	2026-10-23 20:00:00+00	2.48	11.35	\N	MODERADO	Onda de 2.48m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
911	Carcavelos	2026-10-23 21:00:00+00	2.44	11.25	\N	MODERADO	Onda de 2.44m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
912	Carcavelos	2026-10-23 22:00:00+00	2.38	11.20	\N	MODERADO	Onda de 2.38m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
913	Costa da Caparica	2026-10-21 23:00:00+00	2.08	11.50	\N	MODERADO	Onda de 2.08m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
914	Costa da Caparica	2026-10-22 00:00:00+00	2.06	11.50	\N	MODERADO	Onda de 2.06m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
915	Costa da Caparica	2026-10-22 01:00:00+00	2.06	11.50	\N	MODERADO	Onda de 2.06m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
916	Costa da Caparica	2026-10-22 02:00:00+00	2.04	11.45	\N	MODERADO	Onda de 2.04m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
917	Costa da Caparica	2026-10-22 03:00:00+00	2.00	11.45	\N	MODERADO	Onda de 2.0m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
918	Costa da Caparica	2026-10-22 04:00:00+00	1.98	11.40	\N	MODERADO	Onda de 1.98m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
919	Costa da Caparica	2026-10-22 05:00:00+00	1.94	11.40	\N	MODERADO	Onda de 1.94m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
920	Costa da Caparica	2026-10-22 06:00:00+00	1.90	11.35	\N	MODERADO	Onda de 1.9m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
921	Costa da Caparica	2026-10-22 07:00:00+00	1.88	11.35	\N	MODERADO	Onda de 1.88m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
922	Costa da Caparica	2026-10-22 08:00:00+00	1.84	11.30	\N	MODERADO	Onda de 1.84m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
923	Costa da Caparica	2026-10-22 09:00:00+00	1.80	11.25	\N	MODERADO	Onda de 1.8m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
924	Costa da Caparica	2026-10-22 10:00:00+00	1.78	11.20	\N	BAIXO	Onda de 1.78m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
925	Costa da Caparica	2026-10-22 11:00:00+00	1.74	11.20	\N	BAIXO	Onda de 1.74m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
926	Costa da Caparica	2026-10-22 12:00:00+00	1.72	11.20	\N	BAIXO	Onda de 1.72m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
927	Costa da Caparica	2026-10-22 13:00:00+00	1.70	11.20	\N	BAIXO	Onda de 1.7m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
928	Costa da Caparica	2026-10-22 14:00:00+00	1.68	11.25	\N	BAIXO	Onda de 1.68m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
929	Costa da Caparica	2026-10-22 15:00:00+00	1.68	11.30	\N	BAIXO	Onda de 1.68m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
930	Costa da Caparica	2026-10-22 16:00:00+00	1.66	11.30	\N	BAIXO	Onda de 1.66m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
931	Costa da Caparica	2026-10-22 17:00:00+00	1.66	11.35	\N	BAIXO	Onda de 1.66m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
932	Costa da Caparica	2026-10-22 18:00:00+00	1.66	11.35	\N	BAIXO	Onda de 1.66m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
933	Costa da Caparica	2026-10-22 19:00:00+00	1.64	11.40	\N	BAIXO	Onda de 1.64m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
934	Costa da Caparica	2026-10-22 20:00:00+00	1.64	11.40	\N	BAIXO	Onda de 1.64m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
935	Costa da Caparica	2026-10-22 21:00:00+00	1.62	11.40	\N	BAIXO	Onda de 1.62m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
936	Costa da Caparica	2026-10-22 22:00:00+00	1.60	11.35	\N	BAIXO	Onda de 1.6m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
937	Costa da Caparica	2026-10-22 23:00:00+00	1.58	11.35	\N	BAIXO	Onda de 1.58m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
938	Costa da Caparica	2026-10-23 00:00:00+00	1.58	11.30	\N	BAIXO	Onda de 1.58m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
939	Costa da Caparica	2026-10-23 01:00:00+00	1.58	11.30	\N	BAIXO	Onda de 1.58m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
940	Costa da Caparica	2026-10-23 02:00:00+00	1.58	11.25	\N	BAIXO	Onda de 1.58m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
941	Costa da Caparica	2026-10-23 03:00:00+00	1.60	11.20	\N	BAIXO	Onda de 1.6m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
942	Costa da Caparica	2026-10-23 04:00:00+00	1.60	11.10	\N	BAIXO	Onda de 1.6m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
943	Costa da Caparica	2026-10-23 05:00:00+00	1.62	11.05	\N	BAIXO	Onda de 1.62m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
944	Costa da Caparica	2026-10-23 06:00:00+00	1.68	11.05	\N	BAIXO	Onda de 1.68m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
945	Costa da Caparica	2026-10-23 07:00:00+00	1.76	11.10	\N	BAIXO	Onda de 1.76m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
946	Costa da Caparica	2026-10-23 08:00:00+00	1.82	11.20	\N	MODERADO	Onda de 1.82m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
947	Costa da Caparica	2026-10-23 09:00:00+00	1.92	11.40	\N	MODERADO	Onda de 1.92m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
948	Costa da Caparica	2026-10-23 10:00:00+00	2.04	11.65	\N	MODERADO	Onda de 2.04m com periodo de 11.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
949	Costa da Caparica	2026-10-23 11:00:00+00	2.14	11.85	\N	MODERADO	Onda de 2.14m com periodo de 11.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
950	Costa da Caparica	2026-10-23 12:00:00+00	2.22	11.85	\N	MODERADO	Onda de 2.22m com periodo de 11.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
951	Costa da Caparica	2026-10-23 13:00:00+00	2.28	11.80	\N	MODERADO	Onda de 2.28m com periodo de 11.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
952	Costa da Caparica	2026-10-23 14:00:00+00	2.36	11.70	\N	MODERADO	Onda de 2.36m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
953	Costa da Caparica	2026-10-23 15:00:00+00	2.36	11.60	\N	MODERADO	Onda de 2.36m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
954	Costa da Caparica	2026-10-23 16:00:00+00	2.34	11.45	\N	MODERADO	Onda de 2.34m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
955	Costa da Caparica	2026-10-23 17:00:00+00	2.34	11.35	\N	MODERADO	Onda de 2.34m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
956	Costa da Caparica	2026-10-23 18:00:00+00	2.30	11.30	\N	MODERADO	Onda de 2.3m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
957	Costa da Caparica	2026-10-23 19:00:00+00	2.28	11.25	\N	MODERADO	Onda de 2.28m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
958	Costa da Caparica	2026-10-23 20:00:00+00	2.24	11.20	\N	MODERADO	Onda de 2.24m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
959	Costa da Caparica	2026-10-23 21:00:00+00	2.20	11.10	\N	MODERADO	Onda de 2.2m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
960	Costa da Caparica	2026-10-23 22:00:00+00	2.14	11.05	\N	MODERADO	Onda de 2.14m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
961	Sesimbra	2026-10-21 23:00:00+00	2.10	11.30	\N	MODERADO	Onda de 2.1m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
962	Sesimbra	2026-10-22 00:00:00+00	2.10	11.40	\N	MODERADO	Onda de 2.1m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
963	Sesimbra	2026-10-22 01:00:00+00	2.08	11.45	\N	MODERADO	Onda de 2.08m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
964	Sesimbra	2026-10-22 02:00:00+00	2.08	11.45	\N	MODERADO	Onda de 2.08m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
965	Sesimbra	2026-10-22 03:00:00+00	2.06	11.45	\N	MODERADO	Onda de 2.06m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
966	Sesimbra	2026-10-22 04:00:00+00	2.02	11.45	\N	MODERADO	Onda de 2.02m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
967	Sesimbra	2026-10-22 05:00:00+00	2.00	11.45	\N	MODERADO	Onda de 2.0m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
968	Sesimbra	2026-10-22 06:00:00+00	1.96	11.45	\N	MODERADO	Onda de 1.96m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
969	Sesimbra	2026-10-22 07:00:00+00	1.92	11.45	\N	MODERADO	Onda de 1.92m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
970	Sesimbra	2026-10-22 08:00:00+00	1.88	11.40	\N	MODERADO	Onda de 1.88m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
971	Sesimbra	2026-10-22 09:00:00+00	1.84	11.35	\N	MODERADO	Onda de 1.84m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
972	Sesimbra	2026-10-22 10:00:00+00	1.82	11.30	\N	MODERADO	Onda de 1.82m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
973	Sesimbra	2026-10-22 11:00:00+00	1.78	11.20	\N	BAIXO	Onda de 1.78m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
974	Sesimbra	2026-10-22 12:00:00+00	1.76	11.10	\N	BAIXO	Onda de 1.76m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
975	Sesimbra	2026-10-22 13:00:00+00	1.76	11.00	\N	BAIXO	Onda de 1.76m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
976	Sesimbra	2026-10-22 14:00:00+00	1.74	10.95	\N	BAIXO	Onda de 1.74m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
977	Sesimbra	2026-10-22 15:00:00+00	1.72	11.00	\N	BAIXO	Onda de 1.72m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
978	Sesimbra	2026-10-22 16:00:00+00	1.72	11.05	\N	BAIXO	Onda de 1.72m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
979	Sesimbra	2026-10-22 17:00:00+00	1.70	11.15	\N	BAIXO	Onda de 1.7m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
980	Sesimbra	2026-10-22 18:00:00+00	1.68	11.20	\N	BAIXO	Onda de 1.68m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
981	Sesimbra	2026-10-22 19:00:00+00	1.68	11.30	\N	BAIXO	Onda de 1.68m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
982	Sesimbra	2026-10-22 20:00:00+00	1.66	11.35	\N	BAIXO	Onda de 1.66m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
983	Sesimbra	2026-10-22 21:00:00+00	1.64	11.40	\N	BAIXO	Onda de 1.64m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
984	Sesimbra	2026-10-22 22:00:00+00	1.64	11.45	\N	BAIXO	Onda de 1.64m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
985	Sesimbra	2026-10-22 23:00:00+00	1.62	11.45	\N	BAIXO	Onda de 1.62m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
986	Sesimbra	2026-10-23 00:00:00+00	1.60	11.45	\N	BAIXO	Onda de 1.6m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
987	Sesimbra	2026-10-23 01:00:00+00	1.60	11.45	\N	BAIXO	Onda de 1.6m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
988	Sesimbra	2026-10-23 02:00:00+00	1.58	11.45	\N	BAIXO	Onda de 1.58m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
989	Sesimbra	2026-10-23 03:00:00+00	1.58	11.40	\N	BAIXO	Onda de 1.58m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
990	Sesimbra	2026-10-23 04:00:00+00	1.58	11.35	\N	BAIXO	Onda de 1.58m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
991	Sesimbra	2026-10-23 05:00:00+00	1.58	11.30	\N	BAIXO	Onda de 1.58m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
992	Sesimbra	2026-10-23 06:00:00+00	1.62	11.30	\N	BAIXO	Onda de 1.62m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
993	Sesimbra	2026-10-23 07:00:00+00	1.68	11.30	\N	BAIXO	Onda de 1.68m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
994	Sesimbra	2026-10-23 08:00:00+00	1.72	11.35	\N	BAIXO	Onda de 1.72m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
995	Sesimbra	2026-10-23 09:00:00+00	1.84	11.45	\N	MODERADO	Onda de 1.84m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
996	Sesimbra	2026-10-23 10:00:00+00	1.94	11.60	\N	MODERADO	Onda de 1.94m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
997	Sesimbra	2026-10-23 11:00:00+00	2.06	11.70	\N	MODERADO	Onda de 2.06m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
998	Sesimbra	2026-10-23 12:00:00+00	2.16	11.70	\N	MODERADO	Onda de 2.16m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
999	Sesimbra	2026-10-23 13:00:00+00	2.24	11.65	\N	MODERADO	Onda de 2.24m com periodo de 11.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1000	Sesimbra	2026-10-23 14:00:00+00	2.34	11.55	\N	MODERADO	Onda de 2.34m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1001	Sesimbra	2026-10-23 15:00:00+00	2.36	11.40	\N	MODERADO	Onda de 2.36m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1002	Sesimbra	2026-10-23 16:00:00+00	2.38	11.20	\N	MODERADO	Onda de 2.38m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1003	Sesimbra	2026-10-23 17:00:00+00	2.40	11.05	\N	MODERADO	Onda de 2.4m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1004	Sesimbra	2026-10-23 18:00:00+00	2.36	11.00	\N	MODERADO	Onda de 2.36m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1005	Sesimbra	2026-10-23 19:00:00+00	2.32	10.95	\N	MODERADO	Onda de 2.32m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1006	Sesimbra	2026-10-23 20:00:00+00	2.28	10.95	\N	MODERADO	Onda de 2.28m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1007	Sesimbra	2026-10-23 21:00:00+00	2.22	10.90	\N	MODERADO	Onda de 2.22m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1008	Sesimbra	2026-10-23 22:00:00+00	2.18	10.90	\N	MODERADO	Onda de 2.18m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1009	Comporta	2026-10-21 23:00:00+00	1.20	10.35	\N	BAIXO	Onda de 1.2m com periodo de 10.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1010	Comporta	2026-10-22 00:00:00+00	1.20	10.55	\N	BAIXO	Onda de 1.2m com periodo de 10.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1011	Comporta	2026-10-22 01:00:00+00	1.18	10.70	\N	BAIXO	Onda de 1.18m com periodo de 10.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1012	Comporta	2026-10-22 02:00:00+00	1.18	10.80	\N	BAIXO	Onda de 1.18m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1013	Comporta	2026-10-22 03:00:00+00	1.18	10.90	\N	BAIXO	Onda de 1.18m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1014	Comporta	2026-10-22 04:00:00+00	1.16	10.95	\N	BAIXO	Onda de 1.16m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1015	Comporta	2026-10-22 05:00:00+00	1.16	10.95	\N	BAIXO	Onda de 1.16m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1016	Comporta	2026-10-22 06:00:00+00	1.14	10.95	\N	BAIXO	Onda de 1.14m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1017	Comporta	2026-10-22 07:00:00+00	1.12	10.95	\N	BAIXO	Onda de 1.12m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1018	Comporta	2026-10-22 08:00:00+00	1.10	10.90	\N	BAIXO	Onda de 1.1m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1019	Comporta	2026-10-22 09:00:00+00	1.08	10.90	\N	BAIXO	Onda de 1.08m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1020	Comporta	2026-10-22 10:00:00+00	1.06	10.90	\N	BAIXO	Onda de 1.06m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1021	Comporta	2026-10-22 11:00:00+00	1.04	10.80	\N	BAIXO	Onda de 1.04m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1022	Comporta	2026-10-22 12:00:00+00	1.04	10.50	\N	BAIXO	Onda de 1.04m com periodo de 10.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1023	Comporta	2026-10-22 13:00:00+00	1.06	10.15	\N	BAIXO	Onda de 1.06m com periodo de 10.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1024	Comporta	2026-10-22 14:00:00+00	1.06	9.85	\N	BAIXO	Onda de 1.06m com periodo de 9.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1025	Comporta	2026-10-22 15:00:00+00	1.06	9.70	\N	BAIXO	Onda de 1.06m com periodo de 9.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1026	Comporta	2026-10-22 16:00:00+00	1.06	9.65	\N	BAIXO	Onda de 1.06m com periodo de 9.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1027	Comporta	2026-10-22 17:00:00+00	1.06	9.65	\N	BAIXO	Onda de 1.06m com periodo de 9.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1028	Comporta	2026-10-22 18:00:00+00	1.04	9.80	\N	BAIXO	Onda de 1.04m com periodo de 9.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1029	Comporta	2026-10-22 19:00:00+00	1.04	10.05	\N	BAIXO	Onda de 1.04m com periodo de 10.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1030	Comporta	2026-10-22 20:00:00+00	1.02	10.30	\N	BAIXO	Onda de 1.02m com periodo de 10.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1031	Comporta	2026-10-22 21:00:00+00	1.00	10.45	\N	BAIXO	Onda de 1.0m com periodo de 10.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1032	Comporta	2026-10-22 22:00:00+00	0.98	10.60	\N	BAIXO	Onda de 0.98m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1033	Comporta	2026-10-22 23:00:00+00	0.96	10.70	\N	BAIXO	Onda de 0.96m com periodo de 10.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1034	Comporta	2026-10-23 00:00:00+00	0.96	10.75	\N	BAIXO	Onda de 0.96m com periodo de 10.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1035	Comporta	2026-10-23 01:00:00+00	0.94	10.80	\N	BAIXO	Onda de 0.94m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1036	Comporta	2026-10-23 02:00:00+00	0.94	10.80	\N	BAIXO	Onda de 0.94m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1037	Comporta	2026-10-23 03:00:00+00	0.94	10.80	\N	BAIXO	Onda de 0.94m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1038	Comporta	2026-10-23 04:00:00+00	0.94	10.80	\N	BAIXO	Onda de 0.94m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1039	Comporta	2026-10-23 05:00:00+00	0.94	10.80	\N	BAIXO	Onda de 0.94m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1040	Comporta	2026-10-23 06:00:00+00	0.96	10.75	\N	BAIXO	Onda de 0.96m com periodo de 10.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1041	Comporta	2026-10-23 07:00:00+00	0.96	10.70	\N	BAIXO	Onda de 0.96m com periodo de 10.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1042	Comporta	2026-10-23 08:00:00+00	0.98	10.65	\N	BAIXO	Onda de 0.98m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1043	Comporta	2026-10-23 09:00:00+00	1.04	10.65	\N	BAIXO	Onda de 1.04m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1044	Comporta	2026-10-23 10:00:00+00	1.10	10.65	\N	BAIXO	Onda de 1.1m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1045	Comporta	2026-10-23 11:00:00+00	1.16	10.65	\N	BAIXO	Onda de 1.16m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1046	Comporta	2026-10-23 12:00:00+00	1.20	10.75	\N	BAIXO	Onda de 1.2m com periodo de 10.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1047	Comporta	2026-10-23 13:00:00+00	1.26	10.85	\N	BAIXO	Onda de 1.26m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1048	Comporta	2026-10-23 14:00:00+00	1.30	10.85	\N	BAIXO	Onda de 1.3m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1049	Comporta	2026-10-23 15:00:00+00	1.32	10.55	\N	BAIXO	Onda de 1.32m com periodo de 10.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1050	Comporta	2026-10-23 16:00:00+00	1.34	10.15	\N	BAIXO	Onda de 1.34m com periodo de 10.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1051	Comporta	2026-10-23 17:00:00+00	1.36	9.80	\N	BAIXO	Onda de 1.36m com periodo de 9.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1052	Comporta	2026-10-23 18:00:00+00	1.36	9.65	\N	BAIXO	Onda de 1.36m com periodo de 9.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1053	Comporta	2026-10-23 19:00:00+00	1.34	9.65	\N	BAIXO	Onda de 1.34m com periodo de 9.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1054	Comporta	2026-10-23 20:00:00+00	1.34	9.65	\N	BAIXO	Onda de 1.34m com periodo de 9.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1055	Comporta	2026-10-23 21:00:00+00	1.30	9.65	\N	BAIXO	Onda de 1.3m com periodo de 9.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1056	Comporta	2026-10-23 22:00:00+00	1.28	9.70	\N	BAIXO	Onda de 1.28m com periodo de 9.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1057	Sines	2026-10-21 23:00:00+00	2.10	11.10	\N	MODERADO	Onda de 2.1m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1058	Sines	2026-10-22 00:00:00+00	2.12	11.25	\N	MODERADO	Onda de 2.12m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1059	Sines	2026-10-22 01:00:00+00	2.12	11.35	\N	MODERADO	Onda de 2.12m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1060	Sines	2026-10-22 02:00:00+00	2.14	11.40	\N	MODERADO	Onda de 2.14m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1061	Sines	2026-10-22 03:00:00+00	2.12	11.45	\N	MODERADO	Onda de 2.12m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1062	Sines	2026-10-22 04:00:00+00	2.12	11.45	\N	MODERADO	Onda de 2.12m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1063	Sines	2026-10-22 05:00:00+00	2.10	11.45	\N	MODERADO	Onda de 2.1m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1064	Sines	2026-10-22 06:00:00+00	2.06	11.45	\N	MODERADO	Onda de 2.06m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1065	Sines	2026-10-22 07:00:00+00	2.02	11.40	\N	MODERADO	Onda de 2.02m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1066	Sines	2026-10-22 08:00:00+00	1.98	11.40	\N	MODERADO	Onda de 1.98m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1067	Sines	2026-10-22 09:00:00+00	1.94	11.35	\N	MODERADO	Onda de 1.94m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1068	Sines	2026-10-22 10:00:00+00	1.90	11.35	\N	MODERADO	Onda de 1.9m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1069	Sines	2026-10-22 11:00:00+00	1.86	11.30	\N	MODERADO	Onda de 1.86m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1070	Sines	2026-10-22 12:00:00+00	1.84	11.25	\N	MODERADO	Onda de 1.84m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1071	Sines	2026-10-22 13:00:00+00	1.82	11.15	\N	MODERADO	Onda de 1.82m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1072	Sines	2026-10-22 14:00:00+00	1.80	11.10	\N	MODERADO	Onda de 1.8m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1073	Sines	2026-10-22 15:00:00+00	1.78	11.05	\N	BAIXO	Onda de 1.78m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1074	Sines	2026-10-22 16:00:00+00	1.78	11.00	\N	BAIXO	Onda de 1.78m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1075	Sines	2026-10-22 17:00:00+00	1.76	11.00	\N	BAIXO	Onda de 1.76m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1076	Sines	2026-10-22 18:00:00+00	1.74	11.05	\N	BAIXO	Onda de 1.74m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1077	Sines	2026-10-22 19:00:00+00	1.74	11.10	\N	BAIXO	Onda de 1.74m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1078	Sines	2026-10-22 20:00:00+00	1.72	11.20	\N	BAIXO	Onda de 1.72m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1079	Sines	2026-10-22 21:00:00+00	1.72	11.30	\N	BAIXO	Onda de 1.72m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1080	Sines	2026-10-22 22:00:00+00	1.70	11.40	\N	BAIXO	Onda de 1.7m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1081	Sines	2026-10-22 23:00:00+00	1.70	11.45	\N	BAIXO	Onda de 1.7m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1082	Sines	2026-10-23 00:00:00+00	1.68	11.50	\N	BAIXO	Onda de 1.68m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1083	Sines	2026-10-23 01:00:00+00	1.66	11.50	\N	BAIXO	Onda de 1.66m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1084	Sines	2026-10-23 02:00:00+00	1.64	11.50	\N	BAIXO	Onda de 1.64m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1085	Sines	2026-10-23 03:00:00+00	1.64	11.50	\N	BAIXO	Onda de 1.64m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1086	Sines	2026-10-23 04:00:00+00	1.62	11.50	\N	BAIXO	Onda de 1.62m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1087	Sines	2026-10-23 05:00:00+00	1.62	11.50	\N	BAIXO	Onda de 1.62m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1088	Sines	2026-10-23 06:00:00+00	1.64	11.50	\N	BAIXO	Onda de 1.64m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1089	Sines	2026-10-23 07:00:00+00	1.66	11.50	\N	BAIXO	Onda de 1.66m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1090	Sines	2026-10-23 08:00:00+00	1.68	11.55	\N	BAIXO	Onda de 1.68m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1091	Sines	2026-10-23 09:00:00+00	1.76	11.60	\N	BAIXO	Onda de 1.76m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1092	Sines	2026-10-23 10:00:00+00	1.84	11.65	\N	MODERADO	Onda de 1.84m com periodo de 11.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1093	Sines	2026-10-23 11:00:00+00	1.92	11.70	\N	MODERADO	Onda de 1.92m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1094	Sines	2026-10-23 12:00:00+00	2.02	11.80	\N	MODERADO	Onda de 2.02m com periodo de 11.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1095	Sines	2026-10-23 13:00:00+00	2.14	11.85	\N	MODERADO	Onda de 2.14m com periodo de 11.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1096	Sines	2026-10-23 14:00:00+00	2.24	11.85	\N	MODERADO	Onda de 2.24m com periodo de 11.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1097	Sines	2026-10-23 15:00:00+00	2.28	11.70	\N	MODERADO	Onda de 2.28m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1098	Sines	2026-10-23 16:00:00+00	2.32	11.50	\N	MODERADO	Onda de 2.32m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1099	Sines	2026-10-23 17:00:00+00	2.36	11.30	\N	MODERADO	Onda de 2.36m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1100	Sines	2026-10-23 18:00:00+00	2.36	11.10	\N	MODERADO	Onda de 2.36m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1101	Sines	2026-10-23 19:00:00+00	2.36	10.90	\N	MODERADO	Onda de 2.36m com periodo de 10.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1102	Sines	2026-10-23 20:00:00+00	2.36	10.75	\N	MODERADO	Onda de 2.36m com periodo de 10.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1103	Sines	2026-10-23 21:00:00+00	2.32	10.70	\N	MODERADO	Onda de 2.32m com periodo de 10.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1104	Sines	2026-10-23 22:00:00+00	2.26	10.65	\N	MODERADO	Onda de 2.26m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1105	Vila Nova de Milfontes	2026-10-21 23:00:00+00	2.18	11.20	\N	MODERADO	Onda de 2.18m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1106	Vila Nova de Milfontes	2026-10-22 00:00:00+00	2.22	11.35	\N	MODERADO	Onda de 2.22m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1107	Vila Nova de Milfontes	2026-10-22 01:00:00+00	2.26	11.45	\N	MODERADO	Onda de 2.26m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1108	Vila Nova de Milfontes	2026-10-22 02:00:00+00	2.30	11.50	\N	MODERADO	Onda de 2.3m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1109	Vila Nova de Milfontes	2026-10-22 03:00:00+00	2.30	11.55	\N	MODERADO	Onda de 2.3m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1110	Vila Nova de Milfontes	2026-10-22 04:00:00+00	2.28	11.55	\N	MODERADO	Onda de 2.28m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1111	Vila Nova de Milfontes	2026-10-22 05:00:00+00	2.28	11.55	\N	MODERADO	Onda de 2.28m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1112	Vila Nova de Milfontes	2026-10-22 06:00:00+00	2.24	11.55	\N	MODERADO	Onda de 2.24m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1113	Vila Nova de Milfontes	2026-10-22 07:00:00+00	2.18	11.55	\N	MODERADO	Onda de 2.18m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1114	Vila Nova de Milfontes	2026-10-22 08:00:00+00	2.14	11.50	\N	MODERADO	Onda de 2.14m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1115	Vila Nova de Milfontes	2026-10-22 09:00:00+00	2.10	11.45	\N	MODERADO	Onda de 2.1m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1116	Vila Nova de Milfontes	2026-10-22 10:00:00+00	2.06	11.40	\N	MODERADO	Onda de 2.06m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1117	Vila Nova de Milfontes	2026-10-22 11:00:00+00	2.02	11.35	\N	MODERADO	Onda de 2.02m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1118	Vila Nova de Milfontes	2026-10-22 12:00:00+00	2.00	11.30	\N	MODERADO	Onda de 2.0m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1119	Vila Nova de Milfontes	2026-10-22 13:00:00+00	1.96	11.25	\N	MODERADO	Onda de 1.96m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1120	Vila Nova de Milfontes	2026-10-22 14:00:00+00	1.94	11.20	\N	MODERADO	Onda de 1.94m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1121	Vila Nova de Milfontes	2026-10-22 15:00:00+00	1.92	11.15	\N	MODERADO	Onda de 1.92m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1122	Vila Nova de Milfontes	2026-10-22 16:00:00+00	1.90	11.15	\N	MODERADO	Onda de 1.9m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1123	Vila Nova de Milfontes	2026-10-22 17:00:00+00	1.88	11.15	\N	MODERADO	Onda de 1.88m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1124	Vila Nova de Milfontes	2026-10-22 18:00:00+00	1.86	11.15	\N	MODERADO	Onda de 1.86m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1125	Vila Nova de Milfontes	2026-10-22 19:00:00+00	1.86	11.20	\N	MODERADO	Onda de 1.86m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1126	Vila Nova de Milfontes	2026-10-22 20:00:00+00	1.84	11.25	\N	MODERADO	Onda de 1.84m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1127	Vila Nova de Milfontes	2026-10-22 21:00:00+00	1.84	11.30	\N	MODERADO	Onda de 1.84m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1128	Vila Nova de Milfontes	2026-10-22 22:00:00+00	1.82	11.40	\N	MODERADO	Onda de 1.82m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1129	Vila Nova de Milfontes	2026-10-22 23:00:00+00	1.82	11.45	\N	MODERADO	Onda de 1.82m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1130	Vila Nova de Milfontes	2026-10-23 00:00:00+00	1.80	11.50	\N	MODERADO	Onda de 1.8m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1131	Vila Nova de Milfontes	2026-10-23 01:00:00+00	1.80	11.55	\N	MODERADO	Onda de 1.8m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1132	Vila Nova de Milfontes	2026-10-23 02:00:00+00	1.78	11.55	\N	BAIXO	Onda de 1.78m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1133	Vila Nova de Milfontes	2026-10-23 03:00:00+00	1.76	11.55	\N	BAIXO	Onda de 1.76m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1134	Vila Nova de Milfontes	2026-10-23 04:00:00+00	1.76	11.55	\N	BAIXO	Onda de 1.76m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1135	Vila Nova de Milfontes	2026-10-23 05:00:00+00	1.74	11.55	\N	BAIXO	Onda de 1.74m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1136	Vila Nova de Milfontes	2026-10-23 06:00:00+00	1.74	11.55	\N	BAIXO	Onda de 1.74m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1137	Vila Nova de Milfontes	2026-10-23 07:00:00+00	1.76	11.55	\N	BAIXO	Onda de 1.76m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1138	Vila Nova de Milfontes	2026-10-23 08:00:00+00	1.76	11.60	\N	BAIXO	Onda de 1.76m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1139	Vila Nova de Milfontes	2026-10-23 09:00:00+00	1.82	11.65	\N	MODERADO	Onda de 1.82m com periodo de 11.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1140	Vila Nova de Milfontes	2026-10-23 10:00:00+00	1.90	11.75	\N	MODERADO	Onda de 1.9m com periodo de 11.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1141	Vila Nova de Milfontes	2026-10-23 11:00:00+00	1.96	11.85	\N	MODERADO	Onda de 1.96m com periodo de 11.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1142	Vila Nova de Milfontes	2026-10-23 12:00:00+00	2.08	11.90	\N	MODERADO	Onda de 2.08m com periodo de 11.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1143	Vila Nova de Milfontes	2026-10-23 13:00:00+00	2.20	11.95	\N	MODERADO	Onda de 2.2m com periodo de 11.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1144	Vila Nova de Milfontes	2026-10-23 14:00:00+00	2.32	11.95	\N	MODERADO	Onda de 2.32m com periodo de 11.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1145	Vila Nova de Milfontes	2026-10-23 15:00:00+00	2.38	11.90	\N	MODERADO	Onda de 2.38m com periodo de 11.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1146	Vila Nova de Milfontes	2026-10-23 16:00:00+00	2.42	11.80	\N	MODERADO	Onda de 2.42m com periodo de 11.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1147	Vila Nova de Milfontes	2026-10-23 17:00:00+00	2.48	11.65	\N	MODERADO	Onda de 2.48m com periodo de 11.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1148	Vila Nova de Milfontes	2026-10-23 18:00:00+00	2.50	11.45	\N	MODERADO	Onda de 2.5m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1149	Vila Nova de Milfontes	2026-10-23 19:00:00+00	2.50	11.15	\N	MODERADO	Onda de 2.5m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1150	Vila Nova de Milfontes	2026-10-23 20:00:00+00	2.52	10.95	\N	MODERADO	Onda de 2.52m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1151	Vila Nova de Milfontes	2026-10-23 21:00:00+00	2.48	10.85	\N	MODERADO	Onda de 2.48m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1152	Vila Nova de Milfontes	2026-10-23 22:00:00+00	2.42	10.80	\N	MODERADO	Onda de 2.42m com periodo de 10.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1153	Zambujeira do Mar	2026-10-21 23:00:00+00	2.20	11.20	\N	MODERADO	Onda de 2.2m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1154	Zambujeira do Mar	2026-10-22 00:00:00+00	2.26	11.35	\N	MODERADO	Onda de 2.26m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1155	Zambujeira do Mar	2026-10-22 01:00:00+00	2.30	11.50	\N	MODERADO	Onda de 2.3m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1156	Zambujeira do Mar	2026-10-22 02:00:00+00	2.36	11.55	\N	MODERADO	Onda de 2.36m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1157	Zambujeira do Mar	2026-10-22 03:00:00+00	2.36	11.60	\N	MODERADO	Onda de 2.36m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1158	Zambujeira do Mar	2026-10-22 04:00:00+00	2.34	11.60	\N	MODERADO	Onda de 2.34m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1159	Zambujeira do Mar	2026-10-22 05:00:00+00	2.34	11.60	\N	MODERADO	Onda de 2.34m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1160	Zambujeira do Mar	2026-10-22 06:00:00+00	2.30	11.60	\N	MODERADO	Onda de 2.3m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1161	Zambujeira do Mar	2026-10-22 07:00:00+00	2.28	11.55	\N	MODERADO	Onda de 2.28m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1162	Zambujeira do Mar	2026-10-22 08:00:00+00	2.24	11.50	\N	MODERADO	Onda de 2.24m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1163	Zambujeira do Mar	2026-10-22 09:00:00+00	2.20	11.50	\N	MODERADO	Onda de 2.2m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1164	Zambujeira do Mar	2026-10-22 10:00:00+00	2.14	11.50	\N	MODERADO	Onda de 2.14m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1165	Zambujeira do Mar	2026-10-22 11:00:00+00	2.10	11.45	\N	MODERADO	Onda de 2.1m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1166	Zambujeira do Mar	2026-10-22 12:00:00+00	2.08	11.40	\N	MODERADO	Onda de 2.08m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1167	Zambujeira do Mar	2026-10-22 13:00:00+00	2.04	11.30	\N	MODERADO	Onda de 2.04m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1168	Zambujeira do Mar	2026-10-22 14:00:00+00	2.02	11.25	\N	MODERADO	Onda de 2.02m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1169	Zambujeira do Mar	2026-10-22 15:00:00+00	2.00	11.20	\N	MODERADO	Onda de 2.0m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1170	Zambujeira do Mar	2026-10-22 16:00:00+00	1.98	11.20	\N	MODERADO	Onda de 1.98m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1171	Zambujeira do Mar	2026-10-22 17:00:00+00	1.96	11.20	\N	MODERADO	Onda de 1.96m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1172	Zambujeira do Mar	2026-10-22 18:00:00+00	1.94	11.20	\N	MODERADO	Onda de 1.94m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1173	Zambujeira do Mar	2026-10-22 19:00:00+00	1.92	11.25	\N	MODERADO	Onda de 1.92m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1174	Zambujeira do Mar	2026-10-22 20:00:00+00	1.90	11.30	\N	MODERADO	Onda de 1.9m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1175	Zambujeira do Mar	2026-10-22 21:00:00+00	1.90	11.35	\N	MODERADO	Onda de 1.9m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1176	Zambujeira do Mar	2026-10-22 22:00:00+00	1.88	11.35	\N	MODERADO	Onda de 1.88m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1177	Zambujeira do Mar	2026-10-22 23:00:00+00	1.88	11.40	\N	MODERADO	Onda de 1.88m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1178	Zambujeira do Mar	2026-10-23 00:00:00+00	1.86	11.45	\N	MODERADO	Onda de 1.86m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1179	Zambujeira do Mar	2026-10-23 01:00:00+00	1.86	11.45	\N	MODERADO	Onda de 1.86m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1180	Zambujeira do Mar	2026-10-23 02:00:00+00	1.84	11.50	\N	MODERADO	Onda de 1.84m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1181	Zambujeira do Mar	2026-10-23 03:00:00+00	1.82	11.50	\N	MODERADO	Onda de 1.82m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1182	Zambujeira do Mar	2026-10-23 04:00:00+00	1.82	11.55	\N	MODERADO	Onda de 1.82m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1183	Zambujeira do Mar	2026-10-23 05:00:00+00	1.80	11.55	\N	MODERADO	Onda de 1.8m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1184	Zambujeira do Mar	2026-10-23 06:00:00+00	1.80	11.55	\N	MODERADO	Onda de 1.8m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1185	Zambujeira do Mar	2026-10-23 07:00:00+00	1.80	11.55	\N	MODERADO	Onda de 1.8m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1186	Zambujeira do Mar	2026-10-23 08:00:00+00	1.80	11.60	\N	MODERADO	Onda de 1.8m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1187	Zambujeira do Mar	2026-10-23 09:00:00+00	1.86	11.70	\N	MODERADO	Onda de 1.86m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1188	Zambujeira do Mar	2026-10-23 10:00:00+00	1.90	11.85	\N	MODERADO	Onda de 1.9m com periodo de 11.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1189	Zambujeira do Mar	2026-10-23 11:00:00+00	1.96	11.95	\N	MODERADO	Onda de 1.96m com periodo de 11.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1190	Zambujeira do Mar	2026-10-23 12:00:00+00	2.08	12.05	\N	MODERADO	Onda de 2.08m com periodo de 12.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1191	Zambujeira do Mar	2026-10-23 13:00:00+00	2.22	12.10	\N	MODERADO	Onda de 2.22m com periodo de 12.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1192	Zambujeira do Mar	2026-10-23 14:00:00+00	2.34	12.10	\N	MODERADO	Onda de 2.34m com periodo de 12.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1193	Zambujeira do Mar	2026-10-23 15:00:00+00	2.40	12.05	\N	MODERADO	Onda de 2.4m com periodo de 12.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1194	Zambujeira do Mar	2026-10-23 16:00:00+00	2.48	12.00	\N	MODERADO	Onda de 2.48m com periodo de 12.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1195	Zambujeira do Mar	2026-10-23 17:00:00+00	2.54	11.85	\N	MODERADO	Onda de 2.54m com periodo de 11.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1196	Zambujeira do Mar	2026-10-23 18:00:00+00	2.56	11.65	\N	MODERADO	Onda de 2.56m com periodo de 11.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1197	Zambujeira do Mar	2026-10-23 19:00:00+00	2.58	11.35	\N	MODERADO	Onda de 2.58m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1198	Zambujeira do Mar	2026-10-23 20:00:00+00	2.60	11.15	\N	MODERADO	Onda de 2.6m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1199	Zambujeira do Mar	2026-10-23 21:00:00+00	2.56	11.05	\N	MODERADO	Onda de 2.56m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1200	Zambujeira do Mar	2026-10-23 22:00:00+00	2.52	10.95	\N	MODERADO	Onda de 2.52m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1201	Arrifana	2026-10-21 23:00:00+00	2.30	11.30	\N	MODERADO	Onda de 2.3m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1202	Arrifana	2026-10-22 00:00:00+00	2.38	11.45	\N	MODERADO	Onda de 2.38m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1203	Arrifana	2026-10-22 01:00:00+00	2.46	11.55	\N	MODERADO	Onda de 2.46m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1204	Arrifana	2026-10-22 02:00:00+00	2.54	11.60	\N	MODERADO	Onda de 2.54m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1205	Arrifana	2026-10-22 03:00:00+00	2.54	11.65	\N	MODERADO	Onda de 2.54m com periodo de 11.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1206	Arrifana	2026-10-22 04:00:00+00	2.54	11.70	\N	MODERADO	Onda de 2.54m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1207	Arrifana	2026-10-22 05:00:00+00	2.54	11.70	\N	MODERADO	Onda de 2.54m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1208	Arrifana	2026-10-22 06:00:00+00	2.50	11.70	\N	MODERADO	Onda de 2.5m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1209	Arrifana	2026-10-22 07:00:00+00	2.46	11.65	\N	MODERADO	Onda de 2.46m com periodo de 11.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1210	Arrifana	2026-10-22 08:00:00+00	2.42	11.60	\N	MODERADO	Onda de 2.42m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1211	Arrifana	2026-10-22 09:00:00+00	2.38	11.55	\N	MODERADO	Onda de 2.38m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1212	Arrifana	2026-10-22 10:00:00+00	2.34	11.50	\N	MODERADO	Onda de 2.34m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1213	Arrifana	2026-10-22 11:00:00+00	2.30	11.45	\N	MODERADO	Onda de 2.3m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1214	Arrifana	2026-10-22 12:00:00+00	2.26	11.40	\N	MODERADO	Onda de 2.26m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1215	Arrifana	2026-10-22 13:00:00+00	2.22	11.35	\N	MODERADO	Onda de 2.22m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1216	Arrifana	2026-10-22 14:00:00+00	2.18	11.30	\N	MODERADO	Onda de 2.18m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1217	Arrifana	2026-10-22 15:00:00+00	2.16	11.25	\N	MODERADO	Onda de 2.16m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1218	Arrifana	2026-10-22 16:00:00+00	2.12	11.20	\N	MODERADO	Onda de 2.12m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1219	Arrifana	2026-10-22 17:00:00+00	2.10	11.20	\N	MODERADO	Onda de 2.1m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1220	Arrifana	2026-10-22 18:00:00+00	2.08	11.20	\N	MODERADO	Onda de 2.08m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1221	Arrifana	2026-10-22 19:00:00+00	2.08	11.25	\N	MODERADO	Onda de 2.08m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1222	Arrifana	2026-10-22 20:00:00+00	2.06	11.30	\N	MODERADO	Onda de 2.06m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1223	Arrifana	2026-10-22 21:00:00+00	2.04	11.35	\N	MODERADO	Onda de 2.04m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1224	Arrifana	2026-10-22 22:00:00+00	2.04	11.40	\N	MODERADO	Onda de 2.04m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1225	Arrifana	2026-10-22 23:00:00+00	2.02	11.45	\N	MODERADO	Onda de 2.02m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1226	Arrifana	2026-10-23 00:00:00+00	2.00	11.50	\N	MODERADO	Onda de 2.0m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1227	Arrifana	2026-10-23 01:00:00+00	1.98	11.50	\N	MODERADO	Onda de 1.98m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1228	Arrifana	2026-10-23 02:00:00+00	1.96	11.55	\N	MODERADO	Onda de 1.96m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1229	Arrifana	2026-10-23 03:00:00+00	1.94	11.55	\N	MODERADO	Onda de 1.94m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1230	Arrifana	2026-10-23 04:00:00+00	1.94	11.60	\N	MODERADO	Onda de 1.94m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1231	Arrifana	2026-10-23 05:00:00+00	1.92	11.60	\N	MODERADO	Onda de 1.92m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1232	Arrifana	2026-10-23 06:00:00+00	1.92	11.60	\N	MODERADO	Onda de 1.92m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1233	Arrifana	2026-10-23 07:00:00+00	1.90	11.65	\N	MODERADO	Onda de 1.9m com periodo de 11.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1234	Arrifana	2026-10-23 08:00:00+00	1.90	11.70	\N	MODERADO	Onda de 1.9m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1235	Arrifana	2026-10-23 09:00:00+00	1.96	11.80	\N	MODERADO	Onda de 1.96m com periodo de 11.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1236	Arrifana	2026-10-23 10:00:00+00	2.00	11.90	\N	MODERADO	Onda de 2.0m com periodo de 11.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1237	Arrifana	2026-10-23 11:00:00+00	2.06	12.00	\N	MODERADO	Onda de 2.06m com periodo de 12.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1238	Arrifana	2026-10-23 12:00:00+00	2.18	12.15	\N	MODERADO	Onda de 2.18m com periodo de 12.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1239	Arrifana	2026-10-23 13:00:00+00	2.30	12.30	\N	MODERADO	Onda de 2.3m com periodo de 12.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1240	Arrifana	2026-10-23 14:00:00+00	2.42	12.35	\N	MODERADO	Onda de 2.42m com periodo de 12.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1241	Arrifana	2026-10-23 15:00:00+00	2.52	12.30	\N	MODERADO	Onda de 2.52m com periodo de 12.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1242	Arrifana	2026-10-23 16:00:00+00	2.62	12.20	\N	MODERADO	Onda de 2.62m com periodo de 12.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1243	Arrifana	2026-10-23 17:00:00+00	2.72	12.05	\N	MODERADO	Onda de 2.72m com periodo de 12.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1244	Arrifana	2026-10-23 18:00:00+00	2.76	11.85	\N	MODERADO	Onda de 2.76m com periodo de 11.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1245	Arrifana	2026-10-23 19:00:00+00	2.78	11.55	\N	MODERADO	Onda de 2.78m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1246	Arrifana	2026-10-23 20:00:00+00	2.82	11.35	\N	MODERADO	Onda de 2.82m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1247	Arrifana	2026-10-23 21:00:00+00	2.78	11.20	\N	MODERADO	Onda de 2.78m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1248	Arrifana	2026-10-23 22:00:00+00	2.76	11.10	\N	MODERADO	Onda de 2.76m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1249	Sagres	2026-10-21 23:00:00+00	2.26	11.05	\N	MODERADO	Onda de 2.26m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1250	Sagres	2026-10-22 00:00:00+00	2.36	11.20	\N	MODERADO	Onda de 2.36m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1251	Sagres	2026-10-22 01:00:00+00	2.48	11.35	\N	MODERADO	Onda de 2.48m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1252	Sagres	2026-10-22 02:00:00+00	2.58	11.45	\N	MODERADO	Onda de 2.58m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1253	Sagres	2026-10-22 03:00:00+00	2.60	11.55	\N	MODERADO	Onda de 2.6m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1254	Sagres	2026-10-22 04:00:00+00	2.60	11.60	\N	MODERADO	Onda de 2.6m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1255	Sagres	2026-10-22 05:00:00+00	2.62	11.60	\N	MODERADO	Onda de 2.62m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1256	Sagres	2026-10-22 06:00:00+00	2.60	11.60	\N	MODERADO	Onda de 2.6m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1257	Sagres	2026-10-22 07:00:00+00	2.56	11.55	\N	MODERADO	Onda de 2.56m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1258	Sagres	2026-10-22 08:00:00+00	2.54	11.50	\N	MODERADO	Onda de 2.54m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1259	Sagres	2026-10-22 09:00:00+00	2.48	11.45	\N	MODERADO	Onda de 2.48m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1260	Sagres	2026-10-22 10:00:00+00	2.44	11.40	\N	MODERADO	Onda de 2.44m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1261	Sagres	2026-10-22 11:00:00+00	2.38	11.35	\N	MODERADO	Onda de 2.38m com periodo de 11.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1262	Sagres	2026-10-22 12:00:00+00	2.36	11.25	\N	MODERADO	Onda de 2.36m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1263	Sagres	2026-10-22 13:00:00+00	2.32	11.10	\N	MODERADO	Onda de 2.32m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1264	Sagres	2026-10-22 14:00:00+00	2.30	11.00	\N	MODERADO	Onda de 2.3m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1265	Sagres	2026-10-22 15:00:00+00	2.26	10.95	\N	MODERADO	Onda de 2.26m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1266	Sagres	2026-10-22 16:00:00+00	2.24	11.00	\N	MODERADO	Onda de 2.24m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1267	Sagres	2026-10-22 17:00:00+00	2.20	11.00	\N	MODERADO	Onda de 2.2m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1268	Sagres	2026-10-22 18:00:00+00	2.18	11.05	\N	MODERADO	Onda de 2.18m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1269	Sagres	2026-10-22 19:00:00+00	2.14	11.10	\N	MODERADO	Onda de 2.14m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1270	Sagres	2026-10-22 20:00:00+00	2.12	11.15	\N	MODERADO	Onda de 2.12m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1271	Sagres	2026-10-22 21:00:00+00	2.12	11.20	\N	MODERADO	Onda de 2.12m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1272	Sagres	2026-10-22 22:00:00+00	2.10	11.20	\N	MODERADO	Onda de 2.1m com periodo de 11.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1273	Sagres	2026-10-22 23:00:00+00	2.10	11.25	\N	MODERADO	Onda de 2.1m com periodo de 11.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1274	Sagres	2026-10-23 00:00:00+00	2.08	11.30	\N	MODERADO	Onda de 2.08m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1275	Sagres	2026-10-23 01:00:00+00	2.06	11.40	\N	MODERADO	Onda de 2.06m com periodo de 11.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1276	Sagres	2026-10-23 02:00:00+00	2.04	11.45	\N	MODERADO	Onda de 2.04m com periodo de 11.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1277	Sagres	2026-10-23 03:00:00+00	2.02	11.50	\N	MODERADO	Onda de 2.02m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1278	Sagres	2026-10-23 04:00:00+00	2.00	11.55	\N	MODERADO	Onda de 2.0m com periodo de 11.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1279	Sagres	2026-10-23 05:00:00+00	1.98	11.60	\N	MODERADO	Onda de 1.98m com periodo de 11.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1280	Sagres	2026-10-23 06:00:00+00	1.96	11.65	\N	MODERADO	Onda de 1.96m com periodo de 11.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1281	Sagres	2026-10-23 07:00:00+00	1.96	11.65	\N	MODERADO	Onda de 1.96m com periodo de 11.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1282	Sagres	2026-10-23 08:00:00+00	1.94	11.70	\N	MODERADO	Onda de 1.94m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1283	Sagres	2026-10-23 09:00:00+00	1.96	11.75	\N	MODERADO	Onda de 1.96m com periodo de 11.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1284	Sagres	2026-10-23 10:00:00+00	2.00	11.80	\N	MODERADO	Onda de 2.0m com periodo de 11.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1285	Sagres	2026-10-23 11:00:00+00	2.02	11.90	\N	MODERADO	Onda de 2.02m com periodo de 11.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1286	Sagres	2026-10-23 12:00:00+00	2.12	12.05	\N	MODERADO	Onda de 2.12m com periodo de 12.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1287	Sagres	2026-10-23 13:00:00+00	2.24	12.20	\N	MODERADO	Onda de 2.24m com periodo de 12.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1288	Sagres	2026-10-23 14:00:00+00	2.34	12.30	\N	MODERADO	Onda de 2.34m com periodo de 12.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1289	Sagres	2026-10-23 15:00:00+00	2.48	12.25	\N	MODERADO	Onda de 2.48m com periodo de 12.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1290	Sagres	2026-10-23 16:00:00+00	2.60	12.10	\N	MODERADO	Onda de 2.6m com periodo de 12.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1291	Sagres	2026-10-23 17:00:00+00	2.74	11.90	\N	MODERADO	Onda de 2.74m com periodo de 11.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1292	Sagres	2026-10-23 18:00:00+00	2.80	11.70	\N	MODERADO	Onda de 2.8m com periodo de 11.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1293	Sagres	2026-10-23 19:00:00+00	2.84	11.50	\N	MODERADO	Onda de 2.84m com periodo de 11.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1294	Sagres	2026-10-23 20:00:00+00	2.90	11.30	\N	MODERADO	Onda de 2.9m com periodo de 11.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1295	Sagres	2026-10-23 21:00:00+00	2.88	11.15	\N	MODERADO	Onda de 2.88m com periodo de 11.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1296	Sagres	2026-10-23 22:00:00+00	2.88	11.10	\N	MODERADO	Onda de 2.88m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1297	Lagos	2026-10-21 23:00:00+00	0.98	9.75	\N	BAIXO	Onda de 0.98m com periodo de 9.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1298	Lagos	2026-10-22 00:00:00+00	1.02	10.00	\N	BAIXO	Onda de 1.02m com periodo de 10.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1299	Lagos	2026-10-22 01:00:00+00	1.06	10.25	\N	BAIXO	Onda de 1.06m com periodo de 10.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1300	Lagos	2026-10-22 02:00:00+00	1.10	10.50	\N	BAIXO	Onda de 1.1m com periodo de 10.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1301	Lagos	2026-10-22 03:00:00+00	1.12	10.60	\N	BAIXO	Onda de 1.12m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1302	Lagos	2026-10-22 04:00:00+00	1.12	10.65	\N	BAIXO	Onda de 1.12m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1303	Lagos	2026-10-22 05:00:00+00	1.14	10.65	\N	BAIXO	Onda de 1.14m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1304	Lagos	2026-10-22 06:00:00+00	1.12	10.65	\N	BAIXO	Onda de 1.12m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1305	Lagos	2026-10-22 07:00:00+00	1.12	10.65	\N	BAIXO	Onda de 1.12m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1306	Lagos	2026-10-22 08:00:00+00	1.10	10.65	\N	BAIXO	Onda de 1.1m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1307	Lagos	2026-10-22 09:00:00+00	1.08	10.65	\N	BAIXO	Onda de 1.08m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1308	Lagos	2026-10-22 10:00:00+00	1.06	10.60	\N	BAIXO	Onda de 1.06m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1309	Lagos	2026-10-22 11:00:00+00	1.04	10.50	\N	BAIXO	Onda de 1.04m com periodo de 10.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1310	Lagos	2026-10-22 12:00:00+00	1.04	10.20	\N	BAIXO	Onda de 1.04m com periodo de 10.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1311	Lagos	2026-10-22 13:00:00+00	1.06	9.75	\N	BAIXO	Onda de 1.06m com periodo de 9.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1312	Lagos	2026-10-22 14:00:00+00	1.06	9.45	\N	BAIXO	Onda de 1.06m com periodo de 9.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1313	Lagos	2026-10-22 15:00:00+00	1.04	9.30	\N	BAIXO	Onda de 1.04m com periodo de 9.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1314	Lagos	2026-10-22 16:00:00+00	1.04	9.20	\N	BAIXO	Onda de 1.04m com periodo de 9.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1315	Lagos	2026-10-22 17:00:00+00	1.02	9.20	\N	BAIXO	Onda de 1.02m com periodo de 9.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1316	Lagos	2026-10-22 18:00:00+00	1.00	9.35	\N	BAIXO	Onda de 1.0m com periodo de 9.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1317	Lagos	2026-10-22 19:00:00+00	0.98	9.60	\N	BAIXO	Onda de 0.98m com periodo de 9.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1318	Lagos	2026-10-22 20:00:00+00	0.96	9.80	\N	BAIXO	Onda de 0.96m com periodo de 9.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1319	Lagos	2026-10-22 21:00:00+00	0.96	9.95	\N	BAIXO	Onda de 0.96m com periodo de 9.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1320	Lagos	2026-10-22 22:00:00+00	0.94	10.10	\N	BAIXO	Onda de 0.94m com periodo de 10.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1321	Lagos	2026-10-22 23:00:00+00	0.94	10.25	\N	BAIXO	Onda de 0.94m com periodo de 10.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1322	Lagos	2026-10-23 00:00:00+00	0.94	10.35	\N	BAIXO	Onda de 0.94m com periodo de 10.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1323	Lagos	2026-10-23 01:00:00+00	0.92	10.40	\N	BAIXO	Onda de 0.92m com periodo de 10.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1324	Lagos	2026-10-23 02:00:00+00	0.92	10.45	\N	BAIXO	Onda de 0.92m com periodo de 10.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1325	Lagos	2026-10-23 03:00:00+00	0.92	10.45	\N	BAIXO	Onda de 0.92m com periodo de 10.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1326	Lagos	2026-10-23 04:00:00+00	0.90	10.50	\N	BAIXO	Onda de 0.9m com periodo de 10.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1327	Lagos	2026-10-23 05:00:00+00	0.90	10.50	\N	BAIXO	Onda de 0.9m com periodo de 10.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1328	Lagos	2026-10-23 06:00:00+00	0.90	10.55	\N	BAIXO	Onda de 0.9m com periodo de 10.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1329	Lagos	2026-10-23 07:00:00+00	0.88	10.60	\N	BAIXO	Onda de 0.88m com periodo de 10.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1330	Lagos	2026-10-23 08:00:00+00	0.88	10.65	\N	BAIXO	Onda de 0.88m com periodo de 10.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1331	Lagos	2026-10-23 09:00:00+00	0.88	10.75	\N	BAIXO	Onda de 0.88m com periodo de 10.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1332	Lagos	2026-10-23 10:00:00+00	0.90	10.85	\N	BAIXO	Onda de 0.9m com periodo de 10.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1333	Lagos	2026-10-23 11:00:00+00	0.90	10.95	\N	BAIXO	Onda de 0.9m com periodo de 10.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1334	Lagos	2026-10-23 12:00:00+00	0.92	11.05	\N	BAIXO	Onda de 0.92m com periodo de 11.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1335	Lagos	2026-10-23 13:00:00+00	0.96	11.10	\N	BAIXO	Onda de 0.96m com periodo de 11.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1336	Lagos	2026-10-23 14:00:00+00	0.98	11.00	\N	BAIXO	Onda de 0.98m com periodo de 11.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1337	Lagos	2026-10-23 15:00:00+00	1.04	10.70	\N	BAIXO	Onda de 1.04m com periodo de 10.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1338	Lagos	2026-10-23 16:00:00+00	1.10	10.25	\N	BAIXO	Onda de 1.1m com periodo de 10.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1339	Lagos	2026-10-23 17:00:00+00	1.16	9.90	\N	BAIXO	Onda de 1.16m com periodo de 9.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1340	Lagos	2026-10-23 18:00:00+00	1.18	9.75	\N	BAIXO	Onda de 1.18m com periodo de 9.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1341	Lagos	2026-10-23 19:00:00+00	1.20	9.65	\N	BAIXO	Onda de 1.2m com periodo de 9.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1342	Lagos	2026-10-23 20:00:00+00	1.22	9.60	\N	BAIXO	Onda de 1.22m com periodo de 9.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1343	Lagos	2026-10-23 21:00:00+00	1.22	9.55	\N	BAIXO	Onda de 1.22m com periodo de 9.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1344	Lagos	2026-10-23 22:00:00+00	1.20	9.60	\N	BAIXO	Onda de 1.2m com periodo de 9.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1345	Albufeira	2026-10-21 23:00:00+00	0.46	7.40	\N	BAIXO	Onda de 0.46m com periodo de 7.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1346	Albufeira	2026-10-22 00:00:00+00	0.46	7.75	\N	BAIXO	Onda de 0.46m com periodo de 7.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1347	Albufeira	2026-10-22 01:00:00+00	0.44	8.25	\N	BAIXO	Onda de 0.44m com periodo de 8.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1348	Albufeira	2026-10-22 02:00:00+00	0.44	8.70	\N	BAIXO	Onda de 0.44m com periodo de 8.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1349	Albufeira	2026-10-22 03:00:00+00	0.44	8.95	\N	BAIXO	Onda de 0.44m com periodo de 8.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1350	Albufeira	2026-10-22 04:00:00+00	0.44	9.10	\N	BAIXO	Onda de 0.44m com periodo de 9.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1351	Albufeira	2026-10-22 05:00:00+00	0.44	9.25	\N	BAIXO	Onda de 0.44m com periodo de 9.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1352	Albufeira	2026-10-22 06:00:00+00	0.44	9.35	\N	BAIXO	Onda de 0.44m com periodo de 9.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1353	Albufeira	2026-10-22 07:00:00+00	0.42	9.40	\N	BAIXO	Onda de 0.42m com periodo de 9.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1354	Albufeira	2026-10-22 08:00:00+00	0.42	9.40	\N	BAIXO	Onda de 0.42m com periodo de 9.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1355	Albufeira	2026-10-22 09:00:00+00	0.42	9.45	\N	BAIXO	Onda de 0.42m com periodo de 9.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1356	Albufeira	2026-10-22 10:00:00+00	0.42	9.50	\N	BAIXO	Onda de 0.42m com periodo de 9.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1357	Albufeira	2026-10-22 11:00:00+00	0.42	9.25	\N	BAIXO	Onda de 0.42m com periodo de 9.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1358	Albufeira	2026-10-22 12:00:00+00	0.46	8.50	\N	BAIXO	Onda de 0.46m com periodo de 8.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1359	Albufeira	2026-10-22 13:00:00+00	0.48	7.45	\N	BAIXO	Onda de 0.48m com periodo de 7.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1360	Albufeira	2026-10-22 14:00:00+00	0.52	6.55	\N	BAIXO	Onda de 0.52m com periodo de 6.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1361	Albufeira	2026-10-22 15:00:00+00	0.56	5.90	\N	BAIXO	Onda de 0.56m com periodo de 5.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1362	Albufeira	2026-10-22 16:00:00+00	0.58	5.40	\N	BAIXO	Onda de 0.58m com periodo de 5.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1363	Albufeira	2026-10-22 17:00:00+00	0.62	5.10	\N	BAIXO	Onda de 0.62m com periodo de 5.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1364	Albufeira	2026-10-22 18:00:00+00	0.60	5.10	\N	BAIXO	Onda de 0.6m com periodo de 5.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1365	Albufeira	2026-10-22 19:00:00+00	0.58	5.35	\N	BAIXO	Onda de 0.58m com periodo de 5.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1366	Albufeira	2026-10-22 20:00:00+00	0.56	5.60	\N	BAIXO	Onda de 0.56m com periodo de 5.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1367	Albufeira	2026-10-22 21:00:00+00	0.54	5.85	\N	BAIXO	Onda de 0.54m com periodo de 5.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1368	Albufeira	2026-10-22 22:00:00+00	0.50	6.15	\N	BAIXO	Onda de 0.5m com periodo de 6.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1369	Albufeira	2026-10-22 23:00:00+00	0.48	6.50	\N	BAIXO	Onda de 0.48m com periodo de 6.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1370	Albufeira	2026-10-23 00:00:00+00	0.46	6.85	\N	BAIXO	Onda de 0.46m com periodo de 6.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1371	Albufeira	2026-10-23 01:00:00+00	0.44	7.25	\N	BAIXO	Onda de 0.44m com periodo de 7.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1372	Albufeira	2026-10-23 02:00:00+00	0.42	7.55	\N	BAIXO	Onda de 0.42m com periodo de 7.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1373	Albufeira	2026-10-23 03:00:00+00	0.42	7.70	\N	BAIXO	Onda de 0.42m com periodo de 7.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1374	Albufeira	2026-10-23 04:00:00+00	0.40	7.75	\N	BAIXO	Onda de 0.4m com periodo de 7.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1375	Albufeira	2026-10-23 05:00:00+00	0.40	7.85	\N	BAIXO	Onda de 0.4m com periodo de 7.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1376	Albufeira	2026-10-23 06:00:00+00	0.38	8.00	\N	BAIXO	Onda de 0.38m com periodo de 8.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1377	Albufeira	2026-10-23 07:00:00+00	0.38	8.15	\N	BAIXO	Onda de 0.38m com periodo de 8.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1378	Albufeira	2026-10-23 08:00:00+00	0.36	8.30	\N	BAIXO	Onda de 0.36m com periodo de 8.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1379	Albufeira	2026-10-23 09:00:00+00	0.36	8.55	\N	BAIXO	Onda de 0.36m com periodo de 8.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1380	Albufeira	2026-10-23 10:00:00+00	0.36	8.85	\N	BAIXO	Onda de 0.36m com periodo de 8.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1381	Albufeira	2026-10-23 11:00:00+00	0.36	8.85	\N	BAIXO	Onda de 0.36m com periodo de 8.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1382	Albufeira	2026-10-23 12:00:00+00	0.40	8.30	\N	BAIXO	Onda de 0.4m com periodo de 8.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1383	Albufeira	2026-10-23 13:00:00+00	0.42	7.50	\N	BAIXO	Onda de 0.42m com periodo de 7.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1384	Albufeira	2026-10-23 14:00:00+00	0.46	6.80	\N	BAIXO	Onda de 0.46m com periodo de 6.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1385	Albufeira	2026-10-23 15:00:00+00	0.48	6.40	\N	BAIXO	Onda de 0.48m com periodo de 6.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1386	Albufeira	2026-10-23 16:00:00+00	0.50	6.10	\N	BAIXO	Onda de 0.5m com periodo de 6.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1387	Albufeira	2026-10-23 17:00:00+00	0.52	5.90	\N	BAIXO	Onda de 0.52m com periodo de 5.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1388	Albufeira	2026-10-23 18:00:00+00	0.54	5.85	\N	BAIXO	Onda de 0.54m com periodo de 5.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1389	Albufeira	2026-10-23 19:00:00+00	0.56	5.90	\N	BAIXO	Onda de 0.56m com periodo de 5.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1390	Albufeira	2026-10-23 20:00:00+00	0.58	6.00	\N	BAIXO	Onda de 0.58m com periodo de 6.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1391	Albufeira	2026-10-23 21:00:00+00	0.58	6.10	\N	BAIXO	Onda de 0.58m com periodo de 6.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1392	Albufeira	2026-10-23 22:00:00+00	0.56	6.25	\N	BAIXO	Onda de 0.56m com periodo de 6.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1393	Vilamoura	2026-10-21 23:00:00+00	0.42	6.25	\N	BAIXO	Onda de 0.42m com periodo de 6.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1394	Vilamoura	2026-10-22 00:00:00+00	0.40	6.65	\N	BAIXO	Onda de 0.4m com periodo de 6.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1395	Vilamoura	2026-10-22 01:00:00+00	0.38	7.25	\N	BAIXO	Onda de 0.38m com periodo de 7.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1396	Vilamoura	2026-10-22 02:00:00+00	0.36	7.80	\N	BAIXO	Onda de 0.36m com periodo de 7.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1397	Vilamoura	2026-10-22 03:00:00+00	0.36	8.15	\N	BAIXO	Onda de 0.36m com periodo de 8.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1398	Vilamoura	2026-10-22 04:00:00+00	0.36	8.45	\N	BAIXO	Onda de 0.36m com periodo de 8.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1399	Vilamoura	2026-10-22 05:00:00+00	0.36	8.65	\N	BAIXO	Onda de 0.36m com periodo de 8.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1400	Vilamoura	2026-10-22 06:00:00+00	0.36	8.80	\N	BAIXO	Onda de 0.36m com periodo de 8.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1401	Vilamoura	2026-10-22 07:00:00+00	0.34	8.85	\N	BAIXO	Onda de 0.34m com periodo de 8.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1402	Vilamoura	2026-10-22 08:00:00+00	0.34	8.85	\N	BAIXO	Onda de 0.34m com periodo de 8.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1403	Vilamoura	2026-10-22 09:00:00+00	0.34	8.90	\N	BAIXO	Onda de 0.34m com periodo de 8.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1404	Vilamoura	2026-10-22 10:00:00+00	0.34	8.95	\N	BAIXO	Onda de 0.34m com periodo de 8.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1405	Vilamoura	2026-10-22 11:00:00+00	0.34	8.70	\N	BAIXO	Onda de 0.34m com periodo de 8.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1406	Vilamoura	2026-10-22 12:00:00+00	0.36	8.05	\N	BAIXO	Onda de 0.36m com periodo de 8.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1407	Vilamoura	2026-10-22 13:00:00+00	0.38	7.15	\N	BAIXO	Onda de 0.38m com periodo de 7.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1408	Vilamoura	2026-10-22 14:00:00+00	0.40	6.30	\N	BAIXO	Onda de 0.4m com periodo de 6.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1409	Vilamoura	2026-10-22 15:00:00+00	0.44	5.60	\N	BAIXO	Onda de 0.44m com periodo de 5.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1410	Vilamoura	2026-10-22 16:00:00+00	0.48	4.95	\N	BAIXO	Onda de 0.48m com periodo de 4.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1411	Vilamoura	2026-10-22 17:00:00+00	0.52	4.50	\N	BAIXO	Onda de 0.52m com periodo de 4.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1412	Vilamoura	2026-10-22 18:00:00+00	0.52	4.35	\N	BAIXO	Onda de 0.52m com periodo de 4.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1413	Vilamoura	2026-10-22 19:00:00+00	0.52	4.45	\N	BAIXO	Onda de 0.52m com periodo de 4.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1414	Vilamoura	2026-10-22 20:00:00+00	0.52	4.55	\N	BAIXO	Onda de 0.52m com periodo de 4.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1415	Vilamoura	2026-10-22 21:00:00+00	0.50	4.65	\N	BAIXO	Onda de 0.5m com periodo de 4.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1416	Vilamoura	2026-10-22 22:00:00+00	0.48	4.80	\N	BAIXO	Onda de 0.48m com periodo de 4.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1417	Vilamoura	2026-10-22 23:00:00+00	0.46	5.00	\N	BAIXO	Onda de 0.46m com periodo de 5.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1418	Vilamoura	2026-10-23 00:00:00+00	0.44	5.35	\N	BAIXO	Onda de 0.44m com periodo de 5.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1419	Vilamoura	2026-10-23 01:00:00+00	0.40	5.75	\N	BAIXO	Onda de 0.4m com periodo de 5.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1420	Vilamoura	2026-10-23 02:00:00+00	0.38	6.10	\N	BAIXO	Onda de 0.38m com periodo de 6.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1421	Vilamoura	2026-10-23 03:00:00+00	0.36	6.30	\N	BAIXO	Onda de 0.36m com periodo de 6.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1422	Vilamoura	2026-10-23 04:00:00+00	0.36	6.45	\N	BAIXO	Onda de 0.36m com periodo de 6.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1423	Vilamoura	2026-10-23 05:00:00+00	0.34	6.60	\N	BAIXO	Onda de 0.34m com periodo de 6.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1424	Vilamoura	2026-10-23 06:00:00+00	0.32	6.80	\N	BAIXO	Onda de 0.32m com periodo de 6.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1425	Vilamoura	2026-10-23 07:00:00+00	0.32	6.95	\N	BAIXO	Onda de 0.32m com periodo de 6.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1426	Vilamoura	2026-10-23 08:00:00+00	0.30	7.15	\N	BAIXO	Onda de 0.3m com periodo de 7.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1427	Vilamoura	2026-10-23 09:00:00+00	0.30	7.45	\N	BAIXO	Onda de 0.3m com periodo de 7.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1428	Vilamoura	2026-10-23 10:00:00+00	0.30	7.80	\N	BAIXO	Onda de 0.3m com periodo de 7.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1429	Vilamoura	2026-10-23 11:00:00+00	0.30	7.75	\N	BAIXO	Onda de 0.3m com periodo de 7.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1430	Vilamoura	2026-10-23 12:00:00+00	0.34	7.05	\N	BAIXO	Onda de 0.34m com periodo de 7.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1431	Vilamoura	2026-10-23 13:00:00+00	0.38	6.00	\N	BAIXO	Onda de 0.38m com periodo de 6.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1432	Vilamoura	2026-10-23 14:00:00+00	0.42	5.20	\N	BAIXO	Onda de 0.42m com periodo de 5.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1433	Vilamoura	2026-10-23 15:00:00+00	0.42	4.95	\N	BAIXO	Onda de 0.42m com periodo de 4.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1434	Vilamoura	2026-10-23 16:00:00+00	0.42	4.95	\N	BAIXO	Onda de 0.42m com periodo de 4.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1435	Vilamoura	2026-10-23 17:00:00+00	0.42	4.95	\N	BAIXO	Onda de 0.42m com periodo de 4.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1436	Vilamoura	2026-10-23 18:00:00+00	0.44	4.90	\N	BAIXO	Onda de 0.44m com periodo de 4.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1437	Vilamoura	2026-10-23 19:00:00+00	0.46	4.90	\N	BAIXO	Onda de 0.46m com periodo de 4.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1438	Vilamoura	2026-10-23 20:00:00+00	0.48	4.95	\N	BAIXO	Onda de 0.48m com periodo de 4.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1439	Vilamoura	2026-10-23 21:00:00+00	0.46	5.15	\N	BAIXO	Onda de 0.46m com periodo de 5.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1440	Vilamoura	2026-10-23 22:00:00+00	0.46	5.40	\N	BAIXO	Onda de 0.46m com periodo de 5.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1441	Praia de Faro	2026-10-21 23:00:00+00	0.52	6.85	\N	BAIXO	Onda de 0.52m com periodo de 6.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1442	Praia de Faro	2026-10-22 00:00:00+00	0.50	7.05	\N	BAIXO	Onda de 0.5m com periodo de 7.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1443	Praia de Faro	2026-10-22 01:00:00+00	0.48	7.60	\N	BAIXO	Onda de 0.48m com periodo de 7.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1444	Praia de Faro	2026-10-22 02:00:00+00	0.46	8.10	\N	BAIXO	Onda de 0.46m com periodo de 8.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1445	Praia de Faro	2026-10-22 03:00:00+00	0.46	8.45	\N	BAIXO	Onda de 0.46m com periodo de 8.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1446	Praia de Faro	2026-10-22 04:00:00+00	0.46	8.80	\N	BAIXO	Onda de 0.46m com periodo de 8.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1447	Praia de Faro	2026-10-22 05:00:00+00	0.46	9.05	\N	BAIXO	Onda de 0.46m com periodo de 9.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1448	Praia de Faro	2026-10-22 06:00:00+00	0.46	9.15	\N	BAIXO	Onda de 0.46m com periodo de 9.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1449	Praia de Faro	2026-10-22 07:00:00+00	0.46	9.20	\N	BAIXO	Onda de 0.46m com periodo de 9.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1450	Praia de Faro	2026-10-22 08:00:00+00	0.46	9.20	\N	BAIXO	Onda de 0.46m com periodo de 9.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1451	Praia de Faro	2026-10-22 09:00:00+00	0.46	9.25	\N	BAIXO	Onda de 0.46m com periodo de 9.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1452	Praia de Faro	2026-10-22 10:00:00+00	0.46	9.25	\N	BAIXO	Onda de 0.46m com periodo de 9.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1453	Praia de Faro	2026-10-22 11:00:00+00	0.46	9.15	\N	BAIXO	Onda de 0.46m com periodo de 9.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1454	Praia de Faro	2026-10-22 12:00:00+00	0.46	8.80	\N	BAIXO	Onda de 0.46m com periodo de 8.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1455	Praia de Faro	2026-10-22 13:00:00+00	0.48	8.35	\N	BAIXO	Onda de 0.48m com periodo de 8.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1456	Praia de Faro	2026-10-22 14:00:00+00	0.48	7.75	\N	BAIXO	Onda de 0.48m com periodo de 7.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1457	Praia de Faro	2026-10-22 15:00:00+00	0.52	7.00	\N	BAIXO	Onda de 0.52m com periodo de 7.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1458	Praia de Faro	2026-10-22 16:00:00+00	0.56	6.10	\N	BAIXO	Onda de 0.56m com periodo de 6.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1459	Praia de Faro	2026-10-22 17:00:00+00	0.60	5.45	\N	BAIXO	Onda de 0.6m com periodo de 5.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1460	Praia de Faro	2026-10-22 18:00:00+00	0.62	5.15	\N	BAIXO	Onda de 0.62m com periodo de 5.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1461	Praia de Faro	2026-10-22 19:00:00+00	0.64	5.10	\N	BAIXO	Onda de 0.64m com periodo de 5.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1462	Praia de Faro	2026-10-22 20:00:00+00	0.66	5.10	\N	BAIXO	Onda de 0.66m com periodo de 5.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1463	Praia de Faro	2026-10-22 21:00:00+00	0.64	5.15	\N	BAIXO	Onda de 0.64m com periodo de 5.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1464	Praia de Faro	2026-10-22 22:00:00+00	0.62	5.25	\N	BAIXO	Onda de 0.62m com periodo de 5.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1465	Praia de Faro	2026-10-22 23:00:00+00	0.60	5.45	\N	BAIXO	Onda de 0.6m com periodo de 5.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1466	Praia de Faro	2026-10-23 00:00:00+00	0.58	5.75	\N	BAIXO	Onda de 0.58m com periodo de 5.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1467	Praia de Faro	2026-10-23 01:00:00+00	0.54	6.15	\N	BAIXO	Onda de 0.54m com periodo de 6.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1468	Praia de Faro	2026-10-23 02:00:00+00	0.52	6.50	\N	BAIXO	Onda de 0.52m com periodo de 6.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1469	Praia de Faro	2026-10-23 03:00:00+00	0.50	6.85	\N	BAIXO	Onda de 0.5m com periodo de 6.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1470	Praia de Faro	2026-10-23 04:00:00+00	0.46	7.25	\N	BAIXO	Onda de 0.46m com periodo de 7.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1471	Praia de Faro	2026-10-23 05:00:00+00	0.44	7.50	\N	BAIXO	Onda de 0.44m com periodo de 7.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1472	Praia de Faro	2026-10-23 06:00:00+00	0.42	7.60	\N	BAIXO	Onda de 0.42m com periodo de 7.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1473	Praia de Faro	2026-10-23 07:00:00+00	0.42	7.65	\N	BAIXO	Onda de 0.42m com periodo de 7.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1474	Praia de Faro	2026-10-23 08:00:00+00	0.40	7.70	\N	BAIXO	Onda de 0.4m com periodo de 7.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1475	Praia de Faro	2026-10-23 09:00:00+00	0.40	7.90	\N	BAIXO	Onda de 0.4m com periodo de 7.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1476	Praia de Faro	2026-10-23 10:00:00+00	0.40	8.10	\N	BAIXO	Onda de 0.4m com periodo de 8.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1477	Praia de Faro	2026-10-23 11:00:00+00	0.40	8.05	\N	BAIXO	Onda de 0.4m com periodo de 8.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1478	Praia de Faro	2026-10-23 12:00:00+00	0.42	7.55	\N	BAIXO	Onda de 0.42m com periodo de 7.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1479	Praia de Faro	2026-10-23 13:00:00+00	0.46	6.80	\N	BAIXO	Onda de 0.46m com periodo de 6.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1480	Praia de Faro	2026-10-23 14:00:00+00	0.48	6.20	\N	BAIXO	Onda de 0.48m com periodo de 6.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1481	Praia de Faro	2026-10-23 15:00:00+00	0.50	5.85	\N	BAIXO	Onda de 0.5m com periodo de 5.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1482	Praia de Faro	2026-10-23 16:00:00+00	0.50	5.65	\N	BAIXO	Onda de 0.5m com periodo de 5.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1483	Praia de Faro	2026-10-23 17:00:00+00	0.52	5.55	\N	BAIXO	Onda de 0.52m com periodo de 5.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1484	Praia de Faro	2026-10-23 18:00:00+00	0.54	5.50	\N	BAIXO	Onda de 0.54m com periodo de 5.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1485	Praia de Faro	2026-10-23 19:00:00+00	0.56	5.55	\N	BAIXO	Onda de 0.56m com periodo de 5.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1486	Praia de Faro	2026-10-23 20:00:00+00	0.58	5.65	\N	BAIXO	Onda de 0.58m com periodo de 5.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1487	Praia de Faro	2026-10-23 21:00:00+00	0.58	5.90	\N	BAIXO	Onda de 0.58m com periodo de 5.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1488	Praia de Faro	2026-10-23 22:00:00+00	0.56	6.20	\N	BAIXO	Onda de 0.56m com periodo de 6.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1489	Tavira	2026-10-21 23:00:00+00	0.26	5.10	\N	BAIXO	Onda de 0.26m com periodo de 5.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1490	Tavira	2026-10-22 00:00:00+00	0.24	5.00	\N	BAIXO	Onda de 0.24m com periodo de 5.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1491	Tavira	2026-10-22 01:00:00+00	0.24	4.95	\N	BAIXO	Onda de 0.24m com periodo de 4.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1492	Tavira	2026-10-22 02:00:00+00	0.22	4.95	\N	BAIXO	Onda de 0.22m com periodo de 4.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1493	Tavira	2026-10-22 03:00:00+00	0.20	5.00	\N	BAIXO	Onda de 0.2m com periodo de 5.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1494	Tavira	2026-10-22 04:00:00+00	0.20	5.10	\N	BAIXO	Onda de 0.2m com periodo de 5.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1495	Tavira	2026-10-22 05:00:00+00	0.18	5.25	\N	BAIXO	Onda de 0.18m com periodo de 5.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1496	Tavira	2026-10-22 06:00:00+00	0.18	5.40	\N	BAIXO	Onda de 0.18m com periodo de 5.4s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1497	Tavira	2026-10-22 07:00:00+00	0.16	5.55	\N	BAIXO	Onda de 0.16m com periodo de 5.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1498	Tavira	2026-10-22 08:00:00+00	0.16	5.70	\N	BAIXO	Onda de 0.16m com periodo de 5.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1499	Tavira	2026-10-22 09:00:00+00	0.16	5.95	\N	BAIXO	Onda de 0.16m com periodo de 5.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1500	Tavira	2026-10-22 10:00:00+00	0.14	6.20	\N	BAIXO	Onda de 0.14m com periodo de 6.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1501	Tavira	2026-10-22 11:00:00+00	0.14	6.25	\N	BAIXO	Onda de 0.14m com periodo de 6.25s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1502	Tavira	2026-10-22 12:00:00+00	0.14	6.05	\N	BAIXO	Onda de 0.14m com periodo de 6.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1503	Tavira	2026-10-22 13:00:00+00	0.16	5.60	\N	BAIXO	Onda de 0.16m com periodo de 5.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1504	Tavira	2026-10-22 14:00:00+00	0.16	5.10	\N	BAIXO	Onda de 0.16m com periodo de 5.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1505	Tavira	2026-10-22 15:00:00+00	0.20	4.35	\N	BAIXO	Onda de 0.2m com periodo de 4.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1506	Tavira	2026-10-22 16:00:00+00	0.26	3.55	\N	BAIXO	Onda de 0.26m com periodo de 3.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1507	Tavira	2026-10-22 17:00:00+00	0.30	3.00	\N	BAIXO	Onda de 0.3m com periodo de 3.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1508	Tavira	2026-10-22 18:00:00+00	0.28	3.05	\N	BAIXO	Onda de 0.28m com periodo de 3.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1509	Tavira	2026-10-22 19:00:00+00	0.28	3.35	\N	BAIXO	Onda de 0.28m com periodo de 3.35s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1510	Tavira	2026-10-22 20:00:00+00	0.26	3.60	\N	BAIXO	Onda de 0.26m com periodo de 3.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1511	Tavira	2026-10-22 21:00:00+00	0.28	3.60	\N	BAIXO	Onda de 0.28m com periodo de 3.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1512	Tavira	2026-10-22 22:00:00+00	0.32	3.50	\N	BAIXO	Onda de 0.32m com periodo de 3.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1513	Tavira	2026-10-22 23:00:00+00	0.34	3.45	\N	BAIXO	Onda de 0.34m com periodo de 3.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1514	Tavira	2026-10-23 00:00:00+00	0.34	3.45	\N	BAIXO	Onda de 0.34m com periodo de 3.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1515	Tavira	2026-10-23 01:00:00+00	0.34	3.45	\N	BAIXO	Onda de 0.34m com periodo de 3.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1516	Tavira	2026-10-23 02:00:00+00	0.34	3.45	\N	BAIXO	Onda de 0.34m com periodo de 3.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1517	Tavira	2026-10-23 03:00:00+00	0.32	3.50	\N	BAIXO	Onda de 0.32m com periodo de 3.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1518	Tavira	2026-10-23 04:00:00+00	0.32	3.55	\N	BAIXO	Onda de 0.32m com periodo de 3.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1519	Tavira	2026-10-23 05:00:00+00	0.30	3.65	\N	BAIXO	Onda de 0.3m com periodo de 3.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1520	Tavira	2026-10-23 06:00:00+00	0.26	3.80	\N	BAIXO	Onda de 0.26m com periodo de 3.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1521	Tavira	2026-10-23 07:00:00+00	0.24	3.95	\N	BAIXO	Onda de 0.24m com periodo de 3.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1522	Tavira	2026-10-23 08:00:00+00	0.20	4.20	\N	BAIXO	Onda de 0.2m com periodo de 4.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1523	Tavira	2026-10-23 09:00:00+00	0.18	4.60	\N	BAIXO	Onda de 0.18m com periodo de 4.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1524	Tavira	2026-10-23 10:00:00+00	0.16	5.10	\N	BAIXO	Onda de 0.16m com periodo de 5.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1525	Tavira	2026-10-23 11:00:00+00	0.14	5.30	\N	BAIXO	Onda de 0.14m com periodo de 5.3s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1526	Tavira	2026-10-23 12:00:00+00	0.16	5.05	\N	BAIXO	Onda de 0.16m com periodo de 5.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1527	Tavira	2026-10-23 13:00:00+00	0.16	4.60	\N	BAIXO	Onda de 0.16m com periodo de 4.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1528	Tavira	2026-10-23 14:00:00+00	0.18	4.15	\N	BAIXO	Onda de 0.18m com periodo de 4.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1529	Tavira	2026-10-23 15:00:00+00	0.20	3.85	\N	BAIXO	Onda de 0.2m com periodo de 3.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1530	Tavira	2026-10-23 16:00:00+00	0.20	3.60	\N	BAIXO	Onda de 0.2m com periodo de 3.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1531	Tavira	2026-10-23 17:00:00+00	0.22	3.45	\N	BAIXO	Onda de 0.22m com periodo de 3.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1532	Tavira	2026-10-23 18:00:00+00	0.22	3.50	\N	BAIXO	Onda de 0.22m com periodo de 3.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1533	Tavira	2026-10-23 19:00:00+00	0.22	3.70	\N	BAIXO	Onda de 0.22m com periodo de 3.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1534	Tavira	2026-10-23 20:00:00+00	0.22	3.80	\N	BAIXO	Onda de 0.22m com periodo de 3.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1535	Tavira	2026-10-23 21:00:00+00	0.26	3.70	\N	BAIXO	Onda de 0.26m com periodo de 3.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1536	Tavira	2026-10-23 22:00:00+00	0.30	3.55	\N	BAIXO	Onda de 0.3m com periodo de 3.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1537	Monte Gordo	2026-10-21 23:00:00+00	0.20	4.00	\N	BAIXO	Onda de 0.2m com periodo de 4.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1538	Monte Gordo	2026-10-22 00:00:00+00	0.22	3.65	\N	BAIXO	Onda de 0.22m com periodo de 3.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1539	Monte Gordo	2026-10-22 01:00:00+00	0.24	3.05	\N	BAIXO	Onda de 0.24m com periodo de 3.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1540	Monte Gordo	2026-10-22 02:00:00+00	0.26	2.70	\N	BAIXO	Onda de 0.26m com periodo de 2.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1541	Monte Gordo	2026-10-22 03:00:00+00	0.24	2.70	\N	BAIXO	Onda de 0.24m com periodo de 2.7s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1542	Monte Gordo	2026-10-22 04:00:00+00	0.22	2.95	\N	BAIXO	Onda de 0.22m com periodo de 2.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1543	Monte Gordo	2026-10-22 05:00:00+00	0.20	3.20	\N	BAIXO	Onda de 0.2m com periodo de 3.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1544	Monte Gordo	2026-10-22 06:00:00+00	0.18	3.45	\N	BAIXO	Onda de 0.18m com periodo de 3.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1545	Monte Gordo	2026-10-22 07:00:00+00	0.16	3.75	\N	BAIXO	Onda de 0.16m com periodo de 3.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1546	Monte Gordo	2026-10-22 08:00:00+00	0.14	4.10	\N	BAIXO	Onda de 0.14m com periodo de 4.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1547	Monte Gordo	2026-10-22 09:00:00+00	0.12	4.75	\N	BAIXO	Onda de 0.12m com periodo de 4.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1548	Monte Gordo	2026-10-22 10:00:00+00	0.12	5.50	\N	BAIXO	Onda de 0.12m com periodo de 5.5s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1549	Monte Gordo	2026-10-22 11:00:00+00	0.10	5.75	\N	BAIXO	Onda de 0.1m com periodo de 5.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1550	Monte Gordo	2026-10-22 12:00:00+00	0.12	5.10	\N	BAIXO	Onda de 0.12m com periodo de 5.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1551	Monte Gordo	2026-10-22 13:00:00+00	0.12	4.00	\N	BAIXO	Onda de 0.12m com periodo de 4.0s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1552	Monte Gordo	2026-10-22 14:00:00+00	0.14	3.10	\N	BAIXO	Onda de 0.14m com periodo de 3.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1553	Monte Gordo	2026-10-22 15:00:00+00	0.20	2.75	\N	BAIXO	Onda de 0.2m com periodo de 2.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1554	Monte Gordo	2026-10-22 16:00:00+00	0.26	2.60	\N	BAIXO	Onda de 0.26m com periodo de 2.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1555	Monte Gordo	2026-10-22 17:00:00+00	0.32	2.55	\N	BAIXO	Onda de 0.32m com periodo de 2.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1556	Monte Gordo	2026-10-22 18:00:00+00	0.30	2.65	\N	BAIXO	Onda de 0.3m com periodo de 2.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1557	Monte Gordo	2026-10-22 19:00:00+00	0.28	2.80	\N	BAIXO	Onda de 0.28m com periodo de 2.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1558	Monte Gordo	2026-10-22 20:00:00+00	0.26	2.90	\N	BAIXO	Onda de 0.26m com periodo de 2.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1559	Monte Gordo	2026-10-22 21:00:00+00	0.30	2.80	\N	BAIXO	Onda de 0.3m com periodo de 2.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1560	Monte Gordo	2026-10-22 22:00:00+00	0.34	2.65	\N	BAIXO	Onda de 0.34m com periodo de 2.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1561	Monte Gordo	2026-10-22 23:00:00+00	0.38	2.55	\N	BAIXO	Onda de 0.38m com periodo de 2.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1562	Monte Gordo	2026-10-23 00:00:00+00	0.38	2.60	\N	BAIXO	Onda de 0.38m com periodo de 2.6s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1563	Monte Gordo	2026-10-23 01:00:00+00	0.40	2.65	\N	BAIXO	Onda de 0.4m com periodo de 2.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1564	Monte Gordo	2026-10-23 02:00:00+00	0.40	2.75	\N	BAIXO	Onda de 0.4m com periodo de 2.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1565	Monte Gordo	2026-10-23 03:00:00+00	0.36	2.75	\N	BAIXO	Onda de 0.36m com periodo de 2.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1566	Monte Gordo	2026-10-23 04:00:00+00	0.34	2.75	\N	BAIXO	Onda de 0.34m com periodo de 2.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1567	Monte Gordo	2026-10-23 05:00:00+00	0.30	2.80	\N	BAIXO	Onda de 0.3m com periodo de 2.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1568	Monte Gordo	2026-10-23 06:00:00+00	0.26	2.85	\N	BAIXO	Onda de 0.26m com periodo de 2.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1569	Monte Gordo	2026-10-23 07:00:00+00	0.22	2.95	\N	BAIXO	Onda de 0.22m com periodo de 2.95s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1570	Monte Gordo	2026-10-23 08:00:00+00	0.18	3.20	\N	BAIXO	Onda de 0.18m com periodo de 3.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1571	Monte Gordo	2026-10-23 09:00:00+00	0.16	3.75	\N	BAIXO	Onda de 0.16m com periodo de 3.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1572	Monte Gordo	2026-10-23 10:00:00+00	0.12	4.45	\N	BAIXO	Onda de 0.12m com periodo de 4.45s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1573	Monte Gordo	2026-10-23 11:00:00+00	0.10	4.90	\N	BAIXO	Onda de 0.1m com periodo de 4.9s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1574	Monte Gordo	2026-10-23 12:00:00+00	0.10	4.85	\N	BAIXO	Onda de 0.1m com periodo de 4.85s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1575	Monte Gordo	2026-10-23 13:00:00+00	0.12	4.55	\N	BAIXO	Onda de 0.12m com periodo de 4.55s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1576	Monte Gordo	2026-10-23 14:00:00+00	0.12	4.15	\N	BAIXO	Onda de 0.12m com periodo de 4.15s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1577	Monte Gordo	2026-10-23 15:00:00+00	0.16	3.65	\N	BAIXO	Onda de 0.16m com periodo de 3.65s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1578	Monte Gordo	2026-10-23 16:00:00+00	0.18	3.10	\N	BAIXO	Onda de 0.18m com periodo de 3.1s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1579	Monte Gordo	2026-10-23 17:00:00+00	0.22	2.75	\N	BAIXO	Onda de 0.22m com periodo de 2.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1580	Monte Gordo	2026-10-23 18:00:00+00	0.20	2.80	\N	BAIXO	Onda de 0.2m com periodo de 2.8s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1581	Monte Gordo	2026-10-23 19:00:00+00	0.20	3.05	\N	BAIXO	Onda de 0.2m com periodo de 3.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1582	Monte Gordo	2026-10-23 20:00:00+00	0.18	3.20	\N	BAIXO	Onda de 0.18m com periodo de 3.2s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1583	Monte Gordo	2026-10-23 21:00:00+00	0.24	3.05	\N	BAIXO	Onda de 0.24m com periodo de 3.05s	open-meteo-marine	2026-10-22 20:58:51.152445+00
1584	Monte Gordo	2026-10-23 22:00:00+00	0.28	2.75	\N	BAIXO	Onda de 0.28m com periodo de 2.75s	open-meteo-marine	2026-10-22 20:58:51.152445+00
\.


--
-- Name: alerts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.alerts_id_seq', 183, true);


--
-- Name: ipma_comunicados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ipma_comunicados_id_seq', 5, true);


--
-- Name: observations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.observations_id_seq', 1584, true);


--
-- Name: alerts alerts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alerts
    ADD CONSTRAINT alerts_pkey PRIMARY KEY (id);


--
-- Name: ipma_comunicados ipma_comunicados_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ipma_comunicados
    ADD CONSTRAINT ipma_comunicados_pkey PRIMARY KEY (id);


--
-- Name: ipma_comunicados ipma_comunicados_titulo_data_publicacao_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ipma_comunicados
    ADD CONSTRAINT ipma_comunicados_titulo_data_publicacao_key UNIQUE (titulo, data_publicacao);


--
-- Name: observations observations_location_name_observed_at_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.observations
    ADD CONSTRAINT observations_location_name_observed_at_key UNIQUE (location_name, observed_at);


--
-- Name: observations observations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.observations
    ADD CONSTRAINT observations_pkey PRIMARY KEY (id);


--
-- Name: idx_alerts_pending; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alerts_pending ON public.alerts USING btree (created_at) WHERE (email_sent = false);


--
-- Name: idx_ipma_data; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ipma_data ON public.ipma_comunicados USING btree (data_publicacao DESC);


--
-- Name: idx_obs_location_time; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_obs_location_time ON public.observations USING btree (location_name, observed_at DESC);


--
-- Name: uq_alerts_observation; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uq_alerts_observation ON public.alerts USING btree (observation_id);


--
-- Name: alerts alerts_observation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alerts
    ADD CONSTRAINT alerts_observation_id_fkey FOREIGN KEY (observation_id) REFERENCES public.observations(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict QIYSCK7YmN3anLRMIitWzGhAQZsMftdVY0eq9k0GfXwszrsnEg6SEF1aRd2U0yK

