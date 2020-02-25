--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7 (Ubuntu 11.7-1.pgdg18.04+1)
-- Dumped by pg_dump version 11.7 (Ubuntu 11.7-1.pgdg18.04+1)

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

SET default_with_oids = false;

--
-- Name: donors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.donors (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    blood text NOT NULL
);


--
-- Name: donors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.donors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: donors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.donors_id_seq OWNED BY public.donors.id;


--
-- Name: donors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donors ALTER COLUMN id SET DEFAULT nextval('public.donors_id_seq'::regclass);


--
-- Data for Name: donors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.donors (id, name, email, blood) FROM stdin;
4	Lorem	Lorem	O+
7	Ipsom	Ipsom	AB+
8	Sara	Sara	A+
6	Lua Sol	lua@sol.com	B+
\.


--
-- Name: donors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.donors_id_seq', 9, true);


--
-- Name: donors donors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donors
    ADD CONSTRAINT donors_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

