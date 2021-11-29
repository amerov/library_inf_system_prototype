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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: employees; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.employees (
    id bigint NOT NULL,
    full_name character varying,
    lib_id bigint NOT NULL,
    "position" character varying,
    birthdate date,
    joined_at date,
    education character varying,
    salary integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;


--
-- Name: foundations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.foundations (
    id bigint NOT NULL,
    name character varying NOT NULL,
    lib_id bigint NOT NULL,
    books_count integer DEFAULT 0 NOT NULL,
    journals_count integer DEFAULT 0 NOT NULL,
    newspapers_count integer DEFAULT 0 NOT NULL,
    collections_count integer DEFAULT 0 NOT NULL,
    dissertations_count integer DEFAULT 0 NOT NULL,
    reports_count integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: foundations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.foundations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: foundations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.foundations_id_seq OWNED BY public.foundations.id;


--
-- Name: libs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.libs (
    id bigint NOT NULL,
    name character varying NOT NULL,
    address character varying NOT NULL,
    city character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: libs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.libs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: libs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.libs_id_seq OWNED BY public.libs.id;


--
-- Name: replenishments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.replenishments (
    id bigint NOT NULL,
    foundation_id bigint NOT NULL,
    employee_id bigint NOT NULL,
    name character varying NOT NULL,
    type_id bigint NOT NULL,
    publisher character varying NOT NULL,
    items_count integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: replenishments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.replenishments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: replenishments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.replenishments_id_seq OWNED BY public.replenishments.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.types (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.types_id_seq OWNED BY public.types.id;


--
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);


--
-- Name: foundations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.foundations ALTER COLUMN id SET DEFAULT nextval('public.foundations_id_seq'::regclass);


--
-- Name: libs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.libs ALTER COLUMN id SET DEFAULT nextval('public.libs_id_seq'::regclass);


--
-- Name: replenishments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.replenishments ALTER COLUMN id SET DEFAULT nextval('public.replenishments_id_seq'::regclass);


--
-- Name: types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.types ALTER COLUMN id SET DEFAULT nextval('public.types_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: foundations foundations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.foundations
    ADD CONSTRAINT foundations_pkey PRIMARY KEY (id);


--
-- Name: libs libs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.libs
    ADD CONSTRAINT libs_pkey PRIMARY KEY (id);


--
-- Name: replenishments replenishments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.replenishments
    ADD CONSTRAINT replenishments_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- Name: index_employees_on_lib_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_employees_on_lib_id ON public.employees USING btree (lib_id);


--
-- Name: index_foundations_on_lib_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_foundations_on_lib_id ON public.foundations USING btree (lib_id);


--
-- Name: index_replenishments_on_employee_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_replenishments_on_employee_id ON public.replenishments USING btree (employee_id);


--
-- Name: index_replenishments_on_foundation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_replenishments_on_foundation_id ON public.replenishments USING btree (foundation_id);


--
-- Name: index_replenishments_on_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_replenishments_on_type_id ON public.replenishments USING btree (type_id);


--
-- Name: index_types_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_types_on_name ON public.types USING btree (name);


--
-- Name: replenishments fk_rails_49126c5202; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.replenishments
    ADD CONSTRAINT fk_rails_49126c5202 FOREIGN KEY (employee_id) REFERENCES public.employees(id);


--
-- Name: replenishments fk_rails_6871a433a2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.replenishments
    ADD CONSTRAINT fk_rails_6871a433a2 FOREIGN KEY (foundation_id) REFERENCES public.foundations(id);


--
-- Name: replenishments fk_rails_733c3341f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.replenishments
    ADD CONSTRAINT fk_rails_733c3341f3 FOREIGN KEY (type_id) REFERENCES public.types(id);


--
-- Name: employees fk_rails_895e594d61; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_rails_895e594d61 FOREIGN KEY (lib_id) REFERENCES public.libs(id);


--
-- Name: foundations fk_rails_f66390327a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.foundations
    ADD CONSTRAINT fk_rails_f66390327a FOREIGN KEY (lib_id) REFERENCES public.libs(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20211128161741'),
('20211128164011'),
('20211128204719'),
('20211128230709'),
('20211128233239');


