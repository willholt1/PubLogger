--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9 (Debian 16.9-1.pgdg120+1)
-- Dumped by pg_dump version 16.9 (Debian 16.9-1.pgdg120+1)

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

--
-- Name: get_total_user_visits(integer); Type: FUNCTION; Schema: public; Owner: pubs_user
--

CREATE FUNCTION public.get_total_user_visits(p_user_id integer) RETURNS TABLE(name text, location_name text, location_type_name text, total_visits bigint, lat real, long real, beer_rating integer, atmosphere_rating integer, food_rating integer, cocktail_selection_rating integer, originality_rating integer, outdoor_space integer, lilleys bit)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        u.name
        ,l.location_name
        ,lt.location_type_name
        ,COUNT(visit_timestamp) as total_visits
        ,l.lat
        ,l.long
        ,ulr.beer_rating
        ,ulr.atmosphere_rating
        ,ulr.food_rating
        ,ulr.cocktail_selection_rating
        ,ulr.originality_rating
        ,ulr.outdoor_space
        ,ulr.lilleys
    FROM users u
    INNER JOIN user_location_ratings ulr on ulr.user_id = u.user_id
    INNER JOIN locations l on l.location_id = ulr.location_id
    INNER JOIN location_types lt on lt.location_type_id = l.location_type_id
    INNER JOIN  visits v on v.location_id = l.location_id AND v.user_id = u.user_id
    WHERE u.user_id = p_user_id
    GROUP BY u.name, l.location_name, lt.location_type_name, l.lat, l.long, ulr.beer_rating, ulr.atmosphere_rating, ulr.food_rating, ulr.cocktail_selection_rating, ulr.originality_rating, ulr.outdoor_space, ulr.lilleys
    ORDER BY total_visits DESC;
END;
$$;


ALTER FUNCTION public.get_total_user_visits(p_user_id integer) OWNER TO pubs_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: pubs_user
--

CREATE TABLE public.cities (
    city_id integer NOT NULL,
    region_id integer NOT NULL,
    city_name text
);


ALTER TABLE public.cities OWNER TO pubs_user;

--
-- Name: Cities_CityID_seq; Type: SEQUENCE; Schema: public; Owner: pubs_user
--

CREATE SEQUENCE public."Cities_CityID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Cities_CityID_seq" OWNER TO pubs_user;

--
-- Name: Cities_CityID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubs_user
--

ALTER SEQUENCE public."Cities_CityID_seq" OWNED BY public.cities.city_id;


--
-- Name: Cities_RegionID_seq; Type: SEQUENCE; Schema: public; Owner: pubs_user
--

CREATE SEQUENCE public."Cities_RegionID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Cities_RegionID_seq" OWNER TO pubs_user;

--
-- Name: Cities_RegionID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubs_user
--

ALTER SEQUENCE public."Cities_RegionID_seq" OWNED BY public.cities.region_id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: pubs_user
--

CREATE TABLE public.countries (
    country_id integer NOT NULL,
    country_name text
);


ALTER TABLE public.countries OWNER TO pubs_user;

--
-- Name: Countries_CountryID_seq; Type: SEQUENCE; Schema: public; Owner: pubs_user
--

CREATE SEQUENCE public."Countries_CountryID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Countries_CountryID_seq" OWNER TO pubs_user;

--
-- Name: Countries_CountryID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubs_user
--

ALTER SEQUENCE public."Countries_CountryID_seq" OWNED BY public.countries.country_id;


--
-- Name: location_types; Type: TABLE; Schema: public; Owner: pubs_user
--

CREATE TABLE public.location_types (
    location_type_id integer NOT NULL,
    location_type_name text
);


ALTER TABLE public.location_types OWNER TO pubs_user;

--
-- Name: LocationTypes_LocationTypeID_seq; Type: SEQUENCE; Schema: public; Owner: pubs_user
--

CREATE SEQUENCE public."LocationTypes_LocationTypeID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."LocationTypes_LocationTypeID_seq" OWNER TO pubs_user;

--
-- Name: LocationTypes_LocationTypeID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubs_user
--

ALTER SEQUENCE public."LocationTypes_LocationTypeID_seq" OWNED BY public.location_types.location_type_id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: pubs_user
--

CREATE TABLE public.locations (
    location_id integer NOT NULL,
    location_type_id integer NOT NULL,
    city_id integer NOT NULL,
    location_name text,
    lat real,
    long real
);


ALTER TABLE public.locations OWNER TO pubs_user;

--
-- Name: Locations_CityID_seq; Type: SEQUENCE; Schema: public; Owner: pubs_user
--

CREATE SEQUENCE public."Locations_CityID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Locations_CityID_seq" OWNER TO pubs_user;

--
-- Name: Locations_CityID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubs_user
--

ALTER SEQUENCE public."Locations_CityID_seq" OWNED BY public.locations.city_id;


--
-- Name: Locations_LocationID_seq; Type: SEQUENCE; Schema: public; Owner: pubs_user
--

