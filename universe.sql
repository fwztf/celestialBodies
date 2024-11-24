--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    orbital_period_in_years_exp5 numeric,
    mass_in_kg_exp13 numeric,
    diameter_in_km_exp2 numeric,
    star_id integer NOT NULL
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
    year_discovered text,
    mass_in_kg_exp40 integer NOT NULL,
    diameter_in_km_exp16 integer NOT NULL,
    light_years_from_earth_exp6 numeric,
    age_in_years_exp6 numeric,
    has_life boolean
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
    age_in_years_exp5 numeric,
    mass_in_kg_exp21 numeric,
    diameter_in_km_exp6 numeric,
    has_water boolean,
    planet_id integer NOT NULL
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
    age_in_years_exp6 numeric,
    mass_in_kg_exp24 numeric,
    diameter_in_km_exp7 numeric,
    has_life boolean,
    star_id integer NOT NULL
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
    year_discovered text NOT NULL,
    mass_in_kg_exp30 numeric,
    diameter_in_km_exp8 numeric,
    age_in_years_exp6 numeric,
    galaxy_id integer NOT NULL
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

INSERT INTO public.comet VALUES (1, 'Halley', 0.00075, 22, 0.11, 1);
INSERT INTO public.comet VALUES (2, 'Betel-Comet A', 0.003, 4.5, 0.08, 2);
INSERT INTO public.comet VALUES (3, 'Alpha-Comet B', 0.005, 60, 0.15, 3);
INSERT INTO public.comet VALUES (4, 'R136-Comet C', 0.012, 33, 0.12, 4);
INSERT INTO public.comet VALUES (5, 'Tucanae-Comet D', 0.008, 1.8, 0.07, 5);
INSERT INTO public.comet VALUES (6, 'Core-Comet E', 0.025, 50, 0.18, 6);
INSERT INTO public.comet VALUES (7, 'Halo-Comet F', 0.004, 27, 0.1, 7);
INSERT INTO public.comet VALUES (8, 'Core-Comet G', 0.018, 4.9, 0.09, 8);
INSERT INTO public.comet VALUES (9, 'Star-Comet H', 0.022, 38, 0.14, 9);
INSERT INTO public.comet VALUES (10, 'Star-Comet I', 0.03, 6.5, 0.13, 10);
INSERT INTO public.comet VALUES (11, 'Ring-Comet J', 0.015, 24, 0.11, 11);
INSERT INTO public.comet VALUES (12, 'Star-Comet K', 0.028, 57, 0.16, 12);
INSERT INTO public.comet VALUES (13, 'Cluster-Comet L', 0.045, 83, 0.2, 13);
INSERT INTO public.comet VALUES (14, 'Core-Comet M', 0.036, 32, 0.13, 14);
INSERT INTO public.comet VALUES (15, 'Core-Comet N', 0.05, 100, 0.25, 15);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Prehistoric', 150, 105, 0, 0.0136, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', '964 AD', 120, 220, 2.537, 0.01, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', '1764', 5, 60, 3, 0.012, false);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Prehistoric', 17, 14, 0.163, 0.013, false);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Prehistoric', 3, 7, 0.2, 0.013, false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', '1773', 1, 110, 23, 0.01, false);
INSERT INTO public.galaxy VALUES (7, 'Sombrero Galaxy', '1781', 80, 90, 31, 0.013, false);
INSERT INTO public.galaxy VALUES (8, 'Pinwheel Galaxy', '1781', 57, 170, 21, 0.0132, false);
INSERT INTO public.galaxy VALUES (9, 'Black Eye Galaxy', '1779', 64, 92, 17, 0.0122, false);
INSERT INTO public.galaxy VALUES (10, 'Tadpole Galaxy', '2001', 11, 39, 420, 0.013, false);
INSERT INTO public.galaxy VALUES (11, 'Cartwheel Galaxy', '1941', 85, 150, 500, 0.0127, false);
INSERT INTO public.galaxy VALUES (12, 'Centaurus A', '1826', 110, 11, 13, 0.012, false);
INSERT INTO public.galaxy VALUES (13, 'Messier 87', '1781', 660, 450, 53, 0.0137, false);
INSERT INTO public.galaxy VALUES (14, 'Hercules A', '1985', 490, 200, 2000, 0.012, false);
INSERT INTO public.galaxy VALUES (15, 'IC 1101', '1790', 1200, 600, 1000, 0.0126, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 0.045, 73.5, 0.003474, true, 1);
INSERT INTO public.moon VALUES (2, 'Betel-Moon 1', 0.00015, 5.12, 0.0012, false, 2);
INSERT INTO public.moon VALUES (3, 'Betel-Moon 2', 0.00012, 3.67, 0.00095, false, 2);
INSERT INTO public.moon VALUES (4, 'Alpha-Moon 1', 0.0003, 4.23, 0.0015, false, 3);
INSERT INTO public.moon VALUES (5, 'Alpha-Moon 2', 0.00028, 2.75, 0.0011, false, 3);
INSERT INTO public.moon VALUES (6, 'R136-Moon 1', 0.00009, 3.12, 0.0012, false, 4);
INSERT INTO public.moon VALUES (7, 'R136-Moon 2', 0.00007, 2.9, 0.0009, false, 4);
INSERT INTO public.moon VALUES (8, 'Tucanae-Moon 1', 0.048, 2.85, 0.0011, false, 5);
INSERT INTO public.moon VALUES (9, 'Tucanae-Moon 2', 0.046, 1.9, 0.00095, false, 5);
INSERT INTO public.moon VALUES (10, 'Core-Moon 1', 0.075, 3.76, 0.0012, false, 6);
INSERT INTO public.moon VALUES (11, 'Core-Moon 2', 0.074, 2.81, 0.001, false, 6);
INSERT INTO public.moon VALUES (12, 'Halo-Moon 1', 0.011, 4.9, 0.0013, false, 7);
INSERT INTO public.moon VALUES (13, 'Halo-Moon 2', 0.0105, 3.25, 0.001, false, 7);
INSERT INTO public.moon VALUES (14, 'Core-Moon 1', 0.024, 5.01, 0.0011, false, 8);
INSERT INTO public.moon VALUES (15, 'Core-Moon 2', 0.0235, 3.89, 0.0009, false, 8);
INSERT INTO public.moon VALUES (16, 'Star-Moon 1', 0.058, 4.22, 0.0011, false, 9);
INSERT INTO public.moon VALUES (17, 'Star-Moon 2', 0.056, 2.78, 0.00095, false, 9);
INSERT INTO public.moon VALUES (18, 'Star-Moon 1', 0.035, 2.88, 0.001, false, 10);
INSERT INTO public.moon VALUES (19, 'Star-Moon 2', 0.032, 2.31, 0.00085, false, 10);
INSERT INTO public.moon VALUES (20, 'Ring-Moon 1', 0.041, 3.56, 0.0011, false, 11);
INSERT INTO public.moon VALUES (21, 'Ring-Moon 2', 0.039, 2.47, 0.0009, false, 11);
INSERT INTO public.moon VALUES (22, 'Star-Moon 1', 0.072, 3.42, 0.00115, false, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 0.00454, 5.97, 0.00012742, true, 1);
INSERT INTO public.planet VALUES (2, 'Betel-1b', 0.000002, 0.00125, 0.015, false, 2);
INSERT INTO public.planet VALUES (3, 'Alpha-T1c', 0.000005, 0.0213, 0.011, false, 3);
INSERT INTO public.planet VALUES (4, 'R136-1d', 0.000001, 0.0398, 0.014, false, 4);
INSERT INTO public.planet VALUES (5, 'Tucanae-2e', 0.005, 0.628, 0.009, false, 5);
INSERT INTO public.planet VALUES (6, 'Core-3f', 0.008, 0.0912, 0.01, false, 6);
INSERT INTO public.planet VALUES (7, 'Halo-4g', 0.0012, 0.476, 0.0075, false, 7);
INSERT INTO public.planet VALUES (8, 'Core-5h', 0.0025, 0.0845, 0.013, false, 8);
INSERT INTO public.planet VALUES (9, 'Star-6i', 0.006, 0.0522, 0.0105, false, 9);
INSERT INTO public.planet VALUES (10, 'Star-7j', 0.0039, 0.367, 0.0088, false, 10);
INSERT INTO public.planet VALUES (11, 'Ring-8k', 0.0042, 0.0182, 0.0095, false, 11);
INSERT INTO public.planet VALUES (12, 'Star-9l', 0.0075, 0.756, 0.0098, false, 12);
INSERT INTO public.planet VALUES (13, 'Cluster-10m', 0.009, 0.0238, 0.012, false, 13);
INSERT INTO public.planet VALUES (14, 'Core-11n', 0.0088, 0.0612, 0.0125, false, 14);
INSERT INTO public.planet VALUES (15, 'Core-12o', 0.013, 0.00324, 0.015, false, 15);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Ancient Times', 1.989, 0.01391, 0.0046, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', '1800', 20, 0.00865, 0.002, 2);
INSERT INTO public.star VALUES (3, 'Alpha Triangulum', '1922', 3.5, 0.01121, 0.005, 3);
INSERT INTO public.star VALUES (4, 'R136a1', '1985', 35, 0.015, 0.002, 4);
INSERT INTO public.star VALUES (5, '47 Tucanae', '1752', 4.7, 0.009, 0.013, 5);
INSERT INTO public.star VALUES (6, 'NGC 5194 Core', '1845', 6.5, 0.02, 0.01, 6);
INSERT INTO public.star VALUES (7, 'Halo Star 1', '1970', 1.8, 0.013, 0.0055, 7);
INSERT INTO public.star VALUES (8, 'NGC 5457 Core', '1781', 4.5, 0.018, 0.0102, 8);
INSERT INTO public.star VALUES (9, 'NGC 4826 Star 1', '1779', 3.8, 0.014, 0.0093, 9);
INSERT INTO public.star VALUES (10, 'NGC 10214 Star 1', '1958', 2.1, 0.01, 0.0039, 10);
INSERT INTO public.star VALUES (11, 'Ring Star 1', '1941', 6.2, 0.025, 0.01, 11);
INSERT INTO public.star VALUES (12, 'NGC 5128 Star 1', '1826', 3.4, 0.016, 0.0075, 12);
INSERT INTO public.star VALUES (13, 'M87 Cluster Star', '1781', 5.5, 0.024, 0.01, 13);
INSERT INTO public.star VALUES (14, 'Hercules Core', '1935', 4.2, 0.017, 0.0088, 14);
INSERT INTO public.star VALUES (15, 'IC 1101 Core', '1931', 8.5, 0.035, 0.0013, 15);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 15, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 15, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


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
-- Name: planet planet_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_key UNIQUE (star_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: moon unique_age_in_years; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_age_in_years UNIQUE (age_in_years_exp5);


--
-- Name: comet unique_orbital_period; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT unique_orbital_period UNIQUE (orbital_period_in_years_exp5);


--
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

