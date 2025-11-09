--
-- PostgreSQL database dump
--

\restrict eoCp3mcD5WGKJLlyc9DYE2MEgMHOn1o7PsEcIm3yNRiDYTfaSDl46aLdPS6cMpU

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities (
    city_id integer CONSTRAINT "Cities_CityID_not_null" NOT NULL,
    region_id integer CONSTRAINT "Cities_RegionID_not_null" NOT NULL,
    city_name text
);


--
-- Name: Cities_CityID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Cities_CityID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Cities_CityID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Cities_CityID_seq" OWNED BY public.cities.city_id;


--
-- Name: Cities_RegionID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Cities_RegionID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Cities_RegionID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Cities_RegionID_seq" OWNED BY public.cities.region_id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.countries (
    country_id integer CONSTRAINT "Countries_CountryID_not_null" NOT NULL,
    country_name text
);


--
-- Name: Countries_CountryID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Countries_CountryID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Countries_CountryID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Countries_CountryID_seq" OWNED BY public.countries.country_id;


--
-- Name: location_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.location_types (
    location_type_id integer CONSTRAINT "LocationTypes_LocationTypeID_not_null" NOT NULL,
    location_type_name text
);


--
-- Name: LocationTypes_LocationTypeID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."LocationTypes_LocationTypeID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: LocationTypes_LocationTypeID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."LocationTypes_LocationTypeID_seq" OWNED BY public.location_types.location_type_id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.locations (
    location_id integer CONSTRAINT "Locations_LocationID_not_null" NOT NULL,
    location_type_id integer CONSTRAINT "Locations_LocationTypeID_not_null" NOT NULL,
    city_id integer CONSTRAINT "Locations_CityID_not_null" NOT NULL,
    location_name text,
    lat real,
    long real
);


--
-- Name: Locations_CityID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Locations_CityID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Locations_CityID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Locations_CityID_seq" OWNED BY public.locations.city_id;


--
-- Name: Locations_LocationID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Locations_LocationID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Locations_LocationID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Locations_LocationID_seq" OWNED BY public.locations.location_id;


--
-- Name: Locations_LocationTypeID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Locations_LocationTypeID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Locations_LocationTypeID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Locations_LocationTypeID_seq" OWNED BY public.locations.location_type_id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.regions (
    region_id integer CONSTRAINT "Regions_RegionID_not_null" NOT NULL,
    country_id integer CONSTRAINT "Regions_CountryID_not_null" NOT NULL,
    region_name text
);


--
-- Name: Regions_CountryID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Regions_CountryID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Regions_CountryID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Regions_CountryID_seq" OWNED BY public.regions.country_id;


--
-- Name: Regions_RegionID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Regions_RegionID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Regions_RegionID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Regions_RegionID_seq" OWNED BY public.regions.region_id;


--
-- Name: user_location_ratings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_location_ratings (
    user_rating_id integer CONSTRAINT "UserLocationRatings_UserRatingID_not_null" NOT NULL,
    location_id integer CONSTRAINT "UserLocationRatings_LocationID_not_null" NOT NULL,
    user_id integer CONSTRAINT "UserLocationRatings_UserID_not_null" NOT NULL,
    beer_rating integer,
    atmosphere_rating integer,
    food_rating integer,
    cocktail_selection_rating integer,
    originality_rating integer,
    outdoor_space integer,
    lilleys bit(1)
);


--
-- Name: UserLocationRatings_LocationID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."UserLocationRatings_LocationID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: UserLocationRatings_LocationID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."UserLocationRatings_LocationID_seq" OWNED BY public.user_location_ratings.location_id;


--
-- Name: UserLocationRatings_UserID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."UserLocationRatings_UserID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: UserLocationRatings_UserID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."UserLocationRatings_UserID_seq" OWNED BY public.user_location_ratings.user_id;


--
-- Name: UserLocationRatings_UserRatingID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."UserLocationRatings_UserRatingID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: UserLocationRatings_UserRatingID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."UserLocationRatings_UserRatingID_seq" OWNED BY public.user_location_ratings.user_rating_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    user_id integer CONSTRAINT "Users_UserID_not_null" NOT NULL,
    name text,
    email text
);


--
-- Name: Users_UserID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Users_UserID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Users_UserID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Users_UserID_seq" OWNED BY public.users.user_id;


--
-- Name: visits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.visits (
    visit_id integer CONSTRAINT "Visits_VisitID_not_null" NOT NULL,
    user_id integer CONSTRAINT "Visits_UserID_not_null" NOT NULL,
    location_id integer CONSTRAINT "Visits_LocationID_not_null" NOT NULL,
    visit_timestamp date
);


