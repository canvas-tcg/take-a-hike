--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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
-- Name: hikes; Type: TABLE; Schema: public; Owner: mimcollopy
--

CREATE TABLE public.hikes (
    id integer NOT NULL,
    name text,
    location text,
    image_url text,
    length integer,
    days integer,
    user_id integer
);


ALTER TABLE public.hikes OWNER TO mimcollopy;

--
-- Name: hikes_id_seq; Type: SEQUENCE; Schema: public; Owner: mimcollopy
--

CREATE SEQUENCE public.hikes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hikes_id_seq OWNER TO mimcollopy;

--
-- Name: hikes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mimcollopy
--

ALTER SEQUENCE public.hikes_id_seq OWNED BY public.hikes.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: mimcollopy
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text,
    email text,
    password_digest text
);


ALTER TABLE public.users OWNER TO mimcollopy;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: mimcollopy
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO mimcollopy;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mimcollopy
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: hikes id; Type: DEFAULT; Schema: public; Owner: mimcollopy
--

ALTER TABLE ONLY public.hikes ALTER COLUMN id SET DEFAULT nextval('public.hikes_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: mimcollopy
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: hikes; Type: TABLE DATA; Schema: public; Owner: mimcollopy
--

COPY public.hikes (id, name, location, image_url, length, days, user_id) FROM stdin;
2	Te Arora Trail	New Zealand	https://cdn.shopify.com/s/files/1/3004/4846/articles/BLOG-TeAraroa-1_1c386541-179c-4699-a1b5-6d0f0470d34b.jpg?v=1595576509	3000	120	\N
5	Pacific Crest Trail	United States	https://fakeimg.pl/600x400/cccccc/225db5	4265	150	\N
3	Everest Base Camp	Nepal	https://i.insider.com/6359c732ea35650019e06210?width=600&format=jpeg&auto=webp	130	12	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: mimcollopy
--

COPY public.users (id, username, email, password_digest) FROM stdin;
1	mim	mim@mim.com	$2b$10$qLZvkAERH0wCS5KFWOYDx.C34K4ZPK05UaLkgS7OlxXzSHa88518K
\.


--
-- Name: hikes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mimcollopy
--

SELECT pg_catalog.setval('public.hikes_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mimcollopy
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: hikes hikes_pkey; Type: CONSTRAINT; Schema: public; Owner: mimcollopy
--

ALTER TABLE ONLY public.hikes
    ADD CONSTRAINT hikes_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: mimcollopy
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