CREATE SEQUENCE public."Locations_LocationID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Locations_LocationID_seq" OWNER TO pubs_user;

--
-- Name: Locations_LocationID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubs_user
--

ALTER SEQUENCE public."Locations_LocationID_seq" OWNED BY public.locations.location_id;


--
-- Name: Locations_LocationTypeID_seq; Type: SEQUENCE; Schema: public; Owner: pubs_user
--

CREATE SEQUENCE public."Locations_LocationTypeID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Locations_LocationTypeID_seq" OWNER TO pubs_user;

--
-- Name: Locations_LocationTypeID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubs_user
--

ALTER SEQUENCE public."Locations_LocationTypeID_seq" OWNED BY public.locations.location_type_id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: pubs_user
--

CREATE TABLE public.regions (
    region_id integer NOT NULL,
    country_id integer NOT NULL,
    region_name text
);


ALTER TABLE public.regions OWNER TO pubs_user;

--
-- Name: Regions_CountryID_seq; Type: SEQUENCE; Schema: public; Owner: pubs_user
--

CREATE SEQUENCE public."Regions_CountryID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Regions_CountryID_seq" OWNER TO pubs_user;

--
-- Name: Regions_CountryID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubs_user
--

ALTER SEQUENCE public."Regions_CountryID_seq" OWNED BY public.regions.country_id;


--
-- Name: Regions_RegionID_seq; Type: SEQUENCE; Schema: public; Owner: pubs_user
--

CREATE SEQUENCE public."Regions_RegionID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Regions_RegionID_seq" OWNER TO pubs_user;

--
-- Name: Regions_RegionID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubs_user
--

ALTER SEQUENCE public."Regions_RegionID_seq" OWNED BY public.regions.region_id;


--
-- Name: user_location_ratings; Type: TABLE; Schema: public; Owner: pubs_user
--

CREATE TABLE public.user_location_ratings (
    user_rating_id integer NOT NULL,
    location_id integer NOT NULL,
    user_id integer NOT NULL,
    beer_rating integer,
    atmosphere_rating integer,
    food_rating integer,
    cocktail_selection_rating integer,
    originality_rating integer,
    outdoor_space integer,
    lilleys bit(1)
);


ALTER TABLE public.user_location_ratings OWNER TO pubs_user;

--
-- Name: UserLocationRatings_LocationID_seq; Type: SEQUENCE; Schema: public; Owner: pubs_user
--

CREATE SEQUENCE public."UserLocationRatings_LocationID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."UserLocationRatings_LocationID_seq" OWNER TO pubs_user;

--
-- Name: UserLocationRatings_LocationID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubs_user
--

ALTER SEQUENCE public."UserLocationRatings_LocationID_seq" OWNED BY public.user_location_ratings.location_id;


--
-- Name: UserLocationRatings_UserID_seq; Type: SEQUENCE; Schema: public; Owner: pubs_user
--

CREATE SEQUENCE public."UserLocationRatings_UserID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."UserLocationRatings_UserID_seq" OWNER TO pubs_user;

--
-- Name: UserLocationRatings_UserID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubs_user
--

ALTER SEQUENCE public."UserLocationRatings_UserID_seq" OWNED BY public.user_location_ratings.user_id;


--
-- Name: UserLocationRatings_UserRatingID_seq; Type: SEQUENCE; Schema: public; Owner: pubs_user
--

CREATE SEQUENCE public."UserLocationRatings_UserRatingID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."UserLocationRatings_UserRatingID_seq" OWNER TO pubs_user;

--
-- Name: UserLocationRatings_UserRatingID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubs_user
--

ALTER SEQUENCE public."UserLocationRatings_UserRatingID_seq" OWNED BY public.user_location_ratings.user_rating_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: pubs_user
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name text,
    email text
);


ALTER TABLE public.users OWNER TO pubs_user;

--
-- Name: Users_UserID_seq; Type: SEQUENCE; Schema: public; Owner: pubs_user
--

CREATE SEQUENCE public."Users_UserID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Users_UserID_seq" OWNER TO pubs_user;

--
-- Name: Users_UserID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubs_user
--

ALTER SEQUENCE public."Users_UserID_seq" OWNED BY public.users.user_id;


--
-- Name: visits; Type: TABLE; Schema: public; Owner: pubs_user
--

CREATE TABLE public.visits (
    visit_id integer NOT NULL,
    user_id integer NOT NULL,
    location_id integer NOT NULL,
    visit_timestamp date
);


ALTER TABLE public.visits OWNER TO pubs_user;

--
-- Name: Visits_LocationID_seq; Type: SEQUENCE; Schema: public; Owner: pubs_user
--

CREATE SEQUENCE public."Visits_LocationID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Visits_LocationID_seq" OWNER TO pubs_user;

--
-- Name: Visits_LocationID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubs_user
--

ALTER SEQUENCE public."Visits_LocationID_seq" OWNED BY public.visits.location_id;