--
-- Name: Visits_LocationID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Visits_LocationID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Visits_LocationID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Visits_LocationID_seq" OWNED BY public.visits.location_id;


--
-- Name: Visits_UserID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Visits_UserID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Visits_UserID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Visits_UserID_seq" OWNED BY public.visits.user_id;


--
-- Name: Visits_VisitID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Visits_VisitID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Visits_VisitID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Visits_VisitID_seq" OWNED BY public.visits.visit_id;


--
-- Name: mytable; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mytable (
    id integer NOT NULL,
    type integer NOT NULL,
    name character varying(29) NOT NULL,
    date date NOT NULL,
    beer integer NOT NULL,
    atmosphere integer NOT NULL,
    food integer,
    "Outdoor Space" integer,
    "Cocktail Selection" integer,
    originality integer,
    towncity character varying(20) NOT NULL,
    region character varying(19) NOT NULL,
    country character varying(12) NOT NULL,
    lilleys character varying(12),
    lat numeric(11,8) NOT NULL,
    long numeric(12,9) NOT NULL
);


--
-- Name: mytable_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mytable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mytable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mytable_id_seq OWNED BY public.mytable.id;


--
-- Name: cities city_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities ALTER COLUMN city_id SET DEFAULT nextval('public."Cities_CityID_seq"'::regclass);


--
-- Name: cities region_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities ALTER COLUMN region_id SET DEFAULT nextval('public."Cities_RegionID_seq"'::regclass);


--
-- Name: countries country_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries ALTER COLUMN country_id SET DEFAULT nextval('public."Countries_CountryID_seq"'::regclass);


--
-- Name: location_types location_type_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location_types ALTER COLUMN location_type_id SET DEFAULT nextval('public."LocationTypes_LocationTypeID_seq"'::regclass);


--
-- Name: locations location_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locations ALTER COLUMN location_id SET DEFAULT nextval('public."Locations_LocationID_seq"'::regclass);


--
-- Name: locations location_type_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locations ALTER COLUMN location_type_id SET DEFAULT nextval('public."Locations_LocationTypeID_seq"'::regclass);


--
-- Name: locations city_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locations ALTER COLUMN city_id SET DEFAULT nextval('public."Locations_CityID_seq"'::regclass);


--
-- Name: mytable id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mytable ALTER COLUMN id SET DEFAULT nextval('public.mytable_id_seq'::regclass);


--
-- Name: regions region_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.regions ALTER COLUMN region_id SET DEFAULT nextval('public."Regions_RegionID_seq"'::regclass);


--
-- Name: regions country_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.regions ALTER COLUMN country_id SET DEFAULT nextval('public."Regions_CountryID_seq"'::regclass);


--
-- Name: user_location_ratings user_rating_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_location_ratings ALTER COLUMN user_rating_id SET DEFAULT nextval('public."UserLocationRatings_UserRatingID_seq"'::regclass);


--
-- Name: user_location_ratings location_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_location_ratings ALTER COLUMN location_id SET DEFAULT nextval('public."UserLocationRatings_LocationID_seq"'::regclass);


--
-- Name: user_location_ratings user_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_location_ratings ALTER COLUMN user_id SET DEFAULT nextval('public."UserLocationRatings_UserID_seq"'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public."Users_UserID_seq"'::regclass);


--
-- Name: visits visit_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visits ALTER COLUMN visit_id SET DEFAULT nextval('public."Visits_VisitID_seq"'::regclass);


--
-- Name: visits user_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visits ALTER COLUMN user_id SET DEFAULT nextval('public."Visits_UserID_seq"'::regclass);


--
-- Name: visits location_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visits ALTER COLUMN location_id SET DEFAULT nextval('public."Visits_LocationID_seq"'::regclass);


--
-- Name: cities Cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT "Cities_pkey" PRIMARY KEY (city_id);


--
-- Name: countries Countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT "Countries_pkey" PRIMARY KEY (country_id);


--
-- Name: location_types LocationTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location_types
    ADD CONSTRAINT "LocationTypes_pkey" PRIMARY KEY (location_type_id);


--
-- Name: locations Locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT "Locations_pkey" PRIMARY KEY (location_id);


--
-- Name: regions Regions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT "Regions_pkey" PRIMARY KEY (region_id);


--
-- Name: user_location_ratings UserLocationRatings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_location_ratings
    ADD CONSTRAINT "UserLocationRatings_pkey" PRIMARY KEY (user_rating_id);


--
-- Name: users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (user_id);


--
-- Name: mytable mytable_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mytable
    ADD CONSTRAINT mytable_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict eoCp3mcD5WGKJLlyc9DYE2MEgMHOn1o7PsEcIm3yNRiDYTfaSDl46aLdPS6cMpU

