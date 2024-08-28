--
-- PostgreSQL database dump
--

-- Dumped from database version 15.7
-- Dumped by pg_dump version 15.7

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
-- Name: economic_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.economic_data (
    code integer NOT NULL,
    country_id character varying(10),
    country_name character varying(255),
    year character varying(10),
    link text,
    value double precision,
    indicator_name character varying(255),
    dataset_id character varying(50),
    indicator_id character varying(50),
    retrieval_date date
);


--
-- Name: economic_data_code_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.economic_data_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: economic_data_code_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.economic_data_code_seq OWNED BY public.economic_data.code;


--
-- Name: indicators; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.indicators (
    id integer NOT NULL,
    category character varying(255),
    indicatorname character varying(255),
    proxy character varying(255),
    api_url character varying(255),
    dataset character varying(255),
    indicatorcode character varying(255),
    positive_negative_indicator boolean,
    number_percent boolean,
    notes text,
    for_afghanistan boolean DEFAULT true,
    for_bangladesh boolean DEFAULT true,
    for_bhutan boolean DEFAULT true,
    for_india boolean DEFAULT true,
    for_maldives boolean DEFAULT true,
    for_nepal boolean DEFAULT true,
    for_pakistan boolean DEFAULT true,
    for_sri_lanka boolean DEFAULT true,
    indicator_id integer
);


--
-- Name: indicators_revised; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.indicators_revised (
    id integer NOT NULL,
    indicator_id integer NOT NULL,
    api_url character varying(512) NOT NULL,
    category character varying(255) NOT NULL,
    category_id integer,
    dataset character varying(255) NOT NULL,
    indicator_code character varying(100) NOT NULL,
    indicator_name character varying(255) NOT NULL,
    positive_negative_indicator boolean DEFAULT false,
    number_percent boolean DEFAULT false,
    notes text,
    afghanistan_year integer,
    bangladesh_year integer,
    india_year integer,
    maldives_year integer,
    nepal_year integer,
    pakistan_year integer,
    sri_lanka_year integer,
    afghanistan_year_type integer,
    bangladesh_year_type integer,
    india_year_type integer,
    maldives_year_type integer,
    nepal_year_type integer,
    pakistan_year_type integer,
    sri_lanka_year_type integer
);


--
-- Name: indicators_revised_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.indicators_revised_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: indicators_revised_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.indicators_revised_id_seq OWNED BY public.indicators_revised.id;


--
-- Name: scorecard_indicators2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.scorecard_indicators2 (
    id integer,
    secondary_id integer NOT NULL,
    group_name character varying(255),
    indicator character varying(255),
    proxy character varying(255),
    country character varying(255),
    year character varying(255),
    year_type integer,
    source character varying(255),
    value character varying(255),
    value_n numeric(10,2),
    value_map character varying(50) DEFAULT NULL::character varying,
    value_standardized numeric(10,2) DEFAULT NULL::numeric,
    positive integer,
    value_standardized_table numeric(10,2),
    category_id integer
);


--
-- Name: scorecard_indicators2_secondary_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.scorecard_indicators2_secondary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: scorecard_indicators2_secondary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.scorecard_indicators2_secondary_id_seq OWNED BY public.scorecard_indicators2.secondary_id;


--
-- Name: economic_data code; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.economic_data ALTER COLUMN code SET DEFAULT nextval('public.economic_data_code_seq'::regclass);


--
-- Name: indicators_revised id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.indicators_revised ALTER COLUMN id SET DEFAULT nextval('public.indicators_revised_id_seq'::regclass);


--
-- Name: scorecard_indicators2 secondary_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scorecard_indicators2 ALTER COLUMN secondary_id SET DEFAULT nextval('public.scorecard_indicators2_secondary_id_seq'::regclass);


--
-- Data for Name: economic_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.economic_data (code, country_id, country_name, year, link, value, indicator_name, dataset_id, indicator_id, retrieval_date) FROM stdin;
1	BGD	Inequality (Gini)	01/01/2022	https://datacatalogapi.worldbank.org/dexapps/efi/data?datasetid=YALE.EPI&indicatorIds=YALE.EPI.FSS&countryCodes=AFG,BGD,BTN,IND,LKA,MDV,NPL,PAK	33.37	Inequality (Gini)	WB.PIP	WB.PIP.gini	2024-08-02
2	BGD	Inequality (Gini)	01/01/2016	https://datacatalogapi.worldbank.org/dexapps/efi/data?datasetid=YALE.EPI&indicatorIds=YALE.EPI.FSS&countryCodes=AFG,BGD,BTN,IND,LKA,MDV,NPL,PAK	32.39	Inequality (Gini)	WB.PIP	WB.PIP.gini	2024-08-02
3	BGD	Inequality (Gini)	01/01/2022	https://datacatalogapi.worldbank.org/dexapps/efi/data?datasetid=YALE.EPI&indicatorIds=YALE.EPI.FSS&countryCodes=AFG,BGD,BTN,IND,LKA,MDV,NPL,PAK	33.37	Inequality (Gini)	WB.PIP	WB.PIP.gini	2024-08-02
4	BGD	Inequality (Gini)	01/01/2016	https://datacatalogapi.worldbank.org/dexapps/efi/data?datasetid=YALE.EPI&indicatorIds=YALE.EPI.FSS&countryCodes=AFG,BGD,BTN,IND,LKA,MDV,NPL,PAK	32.39	Inequality (Gini)	WB.PIP	WB.PIP.gini	2024-08-02
5	BGD	Inequality (Gini)	01/01/2022	https://datacatalogapi.worldbank.org/dexapps/efi/data?datasetid=YALE.EPI&indicatorIds=YALE.EPI.FSS&countryCodes=AFG,BGD,BTN,IND,LKA,MDV,NPL,PAK	33.37	Inequality (Gini)	WB.PIP	WB.PIP.gini	2024-08-02
6	BGD	Inequality (Gini)	01/01/2016	https://datacatalogapi.worldbank.org/dexapps/efi/data?datasetid=YALE.EPI&indicatorIds=YALE.EPI.FSS&countryCodes=AFG,BGD,BTN,IND,LKA,MDV,NPL,PAK	32.39	Inequality (Gini)	WB.PIP	WB.PIP.gini	2024-08-02
\.


--
-- Data for Name: indicators; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.indicators (id, category, indicatorname, proxy, api_url, dataset, indicatorcode, positive_negative_indicator, number_percent, notes, for_afghanistan, for_bangladesh, for_bhutan, for_india, for_maldives, for_nepal, for_pakistan, for_sri_lanka, indicator_id) FROM stdin;
1	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	World Bank APIall/indicator	World Bank	SH.STA.STNT.ME.ZS	f	f	\N	t	t	t	t	t	t	t	t	1
2	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	World Bank APIall/indicator	World Bank	SH.UHC.SRVS.CV.XD	t	f	\N	t	t	t	t	t	t	t	t	2
3	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	World Bank APIall/indicator	World Bank	EN.ATM.PM25.MC.ZS	f	f	\N	t	t	t	t	t	t	t	t	3
8	Planet	Prevalence of undernourishment %		World Bank APIall/indicator	World Bank	SN.ITK.DEFC.ZS	t	f	\N	t	t	t	t	t	t	t	t	8
17	Vision	Poverty rate (National)		360 Prosperity API	World Bank	WB.PIP.headcount_national	t	f	\N	t	t	t	t	t	t	t	t	17
18	Vision	Poverty rate ($2.15 poverty line)		360 Prosperity API	World Bank	WB.MPO.POV1	t	f	\N	t	t	t	t	t	t	t	t	18
19	Vision	Poverty rate (3.65 poverty line)		360 Prosperity API	World Bank	WB.MPO.POV2	t	f	\N	t	t	t	t	t	t	t	t	19
20	Vision	Poverty rate (6.85 poverty line)		360 Prosperity API	World Bank	WB.MPO.POV3	t	f	\N	t	t	t	t	t	t	t	t	20
16	Finance	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	https://apiv2.worldbank.org/	World Bank	https://apiv2.worldbank.org/files?resourceName=dsa.json&locator=shared&raw=true	t	f	\N	t	t	t	t	t	t	t	t	16
30	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Used UNSD Arcgis link	NA	NA	t	f	\N	t	t	t	t	t	t	t	t	30
31	Vision	% People with access to basic drinking water, sanitation services, and hygiene		NA	NA	NA	t	f	\N	t	t	t	t	t	t	t	t	31
32	Poverty	# Extreme poor living in FCS		NA	NA	NA	t	f	\N	t	t	t	t	t	t	t	t	32
33	Economy	Prosperity Gap		Scraping for now	World Bank	WB.PIP	t	f	\N	t	t	t	t	t	t	t	t	33
34	Digital	State of online e-governance provision (EGDI)		Scraping for now	NA	NA	t	f	\N	t	t	t	t	t	t	t	t	34
35	Vision	Millions of people highly vulnerable to climate risks		https://api.unhcr.org/population/v1/population/	NA	NA	t	f	\N	t	t	t	t	t	t	t	t	35
36	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years		NA	NA	t	f	\N	t	t	t	t	t	t	t	t	36
4	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	World Bank APIall/indicator	World Bank	ER.PTD.TOTL.ZS	t	t	\N	t	t	t	t	t	t	t	t	4
5	Planet	% people with access to basic drinking water		World Bank APIall/indicator	World Bank	SH.H2O.BASW.ZS	t	f	\N	t	t	t	t	t	t	t	t	5
6	Planet	% people with access to basic sanitation		World Bank APIall/indicator	World Bank	SH.STA.BASS.ZS	t	f	\N	t	t	t	t	t	t	t	t	6
7	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	World Bank APIall/indicator	World Bank	SH.STA.HYGN.ZS	t	f	\N	t	t	t	t	t	t	t	t	7
9	Vision	Prevalence of moderate or severe food insecurity in the total population %		World Bank APIall/indicator	World Bank	SN.ITK.MSFI.ZS	t	f	\N	t	t	t	t	t	t	t	t	9
10	Infrastructure	% Population with access to electricity		World Bank APIall/indicator	World Bank	EG.ELC.ACCS.ZS	t	f	\N	t	t	t	t	t	t	t	t	10
11	Digital	% of the population using the internet		World Bank APIall/indicator	World Bank	IT.NET.USER.ZS	t	f	\N	t	t	t	t	t	t	t	t	11
12	Cross Cutting	Number of women that use a financial account (million)		World Bank APIall/indicator	World Bank	FX.OWN.TOTL.FE.ZS	t	f	\N	t	t	t	t	t	t	t	t	12
13	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	World Bank APIall/indicator	World Bank	SL.EMP.WORK.FE.ZS	t	f	\N	t	t	t	t	t	t	t	t	13
14	Education	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	World Bank APIall/indicator	World Bank	SL.UEM.NEET.FE.ZS	t	f	\N	t	t	t	t	t	t	t	t	14
15	Prosperity	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	World Bank APIall/indicator	World Bank	NE.GDI.FPRV.ZS	t	f	\N	t	t	t	t	t	t	t	t	15
21	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	360 Prosperity API	World Bank	WB.PIP.gini	t	f	\N	t	t	t	t	t	t	t	t	21
22	Vision	GHG emissions (kilotons CO2)		360 Prosperity API	World Bank	WB.MPO.ENTOTGHGEKT	t	f	\N	t	t	t	t	t	t	t	t	22
23	Vision	Millions of people undernourished	Number of people undernourished (million) (3-year average)	360 Prosperity API	FAO	FAO.STAT.38	t	f	\N	t	t	t	t	t	t	t	t	23
24	Vision	Millions of people facing food and nutrition insecurity	Number of moderately or severely food insecure people (million) (3-year average)	360 Prosperity API	FAO	FAO.STAT.51	t	f	\N	t	t	t	t	t	t	t	t	24
26	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	360 Prosperity API	World Bank	WB.LPGD.SE.LPV.PRIM	t	f	\N	t	t	t	t	t	t	t	t	26
28	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	World Bank APIall/indicator	World Bank	AG.LND.FRST.K2	t	f	\N	t	t	t	t	t	t	t	t	28
25	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	360 Prosperity API	World Bank	WB.ASPIRE.per_allsp.cov_q1_tot	t	f	\N	t	t	t	t	t	t	t	t	25
27	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	360 Prosperity API	IMF	IMF.GFSR.GR_G14_GDP_PT	t	f	\N	t	t	t	t	t	t	t	t	27
29	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	360 Prosperity API	YALE.EPI	YALE.EPI.FSS	t	f	\N	t	t	t	t	t	t	t	t	29
\.


--
-- Data for Name: indicators_revised; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.indicators_revised (id, indicator_id, api_url, category, category_id, dataset, indicator_code, indicator_name, positive_negative_indicator, number_percent, notes, afghanistan_year, bangladesh_year, india_year, maldives_year, nepal_year, pakistan_year, sri_lanka_year, afghanistan_year_type, bangladesh_year_type, india_year_type, maldives_year_type, nepal_year_type, pakistan_year_type, sri_lanka_year_type) FROM stdin;
1	1	World Bank API	People	1	World Bank	SH.STA.STNT.ME.ZS	% children under five stunted	f	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
2	2	World Bank API	People	1	World Bank	SH.UHC.SRVS.CV.XD	Percentage of people receiving essential health services	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
3	3	World Bank API	Prosperity	2	World Bank	EN.ATM.PM25.MC.ZS	People exposed to hazardous air quality (%)	f	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
4	4	World Bank API	Planet	3	World Bank	ER.PTD.TOTL.ZS	Terrestrial and aquatic areas covered by protected areas	t	t	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
30	30	Used UNSD Arcgis link	Infrastructure	5	NA	NA	Percentage of population with access to reliable transport solutions all year-round	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
31	31	NA	Vision	4	NA	NA	% People with access to basic drinking water, sanitation services, and hygiene	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
34	34	Scraping for now	Digital	6	NA	NA	State of online e-governance provision (EGDI)	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
35	35	https://api.unhcr.org/population/v1/population/	Vision	4	NA	NA	Millions of people highly vulnerable to climate risks	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
36	36	NA	Planet	3	NA	NA	# Countries without renewable natural capital wealth accumulation	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
5	5	World Bank API	Planet	3	World Bank	SH.H2O.BASW.ZS	% people with access to basic drinking water	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
6	6	World Bank API	Planet	3	World Bank	SH.STA.BASS.ZS	% people with access to basic sanitation	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
7	7	World Bank API	Planet	3	World Bank	SH.STA.HYGN.ZS	% people with access to basic hygiene	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
8	8	World Bank API	Planet	3	World Bank	SN.ITK.DEFC.ZS	Prevalence of undernourishment %	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
17	17	360 prosperity api	Vision	4	World Bank	WB.PIP.headcount_national	Poverty rate (National)	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
18	18	360 prosperity api	Vision	4	World Bank	WB.MPO.POV1	Poverty rate ($2.15 poverty line)	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
19	19	360 prosperity api	Vision	4	World Bank	WB.MPO.POV2	Poverty rate (3.65 poverty line)	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
20	20	360 prosperity api	Vision	4	World Bank	WB.MPO.POV3	Poverty rate (6.85 poverty line)	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
21	21	360 prosperity api	Vision	4	World Bank	WB.PIP.gini	Inequality (Gini)	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
22	22	360 prosperity api	Vision	4	World Bank	WB.MPO.ENTOTGHGEKT	GHG emissions (kilotons CO2)	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
23	23	360 prosperity api	Vision	4	FAO	FAO.STAT.38	Millions of people undernourished	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
24	24	360 prosperity api	Vision	4	FAO	FAO.STAT.51	Millions of people facing food and nutrition insecurity	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
25	25	360 prosperity api	People	1	World Bank	WB.ASPIRE.per_allsp.cov_q1_tot	% people covered by social protection and labor programs in the poorest quintile	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
26	26	360 prosperity api	People	1	World Bank	WB.LPGD.SE.LPV.PRIM	Percentage of children who cannot read by end-of-primary-school age	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
27	27	360 prosperity api	Prosperity	2	IMF	IMF.GFSR.GR_G14_GDP_PT	Countries with tax revenue-to-GDP ratio above or equal to 15%	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
29	29	360 prosperity api	Planet	3	YALE.EPI	YALE.EPI.FSS	Proportion of fish stock within biologically sustainable levels	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
16	16	https://apiv2.worldbank.org/	Prosperity	2	World Bank	https://apiv2.worldbank.org/files?resourceName=dsa.json&locator=shared&raw=true	Countries at high risk of or in debt distress	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
32	32	NA	Cross Cutting	7	NA	NA	# Extreme poor living in FCS	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
33	33	Scraping for now	Vision	4	World Bank	WB.PIP	Prosperity Gap	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
9	9	World Bank API	Vision	4	World Bank	SN.ITK.MSFI.ZS	Prevalence of moderate or severe food insecurity in the total population %	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
10	10	World Bank API	Infrastructure	5	World Bank	EG.ELC.ACCS.ZS	% Population with access to electricity	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
11	11	World Bank API	Digital	6	World Bank	IT.NET.USER.ZS	% of the population using the internet	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
12	12	World Bank API	Cross Cutting	7	World Bank	FX.OWN.TOTL.FE.ZS	Number of women that use a financial account (million)	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
13	13	World Bank API	Cross Cutting	7	World Bank	SL.EMP.WORK.FE.ZS	Waged employment share of working age, population, of which (%) are women	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
15	15	World Bank API	Prosperity	2	World Bank	NE.GDI.FPRV.ZS	Gross Fixed Capital Formation (private sector) as a percentage of GDP	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
28	28	World Bank API	Vision	4	World Bank	AG.LND.FRST.K2	Millions of hectares of healthy terrestrial ecosystems	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
14	14	World Bank API	Cross Cutting	7	World Bank	SL.UEM.NEET.FE.ZS	Percentage of youth not in education, employment, or training, of which (%) are women	t	f	\N	2020	2020	2020	2020	2020	2020	2020	1	1	1	1	1	1	1
\.


