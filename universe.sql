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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character(20),
    radius_as_ly numeric(9,2),
    distance_from_earth_as_ly numeric(25,2)
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
    planet_id integer,
    name character varying(30) NOT NULL,
    radius_as_km integer,
    distance_from_host_planet_as_mm numeric(25,2)
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
-- Name: more_star_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_star_info (
    name character varying(30) NOT NULL,
    more_star_info_id integer NOT NULL,
    star_id integer NOT NULL,
    will_form_blackhole boolean,
    has_more_mass_than_average boolean,
    age_as_megayear integer,
    trivia text
);


ALTER TABLE public.more_star_info OWNER TO freecodecamp;

--
-- Name: more_star_info_more_star_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_star_info_more_star_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_star_info_more_star_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_star_info_more_star_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_star_info_more_star_info_id_seq OWNED BY public.more_star_info.more_star_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(30) NOT NULL,
    planet_type character(20),
    radius_as_mm numeric(9,2),
    distance_from_star_as_mm numeric(25,2),
    earth_mass numeric(25,2)
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
    galaxy_id integer,
    name character varying(30) NOT NULL,
    star_type character(20),
    radius_as_gm numeric(9,2),
    distance_from_earth_as_ly numeric(25,2),
    solar_mass numeric(4,2)
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
-- Name: more_star_info more_star_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_star_info ALTER COLUMN more_star_info_id SET DEFAULT nextval('public.more_star_info_more_star_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral       ', 52850.00, 0.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Barred Spiral       ', 76000.00, 2537000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Barred Spiral       ', 61100.00, 2730000.00);
INSERT INTO public.galaxy VALUES (4, 'Cigar', 'Starburst           ', 18500.00, 12000000.00);
INSERT INTO public.galaxy VALUES (5, 'Comet', 'Spiral              ', 300000.00, 3200000000.00);
INSERT INTO public.galaxy VALUES (6, 'Fried_Egg', 'Spiral              ', 18000.00, 72000000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 1737, 384.40);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 11, 6.00);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 6, 23.46);
INSERT INTO public.moon VALUES (4, 5, 'Ganymede', 2634, 1070.00);
INSERT INTO public.moon VALUES (5, 5, 'Callisto', 2410, 1883.00);
INSERT INTO public.moon VALUES (6, 5, 'Io', 1821, 422.00);
INSERT INTO public.moon VALUES (7, 5, 'Europa', 1560, 671.00);
INSERT INTO public.moon VALUES (8, 6, 'Titan', 2574, 1200.00);
INSERT INTO public.moon VALUES (9, 6, 'Enceladus', 252, 238.00);
INSERT INTO public.moon VALUES (10, 6, 'Hyperion', 135, 1500.00);
INSERT INTO public.moon VALUES (11, 6, 'Prometheus', 43, 139.00);
INSERT INTO public.moon VALUES (12, 6, 'Pandora', 40, 142.00);
INSERT INTO public.moon VALUES (13, 6, 'Janus', 89, 151.00);
INSERT INTO public.moon VALUES (14, 6, 'Epimetheus', 119, 151.00);
INSERT INTO public.moon VALUES (15, 6, 'Mimas', 198, 186.00);
INSERT INTO public.moon VALUES (16, 6, 'Iapetus', 734, 3561.00);
INSERT INTO public.moon VALUES (17, 6, 'Phoebe', 106, 12952.00);
INSERT INTO public.moon VALUES (18, 6, 'Tethys', 531, 295.00);
INSERT INTO public.moon VALUES (19, 7, 'Miranda', 235, 129.80);
INSERT INTO public.moon VALUES (20, 7, 'Ariel', 578, 190.90);
INSERT INTO public.moon VALUES (21, 7, 'Umbriel', 584, 266.00);
INSERT INTO public.moon VALUES (22, 8, 'Triton', 1353, 354.80);


--
-- Data for Name: more_star_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_star_info VALUES ('Sol', 1, 1, false, true, 4603, 'The Sun takes 25 Earth days to complete one rotation at its equator.');
INSERT INTO public.more_star_info VALUES ('Proxima_Centauri', 2, 2, false, false, 4850, 'Second closest star to earth');
INSERT INTO public.more_star_info VALUES ('Barnard_s_Star', 3, 3, false, false, 10010, 'Has a potential exoplanet');
INSERT INTO public.more_star_info VALUES ('Zeta_Ophiuchi', 4, 4, true, true, 3, 'It has likely already exploded');
INSERT INTO public.more_star_info VALUES ('Sirius_A', 5, 5, false, true, 230, 'The brightest star we can see in the sky');
INSERT INTO public.more_star_info VALUES ('Mirach', 6, 6, false, true, NULL, 'Brightest star of Andromeda Constellation');
INSERT INTO public.more_star_info VALUES ('Tau_Ceti', 7, 7, false, true, 10000, 'Second closest planetary system to Earth');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Terrestrial         ', 2.43, 69800.00, 0.05);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'Terrestrial         ', 6.05, 107476.00, 0.81);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'Terrestrial         ', 6.37, 149000.00, 1.00);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'Terrestrial         ', 3.38, 227000.00, 0.10);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'Gas_Giant           ', 69.91, 778000.00, 317.80);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 'Gas_Giant           ', 58.23, 1430000.00, 95.16);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'Ice_Giant           ', 25.36, 2900000.00, 14.53);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 'Ice_Giant           ', 24.62, 4500000.00, 17.00);
INSERT INTO public.planet VALUES (9, 2, 'Proxima_Centauri_b', 'Terrestrial         ', 6.37, 7264.00, 1.07);
INSERT INTO public.planet VALUES (10, 2, 'Proxima_Centauri_d', 'Terrestrial         ', 5.16, 4300.00, 0.26);
INSERT INTO public.planet VALUES (12, 7, 'Tau_Ceti_f', 'Terrestrial         ', 11.52, 201957.00, 3.93);
INSERT INTO public.planet VALUES (11, 7, 'Tau_Ceti_b', 'Terrestrial         ', NULL, NULL, 2.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol', 'G-Type              ', 0.69, 0.01, 1.00);
INSERT INTO public.star VALUES (2, 1, 'Proxima_Centauri', 'M-Type              ', 0.10, 4.25, 0.12);
INSERT INTO public.star VALUES (3, 1, 'Barnard_s_Star', 'M-Type              ', 0.13, 5.98, 0.16);
INSERT INTO public.star VALUES (4, 1, 'Zeta_Ophiuchi', 'O-Type              ', 5.91, 440.00, 20.20);
INSERT INTO public.star VALUES (5, 1, 'Sirius_A', 'A-Type              ', 1.19, 8.60, 2.30);
INSERT INTO public.star VALUES (6, 1, 'Mirach', 'M-Type              ', 69.57, 199.00, 2.49);
INSERT INTO public.star VALUES (7, 1, 'Tau Ceti', 'G-Type              ', 0.50, 11.90, 0.78);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: more_star_info_more_star_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_star_info_more_star_info_id_seq', 7, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: more_star_info more_star_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_star_info
    ADD CONSTRAINT more_star_info_name_key UNIQUE (name);


--
-- Name: more_star_info more_star_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_star_info
    ADD CONSTRAINT more_star_info_pkey PRIMARY KEY (more_star_info_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: more_star_info more_star_info_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_star_info
    ADD CONSTRAINT more_star_info_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

