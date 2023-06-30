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
-- Name: likes; Type: TABLE; Schema: public; Owner: mimcollopy
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    user_id integer,
    hike_id integer
);


ALTER TABLE public.likes OWNER TO mimcollopy;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: mimcollopy
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.likes_id_seq OWNER TO mimcollopy;

--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mimcollopy
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


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
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: mimcollopy
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: mimcollopy
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: hikes; Type: TABLE DATA; Schema: public; Owner: mimcollopy
--

COPY public.hikes (id, name, location, image_url, length, days, user_id) FROM stdin;
2	Te Arora Trail	New Zealand	https://cdn.shopify.com/s/files/1/3004/4846/articles/BLOG-TeAraroa-1_1c386541-179c-4699-a1b5-6d0f0470d34b.jpg?v=1595576509	3000	120	\N
26	test1	United States	https://us.v-cdn.net/6035679/uploads/GVEBODED0TWU/img-4134-jpg.jpg	10	10	3
27	test2	Australia	https://us.v-cdn.net/6035679/uploads/BW1VAMU8EYC4/pxl-20221220-094907382-portrait-01.jpeg	20	20	3
28	test 3	test	https://us.v-cdn.net/6035679/uploads/KNHC0GUWU06W/picture1.jpg	30	30	3
29	test 4	test	https://us.v-cdn.net/6035679/uploads/MYLH7WGZS8PV/img-20200626-123945.jpg	40	40	3
3	Everest Base Camp	Nepal	https://i.insider.com/6359c732ea35650019e06210?width=600&format=jpeg&auto=webp	130	12	\N
5	Pacific Crest Trail	United States	https://www.planetware.com/photos-large/USCA/usa-pct-washington-north-cascades-national-park-harts-pass.jpg	4265	150	\N
6	Overland Track	Australia	https://s1.at.atcdn.net/wp-content/uploads/2022/08/the-overland-track-tasmania-australia-hero-800x600.jpg	65	6	\N
8	Foothills Trail	United States	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNuf0HHjBUCSZjDHXtBzzG95G3AoiIqoiosg&usqp=CAU	123	5	3
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: mimcollopy
--

COPY public.likes (id, user_id, hike_id) FROM stdin;
41	3	26
43	3	28
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: mimcollopy
--

COPY public.users (id, username, email, password_digest) FROM stdin;
1	mim	mim@mim.com	$2b$10$qLZvkAERH0wCS5KFWOYDx.C34K4ZPK05UaLkgS7OlxXzSHa88518K
2	hiker	hiker@hiker.com	$2b$10$aSpxQgDjwtwuZxBDFX1wcOTnE5gHFSQpQBBSpr2lTOAcUagAQmh6.
3	classic	classic@classic.com	$2b$10$WKf44V5LcsGWw4LpoPt26eE0uEEfiYuoGOtOxRjgVBgj2c45.sriu
\.


--
-- Name: hikes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mimcollopy
--

SELECT pg_catalog.setval('public.hikes_id_seq', 29, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mimcollopy
--

SELECT pg_catalog.setval('public.likes_id_seq', 43, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mimcollopy
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: hikes hikes_pkey; Type: CONSTRAINT; Schema: public; Owner: mimcollopy
--

ALTER TABLE ONLY public.hikes
    ADD CONSTRAINT hikes_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: mimcollopy
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: mimcollopy
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

