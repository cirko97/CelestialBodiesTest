--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    stars_number integer,
    planets_number integer,
    galaxy_desc text DEFAULT 'Galaxt Description Example'::text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    height_in_km integer,
    is_full boolean,
    planet_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size numeric(5,1) NOT NULL,
    is_big boolean NOT NULL,
    star_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: small_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.small_planet (
    small_planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_pretty boolean NOT NULL,
    galaxy_id integer DEFAULT 3 NOT NULL
);


ALTER TABLE public.small_planet OWNER TO freecodecamp;

--
-- Name: small_planet_small_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.small_planet_small_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.small_planet_small_planet_id_seq OWNER TO freecodecamp;

--
-- Name: small_planet_small_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.small_planet_small_planet_id_seq OWNED BY public.small_planet.small_planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_big boolean NOT NULL,
    star_desc text,
    galaxy_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: small_planet small_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.small_planet ALTER COLUMN small_planet_id SET DEFAULT nextval('public.small_planet_small_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Black Galaxy', 55, 6, 'Galaxt Description Example');
INSERT INTO public.galaxy VALUES (2, 'Blue Galaxy', 44, 5, 'Galaxt Description Example');
INSERT INTO public.galaxy VALUES (3, 'Purple Galaxy', 35, 4, 'Galaxt Description Example');
INSERT INTO public.galaxy VALUES (4, 'Ligh Galaxy', 68, 10, 'Galaxt Description Example');
INSERT INTO public.galaxy VALUES (5, 'Dark Galaxy', 34, 2, 'Galaxt Description Example');
INSERT INTO public.galaxy VALUES (6, 'Joi Galaxy', 77, 15, 'Galaxt Description Example');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Full Moon', 555, true, 1);
INSERT INTO public.moon VALUES (2, 'Empty Moon', 6, false, 1);
INSERT INTO public.moon VALUES (3, 'Black Moon', 88, false, 1);
INSERT INTO public.moon VALUES (4, 'Blue Moon', 77, false, 1);
INSERT INTO public.moon VALUES (5, 'Big Moon', 888, true, 1);
INSERT INTO public.moon VALUES (6, 'Purple Moon', 99, false, 1);
INSERT INTO public.moon VALUES (7, 'Nice Moon', 50, false, 1);
INSERT INTO public.moon VALUES (8, 'Hell Moon', 69, false, 1);
INSERT INTO public.moon VALUES (9, 'Heaven Moon', 100, true, 1);
INSERT INTO public.moon VALUES (10, 'Blah Moon', 66, false, 1);
INSERT INTO public.moon VALUES (11, 'Asdf moon', 47, false, 1);
INSERT INTO public.moon VALUES (12, 'Joi Moon', 88, false, 1);
INSERT INTO public.moon VALUES (13, 'Enjoy Moon', 101, true, 1);
INSERT INTO public.moon VALUES (14, 'Sql Moon', 900, true, 1);
INSERT INTO public.moon VALUES (15, 'Earth Moon', 999, true, 1);
INSERT INTO public.moon VALUES (16, 'Sam Moon', 55, false, 1);
INSERT INTO public.moon VALUES (17, 'Jas Moon', 88, false, 1);
INSERT INTO public.moon VALUES (18, 'John Moon', 99, true, 1);
INSERT INTO public.moon VALUES (19, 'Light Moon', 555, true, 1);
INSERT INTO public.moon VALUES (20, 'Darker Moon', 99, false, 1);
INSERT INTO public.moon VALUES (21, 'Bright Moon', 896, true, 1);
INSERT INTO public.moon VALUES (22, 'Tutu Moon', 66, false, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 5015.5, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 6473.7, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 2031.5, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 3456.7, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 7654.9, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 1975.3, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 6352.5, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4567.2, false, 1);
INSERT INTO public.planet VALUES (9, 'Comet', 2546.2, false, 1);
INSERT INTO public.planet VALUES (10, 'Sun', 3333.3, false, 1);
INSERT INTO public.planet VALUES (11, 'PlanetB', 5678.9, true, 1);
INSERT INTO public.planet VALUES (12, 'PlanetC', 4444.2, false, 1);


--
-- Data for Name: small_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.small_planet VALUES (1, 'Jack Planet', true, 3);
INSERT INTO public.small_planet VALUES (2, 'John Planet', false, 3);
INSERT INTO public.small_planet VALUES (3, 'Blah Planet', true, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Blue Star', false, NULL, 1);
INSERT INTO public.star VALUES (5, 'Light Star', false, NULL, 1);
INSERT INTO public.star VALUES (6, 'Dark Star', false, NULL, 1);
INSERT INTO public.star VALUES (2, 'Bad Star', false, 'Nice small star', 1);
INSERT INTO public.star VALUES (4, 'Black Star', true, NULL, 2);
INSERT INTO public.star VALUES (7, 'My Star', true, NULL, 2);
INSERT INTO public.star VALUES (1, 'Nice Star', true, 'Nice big star', 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: small_planet_small_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.small_planet_small_planet_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: small_planet small_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.small_planet
    ADD CONSTRAINT small_planet_pkey PRIMARY KEY (small_planet_id);


--
-- Name: small_planet small_planet_small_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.small_planet
    ADD CONSTRAINT small_planet_small_planet_id_key UNIQUE (small_planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: small_planet small_planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.small_planet
    ADD CONSTRAINT small_planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