--
-- Data for Name: scorecard_indicators2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.scorecard_indicators2 (id, secondary_id, group_name, indicator, proxy, country, year, year_type, source, value, value_n, value_map, value_standardized, positive, value_standardized_table, category_id) FROM stdin;
17	13	Vision	Poverty rate (National)	Poverty rate (National)	Maldives	2019	1	HIES, country team	5.4	5.40	5.4	5.40	-1	-5.40	4
17	14	Vision	Poverty rate (National)	Poverty rate (National)	Maldives	2019	2	Country team	5.4	5.40	5.4	5.40	-1	-5.40	4
17	16	Vision	Poverty rate (National)	Poverty rate (National)	Nepal	2022-23	1	NLSS IV	20.3	20.30	20.3	20.30	-1	-20.30	4
17	17	Vision	Poverty rate (National)	Poverty rate (National)	Nepal	2010-2011	2	Country team; NLSS; PIP	25.16	25.16	25.2	25.16	-1	-25.16	4
17	18	Vision	Poverty rate (National)	Poverty rate (National)	Nepal	\N	3	\N	-4.89	-4.89	27.3	27.32	1	27.32	4
17	19	Vision	Poverty rate (National)	Poverty rate (National)	Pakistan	2023	1	Country team	23.6	23.60	23.6	23.60	-1	-23.60	4
17	20	Vision	Poverty rate (National)	Poverty rate (National)	Pakistan	\N	2	\N	\N	\N	\N	\N	-1	\N	4
17	21	Vision	Poverty rate (National)	Poverty rate (National)	Pakistan	\N	3	\N	23.6	23.60	100	100.00	1	100.00	4
17	22	Vision	Poverty rate (National)	Poverty rate (National)	SARw/oIndia	\N	1	\N	\N	\N	\N	\N	-1	\N	4
17	23	Vision	Poverty rate (National)	Poverty rate (National)	SARw/oIndia	\N	2	\N	\N	\N	\N	\N	-1	\N	4
17	24	Vision	Poverty rate (National)	Poverty rate (National)	SARw/oIndia	\N	3	\N	\N	\N	\N	\N	1	\N	4
17	25	Vision	Poverty rate (National)	Poverty rate (National)	South Asia Region	\N	1	\N	\N	\N	\N	\N	-1	\N	4
17	26	Vision	Poverty rate (National)	Poverty rate (National)	South Asia Region	\N	2	\N	\N	\N	\N	\N	-1	\N	4
17	27	Vision	Poverty rate (National)	Poverty rate (National)	South Asia Region	\N	3	\N	\N	\N	\N	\N	1	\N	4
17	28	Vision	Poverty rate (National)	Poverty rate (National)	Sri Lanka	2019	1	HIES, country team	14.3	14.30	14.3	14.30	-1	-14.30	4
17	29	Vision	Poverty rate (National)	Poverty rate (National)	Sri Lanka	2016	2	Country team; WDI	16	16.00	16	16.00	-1	-16.00	4
17	30	Vision	Poverty rate (National)	Poverty rate (National)	Sri Lanka	\N	3	\N	-1.7	-1.70	35.5	35.46	1	35.46	4
18	31	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	Afghanistan	\N	1	\N	\N	\N	\N	\N	-1	\N	4
18	32	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	Afghanistan	\N	2	\N	\N	\N	\N	\N	-1	\N	4
18	33	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	Afghanistan	\N	3	\N	\N	\N	\N	\N	1	\N	4
18	34	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	Bangladesh	2023	1	MPO	4.9	4.90	4.9	4.90	-1	-4.90	4
18	35	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	Bangladesh	2019-2020	2	MPO	11.7	11.70	11.7	11.70	-1	-11.70	4
18	36	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	Bangladesh	\N	3	\N	-6.788247442	-6.79	9.7	9.65	1	9.65	4
18	37	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	Bhutan	2023	1	MPO	0	0.00	0	0.00	-1	0.00	4
18	38	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	Bhutan	2019-2020	2	MPO	0.8	0.80	0.8	0.80	-1	-0.80	4
18	39	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	Bhutan	\N	3	\N	-0.8	-0.80	61.6	61.65	1	61.65	4
18	40	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	India	2023	1	MPO	12.3	12.30	12.3	12.30	-1	-12.30	4
18	41	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	India	2019	2	PIP	13.2	13.20	13.2	13.20	-1	-13.20	4
18	42	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	India	\N	3	\N	-0.9	-0.90	60.8	60.78	1	60.78	4
18	43	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	Maldives	2023	1	MPO	0	0.00	0	0.00	-1	0.00	4
18	44	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	Maldives	2019	2	MPO	0	0.00	0	0.00	-1	0.00	4
18	46	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	Nepal	2022-23	1	NLSS IV	0.3	0.30	0.3	0.30	-1	-0.30	4
18	47	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	Nepal	2010	2	MPO	8.19999999999999	8.20	8.2	8.20	-1	-8.20	4
18	48	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	Nepal	\N	3	\N	-7.9	-7.90	0	0.00	1	0.00	4
18	49	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	Pakistan	2023	1	MPO	7	7.00	7	7.00	-1	-7.00	4
18	50	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	Pakistan	2019	2	MPO	4.96	4.96	5	4.96	-1	-4.96	4
18	51	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	Pakistan	\N	3	\N	2.069	2.07	86.6	86.56	1	86.56	4
18	52	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	SARw/oIndia	2023	1	SAR DST	5.7	5.70	5.7	5.70	-1	-5.70	4
18	53	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	SARw/oIndia	\N	2	SAR DST	7.544	7.54	7.5	7.54	-1	-7.54	4
18	54	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	SARw/oIndia	\N	3	\N	-1.848728122	-1.85	52.5	52.54	1	52.54	4
18	55	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	South Asia Region	2023	1	MPO	10.7	10.70	10.7	10.70	-1	-10.70	4
18	56	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	South Asia Region	\N	2	SAR DST	11.83	11.83	11.8	11.83	-1	-11.83	4
18	57	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	South Asia Region	\N	3	\N	-1.163891886	-1.16	58.5	58.49	1	58.49	4
18	58	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	Sri Lanka	2023	1	MPO	5.2	5.20	5.2	5.20	-1	-5.20	4
18	59	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	Sri Lanka	2019	2	MPO	1.58	1.58	1.6	1.58	-1	-1.58	4
18	60	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	Sri Lanka	\N	3	\N	3.617010551	3.62	100	100.00	1	100.00	4
19	61	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	Afghanistan	\N	1	\N	\N	\N	\N	\N	-1	\N	4
19	62	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	Afghanistan	\N	2	\N	\N	\N	\N	\N	-1	\N	4
19	63	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	Afghanistan	\N	3	\N	\N	\N	\N	\N	1	\N	4
19	64	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	Bangladesh	2023	1	MPO	29.3	29.30	29.3	29.30	-1	-29.30	4
19	65	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	Bangladesh	2019-2020	2	MPO	48.4	48.40	48.4	48.40	-1	-48.40	4
19	66	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	Bangladesh	\N	3	\N	-19.1373539	-19.14	29.5	29.53	1	29.53	4
19	67	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	Bhutan	2023	1	MPO	0.4	0.40	0.4	0.40	-1	-0.40	4
19	68	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	Bhutan	2019-2020	2	MPO	8.69999999999999	8.70	8.7	8.70	-1	-8.70	4
19	69	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	Bhutan	\N	3	\N	-8.290448285	-8.29	53.2	53.15	1	53.15	4
19	70	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	India	2023	1	MPO	45.3	45.30	45.3	45.30	-1	-45.30	4
19	71	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	India	2019	2	PIP	43.97	43.97	44	43.97	-1	-43.97	4
19	72	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	India	\N	3	\N	1.33	1.33	74.1	74.10	1	74.10	4
19	73	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	Maldives	2023	1	MPO	0	0.00	0	0.00	-1	0.00	4
19	74	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	Maldives	2019	2	MPO	0	0.00	0	0.00	-1	0.00	4
19	75	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	Maldives	\N	3	\N	\N	\N	\N	\N	1	\N	4
19	76	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	Nepal	2022-23	1	NLSS IV	7.3	7.30	7.3	7.30	-1	-7.30	4
19	77	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	Nepal	2010	2	MPO	40	40.00	40	40.00	-1	-40.00	4
19	78	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	Nepal	\N	3	\N	-32.7	-32.70	0	0.00	1	0.00	4
19	79	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	Pakistan	2023	1	MPO	40.2	40.20	40.2	40.20	-1	-40.20	4
19	80	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	Pakistan	2019	2	MPO	39.49	39.49	39.5	39.49	-1	-39.49	4
19	81	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	Pakistan	\N	3	\N	0.71	0.71	72.8	72.75	1	72.75	4
19	82	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	SARw/oIndia	2023	1	SAR DST	33.2	33.20	33.2	33.20	-1	-33.20	4
19	83	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	SARw/oIndia	\N	2	SAR DST	42.666	42.67	42.7	42.67	-1	-42.67	4
19	84	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	SARw/oIndia	\N	3	\N	-9.47198938	-9.47	50.6	50.58	1	50.58	4
19	85	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	South Asia Region	2023	1	MPO	42.3	42.30	42.3	42.30	-1	-42.30	4
19	86	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	South Asia Region	\N	2	SAR DST	43.66	43.66	43.7	43.66	-1	-43.66	4
19	87	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	South Asia Region	\N	3	\N	-1.346410227	-1.35	68.3	68.28	1	68.28	4
19	88	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	Sri Lanka	2023	1	MPO	25.9	25.90	25.9	25.90	-1	-25.90	4
19	89	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	Sri Lanka	2019	2	MPO	12.7	12.70	12.7	12.70	-1	-12.70	4
19	90	Vision	Poverty rate (3.65 poverty line)	Poverty rate (3.65 poverty line)	Sri Lanka	\N	3	\N	13.2216485	13.22	100	100.00	1	100.00	4
20	92	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	Afghanistan	\N	2	\N	\N	\N	\N	\N	-1	\N	4
20	93	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	Afghanistan	\N	3	\N	\N	\N	\N	\N	1	\N	4
20	94	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	Bangladesh	2023	1	MPO	73.5	73.50	73.5	73.50	-1	-73.50	4
20	95	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	Bangladesh	2019-2020	2	MPO	85.8	85.80	85.8	85.80	-1	-85.80	4
20	96	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	Bangladesh	\N	3	\N	-12.25809069	-12.26	46.8	46.83	1	46.83	4
20	97	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	Bhutan	2023	1	MPO	7.8	7.80	7.8	7.80	-1	-7.80	4
20	98	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	Bhutan	2019-2020	2	MPO	38	38.00	38	38.00	-1	-38.00	4
20	99	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	Bhutan	\N	3	\N	-30.19307968	-30.19	12.6	12.61	1	12.61	4
20	100	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	India	2023	1	MPO	81.5999999999999	81.60	81.6	81.60	-1	-81.60	4
20	101	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	India	2019	2	PIP	80.72	80.72	80.7	80.72	-1	-80.72	4
20	102	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	India	\N	3	\N	\N	\N	\N	\N	1	\N	4
20	103	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	Maldives	2023	1	MPO	3.9	3.90	3.9	3.90	-1	-3.90	4
20	104	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	Maldives	2020	2	MPO	3.88	3.88	3.9	3.88	-1	-3.88	4
20	105	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	Maldives	\N	3	\N	-0.01896	-0.02	70.2	70.18	1	70.18	4
20	106	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	Nepal	2022-23	1	NLSS IV	43.6	43.60	43.6	43.60	-1	-43.60	4
20	107	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	Nepal	2010	2	MPO	80.4	80.40	80.4	80.40	-1	-80.40	4
20	108	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	Nepal	\N	3	\N	-36.8	-36.80	0	0.00	1	0.00	4
20	109	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	Pakistan	2023	1	MPO	83	83.00	83	83.00	-1	-83.00	4
20	110	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	Pakistan	2019	2	MPO	84.15	84.15	84.2	84.15	-1	-84.15	4
20	111	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	Pakistan	\N	3	\N	-1.125	-1.13	68.1	68.07	1	68.07	4
20	112	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	SARw/oIndia	2023	1	SAR DST	75.9	75.90	75.9	75.90	-1	-75.90	4
20	113	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	SARw/oIndia	\N	2	SAR DST	83.31	83.31	83.3	83.31	-1	-83.31	4
20	114	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	SARw/oIndia	\N	3	\N	-7.436884481	-7.44	56	56.03	1	56.03	4
20	115	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	South Asia Region	2023	1	MPO	80.2	80.20	80.2	80.20	-1	-80.20	4
20	116	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	South Asia Region	\N	2	SAR DST	81.3499999999999	81.35	81.3	81.35	-1	-81.35	4
20	117	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	South Asia Region	\N	3	\N	-1.13733146	-1.14	68	68.05	1	68.05	4
20	118	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	Sri Lanka	2023	1	MPO	65.5999999999999	65.60	65.6	65.60	-1	-65.60	4
20	119	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	Sri Lanka	2019	2	MPO	49.99	49.99	50	49.99	-1	-49.99	4
20	120	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	Sri Lanka	\N	3	\N	15.61	15.61	100	100.00	1	100.00	4
33	121	Vision	Prosperity Gap	Prosperity Gap	Afghanistan	\N	1	\N	\N	\N	\N	\N	-1	\N	4
33	122	Vision	Prosperity Gap	Prosperity Gap	Afghanistan	\N	2	\N	\N	\N	\N	\N	-1	\N	4
33	123	Vision	Prosperity Gap	Prosperity Gap	Afghanistan	\N	3	\N	\N	\N	\N	\N	1	\N	4
33	124	Vision	Prosperity Gap	Prosperity Gap	Bangladesh	2022	1	WB (Kraay et al., 2023)	6.8	6.80	6.8	6.80	-1	-6.80	4
33	125	Vision	Prosperity Gap	Prosperity Gap	Bangladesh	2016	2	WB (Kraay et al., 2023)	7.58	7.58	7.6	7.58	-1	-7.58	4
33	126	Vision	Prosperity Gap	Prosperity Gap	Bangladesh	\N	3	\N	-0.74	-0.74	72.9	72.93	1	72.93	4
33	127	Vision	Prosperity Gap	Prosperity Gap	Bhutan	2022	1	BLSS	2.6	2.60	2.6	2.60	-1	-2.60	4
33	128	Vision	Prosperity Gap	Prosperity Gap	Bhutan	2017	2	WB (Kraay et al., 2023)	3.61	3.61	3.6	3.61	-1	-3.61	4
33	129	Vision	Prosperity Gap	Prosperity Gap	Bhutan	\N	3	\N	-1.01	-1.01	63.7	63.67	1	63.67	4
33	130	Vision	Prosperity Gap	Prosperity Gap	India	2021	1	WB (Kraay et al., 2023)	7.5	7.50	7.5	7.50	-1	-7.50	4
33	131	Vision	Prosperity Gap	Prosperity Gap	India	2019	2	WB (Kraay et al., 2023)	7.46	7.46	7.5	7.46	-1	-7.46	4
33	132	Vision	Prosperity Gap	Prosperity Gap	India	\N	3	\N	0.05	0.05	100	100.00	1	100.00	4
33	133	Vision	Prosperity Gap	Prosperity Gap	Maldives	2019	1	WB (Kraay et al., 2023)	1.7	1.70	1.7	1.70	-1	-1.70	4
33	134	Vision	Prosperity Gap	Prosperity Gap	Maldives	2016	2	WB (Kraay et al., 2023)	1.75	1.75	1.8	1.75	-1	-1.75	4
33	135	Vision	Prosperity Gap	Prosperity Gap	Maldives	\N	3	\N	-0.01	-0.01	97.9	97.94	1	97.94	4
33	136	Vision	Prosperity Gap	Prosperity Gap	Nepal	2022-2023	1	NLSS IV	3.8	3.80	3.8	3.80	-1	-3.80	4
33	137	Vision	Prosperity Gap	Prosperity Gap	Nepal	2010	2	WB (Kraay et al., 2023)	6.65	6.65	6.7	6.65	-1	-6.65	4
33	138	Vision	Prosperity Gap	Prosperity Gap	Nepal	\N	3	\N	-2.867885	-2.87	0	0.00	1	0.00	4
33	139	Vision	Prosperity Gap	Prosperity Gap	Pakistan	2018	1	WB (Kraay et al., 2023)	6.5	6.50	6.5	6.50	-1	-6.50	4
33	140	Vision	Prosperity Gap	Prosperity Gap	Pakistan	2015	2	WB (Kraay et al., 2023)	6.44	6.44	6.4	6.44	-1	-6.44	4
33	141	Vision	Prosperity Gap	Prosperity Gap	Pakistan	\N	3	\N	0.01	0.01	98.6	98.63	1	98.63	4
33	142	Vision	Prosperity Gap	Prosperity Gap	SARw/oIndia	2018-2023	1	SAR DST	6.3	6.30	6.3	6.30	-1	-6.30	4
33	143	Vision	Prosperity Gap	Prosperity Gap	SARw/oIndia	\N	2	SAR DST	6.76	6.76	6.8	6.76	-1	-6.76	4
33	144	Vision	Prosperity Gap	Prosperity Gap	SARw/oIndia	\N	3	\N	-0.467818434	-0.47	82.3	82.25	1	82.25	4
33	145	Vision	Prosperity Gap	Prosperity Gap	South Asia Region	2018-2023	1	SAR DST	7.2	7.20	7.2	7.20	-1	-7.20	4
33	146	Vision	Prosperity Gap	Prosperity Gap	South Asia Region	\N	2	SAR DST	7.32	7.32	7.3	7.32	-1	-7.32	4
33	147	Vision	Prosperity Gap	Prosperity Gap	South Asia Region	\N	3	\N	-0.12	-0.12	94.2	94.17	1	94.17	4
33	148	Vision	Prosperity Gap	Prosperity Gap	Sri Lanka	2019	1	WB (Kraay et al., 2023)	4.1	4.10	4.1	4.10	-1	-4.10	4
33	149	Vision	Prosperity Gap	Prosperity Gap	Sri Lanka	2016	2	WB (Kraay et al., 2023)	4.26	4.26	4.3	4.26	-1	-4.26	4
33	150	Vision	Prosperity Gap	Prosperity Gap	Sri Lanka	\N	3	\N	-0.21	-0.21	91.1	91.09	1	91.09	4
21	151	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	Afghanistan	2019	1	IE-LFS	30.1	30.10	30.1	30.10	-1	-30.10	4
21	152	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	Afghanistan	\N	2	\N	\N	\N	\N	\N	-1	\N	4
21	153	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	Afghanistan	\N	3	\N	\N	\N	\N	\N	1	\N	4
21	154	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	Bangladesh	2022	1	PIP	33.4	33.40	33.4	33.40	-1	-33.40	4
21	155	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	Bangladesh	2016	2	PIP	32.3852725	32.39	32.4	32.39	-1	-32.39	4
21	156	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	Bangladesh	\N	3	\N	1.0147275	1.01	95.3	95.27	1	95.27	4
21	157	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	Bhutan	2022	1	PIP	28.5	28.50	28.5	28.50	-1	-28.50	4
21	158	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	Bhutan	2017	2	PIP	37.44140955	37.44	37.4	37.44	-1	-37.44	4
21	159	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	Bhutan	\N	3	\N	-8.981409555	-8.98	0	0.00	1	0.00	4
21	160	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	India	2021	1	PIP	32.8	32.80	32.8	32.80	-1	-32.80	4
21	161	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	India	2019	2	PIP	33.80760042	33.81	33.8	33.81	-1	-33.81	4
21	162	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	India	\N	3	\N	-1.007600424	-1.01	76	76.00	1	76.00	4
21	163	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	Maldives	2019	1	PIP	29.3	29.30	29.3	29.30	-1	-29.30	4
21	164	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	Maldives	2016	2	PIP	31.28564713	31.29	31.3	31.29	-1	-31.29	4
21	165	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	Maldives	\N	3	\N	-1.995647127	-2.00	66.6	66.58	1	66.58	4
21	166	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	Nepal	2023	1	NLSS, Country team	30	30.00	30	30.00	-1	-30.00	4
21	167	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	Nepal	2010	2	PIP	32.84058618	32.84	32.8	32.84	-1	-32.84	4
21	168	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	Nepal	\N	3	\N	-2.820586177	-2.82	58.7	58.72	1	58.72	4
21	169	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	Pakistan	2023	1	Country team; microsimulation	31.1	31.10	31.1	31.10	-1	-31.10	4
21	170	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	Pakistan	2018	2	PIP	29.5892656	29.59	29.6	29.59	-1	-29.59	4
21	171	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	Pakistan	\N	3	\N	1.510734402	1.51	100	100.00	1	100.00	4
21	172	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	SARw/oIndia	2019-2023	1	SAR DST	0	0.00	0	0.00	-1	0.00	4
21	173	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	SARw/oIndia	2010-2019	2	SAR DST	0	0.00	0	0.00	-1	0.00	4
21	174	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	SARw/oIndia	\N	3	\N	0	0.00	85.6	85.60	1	85.60	4
21	175	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	South Asia Region	2019-2023	1	WID	0	0.00	0	0.00	-1	0.00	4
21	176	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	South Asia Region	2010-2019	2	SAR DST	0	0.00	0	0.00	-1	0.00	4
21	177	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	South Asia Region	\N	3	\N	0	0.00	85.6	85.60	1	85.60	4
21	178	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	Sri Lanka	2019	1	PIP	37.7	37.70	37.7	37.70	-1	-37.70	4
21	179	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	Sri Lanka	2016	2	PIP	39.34577336	39.35	39.3	39.35	-1	-39.35	4
21	180	Vision	Inequality (Gini)	Country level: Gini coefficient. Regional: Number of countries with a Gini coefficient above 40	Sri Lanka	\N	3	\N	-1.685773357	-1.69	69.5	69.53	1	69.53	4
22	181	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	Afghanistan	\N	1	\N	\N	\N	\N	\N	-1	\N	4
22	182	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	Afghanistan	\N	2	\N	\N	\N	\N	\N	-1	\N	4
22	183	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	Afghanistan	\N	3	\N	\N	\N	\N	\N	1	\N	4
22	184	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	Bangladesh	2023	1	MPO	272832.4378	272832.44	272832	5.63	-1	-5.63	4
22	185	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	Bangladesh	2019	2	MPO	229712.5	229712.50	229712	5.68	-1	-5.68	4
22	186	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	Bangladesh	\N	3	\N	43119.93783	43119.94	43120	5.35	1	5.35	4
22	187	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	Bhutan	2023	1	MPO	-4957.224418	-4957.22	-4957	0.00	-1	0.00	4
22	188	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	Bhutan	2019	2	MPO	-5316	-5316.00	-5316	0.00	-1	0.00	4
22	189	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	Bhutan	\N	3	\N	358.775582	358.78	359	0.00	1	0.00	4
22	190	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	India	2023	1	MPO	4011345.713	4011345.70	4011346	81.36	-1	-81.36	4
22	191	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	India	2019	2	MPO	3380305.61	3380305.60	3380306	81.82	-1	-81.82	4
22	192	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	India	\N	3	\N	631040.1034	631040.10	631040	78.97	1	78.97	4
22	193	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	Maldives	2023	1	MPO	3284.499853	3284.50	3284	0.17	-1	-0.17	4
22	194	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	Maldives	2019	2	MPO	2490.7	2490.70	2491	0.19	-1	-0.19	4
22	195	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	Maldives	\N	3	\N	793.7998535	793.80	794	0.05	1	0.05	4
22	196	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	Nepal	2023	1	MPO	52711.23559	52711.24	52711	1.17	-1	-1.17	4
22	197	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	Nepal	2019	2	MPO	48399.37	48399.37	48399	1.30	-1	-1.30	4
22	198	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	Nepal	\N	3	\N	4311.865587	4311.87	4312	0.49	1	0.49	4
22	199	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	Pakistan	2023	1	MPO	553798.2391	553798.24	553798	11.32	-1	-11.32	4
22	200	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	Pakistan	2019	2	MPO	439493.85	439493.85	439494	10.75	-1	-10.75	4
22	201	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	Pakistan	\N	3	\N	114304.3891	114304.39	114304	14.27	1	14.27	4
22	202	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	SARw/oIndia	2023	1	SAR DST	919997	919997.00	919997	18.74	-1	-18.74	4
22	203	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	SARw/oIndia	2019	2	SAR DST	752041.22	752041.22	752041	18.30	-1	-18.30	4
22	204	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	SARw/oIndia	\N	3	\N	167955.5154	167955.52	167956	20.99	1	20.99	4
22	205	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	South Asia Region	2023	1	MPO	4931342.449	4931342.40	4931342	100.00	-1	-100.00	4
22	206	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	South Asia Region	2019	2	MPO	4132346.83	4132346.80	4132347	100.00	-1	-100.00	4
22	207	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	South Asia Region	\N	3	\N	798995.6188	798995.62	798996	100.00	1	100.00	4
22	208	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	Sri Lanka	2023	1	MPO	42327.54752	42327.55	42328	0.96	-1	-0.96	4
22	209	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	Sri Lanka	2019	2	MPO	37260.8	37260.80	37261	1.03	-1	-1.03	4
22	210	Vision	GHG emissions (kilotons CO2)	GHG emissions (kilotons CO2)	Sri Lanka	\N	3	\N	5066.747515	5066.75	5067	0.59	1	0.59	4
35	211	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	Afghanistan	\N	1	\N	\N	\N	\N	\N	-1	\N	4
35	212	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	Afghanistan	\N	2	\N	\N	\N	\N	\N	-1	\N	4
35	213	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	Afghanistan	\N	3	\N	\N	\N	\N	\N	1	\N	4
35	214	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	Bangladesh	2016	1	GSG5	150.6	150.60	0.1	0.13	-1	-0.13	4
35	215	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	Bangladesh	\N	2	\N	\N	\N	\N	\N	-1	\N	4
35	216	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	Bangladesh	\N	3	\N	\N	\N	\N	\N	1	\N	4
35	217	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	Bhutan	2017	1	GSG5	0.2	0.20	0	0.00	-1	0.00	4
35	218	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	Bhutan	\N	2	\N	\N	\N	\N	\N	-1	\N	4
35	219	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	Bhutan	\N	3	\N	\N	\N	\N	\N	1	\N	4
35	220	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	India	2011	1	GSG5	752	752.00	0.7	0.67	-1	-0.67	4
35	221	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	India	\N	2	\N	\N	\N	\N	\N	-1	\N	4
35	222	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	India	\N	3	\N	\N	\N	\N	\N	1	\N	4
35	223	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	Maldives	2019	1	GSG5	0	0.00	0	0.00	-1	0.00	4
35	224	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	Maldives	\N	2	\N	\N	\N	\N	\N	-1	\N	4
35	225	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	Maldives	\N	3	\N	\N	\N	\N	\N	1	\N	4
35	226	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	Nepal	2010	1	GSG5	14.5	14.50	0	0.01	-1	-0.01	4
35	227	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	Nepal	\N	2	\N	\N	\N	\N	\N	-1	\N	4
35	228	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	Nepal	\N	3	\N	\N	\N	\N	\N	1	\N	4
35	229	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	Pakistan	2018	1	GSG5	197.2	197.20	0.2	0.18	-1	-0.18	4
35	230	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	Pakistan	\N	2	\N	\N	\N	\N	\N	-1	\N	4
35	231	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	Pakistan	\N	3	\N	\N	\N	\N	\N	1	\N	4
35	232	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	SARw/oIndia	2010-2022	1	SAR DST	365.8	365.80	0.3	0.33	-1	-0.33	4
35	233	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	SARw/oIndia	\N	2	\N	\N	\N	\N	\N	-1	\N	4
35	234	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	SARw/oIndia	\N	3	\N	\N	\N	\N	\N	1	\N	4
35	235	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	South Asia Region	2010-2022	1	GSG5 (Doan et al., 2023)	1117.8	1117.80	1	1.00	-1	-1.00	4
35	236	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	South Asia Region	\N	2	\N	\N	\N	\N	\N	-1	\N	4
35	237	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	South Asia Region	\N	3	\N	\N	\N	\N	\N	1	\N	4
35	238	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	Sri Lanka	2019	1	GSG5	3.3	3.30	0	0.00	-1	0.00	4
35	239	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	Sri Lanka	\N	2	\N	\N	\N	\N	\N	-1	\N	4
35	240	Vision	Millions of people highly vulnerable to climate risks	Millions of people highly vulnerable to climate risks	Sri Lanka	\N	3	\N	\N	\N	\N	\N	1	\N	4
28	241	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	Afghanistan	2020	1	FAO	1.2	1.20	1	1.34	1	1.34	4
28	242	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	Afghanistan	2019	2	UNSDG	1.20844	1.21	1	1.35	1	1.35	4
28	243	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	Afghanistan	\N	3	\N	0	0.00	0	13.76	1	13.76	4
28	244	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	Bangladesh	2020	1	FAO	1.9	1.90	2	2.12	1	2.12	4
28	245	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	Bangladesh	2019	2	UNSDG	1.8834	1.88	2	2.10	1	2.10	4
28	246	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	Bangladesh	\N	3	\N	0	0.00	0	13.76	1	13.76	4
28	247	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	Bhutan	2020	1	FAO	2.7	2.70	3	3.01	1	3.01	4
28	248	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	Bhutan	2019	2	UNSDG	2.7231	2.72	3	3.04	1	3.04	4
28	249	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	Bhutan	\N	3	\N	0.00198	0.00	0	14.41	1	14.41	4
28	250	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	India	2020	1	FAO	72.2	72.20	72	80.40	1	80.40	4
28	251	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	India	2019	2	UNSDG	71.8936	71.89	72	80.28	1	80.28	4
28	252	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	India	\N	3	\N	0.2664	0.27	0	100.00	1	100.00	4
28	253	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	Maldives	2020	1	FAO	0	0.00	0	0.00	1	0.00	4
28	254	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	Maldives	2019	2	UNSDG	0.00082	0.00	0	0.00	1	0.00	4
28	255	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	Maldives	\N	3	\N	0	0.00	0	13.76	1	13.76	4
28	256	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	Nepal	2020	1	FAO	6	6.00	6	6.68	1	6.68	4
28	257	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	Nepal	2019	2	UNSDG	5.96203	5.96	6	6.66	1	6.66	4
28	258	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	Nepal	\N	3	\N	0	0.00	0	13.76	1	13.76	4
28	259	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	Pakistan	2020	1	FAO	3.7	3.70	4	4.12	1	4.12	4
28	260	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	Pakistan	2019	2	UNSDG	3.76724	3.77	4	4.21	1	4.21	4
28	261	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	Pakistan	\N	3	\N	-0.04134	-0.04	0	0.38	1	0.38	4
28	262	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	SARw/oIndia	2020	1	SAR DST	17.6	17.60	18	19.60	1	19.60	4
28	263	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	SARw/oIndia	2019	2	SAR DST	17.66121	17.66	18	19.72	1	19.72	4
28	264	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	SARw/oIndia	\N	3	\N	-0.04252	-0.04	0	0.00	1	0.00	4
28	265	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	South Asia Region	2020	1	FAO	89.8	89.80	90	100.00	1	100.00	4
28	266	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	South Asia Region	2019	2	UNSDG	89.55481	89.55	90	100.00	1	100.00	4
28	267	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	South Asia Region	\N	3	\N	0.22388	0.22	0	86.24	1	86.24	4
28	268	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	Sri Lanka	2020	1	FAO	2.1	2.10	2	2.34	1	2.34	4
28	269	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	Sri Lanka	2019	2	UNSDG	2.11618	2.12	2	2.36	1	2.36	4
28	270	Vision	Millions of hectares of healthy terrestrial ecosystems	Forest area (millions of hectares)	Sri Lanka	\N	3	\N	-0.00316	0.00	0	12.74	1	12.74	4
23	271	Vision	Millions of people undernourished	Millions of people undernourished	Afghanistan	2020-2022	1	FAO	12	12.00	29.9	29.93	-1	-29.93	4
23	272	Vision	Millions of people undernourished	Millions of people undernourished	Afghanistan	2018-2020	2	FAO	10.2	10.20	27	27.01	-1	-27.01	4
23	273	Vision	Millions of people undernourished	Millions of people undernourished	Afghanistan	\N	3	\N	1.8	1.80	4.9	4.89	1	4.89	4
23	274	Vision	Millions of people undernourished	Millions of people undernourished	Bangladesh	2020-2022	1	FAO	18.9	18.90	11.2	11.16	-1	-11.16	4
23	275	Vision	Millions of people undernourished	Millions of people undernourished	Bangladesh	2018-2020	2	FAO	19.6	19.60	11.8	11.84	-1	-11.84	4
23	276	Vision	Millions of people undernourished	Millions of people undernourished	Bangladesh	\N	3	\N	-0.7	-0.70	0	0.00	1	0.00	4
23	277	Vision	Millions of people undernourished	Millions of people undernourished	Bhutan	2022	1	WDI, Census, country team	0	0.00	0	0.00	-1	0.00	4
23	278	Vision	Millions of people undernourished	Millions of people undernourished	Bhutan	\N	2	\N	\N	\N	\N	\N	-1	\N	4
23	279	Vision	Millions of people undernourished	Millions of people undernourished	Bhutan	\N	3	\N	\N	\N	\N	\N	1	\N	4
23	280	Vision	Millions of people undernourished	Millions of people undernourished	India	2020-2022	1	FAO	233.9	233.90	16.6	16.62	-1	-16.62	4
23	281	Vision	Millions of people undernourished	Millions of people undernourished	India	2018-2020	2	FAO	199.7	199.70	14.4	14.44	-1	-14.44	4
23	282	Vision	Millions of people undernourished	Millions of people undernourished	India	\N	3	\N	34.2	34.20	68.3	68.30	1	68.30	4
23	283	Vision	Millions of people undernourished	Millions of people undernourished	Maldives	\N	1	FAO	\N	\N	\N	\N	-1	\N	4
23	284	Vision	Millions of people undernourished	Millions of people undernourished	Maldives	\N	2	\N	\N	\N	\N	\N	-1	\N	4
23	285	Vision	Millions of people undernourished	Millions of people undernourished	Maldives	\N	3	\N	\N	\N	\N	\N	1	\N	4
23	286	Vision	Millions of people undernourished	Millions of people undernourished	Nepal	2020-2022	1	FAO	1.6	1.60	5.3	5.33	-1	-5.33	4
23	287	Vision	Millions of people undernourished	Millions of people undernourished	Nepal	2018-2020	2	FAO	1.4	1.40	4.9	4.86	-1	-4.86	4
23	288	Vision	Millions of people undernourished	Millions of people undernourished	Nepal	\N	3	\N	0.2	0.20	1.8	1.76	1	1.76	4
23	289	Vision	Millions of people undernourished	Millions of people undernourished	Pakistan	2020-2022	1	FAO	42.8	42.80	18.5	18.50	-1	-18.50	4
23	290	Vision	Millions of people undernourished	Millions of people undernourished	Pakistan	2018-2020	2	FAO	29.2	29.20	13.1	13.08	-1	-13.08	4
23	291	Vision	Millions of people undernourished	Millions of people undernourished	Pakistan	\N	3	\N	13.6	13.60	28	27.98	1	27.98	4
23	292	Vision	Millions of people undernourished	Millions of people undernourished	SARw/oIndia	2020-2022	1	SAR DST	76.4	76.40	15.5	15.45	-1	-15.45	4
23	293	Vision	Millions of people undernourished	Millions of people undernourished	SARw/oIndia	2018-2020	2	SAR DST	61.8	61.80	12.9	12.92	-1	-12.92	4
23	294	Vision	Millions of people undernourished	Millions of people undernourished	SARw/oIndia	\N	3	\N	16.2	16.20	33.1	33.07	1	33.07	4
23	295	Vision	Millions of people undernourished	Millions of people undernourished	South Asia Region	2020-2022	1	FAO	310.3	310.30	16.3	16.32	-1	-16.32	4
23	296	Vision	Millions of people undernourished	Millions of people undernourished	South Asia Region	2018-2020	2	SAR DST	261.5	261.50	14	14.05	-1	-14.05	4
23	297	Vision	Millions of people undernourished	Millions of people undernourished	South Asia Region	\N	3	\N	50.4	50.40	100	100.00	1	100.00	4
23	298	Vision	Millions of people undernourished	Millions of people undernourished	Sri Lanka	2020-2022	1	FAO	1.1	1.10	5	4.96	-1	-4.96	4
23	299	Vision	Millions of people undernourished	Millions of people undernourished	Sri Lanka	2018-2020	2	FAO	1.4	1.40	6.4	6.42	-1	-6.42	4
23	300	Vision	Millions of people undernourished	Millions of people undernourished	Sri Lanka	\N	3	\N	-0.3	-0.30	0.8	0.78	1	0.78	4
24	301	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	Afghanistan	2020-2022	1	FAO	31.7	31.70	79.1	79.05	-1	-79.05	4
24	302	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	Afghanistan	2018-2020	2	FAO	23.9	23.90	63.3	63.28	-1	-63.28	4
24	303	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	Afghanistan	\N	3	\N	7.8	7.80	14.6	14.56	1	14.56	4
24	304	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	Bangladesh	2020-2022	1	FAO	52.7	52.70	31.1	31.12	-1	-31.12	4
24	305	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	Bangladesh	2018-2020	2	FAO	52.8	52.80	31.9	31.90	-1	-31.90	4
24	306	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	Bangladesh	\N	3	\N	-0.1	-0.10	0	0.00	1	0.00	4
24	307	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	Bhutan	\N	1	\N	\N	\N	\N	\N	-1	\N	4
24	308	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	Bhutan	\N	2	\N	\N	\N	\N	\N	-1	\N	4
24	309	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	Bhutan	\N	3	\N	\N	\N	\N	\N	1	\N	4
24	310	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	India	\N	1	\N	\N	\N	\N	\N	-1	\N	4
24	311	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	India	\N	2	\N	\N	\N	\N	\N	-1	\N	4
24	312	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	India	\N	3	\N	\N	\N	\N	\N	1	\N	4
24	313	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	Maldives	2023	1	FAO	0.1	0.10	19.2	19.19	-1	-19.19	4
24	314	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	Maldives	\N	2	\N	\N	\N	\N	\N	-1	\N	4
24	315	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	Maldives	\N	3	\N	\N	\N	\N	\N	1	\N	4
24	316	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	Nepal	2020-2022	1	FAO	11.2	11.20	37.3	37.29	-1	-37.29	4
24	317	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	Nepal	2018-2020	2	FAO	10.5	10.50	36.4	36.42	-1	-36.42	4
24	318	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	Nepal	\N	3	\N	0.7	0.70	1.5	1.47	1	1.47	4
24	319	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	Pakistan	2020-2022	1	FAO	97.9	97.90	42.3	42.31	-1	-42.31	4
24	320	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	Pakistan	2018-2020	2	FAO	54.2	54.20	24.3	24.27	-1	-24.27	4
24	321	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	Pakistan	\N	3	\N	43.7	43.70	80.7	80.71	1	80.71	4
24	322	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	SARw/oIndia	2020-2023	1	SAR DST	197.5	197.50	40	39.95	-1	-39.95	4
5	678	Planet	% people with access to basic drinking water	% people with access to basic drinking water	Nepal	\N	3	\N	7.2	7.20	95.1	95.06	1	95.06	3
24	323	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	SARw/oIndia	2018-2020	2	SAR DST	143.3	143.30	29.9	29.95	-1	-29.95	4
24	324	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	SARw/oIndia	\N	3	\N	54.17	54.17	100	100.00	1	100.00	4
24	325	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	South Asia Region	2020-2023	1	FAO	\N	\N	\N	\N	-1	\N	4
24	326	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	South Asia Region	\N	2	\N	\N	\N	\N	\N	-1	\N	4
24	327	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	South Asia Region	\N	3	\N	\N	\N	\N	\N	1	\N	4
24	328	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	Sri Lanka	2023	1	FAO, WFP	3.9	3.90	17.7	17.70	-1	-17.70	4
24	329	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	Sri Lanka	2018-2020	2	FAO	1.9	1.90	8.7	8.71	-1	-8.71	4
24	330	Vision	Millions of people facing food and nutrition insecurity	Millions of people facing food and nutrition insecurity	Sri Lanka	\N	3	\N	2	2.00	3.9	3.87	1	3.87	4
31	331	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	Afghanistan	\N	1	\N	\N	\N	\N	\N	1	\N	4
31	332	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	Afghanistan	\N	2	\N	\N	\N	\N	\N	1	\N	4
31	333	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	Afghanistan	\N	3	\N	\N	\N	\N	\N	1	\N	4
31	334	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	Bangladesh	2022	1	SAR DST	69.5	69.50	70	69.50	1	69.50	4
31	335	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	Bangladesh	\N	2	\N	\N	\N	\N	\N	1	\N	4
31	336	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	Bangladesh	\N	3	\N	\N	\N	\N	\N	1	\N	4
31	337	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	Bhutan	\N	1	\N	\N	\N	\N	\N	1	\N	4
31	338	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	Bhutan	\N	2	\N	\N	\N	\N	\N	1	\N	4
31	339	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	Bhutan	\N	3	\N	\N	\N	\N	\N	1	\N	4
31	340	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	India	2019-21	1	DHS/MPI, country team	66	66.00	66	66.00	1	66.00	4
31	341	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	India	2015-2016	2	Country team; DHS/MPI	43	43.00	43	43.00	1	43.00	4
31	342	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	India	\N	3	\N	23	23.00	\N	\N	1	\N	4
26	411	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	Pakistan	\N	3	\N	\N	\N	\N	\N	1	\N	1
31	343	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	Maldives	\N	1	SAR DST	\N	\N	\N	\N	1	\N	4
31	344	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	Maldives	\N	2	\N	\N	\N	\N	\N	1	\N	4
31	345	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	Maldives	\N	3	\N	\N	\N	\N	\N	1	\N	4
31	346	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	Nepal	2022	1	DHS, country team	55.2	55.20	55	55.20	1	55.20	4
31	347	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	Nepal	\N	2	\N	\N	\N	\N	\N	1	\N	4
31	348	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	Nepal	\N	3	\N	\N	\N	\N	\N	1	\N	4
31	349	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	Pakistan	2018	1	SAR DST	57.5	57.50	58	57.50	1	57.50	4
31	350	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	Pakistan	\N	2	\N	\N	\N	\N	\N	1	\N	4
31	351	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	Pakistan	\N	3	\N	\N	\N	\N	\N	1	\N	4
31	352	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	SARw/oIndia	2018-2022	1	SAR DST	62.5	62.50	62	62.50	1	62.50	4
31	353	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	SARw/oIndia	\N	2	\N	\N	\N	\N	\N	1	\N	4
31	354	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	SARw/oIndia	\N	3	\N	\N	\N	\N	\N	1	\N	4
31	355	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	South Asia Region	2018-2022	1	SAR DST	65.0999999999999	65.10	65	65.10	1	65.10	4
31	356	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	South Asia Region	\N	2	\N	\N	\N	\N	\N	1	\N	4
8	758	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	Bhutan	\N	2	\N	\N	\N	\N	\N	-1	\N	3
31	357	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	South Asia Region	\N	3	\N	\N	\N	\N	\N	1	\N	4
31	358	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	Sri Lanka	2019	1	SAR DST	70.8	70.80	71	70.80	1	70.80	4
31	359	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	Sri Lanka	\N	2	\N	\N	\N	\N	\N	1	\N	4
31	360	Vision	% People with access to basic drinking water, sanitation services, and hygiene	% People with access to basic drinking water, sanitation services, and hygiene	Sri Lanka	\N	3	\N	\N	\N	\N	\N	1	\N	4
25	361	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	Afghanistan	2011	1	WDI	12.5	12.50	12.5	12.50	1	12.50	1
25	362	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	Afghanistan	\N	2	\N	\N	\N	\N	\N	1	\N	1
25	363	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	Afghanistan	\N	3	\N	\N	\N	\N	\N	1	\N	1
25	364	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	Bangladesh	2022	1	Aspire, WDI, HIES, Country team	54.8	54.80	54.8	54.80	1	54.80	1
25	365	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	Bangladesh	2016	2	ASPIRE	55.7	55.70	55.7	55.70	1	55.70	1
25	366	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	Bangladesh	\N	3	\N	-0.9	-0.90	36.5	36.47	1	36.47	1
25	367	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	Bhutan	2017	1	ASPIRE	2.9	2.90	2.9	2.90	1	2.90	1
25	368	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	Bhutan	2017	2	ASPIRE	2.9	2.90	2.9	2.90	1	2.90	1
25	369	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	Bhutan	\N	3	\N	-0.012570826	-0.01	60.1	60.08	1	60.08	1
25	370	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	India	\N	1	\N	\N	\N	\N	\N	1	\N	1
25	371	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	India	\N	2	\N	\N	\N	\N	\N	1	\N	1
25	372	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	India	\N	3	\N	\N	\N	\N	\N	1	\N	1
25	373	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	Maldives	2019	1	ASPIRE, WDI, country tream	31.4	31.40	31.4	31.40	1	31.40	1
26	412	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	SARw/oIndia	2019	1	SAR DST	68.8	68.80	69	68.80	-1	-68.80	1
25	374	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	Maldives	2016	2	ASPIRE	33.7	33.70	33.7	33.70	1	33.70	1
25	375	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	Maldives	\N	3	\N	-2.271171598	-2.27	0	0.00	1	0.00	1
25	376	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	Nepal	2010	1	ASPIRE	49.1	49.10	49.1	49.10	1	49.10	1
25	377	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	Nepal	\N	2	\N	\N	\N	\N	\N	1	\N	1
25	378	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	Nepal	\N	3	\N	\N	\N	\N	\N	1	\N	1
25	379	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	Pakistan	2018	1	ASPIRE	25.9	25.90	25.9	25.90	1	25.90	1
25	380	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	Pakistan	2018	2	ASPIRE	25.9	25.90	25.9	25.90	1	25.90	1
25	381	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	Pakistan	\N	3	\N	0.022026063	0.02	61	61.00	1	61.00	1
25	382	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	SARw/oIndia	\N	1	SAR DST	37.1	37.10	37.1	37.10	1	37.10	1
25	383	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	SARw/oIndia	\N	2	SAR DST	39.09	39.09	39.1	39.09	1	39.09	1
25	384	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	SARw/oIndia	\N	3	\N	-2.030539481	-2.03	6.4	6.40	1	6.40	1
25	385	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	South Asia Region	\N	1	ASPIRE	\N	\N	\N	\N	1	\N	1
25	386	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	South Asia Region	\N	2	\N	\N	\N	\N	\N	1	\N	1
25	387	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	South Asia Region	\N	3	\N	\N	\N	\N	\N	1	\N	1
25	388	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	Sri Lanka	2019	1	ASPIRE, WDI, Country team	50.9	50.90	50.9	50.90	1	50.90	1
25	389	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	Sri Lanka	2016	2	ASPIRE	49.4	49.40	49.4	49.40	1	49.40	1
25	390	People	% people covered by social protection and labor programs in the poorest quintile	Coverage in 1st quintile (poorest) (%) -All Social Protection and Labor	Sri Lanka	\N	3	\N	1.488201318	1.49	100	100.00	1	100.00	1
26	391	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	Afghanistan	2013	1	WB	93.4	93.40	93	93.40	-1	-93.40	1
26	392	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	Afghanistan	\N	2	\N	\N	\N	\N	\N	-1	\N	1
26	393	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	Afghanistan	\N	3	\N	\N	\N	\N	\N	1	\N	1
26	394	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	Bangladesh	2017	1	WB	58.2	58.20	58	58.20	-1	-58.20	1
26	395	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	Bangladesh	2015	2	WB	57.26953125	57.27	57	57.27	-1	-57.27	1
26	396	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	Bangladesh	\N	3	\N	0.93046875	0.93	25	25.45	1	25.45	1
26	397	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	Bhutan	\N	1	\N	\N	\N	\N	\N	-1	\N	1
26	398	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	Bhutan	\N	2	\N	\N	\N	\N	\N	-1	\N	1
26	399	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	Bhutan	\N	3	\N	\N	\N	\N	\N	1	\N	1
26	400	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	India	2023	1	WB	56.1	56.10	56	56.10	-1	-56.10	1
26	401	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	India	2017	2	WB	56.07056046	56.07	56	56.07	-1	-56.07	1
26	402	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	India	\N	3	\N	0.029439545	0.03	0	0.00	1	0.00	1
26	403	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	Maldives	\N	1	WB	\N	\N	\N	\N	-1	\N	1
26	404	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	Maldives	\N	2	\N	\N	\N	\N	\N	-1	\N	1
26	405	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	Maldives	\N	3	\N	\N	\N	\N	\N	1	\N	1
26	406	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	Nepal	\N	1	\N	\N	\N	\N	\N	-1	\N	1
26	407	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	Nepal	\N	2	\N	\N	\N	\N	\N	-1	\N	1
26	408	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	Nepal	\N	3	\N	\N	\N	\N	\N	1	\N	1
26	409	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	Pakistan	2014	1	Country team	77	77.00	77	77.00	-1	-77.00	1
26	410	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	Pakistan	\N	2	\N	\N	\N	\N	\N	-1	\N	1
26	413	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	SARw/oIndia	\N	2	\N	\N	\N	\N	\N	-1	\N	1
26	414	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	SARw/oIndia	\N	3	\N	\N	\N	\N	\N	1	\N	1
26	415	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	South Asia Region	2019	1	WB	59.8	59.80	60	59.80	-1	-59.80	1
26	416	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	South Asia Region	\N	2	\N	56.23	56.23	56	56.23	-1	-56.23	1
26	417	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	South Asia Region	\N	3	\N	3.57	3.57	100	100.00	1	100.00	1
26	418	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	Sri Lanka	2015	1	WB	14.8	14.80	15	14.80	-1	-14.80	1
26	419	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	Sri Lanka	\N	2	\N	\N	\N	\N	\N	-1	\N	1
26	420	People	Percentage of children who cannot read by end-of-primary-school age	Learning poverty	Sri Lanka	\N	3	\N	\N	\N	\N	\N	1	\N	1
1	421	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	Afghanistan	2022	1	WHO JME	33.1	33.10	33	33.10	-1	-33.10	1
1	422	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	Afghanistan	2018	2	WHO JME	38.2	38.20	38	38.20	-1	-38.20	1
1	423	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	Afghanistan	\N	3	\N	-5.1	-5.10	66	66.06	1	66.06	1
1	424	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	Bangladesh	2019	1	WHO JME	28	28.00	28	28.00	-1	-28.00	1
1	425	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	Bangladesh	2018	2	WHO JME	30.9	30.90	31	30.90	-1	-30.90	1
1	426	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	Bangladesh	\N	3	\N	-2.9	-2.90	86	86.24	1	86.24	1
1	427	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	Bhutan	2015	1	Country team	21.2	21.20	21	21.20	-1	-21.20	1
1	428	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	Bhutan	2010	2	WHO JME	33.5	33.50	34	33.50	-1	-33.50	1
1	429	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	Bhutan	\N	3	\N	-12.3	-12.30	0	0.00	1	0.00	1
1	430	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	India	2022	1	WHO JME	31.7	31.70	32	31.70	-1	-31.70	1
1	431	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	India	2020	2	WHO JME	35.5	35.50	36	35.50	-1	-35.50	1
1	432	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	India	\N	3	\N	-3.8	-3.80	78	77.98	1	77.98	1
1	433	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	Maldives	2022	1	WHO JME	13.9	13.90	14	13.90	-1	-13.90	1
1	434	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	Maldives	2017	2	WHO JME	15.3	15.30	15	15.30	-1	-15.30	1
1	435	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	Maldives	\N	3	\N	-1.4	-1.40	100	100.00	1	100.00	1
1	436	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	Nepal	2022	1	WHO JME	24.8	24.80	25	24.80	-1	-24.80	1
1	437	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	Nepal	2019	2	WHO JME	31.5	31.50	32	31.50	-1	-31.50	1
1	438	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	Nepal	\N	3	\N	-6.7	-6.70	51	51.38	1	51.38	1
1	439	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	Pakistan	2017-2018	1	WHO JME	37.6	37.60	38	37.60	-1	-37.60	1
1	440	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	Pakistan	2013	2	WHO JME	45	45.00	45	45.00	-1	-45.00	1
1	441	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	Pakistan	\N	3	\N	-7.4	-7.40	45	44.95	1	44.95	1
1	442	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	SARw/oIndia	2022	1	SAR DST	32.2	32.20	32	32.20	-1	-32.20	1
1	443	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	SARw/oIndia	2019	2	SAR DST	37.46	37.46	37	37.46	-1	-37.46	1
1	444	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	SARw/oIndia	\N	3	\N	-5.258302552	-5.26	65	64.60	1	64.60	1
1	445	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	South Asia Region	2022	1	WDI	31.4	31.40	31	31.40	-1	-31.40	1
1	446	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	South Asia Region	2019	2	WDI	34.3	34.30	34	34.30	-1	-34.30	1
1	447	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	South Asia Region	\N	3	\N	-2.9	-2.90	86	86.24	1	86.24	1
1	448	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	Sri Lanka	2022	1	WHO JME	15.9	15.90	16	15.90	-1	-15.90	1
1	449	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	Sri Lanka	2016	2	WHO JME	17.3	17.30	17	17.30	-1	-17.30	1
1	450	People	% children under five stunted	Prevalence of stunting, height for age (modeled estimate, % of children under 5)	Sri Lanka	\N	3	\N	-1.4	-1.40	100	100.00	1	100.00	1
2	451	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	Afghanistan	2021	1	WHO	41	41.00	41	41.00	1	41.00	1
2	452	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	Afghanistan	2019	2	WHO	42	42.00	42	42.00	1	42.00	1
2	453	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	Afghanistan	\N	3	\N	-1	-1.00	55	54.55	1	54.55	1
2	454	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	Bangladesh	2021	1	WHO	52	52.00	52	52.00	1	52.00	1
2	455	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	Bangladesh	2019	2	WHO	50	50.00	50	50.00	1	50.00	1
2	456	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	Bangladesh	\N	3	\N	2	2.00	82	81.82	1	81.82	1
2	457	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	Bhutan	2021	1	WHO	60	60.00	60	60.00	1	60.00	1
2	458	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	Bhutan	2019	2	WHO	60	60.00	60	60.00	1	60.00	1
2	459	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	Bhutan	\N	3	\N	0	0.00	64	63.64	1	63.64	1
2	460	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	India	2021	1	WHO	63	63.00	63	63.00	1	63.00	1
2	461	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	India	2019	2	WHO	64	64.00	64	64.00	1	64.00	1
2	462	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	India	\N	3	\N	-1	-1.00	55	54.55	1	54.55	1
2	463	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	Maldives	2021	1	WHO	61	61.00	61	61.00	1	61.00	1
2	464	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	Maldives	2019	2	WHO	68	68.00	68	68.00	1	68.00	1
2	465	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	Maldives	\N	3	\N	-7	-7.00	0	0.00	1	0.00	1
2	466	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	Nepal	2021	1	WHO	54	54.00	54	54.00	1	54.00	1
2	467	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	Nepal	2019	2	WHO	50	50.00	50	50.00	1	50.00	1
2	468	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	Nepal	\N	3	\N	4	4.00	100	100.00	1	100.00	1
2	469	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	Pakistan	2021	1	WHO	45	45.00	45	45.00	1	45.00	1
2	470	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	Pakistan	2019	2	WHO	44	44.00	44	44.00	1	44.00	1
2	471	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	Pakistan	\N	3	\N	1	1.00	73	72.73	1	72.73	1
2	472	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	SARw/oIndia	2021	1	SAR DST	48.6	48.60	49	48.60	1	48.60	1
2	473	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	SARw/oIndia	2019	2	SAR DST	47.33	47.33	47	47.33	1	47.33	1
2	474	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	SARw/oIndia	\N	3	\N	1.255870748	1.26	75	75.05	1	75.05	1
2	475	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	South Asia Region	2021	1	WDI	59	59.00	59	59.00	1	59.00	1
2	476	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	South Asia Region	2019	2	WDI	59	59.00	59	59.00	1	59.00	1
2	477	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	South Asia Region	\N	3	\N	0	0.00	64	63.64	1	63.64	1
2	478	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	Sri Lanka	2021	1	WHO	67	67.00	67	67.00	1	67.00	1
2	479	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	Sri Lanka	2019	2	WHO	66	66.00	66	66.00	1	66.00	1
2	480	People	Percentage of people receiving essential health services	UHC service coverage index (essential health benefits)	Sri Lanka	\N	3	\N	1	1.00	73	72.73	1	72.73	1
16	481	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	Afghanistan	\N	1	\N	\N	\N	\N	\N	1	\N	2
16	482	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	Afghanistan	2018	2	\N	\N	\N	\N	\N	1	\N	2
16	483	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	Afghanistan	\N	3	\N	0	0.00	0	\N	1	\N	2
16	484	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	Bangladesh	2023	1	IMF	Low	0.00	Low	0.00	1	0.00	2
16	485	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	Bangladesh	2018	2	IMF	Low	0.00	Low	0.00	1	0.00	2
16	486	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	Bangladesh	\N	3	\N	0	0.00	0	\N	1	\N	2
16	487	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	Bhutan	2022	1	IMF	Moderate	0.00	Moderate	0.00	1	0.00	2
16	488	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	Bhutan	2019	2	IMF	Moderate	0.00	Moderate	0.00	1	0.00	2
16	489	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	Bhutan	\N	3	\N	0	0.00	0	\N	1	\N	2
16	490	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	India	2023	1	IMF DSA	Moderate	0.00	Moderate	0.00	1	0.00	2
16	491	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	India	2019	2	IMF	Moderate	0.00	Moderate	0.00	1	0.00	2
16	492	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	India	\N	3	\N	0	0.00	0	\N	1	\N	2
16	493	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	Maldives	2022	1	IMF DSA	High	100.00	High	100.00	1	100.00	2
16	494	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	Maldives	2019	2	IMF	High	100.00	High	100.00	1	100.00	2
16	495	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	Maldives	\N	3	\N	0	0.00	0	\N	1	\N	2
16	496	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	Nepal	2023	1	WB-IMF LIC DSA	Low	0.00	Low	0.00	1	0.00	2
16	497	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	Nepal	2019	2	IMF	Low	0.00	Low	0.00	1	0.00	2
16	498	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	Nepal	\N	3	\N	0	0.00	0	\N	1	\N	2
16	499	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	Pakistan	2024	1	WB MAC DSA	High	100.00	High	100.00	1	100.00	2
16	500	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	Pakistan	2019	2	IMF	High	100.00	High	100.00	1	100.00	2
16	501	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	Pakistan	\N	3	\N	0	0.00	0	\N	1	\N	2
16	502	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	SARw/oIndia	2022-2023	1	SAR DST	3	3.00	3	3.00	1	3.00	2
16	503	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	SARw/oIndia	\N	2	SAR DST	3	3.00	3	3.00	1	3.00	2
16	504	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	SARw/oIndia	\N	3	\N	0	0.00	0	\N	1	\N	2
16	505	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	South Asia Region	2022-2023	1	SAR DST	3	3.00	3	3.00	1	3.00	2
16	506	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	South Asia Region	\N	2	SAR DST	3	3.00	3	3.00	1	3.00	2
16	507	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	South Asia Region	\N	3	\N	0	0.00	0	\N	1	\N	2
16	508	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	Sri Lanka	2023	1	WB MAC DSA	In debt distress	100.00	In debt distress	100.00	1	100.00	2
16	509	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	Sri Lanka	2019	2	IMF	High	100.00	High	100.00	1	100.00	2
16	510	Prosperity	Countries at high risk of or in debt distress	Country level: risk of overall debt distress (WB_IMF LIC DSA or WB MAC DSA). Regional: number of countries at high risk or in debt distress	Sri Lanka	\N	3	\N	0	0.00	0	\N	1	\N	2
27	511	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	Afghanistan	2017	1	IMF	9.19999999999999	9.20	9	9.20	1	9.20	2
27	512	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	Afghanistan	2016	2	IMF	8.81	8.81	9	8.81	1	8.81	2
27	513	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	Afghanistan	\N	3	\N	0.43	0.43	81	80.63	1	80.63	2
6	693	Planet	% people with access to basic sanitation	% people with access to basic sanitation	Afghanistan	\N	3	\N	5	5.00	22.2	22.18	1	22.18	3
27	514	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	Bangladesh	2021	1	IMF	8.9	8.90	9	8.90	1	8.90	2
27	515	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	Bangladesh	2019	2	IMF	8.86999999999999	8.87	9	8.87	1	8.87	2
27	516	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	Bangladesh	\N	3	\N	0.03	0.03	73	72.73	1	72.73	2
27	517	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	Bhutan	2020	1	WB-IMD LIC DSA	12.8	12.80	13	12.80	1	12.80	2
27	518	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	Bhutan	2019	2	IMF	16.15	16.15	16	16.15	1	16.15	2
27	519	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	Bhutan	\N	3	\N	-3.362836459	-3.36	6	5.68	1	5.68	2
27	520	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	India	2018	1	IMF	12	12.00	12	12.00	1	12.00	2
27	521	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	India	2017	2	IMF	11.38	11.38	11	11.38	1	11.38	2
27	522	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	India	\N	3	\N	0.62	0.62	84	84.39	1	84.39	2
27	523	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	Maldives	2021	1	IMF	19.6	19.60	20	19.60	1	19.60	2
27	524	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	Maldives	2019	2	IMF	20.36	20.36	20	20.36	1	20.36	2
27	525	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	Maldives	\N	3	\N	-0.77	-0.77	57	56.92	1	56.92	2
27	526	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	Nepal	2021	1	IMF	18	18.00	18	18.00	1	18.00	2
27	527	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	Nepal	2019	2	IMF	19.81	19.81	20	19.81	1	19.81	2
27	528	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	Nepal	\N	3	\N	-1.81	-1.81	36	36.36	1	36.36	2
27	529	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	Pakistan	2015	1	IMF	11.4	11.40	11	11.40	1	11.40	2
27	530	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	Pakistan	2014	2	IMF	9.99	9.99	10	9.99	1	9.99	2
27	531	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	Pakistan	\N	3	\N	1.41	1.41	100	100.00	1	100.00	2
27	532	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	SARw/oIndia	2015-2022	1	SAR DST	2	2.00	2	2.00	1	2.00	2
27	533	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	SARw/oIndia	\N	2	SAR DST	3	3.00	3	3.00	1	3.00	2
27	534	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	SARw/oIndia	\N	3	\N	-1	-1.00	52	52.37	1	52.37	2
27	535	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	South Asia Region	2015-2022	1	WDI	2	2.00	2	2.00	1	2.00	2
27	536	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	South Asia Region	\N	2	SAR DST	3	3.00	3	3.00	1	3.00	2
27	537	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	South Asia Region	\N	3	\N	-1	-1.00	52	52.37	1	52.37	2
27	538	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	Sri Lanka	2022	1	IMF	7.3	7.30	7	7.30	1	7.30	2
27	539	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	Sri Lanka	2019	2	IMF	10.9	10.90	11	10.90	1	10.90	2
27	540	Prosperity	Countries with tax revenue-to-GDP ratio above or equal to 15%	Country level: Tax revenue to GDP ratio. Regional: number of countries with tax revenue-to-GDP ratio	Sri Lanka	\N	3	\N	-3.65	-3.65	0	0.00	1	0.00	2
3	541	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	Afghanistan	2017	1	WDI	100	100.00	100	100.00	-1	-100.00	2
3	542	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	Afghanistan	2016	2	WDI	100	100.00	100	100.00	-1	-100.00	2
6	694	Planet	% people with access to basic sanitation	% people with access to basic sanitation	Bangladesh	2022	1	WDI	59.3	59.30	59.3	59.30	1	59.30	3
3	543	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	Afghanistan	\N	3	\N	0	0.00	100	100.00	1	100.00	2
3	544	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	Bangladesh	2017	1	WDI	100	100.00	100	100.00	-1	-100.00	2
3	545	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	Bangladesh	2016	2	WDI	100	100.00	100	100.00	-1	-100.00	2
3	546	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	Bangladesh	\N	3	\N	0	0.00	100	100.00	1	100.00	2
3	547	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	Bhutan	2017	1	WDI	100	100.00	100	100.00	-1	-100.00	2
3	548	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	Bhutan	2016	2	WDI	100	100.00	100	100.00	-1	-100.00	2
3	549	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	Bhutan	\N	3	\N	0	0.00	100	100.00	1	100.00	2
3	550	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	India	2017	1	WDI	100	100.00	100	100.00	-1	-100.00	2
3	551	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	India	2016	2	WDI	100	100.00	100	100.00	-1	-100.00	2
3	552	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	India	\N	3	\N	0	0.00	100	100.00	1	100.00	2
3	553	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	Maldives	2017	1	WDI	0	0.00	0	0.00	-1	0.00	2
3	554	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	Maldives	2016	2	WDI	0	0.00	0	0.00	-1	0.00	2
3	555	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	Maldives	\N	3	\N	0	0.00	100	100.00	1	100.00	2
3	556	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	Nepal	2017	1	WDI	100	100.00	100	100.00	-1	-100.00	2
3	557	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	Nepal	2016	2	WDI	100	100.00	100	100.00	-1	-100.00	2
3	558	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	Nepal	\N	3	\N	0	0.00	100	100.00	1	100.00	2
3	559	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	Pakistan	2017	1	WDI	100	100.00	100	100.00	-1	-100.00	2
3	560	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	Pakistan	2016	2	WDI	100	100.00	100	100.00	-1	-100.00	2
3	561	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	Pakistan	\N	3	\N	0	0.00	100	100.00	1	100.00	2
32	1024	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	Bangladesh	\N	1	\N	\N	\N	\N	\N	-1	\N	7
3	562	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	SARw/oIndia	2017	1	SAR DST	97.5999999999999	97.60	97.6	97.60	-1	-97.60	2
3	563	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	SARw/oIndia	2016	2	SAR DST	98.55	98.55	98.6	98.55	-1	-98.55	2
3	564	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	SARw/oIndia	\N	3	\N	-0.92693167	-0.93	96.1	96.07	1	96.07	2
3	565	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	South Asia Region	2017	1	WDI	99.3	99.30	99.3	99.30	-1	-99.30	2
3	566	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	South Asia Region	2016	2	WDI	99.5999999999999	99.60	99.6	99.60	-1	-99.60	2
3	567	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	South Asia Region	\N	3	\N	-0.26992037	-0.27	98.9	98.85	1	98.85	2
3	568	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	Sri Lanka	2017	1	WDI	45.5	45.50	45.5	45.50	-1	-45.50	2
3	569	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	Sri Lanka	2016	2	WDI	69.0999999999999	69.10	69.1	69.10	-1	-69.10	2
3	570	Prosperity	People exposed to hazardous air quality (%)	PM2.5 air pollution, population exposed to levels exceeding WHO guideline value (% of total)	Sri Lanka	\N	3	\N	-23.56158274	-23.56	0	0.00	1	0.00	2
36	571	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	Afghanistan	2018	1	CWON21	no	0.00	no	0.00	-1	0.00	3
36	572	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	Afghanistan	2017	2	CWON21	no	0.00	no	0.00	-1	0.00	3
4	618	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	Nepal	\N	3	\N	\N	\N	\N	\N	1	\N	3
36	573	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	Afghanistan	\N	3	\N	0	0.00	0	100.00	1	100.00	3
36	574	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	Bangladesh	2018	1	CWON21	no	0.00	no	0.00	-1	0.00	3
36	575	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	Bangladesh	2017	2	CWON21	no	0.00	no	0.00	-1	0.00	3
36	576	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	Bangladesh	\N	3	\N	0	0.00	0	100.00	1	100.00	3
36	577	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	Bhutan	2018	1	CWON21	no	0.00	no	0.00	-1	0.00	3
36	578	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	Bhutan	2017	2	CWON21	no	0.00	no	0.00	-1	0.00	3
36	579	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	Bhutan	\N	3	\N	0	0.00	0	100.00	1	100.00	3
36	580	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	India	2018	1	CWON21	no	0.00	no	0.00	-1	0.00	3
36	581	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	India	2017	2	CWON21	no	0.00	no	0.00	-1	0.00	3
36	582	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	India	\N	3	\N	0	0.00	0	100.00	1	100.00	3
36	583	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	Maldives	2018	1	CWON21	yes	100.00	yes	100.00	-1	-100.00	3
36	584	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	Maldives	2017	2	CWON21	yes	100.00	yes	100.00	-1	-100.00	3
36	585	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	Maldives	\N	3	\N	0	0.00	0	100.00	1	100.00	3
36	586	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	Nepal	2018	1	CWON21	no	0.00	no	0.00	-1	0.00	3
36	587	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	Nepal	2017	2	CWON21	yes	100.00	yes	100.00	-1	-100.00	3
36	588	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	Nepal	\N	3	\N	-1	-1.00	-1	0.00	1	0.00	3
36	589	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	Pakistan	2018	1	CWON21	no	0.00	no	0.00	-1	0.00	3
36	590	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	Pakistan	2017	2	CWON21	no	0.00	no	0.00	-1	0.00	3
36	591	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	Pakistan	\N	3	\N	0	0.00	0	100.00	1	100.00	3
4	619	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	Pakistan	2020	1	UNEP-WCMC	99995	99995.00	0	0.22	1	0.22	3
36	592	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	SARw/oIndia	2018	1	SAR DST	1	1.00	1	1.00	-1	-1.00	3
36	593	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	SARw/oIndia	2017	2	SAR DST	2	2.00	2	2.00	-1	-2.00	3
36	594	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	SARw/oIndia	\N	3	\N	-1	-1.00	-1	0.00	1	0.00	3
36	595	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	South Asia Region	2018	1	CWON21	1	1.00	1	1.00	-1	-1.00	3
36	596	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	South Asia Region	2017	2	CWON21	2	2.00	2	2.00	-1	-2.00	3
36	597	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	South Asia Region	\N	3	\N	-1	-1.00	-1	0.00	1	0.00	3
36	598	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	Sri Lanka	2018	1	CWON21	no	0.00	no	0.00	-1	0.00	3
36	599	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	Sri Lanka	2017	2	CWON21	no	0.00	no	0.00	-1	0.00	3
36	600	Planet	# Countries without renewable natural capital wealth accumulation	Country level: "no" if the average growth rate of Natural capital - renewable in the last 3 years is positive, otherwise "yes". Regional: number of countries with negative average growth rate of natural capital - renewable in the last 3 years	Sri Lanka	\N	3	\N	0	0.00	0	100.00	1	100.00	3
4	601	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	Afghanistan	2020	1	UNEP-WCMC	23384	23384.00	0	0.05	1	0.05	3
4	602	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	Afghanistan	2019	2	WDI	0.1	0.10	0	0.10	1	0.10	3
4	603	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	Afghanistan	\N	3	\N	\N	\N	\N	\N	1	\N	3
4	604	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	Bangladesh	2023	1	UNEP-WCMC	14837	14837.00	0	0.03	1	0.03	3
4	605	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	Bangladesh	2019	2	WDI	4.9	4.90	5	4.90	1	4.90	3
4	606	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	Bangladesh	\N	3	\N	\N	\N	\N	\N	1	\N	3
4	607	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	Bhutan	2023	1	UNEP-WCMC	19835	19835.00	0	0.04	1	0.04	3
4	608	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	Bhutan	2019	2	WDI	48	48.00	48	48.00	1	48.00	3
4	609	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	Bhutan	\N	3	\N	\N	\N	\N	\N	1	\N	3
4	610	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	India	2023	1	UNEP-WCMC	235711	235711.00	1	0.52	1	0.52	3
4	611	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	India	2019	2	WDI	3.5	3.50	4	3.50	1	3.50	3
4	612	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	India	\N	3	\N	\N	\N	\N	\N	1	\N	3
4	613	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	Maldives	2020	1	UNEP-WCMC	630	630.00	0	0.00	1	0.00	3
4	614	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	Maldives	2019	2	WDI	0.1	0.10	0	0.10	1	0.10	3
4	615	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	Maldives	\N	3	\N	\N	\N	\N	\N	1	\N	3
4	616	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	Nepal	2021	1	UNEP-WCMC	34898	34898.00	0	0.08	1	0.08	3
4	617	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	Nepal	2019	2	WDI	23.6	23.60	24	23.60	1	23.60	3
32	1035	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	Maldives	\N	3	\N	\N	\N	\N	\N	1	\N	7
4	620	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	Pakistan	2019	2	WDI	9.8	9.80	10	9.80	1	9.80	3
4	621	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	Pakistan	\N	3	\N	\N	\N	\N	\N	1	\N	3
4	622	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	SARw/oIndia	2023	1	SAR DST	213875	213875.00	0	0.47	1	0.47	3
4	623	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	SARw/oIndia	2019	2	\N	\N	\N	\N	\N	1	\N	3
4	624	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	SARw/oIndia	\N	3	\N	\N	\N	\N	\N	1	\N	3
4	625	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	South Asia Region	2023	1	SAR DST	449586	449586.00	1	1.00	1	1.00	3
4	626	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	South Asia Region	2019	2	WDI	5	5.00	5	5.00	1	5.00	3
4	627	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	South Asia Region	\N	3	\N	\N	\N	\N	\N	1	\N	3
4	628	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	Sri Lanka	2021	1	UNEP-WCMC	20296	20296.00	0	0.04	1	0.04	3
4	629	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	Sri Lanka	2019	2	WDI	3.4	3.40	3	3.40	1	3.40	3
4	630	Planet	Terrestrial and aquatic areas covered by protected areas	Terrestrial and inland waters protected area coverage + Marine protected area Coverage (km2)	Sri Lanka	\N	3	\N	\N	\N	\N	\N	1	\N	3
29	631	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	Afghanistan	\N	1	\N	\N	\N	\N	\N	1	\N	3
29	632	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	Afghanistan	\N	2	\N	\N	\N	\N	\N	1	\N	3
29	633	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	Afghanistan	\N	3	\N	\N	\N	\N	\N	1	\N	3
29	634	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	Bangladesh	2018	1	SDR	96.8	96.80	96.8	96.80	1	96.80	3
29	635	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	Bangladesh	2017	2	SDR	96.78	96.78	96.8	96.78	1	96.78	3
29	636	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	Bangladesh	\N	3	\N	-0.01	-0.01	6.4	6.44	1	6.44	3
29	637	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	Bhutan	\N	1	\N	\N	\N	\N	\N	1	\N	3
29	638	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	Bhutan	\N	2	\N	\N	\N	\N	\N	1	\N	3
29	639	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	Bhutan	\N	3	\N	\N	\N	\N	\N	1	\N	3
29	640	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	India	2018	1	SDR	92.4	92.40	92.4	92.40	1	92.40	3
29	641	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	India	2017	2	SDR	91.08	91.08	91.1	91.08	1	91.08	3
29	642	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	India	\N	3	\N	1.49	1.49	15.1	15.07	1	15.07	3
29	643	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	Maldives	2018	1	SDR	56.6	56.60	56.6	56.60	1	56.60	3
29	644	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	Maldives	2017	2	SDR	40.36	40.36	40.4	40.36	1	40.36	3
29	645	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	Maldives	\N	3	\N	16.26	16.26	100	100.00	1	100.00	3
29	646	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	Nepal	\N	1	\N	\N	\N	\N	\N	1	\N	3
29	647	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	Nepal	\N	2	\N	\N	\N	\N	\N	1	\N	3
29	648	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	Nepal	\N	3	\N	\N	\N	\N	\N	1	\N	3
29	649	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	Pakistan	2018	1	SDR	69.9	69.90	69.9	69.90	1	69.90	3
29	650	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	Pakistan	2017	2	SDR	71.02	71.02	71	71.02	1	71.02	3
29	651	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	Pakistan	\N	3	\N	-1.13	-1.13	0	0.00	1	0.00	3
29	652	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	SARw/oIndia	2018	1	SAR DST	84.4	84.40	84.4	84.40	1	84.40	3
29	653	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	SARw/oIndia	2017	2	SAR DST	84.43614798	84.44	84.4	84.44	1	84.44	3
29	654	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	SARw/oIndia	\N	3	\N	3.25569e-09	0.00	6.5	6.50	1	6.50	3
29	655	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	South Asia Region	2018	1	SAR DST	89.7	89.70	89.7	89.70	1	89.70	3
29	656	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	South Asia Region	2017	2	SAR DST	89.67	89.67	89.7	89.67	1	89.67	3
29	657	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	South Asia Region	\N	3	\N	-0.001324775	0.00	6.5	6.49	1	6.49	3
29	658	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	Sri Lanka	2018	1	SDR	88.3	88.30	88.3	88.30	1	88.30	3
29	659	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	Sri Lanka	2018	2	SDR	88.5699999999999	88.57	88.6	88.57	1	88.57	3
29	660	Planet	Proportion of fish stock within biologically sustainable levels	Fish caught from non-overexploited or collapsed stocks (% of total catch)	Sri Lanka	\N	3	\N	-0.28	-0.28	4.9	4.89	1	4.89	3
5	661	Planet	% people with access to basic drinking water	% people with access to basic drinking water	Afghanistan	2022	1	WDI	82.2	82.20	82.2	82.20	1	82.20	3
5	662	Planet	% people with access to basic drinking water	% people with access to basic drinking water	Afghanistan	2019	2	WDI	73.8	73.80	73.8	73.80	1	73.80	3
5	663	Planet	% people with access to basic drinking water	% people with access to basic drinking water	Afghanistan	\N	3	\N	8.4	8.40	100	100.00	1	100.00	3
5	664	Planet	% people with access to basic drinking water	% people with access to basic drinking water	Bangladesh	2022	1	WDI	98.0999999999999	98.10	98.1	98.10	1	98.10	3
5	665	Planet	% people with access to basic drinking water	% people with access to basic drinking water	Bangladesh	2019	2	WDI	97.8	97.80	97.8	97.80	1	97.80	3
5	666	Planet	% people with access to basic drinking water	% people with access to basic drinking water	Bangladesh	\N	3	\N	0.3	0.30	66.7	66.67	1	66.67	3
5	667	Planet	% people with access to basic drinking water	% people with access to basic drinking water	Bhutan	2022	1	BLSS	83	83.00	83	83.00	1	83.00	3
5	668	Planet	% people with access to basic drinking water	% people with access to basic drinking water	Bhutan	2019	2	WDI	98.9	98.90	98.9	98.90	1	98.90	3
5	669	Planet	% people with access to basic drinking water	% people with access to basic drinking water	Bhutan	\N	3	\N	-15.9	-15.90	0	0.00	1	0.00	3
5	670	Planet	% people with access to basic drinking water	% people with access to basic drinking water	India	2022	1	WDI	93.3	93.30	93.3	93.30	1	93.30	3
5	671	Planet	% people with access to basic drinking water	% people with access to basic drinking water	India	2019	2	WDI	91.5999999999999	91.60	91.6	91.60	1	91.60	3
5	672	Planet	% people with access to basic drinking water	% people with access to basic drinking water	India	\N	3	\N	1.7	1.70	72.4	72.43	1	72.43	3
5	673	Planet	% people with access to basic drinking water	% people with access to basic drinking water	Maldives	2022	1	WDI	99.5999999999999	99.60	99.6	99.60	1	99.60	3
5	674	Planet	% people with access to basic drinking water	% people with access to basic drinking water	Maldives	2019	2	WDI	99.5	99.50	99.5	99.50	1	99.50	3
5	675	Planet	% people with access to basic drinking water	% people with access to basic drinking water	Maldives	\N	3	\N	0.1	0.10	65.8	65.84	1	65.84	3
5	676	Planet	% people with access to basic drinking water	% people with access to basic drinking water	Nepal	2022	1	DHS, country team	97.5	97.50	97.5	97.50	1	97.50	3
5	677	Planet	% people with access to basic drinking water	% people with access to basic drinking water	Nepal	2019	2	WDI	90.3	90.30	90.3	90.30	1	90.30	3
5	679	Planet	% people with access to basic drinking water	% people with access to basic drinking water	Pakistan	2022	1	WDI	90.5999999999999	90.60	90.6	90.60	1	90.60	3
5	680	Planet	% people with access to basic drinking water	% people with access to basic drinking water	Pakistan	2019	2	WDI	90.2	90.20	90.2	90.20	1	90.20	3
5	681	Planet	% people with access to basic drinking water	% people with access to basic drinking water	Pakistan	\N	3	\N	0.4	0.40	67.1	67.08	1	67.08	3
5	682	Planet	% people with access to basic drinking water	% people with access to basic drinking water	SARw/oIndia	2022	1	SAR DST	92.8	92.80	92.8	92.80	1	92.80	3
5	683	Planet	% people with access to basic drinking water	% people with access to basic drinking water	SARw/oIndia	2019	2	SAR DST	91.48	91.48	91.5	91.48	1	91.48	3
5	684	Planet	% people with access to basic drinking water	% people with access to basic drinking water	SARw/oIndia	\N	3	\N	1.325964382	1.33	70.9	70.89	1	70.89	3
5	685	Planet	% people with access to basic drinking water	% people with access to basic drinking water	South Asia Region	2022	1	SAR DST	93.2	93.20	93.2	93.20	1	93.20	3
5	686	Planet	% people with access to basic drinking water	% people with access to basic drinking water	South Asia Region	2019	2	WDI	91.5	91.50	91.5	91.50	1	91.50	3
5	687	Planet	% people with access to basic drinking water	% people with access to basic drinking water	South Asia Region	\N	3	\N	1.68321661	1.68	72.4	72.36	1	72.36	3
5	688	Planet	% people with access to basic drinking water	% people with access to basic drinking water	Sri Lanka	2022	1	WDI	89.3	89.30	89.3	89.30	1	89.30	3
5	689	Planet	% people with access to basic drinking water	% people with access to basic drinking water	Sri Lanka	2019	2	WDI	88.4	88.40	88.4	88.40	1	88.40	3
5	690	Planet	% people with access to basic drinking water	% people with access to basic drinking water	Sri Lanka	\N	3	\N	0.9	0.90	69.1	69.14	1	69.14	3
6	691	Planet	% people with access to basic sanitation	% people with access to basic sanitation	Afghanistan	2022	1	WDI	56	56.00	56	56.00	1	56.00	3
6	692	Planet	% people with access to basic sanitation	% people with access to basic sanitation	Afghanistan	2019	2	WDI	51	51.00	51	51.00	1	51.00	3
6	695	Planet	% people with access to basic sanitation	% people with access to basic sanitation	Bangladesh	2019	2	WDI	54.9	54.90	54.9	54.90	1	54.90	3
6	696	Planet	% people with access to basic sanitation	% people with access to basic sanitation	Bangladesh	\N	3	\N	4.4	4.40	19.7	19.67	1	19.67	3
6	697	Planet	% people with access to basic sanitation	% people with access to basic sanitation	Bhutan	2022	1	BLSS	99	99.00	99	99.00	1	99.00	3
6	698	Planet	% people with access to basic sanitation	% people with access to basic sanitation	Bhutan	2019	2	WDI	75.4	75.40	75.4	75.40	1	75.40	3
6	699	Planet	% people with access to basic sanitation	% people with access to basic sanitation	Bhutan	\N	3	\N	23.6	23.60	100	100.00	1	100.00	3
6	700	Planet	% people with access to basic sanitation	% people with access to basic sanitation	India	2022	1	WDI	78.4	78.40	78.4	78.40	1	78.40	3
6	701	Planet	% people with access to basic sanitation	% people with access to basic sanitation	India	2019	2	WDI	69.7	69.70	69.7	69.70	1	69.70	3
6	702	Planet	% people with access to basic sanitation	% people with access to basic sanitation	India	\N	3	\N	8.7	8.70	37.7	37.66	1	37.66	3
6	703	Planet	% people with access to basic sanitation	% people with access to basic sanitation	Maldives	2022	1	WDI	99.7	99.70	99.7	99.70	1	99.70	3
6	704	Planet	% people with access to basic sanitation	% people with access to basic sanitation	Maldives	2019	2	WDI	98.3	98.30	98.3	98.30	1	98.30	3
6	705	Planet	% people with access to basic sanitation	% people with access to basic sanitation	Maldives	\N	3	\N	1.4	1.40	7.1	7.11	1	7.11	3
6	706	Planet	% people with access to basic sanitation	% people with access to basic sanitation	Nepal	2022	1	DHS, country team	72.5999999999999	72.60	72.6	72.60	1	72.60	3
6	707	Planet	% people with access to basic sanitation	% people with access to basic sanitation	Nepal	2019	2	WDI	72.9	72.90	72.9	72.90	1	72.90	3
6	708	Planet	% people with access to basic sanitation	% people with access to basic sanitation	Nepal	\N	3	\N	-0.3	-0.30	0	0.00	1	0.00	3
6	709	Planet	% people with access to basic sanitation	% people with access to basic sanitation	Pakistan	2022	1	WDI	70.5	70.50	70.5	70.50	1	70.50	3
6	710	Planet	% people with access to basic sanitation	% people with access to basic sanitation	Pakistan	2019	2	WDI	65.4	65.40	65.4	65.40	1	65.40	3
6	711	Planet	% people with access to basic sanitation	% people with access to basic sanitation	Pakistan	\N	3	\N	5.1	5.10	22.6	22.59	1	22.59	3
6	712	Planet	% people with access to basic sanitation	% people with access to basic sanitation	SARw/oIndia	2022	1	SAR DST	66.8	66.80	66.8	66.80	1	66.80	3
6	713	Planet	% people with access to basic sanitation	% people with access to basic sanitation	SARw/oIndia	2019	2	SAR DST	62.37	62.37	62.4	62.37	1	62.37	3
6	714	Planet	% people with access to basic sanitation	% people with access to basic sanitation	SARw/oIndia	\N	3	\N	4.405643061	4.41	19.7	19.69	1	19.69	3
6	715	Planet	% people with access to basic sanitation	% people with access to basic sanitation	South Asia Region	2022	1	SAR DST	75.4	75.40	75.4	75.40	1	75.40	3
6	716	Planet	% people with access to basic sanitation	% people with access to basic sanitation	South Asia Region	2019	2	WDI	67.8	67.80	67.8	67.80	1	67.80	3
6	717	Planet	% people with access to basic sanitation	% people with access to basic sanitation	South Asia Region	\N	3	\N	7.552116857	7.55	32.9	32.85	1	32.85	3
6	718	Planet	% people with access to basic sanitation	% people with access to basic sanitation	Sri Lanka	2022	1	WDI	95.0999999999999	95.10	95.1	95.10	1	95.10	3
6	719	Planet	% people with access to basic sanitation	% people with access to basic sanitation	Sri Lanka	2019	2	WDI	92.5	92.50	92.5	92.50	1	92.50	3
6	720	Planet	% people with access to basic sanitation	% people with access to basic sanitation	Sri Lanka	\N	3	\N	2.6	2.60	12.1	12.13	1	12.13	3
7	721	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	Afghanistan	2022	1	JMP	48.2	48.20	48.2	48.20	1	48.20	3
7	722	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	Afghanistan	2019	2	WDI	45.6	45.60	45.6	45.60	1	45.60	3
7	723	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	Afghanistan	\N	3	\N	2.6	2.60	22.2	22.15	1	22.15	3
7	724	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	Bangladesh	2022	1	WDI	61.7	61.70	61.7	61.70	1	61.70	3
7	725	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	Bangladesh	2019	2	WDI	55.1	55.10	55.1	55.10	1	55.10	3
7	726	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	Bangladesh	\N	3	\N	6.628537428	6.63	57	57.00	1	57.00	3
7	727	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	Bhutan	2022	1	WDI	93.2	93.20	93.2	93.20	1	93.20	3
7	728	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	Bhutan	2019	2	WDI	90.9	90.90	90.9	90.90	1	90.90	3
7	729	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	Bhutan	\N	3	\N	2.304178158	2.30	19.6	19.59	1	19.59	3
7	730	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	India	2022	1	WDI	76.3	76.30	76.3	76.30	1	76.30	3
7	731	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	India	2019	2	WDI	70.0999999999999	70.10	70.1	70.10	1	70.10	3
7	732	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	India	\N	3	\N	6.164793129	6.16	53	52.99	1	52.99	3
7	733	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	Maldives	2021	1	WDI	95.8	95.80	95.8	95.80	1	95.80	3
7	734	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	Maldives	2019	2	WDI	95.8	95.80	95.8	95.80	1	95.80	3
7	735	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	Maldives	\N	3	\N	0.039098503	0.04	0	0.00	1	0.00	3
7	736	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	Nepal	2022	1	DHS, country team	72.4	72.40	72.4	72.40	1	72.40	3
7	737	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	Nepal	2019	2	WDI	60.8	60.80	60.8	60.80	1	60.80	3
7	738	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	Nepal	\N	3	\N	11.6	11.60	100	100.00	1	100.00	3
7	739	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	Pakistan	2022	1	WDI	84.7	84.70	84.7	84.70	1	84.70	3
7	740	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	Pakistan	2019	2	WDI	76	76.00	76	76.00	1	76.00	3
7	741	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	Pakistan	\N	3	\N	8.691312234	8.69	74.8	74.84	1	74.84	3
7	742	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	SARw/oIndia	2022	1	SAR DST	73.2	73.20	73.2	73.20	1	73.20	3
7	743	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	SARw/oIndia	2019	2	SAR DST	65.92	65.92	65.9	65.92	1	65.92	3
7	744	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	SARw/oIndia	\N	3	\N	7.273022611	7.27	62.6	62.57	1	62.57	3
7	745	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	South Asia Region	2022	1	SAR DST	75.5	75.50	75.5	75.50	1	75.50	3
7	746	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	South Asia Region	2019	2	WDI	69.0999999999999	69.10	69.1	69.10	1	69.10	3
7	747	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	South Asia Region	\N	3	\N	6.357950387	6.36	54.7	54.66	1	54.66	3
7	748	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	Sri Lanka	2022	1	WDI	85.3	85.30	85.3	85.30	1	85.30	3
7	749	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	Sri Lanka	2019	2	WDI	85.3	85.30	85.3	85.30	1	85.30	3
7	750	Planet	% people with access to basic hygiene	People with basic handwashing facilities including soap and water (% of population)	Sri Lanka	\N	3	\N	0.046332365	0.05	0.1	0.06	1	0.06	3
8	751	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	Afghanistan	2020-2022	1	\N	30.1	30.10	30.1	30.10	-1	-30.10	3
8	752	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	Afghanistan	2019-2021	2	FAO	26.9	26.90	26.9	26.90	-1	-26.90	3
8	753	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	Afghanistan	\N	3	\N	3.2	3.20	66.2	66.15	1	66.15	3
8	754	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	Bangladesh	2020-2022	1	\N	11.2	11.20	11.2	11.20	-1	-11.20	3
8	755	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	Bangladesh	2019-2021	2	FAO	11.8	11.80	11.8	11.80	-1	-11.80	3
8	756	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	Bangladesh	\N	3	\N	-0.6	-0.60	7.7	7.69	1	7.69	3
8	757	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	Bhutan	2022	1	BLSS	1.6	1.60	1.6	1.60	-1	-1.60	3
8	760	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	India	2020-2022	1	\N	16.6	16.60	16.6	16.60	-1	-16.60	3
8	761	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	India	2019-2021	2	FAO	11.4	11.40	11.4	11.40	-1	-11.40	3
8	762	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	India	\N	3	\N	5.2	5.20	96.9	96.92	1	96.92	3
8	763	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	Maldives	\N	1	\N	\N	\N	\N	\N	-1	\N	3
8	764	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	Maldives	\N	2	\N	\N	\N	\N	\N	-1	\N	3
8	765	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	Maldives	\N	3	\N	\N	\N	\N	\N	1	\N	3
8	766	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	Nepal	2020-2022	1	\N	5.4	5.40	5.4	5.40	-1	-5.40	3
8	767	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	Nepal	2019-2021	2	FAO	4.9	4.90	4.9	4.90	-1	-4.90	3
8	768	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	Nepal	\N	3	\N	0.5	0.50	24.6	24.62	1	24.62	3
8	769	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	Pakistan	2020-2022	1	\N	18.5	18.50	18.5	18.50	-1	-18.50	3
8	770	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	Pakistan	2019-2021	2	FAO	13.1	13.10	13.1	13.10	-1	-13.10	3
8	771	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	Pakistan	\N	3	\N	5.4	5.40	100	100.00	1	100.00	3
8	772	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	SARw/oIndia	2020-2022	1	\N	15.6	15.60	15.6	15.60	-1	-15.60	3
8	773	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	SARw/oIndia	2019-2021	2	SAR DST	13.01	13.01	13	13.01	-1	-13.01	3
8	774	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	SARw/oIndia	\N	3	\N	2.575048617	2.58	56.5	56.54	1	56.54	3
8	775	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	South Asia Region	2020-2022	1	\N	16.3	16.30	16.3	16.30	-1	-16.30	3
8	776	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	South Asia Region	2019-2021	2	FAO	14	14.00	14	14.00	-1	-14.00	3
8	777	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	South Asia Region	\N	3	\N	2.32	2.32	52.6	52.62	1	52.62	3
8	778	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	Sri Lanka	2020-2022	1	\N	5.3	5.30	5.3	5.30	-1	-5.30	3
8	779	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	Sri Lanka	2019-2021	2	FAO	6.4	6.40	6.4	6.40	-1	-6.40	3
8	780	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	Sri Lanka	\N	3	\N	-1.1	-1.10	0	0.00	1	0.00	3
9	781	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	Afghanistan	2020-2022	1	FAO	79.0999999999999	79.10	79.1	79.10	-1	-79.10	3
9	782	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	Afghanistan	2019-2021	2	FAO	63.1	63.10	63.1	63.10	-1	-63.10	3
9	783	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	Afghanistan	\N	3	\N	16	16.00	89.4	89.36	1	89.36	3
9	784	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	Bangladesh	2020-2022	1	FAO	31.1	31.10	31.1	31.10	-1	-31.10	3
9	785	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	Bangladesh	2019-2021	2	FAO	31.9	31.90	31.9	31.90	-1	-31.90	3
9	786	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	Bangladesh	\N	3	\N	-0.8	-0.80	0	0.00	1	0.00	3
9	787	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	Bhutan	2022	1	Country team	0.3	0.30	0.3	0.30	-1	-0.30	3
9	788	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	Bhutan	\N	2	\N	\N	\N	\N	\N	-1	\N	3
9	789	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	Bhutan	\N	3	\N	\N	\N	\N	\N	1	\N	3
9	790	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	India	\N	1	\N	\N	\N	\N	\N	-1	\N	3
9	791	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	India	\N	2	\N	\N	\N	\N	\N	-1	\N	3
9	792	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	India	\N	3	\N	\N	\N	\N	\N	1	\N	3
9	793	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	Maldives	2020-2022	1	FAO	13.4	13.40	13.4	13.40	-1	-13.40	3
9	794	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	Maldives	\N	2	\N	\N	\N	\N	\N	-1	\N	3
9	795	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	Maldives	\N	3	\N	\N	\N	\N	\N	1	\N	3
9	796	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	Nepal	2020-2022	1	FAO	37.4	37.40	37.4	37.40	-1	-37.40	3
9	797	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	Nepal	2019-2021	2	FAO	36.4	36.40	36.4	36.40	-1	-36.40	3
9	798	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	Nepal	\N	3	\N	1	1.00	9.6	9.57	1	9.57	3
34	909	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	Bhutan	\N	3	\N	-0.0256	-0.03	37.3	37.32	1	37.32	6
9	799	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	Pakistan	2020-2022	1	FAO	42.3	42.30	42.3	42.30	-1	-42.30	3
9	800	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	Pakistan	2019-2021	2	FAO	24.3	24.30	24.3	24.30	-1	-24.30	3
9	801	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	Pakistan	\N	3	\N	18	18.00	100	100.00	1	100.00	3
9	802	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	SARw/oIndia	2020-2023	1	SAR DST	40.1	40.10	40.1	40.10	-1	-40.10	3
9	803	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	SARw/oIndia	\N	2	SAR DST	30.03	30.03	30	30.03	-1	-30.03	3
9	804	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	SARw/oIndia	\N	3	\N	10.02567416	10.03	57.6	57.58	1	57.58	3
9	805	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	South Asia Region	2020-2023	1	WDI	\N	\N	\N	\N	-1	\N	3
9	806	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	South Asia Region	\N	2	\N	\N	\N	\N	\N	-1	\N	3
9	807	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	South Asia Region	\N	3	\N	\N	\N	\N	\N	1	\N	3
9	808	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	Sri Lanka	2023	1	FAO	17	17.00	17	17.00	-1	-17.00	3
9	809	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	Sri Lanka	2019-2021	2	FAO	8.9	8.90	8.9	8.90	-1	-8.90	3
9	810	Planet	Prevalence of moderate or severe food insecurity in the total population %	Prevalence of moderate or severe food insecurity in the total population %	Sri Lanka	\N	3	\N	8.1	8.10	47.3	47.34	1	47.34	3
30	811	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Afghanistan	2020	1	RAI	67	67.00	67	67.00	1	67.00	5
30	812	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Afghanistan	\N	2	\N	\N	\N	\N	\N	1	\N	5
30	813	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Afghanistan	\N	3	\N	\N	\N	\N	\N	1	\N	5
30	814	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Bangladesh	2020	1	RAI	67.4	67.40	67.4	67.40	1	67.40	5
30	815	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Bangladesh	\N	2	\N	\N	\N	\N	\N	1	\N	5
30	816	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Bangladesh	\N	3	\N	\N	\N	\N	\N	1	\N	5
30	817	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Bhutan	2020	1	RAI	47.7	47.70	47.7	47.70	1	47.70	5
30	818	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Bhutan	\N	2	\N	\N	\N	\N	\N	1	\N	5
30	819	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Bhutan	\N	3	\N	\N	\N	\N	\N	1	\N	5
30	820	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	India	2020	1	RAI	75.2	75.20	75.2	75.20	1	75.20	5
30	821	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	India	\N	2	\N	\N	\N	\N	\N	1	\N	5
30	822	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	India	\N	3	\N	\N	\N	\N	\N	1	\N	5
30	823	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Maldives	2020	1	RAI	57.3	57.30	57.3	57.30	1	57.30	5
30	824	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Maldives	\N	2	\N	\N	\N	\N	\N	1	\N	5
30	825	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Maldives	\N	3	\N	\N	\N	\N	\N	1	\N	5
30	826	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Nepal	2020	1	RAI	70	70.00	70	70.00	1	70.00	5
30	827	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Nepal	2010-2011	2	\N	55	55.00	55	55.00	1	55.00	5
30	828	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Nepal	\N	3	\N	14.97743922	14.98	\N	\N	1	\N	5
34	910	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	India	2022	1	UN EGDI	0.59	0.59	59	59.00	1	59.00	6
30	829	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Pakistan	2020	1	RAI	63.8	63.80	63.8	63.80	1	63.80	5
30	830	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Pakistan	\N	2	Country team; NLSS	\N	\N	\N	\N	1	\N	5
30	831	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Pakistan	\N	3	\N	\N	\N	\N	\N	1	\N	5
30	832	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	SARw/oIndia	2020	1	SAR DST	67	67.00	67	67.00	1	67.00	5
30	833	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	SARw/oIndia	\N	2	\N	\N	\N	\N	\N	1	\N	5
30	834	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	SARw/oIndia	\N	3	\N	\N	\N	\N	\N	1	\N	5
30	835	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	South Asia Region	2020	1	RAI	73.2	73.20	73.2	73.20	1	73.20	5
30	836	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	South Asia Region	\N	2	\N	\N	\N	\N	\N	1	\N	5
32	1036	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	Nepal	\N	1	\N	\N	\N	\N	\N	-1	\N	7
30	837	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	South Asia Region	\N	3	\N	\N	\N	\N	\N	1	\N	5
30	838	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Sri Lanka	2020	1	RAI	94.4	94.40	94.4	94.40	1	94.40	5
30	839	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Sri Lanka	\N	2	\N	\N	\N	\N	\N	1	\N	5
30	840	Infrastructure	Percentage of population with access to reliable transport solutions all year-round	Rural Access Index: proportion of the rural population who live within 2 km of an all-season road	Sri Lanka	\N	3	\N	\N	\N	\N	\N	1	\N	5
10	841	Infrastructure	% Population with access to electricity	% Population with access to electricity	Afghanistan	2021	1	WDI	97.7	97.70	97.7	97.70	1	97.70	5
10	842	Infrastructure	% Population with access to electricity	% Population with access to electricity	Afghanistan	2019	2	WDI	97.7	97.70	97.7	97.70	1	97.70	5
10	843	Infrastructure	% Population with access to electricity	% Population with access to electricity	Afghanistan	\N	3	\N	0	0.00	0	0.00	1	0.00	5
10	844	Infrastructure	% Population with access to electricity	% Population with access to electricity	Bangladesh	2021	1	WDI	99	99.00	99	99.00	1	99.00	5
10	845	Infrastructure	% Population with access to electricity	% Population with access to electricity	Bangladesh	2019	2	WDI	92.2	92.20	92.2	92.20	1	92.20	5
10	846	Infrastructure	% Population with access to electricity	% Population with access to electricity	Bangladesh	\N	3	\N	6.8	6.80	100	100.00	1	100.00	5
10	847	Infrastructure	% Population with access to electricity	% Population with access to electricity	Bhutan	2022	1	DHS, BLSS	100	100.00	100	100.00	1	100.00	5
10	848	Infrastructure	% Population with access to electricity	% Population with access to electricity	Bhutan	2019	2	WDI	100	100.00	100	100.00	1	100.00	5
10	849	Infrastructure	% Population with access to electricity	% Population with access to electricity	Bhutan	\N	3	\N	0	0.00	0	0.00	1	0.00	5
10	850	Infrastructure	% Population with access to electricity	% Population with access to electricity	India	2021	1	WDI	99.5999999999999	99.60	99.6	99.60	1	99.60	5
10	851	Infrastructure	% Population with access to electricity	% Population with access to electricity	India	2019	2	WDI	95.9	95.90	95.9	95.90	1	95.90	5
10	852	Infrastructure	% Population with access to electricity	% Population with access to electricity	India	\N	3	\N	3.7	3.70	54.4	54.41	1	54.41	5
10	853	Infrastructure	% Population with access to electricity	% Population with access to electricity	Maldives	2021	1	WDI	100	100.00	100	100.00	1	100.00	5
10	854	Infrastructure	% Population with access to electricity	% Population with access to electricity	Maldives	2019	2	WDI	100	100.00	100	100.00	1	100.00	5
10	855	Infrastructure	% Population with access to electricity	% Population with access to electricity	Maldives	\N	3	\N	0	0.00	0	0.00	1	0.00	5
10	856	Infrastructure	% Population with access to electricity	% Population with access to electricity	Nepal	2022	1	DHS, country team	91.3	91.30	91.3	91.30	1	91.30	5
10	857	Infrastructure	% Population with access to electricity	% Population with access to electricity	Nepal	2019	2	WDI	89.9	89.90	89.9	89.90	1	89.90	5
10	858	Infrastructure	% Population with access to electricity	% Population with access to electricity	Nepal	\N	3	\N	1.4	1.40	20.6	20.59	1	20.59	5
10	859	Infrastructure	% Population with access to electricity	% Population with access to electricity	Pakistan	2021	1	WDI	94.9	94.90	94.9	94.90	1	94.90	5
10	860	Infrastructure	% Population with access to electricity	% Population with access to electricity	Pakistan	2019	2	WDI	93.9	93.90	93.9	93.90	1	93.90	5
10	861	Infrastructure	% Population with access to electricity	% Population with access to electricity	Pakistan	\N	3	\N	1	1.00	14.7	14.71	1	14.71	5
10	862	Infrastructure	% Population with access to electricity	% Population with access to electricity	SARw/oIndia	2021	1	SAR DST	96.5	96.50	96.5	96.50	1	96.50	5
10	863	Infrastructure	% Population with access to electricity	% Population with access to electricity	SARw/oIndia	2019	2	\N	93.66	93.66	93.7	93.66	1	93.66	5
10	864	Infrastructure	% Population with access to electricity	% Population with access to electricity	SARw/oIndia	\N	3	\N	2.879320514	2.88	42.3	42.34	1	42.34	5
10	865	Infrastructure	% Population with access to electricity	% Population with access to electricity	South Asia Region	2021	1	SAR DST	98.8	98.80	98.8	98.80	1	98.80	5
10	866	Infrastructure	% Population with access to electricity	% Population with access to electricity	South Asia Region	2019	2	WDI	95.3	95.30	95.3	95.30	1	95.30	5
10	867	Infrastructure	% Population with access to electricity	% Population with access to electricity	South Asia Region	\N	3	\N	3.501091539	3.50	51.5	51.49	1	51.49	5
10	868	Infrastructure	% Population with access to electricity	% Population with access to electricity	Sri Lanka	2021	1	WDI	100	100.00	100	100.00	1	100.00	5
10	869	Infrastructure	% Population with access to electricity	% Population with access to electricity	Sri Lanka	2019	2	WDI	99.8	99.80	99.8	99.80	1	99.80	5
10	870	Infrastructure	% Population with access to electricity	% Population with access to electricity	Sri Lanka	\N	3	\N	0.2	0.20	2.9	2.94	1	2.94	5
11	871	Digital	% of the population using the internet	% of the population using the internet	Afghanistan	2020	1	WDI	18	18.00	18	18.00	1	18.00	6
11	872	Digital	% of the population using the internet	% of the population using the internet	Afghanistan	2019	2	WDI	17.6	17.60	17.6	17.60	1	17.60	6
11	873	Digital	% of the population using the internet	% of the population using the internet	Afghanistan	\N	3	\N	0.4	0.40	16.9	16.86	1	16.86	6
11	874	Digital	% of the population using the internet	% of the population using the internet	Bangladesh	2021	1	WDI	39	39.00	39	39.00	1	39.00	6
11	875	Digital	% of the population using the internet	% of the population using the internet	Bangladesh	2019	2	WDI	27.8	27.80	27.8	27.80	1	27.80	6
11	876	Digital	% of the population using the internet	% of the population using the internet	Bangladesh	\N	3	\N	11.2	11.20	42.5	42.52	1	42.52	6
11	877	Digital	% of the population using the internet	% of the population using the internet	Bhutan	2021	1	WDI	86	86.00	86	86.00	1	86.00	6
11	878	Digital	% of the population using the internet	% of the population using the internet	Bhutan	2019	2	WDI	74.2	74.20	74.2	74.20	1	74.20	6
11	879	Digital	% of the population using the internet	% of the population using the internet	Bhutan	\N	3	\N	11.8	11.80	43.9	43.94	1	43.94	6
11	880	Digital	% of the population using the internet	% of the population using the internet	India	2021	1	WDI	46	46.00	46	46.00	1	46.00	6
11	881	Digital	% of the population using the internet	% of the population using the internet	India	2019	2	WDI	29.5	29.50	29.5	29.50	1	29.50	6
11	882	Digital	% of the population using the internet	% of the population using the internet	India	\N	3	\N	16.5	16.50	55.1	55.11	1	55.11	6
11	883	Digital	% of the population using the internet	% of the population using the internet	Maldives	2021	1	WDI	86	86.00	86	86.00	1	86.00	6
11	884	Digital	% of the population using the internet	% of the population using the internet	Maldives	2019	2	WDI	77.5	77.50	77.5	77.50	1	77.50	6
11	885	Digital	% of the population using the internet	% of the population using the internet	Maldives	\N	3	\N	8.5	8.50	36.1	36.10	1	36.10	6
11	886	Digital	% of the population using the internet	% of the population using the internet	Nepal	2022	1	DHS, country team	70.2	70.20	70.2	70.20	1	70.20	6
11	887	Digital	% of the population using the internet	% of the population using the internet	Nepal	2019	2	WDI	34.8	34.80	34.8	34.80	1	34.80	6
11	888	Digital	% of the population using the internet	% of the population using the internet	Nepal	\N	3	\N	35.4	35.40	100	100.00	1	100.00	6
11	889	Digital	% of the population using the internet	% of the population using the internet	Pakistan	2021	1	WDI	21	21.00	21	21.00	1	21.00	6
11	890	Digital	% of the population using the internet	% of the population using the internet	Pakistan	2019	2	WDI	17.1	17.10	17.1	17.10	1	17.10	6
11	891	Digital	% of the population using the internet	% of the population using the internet	Pakistan	\N	3	\N	3.9	3.90	25.2	25.18	1	25.18	6
11	892	Digital	% of the population using the internet	% of the population using the internet	SARw/oIndia	2021	1	SAR DST	31	31.00	31	31.00	1	31.00	6
11	893	Digital	% of the population using the internet	% of the population using the internet	SARw/oIndia	2019	2	\N	23.59	23.59	23.6	23.59	1	23.59	6
11	894	Digital	% of the population using the internet	% of the population using the internet	SARw/oIndia	\N	3	\N	7.413739516	7.41	33.5	33.52	1	33.52	6
11	895	Digital	% of the population using the internet	% of the population using the internet	South Asia Region	2021	1	SAR DST	42.1	42.10	42.1	42.10	1	42.10	6
11	896	Digital	% of the population using the internet	% of the population using the internet	South Asia Region	2019	2	WDI	28	28.00	28	28.00	1	28.00	6
11	897	Digital	% of the population using the internet	% of the population using the internet	South Asia Region	\N	3	\N	14.09326051	14.09	49.4	49.39	1	49.39	6
11	898	Digital	% of the population using the internet	% of the population using the internet	Sri Lanka	2021	1	WDI	44	44.00	44	44.00	1	44.00	6
11	899	Digital	% of the population using the internet	% of the population using the internet	Sri Lanka	2019	2	WDI	50.7	50.70	50.7	50.70	1	50.70	6
11	900	Digital	% of the population using the internet	% of the population using the internet	Sri Lanka	\N	3	\N	-6.7	-6.70	0	0.00	1	0.00	6
34	901	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	Afghanistan	2022	1	UN EGDI	0.27	0.27	27	27.00	1	27.00	6
34	902	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	Afghanistan	2020	2	UN EGDI	0.3203	0.32	32	32.03	1	32.03	6
34	903	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	Afghanistan	\N	3	\N	-0.0493	-0.05	16	16.01	1	16.01	6
34	904	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	Bangladesh	2022	1	UN EGDI	0.56	0.56	56	56.00	1	56.00	6
34	905	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	Bangladesh	2020	2	UN EGDI	0.5189	0.52	51.9	51.89	1	51.89	6
34	906	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	Bangladesh	\N	3	\N	0.0441	0.04	100	100.00	1	100.00	6
34	907	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	Bhutan	2022	1	UN EGDI	0.55	0.55	55	55.00	1	55.00	6
34	908	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	Bhutan	2020	2	UN EGDI	0.5777	0.58	57.8	57.77	1	57.77	6
34	911	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	India	2020	2	UN EGDI	0.5964	0.60	59.6	59.64	1	59.64	6
34	912	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	India	\N	3	\N	-0.0084	-0.01	52.8	52.79	1	52.79	6
34	913	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	Maldives	2022	1	UN EGDI	0.59	0.59	59	59.00	1	59.00	6
34	914	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	Maldives	2020	2	UN EGDI	0.574	0.57	57.4	57.40	1	57.40	6
34	915	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	Maldives	\N	3	\N	0.0145	0.01	73.4	73.38	1	73.38	6
34	916	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	Nepal	2022	1	UN EGDI	0.51	0.51	51	51.00	1	51.00	6
34	917	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	Nepal	2020	2	UN EGDI	0.4699	0.47	47	46.99	1	46.99	6
34	918	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	Nepal	\N	3	\N	0.0418	0.04	97.9	97.93	1	97.93	6
34	919	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	Pakistan	2022	1	UN EGDI	0.42	0.42	42	42.00	1	42.00	6
34	920	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	Pakistan	2020	2	UN EGDI	0.4183	0.42	41.8	41.83	1	41.83	6
34	921	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	Pakistan	\N	3	\N	0.0017	0.00	61.9	61.87	1	61.87	6
34	922	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	SARw/oIndia	2022	1	SAR DST	0.5	0.50	50	50.00	1	50.00	6
34	923	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	SARw/oIndia	2020	2	SAR DST	0.538266667	0.54	53.8	53.83	1	53.83	6
34	924	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	SARw/oIndia	\N	3	\N	-0.067100757	-0.07	0	0.00	1	0.00	6
34	925	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	South Asia Region	2022	1	SAR DST	0.56	0.56	56	56.00	1	56.00	6
34	926	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	South Asia Region	2020	2	SAR DST	0.546571429	0.55	54.7	54.66	1	54.66	6
34	927	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	South Asia Region	\N	3	\N	0.011003482	0.01	70.2	70.24	1	70.24	6
34	928	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	Sri Lanka	2022	1	UN EGDI	0.63	0.63	63	63.00	1	63.00	6
34	929	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	Sri Lanka	2020	2	UN EGDI	0.6708	0.67	67.1	67.08	1	67.08	6
34	930	Digital	State of online e-governance provision (EGDI)	State of online e-governance provision (EGDI)	Sri Lanka	\N	3	\N	-0.0423	-0.04	22.3	22.30	1	22.30	6
13	961	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	Afghanistan	2022	1	WDI	8.9	8.90	8.9	8.90	1	8.90	7
13	962	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	Afghanistan	2019	2	WDI	7.6	7.60	7.6	7.60	1	7.60	7
13	963	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	Afghanistan	\N	3	\N	1.27820208	1.28	78.9	78.93	1	78.93	7
13	964	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	Bangladesh	2022	1	WDI	33.2	33.20	33.2	33.20	1	33.20	7
13	965	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	Bangladesh	2019	2	WDI	32.1	32.10	32.1	32.10	1	32.10	7
13	966	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	Bangladesh	\N	3	\N	1.068417813	1.07	76.4	76.42	1	76.42	7
13	967	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	Bhutan	2022	1	WDI	17.1	17.10	17.1	17.10	1	17.10	7
13	968	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	Bhutan	2019	2	WDI	16.2	16.20	16.2	16.20	1	16.20	7
13	969	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	Bhutan	\N	3	\N	0.915781672	0.92	74.6	74.60	1	74.60	7
13	970	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	India	2022	1	WDI	21.4	21.40	21.4	21.40	1	21.40	7
32	1037	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	Nepal	\N	2	\N	\N	\N	\N	\N	-1	\N	7
13	971	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	India	2019	2	WDI	26.7	26.70	26.7	26.70	1	26.70	7
13	972	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	India	\N	3	\N	-5.335639025	-5.34	0	0.00	1	0.00	7
13	973	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	Maldives	2022	1	WDI	67.5	67.50	67.5	67.50	1	67.50	7
13	974	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	Maldives	2019	2	WDI	67.2	67.20	67.2	67.20	1	67.20	7
13	975	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	Maldives	\N	3	\N	0.2839928	0.28	67.1	67.06	1	67.06	7
13	976	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	Nepal	2022	1	WDI	8.4	8.40	8.4	8.40	1	8.40	7
13	977	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	Nepal	2019	2	WDI	7.3	7.30	7.3	7.30	1	7.30	7
13	978	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	Nepal	\N	3	\N	1.102347718	1.10	76.8	76.83	1	76.83	7
13	979	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	Pakistan	2022	1	WDI	25.2	25.20	25.2	25.20	1	25.20	7
13	980	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	Pakistan	2019	2	WDI	22.2	22.20	22.2	22.20	1	22.20	7
13	981	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	Pakistan	\N	3	\N	3.044052356	3.04	100	100.00	1	100.00	7
13	982	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	SARw/oIndia	2022	1	SAR DST	30.9	30.90	30.9	30.90	1	30.90	7
13	983	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	SARw/oIndia	2019	2	SAR DST	28.98054	28.98	29	28.98	1	28.98	7
13	984	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	SARw/oIndia	\N	3	\N	0.961977054	0.96	75.2	75.15	1	75.15	7
13	985	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	South Asia Region	2022	1	WDI	23.5	23.50	23.5	23.50	1	23.50	7
13	986	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	South Asia Region	2019	2	WDI	27	27.00	27	27.00	1	27.00	7
13	987	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	South Asia Region	\N	3	\N	-3.506216414	-3.51	21.8	21.83	1	21.83	7
13	988	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	Sri Lanka	2022	1	WDI	59.9	59.90	59.9	59.90	1	59.90	7
13	989	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	Sri Lanka	2019	2	WDI	58.2	58.20	58.2	58.20	1	58.20	7
13	990	Cross Cutting	Waged employment share of working age, population, of which (%) are women	Wage and salaried workers, female (% of female employment) (modeled ILO estimate)	Sri Lanka	\N	3	\N	1.726668193	1.73	84.3	84.28	1	84.28	7
14	991	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	Afghanistan	2021	1	WDI	65	65.00	65	65.00	-1	-65.00	7
14	992	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	Afghanistan	2020	2	WDI	74	74.00	74	74.00	-1	-74.00	7
14	993	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	Afghanistan	\N	3	\N	-8.969	-8.97	0	0.00	1	0.00	7
32	1022	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	Afghanistan	\N	2	\N	\N	\N	\N	\N	-1	\N	7
32	1023	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	Afghanistan	\N	3	\N	\N	\N	\N	\N	1	\N	7
14	994	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	Bangladesh	2022	1	WDI	47.8	47.80	47.8	47.80	-1	-47.80	7
14	995	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	Bangladesh	2017	2	WDI	44.6	44.60	44.6	44.60	-1	-44.60	7
14	996	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	Bangladesh	\N	3	\N	3.16	3.16	65.3	65.28	1	65.28	7
14	997	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	Bhutan	2022	1	WDI	22.5	22.50	22.5	22.50	-1	-22.50	7
14	998	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	Bhutan	2019	2	WDI	12.9	12.90	12.9	12.90	-1	-12.90	7
14	999	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	Bhutan	\N	3	\N	9.612	9.61	100	100.00	1	100.00	7
14	1000	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	India	2022	1	WDI	41.8	41.80	41.8	41.80	-1	-41.80	7
14	1001	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	India	2019	2	WDI	47.6	47.60	47.6	47.60	-1	-47.60	7
14	1002	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	India	\N	3	\N	-5.765	-5.77	17.2	17.24	1	17.24	7
14	1003	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	Maldives	2019	1	WDI	28.5	28.50	28.5	28.50	-1	-28.50	7
14	1004	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	Maldives	2019	2	WDI	28.5	28.50	28.5	28.50	-1	-28.50	7
14	1005	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	Maldives	\N	3	\N	0.006	0.01	48.3	48.30	1	48.30	7
14	1006	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	Nepal	2017	1	WDI	45.8	45.80	45.8	45.80	-1	-45.80	7
14	1007	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	Nepal	2017	2	WDI	45.8	45.80	45.8	45.80	-1	-45.80	7
14	1008	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	Nepal	\N	3	\N	0.017	0.02	48.4	48.36	1	48.36	7
14	1009	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	Pakistan	2021	1	WDI	56.4	56.40	56.4	56.40	-1	-56.40	7
14	1010	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	Pakistan	2019	2	WDI	52.5	52.50	52.5	52.50	-1	-52.50	7
14	1011	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	Pakistan	\N	3	\N	3.917	3.92	69.4	69.35	1	69.35	7
14	1012	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	SARw/oIndia	2022	1	SAR DST	29.9	29.90	29.9	29.90	-1	-29.90	7
14	1013	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	SARw/oIndia	2019	2	SAR DST	50.163	50.16	50.2	50.16	-1	-50.16	7
14	1014	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	SARw/oIndia	\N	3	\N	2.387688227	2.39	61.1	61.12	1	61.12	7
14	1015	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	South Asia Region	2022	1	WDI	42.5	42.50	42.5	42.50	-1	-42.50	7
14	1016	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	South Asia Region	2019	2	WDI	48.1	48.10	48.1	48.10	-1	-48.10	7
14	1017	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	South Asia Region	\N	3	\N	-5.580736446	-5.58	18.2	18.24	1	18.24	7
14	1018	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	Sri Lanka	2020	1	WDI	27.5	27.50	27.5	27.50	-1	-27.50	7
14	1019	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	Sri Lanka	2019	2	WDI	29	29.00	29	29.00	-1	-29.00	7
14	1020	Cross Cutting	Percentage of youth not in education, employment, or training, of which (%) are women	Share of youth not in education, employment or training, female (% of female youth population)	Sri Lanka	\N	3	\N	-1.496	-1.50	40.2	40.22	1	40.22	7
32	1021	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	Afghanistan	\N	1	\N	\N	\N	\N	\N	-1	\N	7
32	1025	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	Bangladesh	\N	2	\N	\N	\N	\N	\N	-1	\N	7
32	1026	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	Bangladesh	\N	3	\N	\N	\N	\N	\N	1	\N	7
32	1027	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	Bhutan	\N	1	\N	\N	\N	\N	\N	-1	\N	7
32	1028	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	Bhutan	\N	2	\N	\N	\N	\N	\N	-1	\N	7
32	1029	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	Bhutan	\N	3	\N	\N	\N	\N	\N	1	\N	7
32	1030	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	India	\N	1	\N	\N	\N	\N	\N	-1	\N	7
32	1031	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	India	\N	2	\N	\N	\N	\N	\N	-1	\N	7
32	1032	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	India	\N	3	\N	\N	\N	\N	\N	1	\N	7
32	1033	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	Maldives	\N	1	\N	\N	\N	\N	\N	-1	\N	7
32	1034	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	Maldives	\N	2	\N	\N	\N	\N	\N	-1	\N	7
32	1038	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	Nepal	\N	3	\N	\N	\N	\N	\N	1	\N	7
32	1039	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	Pakistan	\N	1	\N	\N	\N	\N	\N	-1	\N	7
32	1040	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	Pakistan	\N	2	\N	\N	\N	\N	\N	-1	\N	7
32	1041	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	Pakistan	\N	3	\N	\N	\N	\N	\N	1	\N	7
32	1042	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	SARw/oIndia	\N	1	\N	\N	\N	\N	\N	-1	\N	7
32	1043	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	SARw/oIndia	\N	2	\N	\N	\N	\N	\N	-1	\N	7
32	1044	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	SARw/oIndia	\N	3	\N	\N	\N	\N	\N	1	\N	7
32	1045	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	South Asia Region	\N	1	\N	\N	\N	\N	\N	-1	\N	7
32	1046	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	South Asia Region	\N	2	\N	\N	\N	\N	\N	-1	\N	7
32	1047	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	South Asia Region	\N	3	\N	\N	\N	\N	\N	1	\N	7
32	1048	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	Sri Lanka	\N	1	\N	\N	\N	\N	\N	-1	\N	7
32	1049	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	Sri Lanka	\N	2	\N	\N	\N	\N	\N	-1	\N	7
32	1050	Cross Cutting	# Extreme poor living in FCS	# Extreme poor living in FCS	Sri Lanka	\N	3	\N	\N	\N	\N	\N	1	\N	7
17	1	Vision	Poverty rate (National)	Poverty rate (National)	Afghanistan	2019	1	IE-LFS	47.1	47.10	47.1	47.10	-1	-47.10	4
17	2	Vision	Poverty rate (National)	Poverty rate (National)	Afghanistan	\N	2	\N	\N	\N	\N	\N	-1	\N	4
17	3	Vision	Poverty rate (National)	Poverty rate (National)	Afghanistan	\N	3	\N	\N	\N	\N	\N	1	\N	4
17	4	Vision	Poverty rate (National)	Poverty rate (National)	Bangladesh	2022	1	HIES; country team	18.7	18.70	18.7	18.70	-1	-18.70	4
17	5	Vision	Poverty rate (National)	Poverty rate (National)	Bangladesh	2016	2	Country team; BDU	24.3	24.30	24.3	24.30	-1	-24.30	4
17	6	Vision	Poverty rate (National)	Poverty rate (National)	Bangladesh	\N	3	\N	-5.6	-5.60	25.5	25.51	1	25.51	4
17	7	Vision	Poverty rate (National)	Poverty rate (National)	Bhutan	2023	1	BLSS	12.4	12.40	12.4	12.40	-1	-12.40	4
17	8	Vision	Poverty rate (National)	Poverty rate (National)	Bhutan	2017	2	Country team; BLSS	28	28.00	28	28.00	-1	-28.00	4
17	9	Vision	Poverty rate (National)	Poverty rate (National)	Bhutan	\N	3	\N	-15.6	-15.60	0	0.00	1	0.00	4
17	10	Vision	Poverty rate (National)	Poverty rate (National)	India	\N	1	\N	\N	\N	\N	\N	-1	\N	4
17	11	Vision	Poverty rate (National)	Poverty rate (National)	India	\N	2	\N	\N	\N	\N	\N	-1	\N	4
17	12	Vision	Poverty rate (National)	Poverty rate (National)	India	\N	3	\N	\N	\N	\N	\N	1	\N	4
17	15	Vision	Poverty rate (National)	Poverty rate (National)	Maldives	\N	3	\N	\N	\N	\N	\N	1	\N	4
18	45	Vision	Poverty rate ($2.15 poverty line)	Poverty rate ($2.15 poverty line)	Maldives	\N	3	\N	\N	\N	\N	\N	1	\N	4
20	91	Vision	Poverty rate (6.85 poverty line)	Poverty rate (6.85 poverty line)	Afghanistan	\N	1	\N	\N	\N	\N	\N	-1	\N	4
8	759	Planet	Prevalence of undernourishment %	Prevalence of undernourishment %	Bhutan	\N	3	\N	\N	\N	\N	\N	1	\N	3
32	931	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Afghanistan	2021	1	Global Findex Database	4.7	4.70	4.7	4.70	1	4.70	7
32	932	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Afghanistan	2017	2	Global Findex Database	7.2	7.20	7.2	7.20	1	7.20	7
32	933	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Afghanistan	\N	3	\N	-2.502743092	-2.50	0	0.00	1	0.00	7
32	934	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Bangladesh	2021	1	Global Findex Database	43.46	43.46	43.5	43.46	1	43.46	7
32	935	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Bangladesh	2017	2	Global Findex Database	35.8	35.80	35.8	35.80	1	35.80	7
32	936	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Bangladesh	\N	3	\N	7.656691504	7.66	18.2	18.17	1	18.17	7
32	937	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Bhutan	2022	1	Royal Monetary Authority of Bhutan: Access to Finance, Demand Side Survey 2022	81.0999999999999	81.10	81.1	81.10	1	81.10	7
32	938	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Bhutan	2017	2	Global Findex Database	27.7	27.70	27.7	27.70	1	27.70	7
32	939	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Bhutan	\N	3	\N	53.4	53.40	100	100.00	1	100.00	7
32	940	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	India	2021	1	Global Findex Database	77.55	77.55	77.6	77.55	1	77.55	7
32	941	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	India	2017	2	Global Findex Database	76.5999999999999	76.60	76.6	76.60	1	76.60	7
32	942	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	India	\N	3	\N	0.952610636	0.95	6.2	6.18	1	6.18	7
32	943	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Maldives	2017	1	Global Findex Database	74.18	74.18	74.2	74.18	1	74.18	7
32	944	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Maldives	2017	2	Global Findex Database	74.2	74.20	74.2	74.20	1	74.20	7
32	945	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Maldives	\N	3	\N	-0.018413496	-0.02	4.4	4.44	1	4.44	7
32	946	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Nepal	2021	1	Global Findex Database	49.9	49.90	49.9	49.90	1	49.90	7
32	947	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Nepal	2017	2	Global Findex Database	41.6	41.60	41.6	41.60	1	41.60	7
32	948	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Nepal	\N	3	\N	8.303273582	8.30	19.3	19.33	1	19.33	7
32	949	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Pakistan	2021	1	Global Findex Database	13.48	13.48	13.5	13.48	1	13.48	7
32	950	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Pakistan	2017	2	Global Findex Database	7	7.00	7	7.00	1	7.00	7
32	951	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Pakistan	\N	3	\N	6.478496671	6.48	16.1	16.07	1	16.07	7
32	952	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	SARw/oIndia	2021	1	SAR DST	30.7	30.70	30.7	30.70	1	30.70	7
32	953	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	SARw/oIndia	2017	2	SAR DST	24.071	24.07	24.1	24.07	1	24.07	7
32	954	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	SARw/oIndia	\N	3	\N	6.649272172	6.65	16.4	16.37	1	16.37	7
32	955	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	South Asia Region	2021	1	Global Findex Database	65.83	65.83	65.8	65.83	1	65.83	7
32	956	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	South Asia Region	2017	2	Global Findex Database	64.0999999999999	64.10	64.1	64.10	1	64.10	7
32	957	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	South Asia Region	\N	3	\N	1.732382441	1.73	7.6	7.58	1	7.58	7
32	958	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Sri Lanka	2021	1	Global Findex Database	89.28	89.28	89.3	89.28	1	89.28	7
32	959	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Sri Lanka	2017	2	Global Findex Database	73.4	73.40	73.4	73.40	1	73.40	7
32	960	Cross Cutting	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)	Sri Lanka	\N	3	\N	15.87747607	15.88	32.9	32.88	1	32.88	7
36	1051	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	Afghanistan	2023	1	UNHCR	3.31	3.31	3.3	3.31	-1	-3.31	7
36	1052	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	Afghanistan	2019	2	UNHCR	2.625864	2.63	2.6	2.63	-1	-2.63	7
36	1053	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	Afghanistan	\N	3	\N	0.679266	0.68	48.4	48.45	1	48.45	7
36	1054	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	Bangladesh	2023	1	UNHCR	0.96	0.96	1	0.96	-1	-0.96	7
36	1055	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	Bangladesh	2019	2	UNHCR	0.854813	0.85	0.9	0.85	-1	-0.85	7
36	1056	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	Bangladesh	\N	3	\N	0.107004	0.11	8.7	8.72	1	8.72	7
36	1057	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	Bhutan	\N	1	UNHCR	\N	\N	\N	\N	-1	\N	7
36	1058	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	Bhutan	\N	2	\N	\N	\N	\N	\N	-1	\N	7
36	1059	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	Bhutan	\N	3	\N	\N	\N	\N	\N	1	\N	7
36	1060	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	India	2023	1	UNHCR	0.26	0.26	0.3	0.26	-1	-0.26	7
36	1061	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	India	2019	2	UNHCR	0.207305	0.21	0.2	0.21	-1	-0.21	7
36	1062	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	India	\N	3	\N	0.05275	0.05	5	4.95	1	4.95	7
36	1063	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	Maldives	\N	1	UNHCR	\N	\N	\N	\N	-1	\N	7
36	1064	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	Maldives	\N	2	\N	\N	\N	\N	\N	-1	\N	7
36	1065	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	Maldives	\N	3	\N	\N	\N	\N	\N	1	\N	7
36	1066	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	Nepal	2023	1	UNHCR	0.02	0.02	0	0.02	-1	-0.02	7
36	1067	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	Nepal	2019	2	UNHCR	0.019627	0.02	0	0.02	-1	-0.02	7
36	1068	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	Nepal	\N	3	\N	0.000155	0.00	1.3	1.30	1	1.30	7
36	1069	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	Pakistan	2023	1	UNHCR, country team	2.13	2.13	2.1	2.13	-1	-2.13	7
36	1070	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	Pakistan	2019	2	UNHCR	1.528804	1.53	1.5	1.53	-1	-1.53	7
36	1071	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	Pakistan	\N	3	\N	0.601196	0.60	43	43.03	1	43.03	7
36	1072	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	SARw/oIndia	2023	1	SAR DST	6.43	6.43	6.4	6.43	-1	-6.43	7
36	1073	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	SARw/oIndia	2019	2	SAR DST	5.05562	5.06	5.1	5.06	-1	-5.06	7
36	1074	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	SARw/oIndia	\N	3	\N	1.369048	1.37	96.3	96.34	1	96.34	7
36	1075	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	South Asia Region	2023	1	UNHCR	6.69	6.69	6.7	6.69	-1	-6.69	7
36	1076	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	South Asia Region	2019	2	SAR DST	5.262925	5.26	5.3	5.26	-1	-5.26	7
36	1077	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	South Asia Region	\N	3	\N	1.421798	1.42	100	100.00	1	100.00	7
36	1078	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	Sri Lanka	2023	1	UNHCR	0.01	0.01	0	0.01	-1	-0.01	7
36	1079	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	Sri Lanka	2019	2	UNHCR	0.026512	0.03	0	0.03	-1	-0.03	7
36	1080	Cross Cutting	Number of displaced people in need of protection (million)	Number of displaced people in need of protection (million)	Sri Lanka	\N	3	\N	-0.018573	-0.02	0	0.00	1	0.00	7
37	1081	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Afghanistan	2021	1	WDI	6.6	6.60	6.6	6.60	1	6.60	7
37	1082	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Afghanistan	\N	2	\N	\N	\N	\N	\N	1	\N	7
37	1083	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Afghanistan	\N	3	\N	\N	\N	\N	\N	1	\N	7
37	1084	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Bangladesh	2022	1	WDI	24.5	24.50	24.5	24.50	1	24.50	7
37	1085	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Bangladesh	2019	2	WDI	25.2	25.20	25.2	25.20	1	25.20	7
37	1086	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Bangladesh	\N	3	\N	-0.684881045	-0.68	93.3	93.29	1	93.29	7
37	1087	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Bhutan	2021	1	WDI	31.3	31.30	31.3	31.30	1	31.30	7
37	1088	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Bhutan	2019	2	WDI	38.9	38.90	38.9	38.90	1	38.90	7
37	1089	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Bhutan	\N	3	\N	-7.605739982	-7.61	0	0.00	1	0.00	7
37	1090	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	India	2021	1	WDI	24.7	24.70	24.7	24.70	1	24.70	7
37	1091	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	India	2019	2	WDI	24.9	24.90	24.9	24.90	1	24.90	7
37	1092	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	India	\N	3	\N	-0.186692072	-0.19	100	100.00	1	100.00	7
37	1093	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Maldives	\N	1	WDI	\N	\N	\N	\N	1	\N	7
37	1094	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Maldives	\N	2	\N	\N	\N	\N	\N	1	\N	7
37	1095	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Maldives	\N	3	\N	\N	\N	\N	\N	1	\N	7
37	1096	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Nepal	2022	1	WDI	22.5	22.50	22.5	22.50	1	22.50	7
37	1097	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Nepal	2019	2	WDI	28.1	28.10	28.1	28.10	1	28.10	7
37	1098	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Nepal	\N	3	\N	-5.643884034	-5.64	26.4	26.44	1	26.44	7
37	1099	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Pakistan	2022	1	WDI	11.3	11.30	11.3	11.30	1	11.30	7
37	1100	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Pakistan	2019	2	WDI	11.7	11.70	11.7	11.70	1	11.70	7
37	1101	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Pakistan	\N	3	\N	-0.388901413	-0.39	97.3	97.27	1	97.27	7
37	1102	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	SARw/oIndia	2021	1	SAR DST	20	20.00	20	20.00	1	20.00	7
37	1103	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	SARw/oIndia	2019	2	SAR DST	21.3491	21.35	21.3	21.35	1	21.35	7
37	1104	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	SARw/oIndia	\N	3	\N	-1.348610191	-1.35	84.3	84.34	1	84.34	7
37	1105	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	South Asia Region	2021	1	WDI	23	23.00	23	23.00	1	23.00	7
37	1106	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	South Asia Region	2019	2	WDI	23.7	23.70	23.7	23.70	1	23.70	7
37	1107	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	South Asia Region	\N	3	\N	-0.7	-0.70	93.1	93.08	1	93.08	7
37	1108	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Sri Lanka	2009	1	WDI	17.3	17.30	17.3	17.30	1	17.30	7
37	1109	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Sri Lanka	2008	2	WDI	19.3	19.30	19.3	19.30	1	19.30	7
37	1110	Cross Cutting	Gross Fixed Capital Fomration (private sector) as a percentage of GDP	Gross Fixed Capital Formation (private sector) as a percentage of GDP	Sri Lanka	\N	3	\N	-1.956087232	-1.96	76.2	76.15	1	76.15	7
\.


