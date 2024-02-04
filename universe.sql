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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    tail_length numeric,
    is_periodic boolean,
    last_perihelion_date date,
    galaxy_id integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size integer,
    has_black_hole boolean,
    discovered_date date,
    interesting_fact text
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
    name character varying(50) NOT NULL,
    surface text,
    has_water boolean,
    planet_id integer,
    diameter numeric,
    surface_material character varying(50)
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
    name character varying(50) NOT NULL,
    atmosphere text,
    gravity numeric,
    is_inhabited boolean,
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    temperature numeric,
    is_supernova boolean,
    galaxy_id integer,
    luminosity numeric,
    constellation character varying(50)
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 0.1, true, '2022-07-28', 1);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 2.5, false, '1997-04-01', 2);
INSERT INTO public.comet VALUES (3, 'Encke', 0.02, true, '2023-09-23', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, true, '2020-01-01', 'The Milky Way has a supermassive black hole at its center.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 120000, false, '2020-01-01', 'The Milky Way has a supermassive black hole at its center.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 80000, false, '2020-01-01', 'The Milky Way has a supermassive black hole at its center.');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 60000, false, '2020-01-01', 'The Milky Way has a supermassive black hole at its center.');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 75000, true, '2020-01-01', 'The Milky Way has a supermassive black hole at its center.');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 90000, false, '2020-01-01', 'The Milky Way has a supermassive black hole at its center.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Rocky', true, 1, 3474, 'Regolith');
INSERT INTO public.moon VALUES (2, 'Phobos', 'Irregular', false, 2, 3474, 'Regolith');
INSERT INTO public.moon VALUES (3, 'Deimos', 'Rocky', false, 2, 3474, 'Regolith');
INSERT INTO public.moon VALUES (4, 'Titan', 'Thick Atmosphere', true, 5, 3474, 'Regolith');
INSERT INTO public.moon VALUES (5, 'Europa', 'Ice Crust', true, 3, 3474, 'Regolith');
INSERT INTO public.moon VALUES (6, 'Io', 'Volcanic', false, 3, 3474, 'Regolith');
INSERT INTO public.moon VALUES (7, 'Ganymede', 'Water Ice', true, 5, 3474, 'Regolith');
INSERT INTO public.moon VALUES (8, 'Callisto', 'Impact Basins', false, 5, 3474, 'Regolith');
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Ice Crust', true, 4, 3474, 'Regolith');
INSERT INTO public.moon VALUES (10, 'Mimas', 'Cratered Surface', false, 4, 3474, 'Regolith');
INSERT INTO public.moon VALUES (11, 'Triton', 'Nitrogen Geysers', true, 2, 3474, 'Regolith');
INSERT INTO public.moon VALUES (12, 'Charon', 'Water Ice', false, 1, 3474, 'Regolith');
INSERT INTO public.moon VALUES (13, 'Phoebe', 'Dark Surface', false, 6, 3474, 'Regolith');
INSERT INTO public.moon VALUES (14, 'Iapetus', 'Two-Toned Surface', false, 4, 3474, 'Regolith');
INSERT INTO public.moon VALUES (15, 'Oberon', 'Cratered Surface', false, 6, 3474, 'Regolith');
INSERT INTO public.moon VALUES (16, 'Rhea', 'Ice Crust', false, 4, 3474, 'Regolith');
INSERT INTO public.moon VALUES (17, 'Dione', 'Cratered Surface', true, 4, 3474, 'Regolith');
INSERT INTO public.moon VALUES (18, 'Hyperion', 'Spongy Appearance', false, 4, 3474, 'Regolith');
INSERT INTO public.moon VALUES (19, 'Miranda', 'Tectonically Active', false, 5, 3474, 'Regolith');
INSERT INTO public.moon VALUES (20, 'Ariel', 'Young Surface', false, 6, 3474, 'Regolith');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Nitrogen-Oxygen', 9.8, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Carbon Dioxide', 3.7, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Sulfur Dioxide', 8.87, false, 3);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Hydrogen-Helium', 24.79, false, 5);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Hydrogen-Helium', 10.44, false, 4);
INSERT INTO public.planet VALUES (6, 'Neptune', 'Hydrogen-Helium', 11.15, false, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Hydrogen-Helium', 8.69, false, 6);
INSERT INTO public.planet VALUES (8, 'Mercury', 'Thin Atmosphere', 3.7, false, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 'Unknown', 1.62, true, 6);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 'Unknown', 9.81, true, 2);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'Silicate Clouds', 9.9, false, 5);
INSERT INTO public.planet VALUES (12, 'PSR B1257+12 C', 'Unknown', 0.0014, false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5778, false, 1, 5000, 'Orion');
INSERT INTO public.star VALUES (2, 'Betelgeuse', 3500, true, 2, 5000, 'Orion');
INSERT INTO public.star VALUES (3, 'Sirius', 9940, false, 1, 5000, 'Orion');
INSERT INTO public.star VALUES (4, 'Antares', 3400, false, 4, 5000, 'Orion');
INSERT INTO public.star VALUES (5, 'Vega', 9600, false, 1, 5000, 'Orion');
INSERT INTO public.star VALUES (6, 'Alpha Centauri', 5790, false, 1, 5000, 'Orion');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet comet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