--
-- Name: Visits_UserID_seq; Type: SEQUENCE; Schema: public; Owner: pubs_user
--

CREATE SEQUENCE public."Visits_UserID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Visits_UserID_seq" OWNER TO pubs_user;

--
-- Name: Visits_UserID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubs_user
--

ALTER SEQUENCE public."Visits_UserID_seq" OWNED BY public.visits.user_id;


--
-- Name: Visits_VisitID_seq; Type: SEQUENCE; Schema: public; Owner: pubs_user
--

CREATE SEQUENCE public."Visits_VisitID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Visits_VisitID_seq" OWNER TO pubs_user;

--
-- Name: Visits_VisitID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubs_user
--

ALTER SEQUENCE public."Visits_VisitID_seq" OWNED BY public.visits.visit_id;


--
-- Name: cities city_id; Type: DEFAULT; Schema: public; Owner: pubs_user
--

ALTER TABLE ONLY public.cities ALTER COLUMN city_id SET DEFAULT nextval('public."Cities_CityID_seq"'::regclass);


--
-- Name: cities region_id; Type: DEFAULT; Schema: public; Owner: pubs_user
--

ALTER TABLE ONLY public.cities ALTER COLUMN region_id SET DEFAULT nextval('public."Cities_RegionID_seq"'::regclass);


--
-- Name: countries country_id; Type: DEFAULT; Schema: public; Owner: pubs_user
--

ALTER TABLE ONLY public.countries ALTER COLUMN country_id SET DEFAULT nextval('public."Countries_CountryID_seq"'::regclass);


--
-- Name: location_types location_type_id; Type: DEFAULT; Schema: public; Owner: pubs_user
--

ALTER TABLE ONLY public.location_types ALTER COLUMN location_type_id SET DEFAULT nextval('public."LocationTypes_LocationTypeID_seq"'::regclass);


--
-- Name: locations location_id; Type: DEFAULT; Schema: public; Owner: pubs_user
--

ALTER TABLE ONLY public.locations ALTER COLUMN location_id SET DEFAULT nextval('public."Locations_LocationID_seq"'::regclass);


--
-- Name: locations location_type_id; Type: DEFAULT; Schema: public; Owner: pubs_user
--

ALTER TABLE ONLY public.locations ALTER COLUMN location_type_id SET DEFAULT nextval('public."Locations_LocationTypeID_seq"'::regclass);


--
-- Name: locations city_id; Type: DEFAULT; Schema: public; Owner: pubs_user
--

ALTER TABLE ONLY public.locations ALTER COLUMN city_id SET DEFAULT nextval('public."Locations_CityID_seq"'::regclass);


--
-- Name: regions region_id; Type: DEFAULT; Schema: public; Owner: pubs_user
--

ALTER TABLE ONLY public.regions ALTER COLUMN region_id SET DEFAULT nextval('public."Regions_RegionID_seq"'::regclass);


--
-- Name: regions country_id; Type: DEFAULT; Schema: public; Owner: pubs_user
--

ALTER TABLE ONLY public.regions ALTER COLUMN country_id SET DEFAULT nextval('public."Regions_CountryID_seq"'::regclass);


--
-- Name: user_location_ratings user_rating_id; Type: DEFAULT; Schema: public; Owner: pubs_user
--

ALTER TABLE ONLY public.user_location_ratings ALTER COLUMN user_rating_id SET DEFAULT nextval('public."UserLocationRatings_UserRatingID_seq"'::regclass);


--
-- Name: user_location_ratings location_id; Type: DEFAULT; Schema: public; Owner: pubs_user
--

ALTER TABLE ONLY public.user_location_ratings ALTER COLUMN location_id SET DEFAULT nextval('public."UserLocationRatings_LocationID_seq"'::regclass);


--
-- Name: user_location_ratings user_id; Type: DEFAULT; Schema: public; Owner: pubs_user
--

ALTER TABLE ONLY public.user_location_ratings ALTER COLUMN user_id SET DEFAULT nextval('public."UserLocationRatings_UserID_seq"'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: pubs_user
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public."Users_UserID_seq"'::regclass);


--
-- Name: visits visit_id; Type: DEFAULT; Schema: public; Owner: pubs_user
--

ALTER TABLE ONLY public.visits ALTER COLUMN visit_id SET DEFAULT nextval('public."Visits_VisitID_seq"'::regclass);


--
-- Name: visits user_id; Type: DEFAULT; Schema: public; Owner: pubs_user
--

ALTER TABLE ONLY public.visits ALTER COLUMN user_id SET DEFAULT nextval('public."Visits_UserID_seq"'::regclass);


--
-- Name: visits location_id; Type: DEFAULT; Schema: public; Owner: pubs_user
--

ALTER TABLE ONLY public.visits ALTER COLUMN location_id SET DEFAULT nextval('public."Visits_LocationID_seq"'::regclass);


--
-- PostgreSQL database dump complete
--