--
-- Name: economic_data_code_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.economic_data_code_seq', 6, true);


--
-- Name: indicators_revised_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.indicators_revised_id_seq', 36, true);


--
-- Name: scorecard_indicators2_secondary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.scorecard_indicators2_secondary_id_seq', 1110, true);


--
-- Name: economic_data economic_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.economic_data
    ADD CONSTRAINT economic_data_pkey PRIMARY KEY (code);


--
-- Name: indicators indicators_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.indicators
    ADD CONSTRAINT indicators_pkey PRIMARY KEY (id);


--
-- Name: indicators_revised indicators_revised_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.indicators_revised
    ADD CONSTRAINT indicators_revised_pkey PRIMARY KEY (id);


--
-- Name: scorecard_indicators2 scorecard_indicators2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scorecard_indicators2
    ADD CONSTRAINT scorecard_indicators2_pkey PRIMARY KEY (secondary_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_advance(text, pg_lsn); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_advance(text, pg_lsn) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_create(text); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_create(text) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_drop(text); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_drop(text) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_oid(text); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_oid(text) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_progress(text, boolean); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_progress(text, boolean) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_session_is_setup(); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_is_setup() TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_session_progress(boolean); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_progress(boolean) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_session_reset(); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_reset() TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_session_setup(text); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_setup(text) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_xact_reset(); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_reset() TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn) TO cloudsqlsuperuser;


--
-- PostgreSQL database dump complete
--

