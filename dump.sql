--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: about_dashboard_translations; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE about_dashboard_translations (
    id integer NOT NULL,
    about_dashboard_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    describe text,
    adress text
);


ALTER TABLE public.about_dashboard_translations OWNER TO pronto_films;

--
-- Name: about_dashboard_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE about_dashboard_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.about_dashboard_translations_id_seq OWNER TO pronto_films;

--
-- Name: about_dashboard_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE about_dashboard_translations_id_seq OWNED BY about_dashboard_translations.id;


--
-- Name: about_dashboards; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE about_dashboards (
    id integer NOT NULL,
    describe text,
    adress text,
    enquiries character varying,
    bidding character varying,
    facebook character varying,
    vimeo character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.about_dashboards OWNER TO pronto_films;

--
-- Name: about_dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE about_dashboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.about_dashboards_id_seq OWNER TO pronto_films;

--
-- Name: about_dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE about_dashboards_id_seq OWNED BY about_dashboards.id;


--
-- Name: about_translations; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE about_translations (
    id integer NOT NULL,
    about_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    first_name character varying,
    last_name character varying,
    "position" character varying,
    describe text,
    picture_name character varying
);


ALTER TABLE public.about_translations OWNER TO pronto_films;

--
-- Name: about_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE about_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.about_translations_id_seq OWNER TO pronto_films;

--
-- Name: about_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE about_translations_id_seq OWNED BY about_translations.id;


--
-- Name: abouts; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE abouts (
    id integer NOT NULL,
    picture character varying,
    first_name character varying,
    last_name character varying,
    email character varying,
    describe text,
    "position" character varying,
    index integer DEFAULT 0,
    show boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    picture_name character varying
);


ALTER TABLE public.abouts OWNER TO pronto_films;

--
-- Name: abouts_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE abouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abouts_id_seq OWNER TO pronto_films;

--
-- Name: abouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE abouts_id_seq OWNED BY abouts.id;


--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE active_admin_comments (
    id integer NOT NULL,
    namespace character varying,
    body text,
    resource_id character varying NOT NULL,
    resource_type character varying NOT NULL,
    author_id integer,
    author_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.active_admin_comments OWNER TO pronto_films;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_admin_comments_id_seq OWNER TO pronto_films;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE admin_users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    role integer DEFAULT 2
);


ALTER TABLE public.admin_users OWNER TO pronto_films;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO pronto_films;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE admin_users_id_seq OWNED BY admin_users.id;


--
-- Name: award_skins; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE award_skins (
    id integer NOT NULL,
    award_id integer,
    skin_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.award_skins OWNER TO pronto_films;

--
-- Name: award_skins_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE award_skins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.award_skins_id_seq OWNER TO pronto_films;

--
-- Name: award_skins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE award_skins_id_seq OWNED BY award_skins.id;


--
-- Name: awards; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE awards (
    id integer NOT NULL,
    name character varying,
    picture character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.awards OWNER TO pronto_films;

--
-- Name: awards_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE awards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.awards_id_seq OWNER TO pronto_films;

--
-- Name: awards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE awards_id_seq OWNED BY awards.id;


--
-- Name: casting_dashboard_translations; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE casting_dashboard_translations (
    id integer NOT NULL,
    casting_dashboard_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    describe text
);


ALTER TABLE public.casting_dashboard_translations OWNER TO pronto_films;

--
-- Name: casting_dashboard_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE casting_dashboard_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.casting_dashboard_translations_id_seq OWNER TO pronto_films;

--
-- Name: casting_dashboard_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE casting_dashboard_translations_id_seq OWNED BY casting_dashboard_translations.id;


--
-- Name: casting_dashboards; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE casting_dashboards (
    id integer NOT NULL,
    describe text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.casting_dashboards OWNER TO pronto_films;

--
-- Name: casting_dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE casting_dashboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.casting_dashboards_id_seq OWNER TO pronto_films;

--
-- Name: casting_dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE casting_dashboards_id_seq OWNED BY casting_dashboards.id;


--
-- Name: castings; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE castings (
    id integer NOT NULL,
    picture character varying,
    people_type integer DEFAULT 0,
    index integer DEFAULT 0,
    show boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.castings OWNER TO pronto_films;

--
-- Name: castings_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE castings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.castings_id_seq OWNER TO pronto_films;

--
-- Name: castings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE castings_id_seq OWNED BY castings.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying,
    index integer DEFAULT 0,
    show boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO pronto_films;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO pronto_films;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: category_translations; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE category_translations (
    id integer NOT NULL,
    category_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying
);


ALTER TABLE public.category_translations OWNER TO pronto_films;

--
-- Name: category_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE category_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_translations_id_seq OWNER TO pronto_films;

--
-- Name: category_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE category_translations_id_seq OWNED BY category_translations.id;


--
-- Name: ckeditor_assets; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE ckeditor_assets (
    id integer NOT NULL,
    data_file_name character varying NOT NULL,
    data_content_type character varying,
    data_file_size integer,
    assetable_id integer,
    assetable_type character varying(30),
    type character varying(30),
    width integer,
    height integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.ckeditor_assets OWNER TO pronto_films;

--
-- Name: ckeditor_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE ckeditor_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ckeditor_assets_id_seq OWNER TO pronto_films;

--
-- Name: ckeditor_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE ckeditor_assets_id_seq OWNED BY ckeditor_assets.id;


--
-- Name: client_dashboard_translations; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE client_dashboard_translations (
    id integer NOT NULL,
    client_dashboard_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    footer text
);


ALTER TABLE public.client_dashboard_translations OWNER TO pronto_films;

--
-- Name: client_dashboard_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE client_dashboard_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_dashboard_translations_id_seq OWNER TO pronto_films;

--
-- Name: client_dashboard_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE client_dashboard_translations_id_seq OWNED BY client_dashboard_translations.id;


--
-- Name: client_dashboards; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE client_dashboards (
    id integer NOT NULL,
    footer text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.client_dashboards OWNER TO pronto_films;

--
-- Name: client_dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE client_dashboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_dashboards_id_seq OWNER TO pronto_films;

--
-- Name: client_dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE client_dashboards_id_seq OWNED BY client_dashboards.id;


--
-- Name: client_translations; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE client_translations (
    id integer NOT NULL,
    client_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying
);


ALTER TABLE public.client_translations OWNER TO pronto_films;

--
-- Name: client_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE client_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_translations_id_seq OWNER TO pronto_films;

--
-- Name: client_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE client_translations_id_seq OWNED BY client_translations.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE clients (
    id integer NOT NULL,
    client_dashboard_id integer,
    picture character varying,
    name character varying,
    index integer DEFAULT 0,
    show boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.clients OWNER TO pronto_films;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO pronto_films;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE clients_id_seq OWNED BY clients.id;


--
-- Name: location_dashboard_translations; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE location_dashboard_translations (
    id integer NOT NULL,
    location_dashboard_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    describe text
);


ALTER TABLE public.location_dashboard_translations OWNER TO pronto_films;

--
-- Name: location_dashboard_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE location_dashboard_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_dashboard_translations_id_seq OWNER TO pronto_films;

--
-- Name: location_dashboard_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE location_dashboard_translations_id_seq OWNED BY location_dashboard_translations.id;


--
-- Name: location_dashboards; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE location_dashboards (
    id integer NOT NULL,
    describe text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.location_dashboards OWNER TO pronto_films;

--
-- Name: location_dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE location_dashboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_dashboards_id_seq OWNER TO pronto_films;

--
-- Name: location_dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE location_dashboards_id_seq OWNED BY location_dashboards.id;


--
-- Name: location_pictures; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE location_pictures (
    id integer NOT NULL,
    location_id integer,
    picture character varying,
    index integer DEFAULT 0,
    show boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.location_pictures OWNER TO pronto_films;

--
-- Name: location_pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE location_pictures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_pictures_id_seq OWNER TO pronto_films;

--
-- Name: location_pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE location_pictures_id_seq OWNED BY location_pictures.id;


--
-- Name: location_translations; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE location_translations (
    id integer NOT NULL,
    location_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying
);


ALTER TABLE public.location_translations OWNER TO pronto_films;

--
-- Name: location_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE location_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_translations_id_seq OWNER TO pronto_films;

--
-- Name: location_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE location_translations_id_seq OWNED BY location_translations.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    name character varying,
    index integer DEFAULT 0,
    show boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.locations OWNER TO pronto_films;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO pronto_films;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO pronto_films;

--
-- Name: skin_translations; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE skin_translations (
    id integer NOT NULL,
    skin_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying,
    client character varying,
    brand character varying,
    video character varying
);


ALTER TABLE public.skin_translations OWNER TO pronto_films;

--
-- Name: skin_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE skin_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skin_translations_id_seq OWNER TO pronto_films;

--
-- Name: skin_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE skin_translations_id_seq OWNED BY skin_translations.id;


--
-- Name: skins; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE skins (
    id integer NOT NULL,
    name character varying,
    category_id integer,
    client character varying,
    brand character varying,
    video character varying,
    picture character varying,
    index integer DEFAULT 0,
    width integer DEFAULT 0,
    height integer DEFAULT 0,
    show boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    team_id integer
);


ALTER TABLE public.skins OWNER TO pronto_films;

--
-- Name: skins_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE skins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skins_id_seq OWNER TO pronto_films;

--
-- Name: skins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE skins_id_seq OWNED BY skins.id;


--
-- Name: team_translations; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE team_translations (
    id integer NOT NULL,
    team_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    director character varying,
    operator character varying
);


ALTER TABLE public.team_translations OWNER TO pronto_films;

--
-- Name: team_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE team_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_translations_id_seq OWNER TO pronto_films;

--
-- Name: team_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE team_translations_id_seq OWNED BY team_translations.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE teams (
    id integer NOT NULL,
    director character varying,
    operator character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.teams OWNER TO pronto_films;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_id_seq OWNER TO pronto_films;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE teams_id_seq OWNED BY teams.id;


--
-- Name: user_changes; Type: TABLE; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE TABLE user_changes (
    id integer NOT NULL,
    admin_user_id integer,
    tableedit_id integer,
    tableedit_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.user_changes OWNER TO pronto_films;

--
-- Name: user_changes_id_seq; Type: SEQUENCE; Schema: public; Owner: pronto_films
--

CREATE SEQUENCE user_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_changes_id_seq OWNER TO pronto_films;

--
-- Name: user_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pronto_films
--

ALTER SEQUENCE user_changes_id_seq OWNED BY user_changes.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY about_dashboard_translations ALTER COLUMN id SET DEFAULT nextval('about_dashboard_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY about_dashboards ALTER COLUMN id SET DEFAULT nextval('about_dashboards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY about_translations ALTER COLUMN id SET DEFAULT nextval('about_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY abouts ALTER COLUMN id SET DEFAULT nextval('abouts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY admin_users ALTER COLUMN id SET DEFAULT nextval('admin_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY award_skins ALTER COLUMN id SET DEFAULT nextval('award_skins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY awards ALTER COLUMN id SET DEFAULT nextval('awards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY casting_dashboard_translations ALTER COLUMN id SET DEFAULT nextval('casting_dashboard_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY casting_dashboards ALTER COLUMN id SET DEFAULT nextval('casting_dashboards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY castings ALTER COLUMN id SET DEFAULT nextval('castings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY category_translations ALTER COLUMN id SET DEFAULT nextval('category_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY ckeditor_assets ALTER COLUMN id SET DEFAULT nextval('ckeditor_assets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY client_dashboard_translations ALTER COLUMN id SET DEFAULT nextval('client_dashboard_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY client_dashboards ALTER COLUMN id SET DEFAULT nextval('client_dashboards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY client_translations ALTER COLUMN id SET DEFAULT nextval('client_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY clients ALTER COLUMN id SET DEFAULT nextval('clients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY location_dashboard_translations ALTER COLUMN id SET DEFAULT nextval('location_dashboard_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY location_dashboards ALTER COLUMN id SET DEFAULT nextval('location_dashboards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY location_pictures ALTER COLUMN id SET DEFAULT nextval('location_pictures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY location_translations ALTER COLUMN id SET DEFAULT nextval('location_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY skin_translations ALTER COLUMN id SET DEFAULT nextval('skin_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY skins ALTER COLUMN id SET DEFAULT nextval('skins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY team_translations ALTER COLUMN id SET DEFAULT nextval('team_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY teams ALTER COLUMN id SET DEFAULT nextval('teams_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pronto_films
--

ALTER TABLE ONLY user_changes ALTER COLUMN id SET DEFAULT nextval('user_changes_id_seq'::regclass);


--
-- Data for Name: about_dashboard_translations; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY about_dashboard_translations (id, about_dashboard_id, locale, created_at, updated_at, describe, adress) FROM stdin;
1	1	en	2015-12-24 10:43:59.112161	2015-12-24 10:53:50.621641	<p>The #1 production house in Ukraine, which produces movies , TV-series and advertising content<br />\r\nHistory Pronto Film is a ukrainian production house that was established by Max Asadchiy in 2004 The company is a full-service production of advertisement, music videos and movies In-house casting studio, location scouting, two editing stations, the storage of props and outfits allow to optimize the production process Our team is set of professionals from movie and advertisement production, as well as the ones from prominent advertising agencies Mission We believe, that we can bring the best movie maker&#39;s experince into advertising practice. News Все новости можно &laquo;копипастить&raquo; с нашего сайта здесь: http://www.prontofilm.kiev.ua/portfolio/featuredprojects</p>\r\n	<p>10A, Naberezhno-Khreschatitska street,<br />\r\noffice 1 04070 Kiev, Ukraine tel: +380 (44) 490 22 31<br />\r\nfax: +380 (44) 490 22 32general</p>\r\n
2	1	ua	2015-12-24 10:53:50.630225	2015-12-24 10:54:10.881319	<p>Українська версія</p>\r\n	<p>Український адрес</p>\r\n
\.


--
-- Name: about_dashboard_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('about_dashboard_translations_id_seq', 2, true);


--
-- Data for Name: about_dashboards; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY about_dashboards (id, describe, adress, enquiries, bidding, facebook, vimeo, created_at, updated_at) FROM stdin;
1	The #1 production house in Ukraine, which produces movies , TV-series and advertising content\n                <br>\n                <span>History</span>\n                Pronto Film is a ukrainian production house that was established by Max Asadchiy in 2004 The company is a full-service production of advertisement, music videos  and movies In-house casting studio, location scouting, two editing stations, the storage of props and outfits allow to optimize the production process  Our team is set of professionals from  movie and advertisement production, as well as the ones from prominent advertising agencies\n                <span>Mission</span>\n                We believe, that we can  bring the best movie maker's experince into advertising practice.\n                <span>News</span>\n                Все новости можно «копипастить» с нашего сайта здесь: http://www.prontofilm.kiev.ua/portfolio/featuredprojects\n              	10A, Naberezhno-Khreschatitska street,\n                  <br>\n                  office 1 04070 Kiev, Ukraine tel: +380 (44) 490 22 31\n                  <br>\n                  fax: +380 (44) 490 22 32general\n                					2015-12-24 10:43:32.435249	2015-12-24 10:54:10.884236
\.


--
-- Name: about_dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('about_dashboards_id_seq', 1, true);


--
-- Data for Name: about_translations; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY about_translations (id, about_id, locale, created_at, updated_at, first_name, last_name, "position", describe, picture_name) FROM stdin;
23	12	ua	2015-12-24 15:16:33.816015	2016-01-11 10:55:01.85677	Алла	Самойленко	Генеральный копирайтер	<p>А.Мейер изучал архитектуру в Школе прикладного искусства&nbsp;<a href="https://ru.wikipedia.org/wiki/%D0%94%D1%8E%D1%81%D1%81%D0%B5%D0%BB%D1%8C%D0%B4%D0%BE%D1%80%D1%84" style="text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;" title="Дюссельдорф">Дюссельдорфа</a>. В 1907&mdash;1908 годах он работает в бюро у&nbsp;<a href="https://ru.wikipedia.org/wiki/%D0%91%D0%B5%D1%80%D0%B5%D0%BD%D1%81,_%D0%9F%D0%B5%D1%82%D0%B5%D1%80" style="text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;" title="Беренс, Петер">Петера Беренса</a>.&nbsp;</p>\r\n	23.png
24	12	en	2015-12-24 15:16:33.82395	2015-12-28 11:44:38.794198	Alla	Samoylenko			24.png
21	11	ua	2015-12-24 15:16:06.094673	2015-12-28 11:45:28.055295	Сергій	Лисяний			21.png
22	11	en	2015-12-24 15:16:06.102361	2015-12-28 11:45:28.066392	Serhiy	Lysyanyy			22.png
19	10	ua	2015-12-24 15:15:28.17152	2015-12-28 11:45:56.801588	Сашко	Чубко			19.png
20	10	en	2015-12-24 15:15:28.17916	2015-12-28 11:45:56.812874	Sashko	Chubko			20.png
17	9	ua	2015-12-24 15:14:58.751489	2015-12-28 11:46:30.592494	Олександр	Воронін			17.png
18	9	en	2015-12-24 15:14:58.75915	2015-12-28 11:46:30.603519	Oleksandr	Voronin			18.png
15	8	ua	2015-12-24 15:03:49.235663	2015-12-28 11:47:14.440412	Ніна	Новікова			15.png
16	8	en	2015-12-24 15:03:49.243435	2015-12-28 11:47:14.451195	Nina	Novikova			16.png
13	7	ua	2015-12-24 15:02:35.828761	2015-12-28 11:47:58.561808	Юлія	Мельник			13.png
14	7	en	2015-12-24 15:02:35.836309	2015-12-28 11:47:58.573361	Yulia	Melnyk			14.png
11	6	ua	2015-12-24 15:02:07.471193	2015-12-28 11:49:33.806923	Катерина	Виноградова			11.png
12	6	en	2015-12-24 15:02:07.478785	2015-12-28 11:49:33.818457	Kateryna	Vynogradova			12.png
9	5	ua	2015-12-24 15:01:22.607477	2015-12-28 11:50:33.651274	Олександра	Крашеніннікова			9.png
10	5	en	2015-12-24 15:01:22.615385	2015-12-28 11:50:33.663127	Oleksandra	Krasheninnikova			10.png
7	4	ua	2015-12-24 15:00:47.104287	2015-12-28 11:51:03.82275	Павло	Гуцол			7.png
8	4	en	2015-12-24 15:00:47.110947	2015-12-28 11:51:03.834507	Pasha	Gutsol			8.png
5	3	ua	2015-12-24 15:00:15.71874	2015-12-28 11:51:26.65333	Анна	Калашнік			5.png
6	3	en	2015-12-24 15:00:15.726177	2015-12-28 11:51:26.665228	Anna	Kalashnyk			6.png
3	2	ua	2015-12-24 14:59:50.43381	2015-12-28 11:52:13.830737	Іріна	Ішкова			3.png
4	2	en	2015-12-24 14:59:50.441442	2015-12-28 11:52:13.842468	Iryna	Ishkova			4.png
1	1	ua	2015-12-24 14:58:41.315642	2015-12-28 11:52:48.250403	Максим	Асадчий			1.png
2	1	en	2015-12-24 14:58:41.326775	2015-12-28 11:52:48.262476	Maksym	Asadchiy			2.png
\.


--
-- Name: about_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('about_translations_id_seq', 24, true);


--
-- Data for Name: abouts; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY abouts (id, picture, first_name, last_name, email, describe, "position", index, show, created_at, updated_at, picture_name) FROM stdin;
12	12.png	\N	\N	samoylenko@pronto.kiev.ua	\N	\N	11	t	2015-12-24 15:16:33.813498	2016-01-11 10:55:01.862291	\N
11	11.png	\N	\N		\N	\N	10	t	2015-12-24 15:16:06.092154	2015-12-28 11:45:28.071657	\N
10	10.png	\N	\N		\N	\N	9	t	2015-12-24 15:15:28.169152	2015-12-28 11:45:56.818369	\N
9	9.png	\N	\N		\N	\N	8	t	2015-12-24 15:14:58.749106	2015-12-28 11:46:30.609003	\N
8	8.png	\N	\N		\N	\N	7	t	2015-12-24 15:03:49.233326	2015-12-28 11:47:14.456935	\N
7	7.png	\N	\N		\N	\N	6	t	2015-12-24 15:02:35.826199	2015-12-28 11:47:58.579356	\N
6	6.png	\N	\N		\N	\N	5	t	2015-12-24 15:02:07.468707	2015-12-28 11:49:33.824042	\N
5	5.png	\N	\N		\N	\N	4	t	2015-12-24 15:01:22.605199	2015-12-28 11:50:33.669239	\N
4	4.png	\N	\N		\N	\N	3	t	2015-12-24 15:00:47.10148	2015-12-28 11:51:03.840258	\N
3	3.png	\N	\N		\N	\N	2	t	2015-12-24 15:00:15.716275	2015-12-28 11:51:26.671052	\N
2	2.png	\N	\N		\N	\N	1	t	2015-12-24 14:59:50.43132	2015-12-28 11:52:13.8483	\N
1	1.png	\N	\N		\N	\N	0	t	2015-12-24 14:58:41.31139	2015-12-28 11:53:02.01814	\N
\.


--
-- Name: abouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('abouts_id_seq', 12, true);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY active_admin_comments (id, namespace, body, resource_id, resource_type, author_id, author_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('active_admin_comments_id_seq', 1, false);


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY admin_users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, role) FROM stdin;
2	koviser@gmail.com	$2a$10$cf7y/s6yhmRANm.W2FUHSerVbfrTs/uwBvZjOgtN2E7f2ync51tw2	\N	\N	2015-12-18 16:54:15.765313	1	2015-12-18 16:54:15.823237	2015-12-18 16:54:15.823237	62.216.43.90	62.216.43.90	2015-12-18 16:53:47.49547	2015-12-18 16:54:15.824914	0
4	admin@example.com	$2a$10$dAEHBhHemNBpzn2VWxGVUemznkbYUk8b4p3awV8c.66oKTzzbrvlG	\N	\N	\N	1	2015-12-24 16:10:59.104116	2015-12-24 16:10:59.104116	62.216.43.90	62.216.43.90	2015-12-24 15:17:59.262769	2015-12-24 16:10:59.105326	0
3	nikita.makukhin@outforz.com	$2a$10$0/Y5unwPK12QCTG2/QOKZ.nNkPsNq.lsUiD0qkDQSdW4gbJlidOpK	\N	\N	\N	2	2016-01-11 10:41:29.152371	2016-01-11 10:40:50.017325	62.216.43.90	62.216.43.90	2015-12-22 11:06:02.454633	2016-01-11 10:41:29.153582	0
\.


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('admin_users_id_seq', 4, true);


--
-- Data for Name: award_skins; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY award_skins (id, award_id, skin_id, created_at, updated_at) FROM stdin;
1	1	1	2015-12-22 16:22:55.891899	2015-12-22 16:22:55.891899
4	1	3	2015-12-22 16:23:49.172516	2015-12-22 16:23:49.172516
5	2	4	2015-12-22 16:24:25.764223	2015-12-22 16:24:25.764223
\.


--
-- Name: award_skins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('award_skins_id_seq', 5, true);


--
-- Data for Name: awards; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY awards (id, name, picture, created_at, updated_at) FROM stdin;
1	нагорода 1 	1.png	2015-12-22 16:20:55.134817	2015-12-22 16:21:02.761329
2	Нагорода 2 	2.png	2015-12-22 16:21:19.256257	2015-12-22 16:21:19.256257
\.


--
-- Name: awards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('awards_id_seq', 2, true);


--
-- Data for Name: casting_dashboard_translations; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY casting_dashboard_translations (id, casting_dashboard_id, locale, created_at, updated_at, describe) FROM stdin;
1	1	en	2015-12-28 16:49:57.692412	2016-01-11 15:53:40.004927	Slavic facial types are predominant in Ukraine but you can find representatives of any other races in our country. Ukrainian women are justifiably regarded as the most beautiful in the world.You can count on PRONTO, with their extensive casting database, to find almost any character you could possibly wish to have. We constantly refresh our resources and add new faces to our catalogues. If you need more than that, our casting department will quickly carry out special research based on your project requirements.
2	1	ua	2016-01-11 15:53:40.014448	2016-01-11 15:53:40.014448	Slavic facial types are predominant in Ukraine but you can find representatives of any other races in our country. Ukrainian women are justifiably regarded as the most beautiful in the world.You can count on PRONTO, with their extensive casting database, to find almost any character you could possibly wish to have. We constantly refresh our resources and add new faces to our catalogues. If you need more than that, our casting department will quickly carry out special research based on your project requirements.
\.


--
-- Name: casting_dashboard_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('casting_dashboard_translations_id_seq', 2, true);


--
-- Data for Name: casting_dashboards; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY casting_dashboards (id, describe, created_at, updated_at) FROM stdin;
1	Describe  information	2015-12-28 16:49:37.894571	2016-01-11 15:53:40.065205
\.


--
-- Name: casting_dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('casting_dashboards_id_seq', 1, true);


--
-- Data for Name: castings; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY castings (id, picture, people_type, index, show, created_at, updated_at) FROM stdin;
1	1.jpg	0	0	t	2016-01-11 15:54:12.967334	2016-01-11 15:54:19.516827
2	2.jpg	0	0	t	2016-01-11 15:54:25.716024	2016-01-11 15:54:25.716024
3	3.jpg	0	0	t	2016-01-11 15:54:31.332752	2016-01-11 15:54:31.332752
4	4.jpg	1	0	t	2016-01-11 15:54:41.295766	2016-01-11 15:54:41.295766
5	5.jpg	1	0	t	2016-01-11 15:54:46.316048	2016-01-11 15:54:46.316048
6	6.jpg	1	0	t	2016-01-11 15:54:52.096385	2016-01-11 15:54:52.096385
7	7.jpg	1	0	t	2016-01-11 15:54:57.771581	2016-01-11 15:54:57.771581
8	8.jpg	1	0	t	2016-01-11 15:55:04.072085	2016-01-11 15:55:04.072085
9	9.jpg	2	0	t	2016-01-11 15:55:14.454676	2016-01-11 15:55:14.454676
10	10.jpg	2	0	t	2016-01-11 15:55:20.317608	2016-01-11 15:55:20.317608
11	11.jpg	2	0	t	2016-01-11 15:55:26.236431	2016-01-11 15:55:26.236431
12	12.jpg	2	0	t	2016-01-11 15:55:32.080278	2016-01-11 15:55:32.080278
13	13.jpg	2	0	t	2016-01-11 15:55:37.88894	2016-01-11 15:55:37.88894
14	14.jpg	2	0	t	2016-01-11 15:55:45.234424	2016-01-11 15:55:45.234424
\.


--
-- Name: castings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('castings_id_seq', 14, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY categories (id, name, index, show, created_at, updated_at) FROM stdin;
1	Advertising	0	t	2015-12-21 15:23:27.870445	2015-12-21 15:23:55.348547
2	FILM/ TV-series	1	t	2015-12-21 15:23:27.873318	2015-12-21 15:23:55.363334
3	Music Videos	2	t	2015-12-21 15:23:27.875115	2015-12-21 15:23:55.370135
5	TV design	4	t	2015-12-21 15:23:27.878203	2015-12-21 15:23:55.383589
4	Digital	3	t	2015-12-21 15:23:27.876683	2015-12-22 16:47:19.182379
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('categories_id_seq', 6, true);


--
-- Data for Name: category_translations; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY category_translations (id, category_id, locale, created_at, updated_at, name) FROM stdin;
1	1	en	2015-12-21 15:23:55.317738	2015-12-21 15:23:55.317738	Advertising
2	2	en	2015-12-21 15:23:55.3601	2015-12-21 15:23:55.3601	FILM/ TV-series
3	3	en	2015-12-21 15:23:55.366884	2015-12-21 15:23:55.366884	Music Videos
4	4	en	2015-12-21 15:23:55.373654	2015-12-21 15:23:55.373654	Digital
5	5	en	2015-12-21 15:23:55.380363	2015-12-21 15:23:55.380363	TV design
7	4	ua	2015-12-22 16:30:45.576927	2015-12-22 16:30:45.576927	
\.


--
-- Name: category_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('category_translations_id_seq', 7, true);


--
-- Data for Name: ckeditor_assets; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY ckeditor_assets (id, data_file_name, data_content_type, data_file_size, assetable_id, assetable_type, type, width, height, created_at, updated_at) FROM stdin;
\.


--
-- Name: ckeditor_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('ckeditor_assets_id_seq', 8, true);


--
-- Data for Name: client_dashboard_translations; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY client_dashboard_translations (id, client_dashboard_id, locale, created_at, updated_at, footer) FROM stdin;
1	1	en	2015-12-28 11:19:16.634029	2015-12-28 11:19:16.634029	Footer  information
2	1	ua	2015-12-29 18:07:52.256482	2015-12-29 18:07:52.256482	
\.


--
-- Name: client_dashboard_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('client_dashboard_translations_id_seq', 2, true);


--
-- Data for Name: client_dashboards; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY client_dashboards (id, footer, created_at, updated_at) FROM stdin;
1	Footer  information	2015-12-28 11:18:56.247853	2015-12-29 18:07:52.268538
\.


--
-- Name: client_dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('client_dashboards_id_seq', 1, true);


--
-- Data for Name: client_translations; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY client_translations (id, client_id, locale, created_at, updated_at, name) FROM stdin;
\.


--
-- Name: client_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('client_translations_id_seq', 4, true);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY clients (id, client_dashboard_id, picture, name, index, show, created_at, updated_at) FROM stdin;
\.


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('clients_id_seq', 2, true);


--
-- Data for Name: location_dashboard_translations; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY location_dashboard_translations (id, location_dashboard_id, locale, created_at, updated_at, describe) FROM stdin;
1	1	en	2015-12-23 16:35:16.388887	2015-12-23 16:35:16.388887	Ukraine is big and diverse. It has mountains, seas, steppes, forests, rivers, authentic villages, old royal palaces, Soviet time paraphernalia and locations and modern cities. Some locations are peculiar only to our country. Some others have European or Eastern look. The Dnipro is considered to be one of the cleanest rivers in Europe. The Carpathian mountains get a lot of snow in winter. The Black sea is warm in summer and has both pebble and sand shores. Ukrainian villages are impressive examples of national history and culture. Historical architectural structures are being restored and preserved. There are a lot of Byzantine and Ukrainian Baroque churches and cathedrals. Modern steal-and-glass constructions are springing up like mushrooms in the big cities.
\.


--
-- Name: location_dashboard_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('location_dashboard_translations_id_seq', 1, true);


--
-- Data for Name: location_dashboards; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY location_dashboards (id, describe, created_at, updated_at) FROM stdin;
1	Ukraine is big and diverse. It has mountains, seas, steppes, forests, rivers, authentic villages, old royal palaces, Soviet time paraphernalia and locations and modern cities. Some locations are peculiar only to our country. Some others have European or Eastern look. The Dnipro is considered to be one of the cleanest rivers in Europe. The Carpathian mountains get a lot of snow in winter. The Black sea is warm in summer and has both pebble and sand shores. Ukrainian villages are impressive examples of national history and culture. Historical architectural structures are being restored and preserved. There are a lot of Byzantine and Ukrainian Baroque churches and cathedrals. Modern steal-and-glass constructions are springing up like mushrooms in the big cities.	2015-12-23 16:34:53.6	2015-12-23 16:35:16.407395
\.


--
-- Name: location_dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('location_dashboards_id_seq', 1, true);


--
-- Data for Name: location_pictures; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY location_pictures (id, location_id, picture, index, show, created_at, updated_at) FROM stdin;
1	10	1.jpg	0	t	2015-12-23 16:44:20.128033	2015-12-23 16:44:29.892631
2	10	2.jpg	0	t	2015-12-23 16:44:44.110363	2015-12-23 16:44:44.110363
3	10	3.jpg	0	t	2015-12-23 16:44:44.117374	2015-12-23 16:44:44.117374
4	9	4.jpg	0	t	2015-12-23 16:45:34.101634	2015-12-23 16:45:34.101634
5	9	5.jpg	0	t	2015-12-23 16:45:34.106095	2015-12-23 16:45:34.106095
6	9	6.jpg	0	t	2015-12-23 16:45:34.112945	2015-12-23 16:45:34.112945
7	9	7.jpg	0	t	2015-12-23 16:45:34.11856	2015-12-23 16:45:34.11856
8	9	8.jpg	0	t	2015-12-23 16:45:34.123813	2015-12-23 16:45:34.123813
9	8	9.jpg	0	t	2015-12-24 08:16:24.265875	2015-12-24 08:16:24.265875
10	7	10.jpg	0	t	2015-12-24 08:17:21.691434	2015-12-24 08:17:21.691434
11	7	11.jpg	0	t	2015-12-24 08:17:21.698061	2015-12-24 08:17:21.698061
12	7	12.jpg	0	t	2015-12-24 08:17:21.704602	2015-12-24 08:17:21.704602
13	7	13.jpg	0	t	2015-12-24 08:17:21.711574	2015-12-24 08:17:21.711574
14	6	14.jpg	0	t	2015-12-24 08:18:11.059269	2015-12-24 08:18:11.059269
15	6	15.jpg	0	t	2015-12-24 08:18:11.066343	2015-12-24 08:18:11.066343
16	6	16.jpg	0	t	2015-12-24 08:18:11.074684	2015-12-24 08:18:11.074684
17	6	17.jpg	0	t	2015-12-24 08:18:11.079959	2015-12-24 08:18:11.079959
18	6	18.jpg	0	t	2015-12-24 08:18:11.084488	2015-12-24 08:18:11.084488
19	5	19.jpg	0	t	2015-12-24 08:19:04.010952	2015-12-24 08:19:04.010952
20	5	20.jpg	0	t	2015-12-24 08:19:04.015349	2015-12-24 08:19:04.015349
21	5	21.jpg	0	t	2015-12-24 08:19:04.022132	2015-12-24 08:19:04.022132
22	5	22.jpg	0	t	2015-12-24 08:19:04.028894	2015-12-24 08:19:04.028894
23	5	23.jpg	0	t	2015-12-24 08:19:04.032514	2015-12-24 08:19:04.032514
24	5	24.jpg	0	t	2015-12-24 08:19:04.038085	2015-12-24 08:19:04.038085
25	4	25.jpg	0	t	2015-12-24 08:20:16.994546	2015-12-24 08:20:16.994546
26	4	26.jpg	0	t	2015-12-24 08:20:16.999689	2015-12-24 08:20:16.999689
27	4	27.jpg	0	t	2015-12-24 08:20:17.006267	2015-12-24 08:20:17.006267
28	4	28.jpg	0	t	2015-12-24 08:20:17.01182	2015-12-24 08:20:17.01182
29	4	29.jpg	0	t	2015-12-24 08:20:17.01678	2015-12-24 08:20:17.01678
30	4	30.jpg	0	t	2015-12-24 08:20:17.020383	2015-12-24 08:20:17.020383
31	4	31.jpg	0	t	2015-12-24 08:20:17.023809	2015-12-24 08:20:17.023809
32	3	32.jpg	0	t	2015-12-24 08:20:51.153834	2015-12-24 08:20:51.153834
33	3	33.jpg	1	t	2015-12-24 08:20:51.158484	2015-12-24 08:20:51.158484
34	3	34.jpg	0	t	2015-12-24 08:20:51.165568	2015-12-24 08:20:51.165568
35	2	35.jpg	0	t	2015-12-24 08:21:28.071321	2015-12-24 08:21:28.071321
36	2	36.jpg	0	t	2015-12-24 08:21:28.077073	2015-12-24 08:21:28.077073
37	2	37.jpg	0	t	2015-12-24 08:21:28.08184	2015-12-24 08:21:28.08184
38	2	38.jpg	0	t	2015-12-24 08:21:28.085987	2015-12-24 08:21:28.085987
39	2	39.jpg	0	t	2015-12-24 08:21:28.091573	2015-12-24 08:21:28.091573
41	1	41.jpg	4	t	2015-12-24 08:22:19.853582	2015-12-24 08:22:19.853582
42	1	42.jpg	2	t	2015-12-24 08:22:19.860465	2015-12-24 08:22:19.860465
43	1	43.jpg	3	t	2015-12-24 08:22:19.864353	2015-12-24 08:22:19.864353
40	1	40.jpg	1	t	2015-12-24 08:22:19.846169	2015-12-24 08:22:43.882849
44	1	44.jpg	5	t	2015-12-24 08:22:19.868045	2015-12-24 08:22:43.885249
\.


--
-- Name: location_pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('location_pictures_id_seq', 44, true);


--
-- Data for Name: location_translations; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY location_translations (id, location_id, locale, created_at, updated_at, name) FROM stdin;
1	1	en	2015-12-23 16:34:53.266635	2015-12-23 16:34:53.266635	CITY
2	2	en	2015-12-23 16:34:53.288975	2015-12-23 16:34:53.288975	INTERIORS
3	3	en	2015-12-23 16:34:53.296622	2015-12-23 16:34:53.296622	OFFICES
4	4	en	2015-12-23 16:34:53.304215	2015-12-23 16:34:53.304215	ROADS
5	5	en	2015-12-23 16:34:53.311909	2015-12-23 16:34:53.311909	METRO
6	6	en	2015-12-23 16:34:53.319458	2015-12-23 16:34:53.319458	AIRPORT
7	7	en	2015-12-23 16:34:53.326992	2015-12-23 16:34:53.326992	OLD EUROPE
8	8	en	2015-12-23 16:34:53.334486	2015-12-23 16:34:53.334486	MOUNTAINS
9	9	en	2015-12-23 16:34:53.342058	2015-12-23 16:34:53.342058	NATURE
10	10	en	2015-12-23 16:34:53.349641	2015-12-23 16:34:53.349641	COAST
11	10	ua	2015-12-23 16:44:20.157269	2015-12-23 16:44:20.157269	COAST
12	9	ua	2015-12-23 16:45:34.128583	2015-12-23 16:45:34.128583	NATURE
13	8	ua	2015-12-24 08:16:24.270068	2015-12-24 08:16:24.270068	
14	7	ua	2015-12-24 08:17:21.717324	2015-12-24 08:17:21.717324	
15	6	ua	2015-12-24 08:18:11.087755	2015-12-24 08:18:11.087755	
16	5	ua	2015-12-24 08:19:04.042688	2015-12-24 08:19:04.042688	
17	4	ua	2015-12-24 08:20:17.026454	2015-12-24 08:20:17.026454	
18	3	ua	2015-12-24 08:20:51.171422	2015-12-24 08:20:51.171422	
19	2	ua	2015-12-24 08:21:28.097917	2015-12-24 08:21:28.097917	
20	1	ua	2015-12-24 08:22:19.87087	2015-12-24 08:22:19.87087	
\.


--
-- Name: location_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('location_translations_id_seq', 20, true);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY locations (id, name, index, show, created_at, updated_at) FROM stdin;
10	COAST	9	t	2015-12-23 16:34:26.721071	2015-12-23 16:44:20.163953
9	NATURE	8	t	2015-12-23 16:34:26.71969	2015-12-23 16:45:34.132451
8	MOUNTAINS	7	t	2015-12-23 16:34:26.718298	2015-12-24 08:16:24.274341
7	OLD EUROPE	6	t	2015-12-23 16:34:26.71683	2015-12-24 08:17:21.721838
6	AIRPORT	5	t	2015-12-23 16:34:26.715446	2015-12-24 08:18:11.092209
5	METRO	4	t	2015-12-23 16:34:26.71405	2015-12-24 08:19:04.046446
4	ROADS	3	t	2015-12-23 16:34:26.712617	2015-12-24 08:20:17.030015
3	OFFICES	2	t	2015-12-23 16:34:26.711167	2015-12-24 08:20:51.175679
2	INTERIORS	1	t	2015-12-23 16:34:26.709412	2015-12-24 08:21:28.101715
1	CITY	0	t	2015-12-23 16:34:26.706624	2015-12-24 08:22:19.874537
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('locations_id_seq', 10, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY schema_migrations (version) FROM stdin;
20151130092952
20151130092954
20151217134243
20151218085353
20151218092555
20151221102737
20151221145738
20151221161526
20151222104946
20151223110937
20151223113951
20151223160615
20151223162244
20151224090818
20151224100425
20151225134336
20151225141635
20151228095634
20151228121801
20151228123003
\.


--
-- Data for Name: skin_translations; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY skin_translations (id, skin_id, locale, created_at, updated_at, name, client, brand, video) FROM stdin;
1	1	ua	2015-12-22 16:20:11.556438	2015-12-22 16:20:11.556438	ім'я 1	клієнт 1	бренд 1	відео
2	1	en	2015-12-22 16:20:11.575302	2015-12-22 16:22:55.930732	Name 1	Client 1	Brand 1	Video 1
3	2	ua	2015-12-22 16:23:25.597821	2015-12-22 16:23:25.597821	sdfasf 	sd fadss fa	 dsfdf fa	s fdsf a
4	2	en	2015-12-22 16:23:25.603157	2015-12-22 16:23:25.603157	sdf f 	sdf f as	sd ffa	sf  sf  fa
5	3	ua	2015-12-22 16:23:49.158449	2015-12-22 16:23:49.158449	sf sdf fa	sf sf fa	sd af	s faf fa
6	3	en	2015-12-22 16:23:49.165309	2015-12-22 16:23:49.165309	f asdfsa sdf	sf asdfsa f	sdf asfa	sdf asf daf
7	4	ua	2015-12-22 16:24:25.752752	2015-12-22 16:24:25.752752	dfg ddfg	df gsdfgfd g	dsfg fdg g	sd gsdfgsdf gds
8	4	en	2015-12-22 16:24:25.758488	2015-12-22 16:24:25.758488	dsg dgdgd sg	dg dfgsgs	dg dfg s	dg dfgss
9	5	ua	2015-12-22 16:28:17.503831	2015-12-22 16:28:17.503831	cg dsfgds gdfg	df gdfgdsg 	ds gdfdgs 	ds gdfs 
10	5	en	2015-12-22 16:28:17.510923	2015-12-22 16:28:17.510923	df gdsfg dsff	dsf gdfsg 	d gdsg 	dfg dfgs dg
\.


--
-- Name: skin_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('skin_translations_id_seq', 10, true);


--
-- Data for Name: skins; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY skins (id, name, category_id, client, brand, video, picture, index, width, height, show, created_at, updated_at, team_id) FROM stdin;
1	\N	1	\N	\N	\N	1.jpg	0	656	464	t	2015-12-22 16:20:11.538442	2015-12-22 16:22:55.93513	1
2	\N	2	\N	\N	\N	2.jpg	0	288	781	t	2015-12-22 16:23:25.572954	2015-12-22 16:23:25.606629	2
4	\N	4	\N	\N	\N	4.jpg	0	588	622	t	2015-12-22 16:24:25.744052	2015-12-22 16:24:25.762304	1
5	\N	4	\N	\N	\N	5.jpg	0	1920	1080	t	2015-12-22 16:28:17.492705	2015-12-22 16:28:17.515609	1
3	\N	3	\N	\N	\N	3.jpg	0	587	466	t	2015-12-22 16:23:49.147953	2015-12-22 17:40:23.499402	1
\.


--
-- Name: skins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('skins_id_seq', 5, true);


--
-- Data for Name: team_translations; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY team_translations (id, team_id, locale, created_at, updated_at, director, operator) FROM stdin;
1	1	ua	2015-12-22 16:21:52.391161	2015-12-22 16:21:52.391161	Режисер 1	Оператор 1
2	1	en	2015-12-22 16:21:52.399726	2015-12-22 16:21:52.399726	Director 1	Operator 1
3	2	ua	2015-12-22 16:22:20.550725	2015-12-22 16:22:20.550725	Режисер 2	Оператор 2
4	2	en	2015-12-22 16:22:20.554804	2015-12-22 16:22:20.554804	Director 2	Operator 2
\.


--
-- Name: team_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('team_translations_id_seq', 4, true);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY teams (id, director, operator, created_at, updated_at) FROM stdin;
1	\N	\N	2015-12-22 16:21:52.381178	2015-12-22 16:21:52.402582
2	\N	\N	2015-12-22 16:22:20.543121	2015-12-22 16:22:20.557127
\.


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('teams_id_seq', 2, true);


--
-- Data for Name: user_changes; Type: TABLE DATA; Schema: public; Owner: pronto_films
--

COPY user_changes (id, admin_user_id, tableedit_id, tableedit_type, created_at, updated_at) FROM stdin;
1	1	2	AdminUser	2015-12-18 16:53:47.498621	2015-12-18 16:53:47.498621
3	2	3	AdminUser	2015-12-22 11:06:02.457065	2015-12-22 11:06:02.457065
4	2	1	Skin	2015-12-22 16:20:11.548021	2015-12-22 16:20:11.548021
5	2	1	Skin	2015-12-22 16:20:30.316475	2015-12-22 16:20:30.316475
6	2	1	Award	2015-12-22 16:20:55.137654	2015-12-22 16:20:55.137654
7	2	1	Award	2015-12-22 16:21:02.750503	2015-12-22 16:21:02.750503
8	2	2	Award	2015-12-22 16:21:19.258786	2015-12-22 16:21:19.258786
9	2	1	Team	2015-12-22 16:21:52.384806	2015-12-22 16:21:52.384806
10	2	2	Team	2015-12-22 16:22:20.544961	2015-12-22 16:22:20.544961
11	2	1	Skin	2015-12-22 16:22:55.917593	2015-12-22 16:22:55.917593
12	2	2	Skin	2015-12-22 16:23:25.575609	2015-12-22 16:23:25.575609
13	2	3	Skin	2015-12-22 16:23:49.150585	2015-12-22 16:23:49.150585
14	2	4	Skin	2015-12-22 16:24:25.746475	2015-12-22 16:24:25.746475
15	2	2	Skin	2015-12-22 16:25:11.043716	2015-12-22 16:25:11.043716
16	2	5	Skin	2015-12-22 16:28:17.495506	2015-12-22 16:28:17.495506
17	2	3	Skin	2015-12-22 16:30:10.237275	2015-12-22 16:30:10.237275
18	2	4	Category	2015-12-22 16:30:45.566146	2015-12-22 16:30:45.566146
19	2	4	Category	2015-12-22 16:47:19.172225	2015-12-22 16:47:19.172225
20	2	3	Skin	2015-12-22 17:40:23.487891	2015-12-22 17:40:23.487891
21	2	10	Location	2015-12-23 16:44:20.112301	2015-12-23 16:44:20.112301
22	2	10	Location	2015-12-23 16:44:29.882572	2015-12-23 16:44:29.882572
23	2	10	Location	2015-12-23 16:44:44.098373	2015-12-23 16:44:44.098373
24	2	9	Location	2015-12-23 16:45:34.089456	2015-12-23 16:45:34.089456
25	2	8	Location	2015-12-24 08:16:24.253517	2015-12-24 08:16:24.253517
26	2	7	Location	2015-12-24 08:17:21.678099	2015-12-24 08:17:21.678099
27	2	6	Location	2015-12-24 08:18:11.046001	2015-12-24 08:18:11.046001
28	2	5	Location	2015-12-24 08:19:03.998966	2015-12-24 08:19:03.998966
29	2	4	Location	2015-12-24 08:20:16.98373	2015-12-24 08:20:16.98373
30	2	3	Location	2015-12-24 08:20:51.140082	2015-12-24 08:20:51.140082
31	2	2	Location	2015-12-24 08:21:28.060086	2015-12-24 08:21:28.060086
32	2	1	Location	2015-12-24 08:22:19.832303	2015-12-24 08:22:19.832303
33	2	1	Location	2015-12-24 08:22:43.87395	2015-12-24 08:22:43.87395
34	2	4	AdminUser	2015-12-24 15:17:59.264882	2015-12-24 15:17:59.264882
35	2	1	ClientDashboard	2015-12-29 18:07:52.177506	2015-12-29 18:07:52.177506
36	2	1	ClientDashboard	2015-12-29 18:08:03.015997	2015-12-29 18:08:03.015997
37	2	1	ClientDashboard	2015-12-29 18:08:22.219372	2015-12-29 18:08:22.219372
38	2	1	ClientDashboard	2015-12-29 18:08:47.208084	2015-12-29 18:08:47.208084
39	2	1	ClientDashboard	2015-12-29 18:08:52.436237	2015-12-29 18:08:52.436237
40	2	3	AdminUser	2016-01-11 10:41:25.095484	2016-01-11 10:41:25.095484
\.


--
-- Name: user_changes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pronto_films
--

SELECT pg_catalog.setval('user_changes_id_seq', 40, true);


--
-- Name: about_dashboard_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY about_dashboard_translations
    ADD CONSTRAINT about_dashboard_translations_pkey PRIMARY KEY (id);


--
-- Name: about_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY about_dashboards
    ADD CONSTRAINT about_dashboards_pkey PRIMARY KEY (id);


--
-- Name: about_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY about_translations
    ADD CONSTRAINT about_translations_pkey PRIMARY KEY (id);


--
-- Name: abouts_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY abouts
    ADD CONSTRAINT abouts_pkey PRIMARY KEY (id);


--
-- Name: active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: award_skins_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY award_skins
    ADD CONSTRAINT award_skins_pkey PRIMARY KEY (id);


--
-- Name: awards_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY awards
    ADD CONSTRAINT awards_pkey PRIMARY KEY (id);


--
-- Name: casting_dashboard_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY casting_dashboard_translations
    ADD CONSTRAINT casting_dashboard_translations_pkey PRIMARY KEY (id);


--
-- Name: casting_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY casting_dashboards
    ADD CONSTRAINT casting_dashboards_pkey PRIMARY KEY (id);


--
-- Name: castings_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY castings
    ADD CONSTRAINT castings_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: category_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY category_translations
    ADD CONSTRAINT category_translations_pkey PRIMARY KEY (id);


--
-- Name: ckeditor_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY ckeditor_assets
    ADD CONSTRAINT ckeditor_assets_pkey PRIMARY KEY (id);


--
-- Name: client_dashboard_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY client_dashboard_translations
    ADD CONSTRAINT client_dashboard_translations_pkey PRIMARY KEY (id);


--
-- Name: client_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY client_dashboards
    ADD CONSTRAINT client_dashboards_pkey PRIMARY KEY (id);


--
-- Name: client_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY client_translations
    ADD CONSTRAINT client_translations_pkey PRIMARY KEY (id);


--
-- Name: clients_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: location_dashboard_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY location_dashboard_translations
    ADD CONSTRAINT location_dashboard_translations_pkey PRIMARY KEY (id);


--
-- Name: location_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY location_dashboards
    ADD CONSTRAINT location_dashboards_pkey PRIMARY KEY (id);


--
-- Name: location_pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY location_pictures
    ADD CONSTRAINT location_pictures_pkey PRIMARY KEY (id);


--
-- Name: location_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY location_translations
    ADD CONSTRAINT location_translations_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: skin_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY skin_translations
    ADD CONSTRAINT skin_translations_pkey PRIMARY KEY (id);


--
-- Name: skins_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY skins
    ADD CONSTRAINT skins_pkey PRIMARY KEY (id);


--
-- Name: team_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY team_translations
    ADD CONSTRAINT team_translations_pkey PRIMARY KEY (id);


--
-- Name: teams_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: user_changes_pkey; Type: CONSTRAINT; Schema: public; Owner: pronto_films; Tablespace: 
--

ALTER TABLE ONLY user_changes
    ADD CONSTRAINT user_changes_pkey PRIMARY KEY (id);


--
-- Name: idx_ckeditor_assetable; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX idx_ckeditor_assetable ON ckeditor_assets USING btree (assetable_type, assetable_id);


--
-- Name: idx_ckeditor_assetable_type; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX idx_ckeditor_assetable_type ON ckeditor_assets USING btree (assetable_type, type, assetable_id);


--
-- Name: index_about_dashboard_translations_on_about_dashboard_id; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_about_dashboard_translations_on_about_dashboard_id ON about_dashboard_translations USING btree (about_dashboard_id);


--
-- Name: index_about_dashboard_translations_on_locale; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_about_dashboard_translations_on_locale ON about_dashboard_translations USING btree (locale);


--
-- Name: index_about_translations_on_about_id; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_about_translations_on_about_id ON about_translations USING btree (about_id);


--
-- Name: index_about_translations_on_locale; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_about_translations_on_locale ON about_translations USING btree (locale);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_email ON admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON admin_users USING btree (reset_password_token);


--
-- Name: index_award_skins_on_award_id; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_award_skins_on_award_id ON award_skins USING btree (award_id);


--
-- Name: index_award_skins_on_skin_id; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_award_skins_on_skin_id ON award_skins USING btree (skin_id);


--
-- Name: index_casting_dashboard_translations_on_casting_dashboard_id; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_casting_dashboard_translations_on_casting_dashboard_id ON casting_dashboard_translations USING btree (casting_dashboard_id);


--
-- Name: index_casting_dashboard_translations_on_locale; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_casting_dashboard_translations_on_locale ON casting_dashboard_translations USING btree (locale);


--
-- Name: index_category_translations_on_category_id; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_category_translations_on_category_id ON category_translations USING btree (category_id);


--
-- Name: index_category_translations_on_locale; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_category_translations_on_locale ON category_translations USING btree (locale);


--
-- Name: index_client_dashboard_translations_on_client_dashboard_id; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_client_dashboard_translations_on_client_dashboard_id ON client_dashboard_translations USING btree (client_dashboard_id);


--
-- Name: index_client_dashboard_translations_on_locale; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_client_dashboard_translations_on_locale ON client_dashboard_translations USING btree (locale);


--
-- Name: index_client_translations_on_client_id; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_client_translations_on_client_id ON client_translations USING btree (client_id);


--
-- Name: index_client_translations_on_locale; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_client_translations_on_locale ON client_translations USING btree (locale);


--
-- Name: index_clients_on_client_dashboard_id; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_clients_on_client_dashboard_id ON clients USING btree (client_dashboard_id);


--
-- Name: index_location_dashboard_translations_on_locale; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_location_dashboard_translations_on_locale ON location_dashboard_translations USING btree (locale);


--
-- Name: index_location_dashboard_translations_on_location_dashboard_id; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_location_dashboard_translations_on_location_dashboard_id ON location_dashboard_translations USING btree (location_dashboard_id);


--
-- Name: index_location_pictures_on_location_id; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_location_pictures_on_location_id ON location_pictures USING btree (location_id);


--
-- Name: index_location_translations_on_locale; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_location_translations_on_locale ON location_translations USING btree (locale);


--
-- Name: index_location_translations_on_location_id; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_location_translations_on_location_id ON location_translations USING btree (location_id);


--
-- Name: index_skin_translations_on_locale; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_skin_translations_on_locale ON skin_translations USING btree (locale);


--
-- Name: index_skin_translations_on_skin_id; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_skin_translations_on_skin_id ON skin_translations USING btree (skin_id);


--
-- Name: index_skins_on_category_id; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_skins_on_category_id ON skins USING btree (category_id);


--
-- Name: index_skins_on_team_id; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_skins_on_team_id ON skins USING btree (team_id);


--
-- Name: index_team_translations_on_locale; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_team_translations_on_locale ON team_translations USING btree (locale);


--
-- Name: index_team_translations_on_team_id; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_team_translations_on_team_id ON team_translations USING btree (team_id);


--
-- Name: index_user_changes_on_admin_user_id; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_user_changes_on_admin_user_id ON user_changes USING btree (admin_user_id);


--
-- Name: index_user_changes_on_tableedit_type_and_tableedit_id; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE INDEX index_user_changes_on_tableedit_type_and_tableedit_id ON user_changes USING btree (tableedit_type, tableedit_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: pronto_films; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

