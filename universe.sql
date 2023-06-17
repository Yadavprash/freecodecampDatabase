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
-- Name: dwarf_planets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planets (
    dwarf_planets_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age integer,
    description text
);


ALTER TABLE public.dwarf_planets OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    galaxy_types text,
    age_in_millions_of_years integer NOT NULL,
    distance_from_milkyway_in_million_ly numeric
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
    name character varying(30),
    is_spherical boolean,
    size_in_kilo_of_diameter integer NOT NULL,
    has_water_presence boolean,
    planet_id integer
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
    name character varying(30),
    has_life boolean,
    planet_type text,
    description text,
    distance_from_earth_in_million_km numeric NOT NULL,
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
    name character varying(30),
    description text,
    age_in_million_years numeric NOT NULL,
    star_type text,
    galaxy_id integer
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: dwarf_planets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planets VALUES (1, 'Pluto', 5, 'Highly elliptical orbit, known for its icy composition');
INSERT INTO public.dwarf_planets VALUES (2, 'Iris', 5, 'Largest dwarf planet in our solar system');
INSERT INTO public.dwarf_planets VALUES (3, 'Haumea', 5, 'Dwarf planet located in Kuiper belt');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Whirlpool', 'Spiral', 600, 23.55);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Spiral', 1000, 29.3);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Elliptical', 12000, 13.7);
INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral', 2200, 2.537);
INSERT INTO public.galaxy VALUES (5, 'Milky Way', 'Spiral', 13600, 0);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 'Spiral', 5000, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', true, 3474, false, 1);
INSERT INTO public.moon VALUES (2, 'Titan', true, 5151, true, 5);
INSERT INTO public.moon VALUES (3, 'Ganymede', true, 5268, true, 4);
INSERT INTO public.moon VALUES (4, 'Callisto', true, 4820, true, 4);
INSERT INTO public.moon VALUES (5, 'Europa', true, 3121, true, 4);
INSERT INTO public.moon VALUES (6, 'Enceledus', true, 528, true, 8);
INSERT INTO public.moon VALUES (7, 'Triton', true, 2708, true, 6);
INSERT INTO public.moon VALUES (8, 'Io', true, 3643, false, 4);
INSERT INTO public.moon VALUES (9, 'Phobo', false, 27, false, 2);
INSERT INTO public.moon VALUES (10, 'Demios', false, 15, false, 2);
INSERT INTO public.moon VALUES (11, 'Rhea', true, 1527, true, 5);
INSERT INTO public.moon VALUES (12, 'Tethys', true, 1060, false, 5);
INSERT INTO public.moon VALUES (13, 'Dione', true, 1060, false, 5);
INSERT INTO public.moon VALUES (14, 'Hyperion', false, 266, false, 5);
INSERT INTO public.moon VALUES (15, 'Miranda', false, 471, false, 8);
INSERT INTO public.moon VALUES (16, 'Ariel', true, 1157, false, 8);
INSERT INTO public.moon VALUES (17, 'Oberon', true, 1523, false, 8);
INSERT INTO public.moon VALUES (18, 'Titania', true, 1578, false, 8);
INSERT INTO public.moon VALUES (19, 'Charon', true, 1212, false, NULL);
INSERT INTO public.moon VALUES (21, 'Mimas', false, 396, false, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 'terrestial', 'The third planet from the sun, know for its ecosystem and life', 0, 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 'terrestial', 'The fourth planet from the sun, known for its reddish appearance', 225, 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, 'terrestial', 'The second  planet from the sun,hottest planet in the solar system ', 41, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, 'terrestial', 'Largest planet in the solar system know for its prominent storm called the greate red spot ', 628, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', false, 'Gas-gaint', 'The second largest planet in the solar system known for its distinctive ring system ', 1300, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', false, 'Gas-gaint', 'The eighth and the farthest planet from the sun, known for its blue color', 4300, 1);
INSERT INTO public.planet VALUES (7, 'Mercure', false, 'terrestial', 'The smallest planet in the solar system and the closest planet to the sun', 91, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', false, 'Ice gaint', 'The seventh planet from the sun known for its unique sideways rotation axis', 2700, 1);
INSERT INTO public.planet VALUES (9, 'Kepler 452-b', false, 'Exoplanet', 'An exoplanet located in the habitable zone of its star and has same size as earth might be having life', 1400000000000000, NULL);
INSERT INTO public.planet VALUES (10, 'TRAPPIST 1E', false, 'Exoplanet', 'An exoplanet located in the habitable zone of its star and has same size as earth might be having life', 39000000000000, NULL);
INSERT INTO public.planet VALUES (11, 'Proxima centuari b', false, 'Exoplanet', 'Closest planet to proxima centuari star', 42400000000000, NULL);
INSERT INTO public.planet VALUES (12, 'HD 189733b', false, NULL, NULL, -1, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Star at the centre of solar system', 4600, 'G-type main sequence(yellow dwarf)', 5);
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest star in night sky', 300, 'A-type main sequence', 5);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A red gaint in constellation Orion', 8, 'M-type red-gaint', 5);
INSERT INTO public.star VALUES (4, 'Vega', 'Fifth brightest in the night sky', 455, 'A-type main-sequence', 5);
INSERT INTO public.star VALUES (5, 'Polaris', 'The north star,known for its  use in celestial  navigation', 70, 'F-type yellow super gaint', 5);
INSERT INTO public.star VALUES (6, 'Antares', 'A red supergaint star in constellation scorpius', 12, 'M-type red super gaint', 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: dwarf_planets dwarf_planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planets
    ADD CONSTRAINT dwarf_planets_pkey PRIMARY KEY (dwarf_planets_id);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: dwarf_planets unique_dwarf; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planets
    ADD CONSTRAINT unique_dwarf UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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

