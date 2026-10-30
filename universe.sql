--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(40) NOT NULL,
    abbreviation character varying(3) NOT NULL,
    hemisphere character varying(10) NOT NULL,
    area_in_square_degrees integer,
    description text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,3),
    description text,
    has_life boolean NOT NULL
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
    name character varying(40) NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km integer NOT NULL,
    discovered_year integer,
    is_spherical boolean NOT NULL,
    has_atmosphere boolean NOT NULL,
    description text
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
    name character varying(40) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(30) NOT NULL,
    diameter_in_km integer,
    orbital_period_in_days numeric(10,2),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description text
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
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    mass_in_solar_masses numeric(8,3),
    has_planets boolean NOT NULL,
    description text
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'Ori', 'Northern', 594, 'Constellation containing a famous belt of three stars');
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'UMa', 'Northern', 1280, 'Constellation containing the Big Dipper');
INSERT INTO public.constellation VALUES (3, 'Cassiopeia', 'Cas', 'Northern', 598, 'W-shaped constellation');
INSERT INTO public.constellation VALUES (4, 'Crux', 'Cru', 'Southern', 68, 'Smallest constellation, also called the Southern Cross');
INSERT INTO public.constellation VALUES (5, 'Lyra', 'Lyr', 'Northern', 286, 'Small constellation containing the star Vega');
INSERT INTO public.constellation VALUES (6, 'Scorpius', 'Sco', 'Southern', 497, 'Zodiac constellation shaped like a scorpion');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 13600, 0.000, 'Home galaxy of the Sun and Earth', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Barred Spiral', 10000, 2.537, 'Nearest large galaxy to the Milky Way', false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 10000, 2.730, 'Third largest galaxy of the Local Group', false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', NULL, 23.000, 'Interacting spiral galaxy in Canes Venatici', false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', NULL, 29.300, 'Galaxy with a bright nucleus and a large central bulge', false);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 13000, 0.163, 'Satellite galaxy of the Milky Way', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, NULL, true, false, 'The only natural satellite of Earth');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 1877, false, false, 'Larger and closer moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 1877, false, false, 'Smaller and outer moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 1610, true, true, 'Most volcanically active body in the Solar System');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 1610, true, false, 'Icy moon with a subsurface ocean');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 1610, true, false, 'Largest moon in the Solar System');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 1610, true, false, 'Heavily cratered moon of Jupiter');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 167, 1892, false, false, 'Small irregular inner moon of Jupiter');
INSERT INTO public.moon VALUES (9, 'Mimas', 6, 396, 1789, true, false, 'Moon of Saturn with a very large crater');
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 504, 1789, true, false, 'Moon of Saturn with ice geysers');
INSERT INTO public.moon VALUES (11, 'Tethys', 6, 1062, 1684, true, false, 'Icy moon of Saturn');
INSERT INTO public.moon VALUES (12, 'Dione', 6, 1123, 1684, true, false, 'Icy moon of Saturn');
INSERT INTO public.moon VALUES (13, 'Rhea', 6, 1527, 1672, true, false, 'Second largest moon of Saturn');
INSERT INTO public.moon VALUES (14, 'Titan', 6, 5150, 1655, true, true, 'Largest moon of Saturn with a thick atmosphere');
INSERT INTO public.moon VALUES (15, 'Iapetus', 6, 1469, 1671, true, false, 'Moon of Saturn with two different colored sides');
INSERT INTO public.moon VALUES (16, 'Miranda', 7, 472, 1948, true, false, 'Smallest of the five major moons of Uranus');
INSERT INTO public.moon VALUES (17, 'Ariel', 7, 1158, 1851, true, false, 'Bright moon of Uranus');
INSERT INTO public.moon VALUES (18, 'Umbriel', 7, 1169, 1851, true, false, 'Dark moon of Uranus');
INSERT INTO public.moon VALUES (19, 'Titania', 7, 1577, 1787, true, false, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (20, 'Oberon', 7, 1523, 1787, true, false, 'Outermost major moon of Uranus');
INSERT INTO public.moon VALUES (21, 'Triton', 8, 2707, 1846, true, true, 'Largest moon of Neptune with a retrograde orbit');
INSERT INTO public.moon VALUES (22, 'Proteus', 8, 420, 1989, false, false, 'Second largest moon of Neptune');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 4879, 87.97, false, true, 'Smallest planet and closest to the Sun');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 12104, 224.70, false, true, 'Hottest planet with a thick atmosphere');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 12742, 365.26, true, true, 'The only known planet with life');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 6779, 686.98, false, true, 'The red planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas giant', 139820, 4332.59, false, true, 'Largest planet in the Solar System');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas giant', 116460, 10759.22, false, true, 'Known for its large ring system');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice giant', 50724, 30688.50, false, true, 'Ice giant that rotates on its side');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice giant', 49244, 60182.00, false, true, 'Farthest known major planet from the Sun');
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, 'Terrestrial exoplanet', NULL, 11.19, false, true, 'Planet in the habitable zone of Proxima Centauri');
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 3, 'Terrestrial exoplanet', 11720, 6.10, false, true, 'Earth-sized planet in the habitable zone of TRAPPIST-1');
INSERT INTO public.planet VALUES (11, '51 Pegasi b', 4, 'Hot Jupiter', NULL, 4.23, false, true, 'First exoplanet found around a Sun-like star');
INSERT INTO public.planet VALUES (12, 'Kepler-22b', 5, 'Super-Earth', 30500, 289.86, false, true, 'Exoplanet in the habitable zone of Kepler-22');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type main sequence', 4600, 1.000, true, 'The star at the center of the Solar System');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'Red dwarf', 4850, 0.122, true, 'Closest known star to the Sun');
INSERT INTO public.star VALUES (3, 'TRAPPIST-1', 1, 'Ultra-cool red dwarf', 7600, 0.089, true, 'Red dwarf with seven known Earth-sized planets');
INSERT INTO public.star VALUES (4, '51 Pegasi', 1, 'G-type main sequence', 4800, 1.110, true, 'First Sun-like star found with an exoplanet');
INSERT INTO public.star VALUES (5, 'Kepler-22', 1, 'G-type main sequence', 4000, 0.970, true, 'Sun-like star in the constellation Cygnus');
INSERT INTO public.star VALUES (6, 'R136a1', 6, 'Wolf-Rayet', 1, 196.000, false, 'One of the most massive known stars');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_abbreviation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_abbreviation_key UNIQUE (abbreviation);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

