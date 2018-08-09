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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO edrn;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO edrn;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO edrn;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO edrn;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO edrn;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO edrn;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO edrn;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO edrn;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO edrn;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO edrn;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO edrn;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO edrn;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: ci_protocol_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE ci_protocol_link (
    id integer NOT NULL,
    protocolid integer,
    personid integer
);


ALTER TABLE public.ci_protocol_link OWNER TO edrn;

--
-- Name: ci_protocol_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE ci_protocol_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_protocol_link_id_seq OWNER TO edrn;

--
-- Name: ci_protocol_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE ci_protocol_link_id_seq OWNED BY ci_protocol_link.id;


--
-- Name: collabgroup; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE collabgroup (
    id integer NOT NULL,
    name text,
    description text,
    members text,
    programs text,
    chair text,
    cochair text
);


ALTER TABLE public.collabgroup OWNER TO edrn;

--
-- Name: collabgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE collabgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collabgroup_id_seq OWNER TO edrn;

--
-- Name: collabgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE collabgroup_id_seq OWNED BY collabgroup.id;


--
-- Name: collabgroup_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE collabgroup_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collabgroup_seq OWNER TO edrn;

--
-- Name: committee; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE committee (
    id integer NOT NULL,
    title text,
    abbreviation text,
    description text,
    programs text,
    members text,
    chair text,
    cochair text
);


ALTER TABLE public.committee OWNER TO edrn;

--
-- Name: committee_chair_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE committee_chair_link (
    id integer NOT NULL,
    committeeid integer,
    personid integer
);


ALTER TABLE public.committee_chair_link OWNER TO edrn;

--
-- Name: committee_chair_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE committee_chair_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.committee_chair_link_id_seq OWNER TO edrn;

--
-- Name: committee_chair_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE committee_chair_link_id_seq OWNED BY committee_chair_link.id;


--
-- Name: committee_cochair_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE committee_cochair_link (
    id integer NOT NULL,
    committeeid integer,
    personid integer
);


ALTER TABLE public.committee_cochair_link OWNER TO edrn;

--
-- Name: committee_cochair_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE committee_cochair_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.committee_cochair_link_id_seq OWNER TO edrn;

--
-- Name: committee_cochair_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE committee_cochair_link_id_seq OWNED BY committee_cochair_link.id;


--
-- Name: committee_member_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE committee_member_link (
    id integer NOT NULL,
    committeeid integer,
    personid integer
);


ALTER TABLE public.committee_member_link OWNER TO edrn;

--
-- Name: committee_member_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE committee_member_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.committee_member_link_id_seq OWNER TO edrn;

--
-- Name: committee_member_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE committee_member_link_id_seq OWNED BY committee_member_link.id;


--
-- Name: committee_program_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE committee_program_link (
    id integer NOT NULL,
    committeeid integer,
    programid integer
);


ALTER TABLE public.committee_program_link OWNER TO edrn;

--
-- Name: committee_program_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE committee_program_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.committee_program_link_id_seq OWNER TO edrn;

--
-- Name: committee_program_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE committee_program_link_id_seq OWNED BY committee_program_link.id;


--
-- Name: committee_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE committee_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.committee_seq OWNER TO edrn;

--
-- Name: con_fundedsite_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE con_fundedsite_link (
    id integer NOT NULL,
    fundedsiteid integer,
    personid integer
);


ALTER TABLE public.con_fundedsite_link OWNER TO edrn;

--
-- Name: con_fundedsite_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE con_fundedsite_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.con_fundedsite_link_id_seq OWNER TO edrn;

--
-- Name: con_fundedsite_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE con_fundedsite_link_id_seq OWNED BY con_fundedsite_link.id;


--
-- Name: degree; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE degree (
    id integer NOT NULL,
    title text,
    description text
);


ALTER TABLE public.degree OWNER TO edrn;

--
-- Name: degree_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE degree_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.degree_id_seq OWNER TO edrn;

--
-- Name: degree_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE degree_id_seq OWNED BY degree.id;


--
-- Name: degree_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE degree_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.degree_seq OWNER TO edrn;

--
-- Name: discipline; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE discipline (
    id integer NOT NULL,
    title text,
    description text
);


ALTER TABLE public.discipline OWNER TO edrn;

--
-- Name: discipline_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE discipline_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discipline_seq OWNER TO edrn;

--
-- Name: disease; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE disease (
    id integer NOT NULL,
    icd10 text,
    description text
);


ALTER TABLE public.disease OWNER TO edrn;

--
-- Name: disease_protocol_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE disease_protocol_link (
    id integer NOT NULL,
    diseaseid integer,
    protocolid integer
);


ALTER TABLE public.disease_protocol_link OWNER TO edrn;

--
-- Name: disease_protocol_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE disease_protocol_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disease_protocol_link_id_seq OWNER TO edrn;

--
-- Name: disease_protocol_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE disease_protocol_link_id_seq OWNED BY disease_protocol_link.id;


--
-- Name: disease_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE disease_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disease_seq OWNER TO edrn;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO edrn;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO edrn;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO edrn;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO edrn;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO edrn;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO edrn;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO edrn;

--
-- Name: fundedsite; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE fundedsite (
    id integer NOT NULL,
    description text,
    organs text,
    pis text,
    programs text,
    institutions text,
    staff text,
    status text,
    name text,
    contacts text,
    funding_date_start timestamp without time zone,
    funding_date_finish timestamp without time zone,
    abstract text,
    aims text,
    abbreviation text
);


ALTER TABLE public.fundedsite OWNER TO edrn;

--
-- Name: fundedsite_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE fundedsite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fundedsite_id_seq OWNER TO edrn;

--
-- Name: fundedsite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE fundedsite_id_seq OWNED BY fundedsite.id;


--
-- Name: fundedsite_institution_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE fundedsite_institution_link (
    id integer NOT NULL,
    fundedsiteid integer,
    institutionid integer
);


ALTER TABLE public.fundedsite_institution_link OWNER TO edrn;

--
-- Name: fundedsite_institution_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE fundedsite_institution_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fundedsite_institution_link_id_seq OWNER TO edrn;

--
-- Name: fundedsite_institution_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE fundedsite_institution_link_id_seq OWNED BY fundedsite_institution_link.id;


--
-- Name: fundedsite_organ_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE fundedsite_organ_link (
    id integer NOT NULL,
    fundedsiteid integer,
    organid integer
);


ALTER TABLE public.fundedsite_organ_link OWNER TO edrn;

--
-- Name: fundedsite_organ_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE fundedsite_organ_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fundedsite_organ_link_id_seq OWNER TO edrn;

--
-- Name: fundedsite_organ_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE fundedsite_organ_link_id_seq OWNED BY fundedsite_organ_link.id;


--
-- Name: fundedsite_pi_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE fundedsite_pi_link (
    id integer NOT NULL,
    fundedsiteid integer,
    personid integer
);


ALTER TABLE public.fundedsite_pi_link OWNER TO edrn;

--
-- Name: fundedsite_pi_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE fundedsite_pi_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fundedsite_pi_link_id_seq OWNER TO edrn;

--
-- Name: fundedsite_pi_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE fundedsite_pi_link_id_seq OWNED BY fundedsite_pi_link.id;


--
-- Name: fundedsite_program_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE fundedsite_program_link (
    id integer NOT NULL,
    fundedsiteid integer,
    programid integer
);


ALTER TABLE public.fundedsite_program_link OWNER TO edrn;

--
-- Name: fundedsite_project_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE fundedsite_project_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fundedsite_project_link_id_seq OWNER TO edrn;

--
-- Name: fundedsite_project_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE fundedsite_project_link_id_seq OWNED BY fundedsite_program_link.id;


--
-- Name: fundedsite_protocol_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE fundedsite_protocol_link (
    id integer NOT NULL,
    protocolid integer,
    fundedsiteid integer
);


ALTER TABLE public.fundedsite_protocol_link OWNER TO edrn;

--
-- Name: fundedsite_protocol_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE fundedsite_protocol_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fundedsite_protocol_link_id_seq OWNER TO edrn;

--
-- Name: fundedsite_protocol_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE fundedsite_protocol_link_id_seq OWNED BY fundedsite_protocol_link.id;


--
-- Name: fundedsite_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE fundedsite_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fundedsite_seq OWNER TO edrn;

--
-- Name: fundedsite_staff_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE fundedsite_staff_link (
    id integer NOT NULL,
    fundedsiteid integer,
    personid integer
);


ALTER TABLE public.fundedsite_staff_link OWNER TO edrn;

--
-- Name: fundedsite_staff_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE fundedsite_staff_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fundedsite_staff_link_id_seq OWNER TO edrn;

--
-- Name: fundedsite_staff_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE fundedsite_staff_link_id_seq OWNED BY fundedsite_staff_link.id;


--
-- Name: group_chair_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE group_chair_link (
    id integer NOT NULL,
    groupid integer,
    personid integer
);


ALTER TABLE public.group_chair_link OWNER TO edrn;

--
-- Name: group_chair_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE group_chair_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_chair_link_id_seq OWNER TO edrn;

--
-- Name: group_chair_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE group_chair_link_id_seq OWNED BY group_chair_link.id;


--
-- Name: group_cochair_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE group_cochair_link (
    id integer NOT NULL,
    groupid integer,
    personid integer
);


ALTER TABLE public.group_cochair_link OWNER TO edrn;

--
-- Name: group_cochair_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE group_cochair_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_cochair_link_id_seq OWNER TO edrn;

--
-- Name: group_cochair_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE group_cochair_link_id_seq OWNED BY group_cochair_link.id;


--
-- Name: group_member_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE group_member_link (
    id integer NOT NULL,
    groupid integer,
    personid integer
);


ALTER TABLE public.group_member_link OWNER TO edrn;

--
-- Name: group_member_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE group_member_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_member_link_id_seq OWNER TO edrn;

--
-- Name: group_member_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE group_member_link_id_seq OWNED BY group_member_link.id;


--
-- Name: group_program_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE group_program_link (
    id integer NOT NULL,
    groupid integer,
    programid integer
);


ALTER TABLE public.group_program_link OWNER TO edrn;

--
-- Name: group_program_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE group_program_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_program_link_id_seq OWNER TO edrn;

--
-- Name: group_program_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE group_program_link_id_seq OWNED BY group_program_link.id;


--
-- Name: group_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE group_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_seq OWNER TO edrn;

--
-- Name: input_file_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE input_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.input_file_id_seq OWNER TO edrn;

--
-- Name: institution; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE institution (
    id integer NOT NULL,
    name text,
    department text,
    abbreviation text,
    url text,
    description text,
    personnel text
);


ALTER TABLE public.institution OWNER TO edrn;

--
-- Name: institution_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE institution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.institution_id_seq OWNER TO edrn;

--
-- Name: institution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE institution_id_seq OWNED BY institution.id;


--
-- Name: institution_personnel_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE institution_personnel_link (
    id integer NOT NULL,
    institutionid integer,
    personid integer
);


ALTER TABLE public.institution_personnel_link OWNER TO edrn;

--
-- Name: institution_personnel_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE institution_personnel_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.institution_personnel_link_id_seq OWNER TO edrn;

--
-- Name: institution_personnel_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE institution_personnel_link_id_seq OWNED BY institution_personnel_link.id;


--
-- Name: institution_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE institution_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.institution_seq OWNER TO edrn;

--
-- Name: ksdb_inputfile; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE ksdb_inputfile (
    id bigint NOT NULL,
    filepath text,
    folder integer
);


ALTER TABLE public.ksdb_inputfile OWNER TO edrn;

--
-- Name: ksdb_inputfile_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE ksdb_inputfile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ksdb_inputfile_id_seq OWNER TO edrn;

--
-- Name: ksdb_inputfile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE ksdb_inputfile_id_seq OWNED BY ksdb_inputfile.id;


--
-- Name: organ; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE organ (
    id integer NOT NULL,
    name text,
    description text
);


ALTER TABLE public.organ OWNER TO edrn;

--
-- Name: organ_protocol_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE organ_protocol_link (
    id integer NOT NULL,
    protocolid integer,
    organid integer
);


ALTER TABLE public.organ_protocol_link OWNER TO edrn;

--
-- Name: organ_protocol_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE organ_protocol_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organ_protocol_link_id_seq OWNER TO edrn;

--
-- Name: organ_protocol_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE organ_protocol_link_id_seq OWNED BY organ_protocol_link.id;


--
-- Name: organ_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE organ_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organ_seq OWNER TO edrn;

--
-- Name: person; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE person (
    id integer NOT NULL,
    firstname text,
    lastname text,
    degrees integer,
    email text,
    telephone text,
    description text,
    dcp boolean,
    dcb boolean,
    extension text
);


ALTER TABLE public.person OWNER TO edrn;

--
-- Name: person_degree_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE person_degree_link (
    id integer NOT NULL,
    personid integer,
    degreeid integer
);


ALTER TABLE public.person_degree_link OWNER TO edrn;

--
-- Name: person_degree_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE person_degree_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_degree_link_id_seq OWNER TO edrn;

--
-- Name: person_degree_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE person_degree_link_id_seq OWNED BY person_degree_link.id;


--
-- Name: person_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE person_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_seq OWNER TO edrn;

--
-- Name: pi_protocol_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE pi_protocol_link (
    id integer NOT NULL,
    protocolid integer,
    personid integer
);


ALTER TABLE public.pi_protocol_link OWNER TO edrn;

--
-- Name: pi_protocol_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE pi_protocol_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pi_protocol_link_id_seq OWNER TO edrn;

--
-- Name: pi_protocol_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE pi_protocol_link_id_seq OWNED BY pi_protocol_link.id;


--
-- Name: pi_publication_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE pi_publication_link (
    id integer NOT NULL,
    publicationid integer,
    personid integer
);


ALTER TABLE public.pi_publication_link OWNER TO edrn;

--
-- Name: pi_publication_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE pi_publication_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pi_publication_link_id_seq OWNER TO edrn;

--
-- Name: pi_publication_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE pi_publication_link_id_seq OWNED BY pi_publication_link.id;


--
-- Name: program; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE program (
    id integer NOT NULL,
    title text,
    abbreviation text,
    description text
);


ALTER TABLE public.program OWNER TO edrn;

--
-- Name: program_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE program_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.program_seq OWNER TO edrn;

--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_id_seq OWNER TO edrn;

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE project_id_seq OWNED BY program.id;


--
-- Name: project_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE project_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_seq OWNER TO edrn;

--
-- Name: protocol; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE protocol (
    id integer NOT NULL,
    title text,
    description text,
    organs text,
    pis text,
    start_date timestamp without time zone,
    site_contact text,
    irb_approval text,
    irb_approval_num text,
    irb_contact text,
    hum_sub_train text,
    abstract text,
    shortname text,
    irb_contact_email text,
    site_contact_email text,
    cis text,
    fundedsites text,
    publications text,
    data_custodians text,
    programs text,
    aims text,
    end_date timestamp without time zone
);


ALTER TABLE public.protocol OWNER TO edrn;

--
-- Name: protocol_custodian_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE protocol_custodian_link (
    id integer NOT NULL,
    personid integer,
    protocolid integer
);


ALTER TABLE public.protocol_custodian_link OWNER TO edrn;

--
-- Name: protocol_custodian_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE protocol_custodian_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.protocol_custodian_link_id_seq OWNER TO edrn;

--
-- Name: protocol_custodian_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE protocol_custodian_link_id_seq OWNED BY protocol_custodian_link.id;


--
-- Name: protocol_organ_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE protocol_organ_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.protocol_organ_seq OWNER TO edrn;

--
-- Name: protocol_program_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE protocol_program_link (
    id integer NOT NULL,
    protocolid integer,
    programid integer
);


ALTER TABLE public.protocol_program_link OWNER TO edrn;

--
-- Name: protocol_program_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE protocol_program_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.protocol_program_link_id_seq OWNER TO edrn;

--
-- Name: protocol_program_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE protocol_program_link_id_seq OWNED BY protocol_program_link.id;


--
-- Name: protocol_publication_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE protocol_publication_link (
    id integer NOT NULL,
    publicationid integer,
    protocolid integer
);


ALTER TABLE public.protocol_publication_link OWNER TO edrn;

--
-- Name: protocol_publication_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE protocol_publication_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.protocol_publication_link_id_seq OWNER TO edrn;

--
-- Name: protocol_publication_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE protocol_publication_link_id_seq OWNED BY protocol_publication_link.id;


--
-- Name: protocol_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE protocol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.protocol_seq OWNER TO edrn;

--
-- Name: publication; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE publication (
    id integer NOT NULL,
    title character varying(2000),
    authors text,
    journal text,
    pubyear integer,
    pubmedid text,
    projectid integer,
    programs text
);


ALTER TABLE public.publication OWNER TO edrn;

--
-- Name: publication_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE publication_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publication_id_seq OWNER TO edrn;

--
-- Name: publication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE publication_id_seq OWNED BY publication.id;


--
-- Name: publication_program_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE publication_program_link (
    id integer NOT NULL,
    publicationid integer,
    programid integer
);


ALTER TABLE public.publication_program_link OWNER TO edrn;

--
-- Name: publication_program_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE publication_program_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publication_program_link_id_seq OWNER TO edrn;

--
-- Name: publication_program_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE publication_program_link_id_seq OWNED BY publication_program_link.id;


--
-- Name: publication_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE publication_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publication_seq OWNER TO edrn;

--
-- Name: species; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE species (
    id integer NOT NULL,
    title text,
    description text
);


ALTER TABLE public.species OWNER TO edrn;

--
-- Name: species_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE species_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_seq OWNER TO edrn;

--
-- Name: specimentype; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE specimentype (
    id integer NOT NULL,
    title text,
    description text,
    organs text
);


ALTER TABLE public.specimentype OWNER TO edrn;

--
-- Name: specimentype_organ_link; Type: TABLE; Schema: public; Owner: edrn; Tablespace: 
--

CREATE TABLE specimentype_organ_link (
    id integer NOT NULL,
    specimentypeid integer,
    organid integer
);


ALTER TABLE public.specimentype_organ_link OWNER TO edrn;

--
-- Name: specimentype_organ_link_id_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE specimentype_organ_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.specimentype_organ_link_id_seq OWNER TO edrn;

--
-- Name: specimentype_organ_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edrn
--

ALTER SEQUENCE specimentype_organ_link_id_seq OWNED BY specimentype_organ_link.id;


--
-- Name: specimentype_seq; Type: SEQUENCE; Schema: public; Owner: edrn
--

CREATE SEQUENCE specimentype_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.specimentype_seq OWNER TO edrn;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY ci_protocol_link ALTER COLUMN id SET DEFAULT nextval('ci_protocol_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY collabgroup ALTER COLUMN id SET DEFAULT nextval('collabgroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY committee_chair_link ALTER COLUMN id SET DEFAULT nextval('committee_chair_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY committee_cochair_link ALTER COLUMN id SET DEFAULT nextval('committee_cochair_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY committee_member_link ALTER COLUMN id SET DEFAULT nextval('committee_member_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY committee_program_link ALTER COLUMN id SET DEFAULT nextval('committee_program_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY con_fundedsite_link ALTER COLUMN id SET DEFAULT nextval('con_fundedsite_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY degree ALTER COLUMN id SET DEFAULT nextval('degree_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY disease_protocol_link ALTER COLUMN id SET DEFAULT nextval('disease_protocol_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY fundedsite ALTER COLUMN id SET DEFAULT nextval('fundedsite_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY fundedsite_institution_link ALTER COLUMN id SET DEFAULT nextval('fundedsite_institution_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY fundedsite_organ_link ALTER COLUMN id SET DEFAULT nextval('fundedsite_organ_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY fundedsite_pi_link ALTER COLUMN id SET DEFAULT nextval('fundedsite_pi_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY fundedsite_program_link ALTER COLUMN id SET DEFAULT nextval('fundedsite_project_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY fundedsite_protocol_link ALTER COLUMN id SET DEFAULT nextval('fundedsite_protocol_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY fundedsite_staff_link ALTER COLUMN id SET DEFAULT nextval('fundedsite_staff_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY group_chair_link ALTER COLUMN id SET DEFAULT nextval('group_chair_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY group_cochair_link ALTER COLUMN id SET DEFAULT nextval('group_cochair_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY group_member_link ALTER COLUMN id SET DEFAULT nextval('group_member_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY group_program_link ALTER COLUMN id SET DEFAULT nextval('group_program_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY institution ALTER COLUMN id SET DEFAULT nextval('institution_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY institution_personnel_link ALTER COLUMN id SET DEFAULT nextval('institution_personnel_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY ksdb_inputfile ALTER COLUMN id SET DEFAULT nextval('ksdb_inputfile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY organ_protocol_link ALTER COLUMN id SET DEFAULT nextval('organ_protocol_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY person_degree_link ALTER COLUMN id SET DEFAULT nextval('person_degree_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY pi_protocol_link ALTER COLUMN id SET DEFAULT nextval('pi_protocol_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY pi_publication_link ALTER COLUMN id SET DEFAULT nextval('pi_publication_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY program ALTER COLUMN id SET DEFAULT nextval('project_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY protocol_custodian_link ALTER COLUMN id SET DEFAULT nextval('protocol_custodian_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY protocol_program_link ALTER COLUMN id SET DEFAULT nextval('protocol_program_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY protocol_publication_link ALTER COLUMN id SET DEFAULT nextval('protocol_publication_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY publication ALTER COLUMN id SET DEFAULT nextval('publication_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY publication_program_link ALTER COLUMN id SET DEFAULT nextval('publication_program_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY specimentype_organ_link ALTER COLUMN id SET DEFAULT nextval('specimentype_organ_link_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add protocol	7	add_protocol
20	Can change protocol	7	change_protocol
21	Can delete protocol	7	delete_protocol
22	Can add protocol_sitecon_link	8	add_protocol_sitecon_link
23	Can change protocol_sitecon_link	8	change_protocol_sitecon_link
24	Can delete protocol_sitecon_link	8	delete_protocol_sitecon_link
25	Can add protocol_irbcon_link	9	add_protocol_irbcon_link
26	Can change protocol_irbcon_link	9	change_protocol_irbcon_link
27	Can delete protocol_irbcon_link	9	delete_protocol_irbcon_link
28	Can add pi_protocol_link	10	add_pi_protocol_link
29	Can change pi_protocol_link	10	change_pi_protocol_link
30	Can delete pi_protocol_link	10	delete_pi_protocol_link
31	Can add organ	11	add_organ
32	Can change organ	11	change_organ
33	Can delete organ	11	delete_organ
34	Can add organ_protocol_link	12	add_organ_protocol_link
35	Can change organ_protocol_link	12	change_organ_protocol_link
36	Can delete organ_protocol_link	12	delete_organ_protocol_link
37	Can add person	13	add_person
38	Can change person	13	change_person
39	Can delete person	13	delete_person
40	Can add project	14	add_project
41	Can change project	14	change_project
42	Can delete project	14	delete_project
43	Can add institution	15	add_institution
44	Can change institution	15	change_institution
45	Can delete institution	15	delete_institution
46	Can add institution_personnel_link	16	add_institution_personnel_link
47	Can change institution_personnel_link	16	change_institution_personnel_link
48	Can delete institution_personnel_link	16	delete_institution_personnel_link
49	Can add publication	17	add_publication
50	Can change publication	17	change_publication
51	Can delete publication	17	delete_publication
52	Can add publication_author_link	18	add_publication_author_link
53	Can change publication_author_link	18	change_publication_author_link
54	Can delete publication_author_link	18	delete_publication_author_link
55	Can add fundedsite	19	add_fundedsite
56	Can change fundedsite	19	change_fundedsite
57	Can delete fundedsite	19	delete_fundedsite
58	Can add fundedsite_pi_link	20	add_fundedsite_pi_link
59	Can change fundedsite_pi_link	20	change_fundedsite_pi_link
60	Can delete fundedsite_pi_link	20	delete_fundedsite_pi_link
61	Can add fundedsite_staff_link	21	add_fundedsite_staff_link
62	Can change fundedsite_staff_link	21	change_fundedsite_staff_link
63	Can delete fundedsite_staff_link	21	delete_fundedsite_staff_link
64	Can add fundedsite_organ_link	22	add_fundedsite_organ_link
65	Can change fundedsite_organ_link	22	change_fundedsite_organ_link
66	Can delete fundedsite_organ_link	22	delete_fundedsite_organ_link
67	Can add fundedsite_project_link	23	add_fundedsite_project_link
68	Can change fundedsite_project_link	23	change_fundedsite_project_link
69	Can delete fundedsite_project_link	23	delete_fundedsite_project_link
70	Can add fundedsite_institution_link	24	add_fundedsite_institution_link
71	Can change fundedsite_institution_link	24	change_fundedsite_institution_link
72	Can delete fundedsite_institution_link	24	delete_fundedsite_institution_link
73	Can add degree	25	add_degree
74	Can change degree	25	change_degree
75	Can delete degree	25	delete_degree
76	Can add person_degree_link	26	add_person_degree_link
77	Can change person_degree_link	26	change_person_degree_link
78	Can delete person_degree_link	26	delete_person_degree_link
79	Can add id seq	27	add_idseq
80	Can change id seq	27	change_idseq
81	Can delete id seq	27	delete_idseq
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('auth_permission_id_seq', 81, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	!v7ijXdg0fWiSa8Nmmxa77TblmnA4ojH0PiTXi2Db	2016-09-24 15:38:29.060514-07	f	dliu				f	t	2016-09-24 15:08:54.474301-07
1	pbkdf2_sha256$20000$pELryziiesAi$mpGPHGVL9gASU935ZaOnud1q0XkwaOHSa30E5Qqa/R4=	2018-07-30 20:55:00.216107-07	t	edrn			david.liu@jpl.nasa.gov	t	t	2016-07-26 11:23:51.504657-07
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: ci_protocol_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY ci_protocol_link (id, protocolid, personid) FROM stdin;
7	1	167
8	1	317
16	10	6
23	3	944
\.


--
-- Name: ci_protocol_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('ci_protocol_link_id_seq', 23, true);


--
-- Data for Name: collabgroup; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY collabgroup (id, name, description, members, programs, chair, cochair) FROM stdin;
8	Lung and Upper Aerodigestive		1275:Wilbur A. Frankin	2	\N	\N
10	Imaging Working Group	The objectives of the Imaging Working Group are the following: reduce variance in image acquisition and reconstruction across the consortium; establish a mechanism for scrubbing and uploading image data files to a common (or federated) archive; develop guidelines for annotating and curating images; establish common data elementsIn addition to the MCL imaging investigators, members from the CDMG, staff from NCI Program and CBIIT, and the Informatics Center at JPL, as well as invited investigators external to the MCL Consortium may participate in this working group. The composition of the group should reflect projects that have core imaging components as part of their objectives, as well as projects in which imaging may become an important element.	1294:Spencer Behr, 854:James Brooks, 1331:Sally Herschorn, 621:Kim Kirkwood, 1268:Eugene Koay, 1310:Nastaran Kuhn, 187:Richard Mazurchuk, 1321:Viswarm Nair, 1303:Jennifer Permuth, 1281:Max Schmidt, 1295:Laura Van't Veer, 23:Ronald Walker, 1271:Michelle Yip-Schneider, 1342:Edward Schaeffer	1		
11	Methodology Working Group	The MCL Methodology Working group is focused on the development of new biostatistical and bioinformatics approaches relevant to evaluating the conduct of studies to identify biomarkers relevant to screen detected cancers and to establishing the reliability and interpretation of such findings. The MCL methodology group works with the steering committee of the MCL and with its PIs to establish key areas of interest. Operationally, the MCL methodology working group will focus on specific key questions relevant to the conduct of studies relevant to MCL.	1279:Eugene Demidenko, 1332:Julie Dragon, 1141:Ziding Feng, 1285:Elana Fertig, 1308:Ron Johnson, 1282:Luigi Marchionni, 356:Christos Patriotis, 1302:Matt Schabath, 1292:Yiwey Shieh, 1340:Yu Shyr, 1280:Tor Tosteson, 110:Bruce Trock, 1333:Pam Vacek, 1286:Sarah Wheelan	1		
12	Pathology and Antibodies Working Group	The overarching objective of the Pathology Working Group is to prospectively classify screen- detected cancers at biopsy which are non-lethal. Recognizing that this is likely to involve combined data from genomics and immunology assays, the MCL Pathology WG aims to bring consistency to methodology and analysis criteria to compare and integrate data among MCL laboratories.	1263:Angelo DeMarzo, 1059:Steve Dubinett, 1336:Rosana Eisenburg, 1334:Mark Evans, 613:Anirban Maitra, 524:Pierre Massion, 1292:Yiwey Shieh, 351:Lynn Sorbara, 1313:Mark Valasek, 1296:Scott VandenBerg, 1323:Tonya Walser, 1328:Donald Weaver, 1306:Elizabeth Woodhouse, 1324:Haodong Xu, 1274:Robert D. Cardiff	1		
9	Genomics and Genotyping Working Group	The objective of the MCL Genomics Working Group is to address issues that impact on the sharing and integration of genomics data across the MCL consortium (and to outside interests). Each MCL site should designate two members for the Genomics Working Group, however, any Consortium member and NCI staff with interest in the genomics area is welcome to join.	1059:Steve Dubinett, 1320:Max Diehn, 1169:Laura Esserman, 1285:Elana Fertig, 1289:Matthew Firpo, 1330:Jonathan Gordon, 1291:Gillian Hirst, 538:Jacob Kagan, 1307:Jerry Li, 613:Anirban Maitra, 1282:Luigi Marchionni, 524:Pierre Massion, 1304:Charles  Powell, 259:Subrata Sen, 1301:Yu Shen, 1292:Yiwey Shieh, 110:Bruce Trock, 1286:Sarah Wheelan, 1293:Christina Yau, 1267:Srinivasan Yegnasubramanian	1		
5	Steering Committee	The Steering Committee (SC) has the responsibility for the scientific management and oversight of all Consortium activities. This includes research prioritization, research community outreach, information flow optimization and facilitation of resource development and sharing. Details on the structure of the joint activities/responsibilities of the SC are provided in Section VI. 2. Cooperative Agreement Terms and Conditions (RFA-CA-14-010 and RFA-CA-14-011).According to the requirements of the Cooperative Agreement, the SC meets as necessary to conduct the business of the MCL, typically, once a month via teleconference. Additionally, there are two face-to-face SC business meetings per year that MCL members are expected to attend; additional meetings may be scheduled as needed. The time and site for these meetings are determined by SC members. Principal Investigator(s) from each Cooperative Agreement are required to attend at least one in-person SC meeting each year. However, there should be at least one qualified representative (the PI, Multi-PI or Co-Investigator) from each Cooperative Agreement at every SC meeting. The minutes of the SC meetings are prepared by the CDMG and distributed to the members of the SC for approval at the next SC meeting.The qualified representatives (one per U01) and the NCI Program Coordinators will serve as voting members of the Steering Committee.	7:Christopher Amos, 1263:Angelo DeMarzo, 1059:Steve Dubinett, 613:Anirban Maitra, 524:Pierre Massion, 1264:Kenneth Pienta, 101:Sudhir Srivastava, 1327:Janet Stein, 1306:Elizabeth Woodhouse, 890:Sharmistha Ghosh-Janjigian, 1309:Jeffery Hildesheim, 1308:Ron Johnson, 538:Jacob Kagan, 1307:Jerry Li, 356:Christos Patriotis, 351:Lynn Sorbara	1		
6	Data, Informatics and Resource Sharing Subcommittee	The objective of the Data, Informatics and Resource Sharing Subcommittee is to establish the rationale and conditions for sharing technology, data and other resources among investigators within and external to the MCL Consortium. Other objectives of the Subcommittee are to establish guidelines for the MCL data structure and common data elements, and to provide a forum for biostatisticians/analysts within MCL to collaborate on research pertinent to MCL.In addition to MCL PIs, members of the CDMG, and staff from CBIIT and the Informatics Center at JPL will participate on this subcommittee.	1266:Alex Baras, 10:Daniel Crichton, 1276:Judith Forman, 1309:Jeffery Hildesheim, 890:Sharmistha Ghosh-Janjigian, 538:Jacob Kagan, 1:Sean Kelly, 6:Heather Kincaid, 356:Christos Patriotis, 1278:Steven Pyle, 351:Lynn Sorbara, 101:Sudhir Srivastava, 1306:Elizabeth Woodhouse, 1170:Maureen Colbert	1		
\.


--
-- Name: collabgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('collabgroup_id_seq', 1, false);


--
-- Name: collabgroup_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('collabgroup_seq', 1, false);


--
-- Data for Name: committee; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY committee (id, title, abbreviation, description, programs, members, chair, cochair) FROM stdin;
1	Steering Committee	SC	The Steering Committee (SC) has the responsibility for the scientific management and oversight of all Consortium activities. This includes research prioritization, research community outreach, information flow optimization and facilitation of resource development and sharing. Details on the structure of the joint activities/responsibilities of the SC are provided in Section VI. 2. Cooperative Agreement Terms and Conditions (RFA-CA-14-010 and RFA-CA-14-011).According to the requirements of the Cooperative Agreement, the SC meets as necessary to conduct the business of the MCL, typically, once a month via teleconference. Additionally, there are two face-to-face SC business meetings per year that MCL members are expected to attend; additional meetings may be scheduled as needed. The time and site for these meetings are determined by SC members. Principal Investigator(s) from each Cooperative Agreement are required to attend at least one in-person SC meeting each year. However, there should be at least one qualified representative (the PI, Multi-PI or Co-Investigator) from each Cooperative Agreement at every SC meeting. The minutes of the SC meetings are prepared by the CDMG and distributed to the members of the SC for approval at the next SC meeting.The qualified representatives (one per U01) and the NCI Program Coordinators will serve as voting members of the Steering Committee.	1	7:Christopher Amos, 1263:Angelo DeMarzo, 1059:Steve Dubinett, 613:Anirban Maitra, 524:Pierre Massion, 1264:Kenneth Pienta, 101:Sudhir Srivastava, 1327:Janet Stein, 1306:Elizabeth Woodhouse, 890:Sharmistha Ghosh-Janjigian, 1309:Jeffery Hildesheim, 1308:Ron Johnson, 538:Jacob Kagan, 1307:Jerry Li, 356:Christos Patriotis, 351:Lynn Sorbara		
\.


--
-- Data for Name: committee_chair_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY committee_chair_link (id, committeeid, personid) FROM stdin;
1	1	854
\.


--
-- Name: committee_chair_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('committee_chair_link_id_seq', 1, true);


--
-- Data for Name: committee_cochair_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY committee_cochair_link (id, committeeid, personid) FROM stdin;
1	1	1169
\.


--
-- Name: committee_cochair_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('committee_cochair_link_id_seq', 1, true);


--
-- Data for Name: committee_member_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY committee_member_link (id, committeeid, personid) FROM stdin;
1	1	7
2	1	1263
3	1	1059
4	1	613
5	1	524
6	1	1264
7	1	101
8	1	1327
9	1	1306
10	1	890
11	1	1309
12	1	1308
13	1	538
14	1	1307
15	1	356
16	1	351
\.


--
-- Name: committee_member_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('committee_member_link_id_seq', 16, true);


--
-- Data for Name: committee_program_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY committee_program_link (id, committeeid, programid) FROM stdin;
2	1	1
\.


--
-- Name: committee_program_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('committee_program_link_id_seq', 2, true);


--
-- Name: committee_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('committee_seq', 1, true);


--
-- Data for Name: con_fundedsite_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY con_fundedsite_link (id, fundedsiteid, personid) FROM stdin;
11	3	6
12	3	10
\.


--
-- Name: con_fundedsite_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('con_fundedsite_link_id_seq', 12, true);


--
-- Data for Name: degree; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY degree (id, title, description) FROM stdin;
6	BS	Bachelor of Science
8	PhD	Doctor of Philosophy
9	MD	Doctor of Medicine
10	MS	Master of Science
27	MBA	Masters of Business Administration
28	MPH	Master of Public Health
29	MA	Master of Arts
30	MHSA	Master of Health Services Administration
31	DO	Doctor of Osteopathic Medicine
32	ScD	Doctor of Science
\.


--
-- Name: degree_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('degree_id_seq', 1, false);


--
-- Name: degree_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('degree_seq', 32, true);


--
-- Data for Name: discipline; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY discipline (id, title, description) FROM stdin;
1	Genomics	
2	Proteomics	
3	Pathology	The analysis of blood, urine and tissue samples to examine and diagnose disease
4	Radiology	A variety of imaging techniques such as X-ray radiography, ultrasound, computed tomography (CT), nuclear medicine including positron emission tomography (PET), and magnetic resonance imaging (MRI) are used to diagnose and/or treat diseases.
\.


--
-- Name: discipline_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('discipline_seq', 4, true);


--
-- Data for Name: disease; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY disease (id, icd10, description) FROM stdin;
2	Diseases of the respiratory system	Diseases involved with respiratory system.
\.


--
-- Data for Name: disease_protocol_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY disease_protocol_link (id, diseaseid, protocolid) FROM stdin;
\.


--
-- Name: disease_protocol_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('disease_protocol_link_id_seq', 1, false);


--
-- Name: disease_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('disease_seq', 2, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	ksdb	protocol
8	ksdb	protocol_sitecon_link
9	ksdb	protocol_irbcon_link
10	ksdb	pi_protocol_link
11	ksdb	organ
12	ksdb	organ_protocol_link
13	ksdb	person
14	ksdb	project
15	ksdb	institution
16	ksdb	institution_personnel_link
17	ksdb	publication
18	ksdb	publication_author_link
19	ksdb	fundedsite
20	ksdb	fundedsite_pi_link
21	ksdb	fundedsite_staff_link
22	ksdb	fundedsite_organ_link
23	ksdb	fundedsite_project_link
24	ksdb	fundedsite_institution_link
25	ksdb	degree
26	ksdb	person_degree_link
27	ksdb	idseq
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('django_content_type_id_seq', 27, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-07-26 11:23:32.421942-07
2	auth	0001_initial	2016-07-26 11:23:32.623316-07
3	admin	0001_initial	2016-07-26 11:23:32.718144-07
4	admin	0002_logentry_remove_auto_add	2016-07-26 11:23:32.763179-07
5	contenttypes	0002_remove_content_type_name	2016-07-26 11:23:32.880049-07
6	auth	0002_alter_permission_name_max_length	2016-07-26 11:23:32.922742-07
7	auth	0003_alter_user_email_max_length	2016-07-26 11:23:32.965966-07
8	auth	0004_alter_user_username_opts	2016-07-26 11:23:33.009611-07
9	auth	0005_alter_user_last_login_null	2016-07-26 11:23:33.054578-07
10	auth	0006_require_contenttypes_0002	2016-07-26 11:23:33.060068-07
11	auth	0007_alter_validators_add_error_messages	2016-07-26 11:23:33.101455-07
12	sessions	0001_initial	2016-07-26 11:23:33.132158-07
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('django_migrations_id_seq', 12, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
63nb0fc0lbiubw4dnv65hkyxvsn0sjcy	Mzg5Y2M2NmE4NzY1MjkwNWZkMWVlMDFmNjVhYzEwYTZiNzBkMTlmNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODVjOTU1NDJkNDYyNmJmYzE2MGU0MjIzNGYzOWJlZTRhZTExMDgxOCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-11-18 08:30:26.505869-08
i7di2vgdpa9pxdi0jauerhwh65i368zs	MmFkYjI4OTRkYTlhYTQ1NTU5MGQ2Y2UyNWIwY2I4NzI3MTVhYWU2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU2MjY4MmE5Y2VjZjQ3ZTg1YTIxODhjOTlmMDE0ODIzZGJmYWYxNDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-09 11:34:06.153642-07
ovom9gg78n6wv6kiyfjthlf4n4gxk1me	MmFkYjI4OTRkYTlhYTQ1NTU5MGQ2Y2UyNWIwY2I4NzI3MTVhYWU2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU2MjY4MmE5Y2VjZjQ3ZTg1YTIxODhjOTlmMDE0ODIzZGJmYWYxNDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-11 12:54:18.217805-07
hghhgzt02esvlc18maqcofc573b4fi2u	ZWI0YmIxNWUwYjZjYTYzODliOGI5YWIwMWRkYjJkNmM4ZjFjMmJjNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI4NWM5NTU0MmQ0NjI2YmZjMTYwZTQyMjM0ZjM5YmVlNGFlMTEwODE4In0=	2016-12-13 00:03:47.794147-08
dgx8q11wft7axwst8cv7v2j3cxdjvj46	ZWI0YmIxNWUwYjZjYTYzODliOGI5YWIwMWRkYjJkNmM4ZjFjMmJjNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI4NWM5NTU0MmQ0NjI2YmZjMTYwZTQyMjM0ZjM5YmVlNGFlMTEwODE4In0=	2016-12-13 05:05:47.893931-08
em73uie4e2v3b5g742ezdfnk1y16mt27	ZWI0YmIxNWUwYjZjYTYzODliOGI5YWIwMWRkYjJkNmM4ZjFjMmJjNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI4NWM5NTU0MmQ0NjI2YmZjMTYwZTQyMjM0ZjM5YmVlNGFlMTEwODE4In0=	2016-12-25 17:50:50.137107-08
hq0whik8ql7884vbi1u9lnwwbfpioh41	MmFkYjI4OTRkYTlhYTQ1NTU5MGQ2Y2UyNWIwY2I4NzI3MTVhYWU2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU2MjY4MmE5Y2VjZjQ3ZTg1YTIxODhjOTlmMDE0ODIzZGJmYWYxNDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-25 19:15:06.76951-07
h7071j4mhiv2jj2mj3oi0rpq5wj2agrr	MmFkYjI4OTRkYTlhYTQ1NTU5MGQ2Y2UyNWIwY2I4NzI3MTVhYWU2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU2MjY4MmE5Y2VjZjQ3ZTg1YTIxODhjOTlmMDE0ODIzZGJmYWYxNDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-25 19:40:49.377512-07
fu9ois6wsjlt4tpas8s7e716je59snxe	Mzg5Y2M2NmE4NzY1MjkwNWZkMWVlMDFmNjVhYzEwYTZiNzBkMTlmNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODVjOTU1NDJkNDYyNmJmYzE2MGU0MjIzNGYzOWJlZTRhZTExMDgxOCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-12-28 22:39:07.530799-08
qbhj43p21zw5jwgznjzqkv35rdliwdfk	MmFkYjI4OTRkYTlhYTQ1NTU5MGQ2Y2UyNWIwY2I4NzI3MTVhYWU2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU2MjY4MmE5Y2VjZjQ3ZTg1YTIxODhjOTlmMDE0ODIzZGJmYWYxNDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-09-02 10:18:57.892173-07
uyn51y3snw1v58npbi54t1ci9ytwni3x	MmFkYjI4OTRkYTlhYTQ1NTU5MGQ2Y2UyNWIwY2I4NzI3MTVhYWU2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU2MjY4MmE5Y2VjZjQ3ZTg1YTIxODhjOTlmMDE0ODIzZGJmYWYxNDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-09-02 10:58:41.630262-07
bbxolwuxmp3f74rrrilrt4yp5tdtshnp	MmFkYjI4OTRkYTlhYTQ1NTU5MGQ2Y2UyNWIwY2I4NzI3MTVhYWU2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU2MjY4MmE5Y2VjZjQ3ZTg1YTIxODhjOTlmMDE0ODIzZGJmYWYxNDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-09-29 14:29:27.961603-07
339futr3wlp6zvh7vvag2pp7dcgqh36r	ZWI0YmIxNWUwYjZjYTYzODliOGI5YWIwMWRkYjJkNmM4ZjFjMmJjNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI4NWM5NTU0MmQ0NjI2YmZjMTYwZTQyMjM0ZjM5YmVlNGFlMTEwODE4In0=	2017-01-23 22:54:04.755006-08
k93gm2wntb1qfm2wlm4znwtnauer9ljw	Mzg5Y2M2NmE4NzY1MjkwNWZkMWVlMDFmNjVhYzEwYTZiNzBkMTlmNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODVjOTU1NDJkNDYyNmJmYzE2MGU0MjIzNGYzOWJlZTRhZTExMDgxOCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-02-06 11:25:51.457505-08
08nyewbq7z5n1oedv9w7mzia5ejknvwn	ZWI0YmIxNWUwYjZjYTYzODliOGI5YWIwMWRkYjJkNmM4ZjFjMmJjNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI4NWM5NTU0MmQ0NjI2YmZjMTYwZTQyMjM0ZjM5YmVlNGFlMTEwODE4In0=	2017-02-12 15:35:14.163681-08
qiqrx4e6zwr3wmvxni35k9myp3et7nlz	OGE5ZThiMjM2YWNiOWZlYjBiMTk3MDgxOTUyYTA1ZTE2YTVlMjhiNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiODVjOTU1NDJkNDYyNmJmYzE2MGU0MjIzNGYzOWJlZTRhZTExMDgxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-02-22 14:00:06.813348-08
8yv9km32qlhgw1ov838i3ozbi2b74dy9	YzQ5ZjRmYmY1ZTdkODgzMzc2OWE3NDU2MTIwMzZiOWNhYWQ0NzExNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMzMDk1OTljYjI5N2E1ZjI2ZWU5NWE5MjYwZTFhNjlhMGFjNTZjYWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ29fYXV0aF9sZGFwLmJhY2tlbmQuTERBUEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2016-10-08 15:38:29.06531-07
w9js1yywlt174vsrty1b6hfnmx832npp	MmFkYjI4OTRkYTlhYTQ1NTU5MGQ2Y2UyNWIwY2I4NzI3MTVhYWU2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU2MjY4MmE5Y2VjZjQ3ZTg1YTIxODhjOTlmMDE0ODIzZGJmYWYxNDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-10-26 11:46:15.430009-07
lx2ejnvlhjv0g5is7k6hyzizbny2j9hu	Mzg5Y2M2NmE4NzY1MjkwNWZkMWVlMDFmNjVhYzEwYTZiNzBkMTlmNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODVjOTU1NDJkNDYyNmJmYzE2MGU0MjIzNGYzOWJlZTRhZTExMDgxOCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-03-01 09:03:10.445604-08
qqrd0b9ub646sq12s4qr7y782dgcei7q	MDA0MzQyM2I0OThhMDQ2NDE1NTBhY2U0NzFiYTY5YzJjMDBmYjQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZhY2UyNDZlNmUzYjZhNGZiNzU4NWE3MGIxMWEyYjIxMjM3MDVjMDEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-11-09 21:43:07.594446-08
r5dpdunus5upshcyc5kap1aksbx6e330	MDA0MzQyM2I0OThhMDQ2NDE1NTBhY2U0NzFiYTY5YzJjMDBmYjQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZhY2UyNDZlNmUzYjZhNGZiNzU4NWE3MGIxMWEyYjIxMjM3MDVjMDEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-11-09 21:44:49.206749-08
wnzev4t79w9uh3bw90psajvwnbl2m9xj	MDA0MzQyM2I0OThhMDQ2NDE1NTBhY2U0NzFiYTY5YzJjMDBmYjQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZhY2UyNDZlNmUzYjZhNGZiNzU4NWE3MGIxMWEyYjIxMjM3MDVjMDEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-11-09 21:46:32.818948-08
2xxr0uid18xoz4jtun0ekhwjlzmbn848	Mzg5Y2M2NmE4NzY1MjkwNWZkMWVlMDFmNjVhYzEwYTZiNzBkMTlmNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODVjOTU1NDJkNDYyNmJmYzE2MGU0MjIzNGYzOWJlZTRhZTExMDgxOCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-11-14 16:24:54.696199-08
y8e6fedsnlp3dqfyf6tfo7hw2vy6vkut	Mzg5Y2M2NmE4NzY1MjkwNWZkMWVlMDFmNjVhYzEwYTZiNzBkMTlmNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODVjOTU1NDJkNDYyNmJmYzE2MGU0MjIzNGYzOWJlZTRhZTExMDgxOCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-11-15 08:09:51.334644-08
x1po1z8upu6j4zma4wdnened79gcqhdp	MDViNGExNjM2NTdhZDlhMjI1MjI2NDFmMjZlMjI4YTM5ZTRhMmVkNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NWM5NTU0MmQ0NjI2YmZjMTYwZTQyMjM0ZjM5YmVlNGFlMTEwODE4In0=	2017-03-06 15:18:06.421364-08
zakbgyntxg07qrvplv0hpju16c31d3ty	Mzg5Y2M2NmE4NzY1MjkwNWZkMWVlMDFmNjVhYzEwYTZiNzBkMTlmNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODVjOTU1NDJkNDYyNmJmYzE2MGU0MjIzNGYzOWJlZTRhZTExMDgxOCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-03-08 23:35:15.349993-08
7b5fszncg6ipuc43wwsnece2tncifjk1	OGE5ZThiMjM2YWNiOWZlYjBiMTk3MDgxOTUyYTA1ZTE2YTVlMjhiNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiODVjOTU1NDJkNDYyNmJmYzE2MGU0MjIzNGYzOWJlZTRhZTExMDgxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-03-16 11:59:33.106778-07
y56jrfqjpdl1d3505rfygkueqfd1h9et	MDViNGExNjM2NTdhZDlhMjI1MjI2NDFmMjZlMjI4YTM5ZTRhMmVkNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NWM5NTU0MmQ0NjI2YmZjMTYwZTQyMjM0ZjM5YmVlNGFlMTEwODE4In0=	2017-03-16 16:20:09.491462-07
t1kv7at954dvehvucnl161wosli19xfy	MGYzYjMzZjIzNzc2ZTQ1ZWM3YTExZjczNjEzOTQyNTJjNGU4YjYzOTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg1Yzk1NTQyZDQ2MjZiZmMxNjBlNDIyMzRmMzliZWU0YWUxMTA4MTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-03-20 20:05:53.511577-07
ezcmm6haezvnqqcot7kvqp75kgq7zghy	YmIxOWZkNTFiZDI5Y2Y5ZTAxZDgxNmFkZWRmOTA1MDdjOTc4ZWQ0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg1Yzk1NTQyZDQ2MjZiZmMxNjBlNDIyMzRmMzliZWU0YWUxMTA4MTgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-03-23 08:22:09.988383-07
pkz340t0y3q5ux8gx53gxfijfy324j7w	YmIxOWZkNTFiZDI5Y2Y5ZTAxZDgxNmFkZWRmOTA1MDdjOTc4ZWQ0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg1Yzk1NTQyZDQ2MjZiZmMxNjBlNDIyMzRmMzliZWU0YWUxMTA4MTgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-03-23 09:52:12.70877-07
nvaxhbu3ecr746lu4svj8eexvqf8ea4m	MDViNGExNjM2NTdhZDlhMjI1MjI2NDFmMjZlMjI4YTM5ZTRhMmVkNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NWM5NTU0MmQ0NjI2YmZjMTYwZTQyMjM0ZjM5YmVlNGFlMTEwODE4In0=	2017-03-27 09:55:10.324034-07
ff7093zxdefigvjalfrlan0c8jqt45iv	MDViNGExNjM2NTdhZDlhMjI1MjI2NDFmMjZlMjI4YTM5ZTRhMmVkNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NWM5NTU0MmQ0NjI2YmZjMTYwZTQyMjM0ZjM5YmVlNGFlMTEwODE4In0=	2017-03-28 10:40:34.480764-07
whwvqkxnhjcbd7nmp6l7vy0y7gy13q9t	MGYzYjMzZjIzNzc2ZTQ1ZWM3YTExZjczNjEzOTQyNTJjNGU4YjYzOTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg1Yzk1NTQyZDQ2MjZiZmMxNjBlNDIyMzRmMzliZWU0YWUxMTA4MTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-04-03 09:59:08.773852-07
10lnpkwfd8q6uj74u3lhse5xs2032mi1	MGYzYjMzZjIzNzc2ZTQ1ZWM3YTExZjczNjEzOTQyNTJjNGU4YjYzOTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg1Yzk1NTQyZDQ2MjZiZmMxNjBlNDIyMzRmMzliZWU0YWUxMTA4MTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-04-03 20:20:13.552241-07
j74xl39ck45n0pyl26nkp8mdt5kzitjw	MGYzYjMzZjIzNzc2ZTQ1ZWM3YTExZjczNjEzOTQyNTJjNGU4YjYzOTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg1Yzk1NTQyZDQ2MjZiZmMxNjBlNDIyMzRmMzliZWU0YWUxMTA4MTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-04-04 10:27:43.851621-07
mxuys78ll2slvjqcvu81n7y8e6t5aodr	MGYzYjMzZjIzNzc2ZTQ1ZWM3YTExZjczNjEzOTQyNTJjNGU4YjYzOTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg1Yzk1NTQyZDQ2MjZiZmMxNjBlNDIyMzRmMzliZWU0YWUxMTA4MTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-04-05 09:39:50.687812-07
45tn7zrutdnk5ny6q1ovcumirya4y5yz	ZWI0YmIxNWUwYjZjYTYzODliOGI5YWIwMWRkYjJkNmM4ZjFjMmJjNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI4NWM5NTU0MmQ0NjI2YmZjMTYwZTQyMjM0ZjM5YmVlNGFlMTEwODE4In0=	2017-04-06 08:33:06.469029-07
cr3lfmw507l6vj8zgyz69llise86v7v5	ZWI0YmIxNWUwYjZjYTYzODliOGI5YWIwMWRkYjJkNmM4ZjFjMmJjNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI4NWM5NTU0MmQ0NjI2YmZjMTYwZTQyMjM0ZjM5YmVlNGFlMTEwODE4In0=	2017-04-17 23:05:45.152197-07
f8x4qkitzr5nmtll1a268cb6du9mp3qm	OGE5ZThiMjM2YWNiOWZlYjBiMTk3MDgxOTUyYTA1ZTE2YTVlMjhiNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiODVjOTU1NDJkNDYyNmJmYzE2MGU0MjIzNGYzOWJlZTRhZTExMDgxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-04-18 13:40:55.217711-07
nwgciexf1e8rt4mq8j45m0vjonazgbgi	OGE5ZThiMjM2YWNiOWZlYjBiMTk3MDgxOTUyYTA1ZTE2YTVlMjhiNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiODVjOTU1NDJkNDYyNmJmYzE2MGU0MjIzNGYzOWJlZTRhZTExMDgxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-01 10:56:00.738632-07
53g435afo37tlpa9crhyq5xzrvl5ifsd	OGE5ZThiMjM2YWNiOWZlYjBiMTk3MDgxOTUyYTA1ZTE2YTVlMjhiNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiODVjOTU1NDJkNDYyNmJmYzE2MGU0MjIzNGYzOWJlZTRhZTExMDgxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-02 10:43:26.824948-07
jcf5n6re2cvpd4rbak907r2h346uh60l	OGE5ZThiMjM2YWNiOWZlYjBiMTk3MDgxOTUyYTA1ZTE2YTVlMjhiNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiODVjOTU1NDJkNDYyNmJmYzE2MGU0MjIzNGYzOWJlZTRhZTExMDgxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-05 11:09:47.55498-07
3o5xnh87bo954gegusv1svjbtmkdb9yb	ZWI0YmIxNWUwYjZjYTYzODliOGI5YWIwMWRkYjJkNmM4ZjFjMmJjNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI4NWM5NTU0MmQ0NjI2YmZjMTYwZTQyMjM0ZjM5YmVlNGFlMTEwODE4In0=	2017-05-11 08:53:17.380374-07
71szsf8510a8kx0cxxg38q725jntmfya	Mzg5Y2M2NmE4NzY1MjkwNWZkMWVlMDFmNjVhYzEwYTZiNzBkMTlmNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODVjOTU1NDJkNDYyNmJmYzE2MGU0MjIzNGYzOWJlZTRhZTExMDgxOCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-11 15:41:11.397993-07
99wg06nw4z48te2gwa2ljz2txar2c183	ZWI0YmIxNWUwYjZjYTYzODliOGI5YWIwMWRkYjJkNmM4ZjFjMmJjNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI4NWM5NTU0MmQ0NjI2YmZjMTYwZTQyMjM0ZjM5YmVlNGFlMTEwODE4In0=	2017-05-24 13:06:45.978073-07
zzliajdsmu78r9btexgemcnxmr0gxrh4	YmIxOWZkNTFiZDI5Y2Y5ZTAxZDgxNmFkZWRmOTA1MDdjOTc4ZWQ0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg1Yzk1NTQyZDQ2MjZiZmMxNjBlNDIyMzRmMzliZWU0YWUxMTA4MTgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-07-16 15:18:10.055477-07
ugyr1cdhc8q2k0kqminoovezybubccj4	MDViNGExNjM2NTdhZDlhMjI1MjI2NDFmMjZlMjI4YTM5ZTRhMmVkNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NWM5NTU0MmQ0NjI2YmZjMTYwZTQyMjM0ZjM5YmVlNGFlMTEwODE4In0=	2017-07-24 02:45:27.680026-07
mtd3dx18ypggreza8r3xh0pz58vv5qes	MDViNGExNjM2NTdhZDlhMjI1MjI2NDFmMjZlMjI4YTM5ZTRhMmVkNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NWM5NTU0MmQ0NjI2YmZjMTYwZTQyMjM0ZjM5YmVlNGFlMTEwODE4In0=	2017-07-24 11:30:16.106325-07
g4aliw401i5js1s3xrihe8985m6x5qks	NWQ1MjdiZTJlZmQwNTE4ZWI3OGU1OGQ5YmYzNzA3YTZhZTZkMzQyMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIyYjk5MzkwNzcwMzUyYjY5ZjI4NzE5MjVkMTM1ZDU1Mjg5NWQ5Y2UxIn0=	2018-05-22 10:42:28.978736-07
ux8h32f2bwfoey9hxr3l0usu9t4tr0dq	MGYzYjMzZjIzNzc2ZTQ1ZWM3YTExZjczNjEzOTQyNTJjNGU4YjYzOTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg1Yzk1NTQyZDQ2MjZiZmMxNjBlNDIyMzRmMzliZWU0YWUxMTA4MTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-31 21:47:19.072577-07
mb2go6vwrk9cj7jd7hca62x4rrv1jafn	NDg0Y2IyZTc0NTVkNGQyZTg1YTk2M2RkMzBkMjczMjFiZThmMDQwOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYjk5MzkwNzcwMzUyYjY5ZjI4NzE5MjVkMTM1ZDU1Mjg5NWQ5Y2UxIn0=	2018-06-23 14:07:00.264208-07
s5zeb2cgpsrmuiwgj9pimoho8garq7ic	NDdjNGI4OTYyMGZjMTZlMGI1ZDhlZjMwZmYyODQ4OTg2OGQ2YWIxMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJhNGFmYTJhOGIyNzM5YmFkZGZlOGQyNmFiOGI4OWQ2NDRhMzEyNWJkIn0=	2018-01-14 10:16:36.826417-08
sfejxi8qou64q1pbwcjc18jvs03xcjzu	OTNiMGI4NDBmYjg4ZGE3NmY1NTkyMjE2NTBlOTAwZTQ1NDM5OGM2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjJiOTkzOTA3NzAzNTJiNjlmMjg3MTkyNWQxMzVkNTUyODk1ZDljZTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-06-27 23:38:18.185971-07
i208hkzykq9w0jc4d4idc9a05u764cq8	OGU2N2U1YmVkZWNjNzUxMmRjNDVhYzhjNjcwYTE2ZTk4OTJlMTgxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmI5OTM5MDc3MDM1MmI2OWYyODcxOTI1ZDEzNWQ1NTI4OTVkOWNlMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-01-15 15:29:22.644486-08
xy8n9zj0hbzyvd5fkkl7o6hlb9ym9k0h	OGU2N2U1YmVkZWNjNzUxMmRjNDVhYzhjNjcwYTE2ZTk4OTJlMTgxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmI5OTM5MDc3MDM1MmI2OWYyODcxOTI1ZDEzNWQ1NTI4OTVkOWNlMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-01-16 10:06:01.060015-08
oq6f07ocfojcl6cdciyksdng67j2zhd8	NWQ1MjdiZTJlZmQwNTE4ZWI3OGU1OGQ5YmYzNzA3YTZhZTZkMzQyMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIyYjk5MzkwNzcwMzUyYjY5ZjI4NzE5MjVkMTM1ZDU1Mjg5NWQ5Y2UxIn0=	2018-07-31 09:34:47.09588-07
vve32qbpdbpwqju3cgb5kw7v21odn6jk	OGU2N2U1YmVkZWNjNzUxMmRjNDVhYzhjNjcwYTE2ZTk4OTJlMTgxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmI5OTM5MDc3MDM1MmI2OWYyODcxOTI1ZDEzNWQ1NTI4OTVkOWNlMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-01-16 13:02:14.413847-08
gs9hmfh6cwrppkqv140h70du5agdshpt	OGU2N2U1YmVkZWNjNzUxMmRjNDVhYzhjNjcwYTE2ZTk4OTJlMTgxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmI5OTM5MDc3MDM1MmI2OWYyODcxOTI1ZDEzNWQ1NTI4OTVkOWNlMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-02-28 00:09:13.651341-08
7o2nuka077jrbzrpkhrb4jfnk05is0q7	NWQ1MjdiZTJlZmQwNTE4ZWI3OGU1OGQ5YmYzNzA3YTZhZTZkMzQyMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIyYjk5MzkwNzcwMzUyYjY5ZjI4NzE5MjVkMTM1ZDU1Mjg5NWQ5Y2UxIn0=	2018-08-01 14:59:22.031791-07
i5rpgs7evnf5rnb4d5uflhmo7hkf3w67	NGIyYTIwZGJkYWRjM2IxZThmZjI1MzliOTVjZTQzZjYyMjE0OTE4MDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmI5OTM5MDc3MDM1MmI2OWYyODcxOTI1ZDEzNWQ1NTI4OTVkOWNlMSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-03-12 12:22:33.642038-07
yts5rtobelrzs89nwx8uuq0ayfx81prq	NDg0Y2IyZTc0NTVkNGQyZTg1YTk2M2RkMzBkMjczMjFiZThmMDQwOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYjk5MzkwNzcwMzUyYjY5ZjI4NzE5MjVkMTM1ZDU1Mjg5NWQ5Y2UxIn0=	2018-03-19 00:41:45.542848-07
shadjh88s8676r8b1jm4fg3w2tysebdb	OGU2N2U1YmVkZWNjNzUxMmRjNDVhYzhjNjcwYTE2ZTk4OTJlMTgxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmI5OTM5MDc3MDM1MmI2OWYyODcxOTI1ZDEzNWQ1NTI4OTVkOWNlMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-08-13 20:55:00.218446-07
q9t9cztfkhac4w2tlvx34m7edse0ezp9	NDg0Y2IyZTc0NTVkNGQyZTg1YTk2M2RkMzBkMjczMjFiZThmMDQwOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYjk5MzkwNzcwMzUyYjY5ZjI4NzE5MjVkMTM1ZDU1Mjg5NWQ5Y2UxIn0=	2018-03-20 11:12:20.387986-07
x9tqgh6rl12vhly26fukbhjiy059uq5c	ZDU2MTUzNTE0YTlmZjkwYjJhOWI3ZjE2NzYwNjEzYzNhMDI0NWNkYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjJiOTkzOTA3NzAzNTJiNjlmMjg3MTkyNWQxMzVkNTUyODk1ZDljZTEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-03 10:19:44.896173-07
pxrfz88jkqdnh7n59lfbdy9a88764lnn	OGU2N2U1YmVkZWNjNzUxMmRjNDVhYzhjNjcwYTE2ZTk4OTJlMTgxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmI5OTM5MDc3MDM1MmI2OWYyODcxOTI1ZDEzNWQ1NTI4OTVkOWNlMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 21:22:48.095233-07
5xxwionpnxfjey73g9nxk1yybeow4jad	NWQ1MjdiZTJlZmQwNTE4ZWI3OGU1OGQ5YmYzNzA3YTZhZTZkMzQyMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIyYjk5MzkwNzcwMzUyYjY5ZjI4NzE5MjVkMTM1ZDU1Mjg5NWQ5Y2UxIn0=	2018-05-21 11:58:24.433184-07
\.


--
-- Data for Name: fundedsite; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY fundedsite (id, description, organs, pis, programs, institutions, staff, status, name, contacts, funding_date_start, funding_date_finish, abstract, aims, abbreviation) FROM stdin;
17	We hypothesize that the pathways underlying heterogeneity in screen-detected lung cancers will be revealed by analysis of molecular (whole exome and mRNA sequencing), microenvironment (immune and inflammatory mediators) and imaging characteristics (semantic and quantitative features) of screen- detected lesions.	3	1059:Steve Dubinett, 1322:Denise Aberle, 392:Avrum Spira	1	32	1362:Adam Gower	Funded	UCLA-BU Stanford Molecular and Cellular Characterization Laboratory (Lung)		2017-03-14 00:00:00	2017-03-14 00:00:00	The University of California at Los Angeles – Boston University Molecular Characterization Laboratory (UCLA- BU MCL) is a multidisciplinary, translational research program designed to enhance our understanding of the molecular, cellular and imaging features distinguishing indolent from aggressive lung cancers in screen- detected and non-screen-detected clinical settings. The National Lung Screening Trial (NLST) has provided compelling evidence of the efficacy of lung cancer screening using low-dose helical computed tomography (LDCT) to reduce lung cancer mortality. The benefits of screening, however, must be reconciled with its potential harms, including high false positive rates and the potential for overdiagnosis. Our broad goal is to distinguish indolent from aggressive lesions by interrogating the molecular, microenvironment and imaging features that are associated with clinical outcomes. This global approach brings all aspects of these investigations to bear on our understanding of the molecular pathogenesis of early stage lung cancer. These results will be translated to the clinical management of screen-detected lung cancer. Understanding the factors underlying tumor indolence or aggression that result in heterogeneous clinical outcomes will facilitate clinical decision making in the context of lung cancer screening, increase screening effectiveness and ultimately drive care pathways. We hypothesize that the pathways underlying heterogeneity in screen-detected lung cancers will be revealed by analysis of molecular (whole exome and mRNA sequencing), microenvironment (immune and inflammatory mediators) and imaging characteristics (semantic and quantitative features) of screen- detected lesions.	Aim 1: Identify molecular, cellular and imaging profiles that distinguish screen-detected from non-screen- detected lung cancers.\r\n\r\nAim 2: Identify molecular, cellular and imaging profiles that distinguish screen-detected lung cancers with indolent versus aggressive clinical courses from the NLST.\r\n\r\nAim 3: Confirm and refine molecular, cellular and imaging profiles that distinguish screen-detected lung cancers with indolent versus aggressive clinical courses from a prospectively collected screening cohort.\r\n\r\nCases will derive from the NLST biorepository, DECAMP cohorts and a University of California (UC) state-wide initiative involving the five UC academic medical centers that are establishing a common screening policy and platform that involves the collection and archiving of clinical, imaging, and tissue specimens.	
5	Provides logistic support, data management and protocol development for the biorepository, and conducts statistical and computational research for data analysis.		7	1	10	1280	Funded	Dartmouth - Coordination and Data Management Group (CDMG)		\N	\N	The CDMG coordinates the MCL research activities, providing logistic support, data management and protocol development for the biorepository, and conducts statistical and computational research for data analysis.  The CDMG will work closely with the Informatics Center.		CDMG
15	By integrating the amplitude and targets of the host immune response with quantitative physical features obtained using standard-of-care diagnostic imaging studies, we hope to develop reliable algorithms that can predict the risk of progression in pancreatic cysts using relatively non-invasive and portable approaches, and thereby address an unmet need of highest significance to public health.	16	613	1	29	1141	Funded	MD Anderson Cancer Center Molecular and Cellular Characterization Laboratory (Pancreatic)		2017-03-09 00:00:00	2017-03-09 00:00:00	More than 2% of the US general population harbors an asymptomatic pancreatic cyst, and the incidence is rising due to increasing use of abdominal imaging. Pancreatic cystic lesions include mucin-secreting cysts – specifically, Intraductal Papillary Mucinous Neoplasms (IPMNs) and Mucinous Cystic Neoplasms (MCNs), which are bona fide precursor lesions of pancreatic adenocarcinoma, and others, such as serous cystadenomas (SCAs) that have minimal potential for malignancy. Even within the microcosm of IPMNs and MCNs, the majority of cysts are indolent, and current consensus guidelines for therapeutic stratification lead to over-treatment in many cases. Nonetheless, the long-term survival of patients with non-invasive mucinous cysts drops from 90-100% to nearly half once invasion occurs, underscoring the continuing importance of screening cyst populations. Distinguishing pancreatic cysts that harbor greatest potential for progression to malignancy from those that are unequivocally indolent will allow rational screening and management of this burgeoning epidemic. We hypothesize that genetic drivers of pancreatic cyst formation interact with the physical microenvironment to fuel malignant progression, and the latter is reflected in measureable imaging features and humoral immune responses. To address this hypothesis, we will create an "Imaging and Molecular Characterization Laboratory" (IMCL) at MD Anderson, and partner with four high volume pancreatic centers (UCSF, UCSD, Indiana University and University of Utah), for access to >1,000 surgically resected retrospective cyst samples, and an expected accrual of ~1,300 prospective cyst patients over the period of this proposal. In Aim 1, we will correlate quantitative measurements of the physical microenvironment of pancreatic cysts (obtained from standard-of-care diagnostic CT scans) with underlying histopathology and genomic profiles. In Aim 2, we will identify the host immune response to malignant progression in pancreatic cysts by measuring autoantibody responses in the serum to over three million genome-wide epitopes using a Human Peptide Array (Roche-NimbleGen). In both aims, we will use existing diagnostic imaging and banked serum samples from patients with surgically resected and histopathology validated pancreatic cysts as a training set, followed by application in a test set from prospectively accrued samples. Finally, in Aim 3, we will merge the data from both prior aims to develop an integrated algorithm for predicting neoplastic progression in pancreatic cysts. Multi-center coordination of retrospective and prospective biospecimen collection and all aspects of data management will be supported by a Statistical and Centralized Data Management Core (SCDMC) within the IMCL. By integrating the amplitude and targets of the host immune response with quantitative physical features obtained using standard-of-care diagnostic imaging studies, we hope to develop reliable algorithms that can predict the risk of progression in pancreatic cysts using relatively non-invasive and portable approaches, and thereby address an unmet need of highest significance to public health.	Aim 1: To correlate quantitative measurements of the physical microenvironment of pancreatic cysts with underlying histopathology and genomic profiles\r\n1A: Perform a retrospective study to identify physical features on diagnostic imaging that associate with histopathology and molecular alterations in resected pancreatic cysts\r\n1B: Validate associations between imaging-based physical features and neoplastic potential in prospective cohorts\r\n1C: To develop a mathematical model of pancreatic cyst progression\r\n\r\nAim 2: To identify the host immune response to malignant progression in pancreatic cysts\r\n2A: Define humoral immune responses in pre-operative serum samples from pancreatic cyst patients using a genome-wide human peptide array interrogating three million epitopes\r\n2B: Validate associations between immunogenic epitopes and neoplastic potential in prospective cohorts\r\n\r\nAim 3: To develop an integrated algorithm using physical features on imaging and host immune response for predicting neoplastic progression in pancreatic cysts	
3	NASA/JPL Informatics Center		10	1, 2	13	1	Funded	JPL Informatics Center	6:Heather Kincaid, 10:Daniel Crichton	\N	\N			IC
8	Data Management and Coordinating Center		1141	2	6		Funded	Data Management and Coordinating Center		\N	\N			DMCC
16	A systematic study of the events in prostate cancer during its development and evolution will help address the issues of overtreatment by providing prognostic features and biomarkers that help select men for definitive treatment or observation.	15	854:James Brooks	1	31	1318:Sharon Pitteri	Funded	Stanford Molecular and Cellular Characterization Laboratory (Prostate)		2017-03-14 00:00:00	2017-03-14 00:00:00	Recent suggests that in the U.S. prostate cancer is over-detected and over-treated resulting in significant morbidity and financial costs. These problems are the product of poor sensitivity and specificity serum Prostate Specific Antigen (PSA) as a screening tool, leading to many unnecessary biopsies that find small and predominantly indolent prostate tumors. While many prostate cancers should be managed with active surveillance, uncertainties surrounding available clinical tools of aggressiveness (such as PSA, Gleason score and clinical stage) will often drive patients and physicians to treatment. Attempts to improve prognostication using candidate biomarkers, mostly discovered from genomic analyses of large pieces of cancers, have had few successes, and available molecular tools provide only modest prediction at best. Clearly, a better understanding of the early molecular genetic events in prostate cancer is desperately needed. We hypothesize that early prostate cancer arises from definable molecular alterations in precursor lesions and progresses as a result of acquired lesions that confer aggressive features in a subpopulation of cells in precursor lesions and/or early tumors. In addition, we hypothesize that at each step, there are downstream molecular alterations that\r\nconfer, in a probabilistic sense, the ability for some lesions to grow and spread and in others an indolent phenotype (dead end lesions). As such, defining the earliest genomic events, the evolutionary pathways to invasive carcinoma, the final constellation of genomic alterations, and the extent of genomic heterogeneity (the building blocks for evolution), should illuminate the key genomic features distinguishing good and bad outcome prostate cancer. In depth characterization of early lesions has been constrained by limitations of conventional histology tools (prostate cancer precursors can only be reliably identified in fixed tissues) and of available genomic and proteomic technologies (which do not work well on fixed tissues). To address the challenges we will take advantage of technologies we have developed to analyze small samples in both fixed and frozen tissue to provide a complete picture of the early events in prostate carcinogenesis. An integrated approach using fixed and frozen tissues will allow us to delineate the early genomic lesions in prostate cancer, define which are selected to evolve into more aggressive and which end up as non-aggressive (dead end) lesions, and characterize the downstream effects of these selected changes in cellular transcription, protein expression and protein glycosylation. A systematic study of the events in prostate cancer during its development and evolution will help address the issues of overtreatment by providing prognostic features and biomarkers that help select men for definitive treatment or observation.	AIM 1: To investigate the early genomic evolution of good and bad outcome prostate cancer in histologically defined prostate cancers and precursor lesions in fixed tissues.\r\n\r\nAIM 2: To define the genomic heterogeneity of good and bad outcome prostate cancer and the downstream consequences in transcript, protein and glycoprotein expression in frozen tissues.	
18	Our goal is to identify better ways to screen for and treat the most aggressive cancers and avoid overdiagnosis and overtreatment as well as the inadvertent labeling of indolent lesions as cancers.	1	1169:Laura Esserman, 1341:Alexander Borowsky	1	30	1357:Hidetoshi Mori	Funded	UCSF Molecular and Cellular Characterization Laboratory (Breast)		2017-03-14 00:00:00	2017-03-14 00:00:00	Breast cancer still kills 45,000 women a year in the US alone and over 270,000 women are given a diagnosis of either invasive or in situ disease. Screening is our major public health intervention. And yet we likely overdiagnose as many or more women than we save with screening and it does not impact the outcomes of the most aggressive cancers. We have assembled an extraordinary set of resources that include datasets with long term follow-up as well as a unique prospective trial that will include comprehensive host risk and tumor annotation to address the underlying biology (from both the tumor and host perspective) of indolent (IDLE) and interval cancers. Our goal is to identify better ways to screen for and treat the most aggressive cancers and avoid overdiagnosis and overtreatment as well as the inadvertent labeling of indolent lesions as cancers.\r\nTestable Hypotheses\r\n1. Commercially available assays can identify ultralow risk breast tumors (MammaPrint Ultralow Risk for invasive cancer, Oncotype-DCIS-category 1 for DCIS).\r\n2. The combined use of commercially available assays plus additional genomic, pathology, and immune based assays along with mode of detection can further differentiate IDLE from ultralow breast lesions.\r\n3. Among the malignant features differentiating screen-detected from interval breast cancers are the degrees of cellular and molecular heterogeneity and type/extent of immune microenvironment and host response.\r\n4. Since interval cancers are often biologically distinct from screen detected cancers, we hypothesize that genetic risk factors will be useful to distinguish the risk of interval from screen detected cancers.	Aim 1: Stratify low risk invasive tumors into low vs. ultralow vs. IDLE and high risk into interval vs. screen- detected using gene expression profiling, pathology features, immune profiling in fully annotated invasive cancer data sets and validate the best predictors in a prospective California-wide screening trial.\r\n \r\nAim 2: Develop adjunctive assays to stratify DCIS lesions into IDLE, ultralow, moderate and high-risk DCIS breast lesions using gene expression profiling, and measures of tumor immune micro-environment in established data sets and validate using a prospective registry of 300 DCIS cases\r\n \r\nAim 3: Develop a model using known germline breast cancer risk variants to predict women predisposed toward ultralow and IDLE screen detected tumors, and those predisposed to interval detected breast cancers, using data from a fully annotated California-wide screening trial that includes germline and tumor profiling.	
10	Together this work will yield highly relevant information that can be directly applied to the clinical management of localized prostate cancer. Specifically, it will yield an integrated signature that distinguishes localized - indolent tumors from localized tumors with lethal potential. Additionally we believe these signature will be critical in determining treatment strategies for individuals with prostate cancers of indeterminate kinetics.	15	1263:Angelo DeMarzo, 1264:Kenneth Pienta	1	18	1286:Sarah Wheelan	Funded	Johns Hopkins Molecular and Cellular Characterization Laboratory (Prostate)		\N	\N		Aim 1: Develop Integrated Genomic, Epigenomic and Expression Profiling Signatures of Indolent and Aggressive Prostate Cancer from both White and African-American Men. Using a discovery set of enriched fresh frozen prostate cancer lesions, we will use Next Generation DNA sequencing to perform genome wide profiling of indolent (Gleason grade 6) and aggressive (Gleason grade 8-10) cancers, separately procured from both White and African American men that includes: mRNA (RNAseq), DNA methylation changes (qMDBseq), variant/mutation and copy number alterations (whole exome sequencing), and genomic rearrangements (low pass whole genome sequencing). We will then apply state of the art bioinformatics approaches for data analysis to determine the number and extent of changes and then perform integrated data analysis to develop molecular signatures that accurately separate indolent from aggressive lesions. Once molecular/pathway alterations are discovered we will prioritize biomarkers/signatures based on whether they correlate with Gleason grade, using both solution-based multiplex profiling as well as in situ based technologies to determine cell type specific alterations. Further, we will also characterize the heterogeneous nature of key changes, as well as determine whether such changes occur primarily in tumor cells or within nontumor microenvironmental cell types. <br><br>Aim 2: Validate Biomarkers and Pathways in Active Surveillance and Autopsy Patients.  Markers obtained from the preliminary validation phase from Aim 1 will be used for validation by immunohistochemistry (IHC) and/or in situ hybridization (ISH) on a number of datasets. The first is a large active surveillance cohort of ~1100 men serially biopsied and followed expectantly, and the second is a TMA available from the Baltimore Longitudinal Study of Aging observational cohort generated at autopsy from men who died with either indolent or aggressive prostate cancer.<br><br>Aim 3: Validate Biomarkers in Relation to Patient Outcome, with Emphasis on Intermediate Risk and African American Patients. Further validation will be done with IHC and ISH on multiple highly annotated prostate cancer specific outcome datasets using TMAs from JHU (both existing and to be developed) as well as the Harvard health Professionals and Physician Health Study datasets.	None
21			1306	1	28	1308	Funded	National Cancer Institute - Division of Cancer Biology		2017-03-15 00:00:00	2017-03-15 00:00:00			NCI-DCB
22			101	1	27	890	Funded	National Cancer Institute - Division of Cancer Prevention		2017-03-15 00:00:00	2017-03-15 00:00:00			NCI-DCP
19	The Vermont Breast Cancer Molecular Characterization Laboratory will provide the consortium with scientific leadership, technical resources, and access to a large repository of retrospective and prospectively collected breast specimens linked to the rich data of the VBCSS.	1	1327:Janet Stein, 1329:Brian Sprague, 1328:Donald Weaver	1	34	1359:Kathleen Howe	Funded	University of Vermont Molecular Characterization Laboratory (Breast)		2017-03-14 00:00:00	2017-03-14 00:00:00	Advances in breast cancer screening and treatment have reduced breast cancer mortality in the US over the past 30 years. However, the widespread adoption of screening mammography has been accompanied by dramatic increases in early stage breast cancer diagnoses that have not been offset by declines in advanced stage disease. Accumulating evidence suggests that a substantial fraction of screen-detected breast cancers would never have emerged clinically if not detected through screening. While there is extensive debate regarding the magnitude of overdiagnosis, there is widespread consensus that new approaches are urgently needed to distinguish indolent screen-detected cases from those that may be life threatening. The role of the tumor microenvironment in breast cancer progression has been increasingly recognized. Several lines of evidence indicate that breast tumorigenesis is critically influenced by active signaling between malignant breast epithelial cells and non-neoplastic cells of the tumor microenvironment. The goal of our proposal is to identify tumor microenvironment signatures that predict the aggressiveness of early stage, screen-detected breast cancers by minimally invasive methods. We will leverage and refine state-of-the-art technologies to characterize aggressive signatures based on the cellular composition and gene expression of specific cell populations within the tumor microenvironment of interval- and symptom-detected invasive breast cancers. We will then determine whether the presence of these aggressive tumor microenvironment signatures in early stage, screen-detected breast cancer is associated with progression. We will obtain retrospective data on 800 formalin-fixed, paraffin-embedded specimens for analysis from the Vermont Breast Cancer Surveillance System (VBCSS), which has collected integrated patient, radiology, pathology, treatment, and outcomes data on all women undergoing breast imaging in the state of Vermont since 1996. The VBCSS has a large existing repository of over 1,200 centrally-reviewed DCIS specimens and access to over 10,000 invasive breast cancer specimens for cases diagnosed in the state of Vermont. We will also engage in prospective collection of fresh specimens via the Vermont Cancer Center Tissue Biobank, which is also linked to the integrated data of the VBCSS. The identification of aggressive and indolent tumor microenvironment signatures will promote the development of more conservative treatment strategies for the subset of women with favorable prognosis and suggest novel targets for therapeutic intervention in cases with unfavorable prognosis. We have assembled a multidisciplinary research team with nationally recognized expertise in cellular and molecular cancer biology, pathology, cancer screening, and epidemiology, as well as a long track record of productive consortium-based collaborative research. The Vermont Breast Cancer Molecular Characterization Laboratory will provide the consortium with scientific leadership, technical resources, and access to a large repository of retrospective and prospectively collected breast specimens linked to the rich data of the VBCSS.	1) Identify molecular and cellular signatures in the tumor microenvironment that predict the aggressiveness of early stage screen-detected breast cancers. Increasing evidence suggests that the tumor microenvironment plays an integral role in determining the invasive potential of a primary tumor. We will characterize the cell composition and cell-specific gene expression patterns in the tumor microenvironment of aggressive interval- and symptom-detected breast cancers. We will determine to what extent the presence of these aggressive signatures in early stage screen-detected breast cancers predicts outcomes, using a nested case-control design with data and specimens from the VBCSS. We will also conduct global RNA expression profiling on prospectively collected breast tissue to identify new markers that, in combination with the cellular profiles, will elucidate a comprehensive signature of tumor progression.\r\n2) Lead and participate in collaborative trans-Consortium research projects that produce comprehensive cellular and molecular characterizations of early lesions. Our multidisciplinary research team has extensive experience and a productive track record of consortium-based collaborative research. We envision collaborative trans-network research projects that take advantage of the diversity of expertise, data, and specimens provided by each participating site. In particular, the tumor microenvironment signatures identified in our project may be generalizable across cancers originating in different organs. Likewise, we anticipate that tumor-cell-focused signatures developed by other MCL sites will provide important data and natural opportunities to complement our tumor microenvironment work.\r\n3) Contribute to the Consortium’s annotated biospecimen repository of screen-, interval-, and symptom-detected lesions. The depth and breadth of the data and specimens made available through our proposal will enable a wide range of opportunities for the Consortium to address important questions in the characterization of early cancer lesions. The VBCSS has access to archived formalin-fixed specimens for over 10,000 breast cancers and thousands of pre-neoplastic lesions, each annotated with rich longitudinal patient, radiology, pathology, treatment, and outcomes data. Our prospective data collection will enable analyses of fresh and formalin-fixed specimens from newly diagnosed cases.	
20	We will be able to build integrated models of ADC behavior, validate a new genomic molecular test on circulating DNA and propose prospective studies that would eventually offer a different intervention based on these predictions i.e. surgery, vs no surgery, adjuvant immuno- or chemotherapy vs no adjuvant therapy and therefore reduce overtreatment and ultimately increase the rate of cure and reduce healthcare cost.	3	524:Pierre Massion	1	35	1321:Viswarm Nair	Funded	Vanderbilt Molecular and Cellular Characterization Laboratory (Lung)		2017-03-15 00:00:00	2017-03-15 00:00:00	Suspicious screening-detected lung nodules present a formidable challenge to patients and their providers. The standard of care lacks accuracy in predicting a) malignancy from benign disease and b) indolent vs aggressive behavior. The answer to these questions justifies diametrically opposed strategies (biopsy vs follow up) each of which carries huge consequences including cure of the cancer, risk of death during a procedure or risk of dying from not intervening early in the disease. This application will focus on the behavior of early stage adenocarcinoma of the lung and not on the distinction between benign from malignant nodules. We assembled a unique multidisciplinary group of experts to tackle this problem in an original way. We will develop a retrospective and a prospective repository for both tissue (ADC fresh frozen tissues, blood) and images from which we will derive detailed quantitative structural imaging analysis, targeted genomic analysis and single cell analysis to interrogate the functional genomics of these tumors. The integration of this multidimensional data imaging/molecular/cellular/epidemiology will allow us to identify and validate cellular and molecular determinants of tumor behavior in the context of their inter- and intra-tumor heterogeneity. With these results, we will be able to build integrated models of ADC behavior, validate a new genomic molecular test on circulating DNA and propose prospective studies that would eventually offer a different intervention based on these predictions i.e. surgery, vs no surgery, adjuvant immuno- or chemotherapy vs no adjuvant therapy and therefore reduce overtreatment and ultimately increase the rate of cure and reduce healthcare cost.	Aim 1: Assemble and curate: a) a database of screen-detected lung adenocarcinomas from well\r\nannotated, publically available studies of screening low dose CT (LDCT) examinations from ongoing and future lung cancer screening trials and centers using standardized acquisition parameters and clinical data elements to define clinical, structural imaging, cellular and molecular attributes of screen detected non-solid, part-solid and solid malignant nodules; b) a database of non-screen detected lung adenocarcinomas from multiple institutions following the same biological attributes.\r\n\r\nAim 2: Validate and integrate the structural imaging, genomic tumor DNA analysis and circulating proteomic alterations on a carefully annotated set of early lung adenocarcinomas from Aim 1.\r\n\r\nAim 3: Characterize the cellular and molecular heterogeneity of surgically resected screening detected\r\nlung nodules using a combination of single cell analysis (CyTOF), genomic analysis of screening detected lung adenocarcinomas. We will identify a minimal set of phenotypic biomarkers that defines inter-tumor and intra-tumor heterogeneity.\r\n\r\nAim 4: Develop a novel integrated lung adenocarcinoma prognostic model targeting screen detected\r\nadenocarcinomas, building from existing models to incorporate epidemiological, cellular, molecular, and quantitative image analysis.	
\.


--
-- Name: fundedsite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('fundedsite_id_seq', 1, false);


--
-- Data for Name: fundedsite_institution_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY fundedsite_institution_link (id, fundedsiteid, institutionid) FROM stdin;
82	10	18
83	17	33
84	17	38
85	17	32
39	15	19
40	15	15
41	15	24
42	15	23
43	15	30
44	15	29
48	5	10
50	3	13
51	8	6
57	21	28
58	22	27
69	20	25
70	20	26
71	20	31
72	20	35
73	16	31
74	18	21
75	18	24
76	18	30
78	19	34
\.


--
-- Name: fundedsite_institution_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('fundedsite_institution_link_id_seq', 85, true);


--
-- Data for Name: fundedsite_organ_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY fundedsite_organ_link (id, fundedsiteid, organid) FROM stdin;
27	15	16
38	20	3
39	16	15
40	18	1
42	19	1
44	10	15
45	17	3
\.


--
-- Name: fundedsite_organ_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('fundedsite_organ_link_id_seq', 45, true);


--
-- Data for Name: fundedsite_pi_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY fundedsite_pi_link (id, fundedsiteid, personid) FROM stdin;
72	18	1169
73	18	1341
77	19	1327
78	19	1329
79	19	1328
83	10	1263
84	10	1264
85	17	1059
86	17	1322
87	17	392
48	15	613
51	5	7
53	3	10
54	8	1141
58	21	1306
59	22	101
70	20	524
71	16	854
\.


--
-- Name: fundedsite_pi_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('fundedsite_pi_link_id_seq', 87, true);


--
-- Data for Name: fundedsite_program_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY fundedsite_program_link (id, fundedsiteid, programid) FROM stdin;
67	10	1
68	17	1
42	15	1
45	5	1
48	3	1
49	3	2
50	8	2
54	21	1
55	22	1
61	20	1
62	16	1
63	18	1
65	19	1
\.


--
-- Name: fundedsite_project_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('fundedsite_project_link_id_seq', 68, true);


--
-- Data for Name: fundedsite_protocol_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY fundedsite_protocol_link (id, protocolid, fundedsiteid) FROM stdin;
13	5	5
15	1	8
19	8	3
20	9	17
31	11	5
32	11	10
33	11	15
34	11	16
35	11	17
36	11	18
37	11	19
38	11	20
39	10	5
48	3	8
\.


--
-- Name: fundedsite_protocol_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('fundedsite_protocol_link_id_seq', 48, true);


--
-- Name: fundedsite_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('fundedsite_seq', 22, true);


--
-- Data for Name: fundedsite_staff_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY fundedsite_staff_link (id, fundedsiteid, personid) FROM stdin;
158	20	1339
159	20	1304
160	20	1335
161	20	1337
162	20	1305
163	20	1302
164	20	1338
165	20	23
166	20	1336
167	20	1340
168	20	1091
169	20	1352
170	20	1351
171	20	1353
172	20	1320
173	20	1321
174	16	1317
175	16	1315
176	16	1314
177	16	1316
178	16	1319
179	16	1318
180	18	1293
181	18	1291
182	18	1295
183	18	1296
184	18	1292
185	18	1354
186	18	1355
187	18	1356
188	18	1357
55	15	1312
56	15	1298
57	15	1268
58	15	1300
59	15	1299
60	15	621
61	15	1290
62	15	1289
63	15	1281
64	15	1271
65	15	1003
66	15	1311
67	15	259
68	15	1288
69	15	1301
70	15	1141
82	5	1279
83	5	1276
84	5	8
85	5	1277
86	5	1278
87	5	1280
89	3	1326
90	3	11
91	3	6
92	3	1325
93	3	1170
94	3	1
117	21	1309
118	21	1307
119	21	1310
120	21	1308
121	22	356
122	22	538
123	22	351
124	22	187
125	22	890
196	19	1330
197	19	1332
198	19	1334
199	19	1333
200	19	1331
201	19	1358
202	19	1359
207	10	1266
208	10	1267
209	10	1282
210	10	1285
211	10	1286
212	17	1324
213	17	1323
214	17	1360
215	17	1361
216	17	1362
\.


--
-- Name: fundedsite_staff_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('fundedsite_staff_link_id_seq', 216, true);


--
-- Data for Name: group_chair_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY group_chair_link (id, groupid, personid) FROM stdin;
6	9	392
8	10	1322
11	11	7
14	5	854
15	6	8
16	12	1341
\.


--
-- Name: group_chair_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('group_chair_link_id_seq', 16, true);


--
-- Data for Name: group_cochair_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY group_cochair_link (id, groupid, personid) FROM stdin;
8	9	1327
10	10	1091
12	11	1301
13	5	1169
14	6	7
15	12	1263
\.


--
-- Name: group_cochair_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('group_cochair_link_id_seq', 15, true);


--
-- Data for Name: group_member_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY group_member_link (id, groupid, personid) FROM stdin;
13	8	1275
170	5	7
171	5	1263
172	5	1059
173	5	613
174	5	524
175	5	1264
176	5	101
177	5	1327
178	5	1306
179	5	890
180	5	1309
181	5	1308
182	5	538
183	5	1307
184	5	356
185	5	351
186	6	1266
187	6	10
188	6	1276
189	6	1309
52	9	1059
53	9	1320
54	9	1169
55	9	1285
56	9	1289
57	9	1330
58	9	1291
59	9	538
60	9	1307
61	9	613
62	9	1282
63	9	524
64	9	1304
65	9	259
66	9	1301
67	9	1292
68	9	110
69	9	1286
70	9	1293
71	9	1267
190	6	890
191	6	538
192	6	1
193	6	6
194	6	356
195	6	1278
196	6	351
197	6	101
198	6	1306
199	6	1170
200	12	1263
201	12	1059
202	12	1336
85	10	1294
86	10	854
87	10	1331
88	10	621
89	10	1268
90	10	1310
91	10	187
92	10	1321
93	10	1303
94	10	1281
95	10	1295
96	10	23
97	10	1271
98	10	1342
203	12	1334
204	12	613
205	12	524
206	12	1292
207	12	351
208	12	1313
209	12	1296
210	12	1323
211	12	1328
212	12	1306
213	12	1324
214	12	1274
127	11	1279
128	11	1332
129	11	1141
130	11	1285
131	11	1308
132	11	1282
133	11	356
134	11	1302
135	11	1292
136	11	1340
137	11	1280
138	11	110
139	11	1333
140	11	1286
\.


--
-- Name: group_member_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('group_member_link_id_seq', 214, true);


--
-- Data for Name: group_program_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY group_program_link (id, groupid, programid) FROM stdin;
7	8	2
16	9	1
18	10	1
21	11	1
24	5	1
25	6	1
26	12	1
\.


--
-- Name: group_program_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('group_program_link_id_seq', 26, true);


--
-- Name: group_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('group_seq', 12, true);


--
-- Name: input_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('input_file_id_seq', 1, false);


--
-- Data for Name: institution; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY institution (id, name, department, abbreviation, url, description, personnel) FROM stdin;
34	University of Vermont		UVM	http://www.uvm.edu/medicine/		1358:Denis Nunez
38	Brown University		Brown	https://www.brown.edu		1361:Fenghai Duan
6	Fred Hutchinson Cancer Research Center	Public Health	FHCRC	https://www.fredhutch.org/en/labs/phs.html		1141:Ziding Feng
33	Boston University		BU	https://www.bumc.bu.edu/busm/		1362:Adam Gower
22	University of Colorado Health Science Center (UCHSC)					
10	Geisel School of Medicine	Dartmouth		http://geiselmed.dartmouth.edu		1280:Tor Tosteson
19	Indiana University	School of Medicine	IU	https://www.indiana.edu		1281:Max Schmidt
18	Johns Hopkins Medicine		JHU	http://www.hopkinsmedicine.org		1287:Harold Lehmann
24	University of California, San Francisco	UCSF Helen Diller Family Comprehensive Cancer Center	UCSF	http://cancer.ucsf.edu		1296:Scott VandenBerg
15	MD Anderson Cancer Center		MDACC	http://www.mdanderson.org		1300:Huamin Wang
25	Moffitt Cancer Center			https://moffitt.org		1303:Jennifer Permuth
26	Mount Sinai Medical Center			http://www.mountsinai.org		1305:Mary Beth Beasley
29	University of Utah		Utah			1311:Sean Mulvihill
23	University of New Mexico	School of Medicine	UNM	http://www.unm.edu		1288:Vittorio Crisitini
31	Stanford University			http://med.stanford.edu		1321:Viswarm Nair
32	University of California, Los Angeles		UCLA	http://www.ucla.edu		1324:Haodong Xu
13	JPL Informatics Center		JPL	http://valid.jpl.nasa.gov		11:David Liu
27	National Cancer Institute-DCP	Division of Cancer Prevention	NCI-DCP	http://prevention.cancer.gov		538:Jacob Kagan
28	National Cancer Institute-DCB	Division of Cancer Biology	NCI-DCB	http://www.cancer.gov/about-nci/organization/dcb		1310:Nastaran Kuhn
36	Northwestern University			https://www.nm.org		1342:Edward Schaeffer
35	Vanderbilt University		Vandy	http://www.mc.vanderbilt.edu		1353:Travis Osterman
21	University of California, Davis		UC Davis	https://www.ucdavis.edu		1357:Hidetoshi Mori
30	University of San Diego		UCSD	http://som.ucsd.edu		1354:Olivier Harismendy
\.


--
-- Name: institution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('institution_id_seq', 1, false);


--
-- Data for Name: institution_personnel_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY institution_personnel_link (id, institutionid, personid) FROM stdin;
241	38	1361
244	33	392
245	33	1360
246	33	1362
110	15	613
111	15	1003
112	15	1141
113	15	1290
114	15	1301
115	15	1268
116	15	1297
117	15	1298
118	15	259
119	15	1299
21	6	1141
120	15	1300
121	25	1091
122	25	1302
123	25	1303
124	26	1304
125	26	1305
43	10	7
44	10	8
45	10	1272
46	10	1276
47	10	1277
48	10	1278
49	10	1279
50	10	1280
51	19	1271
52	19	1281
53	18	110
54	18	1263
55	18	1264
56	18	1266
57	18	1267
58	18	1282
59	18	1283
60	18	1284
61	18	1285
62	18	1286
63	18	1287
143	29	1289
144	29	1311
145	23	1288
72	24	621
73	24	1169
74	24	1291
75	24	1292
76	24	1293
77	24	1294
78	24	1295
79	24	1296
154	31	1317
155	31	854
156	31	1314
157	31	1315
158	31	1316
159	31	1318
160	31	1319
161	31	1320
162	31	1321
163	32	1059
164	32	1322
165	32	1323
166	32	1324
168	13	10
169	13	6
170	13	1
171	13	1170
172	13	1325
173	13	1326
174	13	11
197	27	101
198	27	351
199	27	356
200	27	890
201	27	187
202	27	538
203	28	1306
204	28	1307
205	28	1309
206	28	1308
207	28	1310
209	36	1342
212	35	524
213	35	23
214	35	1335
215	35	1336
216	35	1337
217	35	1338
218	35	1339
219	35	1340
220	35	1352
221	35	1351
222	35	1353
223	21	1341
224	21	1274
225	21	1355
226	21	1356
227	21	1357
228	30	1312
229	30	1313
230	30	1354
231	34	1327
232	34	1328
233	34	1329
234	34	1330
235	34	1331
236	34	1332
237	34	1333
238	34	1334
239	34	1359
240	34	1358
\.


--
-- Name: institution_personnel_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('institution_personnel_link_id_seq', 246, true);


--
-- Name: institution_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('institution_seq', 38, true);


--
-- Data for Name: ksdb_inputfile; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY ksdb_inputfile (id, filepath, folder) FROM stdin;
\.


--
-- Name: ksdb_inputfile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('ksdb_inputfile_id_seq', 1, false);


--
-- Data for Name: organ; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY organ (id, name, description) FROM stdin;
1	Breast	
2	Thyroid	
3	Lung	
4	Heart	
5	Kidney	
6	Mouth	
7	Colon	
8	Stomach	
9	Thyroid	
10	Cervix	
11	Bone	
12	Brain	
13	Bladder	
15	Prostate	
16	Pancreas	
\.


--
-- Data for Name: organ_protocol_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY organ_protocol_link (id, protocolid, organid) FROM stdin;
8	5	3
9	1	10
10	1	8
12	9	3
19	11	1
20	11	3
21	11	16
22	11	15
23	10	13
30	3	13
\.


--
-- Name: organ_protocol_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('organ_protocol_link_id_seq', 30, true);


--
-- Name: organ_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('organ_seq', 16, true);


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY person (id, firstname, lastname, degrees, email, telephone, description, dcp, dcb, extension) FROM stdin;
3	John	Palin	3	John.Palin@gov.gov		\N	\N	\N	\N
12	Nadja	Khan	\N	nkhan@fredhutch.org	206-667-2067		\N	\N	\N
13	Tetsuo	Ito	\N	tito@medicine.umaryland.edu	410-706-3375		\N	\N	\N
15	Kevin	Qu	\N	quk@questdiagnostics.com	949-728-45274		\N	\N	\N
16	Natalie	Friedman	\N	nfriedma@nm.org	312-503-4236		\N	\N	\N
17	Juan Miguel	Mosquera	\N	jmm9018@med.cornell.edu	212-746-2700		\N	\N	\N
18	Sam	Trinh	\N	samtrinh@stanford.edu	650-498-5691		\N	\N	\N
19	Rebecca	de Frates	\N	defrar@uw.edu	206-543-1461		\N	\N	\N
20	Xiaoyu	Shi	\N	shix@utscsa.edu	210-567-1235		\N	\N	\N
21	Renee	Tripon	\N	rct10@albion.edu	7347696772		\N	\N	\N
22	Cynthia (Cindy)	Plate607	\N	cjplate@unmc.edu	402-559-4192		\N	\N	\N
24	Karen	Hasik	\N	HASIKKR@slu.edu	314-977-9320		\N	\N	\N
25	Madison	Kyle	\N	mkyle@fredhutch.org	206-667-2067		\N	\N	\N
26	Hilary	Boyer	\N	hboyer@fredhutch.org	2066671220		\N	\N	\N
27	Joseph	Geradts	\N	joseph.geradts@duke.edu	(919) 668-5670		\N	\N	\N
28	Gina	Lee	\N	gina.lee@va.gov	3107107702		\N	\N	\N
29	Tara	Meyer	\N	tmeyer3@kumc.edu	9135881194		\N	\N	\N
30	William	Hazelton	\N	hazelton@fredhutch.org	2066677495		\N	\N	\N
31	Feng	Jiang	\N	fjiang@som.umaryland.edu	410-706-4854		\N	\N	\N
32	Janet	Vargo	\N	jvargo1@vrxus.jnj.com	908-791-2462		\N	\N	\N
33	Milos	Novotny	\N	novotny@indiana.edu	812-855-4532		\N	\N	\N
34	Richard	Schwab	\N	rschwab@ucsd.edu	858-822-0442		\N	\N	\N
35	Aaron	Sasson	\N	asasson@unmc.edu	402-559-8941		\N	\N	\N
36	Isaac	Mizrahi	\N	iamizrahi@beckman.com	760-438-6575		\N	\N	\N
37	Eric	Elton	\N	eelton@rcn.com	847-657-1900		\N	\N	\N
38	Beth	Oleson	\N	boleson@partners.org	617-632-3656		\N	\N	\N
39	Kristin	Rodgers	\N	krodgers@fredhutch.org	206-667-3438		\N	\N	\N
40	Bruce	Robinson	\N	bwsrobin@cyllene.uwa.edu.au	9345 3129/2098		\N	\N	\N
41	Stephen	Levin	\N	stephen.levin@mssm.edu	212-824-7070		\N	\N	\N
42	Brad	Black	\N	brad@libbyasbestos.org	406-293-9274		\N	\N	\N
43	Martin	Stengelin	\N	mstengelin@mesoscale.com	240-631-2522, ext. 2018		\N	\N	\N
44	Tatiana	Rogut	\N	rogutt@cc.ucsf.edu	415-476-8825		\N	\N	\N
45	Stephen	Lam	\N	slam2@bccancer.bc.ca	604-675-8094		\N	\N	\N
46	Kirk	Herman	\N	kherman@umich.edu	734-615-2922		\N	\N	\N
47	Scott	Gerlach	\N	scott.m.gerlach@dartmouth.edu	603-650-3409		\N	\N	\N
48	Joseph	Long	\N	longj4@uthscsa.edu	210-450-0754		\N	\N	\N
49	Carole	Justusson	\N	cjustuss@weisshospital.com	773.564.5032		\N	\N	\N
50	Laura	Bianchi	\N	lbianchi@northshore.org	847-657-1900		\N	\N	\N
51	Michael	Fabrizio	\N	mdfabriz@gmail.com	757-452-3460		\N	\N	\N
52	Mohamed	Sultan	\N	mohamed.sultan@gunet.georgetown.edu	202-444-1210		\N	\N	\N
53	Walid	Chalhoub	\N	Walid.M.Chalhoub@gunet.georgetown.edu	202-444-1210		\N	\N	\N
54	Vanessa	Baack	\N	Vanessa.Baack@asu.edu	480-965-2805		\N	\N	\N
55	Jean	Reiss	\N	jreiss@mednet.ucla.edu	310 206 2062		\N	\N	\N
56	Fanchette	Auguste	\N	F.auguste@med.miami.edu	305-243-7207		\N	\N	\N
57	Atreya	Dash	\N	atreya@uw.edu	206-277-2265		\N	\N	\N
58	Neehar	Parikh	\N	ndparikh@med.umich.edu	734-232-1071		\N	\N	\N
59	Jing	Zhang	\N	zhangj@u.washington.edu	206-341-5245		\N	\N	\N
60	Patricia	Landis	\N	plandis@jhmi.edu	(410) 614-6002		\N	\N	\N
61	Nancy	Glover	\N	nancy.glover@duke.edu	919-684-5028		\N	\N	\N
62	Gail	Tyndall	\N	tyndallg@upstate.edu	315-464-9003		\N	\N	\N
63	Dennis	Pittman	\N	pittm005@mc.duke.edu	(919) 684-6133		\N	\N	\N
64	Peter	Nelson	\N	pnelson@fredhutch.org	206-667-3377		\N	\N	\N
65	Brianne	Goodwin	\N	brianne.goodwin@nyumc.org	646-825-6328		\N	\N	\N
66	Claudio	Jeldres	\N	cjeldres@fredhutch.org	206-667-1206		\N	\N	\N
67	Priyanka	Banerjee	\N	priyanka.banerjee.1@vanderbilt.edu	615-936-3750		\N	\N	\N
68	Doreen	Addrizzo-Harris	\N	addrido1@gcrc.med.nyu.edu	(212) 263-6479		\N	\N	\N
69	William	Morgan	\N	kip@wakousa.com	8047141946		\N	\N	\N
70	George	Serbedzija	\N	gserbedzija@primeradx.com	508-618-2300		\N	\N	\N
71	Pei	Wang	\N	pwang@fredhutch.org	206-667-4175		\N	\N	\N
72	Dick	Smith	\N	dick.smith@pnl.gov	509-376-0723		\N	\N	\N
73	Deanna	Wallace	\N	dwallace@atlanticurology.com	3862488215		\N	\N	\N
74	Imamah	Younus	\N	iyounus@mednet.ucla.edu	310-794-2719		\N	\N	\N
75	Prof. Dr. Olga	Golubnitschaja	\N	Olga.Golubnitschaja@ukb.uni-bonn.de	+49-228 287 15982		\N	\N	\N
76	Rachel	Ostroff	\N	rostroff@somalogic.com	303-625-9043		\N	\N	\N
77	David	Misek	\N	dmisek@umich.edu	734-763-0917		\N	\N	\N
78	Christine	Brooks	\N	brooksc4@mskcc.org	6462272265		\N	\N	\N
79	Michael	Zwick	\N	mzwick@neoclone.com	608-260-8190		\N	\N	\N
80	Miral	Dizdar	\N	miral@nist.gov	301-975-2581		\N	\N	\N
81	Yingxi	Zhang	\N	yingxiz@umich.edu	7347649308		\N	\N	\N
82	Jorge	Gomez	\N	gomezj@mail.nih.gov	301-435-9040		\N	\N	\N
83	Sarah	Fabian	\N	fabiansa@mail.nih.gov	301-435-9043		\N	\N	\N
84	Rajeev	Agarwal	\N	agarwalraj@mail.nih.gov	301-435-9042		\N	\N	\N
85	Thomas	Havell	\N	thomas.c.havell@vanderbilt.edu	615-875-6192		\N	\N	\N
86	Christopher	DeCotiis	\N	christopher.decotiis@nyumc.org	212 263 6126		\N	\N	\N
87	James	Lockhart	\N	jblockhart@surgassoc.com	918-481-4800		\N	\N	\N
88	Robert	Weiss	\N	rhweiss@ucdavis.edu	530-752-4010		\N	\N	\N
89	Bruce	Ponder	\N	bajp@mole.bio.cam.ac.uk	01223 336 900		\N	\N	\N
90	Barry	Dowell	\N	barry.dowell@abbott.com	847-937-5124		\N	\N	\N
91	Joseph	Califano	\N	jcalifa@jhmi.edu	410-955-6420		\N	\N	\N
92	Irene	McNeill	\N	irene.mcneill@sw.ca	416-480-6100, ext. 2431		\N	\N	\N
93	Beth	Dudley	\N	dudleyre@upmc.edu	4126233105		\N	\N	\N
94	Tung-Chun	Ko	\N	tcko@umich.edu	734-763-2461		\N	\N	\N
95	Aman	Buzdar	\N	abuzdar@mdanderson.org	(713) 792-2817		\N	\N	\N
96	Angie	Broussard	\N	anbroussa@mdanderson.org	(713) 792-6363		\N	\N	\N
97	Melissa	Martin	\N	mkmartin@mdanderson.org	(713) 792-7759		\N	\N	\N
1	Sean	Kelly	\N	Sean.Kelly@jpl.nasa.gov		None	f	f	\N
1317	Ann	Hsing	8				f	f	\N
10	Daniel	Crichton	10	dan.crichton@jpl.nasa.gov	8183549155	None	f	f	\N
14	Hiro	Yamada	\N	h-yamada@wakousa.com	+1 (650) 210.9153		f	f	113
8	Kristen	Anton	10	Kristen.Anton@dartmouth.edu	6036501968	None	f	f	\N
7	Christopher	Amos	8	Christopher.I.Amos@Dartmouth.edu	+1 (603) 650.1729	None	f	f	
6	Heather	Kincaid	6	heather.kincaid@jpl.nasa.gov	+1 (206) 369.2903	None	f	f	
98	Ian	Thompson	\N	thompsoni@uthscsa.edu	(210) 567-5643		\N	\N	\N
99	Allyson	Coopersmith	\N	allyson.coopersmith@mountsinai.org	212-241-0257		\N	\N	\N
100	David	Sidransky	\N	dsidrans@jhmi.edu	(410) 502-5155		\N	\N	\N
102	William	Rom	\N	william.rom@nyumc.org	(212) 263-6479		\N	\N	\N
103	Stephen	Meltzer	\N	smeltzer@jhmi.edu	410-502-6071		\N	\N	\N
104	Alan	Partin	\N	apartin2@jhmi.edu	(410) 614-4876		\N	\N	\N
105	Matthias	Weiss	\N	weiss.matthias@marshfieldclinic.org	715-389-4773		\N	\N	\N
106	Srivenkatesh	Ganeshan	\N	srivenkatesh.ganeshan@mountsinai.org	2126598045		\N	\N	\N
107	Richard	Luduena	\N	luduena@uthscsa.edu	210-567-3732		\N	\N	\N
108	Stephanie	Rodriguez	\N	smrodrig@mail.mdanderson.org	713-563-1255		\N	\N	\N
109	Linda	Patenaude	\N	linda.patenaude@yale.edu	(203) 785-5803		\N	\N	\N
110	Bruce	Trock	\N	btrock@jhmi.edu	(202) 687-0814		\N	\N	\N
111	Elizabeth	Unger	\N	eru0@cdc.gov	(404) 639-3533		\N	\N	\N
112	Katy	McBeath	\N	katy.mcbeath@viachristi.org	316-268-5205		\N	\N	\N
113	John	Semmes	\N	semmesoj@evms.edu	(757) 446-5904		\N	\N	\N
114	Stacy	Floyd	\N	stacy.floyd@thermofisher.com	301&#8208;694&#8208;5911		\N	\N	\N
115	Sang	Jeong	\N	s-jeong@wakousa.com	650-210-9153		\N	\N	\N
116	Fernando	Acuna	\N	FACUNA@mutual.cl			\N	\N	\N
117	Barbara	Monje	\N	bmonje@mutual.cl			\N	\N	\N
118	Hoyt	Matthai	\N	hoyt.matthai@thermofisher.com	(301) 694-5911		\N	\N	\N
119	Kathy	Rushing	\N	rushingk@slu.edu	314-977-9320		\N	\N	\N
120	Munirh	Taafaki	\N	mtaafaki@cc.hawaii.edu	808.356.5798		\N	\N	\N
121	Kim	Derr	\N	kaderr@geisinger.edu	570-271-8656		\N	\N	\N
122	Shanna	Cheng	\N	shannac@med.umich.edu	7346470236		\N	\N	\N
123	Marko	Vuskovic	\N	mvuskovic@mail.sdsu.edu	(858) 344-7857		\N	\N	\N
124	Mohammad	Ostovaneh	\N	mostova1@jhmi.edu	443 676 5410		\N	\N	\N
125	Pamela	Paris	\N	Pamela.paris@ucsf.edu	(415) 514-2559		\N	\N	\N
126	Dipen	Parekh	\N	parekhd@med.miami.edu	305-243-6591		\N	\N	\N
127	Vincent	Laudone	\N	laudonev@mskcc.org	(646) 422-4306		\N	\N	\N
128	Karen	Smith-McCune	\N	kmccune@cc.ucsf.edu	415-476-7882		\N	\N	\N
129	Leonard	Marks	\N	lsmarks@ucla.edu	310-559-9800		\N	\N	\N
130	Mary	Deal	\N	Mdeal@beaumont.edu	248/ 551/ 8554		\N	\N	\N
131	Kim	Do	\N	kimdo@mdanderson.org	(713) 794-4155		\N	\N	\N
132	Harry	Grates	\N	grateshe@karmanos.org	313-578-4343		\N	\N	\N
133	Ruth	Murphy	\N	ruth.murphy@fccc.edu	215-214-3223		\N	\N	\N
134	Shanshan	Zhao	\N	szhao@fredhutch.org	206-667-7176		\N	\N	\N
135	Nicole	Capriotti	\N	nicole.capriotti@fccc,edu	215-214-3222		\N	\N	\N
136	Robert	Rheaume	\N	robert.l.rheaume@dartmouth.edu	603-650-3429		\N	\N	\N
137	Angie	Glazier	\N	aglazier@umich.edu	734-647-1417		\N	\N	\N
138	Harry	Wasvary	\N	SSitarek@beaumont.edu	248-541-8554		\N	\N	\N
139	Thomas	Morton	\N	urotec@rogers.com	905-721-3550		\N	\N	\N
140	Thomas	Schmittgen	\N	schmittgen.2@osu.edu	614-292-3456		\N	\N	\N
141	Jack	Groskopf	\N	Jack.Groskopf@hologic.com	858-410-8850		\N	\N	\N
142	Shelley	Burton	\N	tucsg@hotmail.com	416-256-9606		\N	\N	\N
143	Beth	Parker	\N	bparker@att.net	847-570-3115		\N	\N	\N
144	Peter	Nelson (UW)	\N	pnelson@fredhutch.org	206-667-3377		\N	\N	\N
145	Kelly	Wirtala	\N	kwirtala@fredhutch.org	206-667-5604		\N	\N	\N
146	Rosario	Mendez-Meza	\N	mezar@uthscsa.edu	210 567 4028		\N	\N	\N
147	Shannon	Lyons	\N	splyons@partners.org	617-632-6474		\N	\N	\N
148	Laura	Beretta	\N	lberetta@fredhutch.org	206-667-7080		\N	\N	\N
149	William	Nelson	\N	bnelson@jhmi.edu	410-955-8822		\N	\N	\N
150	Hamdi	Ali	\N	ali.hamdi@mayo.edu	6128049288		\N	\N	\N
151	Enzo	Candia	\N	enzo.candia@gmail.com			\N	\N	\N
152	Sally	Hirschberg	\N	sallyh@uab.edu	205-934-5778		\N	\N	\N
153	Veena	Thyagarajan196	\N	vthyagar@umich.edu	734-763-7997		\N	\N	\N
154	Stephanie	Bey	\N	stephanie.bey@uphs.upenn.edu	215-308-8602		\N	\N	\N
155	Timothy	Randolph	\N	trandolp@fredhutch.org	206-667-1079		\N	\N	\N
156	Elizabeth	Maloney	\N	EMaloney1@cdc.gov	404-639-2349		\N	\N	\N
157	Robert	Ferris	\N	ferrisrl@upmc.edu	412-647-0954		\N	\N	\N
158	Sabina	Musovic	\N	sabina.musovic@nyumc.org	212-263-2024		\N	\N	\N
159	Noma	Dakhil	\N	dakhlin@slu.edu	314-577-8764		\N	\N	\N
160	Cheryl	Vernon	\N	cvernon@cc.hawaii.edu	808-564-5807		\N	\N	\N
161	Christine	Hoover	\N	christine.d.hoover@us.army.mil	8084331952		\N	\N	\N
162	Kathleen	Shota	\N	kshota@cc.hawaii.edu	808-586-2979		\N	\N	\N
163	Diana	Kucmeroski	\N	dkucmero@cc.hawaii.edu	8084331951		\N	\N	\N
164	Kili	Goudey	\N	goudeykl@slu.edu	314-977-9410		\N	\N	\N
165	Belinda	Nghiem	\N	bnghiem@u.washington.edu	2063273625		\N	\N	\N
166	Ivan	Blasutig	\N	ivan.blasutig@uhn.on.ca	416-340-4800 ext. 7199		\N	\N	\N
167	Abraham	Martinez	\N	Abraham.Martinez@utsouthwestern.edu	214-645-8787		\N	\N	\N
168	Gary	Norman	\N	glnorman@inovadx.com	858-586-9900		\N	\N	\N
169	David	Greco	\N	djgreco@med.umich.edu	260-415-6530		\N	\N	\N
170	LaKita	May	\N	mayl@slu.edu	314-977-9337		\N	\N	\N
171	William	Isaacs	\N	wisaacs@jhmi.edu	410-955-2518		\N	\N	\N
172	Dana	Pape-Zambito	\N	Dana.Pape-Zambito@fccc.edu	215-214-4286		\N	\N	\N
173	Jianliang	Dai	\N	jdai4@mdanderson.org	713-745-7325		\N	\N	\N
174	Teresa	Mettler	\N	mettler.teresa@mayo.edu	507-538-0015		\N	\N	\N
175	Almira	Catic	\N	acatic@emory.edu	404-778-7397		\N	\N	\N
176	Alice	Hannon	\N	ahannon@lrri.org	505-348-9442		\N	\N	\N
177	Kara	Golya	\N	keg18@pitt.edu	412-623-3105		\N	\N	\N
178	Kim	Chamberlin	\N	kim.chamberlin@pnl.gov	509-376-5317		\N	\N	\N
179	Kathleen	Close	\N	kclose@u.washington.edu	206-543-0989		\N	\N	\N
180	Munira	Hussain	\N	hussain@umich.edu	734-763-7281		\N	\N	\N
181	Erica	Haczkiewicz	\N	ehaczkiewicz@enh.org	847-570-2339		\N	\N	\N
182	Marian	MacDonnell	\N	mmacdonnell@partners.org	617-632-3656		\N	\N	\N
183	Jing	Ning	\N	jning@mdanderson.org	713-792-5310		\N	\N	\N
184	Sharma	Kusum	\N	kusum.sharma@sw.ca	416-480-6100, ext. 7939		\N	\N	\N
185	Carl	Barrett	\N	carl.barrett@novartis.com	617-871-3700		\N	\N	\N
186	Jorge	Marrero	\N	jorge.marrero@utsouthwestern.edu	214-645-6284		\N	\N	\N
188	Larry	Norton	\N	nortonl@mskcc.org	646-888-5319		\N	\N	\N
189	Walter	Park	\N	wgpark@stanford.edu	650-723-4102		\N	\N	\N
190	Vathany	Kulasingam	\N	vathany.kulasingam@uhn.ca	416-340-4800 ext 8589		\N	\N	\N
191	William	Grady	\N	wgrady@fredhutch.org	206-667-1107		\N	\N	\N
187	Richard	Mazurchuk	8	richard.mazurchuk@nih.gov	(240) 276-7126		t	f	\N
192	James	Lyons-Weiler	\N	lyonsweilerj@upmc.edu	412-487-4375		\N	\N	\N
193	Donna	Gibson	\N	dgibson@bu.edu	617-638-7125		\N	\N	\N
194	Gary	Longton	\N	glongton@fredhutch.org	206-667-4381		\N	\N	\N
195	Daisy	Lee	\N	del5@cdc.gov	(404) 639-2932		\N	\N	\N
196	Jordan	Winter	\N	Jordan.Winter@jefferson.edu	215-955-9604		\N	\N	\N
197	Mary	Ontko	\N	mary.ontko@wright.edu	937-775-1360		\N	\N	\N
198	Carol	Jenkins	\N	jenkinsca@uthscsa.edu	210-567-3611		\N	\N	\N
199	Dawn	Coverley	\N	dc17@york.ac.uk	+44-1904-328-664		\N	\N	\N
200	Edward	Patz	\N	patz0002@mc.duke.edu	(919) 684-7311		\N	\N	\N
201	Steve	Shak	\N	sshak@genomichealth.com	650-569-2251		\N	\N	\N
202	Doreen	Perkins	\N	doreen.perkins@ccc.uab.edu	205-975-0088		\N	\N	\N
203	Connie	Martinell	\N	urotec@rogers.com	905-721-4300, ext. 5353		\N	\N	\N
204	Terri	Moreau	\N	drgoldfarb@bellnet.ca	705-482-1083		\N	\N	\N
205	Yvonne	Hildreth	\N	drgoldfarb@bellnet.ca	705-482-1063		\N	\N	\N
206	Bernard	Goldfarb	\N	drgoldfarb@bellnet.ca	705-482-1063		\N	\N	\N
207	Chinedu	Ukaegbu	\N	cukaegbu@partners.org	617-632-6355		\N	\N	\N
208	Arun	Mathur	\N	urotec@rogers.com	905-721-3550		\N	\N	\N
209	Karina	Steffensen	\N	Karina.Dahl.Steffensen@vgs.regionsyddanmark.dk	45 79406000		\N	\N	\N
210	Kirill	Prokrym	\N	Kirill.Prokrym@nyumc.org	2122632024		\N	\N	\N
211	Susan	Graber	\N	susan.graber@sanfordhealth.org	701-234-6296		\N	\N	\N
212	Philip	Hemken	\N	philip.hemken@abbott.com	224-668-9561		\N	\N	\N
213	Matthew	Isenberg	\N	mxi195@jefferson.edu	215-503-2983		\N	\N	\N
214	Stephen	Hawes	\N	hawes@u.washington.edu	(206) 616-9787		\N	\N	\N
215	Hilary	Boyer5	\N	hboyer@fredhutch.org	2066671220		\N	\N	\N
216	Yuzheng	Zhang	\N	yzhang@fredhutch.org	206-667-7160		\N	\N	\N
217	Michael	Collins	\N	Michael.Collins@fccc.edu	215-214-1496		\N	\N	\N
218	Patrick	Brown	\N	patribro@umich.edu	734-647-7558		\N	\N	\N
219	Brian	Kleiner	\N	bmklein@umich.edu	7346477558		\N	\N	\N
220	Richard	Levenson	\N	rml@post.harvard.edu	617-803-8860		\N	\N	\N
221	Craig	Tuttle	\N	ctuttle@transgenomic.com	402-452-5430		\N	\N	\N
222	Darshana	Dixit	\N	ddixit100@yahoo.com	919-684-5028		\N	\N	\N
223	Julius	Nyalwidhe	\N	Nyalwijo@evms.edu	757-446-5682		\N	\N	\N
224	Cynthia	Webb	\N	Cynthia.Webb@Duke.edu	919-684-5028		\N	\N	\N
225	Linda	Hager	\N	lharger@bellnet.ca	905-681-9149		\N	\N	\N
226	Maggie	Tomasini	\N	tomasinim@uthscsa.edu	210-450-0705		\N	\N	\N
227	Angela	Presson	\N	apresson@stat.ucla.edu	310-825-5916		\N	\N	\N
228	Christine	Berg	\N	bergc@mail.nih.gov	301-480-0465		\N	\N	\N
229	Theresa	Chan	\N	tchan@jmhi.edu	410 502-5160		\N	\N	\N
230	Steve	Horvath	\N	shorvath@mednet.ucla.edu	310-825-9299		\N	\N	\N
231	Michael	Fishbein	\N	mfishbein@mednet.ucla.edu	310-825-9731		\N	\N	\N
232	Vei	Mah	\N	vmah@mednet.ucla.edu	310-267-2930		\N	\N	\N
233	Imelda	Tenggara	\N	itenggara@urology.ucsf.edu	415-353-7348		\N	\N	\N
234	Erin	Maresh	\N	emaresh@mednet.ucla.edu	310-267-2930		\N	\N	\N
235	Brian	Roberts	\N	broberts@grandstrandurology.com	843-449-1010		\N	\N	\N
236	Mersiha	Torlak	\N	mhotic@emory.edu	404-778-4823		\N	\N	\N
237	Tamara	Williams	\N	tamara.williams@uphs.upenn.edu	215-898-0153		\N	\N	\N
238	Felicia	Evans Long	\N	felicia.evanslong@nih.gov	240-276-5076		\N	\N	\N
239	Christy	Gilchrist	\N	Christy.Gilchrist@hshs.org	920-433-8272		\N	\N	\N
240	Mary	Kaminski	\N	mary.kaminski@uphs.upenn.edu	215-615-4356		\N	\N	\N
241	Rosemarie	Gagliardi	\N	rosemarie.gagliardi@msnyuhealth.org	212-659-8050		\N	\N	\N
242	Linda	Stadheim	\N	stadheim.linda@mayo.edu	507-284-6202		\N	\N	\N
243	Willie	Bodger	\N	wbodger@fredhutch.org	206-667-1964		\N	\N	\N
244	Syed	Hashmi	\N	hashmisa@slu.edu	314-577-8764		\N	\N	\N
245	Kristin	Honer	\N	kristin.honer@essentiahealth.org	218 786-8141		\N	\N	\N
246	Wilson	Wielma	\N	WVIELMA@mutual.cl			\N	\N	\N
247	Lan	Zhang	\N	lan1@stanford.edu	650-498-5691		\N	\N	\N
248	Tarek	Kandil	\N	kandilto@evms.edu	757-446-7910		\N	\N	\N
249	Lina	Jandorf	\N	lina.jandorf@mssm.edu	212-659-5506		\N	\N	\N
250	Christina	Caldwell	\N	Christina.caldwell@mercy.net	405-752-3392		\N	\N	\N
251	Marileila	Garcia	\N	marileila.garcia@uchsc.edu	(303) 724-3147		\N	\N	\N
252	Jong	Park	\N	parkj@moffitt.usf.edu	(813) 903-6829		\N	\N	\N
253	Carolyn	Muller	\N	cmuller@salud.unm.edu	505-272-3392		\N	\N	\N
254	Andra	Frost	\N	afrost@path.uab.edu	(205) 934-6031		\N	\N	\N
255	Bao-Ling	Adam	\N	badam@mail.mcg.edu	706-823-3973		\N	\N	\N
256	Robert	Schoen	\N	rschoen@pitt.edu	412-648-9825		\N	\N	\N
257	Aaron	Bungum	\N	bungum.aaron@mayo.edu	507-266-1192		\N	\N	\N
258	Ying Hsiu	Su	\N	ying-hsiu.su@drexelmed.edu	215-489-4907		\N	\N	\N
259	Subrata	Sen	\N	ssen@mdanderson.org	(713) 634-6040		\N	\N	\N
260	Alexander	Dekovich	\N	adekovich@mdanderson.org	713-794-5073		\N	\N	\N
261	George	Tuszynski	\N	gpt@temple.edu	215-707-6451		\N	\N	\N
262	Jessica	Branski	\N	jbranski@med.umich.edu	7346477558		\N	\N	\N
263	Nancy	Fisher (formerly Ruther)	\N	nrfisher@gundersenhealth.org	608-775-2733		\N	\N	\N
264	Kendrith	Rowland	\N	kendrith.rowland@carle.com	217-383-3512		\N	\N	\N
265	Becky	Harbine	\N	bharbine@fredhutch.org	206-667-6113		\N	\N	\N
266	Dana	Barbour	\N	dlbarbou@gundersenhealth.org	608-775-0646		\N	\N	\N
267	Amy	Dempe	\N	amy.dempe@wright.edu	937-775-1364		\N	\N	\N
268	John	Stroehlein	\N	jrstroeh@mdanderson.org	713-794-5073		\N	\N	\N
269	Gottumukkala	Raju	\N	gsraju@mdanderson.org	713-794-5073		\N	\N	\N
270	Jonelle	Horsley	\N	jhorsley@atlanticurology.com	3862488215		\N	\N	\N
271	Pamela	Salyer	\N	psalyer@atlanticurology.com	3862398511		\N	\N	\N
272	William	Hancock	\N	wi.hancock@neu.edu	617-373-4881		\N	\N	\N
273	Mary (Beth)	Kos	\N	mekos@unmc.edu	402-559-3652		\N	\N	\N
274	Susan	Kingston	\N	slk@bcm.edu	713-798-8514		\N	\N	\N
275	Brian	Gardner	\N	bgardner@mednet.ucla.edu	310-206-3881		\N	\N	\N
276	Paul	Cairns	\N	P_Cairns@fccc.edu	215-728-5635		\N	\N	\N
277	Bonnie	King	\N	bonnie.king@stanford.edu	650-714-5655		\N	\N	\N
278	Zvi	Livneh	\N	zvi.livneh@weizmann.ac.il	972-8-9343203		\N	\N	\N
279	Victoria	Stevens	\N	vlsteve@emory.edu	404-616-6945		\N	\N	\N
280	Robert	Veltri	\N	rveltri1@jhmi.edu	410-955-6380		\N	\N	\N
281	Samuel	Brayer	\N	sam.brayer@uphs.upenn.edu	2153498548		\N	\N	\N
282	Matthew	Young	\N	youngma@mail.nih.gov	2402765846		\N	\N	\N
283	Carla	Lamb	\N	Carla.R.Lamb@lahey.org	781-744-3240		\N	\N	\N
284	Preston	Steen SCCOC	\N	preston.steen@sanfordhealth.org	701-234-5899		\N	\N	\N
285	Yingye	Zheng	\N	yzheng@fredhutch.org	206-667-7580		\N	\N	\N
286	John	Park	\N	jpark@cc.ucsf.edu	415-502-3844		\N	\N	\N
287	Kristen	Anton	\N	kristen.anton@dartmouth.edu	603-650-3402		\N	\N	\N
288	Gad	Rennert	\N	rennert@tx.technion.ac.il			\N	\N	\N
289	Margaret	Pepe	\N	mspepe@u.washington.edu	206-667-7398		\N	\N	\N
290	David	Beach	\N	dbeach@genetica.cc	(617) 621-1222 x224		\N	\N	\N
291	Yingming	Zhao	\N	yingming.zhao@utsouthwestern.edu	(214) 648-7947		\N	\N	\N
292	Peter	Lin	\N	plin@fredhutch.org	(206) 667-7335		\N	\N	\N
293	Chulso	Moon	\N	cmoon@cangenbio.com	222 222 2222		\N	\N	\N
294	Susan	Stocker	\N	sstocker@northshore.org	847-570-1322		\N	\N	\N
295	Raja	Mazumder	\N	mazumder@gwu.edu	202-994-5004		\N	\N	\N
296	Becky	Hollister	\N	holli022@umn.edu	6126245797		\N	\N	\N
297	Carol	Lieban	\N	clieban@queens.org	808-691-8575		\N	\N	\N
298	Kam-Meng	Tchou-Wong	\N	kam-meg.tchou-wong@nyumc.org	212-263-7098		\N	\N	\N
299	William	Grady UW	\N	wgrady@fredhutch.org	206-667-1107		\N	\N	\N
300	Eric	Klein	\N	kleine@ccf.org	216.444.5591		\N	\N	\N
301	Vijay	Modur	\N	vijay.modur@novartis.com	617-871-3393		\N	\N	\N
302	Anna	Faino	\N	afaino@fredhutch.org	2066674995		\N	\N	\N
303	Kathleen	Saltarelli	\N	kathleen.saltarelli@fccc.edu	215-728-2516		\N	\N	\N
304	Ye (Tony)	Hu	\N	yhu@houstonmethodist.org	713-441-5530		\N	\N	\N
305	Vladimir	Knezevic	\N	vknezevic@2020gene.com	240-453-6339		\N	\N	\N
306	Norman	Marcon	\N	norman.marcon@utoronto.ca	(416) 926-7763		\N	\N	\N
307	Juan	Torres	\N	jptorres@clc.cl			\N	\N	\N
308	Wanda	Burdette	\N	wburdette@gibbscc.org	864-560-6810		\N	\N	\N
309	Nancee	Nichols	\N	nicho012@umn.edu	612-624-0104		\N	\N	\N
310	Ilse	Urza	\N	iurzua@mutual.cl			\N	\N	\N
311	Raj	Varadarajan	\N	raj@gibba.com	978-387-9663		\N	\N	\N
312	Asfaw	Mesfin	\N	mesfi003@umn.edu	612-624-0104		\N	\N	\N
313	Andrew	Wagner	\N	awagner@bidmc.harvard.edu	617-667-2898		\N	\N	\N
314	Nethra	Sambamoorthi	\N	nethra@gibba.com	732-792-3945		\N	\N	\N
315	Alvin	Berger	\N	aberger@metabolon.com	919-595-2280		\N	\N	\N
316	Lisa	Finkelstein	\N	LFinkels@mail.nih.gov	301-451-7458		\N	\N	\N
317	Akemi	Miyamoto	\N	akemi.miyamoto@va.gov	206-277-5598		\N	\N	\N
318	Dolores	Poe	\N	dyp6@cdc.gov	(404) 639-3532		\N	\N	\N
319	Catherine	Brewer	\N	cbrewer@saintfrancis.com	918-494-6996		\N	\N	\N
320	Sally	Hollister	\N	smh79@pitt.edu	412-623-4124		\N	\N	\N
321	Besmira	Hasalla	\N	besmira.hasalla@beaumont.edu	248.964.6883		\N	\N	\N
322	Ruth	Fazzari	\N	Ruth.Fazzari@beaumont.edu	248-964-9159		\N	\N	\N
323	Megan	Cook	\N	megan.m.cook@vanderbilt.edu	615-343-3274		\N	\N	\N
324	Heather	Reynolds	\N	heather.reynolds@vanderbilt.edu	615-875-7634		\N	\N	\N
325	Sherrita	Sweet	\N	sasweet@saintfrancis.com	918-494-2543		\N	\N	\N
326	Debra	KuKuruga	\N	dkukuruga@umm.edu	410 960 0316		\N	\N	\N
327	Tanios	Bekaii-Saab	\N	Tanios.Bekaii-Saab@osumc.edu	614-293-7280		\N	\N	\N
328	Jordan	Gann	\N	jordan.gann@vanderbilt.edu	6158756138		\N	\N	\N
329	Shaker	Dakhil	\N	shaker.dakhil@cancercenterofkansas.com	316-268-5374		\N	\N	\N
330	Leonor	Busuego	\N	lbusuego@fredhutch.org	206-667-4645		\N	\N	\N
331	Keith	Shulman	\N	kshulman@weisshospital.com	708-783-7596		\N	\N	\N
332	Lindy	Bussell	\N	vrice@theurologygroup.cc	513-366-3412		\N	\N	\N
333	Courtney	Daniels	\N	crdaniels@my.trine.edu	734-936-3363		\N	\N	\N
334	Rajender	Reddy	\N	rajender.reddy@uphs.upenn.edu	215-662-4276		\N	\N	\N
335	Kara	Cooper	\N	kkendall@fredhutch.org	206-667-4376		\N	\N	\N
336	Alex	Befeler	\N	befelera@slu.edu	314-577-8764		\N	\N	\N
337	Lewis	Roberts	\N	lewis.roberts@mayo.edu	507-538-4877		\N	\N	\N
338	Myron	Schwartz	\N	myron.schwartz@mountsinai.org	212-241-2891		\N	\N	\N
339	Daniel	Lin UW	\N	dlin@uw.edu	206-221-0797		\N	\N	\N
340	Jennifer	Cassano	\N	jcassano@stanford.edu	650-804-2460		\N	\N	\N
341	Marsha	Faulk	\N	sharrel@grandstrandurology.com	843-449-1010, ext 268		\N	\N	\N
342	Mona	Gilkerson	\N	monag@u.washington.edu	206-731-4269		\N	\N	\N
343	Jane	Fountain	\N	fountai@mail.nih.gov	301-435-9042		\N	\N	\N
344	Nancy	Levin	\N	levinn@karmanos.org	313-578-4344		\N	\N	\N
345	Jeanine	Phan	\N	jtphan@stanford.edu			\N	\N	\N
346	Barbara	Andrews	\N	barbara.a.andrews42.civ@mail.mil	808-433-4118		\N	\N	\N
347	Joseph	Bigley	\N	joseph.bigley@mdxhealth.com	919-281-0980, ext. 12		\N	\N	\N
348	Thomas	Reynolds	\N	treynolds@aibiotech.com	1-800-735-9224		\N	\N	\N
349	Raju	Kucherlapati	\N	rkucherlapati@partners.org	617-525-4445		\N	\N	\N
350	Jeffrey	Tang	\N	jmt2007@med.cornell.edu	508-839-1998		\N	\N	\N
352	Dianne	Geraldizo	\N	geraldizodb@cc.ucsf.edu	415-476-8825		\N	\N	\N
353	Michael	Meyers	\N	mmeyers1@partners.org	6175257603		\N	\N	\N
354	Gang	Zeng	\N	gzeng@mednet.ucla.edu	310-794-7635		\N	\N	\N
355	Robert	Dunne	\N	rob.dunne@csiro.au	+61 2 9325 3263		\N	\N	\N
357	Lorna	Nolan	\N	lnolan@fredhutch.org	206-667-6837		\N	\N	\N
358	Edward	Hirschowitz	\N	edward.hirschowitz@uky.edu	859-323-5045		\N	\N	\N
359	Ite	Laird-Offringa	\N	ilaird@usc.edu	323-865-0158		\N	\N	\N
360	Caitlin	Breakey	\N	breakeyc@med.umich.edu	734 647-7558		\N	\N	\N
361	Seth	Crockett	\N	seth_crockett@med.unc.edu	919-962-2608		\N	\N	\N
362	Teresa	Nicks	\N	tnicks@atlanticurology.com	3862368512		\N	\N	\N
363	Joe	Buechler	\N	jbuechler@biosite.com	858-805-3003		\N	\N	\N
364	Timothy	Kelleher	\N	tkelleher@queens.org	808-691-8582		\N	\N	\N
365	Wayne	Gosbee	\N	wgosbee@mdanderson	713-745-3979		\N	\N	\N
366	Jeannie	McMillen	\N	jmcmillen@atlanticurology.com	3867749096		\N	\N	\N
367	Wan	Lam	\N	wanlam@bccrc.ca	604-675-8112		\N	\N	\N
368	Muneesh	Tewari	\N	mtewari@fredhutch.org	206-667-5165		\N	\N	\N
369	Cim	Edelstein	\N	cedelste@fredhutch.org	206 667 4995		\N	\N	\N
370	Nancy	Dolan	\N	n/a	312-695-4689		\N	\N	\N
371	Eve	Karloski	\N	kalynchuke2@upmc.edu	4126233105		\N	\N	\N
372	Carolyn	Winfrey	\N	cswinfr@emory.edu	404-778-7397		\N	\N	\N
373	Kristen	Douglas	\N	kristen.douglas@emory.edu	404-778-1872		\N	\N	\N
374	Robert	Uzzo	\N	Robert.Uzzo@fccc.edu	(215) 728-3501		\N	\N	\N
375	Cassandra	Glivic	\N	ckg10@pitt.edu	412-605-2299		\N	\N	\N
376	David	Chen	\N	David.Chen@fccc.edu	(215) 728-2548		\N	\N	\N
377	Yvonne	Lee	\N	yvonn3@stanford.edu	4083180626		\N	\N	\N
378	Tracey	Marsh	\N	tmarsh@fredhutch.org	2066677460		\N	\N	\N
379	Michael	Nguyen	\N	mdnguyen@stanford.edu	6504985691		\N	\N	\N
351	Lynn	Sorbara	8	lynns@mail.nih.gov	2402767135		t	f	\N
380	Joseph	Hoang	\N	jhoang23@stanford.edu	408-914-8887		\N	\N	\N
381	Kim	Turgeon	\N	kturgeon@umich.edu	(734) 647-7558		\N	\N	\N
382	Maria	Medina	\N	medinam8@uthscsa.edu	210-567-3224		\N	\N	\N
383	Lori	Kollath	\N	lkollath@uw.edu	2065431461		\N	\N	\N
384	Sharon	Palko	\N	sharon.palko@osumc.edu	6142923063		\N	\N	\N
385	Alex	Van-Den-Ende	\N	avanden@uw.edu	206-543-1461		\N	\N	\N
386	Ronny	Drapkin	\N	ronny_drapkin@dfci.harvard.edu	617-632-4380		\N	\N	\N
387	Steven	Carr	\N	scarr@broadinstitute.org	617-714-7630		\N	\N	\N
388	BSA	Group	\N	gnolebaad@mail.nih.gov	240-276-7146		\N	\N	\N
389	Chung	Lee	\N	c-lee7@northwestern.edu	312-908-2004		\N	\N	\N
390	Dan	Mercola	\N	dmercola@uci.edu	949-824-1298		\N	\N	\N
391	Sanjiv	Gambhir	\N	sgambhir@stanford.edu	650-725-2309		\N	\N	\N
392	Avrum	Spira	\N	aspira@bu.edu	617-414-6980		\N	\N	\N
393	Carlo	Croce	\N	carlo.croce@osumc.edu	614-292-4930		\N	\N	\N
394	Vadim	Backman	\N	v-backman@northwestern.edu	847-467-1870		\N	\N	\N
395	Kena	McDermott	\N	mcdermott.kena@mcrf.mfldclin.edu	715-221-7236		\N	\N	\N
396	Upender	Manne	\N	Manne@uab.edu	(205) 934-4276		\N	\N	\N
397	Diane	Simeone	\N	simeone@med.umich.edu	734-615-1600		\N	\N	\N
398	Michael	Kayser	\N	MAKayser@saintfrancis.com	918-494-7296		\N	\N	\N
399	Deneice	Kramer	\N	deneice.kramer@essentiahealth.org	218-786-3371		\N	\N	\N
400	David	Ransohoff	\N	ransohof@med.unc.edu	919-966-1256		\N	\N	\N
401	Debbie	Snyder	\N	drsnyder@umich.edu	(734)232-0827		\N	\N	\N
402	Randall	Brand	\N	reb53@pitt.edu	412-623-0021		\N	\N	\N
403	Claudia	Axvig	\N	claudia.axvig@sanfordhealth.org	701.234.7563		\N	\N	\N
404	Jim	Gladney	\N	jim.gladney@ccc.uab.edu	205-975-0088		\N	\N	\N
405	Danielle	Sewell	\N	sewell@brtlabs.com	1-800-765-5170 ext. 113		\N	\N	\N
406	Albert	Malcolm	\N	sifletcher@atriummedcenter.org	513-420-5674		\N	\N	\N
407	Jerry	Haney	\N	jerry.haney@uchsc.edu	(303) 315-1808		\N	\N	\N
408	Debra	Camino	\N	caminod@ccf.org	(216) 444-5591		\N	\N	\N
409	Apinya	Leerapun	\N	atositarat@yahoo.com	507-287-0523		\N	\N	\N
410	Paul	Bunn	\N	paul.bunn@uchsc.edu	303-724-3155		\N	\N	\N
411	Mark	Siegel	\N	mark1.siegel@mountsinai.org	212-241-8852		\N	\N	\N
412	Mindie	Nguyen	\N	mindiehn@stanford.edu	650-498-5691		\N	\N	\N
413	Hui	Zhang	\N	hzhang32@jhmi.edu	410-502-8149		\N	\N	\N
414	Steven	Smith	\N	ssmith@coh.org	626-301-8316		\N	\N	\N
415	John	Wei	\N	jtwei@umich.edu	734-615-3040		\N	\N	\N
416	Nipun	Merchant	\N	nipun.merchant@vanderbilt.edu	615-322-2391		\N	\N	\N
417	Jose	Costa	\N	jose.costa@yale.edu	(203) 785-5803		\N	\N	\N
418	Henry	Lynch	\N	htlynch@creighton.edu	402-280-2942		\N	\N	\N
419	Steven	Petrou	\N	petrou.steven@mayo.edu	904-953-7330		\N	\N	\N
420	Xuan	Pham	\N	xtpham@aibiotech.com	804-648-3820		\N	\N	\N
421	Beverley	McNie	\N	bmcnie@beaumont.edu	248 551-5824		\N	\N	\N
422	Bernard	Bochner	\N	bochnerb@mskcc.org	646-422-4387		\N	\N	\N
423	Paul	Young	\N	young.paul@mayo.edu	904-953-7330		\N	\N	\N
424	Todd	Igel	\N	igel.todd@mayo.edu	904-953-7330		\N	\N	\N
425	Alexander	Parker	\N	parker.alexander@mayo.edu	904-953-7330		\N	\N	\N
426	Gregory	Broderick	\N	broderick.gregory@mayo.edu	904-953-7330		\N	\N	\N
427	William	Crissman	\N	crissman.william@mayo.edu	904-953-8401		\N	\N	\N
428	Michael	Wehle	\N	wehle.michael@mayo.edu	904-953-7330		\N	\N	\N
429	Emily	Panik	\N	emily.panik@uphs.upenn.edu	215-349-8563		\N	\N	\N
430	Kristen	Anton	\N	kristen.anton@dartmouth.edu	603-650-3402		\N	\N	\N
431	Anne	Sawyers	\N	asawyers@uci.edu	858-967-9101		\N	\N	\N
432	Atieno	Akumu	\N	aakumu@umm.edu	410-328-2959		\N	\N	\N
433	Susan	Honn	\N	shonn@mdanderson.org	(713) 792-7760		\N	\N	\N
434	Chaunda	Capers	\N	cdcapers@saintfrancis.com	918-494-1819		\N	\N	\N
435	Robert	Liu	\N	ryliu@mdanderson.org	713-745-7856		\N	\N	\N
436	Melvyn	Tockman	\N	Melvyn.Tockman@moffitt.org	(813) 745-1714		\N	\N	\N
437	Dana	Kontras	\N	kontras.dana@mayo.edu	904-953-8557		\N	\N	\N
438	Laura	Langseth	\N	laura.langseth@essentiahealth.org	218 786-3817		\N	\N	\N
439	Kellie	Romany	\N	kellie.romany@emory.edu	404-712-2589		\N	\N	\N
440	Kenneth	Cowan	\N	kcowan@unmc.edu	402-559-4238		\N	\N	\N
441	Stacy	Roberson	\N	roberson.stacy@mayo.edu	507-538-4877		\N	\N	\N
442	Kusum	Sharma	\N	kusum.sharma@sw.ca	416-480-6100-7939		\N	\N	\N
443	Mary Ellen	Benetz	\N	mary.benetz@fccc.edu	(215) 214-3904		\N	\N	\N
444	Lori	Sokoll	\N	lsokoll@jhmi.edu	(410) 955-2673		\N	\N	\N
445	Leslie	Mangold	\N	lmangold@jhmi.edu	(410) 955-2139		\N	\N	\N
446	Leslie	Douglas	\N	leslie.douglas@vanderbilt.edu	615-936-5795		\N	\N	\N
447	Mai	Brooks	\N	maibrooks@mednet.ucla.edu	310-206-2215		\N	\N	\N
448	Dean	Troyer	\N	troyer@uthscsa.edu	210-865-9165		\N	\N	\N
449	Kevin	Loughlin	\N	kloughlin@partners.org	617-732-6325		\N	\N	\N
450	Anne	Thompson	\N	anne.thompson@viachristi.org	316-268-5825		\N	\N	\N
451	Lora	Bettelon (formerly Williams)	\N	lorawill@umich.edu	734-615-3040		\N	\N	\N
452	Melody	Hickok	\N	melody.hickok@viachristi.org	3162685786		\N	\N	\N
453	Otis	Rickman	\N	otis.rickman@vanderbilt.edu	615-936-2256		\N	\N	\N
454	Samuel	Chadwick	\N	ChadwickS@urology.ucsf.edu	(415) 885-3679		\N	\N	\N
455	Jamie	Rothstein, RN, CCRC	\N	Jamie.Rothstein@jefferson.edu	215-955-9359		\N	\N	\N
456	Todd	Fennimore	\N	txf80@case.edu	216-286-4925		\N	\N	\N
457	Christopher	Li	\N	cili@fredhutch.org	206-667-7444		\N	\N	\N
458	Patrick	Schloss	\N	pschloss@umich.edu	734-763-3531		\N	\N	\N
459	Jordan	Preiss	\N	jordan.preiss@nyumc.org	212-263-2024		\N	\N	\N
460	Mary	Wahr	\N	mary.wahr@grcop.org	616-391-1230		\N	\N	\N
461	Hemant	Roy	\N	hkroy@bu.edu	847-657-1900		\N	\N	\N
462	Alvin	Liu	\N	aliu@u.washington.edu	206-221-0603		\N	\N	\N
463	Joseph	Zadra	\N	malehealth@bmts.com	705-727-0551		\N	\N	\N
464	Caitlin	Conaway	\N	ccconaway@atriummedcenter.org	5134205218		\N	\N	\N
465	Karen	Shirriff	\N	karenmhc@bmts.com	705-727-0551		\N	\N	\N
466	Jean	Humrich	\N	jeo@med.umich.edu	734-223-4863		\N	\N	\N
467	Andrew	Hart	\N	andrew.f.hart@jpl.nasa.gov	818-393-7402		\N	\N	\N
468	Sadaf	Ashfaq	\N	sashfaq@medicine.washington.edu	206-543-4403		\N	\N	\N
469	Bernard	Cook	\N	bccook@beckman.com	952-368-7780		\N	\N	\N
470	Debbie	Mileti	\N	dmileti@ventanamed.com	520-229-3864		\N	\N	\N
471	Hon-chiu	Leung	\N	hleung@bcm.tmc.edu	832-824-4373		\N	\N	\N
472	Jerry	Rowley	\N	jrowley@sdsc.edu	858-822-3644		\N	\N	\N
473	Hiroaki	Nitta	\N	hnitta@ventanamed.com	520-229-3874		\N	\N	\N
474	Margery	Rosenblatt	\N	mrosenblatt1@partners.org	617-582-8028		\N	\N	\N
475	Deborah	Shields	\N	dshields@grandstrandurology.com	843.449.1010 ext. 263		\N	\N	\N
476	Thomas	Grogan	\N	tgrogan@ventanamed.com	520-229-3795		\N	\N	\N
477	Donna	Jackson	\N	dejackson@srhs.com	864-560-1019		\N	\N	\N
478	Michael	Hogan	\N	hoganm@mskcc.org	6462272256		\N	\N	\N
479	Laurie	Mantor	\N	laurie.mantor@nyumc.org	6468256328		\N	\N	\N
480	Nicole	Urban	\N	nurban@fredhutch.org	425 (288 2210)		\N	\N	\N
481	Linda	Ricks	\N	lricks@mdanderson.org	713-794-5869		\N	\N	\N
482	Sandra	Gaston	\N	sgaston@bidmc.harvard.edu	617-667-1804		\N	\N	\N
483	Michael	Ward	\N	wardmd@evms.edu	757-446-5786		\N	\N	\N
484	Robin	Leach	\N	leach@uthscsa.edu	(210) 567-6947		\N	\N	\N
485	Patty	Beckmann	\N	beckm001@umn.edu	612-625-7324		\N	\N	\N
487	Yan	Xiao	\N	yan.xiao@nist.gov	301-975-5406		\N	\N	\N
488	Harriet	Davis	\N	harriet.davis@vanderbilt.edu	615-936-5804		\N	\N	\N
489	Susan	Sullivan	\N	svsullivan@saintfrancis.com	918-502-8801		\N	\N	\N
490	Tim	Byers	\N	tim.byers@uchsc.edu	303-315-5169		\N	\N	\N
491	Fran	Rosen	\N	frosen@mednet.ucla.edu	310-794-8613		\N	\N	\N
492	Rajiv	Dhir	\N	dhirr@upmc.edu	412-623-1321		\N	\N	\N
493	Amy	Harter	\N	aharter@gibbscc.org	864-560-6812		\N	\N	\N
494	Trang	Duong	\N	trangd@stanford.edu	4084988477		\N	\N	\N
495	Sandra	Warrington	\N	swarrington@atlanticurology.com	386-239-8535		\N	\N	\N
496	David	Malehorn	\N	malehornde@upmc.edu	412-623-4711		\N	\N	\N
497	Veronica	Talerico	\N	vtalerico@atlanticurology.com	386-774-9096		\N	\N	\N
498	Anne	Plant	\N	anne.plant@nist.gov	301-975-3124		\N	\N	\N
499	Shailender	Singh	\N	shailender.singh@unmc.edu	402-559-6209		\N	\N	\N
500	Maggie	Ward	\N	margaret.ward@viachristi.org	316-268-5791		\N	\N	\N
501	Jessica	Littlejohn	\N	jessica.littlejohn@viachristi.org	3162685691		\N	\N	\N
502	Sandi	Wadman	\N	sandi.wadman@viachristi.org	3165580963		\N	\N	\N
503	Samantha	Maragh	\N	samantha.maragh@nist.gov	301-975-4947		\N	\N	\N
504	Kenneth	Kinzler	\N	kinzlke@jhmi.edu	(410) 955-2928		\N	\N	\N
505	Marc	Salit	\N	salit@nist.gov	301-975-3646		\N	\N	\N
506	Scott	Kuwada	\N	skkuwada@hawaii.edu	808-586-2979		\N	\N	\N
507	Steven	Kuross	\N	steven.kuross@essentiahealth.org	218-786-3393		\N	\N	\N
508	Rachael	Goff	\N	rlgoff@med.umich.edu	7349363363		\N	\N	\N
509	Veena	Thyagarajan	\N	vthyagar@umich.edu	734-763-7997		\N	\N	\N
510	Preston	Steen	\N	preston.steen@sanfordhealth.org	701-234-5899		\N	\N	\N
511	Jeffrey	Berenberg	\N	jeff.berenberg@us.army.mil	808-433-1951		\N	\N	\N
512	Miroslaw	Mazurczak	\N	miroslaw.mazurczak@sanfordhealth.org	605-328-1384		\N	\N	\N
513	James	Marshall	\N	james.marshall@roswellpark.org	716-845-1771		\N	\N	\N
514	Florin	Selaru	\N	fselaru1@jhmi.edu	410-614-3801		\N	\N	\N
515	Paola	Muti	\N	pmuti@hsph.harvard.edu	00390652662728		\N	\N	\N
516	Trish	O'Brien	\N	trish.obrien@fccc.edu	215.214.3993		\N	\N	\N
517	Sally	McMillan	\N	sdmcmillan@mdanderson.org	713-792-3259		\N	\N	\N
518	Theresa	Halbherr	\N	theresa.halbherr@fccc.edu	215-728-4015		\N	\N	\N
519	Cecilia	McAleer	\N	cecilia.mcaleer@fccc.edu	215-728-2981		\N	\N	\N
520	Mandy	Hinojosa	\N	rolando@uthscsa.edu	210-567-5071		\N	\N	\N
521	Katherine	Alpaugh	\N	RK_Alpaugh@fccc.edu	(215) 214-1634		\N	\N	\N
522	Joann	House	\N	jsh4@cdc.gov	(404) 639-3748		\N	\N	\N
523	Debra-Gail	Donohue	\N	gdonohue@atlanticurology.com	386-239-8511		\N	\N	\N
525	Peter	Ujhazy	\N	pu5s@nih.gov	301-594-2632		\N	\N	\N
526	Anna	Minihan	\N	aminihan@partners.org	617-732-4895		\N	\N	\N
527	Jo Ellen	Weaver	\N	joellen.weaver@fccc.edu	215-214-1633		\N	\N	\N
528	Erica	Litschi	\N	erica.litschi@drexelmed.edu	215-489-4943		\N	\N	\N
529	Kathleen	Donahue	\N	kdonahue@fredhutch.org	206-667-7894		\N	\N	\N
530	Ross	Prentice	\N	rprentic@whi.org	206-667-6756		\N	\N	\N
531	Neal	Fedarko	\N	nfedark1@jhmi.edu	410-550-2632		\N	\N	\N
532	Peter	Lance	\N	plance@azcc.arizona.edu	502-626-4492		\N	\N	\N
533	Samantha	Lincoln	\N	samantha.lincoln@nyumc.org	212.263.4473		\N	\N	\N
534	Sherry	Fu197	\N	sherryfu@umich.edu	734-647-3635		\N	\N	\N
535	Karen	Kaul	\N	kkaul@northshore.org	847-570-2052		\N	\N	\N
536	Simi	Kumbongsi	\N	skumbong@jhmi.edu	410-502-2776		\N	\N	\N
537	Richard	Kwon	\N	rskwon@med.umich.edu			\N	\N	\N
539	Ashutosh	Tewari	\N	akt2002@med.cornell.edu	212-746-5638		\N	\N	\N
540	Heather	Lawter	\N	hlawter@srhs.com	864-560-1051		\N	\N	\N
541	Cindy	Legge	\N	clegge@path.uab.edu	205-934-1511		\N	\N	\N
542	Jacqueline	Correa	\N	jacqueline.polanco@nyumc.org	212-263-6103		\N	\N	\N
543	Anel	Muterspaugh	\N	anel.w.muterspaugh@vanderbilt.edu	615-936-4244		\N	\N	\N
544	Sandra	Clipp	\N	sclipp@jhsph.edu	(301) 797-7677		\N	\N	\N
545	Francis	Kuhajda	\N	fhuhajda@jhmi.edu	(410) 550-5587		\N	\N	\N
546	Katrina	Steiling	\N	steiling@bu.edu	617-414-6996		\N	\N	\N
547	Yves-Martine	Dumas	\N	ymdumas@bu.edu	617-414-3290		\N	\N	\N
548	Maureen	Palmer	\N	Maureen.Palmer@vch.ca	604-875-5675		\N	\N	\N
549	Ryan	Harrington	\N	ryan.harrington@nyumc.org	2122632024		\N	\N	\N
550	Leigh Ann	Brand	\N	lbrand@urologyofva.net	757-452-3464		\N	\N	\N
551	Rabia	Siddiqui	\N	rabia@med.umich.edu	(734) 763-7508		\N	\N	\N
552	Robin	Duris	\N	rduris@beaumont.edu	248-551-8429		\N	\N	\N
553	Denise	Harnois	\N	harnois.denise@mayo.edu	904-296-5876		\N	\N	\N
554	Karen	Lopez	\N	karen.lopez@ucsf.edu	4155026939		\N	\N	\N
555	Linda	Koudele	\N	linda.koudele@mercy.net	405-752-3402		\N	\N	\N
556	Kathleen	Yost	\N	janet.haworth@crcwm.org	616-954-9800		\N	\N	\N
557	Jon	Digel	\N	processing@fredhutch.org	206 667 4434		\N	\N	\N
558	Jean	Caputo	\N	jcaputo@mdanderson.org	713-794-4164		\N	\N	\N
559	Janelle	Hibberts	\N	jhibbert@mdanderson.org	713-563-4416		\N	\N	\N
560	Marian	Banks	\N	mbanks3@slu.edu	314-577-8764		\N	\N	\N
561	Francia	Mena Canto	\N	fmenacanto@mednet.ucla.edu	310-794-2719		\N	\N	\N
562	Yamei	Cheng	\N	yamei.cheng@utsouthwestern.edu	214-645-6199		\N	\N	\N
563	Azadeh	Stark	\N	Astark1@hfhs.org	248-797-3048		\N	\N	\N
564	Ying	Huang	\N	yhuang@fredhutch.org	206-667-4198		\N	\N	\N
565	Stacy	Riffle	\N	stacyr@uw.edu	206-685-0504		\N	\N	\N
566	Brandi	Weaver	\N	weaverb@uthscsa.edu	(210) 567-0178		\N	\N	\N
567	George	Mutter	\N	gmutter@rics.bwh.harvard.edu	617-732-7536		\N	\N	\N
524	Pierre	Massion	9	pierre.massion@vanderbilt.edu	6153223412		f	f	\N
568	Elda	Railey	\N	erailey@researchadvocacy.org	214-683-9937		\N	\N	\N
569	Paul	Schellhammer	\N	pfs@borg.evms.edu	(757) 688-3572		\N	\N	\N
570	Amy	Wells	\N	awells@unmc.edu	402-559-6015		\N	\N	\N
571	Jacqueline	Polanco	\N	polanj01@popmail.med.nyu.edu	212-263-6103		\N	\N	\N
572	Elzbieta	Izbicka	\N	eizbicka@idd.org	210 677-3879		\N	\N	\N
573	Sung Won	Kwon	\N	swkwon@biochem.swmed.edu	214-648-2766		\N	\N	\N
574	Elizabeth	Smith	\N	betty_smith@urmc.rochester.edu	585-275-0989		\N	\N	\N
575	Erik	Busby	\N	ebusby@ghs.org	2059752736		\N	\N	\N
576	Annette	Jalayer	\N	ajalayer@www.urol.bcm.tmc.edu	713-198-4895		\N	\N	\N
577	Samir	Taneja	\N	samir.taneja@nyumc.org	6468256321		\N	\N	\N
578	Rosalia	Viterbo	\N	rosalia.viterbo@fccc.edu	2157283555		\N	\N	\N
579	Yair	Lotan	\N	yair.lotan@utsouthwestern.edu	214-645-8787		\N	\N	\N
580	Mohamed	Bidair	\N	mobidair@sdclinicaltrials.com	6192876000		\N	\N	\N
581	Nancy	Basset	\N	bassetn@smh.ca	416-864-6060 ext. 2964		\N	\N	\N
582	Caroline	Shepherd	\N	shepherd@brtlabs.com	(800) 765-5170		\N	\N	\N
583	Ricardo	Soto	\N	risoto@mutual.cl			\N	\N	\N
584	Ellen	Heimann-Nichols	\N	ellen.heimann@vanderbilt.edu	615-875-6138		\N	\N	\N
585	Sanford	Jeames	\N	sjeames@uabmc.edu	205-326-9439		\N	\N	\N
586	Amy	Lee	\N	ajlee12@stanford.edu	650-736-0697		\N	\N	\N
587	Michio	Sugita	\N	michio.sugita@uchsc.edu	303-724-3082		\N	\N	\N
588	Patricia	Osmack	\N	osmackpa@slu.edu	314-268-5383		\N	\N	\N
589	Jason	Stasi	\N	stasij@mskcc.org	646-227-2258		\N	\N	\N
590	Kristina	Gamage	\N	gamagek@mskcc.org	646-227-2259		\N	\N	\N
591	Suzanne	Moyer	\N	suzanne_moyer@urmc.rochester.edu	585-275-0731		\N	\N	\N
592	Isam-Eldin	Eltoum	\N	eltoum@path.uab.edu	(205) 975-8880		\N	\N	\N
593	Charlene	Fern-Wittek	\N	fernw001@umn.edu	612-624-0104		\N	\N	\N
594	Renee	Jackson	\N	renee.jackson@viachristi.org	316-268-5695		\N	\N	\N
595	Cathy	Critchlow	\N	cwc@u.washington.edu	(206) 616-9785		\N	\N	\N
596	Karon	Drew	\N	karon.drew@thermofisher.com	301-694-5911		\N	\N	\N
597	Corinne	Lovato	\N	lovcor@u.washington.edu	(206) 616-6095		\N	\N	\N
598	Martin	Sanda	\N	martinsanda@emory.edu	404-712-8152		\N	\N	\N
599	Jayati	Banerjee	\N	banerjee@bcm.edu	7137984479		\N	\N	\N
600	David	Tabb	\N	david.l.tabb@vanderbilt.edu	615-936-0380		\N	\N	\N
601	Tamara	Tipps	\N	tltipps@mdanderson.org	713-794-1439		\N	\N	\N
602	Rosalind	Eeles	\N	Rosalind.Eeles@icr.ac.uk	+44 (0) 20 7352 8133		\N	\N	\N
603	Manoop	Bhutani	\N	manoop.bhutani@mdanderson.org	713-794-5073		\N	\N	\N
604	Marta	Davila	\N	mdavila@mdanderson.org	713-794-5073		\N	\N	\N
605	Mehnaz	Shafi	\N	mashafi@mdanderson.org	713-794-5073		\N	\N	\N
606	Sushovan	Guha	\N	sguha@mdanderson.org	713-794-5073		\N	\N	\N
607	Rick	Westcott	\N	rwestcot@fredhutch.org	206-667-2630		\N	\N	\N
608	Gyorgy	Petrovics	\N	gpetrovics@cpdr.org	240-453-8942		\N	\N	\N
609	Belinda	Nghiem441	\N	bghiem@u.washington.edu	206.327.3625		\N	\N	\N
610	Daisy	Campos	\N	Daisy.Campos@utsouthwestern.edu	214-645-1089		\N	\N	\N
611	Robert	Vessella	\N	vessella@u.washington.edu	206-543-1461		\N	\N	\N
612	Jackie	Sheffield	\N	jacquels@med.umich.edu	734-615-5180		\N	\N	\N
614	Sarah	Flagg	\N	sflagg@umm.edu	410-328-2964		\N	\N	\N
615	David	Stivers	\N	dstivers@mdanderson.org	713-794-4161		\N	\N	\N
616	Liz	Humphreys	\N	ehumphr3@jhmi.edu	410-502-3499		\N	\N	\N
617	Robert	Harris	\N	rharris@cbi-biotech.com	804-915-3840		\N	\N	\N
618	Barbara	Berg	\N	berg.barbara2@mayo.edu	904-953-7988		\N	\N	\N
619	Margaret	Wise	\N	margaret@wakousa.com	804-714-1933		\N	\N	\N
620	Samantha	Maragh	\N	samantha@nist.gov	301-975-4947		\N	\N	\N
621	Kim	Kirkwood	\N	kim.kirkwood@ucsf.edu	415-353-9888		\N	\N	\N
622	Brooke	Higginbotham	\N	higginbothambn@slu.edu	314-977-9400		\N	\N	\N
623	Tracy	Boeve	\N	boevetj	314-977-9400		\N	\N	\N
624	Shiv	Srivastava	\N	ssrivastava@cpdr.org	240-453-8952		\N	\N	\N
625	Jason	Rosenzweig	\N	jasonr@jhmi.edu	410-502-7873		\N	\N	\N
626	Ginger	Goodall	\N	ovaltina@uab.edu	205-934-4214		\N	\N	\N
627	Dan	Moore	\N	moore@cc.ucsf.edu	415-202-1567		\N	\N	\N
628	Cristina	Villagra	\N	cristina.villagra@mssm.edu	212-659-8212		\N	\N	\N
629	Andrew	Balshem	\N	andrew.balshem@fccc.edu	215-728-2720		\N	\N	\N
630	Carol	Carey	\N	ca_carey@fccc.edu	215-728-5286		\N	\N	\N
631	Brandon	Messmer	\N	messmer.brandon@mayo.edu	507-538-4633		\N	\N	\N
632	Ruth	Etzioni	\N	retzioni@fredhutch.org	206-667-6561		\N	\N	\N
633	John	Baron	\N	jabaron@med.unc.edu	919-843-9395		\N	\N	\N
634	Paul	Lampe	\N	plampe@fredhutch.org	206-667-4123		\N	\N	\N
635	Wendy	Wang	\N	wangw@mail.nih.gov	(240) 276-7117		\N	\N	\N
636	Mary Ann	DuPont	\N	maryann.dupont@hshs.org	920-433-8889		\N	\N	\N
637	Dean	Brenner	\N	dbrenner@umich.edu	734-647-1417		\N	\N	\N
638	Timothy	Block	\N	timothy.block@drexelmed.edu	(215) 489-4948		\N	\N	\N
639	Paul	Wagner	\N	wagnerp@mail.nih.gov	(240) 276-7132		\N	\N	\N
640	Maryann	Bilbee	\N	Maryann.Bilbee@fccc.edu	(215) 214-1634		\N	\N	\N
641	Martin	Gleave	\N	gleave@interchange.ubc.ca	604-875-5003		\N	\N	\N
642	Elizabeth	Jones	\N	flicke@wudosis.wustl.edu	314-362-8200		\N	\N	\N
643	Peter	Carroll	\N	pcarroll@urology.ucsf.edu	415-353-7098		\N	\N	\N
644	Colin	Collins	\N	collins@cc.ucsf.edu	415-847-0356		\N	\N	\N
645	William	Bigbee	\N	bigbeewl@upmc.edu	412-641-7555		\N	\N	\N
646	Peter	Barker	\N	peter.barker@nist.gov	(301) 975-5402/8278		\N	\N	\N
647	Daniel	Cramer	\N	dcramer@partners.org	(617) 732-4895		\N	\N	\N
648	Lawrence	True	\N	ltrue@u.washington.edu	206-598-4027		\N	\N	\N
649	James	Jett	\N	jett.james@mayo.edu	507-284-3764		\N	\N	\N
650	Nancy	Ainslie	\N	nainslie@mdanderson.org	713-794-4397		\N	\N	\N
651	Janet	Stanford	\N	jstanfor@fredhutch.org	206-667-2715		\N	\N	\N
652	Emanuel	Petricoin	\N	epetrico@gmu.edu	(301) 827-1753		\N	\N	\N
653	Amy	Shoe	\N	amy.shoe@grcop.org	616 391 1230		\N	\N	\N
654	Olutola	Yerokun	\N	olutola.yerokun@utsouthwestern.edu	214-645-9748		\N	\N	\N
655	Chenee	Holcomb	\N	cnh3@uw.edu	206-598-0850		\N	\N	\N
656	Tatyana	Zhukov	\N	tatyana.zhukov@moffitt.org	(813) 745-1718		\N	\N	\N
657	Pinku	Mukherjee	\N	pinku@candiaginc.com	623-203-5460		\N	\N	\N
658	Phyllis	Chung	\N	Phyllis.Chung@thermofisher.com			\N	\N	\N
659	David	Chia	\N	dchia@ucla.edu	(310) 206-4549		\N	\N	\N
660	Becky	Buchanan	\N	becky.buchanan@essentiahealth.org	218-786-3393		\N	\N	\N
661	Cindy	Baldwin	\N	cyntbald@med.umich.edu	734-615-6662		\N	\N	\N
662	Elisabeth	Beaber	\N	ebeaber@fredhutch.org	206.667.4219		\N	\N	\N
663	Moncy	Ye	\N	yem@mskcc.org	646-227-2266		\N	\N	\N
664	Casey	Mullins	\N	cdmullins@saintfrancis.com	918-494-7259		\N	\N	\N
665	Tanya	Kyle	\N	tanya.kyle@sanfordhealth.org	701-234-7422		\N	\N	\N
666	Neal	Shore	\N	nshore@grandstrandurology.com	843 449-1010		\N	\N	\N
667	Amy	Sullivan	\N	amy.sullivan@vanderbilt.edu	615-875-0060		\N	\N	\N
668	Carolyn	Burns	\N	carolyn.burns@beaumont.edu	248-964-9650		\N	\N	\N
669	Elizabeth	Wu	\N	elizwu@med.umich.edu	7346470236		\N	\N	\N
670	Ruth	Lira	\N	rlira@stanford.edu	650.723.1367		\N	\N	\N
671	Randa	El-Zein	\N	relzein@mdanderson.org	713-745-2539		\N	\N	\N
672	Daniel	Lin VA	\N	dlin@u.washington.edu	206-221-0797		\N	\N	\N
673	Linda	Hanselman	\N	LHanselman@srhs.com	(864) 560-1053		\N	\N	\N
674	Fauzia	Siddiq	\N	siddiqf@karmanos.org	313-578-4345		\N	\N	\N
675	Cedric	Kimes	\N	ckimes@cresearchc.com	407-883-8710		\N	\N	\N
676	Richard	Casey	\N	drcasey@malehealth.com	905-338-3130		\N	\N	\N
677	Anand	Mehta	\N	anand.mehta@drexelmed.edu	215-489-4905		\N	\N	\N
678	Angela	Bryce	\N	abryce@fredhutch.org	206-667-4645		\N	\N	\N
679	Paul	Farley	\N	pfarley@fredhutch.org	206-667-1961		\N	\N	\N
680	Susan	Brooks	\N	susan.brooks@mercy.net	405-752-3402		\N	\N	\N
681	Cindy	Wynne-Jones	\N	cindy.wynne-jones@utsouthwestern.edu	214.645.8787		\N	\N	\N
682	Beth	Petty	\N	beth.petty@utsouthwestern.edu	214-645-8787		\N	\N	\N
683	Artrit	Butuci	\N	artrit.butuci@nyumc.org	646-825-6319		\N	\N	\N
684	Fred	HIrsch	\N	Fred.Hirsch@uchsc.edu	303-724-3858		\N	\N	\N
685	Andrew	Godwin	\N	AGodwin@kumc.edu	913-945-6387		\N	\N	\N
686	Stephanie	Page-Lester	\N	spage@fredhutch.org	206 667-4988		\N	\N	\N
687	Stacey	Gallagher	\N	sgallaghe@partners.org	617-732-4895		\N	\N	\N
688	Erika	Mack	\N	macke@mskcc.org	646-227-2266		\N	\N	\N
689	Edward	Partridge	\N	eep3840@uab.edu	205-934-4986		\N	\N	\N
690	Robert	Bast	\N	rbast@mdanderson.org	713-792-7743		\N	\N	\N
691	Karin	Rodland	\N	karin.rodland@pnnl.gov	509-371-6935		\N	\N	\N
692	Jacquelyn	Ames	\N	james@cbi-biotech.com	804-648-3820		\N	\N	\N
693	Wilbur	Franklin	\N	wilbur.franklin@ucdenver.edu	303-809-4877		\N	\N	\N
694	Elizabeth	Donato	\N	edonato@fredhutch.org	206 667-4501		\N	\N	\N
695	Susan	Franseen (formerly Kolb)	\N	franseen.susan@marshfieldclinic.org	715-389-4980		\N	\N	\N
696	William	Grizzle	\N	wgrizzle@uab.edu	(205) 934-4214		\N	\N	\N
697	Julie	Laird	\N	julie.laird@ucsfmedctr.org	415-819-8094		\N	\N	\N
698	Erin	Ebbel	\N	erin.ebbel@ucsfmedctr.org	(415) 353-3003		\N	\N	\N
699	Steven	Belinsky	\N	sbelinsk@lrri.org	505-348-9465		\N	\N	\N
700	Catherine	Brissaud	\N	Catherine.Brissaud@ucsfmedctr.org	415-885-7558		\N	\N	\N
701	Suzanna	Reid	\N	sreid@fredhutch.org	(206) 667-7861		\N	\N	\N
702	xiao ying	jiang	\N	xjiang@cc.ucsf.edu	415-476-8825		\N	\N	\N
703	Nadine	Ryan	\N	ryann@upmc.edu	412-641-7557		\N	\N	\N
704	Roger	Walker	\N	roger_walker@bio-rad.com	510-741-4527		\N	\N	\N
705	Stephen	Frost	\N	stephen.frost@nextgensciences.com	734-973-7914, ext. 222		\N	\N	\N
706	Judy	O'Leary	\N	jo&#39;leary@northshore.org	847-570-1632		\N	\N	\N
707	Colette	Spinarelli	\N	spinarellics@upmc.edu	412-623-3390		\N	\N	\N
708	Steve	Kalloger	\N	skalloger@mac.com	604-889-0997		\N	\N	\N
709	Michael	Birrer	\N	mbirrer@partners.org	617-643-4730		\N	\N	\N
710	Gianluigi	Giannelli	\N	g.giannelli@intmed.uniba.it	39-080-5478-127		\N	\N	\N
711	Kevin	Foster	\N	kafoster@umn.edu	6126245797		\N	\N	\N
712	Allyn	Arnold	\N	aarnold@jhsph.edu	(410) 955-8168		\N	\N	\N
713	Sherry	Fu196	\N	sherryfu@umich.edu	734-647-3635		\N	\N	\N
714	Mary Beth	Usinowicz	\N	musinowicz@stanfordmed.org	650-736-0697		\N	\N	\N
715	Jonathan	Wright	\N	jlwright@uw.edu	206-667-7987		\N	\N	\N
716	Rebecca	Grantham	\N	rgrantham@beaumont.edu	248-964-0604		\N	\N	\N
717	LaQuetta	Chavis	\N	LMChavis1@mdanderson.org	713-745-6089		\N	\N	\N
718	Katherine	Wasilewsky	\N	Katherine.A.Wasilewsky@Lahey.org	781-744-2979		\N	\N	\N
719	Cole	Ohnoutka	\N	ohnoutka@slu.edu	605-261-9187		\N	\N	\N
720	alganesh	abraham	\N	nani@med.umich.edu	734-545-0959		\N	\N	\N
721	Fay	Kastrinos	\N	fk18@columbia.edu	212-304-5606		\N	\N	\N
722	Charles	Loprinzi	\N	cloprinzi@mayo.edu	507-538-3270		\N	\N	\N
723	Li	Li	\N	LL134Q@rocketmail.com	123-456-7890		\N	\N	\N
724	Barry	Berger	\N	bberger@exactsciences.com	608-284-5730		\N	\N	\N
725	Marcia	Eisenberg	\N	Eisenbm@LabCorp.com	919-361-7760		\N	\N	\N
726	Robert	Carroll	\N	rcarroll@uic.edu	312-996-6651		\N	\N	\N
727	Tim	Church	\N	trc@cccs.umn.edu	612-625-9091		\N	\N	\N
728	Eric	Leibert	\N	eric.leibert@nyumc.org	212-263-6479		\N	\N	\N
729	Talal	El-Hefnawy	\N	elhefnawyt@upmc.edu	412-623-3278		\N	\N	\N
730	Eleftherios	Diamandis	\N	ediamandis@mtsinai.on.ca	416-586-8443		\N	\N	\N
731	Erin	Bungum	\N	bungum.erin@mayo.edu	507-284-0686		\N	\N	\N
732	Allison	Miller	\N	amille60@jhmi.edu	410-614-0743		\N	\N	\N
733	Daniel	Liebler	\N	daniel.liebler@vanderbilt.edu	615-322-3063		\N	\N	\N
734	Paul	Engstrom	\N	Paul.Engstrom@fccc.edu	215-728-2989		\N	\N	\N
735	Sanford	Stass	\N	sstass@som.umaryland.edu	410-328-1237		\N	\N	\N
736	Marc	Lenburg	\N	mlenburg@bu.edu	617-414-1375		\N	\N	\N
737	David	Elashoff	\N	delashoff@mednet.ucla.edu	310-794-7595		\N	\N	\N
738	Mark	Rubin	\N	rubinma@med.cornell.edu	212-746-6313		\N	\N	\N
739	Jennilee	Kho	\N	jk907@uw.edu	206-543-1461		\N	\N	\N
740	Colin	Dinney	\N	cdinney@mdanderson.org	713-792-3250		\N	\N	\N
741	Branda	Levchak	\N	Branda.Levchak@va.gov	206-277-4760		\N	\N	\N
742	Kathy	Frisby	\N	kafrisby@gundluth.org	608-775-6631		\N	\N	\N
743	Lori	Meyer	\N	lameyer@gundluth.org	608-775-2579		\N	\N	\N
744	Jonean	Thorsen	\N	jethorse@gundluth.org	608-775-2651		\N	\N	\N
745	Georgiann	Noll	\N	gnoll1@geisinger.edu	(570) 214-6795		\N	\N	\N
746	Jeffrey	Prichard	\N	jwprichard@geisinger.edu	(570) 214-6795		\N	\N	\N
747	Linda	Ellinwood	\N	ellinwol@upstate.edu	315-464-1852 (M-Th)/ 315-464-2197(F)		\N	\N	\N
748	Natalie	Fisher	\N	brownnat@med.umich.edu	734-232-0284		\N	\N	\N
749	John	Robertson	\N	jrobertson@beaumont.edu	248-551-8429		\N	\N	\N
750	Jun-Chieh	Tsay	\N	Jun-Chieh.Tsay@nyumc.org	2122630243		\N	\N	\N
751	Gilbert	Padula	\N	gilpadulamd@gmail.com	616-391-1230		\N	\N	\N
752	Caroline	Healy	\N	CHEALY1@nmh.org	312-472-4767		\N	\N	\N
753	Carrie	Manwaring	\N	carrie.manwaring@utsouthwestern.edu	214-645-6220		\N	\N	\N
754	Tanya	Milan-Robertson	\N	milanrot@mskcc.org	646-227-2260		\N	\N	\N
755	James	Bearden	\N	jbearden@srhs.com	864-560-1036		\N	\N	\N
756	Jiri	Bem	\N	bemj@upstate.edu	315-464-1852		\N	\N	\N
757	Joan	Wertz	\N	jwertz@umm.edu	410-328-1238		\N	\N	\N
758	Yolanda	Thomas-Jones	\N	ythomasj@nmh.org	312-503-4236		\N	\N	\N
759	Ken	Jansz	\N	gkjansz@bellnet.ca	905-681-3030		\N	\N	\N
760	Vicky	Peck	\N	vpeck@wustl.edu	314-362-8226		\N	\N	\N
761	Jos	Clavero	\N	jclavero@clc.cl	6770128		\N	\N	\N
762	Holly	Cirri	\N	holly_cirri@med.unc.edu	919-445-0203		\N	\N	\N
763	David	Campos	\N	dcampos@saci.org	210-277-3954		\N	\N	\N
764	Sara	Heath	\N	heath.sara@mayo.edu	904-953-7590		\N	\N	\N
765	Aleksander	Popel	\N	apopel@jhu.edu	410-955-6419		\N	\N	\N
766	Vicky	Thomas	\N	vthomas@beaumont.edu	248-551-4958		\N	\N	\N
767	Thomas	Li	\N	tmtli@hotmail.com	415-490-6742		\N	\N	\N
768	Sanoj	Punnen	\N	s.punnen@med.miami.edu	305 243 6591		\N	\N	\N
769	Phyllis	Schooler	\N	schooler@med.umich.edu	517-522-4645		\N	\N	\N
770	JUDE	UWAH	\N	Uwahu@georgetown.edu	2024440796		\N	\N	\N
771	Stephanie	Gubb	\N	smg256@georgetown.edu	202-444-1210		\N	\N	\N
772	Rebekah	White	\N	rebekah.white@duke.edu	910-684-6553		\N	\N	\N
773	Kazufumi	Honda	\N	khonda@ncc.go.jp	+81 - 3 - 3542 - 2511		\N	\N	\N
774	Sanford	Markowitz	\N	sxm10@po.cwru.edu	213-844-8237		\N	\N	\N
775	Patty	Ward	\N	patricia.ward@viachristi.org	316-268-8678		\N	\N	\N
776	Janet	Black	\N	janet.black@viachristi.org	316-268-5579		\N	\N	\N
777	Susan	Ard	\N	sard@kumc.edu	913-945-6373		\N	\N	\N
778	Esther	Leone	\N	estherleone@yahoo.com	843-655-7024		\N	\N	\N
779	Marta	Guerrero	\N	marta.guerrero@viachristi.org	316-640-3357		\N	\N	\N
780	Crystal	Watson	\N	crystal.watson@viachiristi.org	316-268-5601		\N	\N	\N
781	Lois	Millspaugh	\N	lois.millspaugh@viachristi.org	316-268-5502		\N	\N	\N
782	Bill	Willette	\N	bwillett@fredhutch.org	2066677615		\N	\N	\N
783	Christopher	Rall	\N	rall.christopher@marshfieldclinic.org	715-221-7800		\N	\N	\N
784	David	Hanlon	\N	dhanlon@quanterix.com	617-301-9430		\N	\N	\N
785	Jonathan	Ma	\N	Jonathan.Ma@vch.ca	604-875-4111 x66557		\N	\N	\N
786	Mark	Thornquist	\N	mthornqu@fredhutch.org	(206) 667-2931		\N	\N	\N
787	Crystal	Sweet	\N	csweet@aibiotech.com	804-648-3820		\N	\N	\N
788	Haris	Jamil	\N	hjamil@nanoink.net	847-329-2981		\N	\N	\N
789	Caitlyn	Plonka	\N	cplonka@med.umich.edu	734-763-4464		\N	\N	\N
790	Missy	Tuck	\N	mtuck@umich.edu	734-763-1141		\N	\N	\N
791	Matt	Barnett	\N	mbarnett@fredhutch.org	(206) 667-6177		\N	\N	\N
792	Michelle	Ferrari	\N	mferrari@stanford.edu	650-725-5543		\N	\N	\N
793	Dalia	Pena	\N	daliapena85@hotmail.com	619 287 6000		\N	\N	\N
794	Raymond	Lance	\N	LanceRS@EVMS.EDU	757-457-5184		\N	\N	\N
795	Richard	Drake	\N	draker@musc.edu	843-792-4505		\N	\N	\N
796	Abby	Akinola	\N	akinola@gunet.georgetown.edu	(202) 687-5505		\N	\N	\N
797	Yanjuan	Xu	\N	xuy@slu.edu	3142685771		\N	\N	\N
798	Baiba	Poore	\N	bpoore@umm.edu	410-328-2953		\N	\N	\N
799	Hany	Elsaleh	\N	elsaleh@radonc.ucla.edu	310-794-2707		\N	\N	\N
800	David	Alberts	\N	dalberts@azcc.arizona.edu	520-626-7685		\N	\N	\N
801	Anna	Lokshin	\N	lokshina@pitt.edu	412-623-7706		\N	\N	\N
802	Valerie	Marcott	\N	vdmarcot@mdanderson.org	713-563-7450		\N	\N	\N
803	Teresita	Munoz-Antonia	\N	antoniat@moffitt.usf.edu	(813) 979-3884		\N	\N	\N
804	Jill	Smith	\N	jps261@georgetown.edu	202-687-2020		\N	\N	\N
805	John	Bomba	\N	bombajoj@moffitt.usf.edu	(813) 745-3882		\N	\N	\N
806	Alex	Gonzalez	\N	alex.gonzalez@thermofisher.com	301-694-5911		\N	\N	\N
807	Michelle	Brotzman	\N	mbrotzm1@jhmi.edu	410 502 2774		\N	\N	\N
808	Judith	Hopkins	\N	johopkins@novanhealth.org	336-718-8461		\N	\N	\N
809	Teleah	Davis	\N	tgd11@georgetown.edu	202-444-0796		\N	\N	\N
810	Debra	Donohue	\N	gdonohue@atlanticurology.com	386-239-8511		\N	\N	\N
812	Steven	Skates	\N	sskates@partners.org	(617) 642-7094		\N	\N	\N
813	Sapna	Syngal	\N	ssyngal@partners.org	617-632-2476		\N	\N	\N
814	Karen	Giles	\N	kargiles@umich.edu	734-615-4062		\N	\N	\N
815	Matthew	Harker	\N	matthew.harker@duke.edu	919-684-0891		\N	\N	\N
816	Tina	Li	\N	tina.li6@vch.ca	604-875-4111, ext. 68298		\N	\N	\N
817	Heidi	Marshall-Booth	\N	Heidi.Marshall-Booth@ucsfmedctr.org	415-885-3849		\N	\N	\N
818	Jackie	Dahlgren	\N	jdahlgre@fredhutch.org	(206) 667-4170		\N	\N	\N
819	Alberto	Hayden	\N	AlbertoHayden@gwimsa.mutual.cl	2787 9000		\N	\N	\N
820	Seth	Lerner	\N	slerner@bcm.tmc.edu	713-798-6841		\N	\N	\N
821	Gary	Steinberg	\N	gsteinbe@surgery.bsd.uchicago.edu	773-702-3080		\N	\N	\N
822	Joseph	Presti	\N	jpresti@stanford.edu	650-725-5544		\N	\N	\N
823	Melaine	Williams	\N	mswillia@fredhutch.org	2066674109		\N	\N	\N
824	Ann	Killary	\N	akillary@mdanderson.org	713-834-6395		\N	\N	\N
825	Cheryl	Lee	\N	ctlee@med.umich.edu	734-615-6662		\N	\N	\N
826	Laurence	Klotz	\N	laurence.klotz@sunnybrook.ca	416-480-4673		\N	\N	\N
827	Aron	Joon	\N	ayjoon@mdanderson.org	(713)7457333		\N	\N	\N
828	Nipun	Utreja	\N	nipun.k.utreja@vanderbilt.edu	6158756138		\N	\N	\N
829	Carol	Carey709	\N	Carol.carey@fccc.edu	215-728-5286		\N	\N	\N
830	Mark	Schoenberg	\N	mschoenberg@jhmi.edu	410-955-1039		\N	\N	\N
831	Karl	Krueger	\N	kruegerk@mail.nih.gov	(240) 276-7026		\N	\N	\N
832	Cheryl	Landini	\N	clandini@surgery.bsd.uchicago.edu	773-702-0792		\N	\N	\N
833	Sasan	Roayaie	\N	sasan.roayaie@mountsinai.org	212 241 7539		\N	\N	\N
834	Tina	Wlajnitz	\N	twlajnitz@jhmi.edu	410-955-0163		\N	\N	\N
835	Selima	Taylor	\N	taylors@mskcc.org	646-227-2260		\N	\N	\N
836	Kelly	Borges	\N	kelly.borges@uphs.upenn.edu	2156153755		\N	\N	\N
837	Nicholas	Shaheen	\N	nshaheen@med.unc.edu	919-966-2511		\N	\N	\N
838	Richard	Sampliner	\N	richard.sampliner@med.va.gov	520-626-6722		\N	\N	\N
839	Ashish	Kamat	\N	akamat@mdanderson.org	713-404-2526		\N	\N	\N
840	Marcia	Canto	\N	mcanto@jhmi.edu	410-614-5388		\N	\N	\N
841	David	Camp	\N	dave.camp@pnnl.gov	509-371-6586		\N	\N	\N
842	Kenneth	Wang	\N	wang.kenneth@mayo.edu	507-255-7495		\N	\N	\N
843	Herbert	Wolfsen	\N	Wolfsen.Herbert@mayo.edu	904-953-2221		\N	\N	\N
844	Sara	Zriny	\N	szriny@fredhutch.org	206-667-7129		\N	\N	\N
845	Joshua	LaBaer	\N	jlabaer@asu.edu	(480) 965-2805		\N	\N	\N
846	David	Speicher	\N	speicher@wistar.org	215-898-3972		\N	\N	\N
847	Diane	Brassil	\N	brassidn@evms.edu	(757) 446-5676		\N	\N	\N
848	Nancy	Grove	\N	nancy.grove@nidaan-inc.com	650-740-1996		\N	\N	\N
849	Deborah	Maness	\N	deborah.maness@viachristi.org	316-613-4376		\N	\N	\N
850	Lisa	Newcomb	\N	lnewcomb@fredhutch.org	206-667-1946		\N	\N	\N
851	Ladan	Fazli	\N	lfazli@prostatecentre.com	604 875 4111 # 61718		\N	\N	\N
852	Janette	Lamb	\N	jal18@pitt.edu	412-623-4673		\N	\N	\N
853	Shelbie	Waclawski	\N	swaclaw@jhmi.edu	410-502-6072		\N	\N	\N
855	Brenda	Zielke	\N	brenda.zielke@utsouthwestern.edu	(214) 648-4923		\N	\N	\N
856	Grace	Su	\N	shasha@umich.edu	734-647-0563		\N	\N	\N
857	Daniel	McConnell	\N	danmcc@umich.edu	734-647-2756		\N	\N	\N
858	Anna	Lok	\N	aslok@med.umich.edu	734-936-0496		\N	\N	\N
859	Missy	Tuck	\N	mtuck@umich.edu	734-763-1141		\N	\N	\N
860	Kwisa	Kang	\N	kkang@medicine.umaryland.edu	410-706-3375		\N	\N	\N
861	Debbie	Martin	\N	dlmartinh@mdanderson.org	713-794-4397		\N	\N	\N
862	Marisa	Lozano	\N	mllozano@mdanderson.org	713-794-4397		\N	\N	\N
863	Jhingook	Kim	\N	jkimsmc@skku.edu	82-2-3410-3483		\N	\N	\N
864	Martha	Stiller	\N	mstiller@fredhutch.org	(206) 667-7889		\N	\N	\N
865	Samaneh	Motanagh	\N	samane.az.87@gmail.com	2038024172		\N	\N	\N
866	Thomas	Barrett	\N	tbarrett@pacificnanoscience.com	503-577-2282		\N	\N	\N
867	Michael	Finan	\N	tbd	251-665-8000		\N	\N	\N
868	Rodney	Rocconi	\N	rocconi@southalabama.edu	251-665-8000		\N	\N	\N
869	Alan	So	\N	dralanso@interchange.ubc.ca	604-875-5003		\N	\N	\N
870	David	Kurnit	\N	sesame@umich.edu	734-647-4747		\N	\N	\N
871	Wilma	Knutson	\N	wilma.knutson@essentiahealth.org	2187863111		\N	\N	\N
872	Divya	Patel	\N	divya@umich.edu	734-930-5613		\N	\N	\N
873	Auguso	Lois	\N	alois@sanfordburnham.org	858-945-8096		\N	\N	\N
874	Gerald	Wang	\N	geraldwang@mednet.ucla.edu	310-794-2719		\N	\N	\N
875	Cindy	Coakley	\N	coakley.cindy@mcrf.mfldclin.edu	715-221-7281		\N	\N	\N
876	Lori	Fellenz	\N	fellenz.lori@mcrf.mfldclin.edu	715-389-4773		\N	\N	\N
877	Joan	Long	\N	joan.long@grcop.org	616-391-1230		\N	\N	\N
878	Laurie	Bok	\N	www.laurie.bok@grcop.org	616-486-6152		\N	\N	\N
879	Patricia	Kokx	\N	patricia.kokx@grcop.org	616-391-1230		\N	\N	\N
880	Angela	Faber	\N	angela.faber@grcop.org	616-391-1230		\N	\N	\N
881	Janet	Haworth	\N	janet.haworth@crcwm.org	616.391.1230		\N	\N	\N
882	Jo Ann	Rinaudo	\N	rinaudoj@mail.nih.gov	(240) 276-7133		\N	\N	\N
883	Julia	Burford	\N	Julia.Burford@viachristi.org	316-640-7339		\N	\N	\N
884	Brenda	Lehmann	\N	lehmannb@uphs.upenn.edu	215-349-8580		\N	\N	\N
885	Catrina	Crociani	\N	ccrocian@bidmc.harvard.edu	617.735.2103		\N	\N	\N
886	Christopher	DiMaio	\N	christopher.dimaio@mssm.edu	212-241-4299		\N	\N	\N
887	Ben	Solomon	\N	ben.solomon@uchsc.edu	303-724-3080		\N	\N	\N
888	Jenny	Mao	\N	jmao@mednet.ucla.edu	310-794-6566		\N	\N	\N
889	Gloria	Malloy	\N	gloria.m.malloy@vanderbilt.edu	301-697-7204		\N	\N	\N
891	Liu	Zhu	\N	lzhu@path.uab.edu	2059340516		\N	\N	\N
892	Ersulan	Brooks	\N	ebrooks@mdanderson.org	713-792-7890		\N	\N	\N
893	Stacy	Stone	\N	StacyStone@Urologyofva.net	757-452-3460 ext 3821		\N	\N	\N
894	Sarah	Joost	\N	sarah.joost@ucsf.edu	415/353-7349		\N	\N	\N
895	Joeseph	Celestino	\N	jcelesti@mdanderson.org	713-563-4543		\N	\N	\N
896	Kay	Longhi	\N	clonghi@u.washington.edu	206-731-8230		\N	\N	\N
897	Suzanne	Kelly	\N	smkelly@partners.org	617-732-8958		\N	\N	\N
898	Hunter	Wessells	\N	wessells@u.washington.edu	206-731-6384		\N	\N	\N
899	William	Monnig	\N	vrice@theurologygroup.cc	513-366-3412		\N	\N	\N
900	Lisa	Isozaki	\N	lisozaki@fredhutch.org	206-667-6054		\N	\N	\N
901	Terry	Peltier-Siemers	\N	vrice@theurologygroup.cc	513-366-3412		\N	\N	\N
902	Vicki	Rice	\N	vrice@theurologygroup.cc	513-366-3412		\N	\N	\N
903	David	Euhus	\N	david.euhus@utsouthwestern.edu	(214) 648-6467		\N	\N	\N
904	Zhen	Zhang	\N	zzhang7@johnshopkins.edu	410-502-7871		\N	\N	\N
905	Thuy	Tran	\N	Thuy.Tran@jpl.nasa.gov	626-201-5302		\N	\N	\N
906	Albert	Dobi	\N	adobi@cpdr.org	240-453-8932		\N	\N	\N
907	Nirag	Jhala	\N	Jhala@path.uab.edu	(205) 975-8317		\N	\N	\N
909	Belen	Aparicio	\N	rbelen@comv.es	0034626838964		\N	\N	\N
910	Lisa	Newcomb5	\N	lnewcomb@fredhutch.org	2066671946		\N	\N	\N
911	Katherine	Sexton	\N	sexton@path.uab.edu	205) 934-6071		\N	\N	\N
912	D. James	Morre	\N	dj_morre@yahoo.com	765-464-1583		\N	\N	\N
913	Mary	Disis	\N	ndisis@u.washington.edu	206-616-1823		\N	\N	\N
914	Olle	Nilsson	\N	Olle.Nilsson@fdab.com	610.240.3800		\N	\N	\N
915	Brigette	Crawley	\N	bcrawley@umich.edu	734-647-3635		\N	\N	\N
916	Ali	Jiwani	\N	jiwani@bu.edu	617-414-6998		\N	\N	\N
917	Mashal	Jatoi	\N	mjatoi@umich.edu	7346154628		\N	\N	\N
918	Veena	Thyagarajan197	\N	vthyagar@umich.edu	734-763-7997		\N	\N	\N
919	Richard	Le	\N	hieuxle@stanford.edu	4085409693		\N	\N	\N
920	Pauline	Nguyen	\N	ppnguyen@stanford.edu	408-205-5450		\N	\N	\N
921	Alexandra	Altland	\N	rebecca.levan@uphs.upenn.edu	215-349-8548		\N	\N	\N
922	Lauren	Dewey	\N	ldewey@bidmc.harvard.edu	617-667-9103		\N	\N	\N
923	Todd	Morgan	\N	tomorgan@med.umich.edu	(734)763-9269		\N	\N	\N
924	Ashlee	Wisdom	\N	asw2009@med.cornell.edu	(347) 528-5666		\N	\N	\N
925	Samuel	Forry	\N	sam.forry@nist.gov	301.975.5246		\N	\N	\N
926	P Scott	Pine	\N	p.scott.pine@nist.gov	301-975-5311		\N	\N	\N
927	Jennifer	Linehan	\N	jlinehan@coh.org	626-256-4673 ext 60653		\N	\N	\N
928	Peter	Reczek	\N	peter.reczek@roadrunner.com	716-636-9677		\N	\N	\N
929	Ting-an	Yie	\N	ting-an.yie@nyumc.org	212-263-0255		\N	\N	\N
930	Katie	Schleissman	\N	katie.schleissman@nyumc.org	212-263-6479		\N	\N	\N
931	Emmanuel	Lazaridis	\N	lazarien@moffitt.usf.edu	(813) 903-6810		\N	\N	\N
932	Ajit	Varki	\N	varkiadmin@ucsd.edu	858-534-2214		\N	\N	\N
933	J. Michael	Pierce	\N	hawkeye@uga.edu	706-542-1702		\N	\N	\N
934	Denong	Wang	\N	dwang1@stanford.edu	650-723-7149		\N	\N	\N
935	Kathryn	Gantman	\N	kgantman@partners.org	617-632-3574		\N	\N	\N
936	Mita	Ghosh	\N	mrcg@umich.edu	734-763-0961		\N	\N	\N
937	Deanna	Wallace	\N	dwallace@atlanticurology.com	386-248-8215		\N	\N	\N
938	Alicia	Castonguay	\N	acastonguay@mdanderson.org	713-563-426		\N	\N	\N
939	Yasmin	Ench	\N	ench@uthscsa.edu	210-562-4109		\N	\N	\N
940	Sharmila	Anandasabapathy	\N	sharmila.anandasabapathy@mountsinai.org	212-241-6293		\N	\N	\N
941	Margaret	Huflejt	\N	Margaret.Huflejt@gmail.com	646-754-2610		\N	\N	\N
942	Josephine	Silvestre	\N	jsilvest@surgery.bsd.uchicago.edu	773-702-0792		\N	\N	\N
854	James	Brooks	9	jdbrooks@stanford.edu	6507255544		f	f	\N
943	Sandra	McGrath	\N	smcgrath@weisshospital.com	773-564-5265		\N	\N	\N
944	Adam	Kibel	\N	akibel@partners.org	(617) 732- 6665		\N	\N	\N
945	Bob	Bresalier	\N	rbresali@mdanderson.org	(713) 745-5295		\N	\N	\N
946	Mindy	Geisser	\N	msg@cccs.umn.edu	612-625-6695		\N	\N	\N
947	Victoria	Moore	\N	victoria.moore@uchospitals.edu	773-702-4809		\N	\N	\N
948	Michael	Wilson	\N	mwilson@eiclabs.com	781-769-9450		\N	\N	\N
949	Francis	Strahan	\N	strah001@umn.edu	612-625-4304		\N	\N	\N
950	Maureen	Kiernan	\N	maureen_kiernan@urmc.rochester.edu	585-275-4495		\N	\N	\N
951	Jill	Cordes	\N	jec@umn.edu	612-625-3496		\N	\N	\N
952	Abby	Stimmel	\N	astimmel@fredhutch.org	(206) 667-6160		\N	\N	\N
953	Michelle	Squires	\N	squiresm@umich.edu	734-763-2461		\N	\N	\N
954	Angela	Frank	\N	afrank3@jhmi.edu	410-502-5153		\N	\N	\N
955	Alexander	Kutikov	\N	Alexander.Kutikov@fccc.edu	(215) 728-2468		\N	\N	\N
956	Daniel	Chan	\N	dchan@jhmi.edu	410-955-2674		\N	\N	\N
957	Erin	Nomiyama	\N	enomiyama@user-centereddesign.com	4109485658		\N	\N	\N
958	Suzanne	Kolb	\N	skolb@fhcrc.org	206-667-4887		\N	\N	\N
959	Benjamin	Wiener	\N	benjamin.r.wiener@vanderbilt.edu	6159363428		\N	\N	\N
960	Vicki	Elborne	\N	velborne@cbi-biotech.com	804-648-3820		\N	\N	\N
961	Elissa	Ozanne	\N	elissa@mgh-ita.org	617-724-3760		\N	\N	\N
962	Donna	Hnosko	\N	Donna.Hnosko@fccc.edu	215-728-2986		\N	\N	\N
963	Rody	Barakat	\N	rxb773@med.miami.edu	305-243-7207		\N	\N	\N
964	Vani	Konda	\N	n/a	773-702-1460		\N	\N	\N
965	Dorothy	Heller	\N	dorothyheller@slu.edu	314-977-9400		\N	\N	\N
966	Kristina	Wrison	\N	kwriston	314-977-9400		\N	\N	\N
967	Travis	Sullivan	\N	travis.b.sullivan@lahey.org	781-744-2995		\N	\N	\N
968	Brigitte	Monroe	\N	monroeb@uthscsa.edu	210-567-5944		\N	\N	\N
969	Alissa	Greenberg	\N	alissa.greenberg@med.nyu.edu	(212) 263-6479		\N	\N	\N
970	Heather	White	\N	whitehe@smh.ca	416-864-6060 ext 2671		\N	\N	\N
971	Cameron	Marlow	\N	cmarlow2@jhmi.edu	(410) 9550-0353		\N	\N	\N
972	Alexandria	Lahdya	\N	azlahdya@u.washington.edu	206-598-0853		\N	\N	\N
973	Robert	Nam	\N	robert.nam@sw.ca	416-480-5075		\N	\N	\N
974	Kathryn	Wehrmeyer	\N	kwehrme@emory.edu	404-778-5993		\N	\N	\N
975	Jessica	Maes	\N	maesj@uw.edu	206-543-1461		\N	\N	\N
976	Ray	Lynem	\N	rlynem@umich.edu	313-671-0207		\N	\N	\N
977	Maria	Tretiakova	\N	mariast@uw.edu	206-897-4294		\N	\N	\N
978	Melinda	Liles	\N	mrcollins@novanthealth.org	336-718-8481		\N	\N	\N
979	Cheryl	Lin	\N	cheryl.lin@ucsfmedctr.org	510-212-2583		\N	\N	\N
980	Audrey	Huang	\N	Audrey.Huang@ucsfmedctr.org	415-353-7672		\N	\N	\N
981	Greg	Mowatt	\N	gmowatt@med.umich.edu	734-615-5180		\N	\N	\N
982	Mary	Hammond	\N	mary.hammond@uphs.upenn.edu	2158983981		\N	\N	\N
983	Fung Man	Poon	\N	manixp@uw.edu	2065431461		\N	\N	\N
984	Erica	Oropeza	\N	erica.oropeza@ucsf.edu	4155026939		\N	\N	\N
985	Thomas	Ahlering	\N	asawyers@uci.edu	714-456-8975		\N	\N	\N
986	Lisa	Guzman	\N	asawyers@uci.edu	714-456-8975		\N	\N	\N
987	David	Wong	\N	dtww@ucla.edu	310-206-3048		\N	\N	\N
988	Gil	Mor	\N	gil.mor@yale.edu	203-785-6294		\N	\N	\N
989	Stacy	Hatcher	\N	stacy.hatcher@ucsf.edu	(415)502-8739		\N	\N	\N
990	Jose-Luis	Ruiz	\N	joseluisruiz@sdclinicaltrials.com	619 287 6000		\N	\N	\N
991	Michael	Courter	\N	MCourter@cdc.gov	404-639-2163		\N	\N	\N
992	Shawnee	Lewis	\N	vrice@theurologygroup.cc	513-366-3412		\N	\N	\N
993	Jamie	Yingst	\N	yingstj@mskcc.org	646-227-2266		\N	\N	\N
994	Judith	Graves	\N	jgraves@umm.edu	4103283743		\N	\N	\N
995	Bibi	Baksh	\N	bakshb@mskcc.org	6462272260		\N	\N	\N
996	Hiu-Lam	Lau	\N	tracylau@med.umich.edu	7347640253		\N	\N	\N
997	Denise	Oelschlager	\N	oelschlager@path.uab.edu	2059344666		\N	\N	\N
998	Edward	Mahoney	\N	edward.mahoney@ucsfmedctr.org	415-476-0270		\N	\N	\N
999	Bogdan	Czerniak	\N	bczernia@mdanderson.org	(713) 794-1025		\N	\N	\N
1000	Windy	Cunningham	\N	wcwcwcwc@umich.edu	734-764-9308		\N	\N	\N
1001	David	Fishman	\N	david.fishman@mssm.edu	212-241-1901		\N	\N	\N
1002	Anu	Mathew	\N	amathew@meso-scale.com	240-631-2522, ext. 1053		\N	\N	\N
1003	Samir	Hanash	\N	shanash@mdanderson.org	713-745-5242		\N	\N	\N
1004	Adi	Gazdar	\N	adi.gazdar@utsouthwestern.edu	(214) 648-4921		\N	\N	\N
1005	Edward	Highsmith	\N	whighsmi@umaryland.edu	(410) 706-1825		\N	\N	\N
1006	Kathy	Helzlsouer	\N	khelzlsouer@mdmercy.com	(410) 955-9727		\N	\N	\N
1007	Lixin	Gong	\N	lgong@insightful.com	206-802-2355		\N	\N	\N
1008	Hans	Nielsen	\N	h.j.nielsen360@gmail.com	+45 20936525		\N	\N	\N
1009	Heather	Mullis	\N	mullish@uthscsa.edu	210-450-0705		\N	\N	\N
1010	Moncef	Jendoubi	\N	moncefj321@milagen.com	510-597-1244, ext. 11		\N	\N	\N
1011	Donald	Atha	\N	donald.atha@nist.gov	301-975-3092		\N	\N	\N
1012	Gary	Goodman	\N	Gary.goodman@swedish.org	206-667-5722		\N	\N	\N
1013	Louise	Showe	\N	lshowe@wistar.org	215-898-3791		\N	\N	\N
1014	Jing	Shue	\N	jshue@umich.edu	734-763-2461		\N	\N	\N
1015	Dendra	VonMerveldt	\N	Dendra.VonMerveldt@utsouthwestern.edu	214-645-8787		\N	\N	\N
1016	Lyuba	Levine	\N	lylevine@utmb.edu	409-772-0966		\N	\N	\N
1017	Arul	Chinnaiyan	\N	arul@umich.edu	734-615-4062		\N	\N	\N
1018	Lori	Francar	\N	Lori.Francar@hshs.org	920.433.8385		\N	\N	\N
1019	Kerri	Kendrick	\N	kendrick@uthscsa.edu	210-450-0752		\N	\N	\N
1020	Martin	Manion	\N	manionm@mskcc.org	6462272257		\N	\N	\N
1021	Allison	Vitonis	\N	avitonis@partners.org	617-732-7681		\N	\N	\N
1022	Taylor	Blaylock	\N	taylor.blaylock@vanderbilt.edu	615-875-6138		\N	\N	\N
1023	Gary	May	\N	mayg@smh.ca	416-864-5345		\N	\N	\N
1024	Samantha	Privatte	\N	sprivatte@gibbscc.org	864-560-1045		\N	\N	\N
1025	Laurie	Locascio	\N	locascio@nist.gov	301-975-3130		\N	\N	\N
1026	Seema	Khan	\N	skhan@nmh.org	312-503-2112		\N	\N	\N
1027	Dianna	Johnson	\N	dljohnson@mdanderson.org	713-794-4397		\N	\N	\N
1028	Chris	Kinsinger	\N	kinsingerc@mail.nih.gov	301-451-8883		\N	\N	\N
1029	Jodi	Koch	\N	Jodi.Koch@hshs.org	920-884-3491		\N	\N	\N
1030	Angela	Reploeg	\N	cartera@msnotes.wustl.edu	314-362-8295		\N	\N	\N
1031	Barbara	Herald	\N	barb.herald@hshs.org	920-884-3485		\N	\N	\N
1032	Carol	Sweney	\N	carol.sweney@hshs.org	920-433-8215		\N	\N	\N
1033	Meredith	King	\N	meredith.king@hshs.org	920-433-8348		\N	\N	\N
1034	Habtom	Ressom	\N	hwr@georgetown.edu	202-687-2283		\N	\N	\N
1035	Erik	Thunnissen	\N	e.thunnissen@vumc.nl	+31204444070		\N	\N	\N
1036	Tod	Bedilion	\N	tod.bedilion@roche.com	925-730-8526		\N	\N	\N
1037	Suzanne	Parker	\N	szparker@uab.edu	205-996-9293		\N	\N	\N
1038	Alan	Fritz	\N	afritz@localnet.com	518-768-8112		\N	\N	\N
1039	Kusal	Mihindukulasuriya	\N	kmihindu@slu.edu	314-577-8764		\N	\N	\N
1040	Susannah	Hall	\N	sghall@fredhutch.org	206-667-4298		\N	\N	\N
1041	Tao	Liu	\N	tao.liu@pnnl.gov	509-371-6346		\N	\N	\N
1042	Mary	Schuster	\N	mary.schuster@sanfordhealth.org	701-234-7514		\N	\N	\N
1043	Robbert	Slebos	\N	r.slebos@vanderbilt.edu	615-936-2806		\N	\N	\N
1044	Brenda	Shiggs	\N	byntashiggs@yahoo.com	813-333-3121		\N	\N	\N
1045	Bonnie	Streed	\N	bonnie.streed@sanfordhealth.org	17012346297		\N	\N	\N
1046	Loretta	Weisenborn	\N	loretta.weisenborn@viachristi.org	316/268/8549		\N	\N	\N
1047	Vanessa	Samuels	\N	vsamuels25@yahoo.com	240-297-3471		\N	\N	\N
1048	Roosevelt	Anderson	\N	randerson@mdanderson.org	713-563-7453		\N	\N	\N
1049	Mai	Dinh	\N	mdinh@mdanderson.org	713-792-8451		\N	\N	\N
1050	Allison	Beaver	\N	Allison.Beaver@utsouthwestern.edu	214-645-8788		\N	\N	\N
1051	Keren	Elias	\N	keren.elias@utsouthwestern.edu	214-645-8761		\N	\N	\N
1052	Michael	Swaim	\N	mpswaim@mdanderson.org	713-794-4184		\N	\N	\N
1053	Heidi	Auman	\N	heidi@canaryfoundation.org	917-579-4638		\N	\N	\N
1054	Javed	Siddiqui	\N	siddiqui@umich.edu	734-764-3799		\N	\N	\N
1055	Barbara	Tucky	\N	tuckyb@ccf.org	216-444-1044		\N	\N	\N
1056	Lisa	Harvey	\N	lharvey@uabmc.edu	205-996-2613		\N	\N	\N
1057	David	Campos-Ruiz	\N	davidcampos@sdclinicaltrials.com	619 287 6000		\N	\N	\N
1058	Michel	Ouellette	\N	mouellet@unmc.edu	402-559-5556		\N	\N	\N
1060	Ryan	Winters	\N	ryan.winters@fccc.edu	908-217-9947		\N	\N	\N
1061	Richard (Rick)	Zangar	\N	richard.zangar@pnnl.gov	509-371-7301		\N	\N	\N
1062	James	Hamilton	\N	jhamilton@medicine.umaryland.edu	410-706-3375		\N	\N	\N
1063	Yuriko	Mori	\N	ymori3@jhmi.edu	410-502-6057		\N	\N	\N
1064	Mary Ann	Clapper	\N	mclapper@umm.edu	410-328-2976		\N	\N	\N
1065	Surinder	Batra	\N	sbatra@unmc.edu	402-559-5455		\N	\N	\N
1066	Douglas	Lake	\N	douglas.lake@asu.edu	480-965-0803		\N	\N	\N
1067	Pie	Pichetsurnthorn	\N	Pie.Pichetsurnthorn@viachristi.org	316-268-5691		\N	\N	\N
1069	Jeffrey	Marks	\N	jeffrey.marks@duke.edu	(919) 684-6133		\N	\N	\N
1070	Kamilla	Isakova	\N	kisakova@kumc.edu	9177752500		\N	\N	\N
1071	Deborah	Carr	\N	dcarr@novanthealth.org	336-718-4077		\N	\N	\N
1072	Jennifer	McCollum	\N	jrmccollum@saintfrancis.com	918-494-6985		\N	\N	\N
1073	Denise	Matthews	\N	dmatthews@jhsph.edu	(410) 955-4356		\N	\N	\N
1074	Jay	Schiestle	\N	jschiestle@exactsciences.com	608-284-5700		\N	\N	\N
1075	Jesse	McKenney	\N	mckennj@ccf.org	216-444-1058		\N	\N	\N
1076	Michael	Gillette	\N	gillette@broadinstitute.org	617-714-9743		\N	\N	\N
1077	Craig	Logsdon	\N	clogsdon@mdanderson.org	713-563-3585		\N	\N	\N
1078	Maria	Cirocco	\N	ciroccom@smh.toronto.on.ca	416 864 6060 x-2965		\N	\N	\N
1079	Michael	DeShazo	\N	mdeshazo@u.washington.edu	206-543-3273		\N	\N	\N
1080	Kyle	McAnally	\N	kmcanall@bidmc.harvard.edu	617-667-9102		\N	\N	\N
1081	Nancy	Kiviat	\N	nbk@u.washington.edu	(206) 731-3145		\N	\N	\N
1082	Elizabeth	Guiles	\N	elizabeth.guiles@spectrumhealth.org	616-391-1230		\N	\N	\N
1083	Dhananjay (Dan)	Chitale	\N	dchital1@hfhs.org	313-916-2600		\N	\N	\N
1084	Charlene	Rogers	\N	croger13@jhmi.edu	410-502-3693		\N	\N	\N
1085	Catherine	Moser	\N	moser.catherine@mayo.edu	507-284-0991		\N	\N	\N
1086	Ileana	Aderca	\N	aderca.ileana@mayo.edu	507-284-1066		\N	\N	\N
1087	Amanda	Surette	\N	asurette@cangenbio.com	202-537-2290		\N	\N	\N
1088	Marsha	Ketcham	\N	mketcham@unmc.edu	402-559-5286		\N	\N	\N
1089	Jose	Diaz	\N	jdiaz@idd.org	210-450-3846		\N	\N	\N
1090	Harold	Moses	\N	hal.moses@vanderbilt.edu	615-936-1374		\N	\N	\N
1091	Robert	Gillies	\N	robert.gillies@moffitt.org	813-745-8355		\N	\N	\N
1092	Chris	Mattmann	\N	chris.mattmann@jpl.nasa.gov	818-354-8810		\N	\N	\N
1093	Alberto	Gutierrez	\N	alberto.gutierrez@fda.hhs.gov	301-796-5453		\N	\N	\N
1094	Nadarajen	Vydelingum	\N	vydelinn@mail.nih.gov	(240) 276-7127		\N	\N	\N
1095	Eric	Ross	\N	e_ross@fccc.edu	215-728-2891		\N	\N	\N
1096	Kylee	LaRock	\N	larockk@upstate.edu	315-464-5721		\N	\N	\N
1097	Michael	Tainsky	\N	tainskym@karmanos.org	313-578- 4340		\N	\N	\N
1098	Nancy	Young	\N	nancy.young@drexelmed.edu	(215) 489-4947		\N	\N	\N
1099	Erin	Dwyer	\N	dwyere@upstate.edu	315-464-9015		\N	\N	\N
1100	Stacey	Harrelson	\N	sharrel@grandstrandurology.com	843-449-1010		\N	\N	\N
1101	Teresa	Koulouris	\N	koulourt@upstate.edu	315-464-9003		\N	\N	\N
1102	Courtney	Whitten	\N	whittenc@upstate.edu	315-464-9003		\N	\N	\N
1103	Karen	Ng	\N	kng@queens.org	808-537-7614		\N	\N	\N
1104	Sharon	Tamashiro	\N	stamashiro@queens.org	808-691-8583		\N	\N	\N
1105	Nasra	Giama	\N	giama.nasra@mayo.edu	5075380097		\N	\N	\N
1106	Jessica	Roestenburg	\N	RoestenburgJ@cc.ucsf.edu	415.476.8825		\N	\N	\N
1107	Doris	Garrett	\N	doris_garrett@via-christi.org	316-268-8190		\N	\N	\N
1108	Sarah	Helber	\N	shelber@aibiotech.com	804-915-3853		\N	\N	\N
1109	Nam	Kim	\N	nkim@diadexus.com	650-246-6400		\N	\N	\N
1110	Robert	Wolfert	\N	bwolfert@diadexus.com	650-246-6400		\N	\N	\N
1111	Terrence	Strawder	\N	tstrawde@umich.edu	7349363363		\N	\N	\N
1112	Rafael	Guerrero-Preston	\N	rguerre3@jhmi.edu	410-502-5053		\N	\N	\N
1113	Jennifer	Noteboom	\N	noteboom@u.washington.edu	(206) 543-1461		\N	\N	\N
1114	Roxxana	Beltran	\N	Roxxana.Beltran@ucsf.edu	415-476-8825		\N	\N	\N
1115	Laura	Berry	\N	lberry7@slu.edu	314-677-9320		\N	\N	\N
1116	Karishma	Kurowski	\N	Karishma.Kurowski@jefferson.edu	2155032983		\N	\N	\N
1117	Andre	Valcour	\N	ValcouA@labcorp.com	336-436-3854		\N	\N	\N
1118	Michelle	Desler	\N	mdesler@unmc.edu	402-559-8885		\N	\N	\N
1119	Natalie	Surfus	\N	surfusnh@slu.edu	4142926452		\N	\N	\N
1120	Gloria	Cornelius	\N	cornelius.gloria@marshfieldclinic.org	715-393-1359		\N	\N	\N
1121	Siham	Akleh	\N	Siham.Akleh@nyumc.org	212-263-8508		\N	\N	\N
1122	Ned	Realiza	\N	nrealiza@stanford.edu	650-498-8496		\N	\N	\N
1123	Charles	Rosser	\N	crosser@cc.hawaii.edu	808-564-3812		\N	\N	\N
1124	Melissa	Carr	\N	Melissa.Carr@sanfordhealth.org	605-328-1390		\N	\N	\N
1125	Michael	Ojelabi	\N	moojelab@gundluth.org	1-800-362-9567		\N	\N	\N
1126	Jennifer	Stromberg	\N	jenn@umn.edu	612-625-4011		\N	\N	\N
1127	Edward	Messing	\N	edward_messing@urmc.rochester.edu	585-275-3345		\N	\N	\N
1128	Dana	Haviland	\N	haviland@mskcc.org	212-639-8726		\N	\N	\N
1129	Lauren	Winter	\N	lwinter@mednet.ucla.edu	(310) 267-2725		\N	\N	\N
1059	Steve	Dubinett	9	sdubinett@mednet.ucla.edu	3102672725		f	f	\N
1130	Leslie	Carter	\N	leslie@uw.edu	206-598-0853		\N	\N	\N
1131	Samantha	Pennel	\N	samantha.pennel@viachristi.org	316-268-5568		\N	\N	\N
1132	Virginia	Green	\N	ginger.green@viachristi.org	316-268-5737		\N	\N	\N
1133	Margaret	Bruce	\N	mvbruce@mdanderson.org	713.792.5553		\N	\N	\N
1134	Amanda	Spaulding	\N	amanda.spaulding@viachristi.org	316-268-5181		\N	\N	\N
1135	Jonine	Figueroa	\N	figueroaj@mail.nih.gov	301-402-3654		\N	\N	\N
1136	Lewis	Pannell	\N	lpannell@health.southalabama.edu	251-445-9860		\N	\N	\N
1137	Carlton	Cross	\N	Nightwingstudios@aol.com	770-929-9160		\N	\N	\N
1138	John	Farris	\N	jdfarris@uabmc.edu	205-326-9439		\N	\N	\N
1139	Elizabeth	Fabian	\N	efabian2@jhmi.edu	410-614-9261		\N	\N	\N
1140	Qinghua	Feng	\N	qf@u.washington.edu	206-341-5904		\N	\N	\N
1141	Ziding	Feng	\N	zfeng3@mdanderson.org	713-745-0373		\N	\N	\N
1142	Steinunn	Thorlacius	\N	steinunn@uvs.is	00354 525-3600		\N	\N	\N
1143	Michael	Hollingsworth	\N	mahollin@unmc.edu	402-559-8343		\N	\N	\N
1144	Jill	Macoska	\N	jill.macoska@umb.edu	617-287-5783		\N	\N	\N
1145	Elane	Urbano	\N	elurbano@med.umich.edu	734-764-0253		\N	\N	\N
1146	Traci	Kimes	\N	tkimes@cresearchc.com	407-523-0697		\N	\N	\N
1147	Guido	Dalbagni	\N	dalbagng@mskcc.org	646-422-4394		\N	\N	\N
1148	William	Ross	\N	wross@mdanderson.org	713-794-5073		\N	\N	\N
1149	Kelsey	Lemmen	\N	lemmenk@umich.edu	7349363363		\N	\N	\N
1150	Michael	Gorzenski	\N	michael.gorzenski@beaumont.edu	248-551-1826		\N	\N	\N
1151	Naomi	Agostino	\N	nra10@pitt.edu	412-623-4672		\N	\N	\N
1152	David	Kelly	\N	dkelly@unmc.edu	402-559-9157		\N	\N	\N
1153	Mark	Lim	\N	mlim@ambergen.com	617-923-9930		\N	\N	\N
1154	Chrisley	Pickens	\N	cpickens@umm.edu	410-706-6534		\N	\N	\N
1155	Brandy	Haydel	\N	brandy.haydel@mountsinai.org	212-241-0255		\N	\N	\N
1156	Matt	Castro	\N	matt.castro@biostorage.com	317-437-8180		\N	\N	\N
1157	Karen	Abbott	\N	kabbott@uams.edu	501-686-5196		\N	\N	\N
1158	Jun	Zhou	\N	zhouj@moffitt.usf.edu	(813) 745-3891		\N	\N	\N
1159	Peter	Allen	\N	allenp@mskcc.org	212-639-5132		\N	\N	\N
1160	Joseph	Basler	\N	basler@uthscsa.edu	210-567-5640		\N	\N	\N
1161	Josephine	Mitcham	\N	josephine.mitcham@mountsinai.org	212-824-7837		\N	\N	\N
1162	Lisa	Cazares	\N	cazarelh@evms.edu	(757) 446-5763		\N	\N	\N
1163	Paul	Strickland	\N	pstrickl@jhsph.edu	(410) 955-4456		\N	\N	\N
1164	Sandy	Fletcher	\N	slfletcher@atriummedcenter.org	513-420-5674		\N	\N	\N
1165	Lee	Goodglick	\N	lgoodglick@mednet.ucla.edu	(310) 825-9134		\N	\N	\N
1166	Mike	Gruidl	\N	gruidlme@moffitt.usf.edu	(813) 745-6808		\N	\N	\N
1167	Kristin	McWilliams	\N	kristin.mcwilliams@carle.com	217-383-4076		\N	\N	\N
1168	Royceann	Malnik	\N	rmalnik@fredhutch.org	(206) 667-6972		\N	\N	\N
1170	Maureen	Colbert	\N	maureen.colbert@dartmouth.edu	781-820-2395		\N	\N	\N
1171	April	Malis	\N	amalis@umich.edu	734-615-3040		\N	\N	\N
1172	Brian	Haab	\N	brian.haab@vai.org	616-234-5268		\N	\N	\N
1173	Anna	Ramakrishnan	\N	annarama@stanford.edu	650.736.0697		\N	\N	\N
1174	Dale	McLerran	\N	dmclerra@fredhutch.org	(206) 667-2926		\N	\N	\N
1175	David	Lubman	\N	dmlubman@umich.edu	734-647-8834		\N	\N	\N
1176	Carmen	Wooden	\N	cwooden@som.umaryland.edu	410-706-6518/410-706-7070		\N	\N	\N
1177	Gerald	Andrioli	\N	andrioleg@msnotes.wustl.edu	314-362-8212		\N	\N	\N
1178	Stan	Gerson	\N	stanton.gerson@case.edu	216-844-8562		\N	\N	\N
1179	Malcolm	Brock	\N	mabrock@jhmi.edu	410-955-4408		\N	\N	\N
1180	Ruth	Reed	\N	ruth.reed@mercy.net	405-752-3401		\N	\N	\N
1181	Michelle	Jin	\N	qjin27@stanford.edu	319-400-6380		\N	\N	\N
1182	Joyce	Hoffmann	\N	hoffmaja@slu.edu	314-977-9404		\N	\N	\N
1183	Kimberly	Christ	\N	kimberly.r.christ@lahey.org	781-744-2969		\N	\N	\N
1184	Brian	Reid	\N	bjr@fredhutch.org	206-667-6792		\N	\N	\N
1185	Nancy	Blythe	\N	nblythe@fredhutch.org	206-667-6900		\N	\N	\N
1186	David	Beer	\N	dgbeer@umich.edu	734-763-0325		\N	\N	\N
1187	Sadanand	Gite	\N	sadanand@ambergen.com	781-419-4045		\N	\N	\N
1188	Craig	Newschaffer	\N	cnewscha@jhsph.edu	(410) 955-1268		\N	\N	\N
1189	Amosy	M&#39;Koma	\N	amkoma@mmc.edu	615-327-6796		\N	\N	\N
1190	Deanna	Stelling	\N	dstellin@fredhutch.org	206-667-7388		\N	\N	\N
1191	Ivan	Ding	\N	dingi@mail.nih.gov	301-451-3864		\N	\N	\N
1192	Ian	Fore	\N	forei@mail.nih.gov	301-496-3355		\N	\N	\N
1193	Samuil	Umansky	\N	sumansky@xenomics.com	732-438-8290, x201		\N	\N	\N
1194	Alison	Klein	\N	aklein1@jhmi.edu	410-955-3511		\N	\N	\N
1195	Michelle	Anderson	\N	maaander@umich.edu	734-936-4775		\N	\N	\N
1196	Christopher	Amling	\N	christopher.amling@ccc.uab.edu	205-966-8765		\N	\N	\N
1197	Vivien	Wang	\N	vwang@northshore.org	847-570-2185		\N	\N	\N
1198	Jeffrey	Pittman	\N	jpittman@fredhutch.org	(206) 667-5078		\N	\N	\N
1199	Mike	Hoerres	\N	mhoerres@sourcemdx.com	610-730-3626		\N	\N	\N
1200	Don	Listwin	\N	don@canaryfoundation.org	650-646-3200		\N	\N	\N
1201	Megan	Hendricks	\N	hendricksma@upmc.edu	412-623-4120		\N	\N	\N
1202	Anna	Lawter	\N	alawter@gibbscc.org	864-560-1047		\N	\N	\N
1203	Amy	Ernst	\N	aernst@northshore.org	847-570-1783		\N	\N	\N
1204	Cheung	Chhieng	\N	dchhieng@path.uab.edu	(205) 934-6160		\N	\N	\N
1205	Harvey	Pass	\N	harvey.pass@med.nyu.edu	212-731-5414		\N	\N	\N
1206	Betsy	Ryland	\N	rylandb@upmc.edu	412-623-7771		\N	\N	\N
1207	Laurie	Gormanns	\N	lgormanns@grandstrandurology.com	843-449-1010 x251		\N	\N	\N
1208	Verena	Sailer	\N	vws2001@med.cornell.edu	6469626189		\N	\N	\N
1209	Surbhi	Jain	\N	sjain@jbs-science.com	215-489-4936		\N	\N	\N
1210	Anthony	Jaslowski	\N	Christy.Gilchrist@hshs.org	920-433-8889		\N	\N	\N
1211	Han-Yao	Huang	\N	hyhuang@jhsph.edu	(410) 502-9094		\N	\N	\N
1212	Ashley	Mace	\N	amace@gibbscc.org	864-560-1035		\N	\N	\N
1213	Anne Marie	Lennon	\N	amlennon@jhmi.edu	410-955-5800		\N	\N	\N
1214	Shivakumar	Vignesh	\N	Shivakumar.Vignesh@moffitt.org	813-745-8361		\N	\N	\N
1215	Minxue	Zheng	\N	minxue.zheng@hotmail.com	650-260-8785		\N	\N	\N
1216	Sheila	McMellion	\N	smcmellion@gibbscc.org	864-560-1032		\N	\N	\N
1217	Jacqueline	Cerkoski	\N	cerkoski@slu.edu	314-977-5239		\N	\N	\N
1218	Mary Ann	Clements	\N	clemenma@evms.edu	(757) 446-7910		\N	\N	\N
1219	JoAnn	Jameson	\N	joann.jameson@sanfordhealth.org	701-234-7563		\N	\N	\N
1220	Bruce	McCreedy	\N	bmccreedy@metabolon	919-595-2279		\N	\N	\N
1221	Steven	Hughes	\N	steve.hughes@jpl.nasa.gov	(818) 354-9338		\N	\N	\N
1222	Brian	Main	\N	mainbp@evms.edu	(757) 446-5750		\N	\N	\N
1223	Jae	Lee	\N	Jae.Lee@moffitt.org	813-745-2646		\N	\N	\N
1224	Serge Patrick	Nana-Sinkam	\N	Patrick.Nana-Sinkam@osumc.edu	614-688-8446		\N	\N	\N
1225	Gerard	Davis	\N	gerard.davis@abbott.com	847-487-9478		\N	\N	\N
1226	Julie	Koch	\N	jkoch@vhschicago.com	708-238-7574		\N	\N	\N
1227	Carla	Jackson	\N	carla.jackson@utsouthwestern.edu	(214) 648-4904		\N	\N	\N
1228	April	Krakar	\N	akrakar@macneal.com	708-783-5673		\N	\N	\N
1229	Candy	Johnson	\N	candy.johnson@viachristi.org	316-268-8076		\N	\N	\N
1230	Betty Jo	Austin	\N	betty.austin@utsouthwestern.edu	(214) 648-4900		\N	\N	\N
1231	Jeanne	Litka	\N	Jeanne.Litka@sanfordhealth.org	605-328-1383		\N	\N	\N
1232	Jack	Barkin	\N	tucsg@hotmail.com	416-256-9606		\N	\N	\N
1233	Megan	Finnerty	\N	finnertym@upmc.edu	412-623-3105		\N	\N	\N
1234	Darlene	Heath	\N	djh@cccs.umn.edu	612-625-3586		\N	\N	\N
1235	Darcie	Reckers	\N	darcie.reckers@carle.com	217-383-4452		\N	\N	\N
1236	Shelley	McCaskill	\N	shelly.mccaskill@carle.com	217-383-3512		\N	\N	\N
1237	Rebecca	Miller	\N	rebeccacmiller	314-977-9400		\N	\N	\N
1238	Rupi	Dhaliwal	\N	rupinderdhaliwal_1@hotmail.com	905-338-3130		\N	\N	\N
1239	Sandy	Warrington	\N	swarrington@atlanticurology.com	3862398535		\N	\N	\N
1240	Misop	Han	\N	mhan1@jhmi.edu	410-502-3499		\N	\N	\N
1241	Kit	Murtha	\N	urokit1@aol.com	973-325-6100		\N	\N	\N
1242	Stig	Kreps	\N	stig.kreps@ucsfmedctr.org	415-885-7578		\N	\N	\N
1243	Janette	Ricketts	\N	janette.ricketts@msnyuhealth.org	212-659-8049		\N	\N	\N
1244	Karen	Anderson	\N	Karen.Anderson.1@asu.edu	480-965-6982		\N	\N	\N
1245	Norma	Cortez	\N	norma.cortez@med.nyu.edu	212-263-7417		\N	\N	\N
1246	Cindy	Plate	\N	cjplate@unmc.edu	402-559-4192		\N	\N	\N
1247	Radoslav	Goldman	\N	rg26@georgetown.edu	202-687-9868		\N	\N	\N
1248	Nora	Horick	\N	nhorick@partners.org	617-724-0746		\N	\N	\N
1249	Michael	Grable	\N	mgrable@atlanticurology.com	386-774-9096		\N	\N	\N
1250	Martin	Dineen	\N	mdineen@atlanticurology.com	386-239-8535		\N	\N	\N
1251	Yitzhak	Berger	\N	yb0316@aol.com	973-325-6100		\N	\N	\N
1252	Jesse	McKenney	\N	mckennj@ccf.org	216-444-1058		\N	\N	\N
1253	Richard	Greenberg	\N	Richard.Greenberg@fccc.edu	(215) 728-5341 option #3		\N	\N	\N
1254	Merel	Nissenberg	\N	mgrey@ucsd.edu	310-525-3570		\N	\N	\N
1255	Martin	McIntosh	\N	mmcintos@fredhutch.org	206-378-0420		\N	\N	\N
1256	Pamela	Suddaby	\N	suddabyp@upstate.edu	315-464-9003		\N	\N	\N
1257	WenFu	Wang	\N	wenfuwang@mdanderson.org	713-743-4703		\N	\N	\N
1258	Sylvia	Trevino	\N	setrevin@mdanderson.org	7135631719		\N	\N	\N
1259	Nicole	Benoit	\N	nbenoit@jhmi.edu	410-502-5133		\N	\N	\N
1260	John	Malick	\N	john.malick@fccc.edu	215-728-2786		\N	\N	\N
1261	Mindy	Walters	\N	mindy.walters@ucdenver.edu	303-724-1236		\N	\N	\N
1262	Harpreet	Singh	\N	hsight01@imap.pitt.edu	412-647-2148		\N	\N	\N
1266	Alex	Baras	14	abaras1@jhmi.edu			\N	\N	\N
1267	Srinivasan	Yegnasubramanian	14	syegnasu@jhmi.edu			\N	\N	\N
1268	Eugene	Koay	14	ekoay@mdanderson.org	713-563-2381		\N	\N	\N
1271	Michelle	Yip-Schneider	14	myipschn@iupui.edu	3172784739		\N	\N	\N
1272	Yafang	Li	14	Yafang.Li@dartmouth.edu			\N	\N	\N
1273	Jaime	Rodriquez	\N				\N	\N	\N
1274	Robert D.	Cardiff	\N				\N	\N	\N
1275	Wilbur A.	Frankin	\N				\N	\N	\N
1276	Judith	Forman	\N	Judith.L.Forman@dartmouth.edu	6036530638		\N	\N	\N
1277	Lamar	Moss	\N	lamar.d.moss@dartmouth.edu	6036501974		\N	\N	\N
1278	Steven	Pyle	10	steven.pyle@dartmouth.edu	6037020370		\N	\N	\N
1279	Eugene	Demidenko	\N	eugene.demidenko@dartmouth.edu	6036533682		\N	\N	\N
1280	Tor	Tosteson	\N	tor.tosteson@dartmouth.edu	6036533677		\N	\N	\N
1281	Max	Schmidt	8		3179488358		\N	\N	\N
1282	Luigi	Marchionni	8	marchion@jhu.edu	4105021789		\N	\N	\N
1283	Karen	Sfanos	8				\N	\N	\N
1284	Alexander	Szalay	\N				\N	\N	\N
1285	Elana	Fertig	8	ejfertig@jhmi.edu	4109554268		\N	\N	\N
1286	Sarah	Wheelan	8	swheelan@jhmi.edu	4105027754		\N	\N	\N
1287	Harold	Lehmann	8				\N	\N	\N
1263	Angelo	DeMarzo	8	ademarz@jhmi.edu	4106145686		f	f	\N
1288	Vittorio	Crisitini	8				f	f	\N
1289	Matthew	Firpo	8	matt.firpo@hsc.utah.edu	8015879049		f	f	\N
1290	Matthew	Katz	9				f	f	\N
1291	Gillian	Hirst	8	gill.hirst@ucsf.edu	4153537504		f	f	\N
1292	Yiwey	Shieh	9		4153537900		f	f	\N
1293	Christina	Yau	8	cyau@buckinstitute.org	4155020134		f	f	\N
1294	Spencer	Behr	9	spencer.behr@ucsf.edu	6172337534		f	f	\N
1295	Laura	Van't Veer	8	vantveerl@cc.ucsf.edu	4154766023		f	f	\N
1296	Scott	VandenBerg	8	scott.vandenberg@ucsf.edu	4155144978		f	f	\N
1297	John	Hazle	8				f	f	\N
1298	Avrind	Roa	8				f	f	\N
1299	Ignacio	Wistuba	9				f	f	\N
1300	Huamin	Wang	8				f	f	\N
1301	Yu	Shen	8	yshen@mdanderson.org	7137944159		f	f	\N
1302	Matt	Schabath	8	Matthew.Schabath@moffitt.org	8137454150		f	f	\N
1303	Jennifer	Permuth	8	Jenny.Permuth@moffitt.org			f	f	\N
1304	Charles 	Powell	9				f	f	\N
1305	Mary Beth	Beasley	9				f	f	\N
538	Jacob	Kagan	8	kaganj@mail.nih.gov	2402767027		t	f	\N
890	Sharmistha	Ghosh-Janjigian	8	ghoshjanjigias@mail.nih.gov	(240) 276-7122		t	f	\N
1068	Kathy	Marshall	10	marshallkj@mail.nih.gov	(240) 276-7143		t	f	\N
1306	Elizabeth	Woodhouse	8	woodhousee@mail.nih.gov	2402766220		f	t	\N
1307	Jerry	Li	8	jerry.li@nih.gov	2402766194		f	t	\N
1308	Ron	Johnson	8	rjohnso2@mail.nih.gov	2402766250		f	t	\N
1309	Jeffery	Hildesheim	8	hildesheimj@mail.nih.gov	2402766220		f	t	\N
1310	Nastaran	Kuhn	8	nas.kuhn@nih.gov	2402767610		f	t	\N
1311	Sean	Mulvihill	9	sean.mulvihill@hsc.utah.edu	8015878430		f	f	\N
1312	Andrew	Lowy	9	alowy@ucsd.edu	8585341831		f	f	\N
1313	Mark	Valasek	8				f	f	\N
1314	Parag	Mallick	8	paragm@stanford.edu	6507213298		f	f	\N
1315	Jonathan	Pollack	8	pollock1@stanford.edu	6507361987		f	f	\N
1316	Robert	West	8	rbwest@stanford.edu	6507362664		f	f	\N
101	Sudhir	Srivastava	8	srivasts@mail.nih.gov	2402767028		t	f	\N
11	David	Liu	6	david.liu@jpl.nasa.gov	6199922704		t	f	\N
1264	Kenneth	Pienta	9	kpienta1@jhmi.edu			f	f	\N
1318	Sharon	Pitteri	8	spitteri@stanford.edu	6507236076		f	f	\N
1319	Robert	Tibshirani	8	tibs@stanford.edu	6507237264		f	f	\N
1320	Max	Diehn	8				f	f	\N
1321	Viswarm	Nair	9	viswamnair@stanford.edu	6507249635		f	f	\N
1322	Denise	Aberle	9	daberle@mednet.ucla.edu	3107948996		f	f	\N
1323	Tonya	Walser	8	twalser@mednet.ucla.edu	3108256896		f	f	\N
1324	Haodong	Xu	8	Haodongxu@mednet.ucla.edu	3108256470		f	f	\N
1325	Luca	Cinquini	8	Luca.Cinquini@jpl.nasa.gov			f	f	\N
1326	Ashish	Mahabal	8	aam@astro.caltech.edu			f	f	\N
1327	Janet	Stein	8	Janet.Stein@uvm.edu	8026564876		f	f	\N
1328	Donald	Weaver	9	Donald.Weaver@uvm.edu	8028475928		f	f	\N
1329	Brian	Sprague	8				f	f	\N
1330	Jonathan	Gordon	8	jonathan.a.gordon@uvm.edu	8026564885		f	f	\N
1331	Sally	Herschorn	9	sally.herschorn@uvmhealth.org	8028470064		f	f	\N
1332	Julie	Dragon	8	Julie.Dragon@uvm.edu			f	f	\N
1333	Pam	Vacek	8	pvacek@uvm.edu	8026560626		f	f	\N
1334	Mark	Evans	8	mark.evans@uvm.edu			f	f	\N
23	Ronald	Walker	9	ronald.walker@vanderbilt.edu	6157155572		f	f	\N
1335	Eric	Grogan	9				f	f	\N
1336	Rosana	Eisenburg	9	rosana.eisenberg@vanderbilt.edu			f	f	\N
1337	Jonathan	Irish	8				f	f	\N
1338	Mia	Levy	8				f	f	\N
1339	Bennett	Landman	8				f	f	\N
1340	Yu	Shyr	9	yu.shyr@vanderbilt.edu	6159362572		f	f	\N
356	Christos	Patriotis	8	Patriotisc@mail.nih.gov	2402767134		t	f	\N
1169	Laura	Esserman	9	laura.esserman@ucsfmedctr.org	4158857691		f	f	\N
1341	Alexander	Borowsky	9	adborowsky@ucdavis.edu	5307548182		f	f	\N
1342	Edward	Schaeffer	8	e-schaeffer@northwestern.edu	3129081615		f	f	\N
613	Anirban	Maitra	9	amaitra@mdanderson.org	7137450861		f	f	\N
1343	Rebecca	Sawyer Lee	\N				f	f	\N
1344	Daniel	Rubin	\N				f	f	\N
1351	Kim	Sandler	\N	kim.sandler@Vanderbilt.Edu			f	f	
1352	Sanja	Antic	\N	sanja.l.antic@Vanderbilt.Edu			f	f	
1353	Travis	Osterman	31	travis.j.osterman@vanderbilt.edu			f	f	
1354	Olivier	Harismendy	8	oharismendy@ucsd.edu			f	f	
1355	Rick	Bold	9				f	f	
1356	Neil Ed	Hubbard	\N	nehubbard@ucdavis.edu			f	f	
1357	Hidetoshi	Mori	\N	hmori@ucdavis.edu			f	f	
1358	Denis	Nunez	\N	Denis.Nunez@uvm.edu			f	f	
1359	Kathleen	Howe	\N	Kathleen.Howe@uvm.edu			f	f	
1360	Jennifer	Beane	8	jbeane@bu.edu			f	f	
1361	Fenghai	Duan	8	Fenghai_Duan@brown.edu			f	f	
1362	Adam	Gower	8	agower@bu.edu			f	f	
\.


--
-- Data for Name: person_degree_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY person_degree_link (id, personid, degreeid) FROM stdin;
859	1278	10
868	1286	9
869	1286	8
875	1290	9
880	1295	8
886	1300	9
887	1300	8
893	1305	9
899	890	8
905	1307	9
906	1307	8
911	1312	9
919	1317	8
925	1322	9
931	1327	8
936	1332	8
941	1335	9
947	1339	8
953	538	8
958	854	9
964	1342	9
965	1342	8
970	1353	31
975	1362	8
860	1281	27
861	1281	9
862	1281	8
870	1287	9
871	1287	8
876	1291	8
881	1296	9
882	1296	8
888	1301	8
900	1068	10
907	1308	8
912	1313	9
913	1313	8
920	1318	8
926	1323	8
932	1328	9
937	1333	8
942	1336	9
948	1340	9
954	351	8
959	1263	9
960	1263	8
966	613	9
971	1354	8
863	1282	9
864	1282	8
877	1292	9
883	1297	8
889	1302	8
901	187	8
908	1309	8
914	1314	8
921	1319	8
927	1324	9
928	1324	8
933	1329	8
938	1334	8
949	10	10
961	1169	9
967	1059	9
972	1355	9
865	1283	10
866	1283	8
873	1288	8
878	1293	8
884	1298	8
890	1303	10
891	1303	8
902	1306	8
909	1310	8
915	1315	9
916	1315	8
922	1320	9
923	1320	8
929	1325	8
934	1330	8
939	23	9
944	1337	8
950	356	8
956	8	10
962	1264	9
968	7	8
973	1360	8
867	1285	8
874	1289	8
879	1294	9
885	1299	9
892	1304	9
910	1311	9
917	1316	9
918	1316	8
924	1321	9
930	1326	8
935	1331	9
940	524	9
945	1338	9
946	1338	8
951	101	28
952	101	8
957	11	6
963	1341	9
969	6	6
974	1361	8
\.


--
-- Name: person_degree_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('person_degree_link_id_seq', 975, true);


--
-- Name: person_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('person_seq', 1362, true);


--
-- Data for Name: pi_protocol_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY pi_protocol_link (id, protocolid, personid) FROM stdin;
10	5	1272
12	1	143
16	8	693
17	9	392
26	11	392
27	11	7
28	10	3
41	3	167
42	3	1004
\.


--
-- Name: pi_protocol_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('pi_protocol_link_id_seq', 42, true);


--
-- Data for Name: pi_publication_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY pi_publication_link (id, publicationid, personid) FROM stdin;
1	413	20
2	1795	1354
3	1802	1263
4	1798	1059
5	461	1003
6	1818	1288
\.


--
-- Name: pi_publication_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('pi_publication_link_id_seq', 6, true);


--
-- Data for Name: program; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY program (id, title, abbreviation, description) FROM stdin;
1	Consortium for Molecular and Cellular Characterization of Screen-Detected Lesions	MCL	<p><span style="color: #777777; font-family: Roboto, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 18px; background-color: #fafafa;">Consortium for Molecular and Cellular Characterization of Screen-Detected Lesions</span></p>
2	Early Detection Research Network	EDRN	
\.


--
-- Name: program_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('program_seq', 3, false);


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('project_id_seq', 1, false);


--
-- Name: project_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('project_seq', 3, true);


--
-- Data for Name: protocol; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY protocol (id, title, description, organs, pis, start_date, site_contact, irb_approval, irb_approval_num, irb_contact, hum_sub_train, abstract, shortname, irb_contact_email, site_contact_email, cis, fundedsites, publications, data_custodians, programs, aims, end_date) FROM stdin;
5	￼Differential gene expression in lung adenocarcinoma	\N	3	1272:Yafang Li	2017-02-15 00:00:00		Yes			Not Required		￼Differential gene expression in lung adenocarcinoma				5	\N	\N	\N	\N	\N
1	A Methylation Panel for Bladder Cancer	Participate in a prevalidation study for methylation based detection of bladder cancer. In addition, a panel of three markers identified will be evaluated for their ability to a) identify bladder cancer patients from those with benign urologic disease; b) identify patients with superficial (papillary) cancers from those with high grade invasive cancers.	8	4:Bill Clinton	2016-08-01 00:00:00	3	Yes	hg77677	4	Unknown	blah blah	None	fake@fake.com	fake@fake.com	317:Akemi Miyamoto	8			\N	\N	\N
8	Lung Imaging Study	\N		693:Wilbur Franklin	2017-02-28 00:00:00		Yes			Yes		Lung Imaging Study				3			1	\N	\N
9	RNA sequencing of FFPE Samples of screen-detected or incidental Lung Tumors	\N	3	392:Avrum Spira	2017-07-10 00:00:00		Yes			Unknown		FFPE Lung Tumor Sequencing				17			1	\N	\N
11	MCL Supplement: A Pre-Cancer Atlas (PCA) for Breast, Lung, Pancreas, and Prostate 	\N	15	7:Christopher Amos	2018-01-02 00:00:00		Unknown				One of the critical barriers to developing new approaches for cancer detection and prevention is the lack of understanding of the key molecular and cellular changes that cause cancer initiation and progression. Unlike the extensive work that has been done profiling advanced stage tumors, few studies have comprehensively profiled the molecular alterations found in precancerous tissues. Premalignant lesions are currently characterized by histologic changes that precede the development of invasive carcinoma1,2.These lesions can often be identified in regions surrounding an invasive tumor or in biopsies taken from patients undergoing diagnostic evaluation for suspicion of cancer. Currently, limited metrics exist to identify lesions that will likely progress to carcinoma and require intervention from those that will naturally regress or remain stable 3,4. Characterization of the molecular alterations in premalignant lesions and the corresponding changes in the microenvironment would hasten the development of biomarkers for early detection and risk stratification as well as suggest preventive interventions to reverse or delay the development of cancer.\r\nOur pilot study will establish the feasibility of transcriptomic, genomic and immune profiling of FFPE premalignant lesions from multiple organ sites, collected and profiled with uniform SOPs across multiple institutions within the MCL consortium. We will characterize the molecular alterations in precancerous lesions and the corresponding microenvironment in four major organ sites, in order to uncover the molecular and cellular determinants of premalignancy, and establish standardized sequencing and immunohistochemistry protocols on FFPE precancerous tissue. We will also evaluate the technical feasibility of single nuclei sequencing of small FFPE pre-cancer lesions. Successful completion of the proposed pilot study will set the stage for expansion and development of a comprehensive Pre-Cancer Atlas (PCA) as part of the NCI’s moonshot \r\n	PCA				20			1	Aim 1: Collect premalignant lesions (PML) and their associated microenvironment via LCM from FFPE tissue across four organ sites (breast, lung, pancreas & prostate).  \r\n\r\nAim 2: Perform bulk RNA and DNA seq on premalignant FFPE samples (and flash frozen tissue where available) and compare the genomic/transcriptomic alterations within and across organ sites. \r\n\r\nAim 3: Determine the feasibility of performing single “nuclei” RNA-seq on FFPE PML tissues and compare with single “nuclei” RNA-seq from fresh frozen and single “cell” RNA-seq of fresh PML tissue\r\n\r\nAim 4: Characterize the immune microenvironment via a multiplex IHC panel and determine its relationship with the PML genomic/transcriptomic landscapes	2018-01-02 00:00:00
10	Test	\N	13	3:John Palin	2018-01-01 00:00:00	test	Unknown	123	test		abstract	Test	test@test.test	test@test.test	6:Heather Kincaid	5			2	aims2	2018-01-11 00:00:00
3	KSDB Protocol	\N	13	1004:Adi Gazdar	2011-01-01 00:00:00	Heather Kincaid	Yes	1113232323				KSDB	heather.kincaid@jpl.nasa.gov	heather.kincaid@jpl.nasa.gov	944:Adam Kibel	8	1790		1	test	2011-01-01 00:00:00
\.


--
-- Data for Name: protocol_custodian_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY protocol_custodian_link (id, personid, protocolid) FROM stdin;
1	78	1
2	3	1
3	16	1
6	1362	9
\.


--
-- Name: protocol_custodian_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('protocol_custodian_link_id_seq', 6, true);


--
-- Name: protocol_organ_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('protocol_organ_seq', 1, false);


--
-- Data for Name: protocol_program_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY protocol_program_link (id, protocolid, programid) FROM stdin;
1	8	1
2	9	1
9	11	1
10	10	2
17	3	1
\.


--
-- Name: protocol_program_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('protocol_program_link_id_seq', 17, true);


--
-- Data for Name: protocol_publication_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY protocol_publication_link (id, publicationid, protocolid) FROM stdin;
6	413	1
15	1790	3
\.


--
-- Name: protocol_publication_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('protocol_publication_link_id_seq', 15, true);


--
-- Name: protocol_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('protocol_seq', 11, true);


--
-- Data for Name: publication; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY publication (id, title, authors, journal, pubyear, pubmedid, projectid, programs) FROM stdin;
3	Increased levels of galactose-deficient IgG in the sera of HCV infected individuals with fibrosis and cirrhosis	Krakover J, Rodemich L, Comunale MA, Marrero JA, Long RE, Wang M, Block TM, Mehta AS, Philip R	Journal of Virology	2007	18045939	\N	\N
4	GP73, a resident Golgi glycoprotein, is a novel serum marker for Hepatocellular Carcinoma.	Steel LF, Romano PR, Marrero JA., Fimmel CJ, Comunale MA, Lok AS and Block TM, Di Bisceglie A	Journal of Hepatology	2005	16137783	\N	\N
5	SELDI-TOF-MS Profiling of Serum for Detection of the Progression of Chronic Hepatitis C to Hepatocellular Carcinoma	Schwegler EE, Marrero JA and Drake RR, Block TM, Adam BL, Cazares L, Steel LF, Semmes OJ, Johnson DA	Hepatology	2005	15726646	\N	\N
6	SELDI-TOF-MS Profiling of Serum for Detection of the Progression of Chronic Hepatitis C to Hepatocellular Carcinoma	Marrero JA and Drake RR, Schwegler EE, Block TM, Semmes OJ, Johnson DA, Cazares L, Adam BL, Steel LF	Hepatology	2005	15726646	\N	\N
8	GP73, a resident Golgi glycoprotein, is a novel serum marker for Hepatocellular Carcinoma.	Fimmel CJ, Di Bisceglie A, Comunale MA, Marrero JA., Romano PR, Steel LF, Lok AS and Block TM	Journal of Hepatology	2005	16137783	\N	\N
9	Prediction of PSA Recurrence in Men with 12 years Post-prostatectomy Follow-up.	Isharwal S, Makarov DV, Partin AW, BS., Miller MC, Marlow C, Veltri RW	Cancer Epidemiology, Biomarkers & Prevention	2008	N/A	\N	\N
10	Tracking humoral responses using self assembling protein microarrays	KS Anderson, Niroshan Ramachandran, Wagner R. Montor, Sahar Sibani, Yanhui Hu, Eugenie Hainsworth, Tanya Logvinenko and Joshua LaBaer, Mariam Eljanne, Martin G. Sanda, Jacob V. Raphael, Marcin Pacek, Jessica Wong	Proteomics	2008	21136799	\N	\N
11	Identification of a specific vimentin isoform that induces an antibody response in pancreatic cancer	Greenson JK, Hinderer R, Hong SH, Misek DE, Hanash SM, Logsdon DC, Giordano TJ, Wang H, Puravs E, Simeone DM, Brenner DE	Biomarker Insights	2007	18769604	\N	\N
12	The gene for the axonal cell adhesion molecule TAX-1 is amplified and aberrantly expressed in malignant gliomas	Zhu XX, Blaivas M, and Hanash SM, Israel MA, Song S, Rickman DS, Tyagi R, Kurnit DM, Misek DE, Ross DA, Kish PE, Bobek MP	Cancer Research	2001	11280781	\N	\N
14	Occurrence of autoantibodies to annexin I, 14-3-3, theta and LAMR1 in pre-diagnostic lung cancer sera	Brenner D, Barnett M, Pitteri SJ, Wang H, Qiu J, Goodman G, Pereira-Faca SR, Krasnoselsky, Thornquist M, Li L, Edelstein C, Feng Z, Hanash SM, Choi G, Omenn G, Randolph TW, AK	Journal of Clinical Oncology	2008	18724547	\N	\N
15	Standard Operating Procedures for Serum and Plasma Collection: Early Detection Research Network Consensus Statement	Grizzle W, Brenner D, Rom W, Krueger K, Godwin A, Wang W, Tuck M, Stass S, Chan D, Sorbara L, Chia D, Sanda M	J. Proteome Res.	2009	19072545	\N	\N
16	A Novel Decapeptide that Binds Avidly and Delivers Radioisotope to Colon Cancer Cells.	Kan T, Ito T, Olaru A, Hamilton JP, Abraham JM, Paun B, Cheng Y, Mori Y, Agarwal R, Yang J, Meltzer SJ., Jin Z, Sato F, David S	PLoS ONE	2007	17912343	\N	\N
18	Immobilization strategies for single-chain antibody microarrays.	Seurynck-Servoss, Rodland, Kagan, D., K.D., J., S.L., Pefaur, K., H., Apiyo, and Zangar, Engelmann, Miller, S., Baird, Srivastava, R.C., C.L., N.	Proteomics	2008	18452230	\N	\N
19	The NF-kB pathway regulates cytochrome P450 3A4 protein stability.	and Lu, R.C., Verma, Y., Zangar, Bollinger, N., S. Karin, N.J.	Mol. Pharmacol.	2008	18334598	\N	\N
20	Ras-driven transformation of human nestin-positive pancreatic epithelial cells	Der CJ, Groehler AL, Lee KM, Khazak V, Campbell PM, Ouellette MM, Kim HJ	Methods in Enzymology	2008	18374182	\N	\N
22	Sparse logistic regression with Lp penalty for biomarker identification.	Wang S, Sato F, Tan M, Liu Z, Tian G, Jiang F, Meltzer SJ	Statistical Applics. Genet. Molec. Biol	2007	17402921	\N	\N
23	CpG island methylator phenotype in ulcerative colitis-associated neoplasias	Issa J-PJ., Meltzer SJ, Konishi K, Wang S, Shen L	Gastroenterology	2007	17408633	\N	\N
25	Proteomic analysis of lung adenocarcinoma: Identification of a highly expressed set of proteins in tumors	Chen G, Gharib TG, Hanash SM and Beer DG, Giordano TJ, Shedden KA, Orringer MB, Taylor JM, Misek DE, Thomas DG, Kardia SL, Huang CC, Iannettoni MD	Clinical Cancer Research	2002	12114434	\N	\N
27	Inactivation of the MAL gene in breast cancer is a common event that predicts benefit from adjuvant chemotherapy	Horne HN, Murphy SK, Lee PS, Olson JA, Marks JR, Alonso MA	Molecular cancer research : MCR	2009	19208741	\N	\N
29	Do serum biomarkers really measure breast cancer?	Jesneck JL, Lo JY, Mukherjee S, Marks JR, Yurkovetsky Z, Lokshin AE, Clyde M	BMC cancer	2009	19476629	\N	\N
30	Methylation patterns in cell-free plasma DNA reflect removal of the primary tumor and drug treatment of breast cancer patients	Melnikov AA, Liggett TE, Marks JR, Levenson VV	International journal of cancer. Journal international du cancer	2011	20473856	\N	\N
31	Microarray analysis of early stage serous ovarian cancers shows profiles predictive of favorable outcome	Luo J, Dressman HK, Bernardini MQ, Secord AA, Boren T, Horne H, Murphy SK, Alonso MA, Clarke JP, Levine DA, Lancaster JM, Boyd J, Iversen ES, Barnett JC, Marks JR, Berchuck A	Clinical cancer research : an official journal of the American Association for Cancer Research	2009	19318476	\N	\N
32	Role of eotaxin-1 signaling in ovarian cancer	Szczepanski MJ, Marrangoni AM, Nolen BM, Szajnik ME, Lokshin AE, Levina V, Cheng P, Marks JR, Gorelik E	Clinical cancer research : an official journal of the American Association for Cancer Research	2009	19351767	\N	\N
34	Sonic hedgehog paracrine signaling regulates metastasis and lymphangiogenesis in pancreatic cancer	Hollingsworth MA, Bailey JM, Mohr AM	Oncogene	2009	19633682	\N	\N
35	Expression signatures of TP53 mutations in serous ovarian cancers	Sfakianos GP, Berchuck A, Marks JR, Murphy SK, Secord AA, Lee PS, Barnett JC, Iversen E, Baba T, Bernardini MQ	BMC cancer	2010	20504346	\N	\N
37	Emerging roles of MUC4 in cancer: a novel target for diagnosis and therapy	Batra SK, Singh AP, Chaturvedi P	Cancer Research	2007	17234748	\N	\N
38	Promoter Hypermethylation Profile of Kidney Cancer	Uzzo, E., Ibanez, J.S. and Cairns, I., R.G., P, T. Al-Saleem, R.G. Polascik, T. Babb, Greenberg, Dulaimi	Clinical Cancer Research	2004	15217927	\N	\N
39	The Genetics of Renal Oncocytosis; A Possible Model for Neoplastic Progression	Al-Saleem, T., E., Feder, R, P., J.R. and Uzzo, Cairns, M., Testa, Dulaimi	Cancer Genetics and Cytogenetics	2004	15193438	\N	\N
40	Detection of Bladder Cancer  in Urine by a Tumor Suppressor Gene Hypermethylation Panel	Dulaimi, Greenberg, T. and Cairns, Al-Saleem, Uzzo, E., R.G., R.E., P.	Clinical Cancer Research	2004	15041703	\N	\N
41	Promoter Hypermethylation of Tumor Suppressor Genes in Urine from Kidney Cancer Patients	I., Ibanez, R.E. and Cairns, Greenberg, Krassenstein, Uzzo, Dulaimi, T., Al-Saleem, R., Battagli, P., E., C.	Cancer Research	2003	14695183	\N	\N
43	Identification of Novel Target Genes by an Epigenetic Reactivation Screen of Kidney Cancer	T., P., Uzzo, Ibanez de Caceres, A.M., R.G. and Cairns, I.,Dulaimi, Hoffman, E., Al-Saleem	Cancer Research	2006	16707423	\N	\N
45	ProteinChips: the essential tools for proteomic biomarker discovery and future clinical diagnostics.	Clarke W, Chan DW	Clin Chem Lab Med	2005	16309362	\N	\N
46	Identification of biomarkers for breast cancer in nipple aspiration and ductal lavage fluid	Chan DW., Kuerer H, Zhao J, Khan SA, Lange J, Schilling E, Krishnamurthy S, Yu X, Sukumar S, Li J	Clinical Cancer Research	2005	16322290	\N	\N
47	Proteomic analysis of dunning prostate cancer cell lines with variable metastatic potential using SELDI-TOF	Rosenzweig J.M., van Rootselaar C.L., Dalrymple S., Chan D.W., Mangold L.A., Veltri R.W, Partin A.W., Gretzer M.B.	Prostate	2004	15264244	\N	\N
48	Improving risk classification of critical illness with biomarkers: a simulation study	Yealy DM, Cooke CR, Kerr K, Kahn JM and Pepe MS, Seymour CW, Wang Z, Angus DC, Rea TD	Journal of Critical Care	2013	23566734	\N	\N
50	Estimating improvement in prediction with matched case-control designs	Bansal A, Pepe MS	Lifetime Data Analysis	2013	23358916	\N	\N
51	Testing for improvement in prediction model performance	Pepe MS, Longton G, Wang Z, Kerr KF	Statistics in Medicine	2013	23296397	\N	\N
52	Estimating the ROC curve in biomarker studies that match controls to cases on covariates	Seymour C, Pepe MS, Fan J	Academic Radiology	2013	23601953	\N	\N
53	Logistic Regression Analysis with Standardized Markers	Huang Y, Pepe MS and Feng Z	Annals of Applied Statistics	2013	24204441	\N	\N
54	Divergent molecular mechanisms underlying the pleiotropic functions of macrophage inhibitory cytokine-1 in cancer	Mimeault M, Batra SK	Journal of cellular physiology	2010	20578239	\N	\N
56	Mucins in the pathogenesis of breast cancer: implications in diagnosis, prognosis and therapy	Jain M, Mukhopadhyay P, Lakshmanan I, Chakraborty S, Ponnusamy MP, Batra SK	Biochimica et biophysica acta	2011	21277939	\N	\N
58	Recent advances on the molecular mechanisms involved in the drug resistance of cancer cells and novel targeting therapies	Batra SK, Mimeault M, Hauke R	Clinical pharmacology and therapeutics	2008	17786164	\N	\N
59	Dynamics of the immune reaction to pancreatic cancer from inception to invasion	Tuveson DA, Clark CE, Mick R, Vonderheide RH, Hingorani SR, Combs C	Cancer research	2007	17909062	\N	\N
60	Lung cancer in women: role of estrogens	Ganti AK, Chakraborty S, Batra SK, Marr A	Expert review of respiratory medicine	2010	20658912	\N	\N
61	MUC4 mucin-induced epithelial to mesenchymal transition: a novel mechanism for metastasis of human ovarian cancer cells	Batra SK, Dey P, Ponnusamy MP, Chakraborty S, Jain M, Lakshmanan I, Das S	Oncogene	2010	20697346	\N	\N
62	Expression of intestinal MUC17 membrane-bound mucin in inflammatory and neoplastic diseases of the colon	Niehans G, Senapati S, Batra SK, Chakraborty S, Sharma P, Das S, Kaur S, Ho SB	Journal of clinical pathology	2010	20702471	\N	\N
63	DNA methylation and histone H3-K9 modifications contribute to MUC17 expression	Higashi M, Yamada N, Batra SK, Yonezawa S, Houjou I, Yokoyama S, Goto M, Kitamoto S	Glycobiology	2011	20926598	\N	\N
65	Distribution-free ROC analysis using binary regression techniques	Alonzo TA, Pepe MS	Biostatistics	2002	12933607	\N	\N
66	Presence of simian virus 40 DNA sequences in human lymphomas	Scheuemann R, Milchgrub S, Kroft S, Gazdar A, Reddy J, Feng Z, Xu Y, Shivapukar N, Harada K, KcKenna R	Lancet	2002	11897287	\N	\N
67	Combining several screening tests: optimality of the risk score	Pepe MS, McIntosh MS	Biometrics	2002	12230001	\N	\N
68	Instabilotyping: Comprehensive Indentification of Frameshift Mutations Caused by Coding Region Microsatellite Instability	Rashid A, Yin J, Langenberg P, Leggett BA, Simms L, Meltzer SJ, Mori Y, Young J, Stine OC, Kuehl PM	Cancer Research	2001	11507051	\N	\N
69	Nanotechnology in Early Cancer Detection. (NIST Workshop Report)	Srinivas P, Barker PE, Srivastava S	Laboratory Investigation	2002	12004006	\N	\N
70	Comparison of Statistical Methods for Classification of Ovarian Cancer Using a Proteomics Dataset	Wu B, Fishman DA, Zhao H, Abbott T, Mor G, Ward D, Stone K, McMurray W, Williams K	Cancer Research	2006	N/A	\N	\N
71	Boosted Decision Tree Analysis of SELDI Mass Spectral Serum Profiles Discriminates Prostate Cancer from Non-Cancer Patients	Yasui Y, Ward M, Qu Y, Semmes J, Wright G, Schellhammer P, Feng Z, Adam B, Cazares L	Clinical Chemistry	2002	12324514	\N	\N
73	Serum HE4 levels are less frequently elevated than CA125 in women with benign gynecologic disorders	Miller MC, Lu KH, Steinhoff MM, Lambert-Messerlian G, Moore RG, Bast RC Jr., Skates SJ	Am J Obstet Gynecol	2012	22284961	\N	\N
74	Differential diagnosis of a pelvic mass: improved algorithms and novel biomarkers.	Lokshin A, Bast RC Jr, Moore RG., Skates S	Int J Gynecol Cancer	2012	22543921	\N	\N
75	The new face of ovarian cancer modeling: better prospects for detection and treatment	Karst AM, Drapkin R	F1000 medicine reports	2011	22076125	\N	\N
76	Rethinking ovarian cancer: recommendations for improving outcomes	Kaye SB, Lord CJ, Lengyel E, Coukos G, Bowtell DD, Friedlander M, Nephew KP, McNeish IA, Stronach EA, Menon U, Vaughan S, Drapkin R, Oza AM, Berchuck A, Coward JI, Etemadmoghadam D, Brenton JD, Mills GB, Sood AK, Crum CC, Berek JS, Gabra H, Levine DA, Balkwill FR, Bast RC, Walczak H	Nature reviews. Cancer	2011	21941283	\N	\N
77	Ex vivo culture of primary human fallopian tube epithelial cells	Levanon K, Fotheringham S, Drapkin R	Journal of visualized experiments : JoVE	2011	21610668	\N	\N
78	Nucleic acid programmable protein array a just-in-time multiplexed protein expression and purification platform	LaBaer J, Qiu J	Methods in enzymology	2011	21943897	\N	\N
79	Serum antibodies to the HPV16 proteome as biomarkers for head and neck cancer	D, Wong J, Anderson KS	British Journal of Cancer	2011	21654689	\N	\N
80	Multiplexed detection of antibodies using programmable bead arrays	Anderson KS	Methods in molecular biology (Clifton, N.J.)	2011	21370069	\N	\N
81	Immunoprofiling using NAPPA protein microarrays	LaBaer J, Sibani S	Methods in Molecular Biology (Clifton, N.J.)	2011	21370064	\N	\N
82	Quantitative GSTP1 hypermethylation in bodily fluids of patients with prostate cancer	Lopes,C, Silva,C, Oliveira,J, Sidransky,D, Usadel,H, Henrique,R, Jeronimo,C	Urology	2002	12475696	\N	\N
83	MUC4 as a diagnostic marker in cancer	Jain M, Batra SK, Chakraborty S, Sasson AR	Expert Opinion on Medical Diagnostics	2008	N/A	\N	\N
84	GP73, a resident Golgi glycoprotein, is a novel serum marker for Hepatocellular Carcinoma.	Marrero JA., Di Bisceglie A, Fimmel CJ, Comunale MA, Lok AS and Block TM, Steel LF, Romano PR	Journal of Hepatology	2005	16137783	\N	\N
124	MUC4, a multifunctional transmembrane glycoprotein, induces oncogenic transformation of NIH3T3 mouse fibroblast cells	Bafna S, Meza JL, Singh AP, Eudy JD, Batra SK, Moniaux N	Cancer Research	2008	19010895	\N	\N
85	Use of targeted glycoproteomics to identify serum glycoproteins that correlate with liver cancer in woodchucks and people	Comunale MA, Romano PR, Lowman M, Block TM, MattuT and Mehta AS, London WT, Dwek RA, Steel LF, Tennant BC, Evans AA, Fimmel C	Proceedings of the National Academy of Sciences	2005	15642945	\N	\N
86	RAGE in Lung Tumors.	Franklin, W. A.	American Journal of Respiratory and Critical Care Medicine	2007	17200506	\N	\N
87	Patient response to the disclosure of BRCA mutation tests in hereditary breast-ovarian cancer families	Karatoprakli P, Gong G, Lynch HT, Metcalfe K, Trowonou A, Lynch JF, Narod SA, Snyder C	Cancer Genetics and Cytogenetics	2006	16527602	\N	\N
88	Gastric cancer: New genetic developments	Huntsman D, Grady W, Suriano G, Lynch HT	Journal of Surgical Oncology	2005	15895459	\N	\N
89	American founder mutation for Lynch syndrome/ Prevalence estimates and implications	Fodde R, Lynch JF, Coronel S, Okimoto R, Clark MB, Hampel H, de la Chapelle A, Trowonou A, Lynch HT, Wagner A, Gong G, Hayanatzki GR, Fu Y-X	Cancer	2006	16353207	\N	\N
90	Phenotypic and genotypic heterogeneity in the Lynch syndrome: diagnostic, surveillance and management implications	Lynch PM, Lynch J, Shaw TG, Lynch HT, Fodde R, de la Chapelle A, Gong G, Boland CR	European Journal of Human Genetics	2006	16479259	\N	\N
91	Tumor infiltrating lymphocytes (TILs): Lessons learned in 30 years of study	Drescher KM, Lynch HT	Clinical and Applied Immunology Reviews	2005	N/A	\N	\N
92	Proteomic approaches for cancer biomarker discovery in plasma	Hanash S, Pitteri S	Expert Review Proteomics	2007	17941811	\N	\N
93	Phenotypic heterogeneity in multiple myeloma families	Huiart L, Hogg D, Quinn-Laquer B, Sanger W, Wiernik PH, Tarantolo S, Sobol H, Lynch HT, Weisenburger D, Bergsagel KI, Watson P, Olopade OI	Journal of Clinical Oncology	2005	15681516	\N	\N
94	BRCA1 and pancreatic cancer: pedigree findings and their casual relationships	Brand RE, Narod SA, Lynch JF, Silberstein J, Deters CA, Snyder CL, Villeneuve P, Martin H, Lynch HT	Cancer Genetics and Cytogenetics	2005	15796958	\N	\N
95	Innovative proteomic approaches for cancer biomarker discovery	Faca V, Hanash S, Krasnoselsky A	Biotechniques	2007	17907570	\N	\N
97	Adjusting for covariates in studies of diagnostic, screening or prognostic markers: an old concept in a new setting	Pepe MS, Gu W	American Journal of Epidemiology	2008	18477651	\N	\N
100	Mining the plasma proteome for cancer biomarkers	Pitteri SJ, Faca VM, Hanash SM	Nature	2008	18385731	\N	\N
101	MESOMARKTM: A Potential Test for Malignant Pleural Mesothelioma	Allard WJ, Geschwindt RD, Hellstrom I, Pass HI, Glover CL, Verch T, Beyer HL, Sardesai NY., Hellstrom KE,Miller MC, Tran L	Clinical Chemistry	2007	17289801	\N	\N
102	Spermine oxidation by Helicobacter pylori results in apoptosis and DNA damage: Implications for gastric carcinogenesis.	Chatuvedi R, Moss SF, Hacker A, Xu H, Wang Y, Bussiere FI, Yao MD, Rhee JG, Asim M, Potosky D, Meltzer SJ, Casero RA, Cheng Y, Wilson KT, Kim SS	Cancer Research	2004	15574757	\N	\N
103	HNPCC-associated small bowel cancer: Clinical and molecular characteristics	Schmiegel W., Ruschoff J, Moeslein G, Kruger S, Engel C, Schackert HK, Knebel-Doeberitz MV, Kunstmann E, Vogelsang H, Mangold E, Hahn SA, Meltzer SJ, Pagenstecher C, Schulmann K, Brasch FE, Tympner C, Vogel T, Knaebel HP	Gastroenterology	2005	15765394	\N	\N
104	Development of novel esophageal cancer-specific gene therapy vectors based on promoter isolation in esophageal cancer cells.	et al, Sato F	Gene Therapy	2005	N/A	\N	\N
105	Spectral Markers in Preneoplastic Intestinal Mucosa: An Accurate Predictor of Tumor Risk in the MIN Mouse	Kunte DP, Kim YL, Goldberg MJ, Wali RK, Liu Y, Roy HK, Koetsier J, Backman V.	Cancer Epidemiology, Biomarkers & Prevention	2005	16030095	\N	\N
106	Aberrant promoter methylation of multiple genes during multistep pathogenesis of colorectal cancers	Suzuki M, Gazdar AF, Meltzer SJ, Feng Z, Miyajima K, Augustus M, Shivapurkar N, Yin J, Reddy J, Zheng Y, Takahashi T, Shigematsu H	International Journal of Cancer	2005	16108009	\N	\N
108	Molecular phenotype of inflammatory bowel disease-associated neoplasms with microsatellite instability.	Harpaz N, Sterian A, Schmiegel W, Xu Y, Abraham JM, Wang S, Sato F, Mori Y, Deacu E, Schulmann K, Yin J, Meltzer SJ, Croog V, Olaru A	Gastroenterology	2005	16012936	\N	\N
109	Prediction of survival in esophageal cancer using artificial neural networks	Mori Y, Watanabe G, Shibata D, Imamura M, Stass SA, Selaru FM Maeda M, Meltzer SJ, Shimada Y, Sato F	Cancer	2005	15751017	\N	\N
110	Aberrrant methylation of Reprimo in human malignancies.	Echebiri C, Meltzer SJ, Shivapurkar N, Takahashi T, Wistuba II, Nomura M, Shigematsu H, Suzuki M, Wu CW, Augustus M, Stastny V, Gazdar AF.	International Journal of Cancer	2005	15700311	\N	\N
112	Surrogate Markers of efficacy for treatment of viral hepatitis	Block TM and London WT	Biotechnology Healthcare	2004	15642945	\N	\N
113	Molecular viral oncology of hepatocellular carcinoma	Mehta AS, Block TM, Fimmel CJ and Jordan R	Oncogene	2003	12910247	\N	\N
114	Aberrant promoter methylation and silencing of the RASSF1A gene in pediatric tumors and cell lines	Toyooka S, Toyooka KO, Mastrangelo D, Gazdar AF, Timmons CF, Tomlinson GE, Maitra A, Harada K, Minna JD, Hay RJ, Maryuama R	Oncogene	2002	12082624	\N	\N
115	SV40 and human tumours: myth, association or causality?	M., Butel, AF, JS, Gazdar, Carbone	Nat Rev Cancer	2002	12459734	\N	\N
116	Aberrant methylation of the CDH13 (H-cadherin) promoter region in colorectal cancers and adenomas	Miyajima K, Makarla P, Sathyanarayana UG, Yin J, Meltzer SJ and Gazdar AF, Harada K, Toyooka S, Sato F, Toyooka KO, Shivapurkar N	Cancer Research	2002	12067979	\N	\N
117	Aberrant methylation of the HPP1 gene in ulcerative colitis-associated colorectal carcinoma	Leggett B, Hytiroglou P, Selaru FM, Harpaz N, Gazdar AF, Deacu E, Xu Y, Toyooka S, Abraham JM, Olaru A, Yin J, Mori Y, Wang S, Meltzer SJ, Shibata D, Kimos MC, Young J, Sato F	Cancer Research	2002	12460892	\N	\N
118	Epigenetic down-regulation of death-associated protein kinase in lung cancers	Toyooka KO, Toyota, Miyajima K, Reddy JL, Tockman MS, Shivapurkar N and Gazdar AF, Sathyanarayana UG, Lam S, Toyooka S, M, Padar A	Clinical Cancer Research	2003	12912953	\N	\N
119	Differential expression of FEZ1/LZTS1 gene in lung cancer and their cell cultures	Wistuba II, Fukuyama Y, Minna JD and Gazdar AF, Tockman MS, Toyooka S	Clinical Cancer Research	2002	12114433	\N	\N
120	RET is a potential tumor suppressor gene in colorectal cancer	Wang J, Luo Y, Kanngurn S, Tsuchiya KD, Welcsh P, Fausel R, Dzieciatkowski S, Grady WM, Il Park D	Oncogene	2013	22751117	\N	\N
121	Assessing the value of risk predictions using risk stratification tables	Janes H, Pepe MS, Gu J	Annals of Internal Medicine	2008	19017593	\N	\N
122	Hedgehog inhibition prolongs survival in a genetically engineered mouse model of pancreatic cancer	Bardeesy N, Ouellette MM, Maitra A, Habbe N, Fendrich V, Dhara S, Alvarez H, Karikari C, Bisht S, Yu W, Feldmann G, Mullendore M, Beaty R	Gut	2008	18515410	\N	\N
128	Concise review: recent advances on the significance of stem cells in tissue regeneration and cancer therapies	Batra SK, Mimeault M	Stem Cells	2006	16794264	\N	\N
131	SELDI-TOF MS Whole Serum Proteomic Profiling with IMAC Surface Does Not Reliably Detect Prostate Cancer	Dahlgren J, Sokoll L, Malik G, Grizzle WE, Zhu L, Kagan J, Partin A, Randolph T, Thornquist M, McLerran D, Cazares LH, Feng Z, Srivastava S, Wright GL, Lin D, Semmes OJ, Bigbee WL, Oelschlager D, Troyer D, Zhang Z, Chan DW, Thompson IM, Diaz J	Clinical Chemistry	2008	18024530	\N	\N
132	Analytical Validation of Serum Proteomic Profiling for Diagnosis of Prostate Cancer; Sources of Sample Bias	Chan DW, Cazares LH, Grizzle WE, Semmes OJ, Zhu L, Feng Z, Thompson IM, Malik G, Bigbee WL, Rosenzweig N, Malehorn DE, Izbicka E, Randolph T, Oelschlager D, Diaz J, McLerran D, Srivastava S, Kagan J, Zhang Z, Yasui Y, Thornquist M, Banez LL, Troyer D, Partin A	Clinical Chemistry	2008	17981926	\N	\N
133	Data reduction using discrete wavelet transform in discriminant analysis of very high dimension data	Yasui Y, Thompson ML, Schellhammer P, Davis J, Clements M, Qu Y, Feng Z, Potter J, Adam B, Thornquist M, Cazares L, Wright G	Biometrics	2003	12762451	\N	\N
134	Boosted Decision Tree Analysis of SELDI Mass Spectral Serum Profiles Discriminates Prostate Cancer from Non-Cancer Patients	Adam B, Cazares L, Feng Z, Schellhammer P, Qu Y, Wright G, Semmes J, Yasui Y, Ward M	Biometrics	2002	12324514	\N	\N
135	Inactivation of p16, RUNX3, and HPP1 occurs early in Barrett’s-associated neoplastic progression and predicts progression risk	Beer D, Xu Y, Olaru A, Wang S, Yin J, Schmiegel W, Berki A, Feng Z, Mori Y, Abraham J, Sato F, Meltzer S, Deacu E, Greenwald B, Kan T, Sterian A, Krasna M, Schulmann K	Oncogene	2005	15824739	\N	\N
136	Inactivation of p16, RUNX3, and HPP1 occurs early in Barrett’s-associated neoplastic progression and predicts progression risk	Schulmann K, Krasna M, Yin J, Sterian A, Deacu E, Xu Y, Greenwald B, Feng Z, Sato F, Abraham J, Berki A, Kan T, Schmiegel W, Mori Y, Meltzer S, Olaru A, Wang S, Beer D	Oncogene	2005	15824739	\N	\N
139	Multiple effects of TRAIL in human carcinoma cells: Induction of apoptosis, senescence, proliferation, and cytokine production.	Gorelik E, Demarco R, Levina V, Lokshin AE., Marrangoni AM	Exp Cell Res	2008	18313665	\N	\N
141	Novel fucosylated biomarkers for the early detection of hepatocellular carcinoma	DiBisceglie A, Junaidi O, Mehta AS, Block TM, Long RE, Comunale MA, Wang M, Marrero J	Cancer Epidemiology, Biomarkers & Prevention	2009	19454616	\N	\N
142	Sonic Hedgehog promotes desmoplasia in pancreatic cancer	Eggers, Ouellette, PK, MM, Hamada, JP, MA, Bailey, BJ, Singh, Caffery, Hollingsworth, T, JM, Swanson	Clinical Cancer Research	2008	18829478	\N	\N
143	Identification and development of fucosylated glycoproteins as biomarkers of primary hepatocellular carcinoma	Long RE, Krakover J, Hafner J, Rodemich L, Kopenhaver B, Wang M, Mehta AS, Junaidi O, DiBisceglie AM, Block TM, Comunale MA	Journal of Proteome Research	2009	19099421	\N	\N
145	Fucosylated biomarkers for liver fibrosis, cirrhosis and cancer	Block TM, Mehta AS	Glycobiology	2009	N/A	\N	\N
147	Origins and prevalence of the American Founder Mutation of MSH2	Baze ME, Lynch JF, Sun S, Clendenning M, Deacon M, Schunemann V, Walsh K, Thibodeau SN, Fix D, Lynch hT, de la Chapelle A, Gong G, Comeras I, Thomas BC, Hampel H, Liyanarachchi S	Cancer Research	2008	18381419	\N	\N
148	Common breast cancer-predisposition alleles are associated with breast cancer risk in BRCA1 and BRCA2 carriers	Simard J, Neuhausen SL, Healey S, Beesley J, Hofmann W, Lynch HT, Spurdle AB, Engel C, Sinilnikova OM, Deissler H, Niederacher D, Chen X, Antoniou AC, Nevanlinna H, Arnold N, Sutter C, Schmutzler RK, Kathleen Cunningham Consortium for Research into Familial Breast Cancer, Rebbeck TR, Caldes T, and 62 more authors, Wagner T, Versmold B, Meindl A, Kämpjärvi K, Pooley DA	American Journal of Human Genetics	2008	18355772	\N	\N
149	International variation in rates of uptake of preventive options in BRCA1 and BRCA2 mutation carriers	KA, Hereditary Breast Cancer Clinical Study Group, Domchek S, Narod SA, Manoukian S, Friedman E, Foulkes WD, Tung N, Ainsworth P, Rosen B, Gronwald J, Wagner T, Lynch H, Couch F, Birenbaum-Carmeli D, Klijn J, Metcalfe KA, Kim-Sing C, Sun P, Moller P, Lubinski J, Ghadirian P	International Journal of Cancer	2008	18196574	\N	\N
150	Germline RAP80 mutations and susceptibility to breast cancer	Robidoux A, Akbari MR, Ghadirian P, Sun Y, Narod SA, Lynch H, Zandivakili I, Royer R, Foumani M	Breast Journal	2009	18306035	\N	\N
151	The type III TGF-beta receptor suppresses breast cancer progression	Blobe GC, Lee JD, How T, Dong M, Moeller BJ, Hempel N, Marks JR, Kelly P, Kirkbride KC, Gordon KJ	Journal of Clinical Investigation	2007	17160136	\N	\N
153	Data standards for proteomics: mitochondrial two-dimensional polyacrylamide gel electrophoresis data as a model system	Sriram RD, Gilliland GL, Vasquez GB, Lubell J, Srivastava S, Petricoin E, Barker PE, Verma M, Ravichandran V	Mitochondrion	2004	16120364	\N	\N
154	Cell and DNA standards for medical genetics laboratories	Barker PE	Journal of the Association of Genetic Technologists	2002	N/A	\N	\N
155	Nanotechnology: emerging developments and early detection of cancer	Barker PE, Looney JP, Srivastava S, Zullo S	Disease Markers	2002	12590168	\N	\N
156	Cancer biomarker validation: standards and process: roles for the National Institute of Standards and Technology (NIST)	Barker PE	Annals of the New York Academy of Sciences	2003	12724219	\N	\N
158	Semiconductor nanocrystal probes for human metaphase chromosomes	Xiao Y, Barker PE	Nucleic Acids Research	2004	14960711	\N	\N
159	Semiconductor nanocrystal probes for human chromosomes and DNA	Xiao Y, Barker PE	Minerva Biotecnologica	2004	14960711	\N	\N
160	Telomerase activity measurement in magnetically-captured epithelial cells: comparison of slab-gel and capillary electrophoresis	Highsmith WE, Xu J, Hess JL, Atha DH	Electrophoresis	2004	15213984	\N	\N
161	The next thing in prognostic molecular markers: microRNA signatures of cancer	Grady WM, Tewari M	Gut	2010	20551450	\N	\N
163	Polymorphisms of p21 and p27 jointly contribute to an earlier age at diagnosis of pancreatic cancer.	Evans DB, Frazier ML, Abbruzzese JL, Chen J, Sen S, Amos CI, Killary AM	Cancer Letters	2008	18694622	\N	\N
165	MicroRNAs in Plasma of Pancreatic Ductal Adenocarcinoma Patients as Novel Blood Based Biomarkers of Disease.	Abbruzzesse JL, Wang J, LeBlanc A, Chen J, Li D, Frazier ML, Chang P, Killary AM, Sen S	Cancer Prev Res	2009	19723895	\N	\N
166	Genetic variants of p21 and p27 and pancreatic cancer risk in non-Hispanic whites: a case-control study.	Merriman KW, Killary AM, Amos CI, Frazier ML, Chen J, Sen S, Wei Q	Pancreas	2010	19910837	\N	\N
167	A migration signature and plasma biomarker panel for pancreatic adenocarcinoma	Carter J, Lott ST, Chen N, Sen S, Grizzle WE, Chen J, Frazier ML, Balasenthil S, Killary AM	Cancer Prev Res (Phila)	2011	21071578	\N	\N
168	Susceptibility Locus for Lung Cancer at 15q25.1 is not Associated with Risk of Pancreatic Cancer	Chen J, Frazier M, Wu X, Sen S, Killary AM, Amos C, Pande M	Pancreas	2011	21697704	\N	\N
170	Systematic biomarker pattern in different chronic obstructive pulmonary disease phenotypes independent of smoking status	Lokshin AE, Sciurba FC, Patel SA, Weissfeld JL, Choi AM, Kaminski N, Zhang Y	Proceedings of the American Thoracic Society	2006	N/A	\N	\N
171	Intratumoral cytokines/chemokines/growth factors and tumor infiltrating dendritic cells: friends or enemies?	Chatta G, Yurkovetsky ZR, Zhong H, Lokshin A, Shurin MR, Shurin GV, Gutkin DW, Ferris RL, Han B	Cancer Metastasis Reviews	2006	17029028	\N	\N
173	Adenosine-mediated inhibition of the cytotoxic activity and cytokine production by activated natural killer cells	Gorelik E, Raskovalova T, Huang X, Jackson EK, Lokshin A, Zacharia LC	Cancer Research	2006	16885379	\N	\N
175	Autoantibody profiles reveal ubiquilin 1 as a humoral immune response target in lung adenocarcinoma.	Wang X, Yu J, El-Hefnawy T, Fielhauer J, Lin MY, Giordano TJ, Varambally S, Wang R, Thomas DG, Vishnu P, Beer DG, Chang AC, Chen G, Ghosh D, Chinnaiyan AM., Bigbee WL, Wang Z, Orringer MB, Giacherio D	Cancer Research	2007	17409457	\N	\N
176	Comprehensive assessment of TMPRSS2 and ETS family gene aberrations in clinically localized prostate cancer.	Chinnaiyan AM, Mehra R, Ghosh D, Wei JT, Tomlins SA, Shah RB., Rubin Ma, Shen R, Nadeem O, Wang L, Pienta KJ	Mod Pathol	2007	17334343	\N	\N
177	Immunotheranostics: breaking tolerance in immunotherapy using tumor autoantigens identified on protein microarrays	Tainsky MA, Draghici S, Chatterjee M	Curr Opin Drug Discov Devel.	2006	16729735	\N	\N
178	Molecular markers of prostate cancer.	Chinnaiyan AM., Tomlins SA, Bradford TJ, Wang X	Urol Oncol	2006	17138135	\N	\N
179	Integrative molecular concept modeling of prostate cancer progression.	Kalyana-Sundaram S, Danasekaran SM, Chinnaiyan AM., Tomlins SA, Shah RB, Rhodes DR, Rubin MA, Mehra R, Cao X, Wang L, Wei JT, Pienta KJ	Nat Genet	2007	17173048	\N	\N
180	The Early Detection Research Network&#39;s Specimen Reference Sets: Paving the Way for Rapid Evaluation of Potential Biomarkers	Ann Rinaudo J, Zheng Y, Patriotis C, Srivastava S, Sorbara L, Pepe M, Krueger K, Feng Z, Dahlgren J, Huang Y, Thornquist M, Thompson I, Kagan J	Clinical Chemistry	2013	23193062	\N	\N
181	When does combining markers improve classification performance and what are implications for practice?	Pepe MS, Bansal A	Statistics in Medicine	2013	23348801	\N	\N
182	Biases introduced by choosing controls to match risk factors of cases in biomarker research	Pepe MS, Huang Y, Seymour CW, Feng Z, Fan J, Li C	Clinical Chemistry	2012	22730452	\N	\N
184	Evaluating the predictive value of biomarkers with stratified case-cohort design	Liu D, Cai T, Zheng Y	Biometrics	2012	23173848	\N	\N
186	Bootstrap inference for network construction with an application to a breast cancer microarray study	Peng J and Wang P, Hsu L, Li S	Annals of Applied Statistics	2013	24563684	\N	\N
187	Evaluating incremental values from new predictors with net reclassification improvement in survival analysis	Zheng Y, Brown M, Parast L, Cai T	Lifetime data analysis	2012	23254468	\N	\N
188	Pooling of case specimens to create standard serum sets for screening cancer biomarkers	Skates SJ, Horick NK, Moy JM, Seiden MV, and Cramer DW, Minihan AM, Sluss P, Marks JR	Cancer Epidemiology, Biomarkers & Prevention	2007	17301268	\N	\N
189	Initial analyses of colon cancer-specific antigen (CCSA)-3 and CCSA-4 as colorectal cancer-associated serum markers.	Cannon GW, Weissfeld JL, Chan DW, Getzenberg RH., Schoen RE, Sokoll LJ, Leman ES	Cancer Research	2007	17575123	\N	\N
190	MET gene amplification or EGFR mutation activate MET in lung cancers untreated with EGFR tyrosine kinase inhibitors	Otani H, Varella-Garcia M, Ouchida M, Takigawa N, Kiura K, Shimizu K, Lockwood WW, Gazdar AF, Fujii T, Soh J, Toyooka S, Yamamoto H, Peyton M, Minna JD, Kubo T, Jida M, Valencia I, Lam WL, Date H	International Journal of Cancer	2009	N/A	\N	\N
191	Prostasin, a potential serum marker for ovarian cancer:  identifcation through microarray technology	Skates S, Yiu GK, SC, Berkowitz RS, Cramer DW, Muto MG, Chao J, Kwong-kwok W, Mok	Journal of the National Cancer Institute	2001	11584061	\N	\N
194	Aberrantly methylated CDKN2A, MGMT, and MLH1 in colon polyps and in fecal DNA from patients with colorectal polyps	Gorham J, Markowitz SD, Schultenover S, Gautam S, Petko Z, Shuber A, Ghiassi M, Washington MK, Grady WM, Smalley W	Clinical cancer research : an official journal of the American Association for Cancer Research	2005	15709190	\N	\N
195	Genomic instability and colorectal cancer	Grady WM, Markowitz S	Current opinion in gastroenterology	2000	17024019	\N	\N
197	DNA alkylation and DNA methylation: cooperating mechanisms driving the formation of colorectal adenomas and adenocarcinomas?	Grady WM, Ulrich CM	Gut	2007	17339242	\N	\N
200	Evidence for the role of aberrant DNA methylation in the pathogenesis of Lynch syndrome adenomas	Watson P, Grady WM, Dzieciatkowski S, Kim YH, Lin L, Kay Washington M, Kaz A, Lynch H	International journal of cancer. Journal international du cancer	2007	17278092	\N	\N
201	Making the case for DCC and UNC5C as tumor-suppressor genes in the colon	Grady WM	Gastroenterology	2007	18054576	\N	\N
202	CIMP and colon cancer gets more complicated	Grady WM	Gut	2007	17938428	\N	\N
203	Limited PSA testing in indigent men in South Texas: An appropriate care of missing a prevention opportunity	Du F, Thomspon IM, Liang Y, Turner BJ	Cancer Epidemiology, Biomarkers & Prevention	2012	22822113	\N	\N
204	Global patterns of prostate cancer incidence, aggressiveness and mortality in men of African Descent	Gueye SM, Rebbeck TR, Bunker CH, Hu JJ, Ingles SA, Leach RJ, Patrick AL, Cheng I, Witte J, Eeles R, Kidd LR, Okobia MN, Henderson BE, Park JY, Fernandez P, Chang BL, Heyns CF, Neslund-Dudas C, Rybicki BA, Phelan CM, Zeigler-Johnson CM, Giri VN, Stanford JL, Cooney K, Yeboah E, Kibel AS, Strom S, Ostrander EA, Ragin C, Jalloh M, Roberts RA, John EM, Thompson IM, Isaacs W, Xu J, Devesa SS, Haiman CA, Hsing AW, Layne P	Prostate Cancer	2013	23476788	\N	\N
205	Analysis of serum total and free PSA using immunoaffinity depletion coupled to SMR: correlation with clinical immunoassay tests	Qian W-J, Kagan J, Hossain M, Srivastava S, Camp II DG, Chan DW, Rodland KD, Smith RD, Thompson IM, Sokoll LJ, Leach RJ, Shi T, Fillmore TL, Kronewitter SR, Liu T, Izmirlian G, Schepmoes AA	Journal of Proteomics	2012	22846433	\N	\N
206	Temporal changes in the clinical approach to diagnosing prostate cancer	Thompson IM, Ankerst DP, Leach RJ, Padalecki SS, Hilton WM	Journal of the National Cancer Institute Monographs	2012	23271768	\N	\N
207	High-throughput screening for native autoantigen-autoantibody complexes using antibody microarrays	Lampe PD, Rho JH	Journal of proteome research	2013	23541305	\N	\N
208	Characterization of KRAS rearrangements in metastatic prostate cancer	Gopalan A, Yocum AK, Li Y, Rubin MA, Varambally S, Asangani IA, Wang XS, Prensner JR, Cao Q, Dhanasekaran SM, Omenn GS, Wang R, Shankar S, Cantley LC, Palanisamy N, Pflueger D, Ateeq B, Fries DF, Chinnaiyan AM, Han B, Jing X, Robinson D, Sasaki AT, Cao X, Kahoud ER, Reuter VE	Cancer discovery	2011	22140652	\N	\N
209	Integrated analyses of proteins and their glycans in a magnetic bead-based multiplex assay format	Chen J, Zhang H, Chan DW, Li D, Chiu H	Clinical chemistry	2013	23099556	\N	\N
210	Validation of a multiplex immunoassay for serum angiogenic factors as biomarkers for aggressive prostate cancer	Gupta V, Chan DW, Chiu H, Li D	Clinica chimica acta; international journal of clinical chemistry	2012	22722017	\N	\N
211	Protein expression based multimarker analysis of breast cancer samples	Maresh EL, Presson AP, Yoon NK, Alavi M, Chia D, Mah V, Bagryanova L, Goodglick L, Horvath S, Rajasekaran AK	BMC cancer	2011	21651811	\N	\N
212	Progesterone and estrogen receptor expression and activity in human non-small cell lung cancer	Bagryanova L, Goodglick L, Mah V, Horvath S, Pietras RJ, Maresh EL, Chia D, Chen HW, Garon E, Alavi M, Marquez-Garban DC	Steroids	2011	21600232	\N	\N
213	NIST-NCI biomarker validation laboratory: NIST Collaborates with Cancer Biomarkers Group	Atha DH, Wang W, O’Connell, Barker PE, CD, Srivastava S, Markowitz M, Hocker D	Biomaterials	2001	14612946	\N	\N
214	NIST physical standards for DNA-based medical testing	Watson MS, O’Connell CD, Colbert JC, Ticehurst JR, Barker PE	Journal of Clinical Laboratory Analysis	2001	11835524	\N	\N
215	The state of molecular biomarkers for the early detection of lung cancer	Massion PP, Hassanein M, Callaway-Lane C, Aldrich MC, Grogan EL, Callison JC	Cancer Prev Res	2012	22689914	\N	\N
218	Cancer Biomarker Validation, Standards and Process: Roles for the National  Institute of Standards and Technology	Barker PE	Annals of the New York Academy of Sciences	2002	12724219	\N	\N
219	Cell and DNA standards for medical genetics laboratories	Barker PE	Journal of the Association of Genetic Technologists	2002	N/A	\N	\N
220	Susceptibility locus for lunch cancer at 15q25.1 is not associated with risk of pancreatic cancer	Frazier ML, Pande M, Sen S, Killary AM, Chen J, Amos CI, Wu X	Pancreas	2011	N/A	\N	\N
221	Targeted disruption of Aurora A causes abnormal mitotic spindle assembly, chromosome misalignment and embryonic lethality	Sen S, Sasai K, Killary AM, Parant JM, Stass SA, Carter J, Katayama H, Brandt ME, Adams HP	Oncogene	2008	18345035	\N	\N
222	MicroRNAs in plasma of pancreatic ductal adenocarcinoma patients as novel blood-based biomarkers of disease	Wang J, Killary AM, Frazier ML, Chen J, Li D, Sen S, Chang P, LeBlanc A, Abbruzzesse JL	Cancer Prevention Research (Philadelphia, PA.)	2009	19723895	\N	\N
223	Genetic variants of p21 and p27 and pancreatic cancer risk in non-Hispanic Whites: a case-control study	Sen S, Wei Q, Merriman KW, Frazier ML, Amos CI, Chen J, Killary AM	Pancreas	2010	19910837	\N	\N
224	Genetic variations of the PI3K-AKT-mTOR pathway and clinical outcome in muscle invasive and metastatic bladder cancer patients	Wu X, Chamberlain RM, Delclos GL, Dinney CP, Chen M, Killary AM, Fan Z, Grossman HB, Gu J, Hildebrandt MA	Carcinogenesis	2010	20530239	\N	\N
226	Development of the Risk of Ovarian Cancer Algorithm (ROCA) and ROCA screening trials	Steven Skates	Int J Gynecol Cancer	2012	22543916	\N	\N
227	Thapsigargin resistance in human prostate cancer cells.	Zhang B, O’Neill JP, Lee DI, Tang Y, Velalar CN, Hussain A, Selaru FM, Ross D, Nakanishi T, Meltzer SJ	Int. J. Cancer	2006	16770788	\N	\N
230	Association between smoking/alcohol use and age of onset of colon cancer: Implications for Screening.	Zisman Al, Gorchow A, Brand RE, Roy HK., Nickolov A	Arch Int Med	2006	16567601	\N	\N
231	Lynch syndrome:  History and current status	Lynch JF, Lynch HT	Disease Markers	2004	15528784	\N	\N
232	Inherited predisposition to cancer: A historical overview	Lynch JF, Shaw TG, Lynch HT	American Journal of Medical Genetics	2004	15264268	\N	\N
233	Inflammatory bowel disease in Ashkenazi Jews	Lynch HT, Brand RE, Locker GY	Familial Cancer	2004	15516846	\N	\N
234	Cancer in Jews: introduction and overview	Lynch HT, Locker GY, Rubinstein RS	Familial Cancer	2004	15516840	\N	\N
235	Colon cancer screening practices following genetic testing for hereditary nonpolyposis colorectal cancer (HNPCC) mutations	Rustgi AK, Halbert CH, Kucharski S, Lynch J, Lynch HT, Lerman C, Main D	Archives of Internal Medicine	2004	15451763	\N	\N
236	Aspects of the design and analysis of high-dimensional SNP studies for disease risk estimation	Prentice RL and Qi L	Biostatistics	2006	16443924	\N	\N
237	Detection of K-ras mutation in urine of patients with colorectal cancer.	Su Y-S, Wang M, Brenner DE and Block TM, Aiamkitsumrit B	Cancer Biomakers: Section A of Disease Markers	2005	17192038	\N	\N
238	Epidemiologic methods developments: A look forward to 2032	Prentice, RL	Annals of Epidemiology	2007	17855116	\N	\N
239	Polo-like kinase (PLK) and survivin are esophageal tumor-specific promoters.	Jin Z, Wang S, Shimada T, Sato F, Cheng Y, Berki AT, Hamilton JP, Meltzer SJ., Paun B, Yin J, Kan T, Abraham JM, Ito T, Mori Y	Biomaterials	2006	16487489	\N	\N
240	Biomarker-Based Methods for Determining Non-compliance in a Prevention Trial	Crowley J, Gower KB, Goodman P, Pauler DK, Thompson I	Controlled Clinical Trials	2002	12505245	\N	\N
241	Factors Influencing Serum CA125II Levels in Healthy Postmenopausal Women	Pauler DK, Symecko HL, Menon U, McIntosh M, Jacobs IJ, Skates SJ	Cancer Epidemiology, Biomarkers & Prevention	2001	11352859	\N	\N
242	Integrating the predictiveness of a marker with its performance as a classifier	Feng Z, Longton G, Zheng Y, Prentice R, Pepe MS, Huang Y, Thompson IM	American Journal of Epidemiology	2008	17982157	\N	\N
243	Polyethylene glycol inhibits intestinal neoplasia and induces epithelial apoptosis in Apc(min) mice.	Gulizia J, Madugula M, DiBaise JK, Hart J, Roy HK, Ansari S, Bissonnette M, Karolski WJ, Wali RK.	Cancer Letters	2004	15374630	\N	\N
244	The transcriptional repressor SNAIL is overexpressed in human colon cancer.	Koetsier J, Victor TA, Smyrk TC, Roy HK, Wali RK.	Digestive Diseases and Sciences	2005	15712635	\N	\N
246	Increased microvascular blood content is an early event in colon carcinogenesis	Liu Y, Wali RK, Koetsier JL, Backman V., Kim YL, Roy HK, Turzhitsky V, Kunte DP, Goldberg MJ	Gut	2005	15831911	\N	\N
247	Characterization of 11 human sarcoma cell strains	Ellis, LM, Lang A, Yu  D, Nicolson GL, Hu M, Bucana CD, Zhang L, and Polock RE, Killary AM., Trent JC	Cancer	2002	12237927	\N	\N
249	Tobacco use and increased colorectal cancer risk in patients with hereditary nonpolyposis colorectal cancer (Lynch syndrome).	Roy HK., Lynch HT, Watson P, Ashwathnarayan R	Archives of Internal Medicine	2004	15596632	\N	\N
251	Four-dimensional elastic light-scattering fingerprints as preneoplastic markers in the rat model of colon carcinogenesis.	Roy HK, Liu Y, Goldberg MJ, Kim YL, Backman V., Wali RK, Kromine AK	Gastroenterology	2004	15057746	\N	\N
252	Down-regulation of SNAIL suppresses MIN mouse tumorigenesis: modulation of apoptosis, proliferation, and fractal dimension.	Iversen P, Hart J, Roy HK, Backman V, Madugula M, Kunte DP, Wali RK., Kim Y, Liu Y, Koetsier JL	Molecular Cancer Therapeutics	2004	15367710	\N	\N
253	Preferential isolation of fragmented DNA enhances the detection of circulating mutated k-ras DNA	Brenner DE and Su Y-H, Steel LF, Wang M, Block TM	Clinical Chemistry	2004	14709652	\N	\N
254	SELDI-TOF-MS Profiling of Serum for Detection of the Progression of Chronic Hepatitis C to Hepatocellular Carcinoma	Steel LF, Semmes OJ, Johnson DA, Block TM, Schwegler EE, Cazares L, Adam BL, Marrero JA and Drake RR	Hepatology	2005	15726646	\N	\N
255	Efficient and specific removal of albumin from human serum sample	Trotter MG, Nakajima PB, Gonye G and Block TM, Steel LF, Mattu TS	Molecular and Cellular Proteomics	2003	12754305	\N	\N
256	Transrenal DNA as a Diagnostic Tool: Important Technical Notes	Su Y-H, Block TM, Tomei LD and Umansky S, Landt O, Botezatu I, Melkonyan H, Serdyuk O, Lichtenstein A, Wang M	Annals of the New York Academy of Sciences	2004	15251944	\N	\N
257	Human urine contains small, 150-250 nucleotide sized, soluble DNA derived from the circulation	Su Y-H, Landt O, Syngal S and Block TM, Melkonyan H, Brenner DE, Wang M, Umansky S, Ng A	Journal of Molecular Diagnostics	2004	15096565	\N	\N
258	EU-USA pathology panel for uniform diagnosis in randomised controlled trials for HRCT screening in lung cancer.	K. M. Kerr, B. Guldhammerskov, Thunnissen, W. A. Franklin, E. Brambilla, W. H. Westra, F. B., C. E. Comin, and D. B. Flieder.	European Respiratory Journal	2006	16899486	\N	\N
259	A phage with high affinity for hepatitis B surface antigen for detection of HBsAg	Lu X, Weiss P and Block TM	Journal of Virological Methods	2004	15109821	\N	\N
260	Underestimation of chronic hepatitis B in the US	London WT, Cohen C, Block J, Evans AA, Conti M and Block TM	Journal of Viral Hepatitis	2008	18088239	\N	\N
261	Identification of 14-3-3 theta as an antigen that induces a humoral response in lung cancer	Misek, Puravs E, DE, Zhang Q, Tammemagi M, Pereira-Faca SR, Thornquist M, Goodman G, Qiu J, Hanash SM, Kuick R, Karsnoselsky AL, Caporaso N, Edelstein C, Landi MT, Hinderer R, Phanstiel D, Pfeiffer R, Barnett M, Brenner D	Cancer Research	2007	18089831	\N	\N
262	Detecting K-ras mutations from fecal occult blood test cards in multiphasic screening for colorectal cancer	Brenner DE, Kislitsin D, Rennert HS, Rennert G, Lev Z	Cancer Letters	2007	17349741	\N	\N
263	A multiparametric panel for ovarian cancer diagnosis, prognosis and response to chemotherapy	Katsaros D, Simon I, Kim N, Diamandis E, Scorilas A, Massobrio M, Zheng Y, Wolfert R, Li L, Feng Z, Longrais I, Shan S	Clinical Cancer Research	2007	18056174	\N	\N
264	A multiparametric panel for ovarian cancer diagnosis, prognosis and response to chemotherapy	Simon I, Zheng Y, Kim N, Shan S, Diamandis E, Wolfert R, Massobrio M, Longrais I, Scorilas A, Li L, Katsaros D, Feng Z	Clinical Cancer Research	2007	18056174	\N	\N
265	A data-analytic strategy for protein-biomarker discovery: profiling of high-dimensional proteomic data for cancer detection	Thompson ML, Feng Z, Thornquist M, Wright G Jr, Adam B-L, Potter JD, Qu Y, Yasui Y, Winget M, Pepe M	Biostatistics	2003	12925511	\N	\N
266	Partially supervised learning using an EM-boosting algorithm	Adam B-L, Pepe M, Feng Z, Hsu L, Yasui Y	Biometrics	2004	15032790	\N	\N
267	An automated peak-identification / calibration procedure for high-dimensional protein measures from mass spectrometers	Adam B-L, Winget M, Feng Z, Thornquist M, McLerran D, Yasui Y	BioMed Central Genetics	2003	14615632	\N	\N
268	Development of common data elements: the experience of and recommendations from the Early Detection Research Network	Kincaid H, Baron J, Warzel D, Brenner D, Spitz M, Thornquist M, Winget M, Feng Z	International Journal of Medical Informatics	2003	12706181	\N	\N
269	Diagnostic Markers for Early Detection of Ovarian Cancer	Azori M, Feng Z, Flores-Saaib R, Schwartz PE, Leiser A, Tenthorey J, Alvero AB, Visintin I, Yu H, Longton G, Ward DC, Mor G, Lai Y, Rutherford T	International Journal of Cancer	2008	18258665	\N	\N
270	Assessing prostate cancer risk: results from the Prostate Cancer Prevention Trial	Thompson I, Tangen C, Chi C, Ankerst D, Feng Z, Lucia M, Parnes H, Coltman C, Goodman P	Analytical Chemistry	2006	16622122	\N	\N
271	Multiplexed analysis of glycan variation on native proteins captured by antibody arrays	Haab BB, Bergsma D, LaRoche T, Chen S, Brand RE, Hamelinck D, Brenner D	Nature Method	2007	17417647	\N	\N
272	Identification of a specific vimentin isoform that induces an antibody response in pancreatic can	Misek DE, Giordano TJ, Logsdon DC, Simeone DM, Hanash SM, Wang H, Greenson JK, Puravs E, Hinderer R, Brenner DE, Hong SH	Biomarker Insights	2007	18769604	\N	\N
273	Prediction of lung cancer using volatile biomarkers in breath	Maxfield RA, Altorki N, Greenberg J, Munawar MI, Rom WN, Kloss, Rashid A, Pass HI, Phillips M, Cameron RB, Cataneo RN, R, Austin JH, Schmitt P.	Cancer Biomark	2007	17522431	\N	\N
274	Removal of high molecular weight DNA by carboxylated magnetic beads enhances the detection of mutated K-ras DNA in urine	Wang X-H, Su Y-H, Brenner DE and Block TM, Wang M, Wang Z, Song J	Annals of the New York Academy of Sciences	2008	18837929	\N	\N
275	Age at first birth and the risk of breast cancer in BRCA1 and BRCA2 mutation carriers	Lubinski J, Moller P, Klijn J, Kim-Sing C, Kotsopoulos J, Ghadirian P, Isaacs C, Foulkes WD, Lynch HT, Neuhausen SL, and 34 more authors	Breast Cancer Research and Treatment	2007	17245541	\N	\N
276	Hereditary nonpolyposis colorectal cancer (Lynch syndrome) in Argentina: report from a referral hospital register	Vaccaro CA, Mocetti E, Roverano AV, Ojea-Quintana G, Bala S, Lynch HT, Mullen E, Bonadeo F, Benati ML, Clark MB, Rivello HG, Renkonen E, Redal MA, Lynch JF, Peltomaki P	Diseases of the Colon & Rectum	2007	17846840	\N	\N
278	Hereditary diffuse gastric cancer (HDGC): presentation of a family with a new mutation of the CDH1 gene	Huntsman D, Kaurah P, Lynch H, Redal M, Vaccaro C, Van Domselaar F, Senz J, Van Domselaar R, Correa D	Acta Gastroenterol Latinoam	2007	17955726	\N	\N
280	Hereditary breast cancer: Part II. Management of hereditary breast cancer: implications of molecular genetics and pathology	Silva E, Snyder C, Lynch JF, Lynch HT, Vranic S, Gatalica Z	The Breast Journal	2008	18086271	\N	\N
281	Hereditary breast cancer: Part I. Diagnosing hereditary breast cancer syndromes	Snyder C, Lynch HT, Silva E, Lynch JF	The Breast Journal	2008	18086272	\N	\N
282	Familial adenomatous polyposis in children younger than age ten years: a multidisciplinary clinic experience	Thorson AG, Tajouri T, Lynch HT, Tinley S, Attard TM, Peterson KD	Diseases of the Colon & Rectum	2008	18157572	\N	\N
283	Frequency of the CHEK2 1100delC mutation among women with breast cancer: an international study	Robidoux A, Trudeau M, Zhang S, Poll A, Gomes M, Zhang P, Hamel N, Liede A, Costa MM, Sun P, Horsman D, McCready D, Narod SA, Foulkes W, Rousseau F, Phelan CM, De Matsuda ML, Lynch H, Ghadirian P, Aziz Z	Cancer Research	2008	18381420	\N	\N
284	Hereditary diffuse gastric cancer: diagnosis, genetic counseling, and prophylactic total gastrectomy	Weissman S, Wiyrick S, Lynch JF, rubinstein WS, Wirtzfeld D, Huntsman DG, Grady W, Senz J, Kaurah P, Lynch HT	Cancer	2008	18442100	\N	\N
285	Nanotechnology in early cancer detection	Barker PE, Srivastava S, Srinivas P	Laboratory Investigation	2002	12004006	\N	\N
286	High-throughput TRAP/PCR analysis of telomerase using capillary electrophoresis	Hess JL, Sanow AD, Miller K, Highsmith WE, Wang W, Srivastava S, Atha DH, Wu OC, Xu J	American Journal of Human Genetics	2002	N/A	\N	\N
287	NIST physical standards for DNA-based medical testing.	Ticehurst JR, Watson MS, Barker PE, O’Connell CD, Colbert JC	Journal of Clinical Laboratory Analysis	2001	11835524	\N	\N
289	Dynamic alteration of soluble serum biomarkers in healthy aging	Chatta GS, Yurkovetsky ZR, Shurin GV, Lokshin AE, Tourkova IL, Shurin MR	Cytokine	2007	17689975	\N	\N
290	Biomarker approaches to the development of cancer screening tests: can cancer blood tests become a routine health check-up?	Yurkovetsky Z, Lokshin A, Linkov F	Future Oncology	2007	17547524	\N	\N
291	Early detection and staging of adenocarcinoma of the pancreas	Pappas S, Federle MP, Zeh HJ 3rd, Lokshin AE	Gastroenterology Clinics of North America	2007	17533087	\N	\N
292	Development of multimarker panel for early detection of endometrial cancer.  High diagnostic power of prolactin	Winans M, Linkov F, Velikokhatnaya L, Gorelik A, Rand A, Marrangoni A, Maxwell GL, Yurkovetsky Z, Ta&#39;asan S, Lokshin A, Skates S, Lomakin A, Lu K	Gynecologic Oncology	2007	17659325	\N	\N
293	Low-dose Paclitaxel prior to intratumoral dendritic cell vaccine modulates intratumoral cytokine network and lung cancer growth	Han B, Zhong H, Lokshin A, Shurin GV, Shurin MR, Tourkova IK, Rosenbloom A	Clinical Cancer Research	2007	17875775	\N	\N
294	Use of high density antibody arrays to validate and discover cancer serum biomarkers	Ramirez AB, Loch CM, Delrow JJ, Lampe PD, McIntosh MW, Urban ND, Garvik BM, Liu Y, Scholler N, Sather CL	Molecular oncology	2007	19383305	\N	\N
295	Use of a single-chain antibody library for ovarian cancer biomarker discovery	Labaer J, Loch CM, Lampe PD, Eugene R, Zhang Y, Ramirez AB, Mendoza EA, Wayner EA, Hainsworth E, Sargent JE, Sibani S, Liu Y, Wang X, Urban ND, McIntosh MW	Molecular & cellular proteomics : MCP	2010	20467042	\N	\N
296	Creatine kinase brain overexpression protects colorectal cells from various metabolic and non-metabolic stresses.	Rajagopalan K, Kulkarni P, Mooney SM, Getzenberg RH., Zeng Y, Williams BH, Christudass CS, Yin B, Li Y	J Cell Biochem	2011	21308735	\N	\N
297	Missed adenomas during colonoscopic surveillance in individuals with Lynch Syndrome (hereditary nonpolyposis colorectal cancer).	Marcon NE, Zhao L, Turgeon DK, Tuck MK, Normolle DP, Brenner DE, Bresalier RS, Syngal S, Stockwell DH, Stoffel EM, Baron JA, Ruffin MT	Cancer research Prevention	2008	19138994	\N	\N
298	Chromoendoscopy detects more adenomas than colonoscopy using intensive inspection without dye spraying.	Turgeon DK, Marcon NE, Normolle DP, Brenner DE, Bresalier RS, Stockwell DH, Syngal S, Stoffel EM, Baron JA, Ruffin MT, Arber N, Tuck MK	Cancer Prevention Research	2008	19139000	\N	\N
299	Plasma glycoprotein profiling for colorectal cancer biomarker identification by lectin glycoarray and lectin blot	Qiu Y, Bresalier R, Patwa TH, Brenner DE, Synal S, Lubman DM, Marcon N, Xu L, Tuck M, Jin G, Shedden K, Misek DE, Turgeon DK, Ruffin MT	Journal of proteome research	2008	18311904	\N	\N
302	Colorectal cancer molecular biology moves into clinical practice	Pritchard CC, Grady WM	Gut	2011	20921207	\N	\N
303	Linking epidemiology to epigenomics--where are we today?	Ulrich CM, Grady WM	Cancer prevention research (Philadelphia, Pa.)	2010	21149325	\N	\N
304	Integrative genomic and proteomic analysis of prostate cancer reveals signatures of metastatic progression.	Wei JT, Monzon FA, Rubin MA, Becich MJ, Chandran U, Laxman B, Pienta KJ, Yu J, Shah RB, Tomlins SA, Varambally S, Mehra R, Chinnaiyan AM., Rhodes DR, Ghosh D	Cancer Cell	2005	16286247	\N	\N
305	Physiological and molecular effects of Apo2L/TRAIL and cisplatin in ovarian carcinoma cell lines	Lokshin A, Edwards RP, Marrangoni AM, Feng X, Naoumova N, Winans M, Siervo-Sassi RR	Cancer Letters	2003	12536078	\N	\N
307	Classification and selection of biomarkers in genomic data using LASSO.	Ghosh D, Chinnaiyan AM.	J Biomed biotechnol	2005	16046820	\N	\N
308	Is the monocyte chemotactic protein-1 -2518 G allele a risk factor for severe acute pancreatitis?	Whitcomb DC, Lokshin A, Sass DA, Papachristou GI, Avula H, Lamb J, Barmada MM, Slivka A	Clinical Gastroenterology and Hepatology	2005	15880317	\N	\N
309	IL-12 receptor-mediated upregulation of FasL in human ovarian carcinoma cells	Edwards RP, Lokshin AE, Drenning SD, Gorelik E, Grandis JR, Kwon JA, Feng X, Velikokhatnaya L, Marrangoni AM	International Journal of Cancer	2004	15382042	\N	\N
310	Cancer immunomics: using autoantibody signatures in the early detection of prostate cancer.	Chinnaiyan AM., Bradford TJ, Wang X	Urol Oncol	2006	16678056	\N	\N
312	Expression of chemokines in GVHD target organs is influenced by conditioning and genetic factors and amplified by GVHR	Luster A, Mapara MY, Bronson R, Leng C, Lokshin A, Kim YM, Sykes M	Biology of Blood and Marrow Transplantation	2006	16737935	\N	\N
313	New tumor markers: CA125 and beyond	Baggerly KA, Jacobs I, Rosen D, Badgwell D, Atkinson EN, Lu K, Zhang Z, Lu Z, Skates S, Lokshin A, Liu J, Menon U, Bast RC Jr, Marquez R	International Journal of Gynecological Cancer	2005	16343244	\N	\N
314	Humoral immune response to alpha-methylacyl-CoA racemase and prostate cancer.	Rubin MA, Chinnaiyan AM., Ghosh D, Laxman B, Harwood J, Rhodes DR, Bhagavathula S, Giacherio D, Sanda MG, Sreekumar A	Journal of the National Cancer Institute	2004	15173267	\N	\N
315	Identification of beta-tubulin isoforms as tumor antigens in neuroblastoma	R, Geiger, DE, Prasannan, L, Michon, and Hanash, J, SM, Misek, JD, Hinderer	Clinical Cancer Research	2000	11051243	\N	\N
317	N-linked glycosylation of the liver cancer biomarker GP73	Philip R, Mehta AS and Block TM, D&#39;Amelio A, Comunale MA, Pirog N, Norton P, Rodemich L, Krakover J	Journal of Cellular Biochemistry	2008	18004786	\N	\N
318	Increased levels of galactose-deficient anti-gal IgG in the sera of HCV infected individuals with fibrosis and cirrhosis	Rodemich L, Comunale MA, Marrero JA and Block TM, Krakover J, Wang M, Long RE, Mehta AS, Philip R	Journal of Virology	2008	18045939	\N	\N
319	Fecal DNA biomarkers for the detection of colorectal neoplasia: Attractive, but is it feasible? (Editorial Comment)	Rennert G, Brenner DE	Journal of the National Cancer Institute	2005	16077063	\N	\N
320	Symptomatology and health attitudes of chronic hepatitis B patients in the United States	Fisher RT and Atillasoy E, Harris M, Han S-H, Block TM, Maa J-F, Hann H-W	Journal of Viral Hepatitis	2008	18088244	\N	\N
323	MicroRNAs as regulators of death receptors signaling.	Croce CM, Condorelli GL, Garofalo M, Condorelli G.	Cell Death and Differintiation	2010	19644509	\N	\N
325	Aberrant Expression of Mucin Core Proteins and O-Linked Glycans Associated with Progression of Pancreatic Cancer	Linde  EM, DiMaio DJ, Remmers N, Anderson JM, Yu F, Wandall HH, Lazenby AJ, Mandel U, and Hollingsworth, Clausen H	Clinical Cancer Research	2013	23446997	\N	\N
327	MUC4 expression correlates with poor prognosis in small-sized lung adenocarcinoma	Hirotsu Y, Tsutsumida H, Imai K, Kubota I, Goto M, Batra SK, Kitajima S, Wakimoto J, Yonezawa S	Lung Cancer	2007	17126950	\N	\N
328	Pulmonary prostacyclin synthase overexpression chemoprevents tobacco smoke lung carcinogenesis in mice	Girod CE, Franklin WA, Sotto-Santiago S, Hudish TM, Miller YE, Keith RL, Geraci MW, Nemenoff RA, Nana-Sinkam SP, March TH	Cancer Research	2004	15313935	\N	\N
330	Discovering the route from inflammation to pancreatic cancer	Momi N, Krishn SR, Kaur S, Batra SK	Minerva gastroenterologica e dietologica	2012	23207606	\N	\N
331	Early diagnosis of pancreatic cancer: challenges and new developments	Kaur S, Jain M, Baine MJ, Sasson AR, Batra SK	Biomarkers in medicine	2012	23075238	\N	\N
333	Overexpression of ecdysoneless in pancreatic cancer and its role in oncogenesis by regulating glycolysis	Gurumurthy CB, Band V, Rachagani S, Zhao X, Batra SK, Hollingsworth MA, Chakraborty S, Dey P, Anderson JM, Lele S, Singh PK	Clinical Cancer Research	2012	22977192	\N	\N
335	Nicotine/cigarette smoke promotes metastasis of pancreatic cancer through &#945;7nAChR-mediated MUC4 upregulation	Kaur S, Kunigal SS, Rachagani S, Ponnusamy MP, Batra SK, Ouellette MM, Momi N, Chellappan S	Oncogene	2013	22614008	\N	\N
336	Emergence of zebrafish models in oncology for validating novel anticancer drug targets and nanomaterials	Mimeault M, Batra SK	Drug discovery today	2013	22903142	\N	\N
337	Bronchioloalveolar carcinoma: a model for investigating the biology of epidermal growth factor receptor inhibition	Crowley J, Franklin WA, Chansky K, Davies AM, Gumerlock PH, West H, Lau DH, Gandara D, Hirsch FR	Clinical Cancer Research	2004	15217959	\N	\N
338	Lineage relationship of prostate cancer cells types based on gene expression	Liu AY, Vencio EF, Denyer G, Ware CB, Vencio RZN, Vessella RL, Pascal LE	BMC Medical Genomics	2011	21605402	\N	\N
339	Premalignant evolution of lung cancer: Gilles F Filley lecture	FranklinWA	Chest	2004	15136432	\N	\N
340	Embryonal carcinoma cell induction of miRNA and mRNA changes in co-cultured prostate stromal fibromuscular cells	Zhang S., Vencio EF, Liu AY, Galas DJ, Pascal LE, Wang AJ, Ruohola-Baker H, Denyer G, Wang K, Page LS	Journal of Cellular Physiology	2011	20945389	\N	\N
341	Intersession reproducibility of mass spectrometry profiles and its effect on accuracy of multivariate classification models.	Bigbee WL, Pelikan R, Hauskrecht M., Malehorn D, Lyons-Weiler J	Bioinformatics	2007	17766268	\N	\N
343	Epigenetic silencing of the intronic microRNA hsa-miR-342 and its host gene EVL in colorectal cancer	Paraskeva C, Tewari M, Markowitz SD, Kroh EM, Willson JK, Allen A, Fritz BR, Tsuchiya KD, Kaz AM, Kim YH, Parkin RK, Grady WM, Washington MK, Mitchell PS, Lee JH	Oncogene	2008	18264139	\N	\N
344	TGF-beta receptor inactivation and mutant Kras induce intestinal neoplasms in mice via a beta-catenin-independent pathway	Ulrich CM, Tsuchiya KD, Song X, Munoz NM, Grady WM, Trobridge P, Rojas A, Washington MK, Sasazuki T, Shirasawa S, Knoblaugh S	Gastroenterology	2009	19208363	\N	\N
345	Genomic and epigenetic instability in colorectal cancer pathogenesis	Carethers JM, Grady WM	Gastroenterology	2008	18773902	\N	\N
346	The aberrant methylation of TSP1 suppresses TGF-beta1 activation in colorectal cancer	Meherem S, Rojas A, Washington MK, Kim YH, Grady WM, Markowitz SD, Willis JE	International journal of cancer. Journal international du cancer	2008	18425817	\N	\N
347	TGF-beta has paradoxical and context dependent effects on proliferation and anoikis in human colorectal cancer cell lines	Muñoz NM, Baek JY, Grady WM	Growth factors (Chur, Switzerland)	2008	18651288	\N	\N
348	Aberrant DNA methylation occurs in colon neoplasms arising in the azoxymethane colon cancer model	Washington MK, Trobridge P, Henikoff S, Dzieciatkowski S, Borinstein SC, Grady WM, Conerly M, Biswas S	Molecular carcinogenesis	2010	19777566	\N	\N
349	TGF-beta receptor levels regulate the specificity of signaling pathway activation and biological effects of TGF-beta	Rojas A, Cress D, Grady WM, Padidam M	Biochimica et biophysica acta	2009	19339207	\N	\N
351	Colorectal endoscopy, advanced adenomas, and sessile serrated polyps: implications for proximal colon cancer	Zhu LC, Potter JD, Burnett-Hartman AN, Newcomb PA, Grady WM, Phipps AI, Passarelli MN, Upton MP	The American journal of gastroenterology	2012	22688851	\N	\N
353	Prevention and early detection of ovarian cancer: mission impossible?	Chan D, Lu K, Lokshin A, Brewer M, Lu Z, Skates S, Hernandez MA, Daley M, Badgwell D, Mills GB, Zhang Z, Ozols R, Bast RC Jr, Zou C, Yu Y	Recent Results in Cancer Research	2007	17302189	\N	\N
354	DNA methylation profiling across the spectrum of HPV-associated anal squamous neoplasia	Coppola D, Siegel EM, Qu X, Hernandez JM, Eschrich S, Shibata D, Ajidahun A, Berglund A, Grady WM, Giuliano AR, Riggs B, Elahi A	PloS one	2012	23226306	\N	\N
355	Genomic Aberrations Occurring in Subsets of Serrated Colorectal Lesions but not Conventional Adenomas	Grady WM, Newcomb PA, Potter JD, Wurscher MA, Phipps AI, Passarelli MN, Zhu LC, Makar KW, Upton MP, Burnett-Hartman AN	Cancer research	2013	23539450	\N	\N
356	Inactivation of TGF-&#946; signaling and loss of PTEN cooperate to induce colon cancer in vivo	Wang Y, Knoblaugh S, Yu M, Trobridge P, Grady WM, Morris SM, Kanngurn S	Oncogene	2013	23604118	\N	\N
357	The early detection research network’s specimen reference sets: Paving the way for rapid evaluation of potential biomarkers	Krueger K, Thompson I, Feng Z, Rinaudo JA, Srivastava S, Kagan J, Sorbara L, Patriotis C, Thornquist M, ZhengY, Pepe M, Huang Y, Dahlgren J	Clinical Chemistry	2013	23193062	\N	\N
360	Frequent IGF2/H19 domain epigenetic alterations and elevated IGF2 expression in epithelial ovarian cancer	Spillman MA, Huang Z, Wen Y, Berchuck A, Simel LR, Murphy SK, Marks JR, Nichols TD, Whitaker RS	Molecular Cancer Research	2006	16603642	\N	\N
363	A migration signature and plasma biomarker panel for pancreatic adenocarcinoma	Chen J, Balasenthil S, Chen N, Killary AM, Carter J, Frazier ML, Sen S, Grizzle WE, Lott ST	Cancer Prevention Research (Philadelphia, PA)	2011	21071578	\N	\N
366	Identification of osteopontin as a novel marker for early hepatocellular carcinoma	Beretta L, Hainaut P, Marrero JA, Plymoth A, Sangrajrang S, Ge S, Feng Z, Rosen HR, Shang S	Hepatology	2012	21953299	\N	\N
367	Creatine kinase brain overexpression protects colorectal cells from various metabolic and non-metabolic stresses	Zeng Y, Rajagopalan K, Li Y, Williams BH, Mooney SM, Christudass CS, Kulkarni P, Yin B, Getzenberg RH	Journal of cellular biochemistry	2011	21308735	\N	\N
369	Susceptibility locus for lung cancer at 15q25.1 is not associated with risk of pancreatic cancer	Frazier ML, Sen S, Pande M, Killary AM, Amos CI, Chen J, Wu X	Pancreas	2011	21697764	\N	\N
371	Asymptotic Properties of the Sequential Empirical ROC, PPV and NPV Curves under Case-Control Sampling	Koopmeiners J, Feng Z.	Annuals of Statistics	2011	24039313	\N	\N
373	Semi-parametric ROC analysis to evaluate biomarkers for disease	Cai T, Pepe MS	Journal of the American Statistical Association	2002	N/A	\N	\N
374	Molecular quality of exfoliated cervical cells:  Implications for molecular epidemiology and biomarker discovery	Unger ER, Verma M, Vernon SD, Lee DR, Habis AH	Cancer Epidemiology, Biomarkers & Prevention	2004	15006929	\N	\N
375	Impact of RNA extraction from limited samples on microarray results	Evengard B, Vernon SD, Unger ER, Lee DR, Ojaniemi H	BioTechniques	2003	14628670	\N	\N
376	A simplified approach for analysis of SELDI-TOF mass spectrometry data	Ding YS, Vernon SD, Unger ER, Karen KL	Appl Genomics and Proteomics	2003	N/A	\N	\N
377	Bioelectronic DNA detection of human papillomaviruses using eSensor™: A model system for detection of multiple pathogens	Unger ER, Chan V, Farkas DH, Miller DL, Vernon SD, Blackburn GF, Chen Y-P, Reeves WC	BMC Infect Dis	2003	12814521	\N	\N
378	Global amplification of sense RNA: A novel method to replicate and archive mRNA for gene expression analysis	Unger ER, Verma M, Vernon SD, Rajeevan MS, Dimulescu IM	Genomics	2003	13679029	\N	\N
379	Serum protein profiles to identify head and neck cancer.	Wright GL, Somers KD, Adam BL, Stack BC, Wadsworth JT, Cazares LH, Semmes OJ	Clinical Cancer Research	2004	15014013	\N	\N
380	miR15a and miR16-1 in Cancer:  Discovery and Future Perspectives	Croce CM, Aqeilan R, Calin GA	Death and Differentiation	2010	19498445	\N	\N
381	High prevalence of endobronchial malignancy in high-risk patients with moderate dysplasia in sputum	Franklin W A, Merrick TA, Petty TL, Byers T, Cook R, Keith, Bunn PA Jr, Shroyer KR, Prindiville SA, Hirsch FR, Miller YE, RL, Dempsey EC, Kennedy TC	Chest	2004	15136448	\N	\N
383	Non-codingRNA sequence variations in human chronic lymphocytic leukemia and colorectal cancer.	Wojcik SE, Kipps TJ, Nicoloso MS, Keating MJ, Herlea V, Alder H, Rossi S, Rassenti LZ, Cimmino A, Croce CM and Calin GA, Shimizu M, Rai KR	Carcinogenesis	2010	19926640	\N	\N
384	Modeling the width and placement of riparian vegetated buffer strips: a case study on the Chi-Jia-Wang stream, Taiwan	Chou WC, Lin WT, Lin CY	Journal of environmental management	2002	12448405	\N	\N
385	Prostate cancer postoperative nomogram scores and obesity	Slymen DJ, Major JM, Pierce JP, Klonoff-Cohen HS, Mercola D, Saltzstein SL, Macera CA, Kattan MW	PloS one	2011	21390220	\N	\N
386	Comparative analysis of algorithms for signal quantitation from oligonucleotide microarrays	Kaminski, Dehan E, Franklin W, Geraci M, Barash Y, Krupsky M, N, Friedman N	Bioinformatics	2004	14751998	\N	\N
387	Diagnosis of prostate cancer using differentially expressed genes in stroma	Yao H, Meyskens F, Koziol JA, Sawyers A, Sutton M, Rahmatpanah F, Goodison S, Simoneau A, Jia Z, McClelland M, Beach T, Turan T, Lernhardt W, Wang-Rodriguez J, Mercola D, Carpenter P, Xu Q, Pio R, Monforte J, Wang Y, Xia XQ	Cancer research	2011	21459804	\N	\N
388	Molecular classification and molecular genetics of human lung cancers	Kelley J, Meyerson M, Franklin WA	Seminars in Oncology	2004	14981576	\N	\N
389	Chemoprevention of lung cancer--from biology to clinical reality.	FR, Bunn PA, Franklin WA, Kotantoulas GK, Hirsch, Winterhalder RC	Annals of Oncology	2004	14760107	\N	\N
390	Assessing accuracy of a continuous screening test in the presence of verification bias	Pepe MS, Alonzo TA	Applied Statistics	2005	N/A	\N	\N
391	Quantifying and comparing the accuracy of binary biomarkers when predicting a failure time outcome	Pepe MS, Moskowitz CS	Statistics in Medicine	2004	15122736	\N	\N
392	Quantifying and comparing the predictive accuracy of continuous prognostic factors for binary outcomes	Moskowitz CS, Pepe MS	Biostatistics	2004	14744831	\N	\N
393	Evaluating markers for selecting a patient&#39;s treatment	Pepe MS, Song X	Biometrics	2004	15606407	\N	\N
394	Identifying target populations for screening or not screening using logic regression	Pepe MS, Janes H, Newcomb P, Kooperberg C	Statistics in Medicine	2005	15568185	\N	\N
395	The analysis of placement values for evaluating discriminatory measures	Cai T, Pepe MS	Biometrics	2004	15180681	\N	\N
396	Standardizing markers to evaluate and compare their performances	Pepe MS, Longton GL	Epidemiology	2005	16135934	\N	\N
397	Partly Conditional Survival Model for Longitudinal Data	P, Heagerty, Zheng Y	Biometrics	2005	16011684	\N	\N
398	Proteomic analysis and identification of new biomarkers and therapeutic targets for invasive ovarian cancer	Zhao Y, Petricoin III EF, Liotta LA, Krutzsch H, Jones MB, Shu H, Kohn EC	Proteomics	2002	11788994	\N	\N
399	Metastasis and angiogenesis in epithelial ovarian cancer	Trope C, Fidler IJ, Jaffee R, Van Trappen P, Liotta LA, Kohn EC, Mills GB, Fishman DA	Gynecologic Oncology	2003	N/A	\N	\N
400	Identification and Preliminary Clinical Evaluation of NMP 48, a Novel Serum Marker for Prostate Cancer	Shue MJ, Mangold LA, Wu Y-J, Kelley S, Hass GM, Javier T, Briggman JV, Derby J, Stieg A, Hlavaty JJ, Partin AW, Sarracino D	Urology	2002	N/A	\N	\N
401	Overexpression of alpha-defensin is associated with bladder cancer invasivness	Blackmore PF, Schellhammer PF, Holterman DA, Diaz JI, Vlahou A, Semmes OJ, Davis JW, Corica A	Urologic Oncology	2006	16520271	\N	\N
402	Evaluating the Total Costs of Chemotherapy-Induced Toxicity: Results from a Pilot Study with Ovarian Cancer Patients	Chang C, Lurain JR, Bennett CL, Calhoun EA, Fishman DA, Welshman EE	The Oncologist	2001	11675522	\N	\N
403	Resampling and deconvolution of linear time-of-flight records for enhanced protein profiling	Sasinowski M, Malyarenko DI, Semmes OJ, Shin Sl, Drake RR, Tracy ER, Manos DM, Cooke WE	Rapid Communications in Mass Spectrometry	2006	16637003	\N	\N
404	Oral contraceptives, parity, and ovarian cancer risk in BRCA1/2 carriers	Cramer DW, Kant JL, Fishman DA, Modungo F, Belle S, Nelson DB, Ness RB, Wheeler JE, Risch H, Wonderlick A, Naus G, Narod SA	American Journal of Human Genetics	2001	11474660	\N	\N
405	Activation of MapkS erk1/2 by Inhibin in Ovarian-Tissue Derived Cell Lines	Woodruff TK, Santiago JY, Fishman DA, Roberson M, Hunnzicker-Dunn M, Stack MS	The Journal of Cell Biology	2002	N/A	\N	\N
406	The Scientific Basis for the Early Detection of Early Stage Epithelial Ovarian Carcinoma Part 2	Bozorgi K, Singh D, Fishman DA, Lurain JR	The Female Patient	2002	N/A	\N	\N
407	A novel approach for clustering proteomics data using bayesian fast fourier transform	Bensmail H, Golek J, Haoudi A, Semmes OJ, Moody MM	Bioinformatics	2005	15769836	\N	\N
408	Founder and recurrent CDH1 mutations in families with hereditary diffuse gastric cancer	Yim D, Redal MA, Boyd N, Green J, Suriano G, Coit D, Vaccaro C, Chun N, Nikkel S, De Luca A, Van Manen L, Yoon S, Weissman S, Stroop J, Olschwang S, Wirtzfeld D, Lauwers G, Oliveira C, Gilpin jC, Fernandez B, Chung D, Ford J, Connolly-Wilson M, McKinnon W, Zaor S, Panzini B, Pizzuti A, Tischkowitz M, Sebold C, Lynch H, MacMillan A, Kaurah P, Senz J, Rubinstein WS, Greenblatt M, Greenstein R, Gallinger S, Pharoah P, Huntsman D, Fontaine D	Journal of the American Medical Association	2007	17545690	\N	\N
409	Improving biomarker identification with better designs and reporting	Pepe MS, Feng Z	Clinical Chemistry	2011	21666069	\N	\N
412	Proteomics of human breast Ductal carcinoma in situ (DCIS)	Kurek R, Sgroi DC, Kruztsch H, Steeg PS, Knowlton M, Sahin A, Shu H, Petricoin III EF, McGarvey K, Chen S, Wulfkuhle JD, Merino MJ, Zhao Y, McLean K	Cancer Research	2002	12438275	\N	\N
414	How to validate expression microarrays Immunohistochemical validation of expression microarray results	True L, Feng Z	Journal of Molecular Diagnostics	2005	15858137	\N	\N
415	Biochemical regulation of ovarian metastasis- the role of LPA	Graves L, Fishman DA	Journal of the Society for Gynecologic Investigation	2002	19739275	\N	\N
416	Deconvolution filters to enhance resolution of dense time-of-flight survey spectra in time-lag optimization range	Tracy ER, Drake RR, Shin SL, Malyarenko DI, Semmes OJ, Sasinowski M, Cooke WE, Manos DM	Rapid Communications in Mass Spectrometry	2006	16636999	\N	\N
417	Diagnostic Markers for Early Detection of Ovarian Cancer	Feng Z, Yu H, Ward DC, Azori M, Visintin I, Flores-Saaib R, Schwartz PE, Mor G, Lai Y, Tenthorey J, Leiser A, Rutherford T, Alvero AB, Longton G	Clinical Cancer Research	2008	18258665	\N	\N
418	The Scientific Basis for the Early Detection of Early Stage Epithelial Ovarian Carcinoma, Part 1	Bozorgi K, Singh D, Fishman DA, Lurain JR	The Female Patient	2002	11775458	\N	\N
419	Differential expression of CD10 in prostate cancer and its clinical implication	Siegel AF, Dall’Era MA, True LD, Porter MP, Sherertz TM, Liu AY	BMC Urology	2007	17335564	\N	\N
420	Molecular and cellular characterization of ABCG2 in the prostate	Oudes AJ, Pascal LE, Liu AY, Petersen TW, Goo YA, True LD	BMC Urology	2007	17425799	\N	\N
422	True LD. Minimum information specification for in situ hybridization and immunohistochemistry experiments (MISFISHIE)	Campbell D, Zon LI, Liu AY, Mills JC, Sherlock G, Bova GS, Pascal LE, Ball CA, Walashek L, Pollet N, Stoeckert CJ, Quackenbush J, Henrich T, Brazma A, Grimmond S, Berman JJ, Ringwald M, Oudes AJ, Herrmann BG, Goo YA, Bumgarner RE, Warford A, Johnson MH, Swedlow J, Christiansen J, Zhou Y, Wilkinson DG, Sansone S, Deutsch EW, Ramialison M, Davidson DR, Korb M, Parkinson HE, Causton HC, Taylor RC	Nature Biotechnology	2008	18327244	\N	\N
423	SELDI-TOF-MS Whole Serum Proteomic Profiling With IMAC Surface Does Not Reliably Detect Prostate Cancer	Cazares LH, Diaz J, Feng Z, Zhang Z, Zhu L, Troyer D, Wright GL, Thompson IM, Sokoll L, Bigbee WL, Lin D, Randolph T, Semmes J, Malik G, Srivistava S, Chan DW, Dahlgren J, Grizzle WE, McLerran D, Kagan J, Thornquist M, Partin A, Oelschlager D	Clinical Chemistry	2008	18024530	\N	\N
424	Mass spectrometric detection of tissue proteins in plasma	Loriaux P, Watts JD, Zhang H, Zhou Y, Aebersold R., Wollscheid B, Liu AY	Molecular and Cellular Proteomics	2007	17030953	\N	\N
425	Identification of HSP27 and HSP70 as CD10 binding proteins in prostate cancer cells	Martin DB, Dall’Era MA, Oudes A, Liu AY	Prostate	2007	17342744	\N	\N
426	Feature extraction in the analysis of proteomic mass spectra	Pradham K, Mitchell J, Semmes OJ, Glimm J, Zhu W, Ji C, Ma Y, Wang X	Proteomics	2006	16502467	\N	\N
427	Generation and characterization of anti-MUC4 monoclonal antibodies reactive with normal and cancer cells in humans	Varshney GC, Batra SK, Copin MC, Andrianifahanana M, Moniaux N, Chauhan SC, Jain M, Wittel UA, Aubert JP	Journal of Histochemistry & Cytochemistry	2004	14729877	\N	\N
429	Inhibition of MUC4 expression suppresses pancreatic tumor cell growth and metastasis	Moniaux N, Meza JL, Singh AP, Chauhan SC, Batra SK	Cancer Research	2004	14744777	\N	\N
430	Pancreatic enzyme extract improves survival in murine pancreatic cancer	Nozawa F, Standop J, Pour PM, Gonzalez NJ, Pandey KK, Itami A, Batra SK, Standop S, Guesry P, Saruc M	Pancreas	2004	15097858	\N	\N
431	Culture and immortalization of pancreatic ductal epithelial cells	Hollingsworth M, Lawson T, Kolar C, Ouellette M	Methods in Molecular Medicine	2005	15542901	\N	\N
432	Mucins in cancer: protection and control of the cell surface	Hollingsworth MA, Swanson BJ	Nature Reviews Cancer	2004	14681689	\N	\N
433	Unraveling the complex proteome for biomarker discovery in gastrointestinal and liver diseases	Song K, Hanash S	Gastroenterology	2006	17064703	\N	\N
434	Expression of transcription factor Yin Yang 1 in prostate cancer.	Hanna S, Horvath S, Liu X, Shi T, Chia D, Goodglick L, Bonavida B., Seligson D, Garban H, Roberts A, Huerta-Yepez S	International J Oncology	2005	15942652	\N	\N
435	Loss of annexin A1 expression in human breast cancer detected by multiple high-throughput analyses.	Shen,D,Chang,HR,Chen,Z,He,J,Lonsberry,V,Elshimali,Y,Chia,D,Seligson,D,Goodglick,L,Nelson,SF,Gornbein,JA.	BBRC	2005	15567174	\N	\N
437	Aromatase expression predicts survival in women with early-stage non small cell lung cancer.	Elshimali Y, Mah V, Wistuba II, Seligson DB, Márquez DC, Fishbein MC, Li A, Pietras RJ, Chia D, Goodglick L.	Cancer Research	2007	17974992	\N	\N
438	Distinct DNA methylation profiles in malignant mesothelioma, lung adenocarcinoma, and non-tumor lung	Laird-Offringa IA, Tsou JA, Shen LY, Seneviratne CK, Hagen JA, Siegmund KD, Koss MN, Pass HI, Laird PW, Long TI	Lung Cancer	2005	15639718	\N	\N
439	Direct electronic detection of prostate-specific antigen in serum.	Goodglick L, Briman M, Artukovic E, Zhang L, Gruner G., Chia D	small	2007	17352433	\N	\N
440	The genomic complexity of primary human prostate cancer	Esgueva R, Sougnez C, Wilkinson J, Gabriel SB, Gerstein MB, Pflueger D, Tewari A, Drier Y, Lawrence MS, Habegger L, Ambrogio L, Simons JW, Lander ES, Sivachenko AY, Pugh TJ, Ardlie K, Saksena G, Fennell T, Kitabayashi N, Onofrio R, Kantoff PW, Park K, Voet D, Rubin MA, MacDonald TY, Fisher S, Garraway LA, Mahan S, Golub TR, Meyerson M, Parkin M, Getz G, Chin L, Berger MF, Carter SL, Cibulskis K, Baldwin J, Sboner A, Demichelis F, Ramos AH, Winckler W	Nature	2011	21307934	\N	\N
441	Colonoscopy and Optical Biopsy: bridging Technological Advances to Clinical Practice	Goldberg MJ, Bajaj S, Roy HK, Backman V	Gastroenterology	2011	21521641	\N	\N
443	Therapeutic targeting of SPINK1-positive prostate cancer	Cao Q, Ateeq B, Chinnaiyan AM, Cao X, Feng FY, Li Y, Wang X, Asangani IA, Laxman B, Pienta KJ, Tomlins SA, Varambally S	Science translational medicine	2011	21368222	\N	\N
444	Light-Scattering Technologies for Field Carcinogenesis Detection: A Modality for Endoscopic Prescreening	Backman V, Roy HK	Gastroenterology	2010	21078318	\N	\N
445	Optical measurement of rectal microvasculature as an adjunct to flexible sigmoidosocopy: gender-specific implications	Goldberg MJ, Turzhitsky V, Gomes AJ, Yen E, Backman V, Rogers JD, Ruderman S, Jameel M, Kim Y, Stoyneva V, Bogojevic A, Roy HK, Bianchi LK	Cancer Prev Res	2010	20570881	\N	\N
446	Mechanisms of growth stimulation by suramin in non-small cell lung cancer cell lines	Lokshin A, Levitt ML, Campbell PG, Peng X, Barsouk A	Cancer Chemotherapy and Pharmacology	1999	10071987	\N	\N
1286	Epidemiologic methods developments: A look forward to 2032	Prentice, RL	Annals of Epidemiology	2007	17855116	\N	\N
447	Early effects of retinoic acid on proliferation, differentiation and apoptosis in non-small cell lung cancer cell lines	Lokshin M, Lokshin A, Zhang H, Levitt ML, Mayotte J	Anticancer Research	1999	10697544	\N	\N
448	Interaction of tissue transgluatminase with nuclear transport protein importin-alpha3	Zhang H, Zhang Y, Graner S, Lokshin A, Peng X, Levitt ML, Williams JF	FEBS Letters	1999	10100610	\N	\N
449	Effect of suramin on squamous differentiation and apoptosis in three human non-small-cell lung cancer cell lines	Levitt ML, Lokshin A	Journal of Cell Biochemistry Supplement	1996	8806101	\N	\N
450	Interkeukin-2 induces development of dendritic cells from cord blood CD34+ cells	Kosiban D, Scalise D, Marks S, Lokshin A, Herbert M, Bykovskaja SN, Majores A, Jaja A, Buffo MT, Bunker M, Shogan J, Levitt ML, Evans C, Zhang H	Journal of Leukocyte Biolgoy	1998	9581807	\N	\N
451	Direct production and purification of T7 phage display cloned proteins selected and analyzed on microarrays	Nowak JE, Dryden SC, Chatterjee M, Tainsky MA, Mohapatra S	Biotechniques	2006	16526412	\N	\N
452	TMPRSS2:ERG gene fusion associated with lethal prostate cancer in a watchful waiting cohort.	Andren O, Perner S, Mucci LA, Adami HO, Hoshida Y, Rubin MA, Johansson JE, Chinnaiyan AM, Lee C, Setlur SR, Fall K, Andersson SO, Pawitan Y, Demichelis F, Kantoff PW, Schmidt F, Mosquera JM	Oncogene	2007	17237811	\N	\N
453	Genome-wide promoter analysis uncovers portions of the cancer methylome	Begum S, Yamashita K, Liu J, Lendvai A, Kim MS, Ostrow KL, Poeta ML, Califano J, Sidransky D, Henrique R, Park HL, Van Criekinge W, Jeronimo C, Wisman GB, Rosenbaum E, Ongenaert M, Westra W, Schuuring E, Hoque MO, van der Zee AG	Cancer Research	2008	18413733	\N	\N
454	DCC promoter hypermethylation in esophageal squamous cell carcinoma	Kim MS, Liu J, Yamashita K, Lee J, Mori M, Moon CS, Sidransky D, Westra W, Baek JH, Califano JA, Jiang WW, Carvalho AL, Park HL, Osada M	International Journal of Cancer	2008	18302152	\N	\N
455	Application of Protein Microarrays for Multiplexed Detection of Antibodies to Tumor Antigens in Breast Cancer	Cramer D, Anderson KS, Hainsworth E, Raphael JV, Wong J, LaBaer J, Demirkan G, Logvinenko T, Harris L, Aronzon D, Ramachandran N, Hodi FS	Journal of Proteome Research	2008	18311903	\N	\N
457	Global profiling of gene expression in cancer using genomics and proteomics	Samir M, Hanash	Current Opinion in Molecular Therapeutics	2001	11804268	\N	\N
458	A meeting of minds in proteomics	S, Hanash, L, E and Liotta, Petricoin 3rd	Proteomics	2001	11822353	\N	\N
459	A proteomic approach to the identification of lung cancer markers	F. and Beer, Hanash, S., Brichory, D	Disease Markers	2001	11790896	\N	\N
460	Proteomics in early detection of cancer	Srivastava, S and Wright Jr, GL, Srinivas, Hanash, PR, S	Clinical Chemistry	2001	11568117	\N	\N
462	Proteomic approaches within the NCI early detection research network for the discovery and identification of cancer biomarkers	M, Hanash, Verma, SM, Gopal-Srivastava R, Wrighty Jr, GL, Srivastava S	Annals of the New York Academy of Sciences	2001	11708463	\N	\N
463	Biomedical applications of two-dimensional electrophoresis using immobilized pH gradients: current status	Hanash, SM	Electrophoresis	2000	10786892	\N	\N
464	Operomics: molecular analysis of tissues from DNA to RNA to protein	Hanash, SM	Clinical Chemistry Laboratory Medicine	2000	11097332	\N	\N
465	Integrating cancer genomics and proteomics in the post-genome era	E, Kuick, Rickman, Hanash, D, Bobek, T, MP, Williams, JM, Rouillard, SM, R and Puravs	Proteomics	2002	11788993	\N	\N
466	Operomics: The integrated genomic and proteomic profiling of cells and tissues	Hanash, SM and Beretta, LM	Briefings in Functional Genomics and Proteomics	2002	15251063	\N	\N
467	Immunohistochemistry of pancreatic neoplasia	Kumar S, Baine MJ, Kaur S, Batra SK, Shimizu T	Methods in Molecular Biology (Clifton, N.J.)	2013	23359148	\N	\N
469	Novel biomarkers and therapeutic targets for optimizing the therapeutic management of melanomas	Mimeault M, Batra SK	World journal of clinical oncology	2012	22442756	\N	\N
470	Potentials of plasma NGAL and MIC-1 as biomarker(s) in the diagnosis of lethal pancreatic cancer	Wittel U, Sasson A, Kaur S, Mallya K, Jain M, Singh SK, Chakraborty S, Brand R, Batra SK, Guha S, Baine MJ, Smith LM	PloS one	2013	23383312	\N	\N
471	Analysis of tumor-associated mucin glycotopes by Western transfer methods	Gnanapragassam VS, Jain M, Batra SK	Methods in molecular biology (Clifton, N.J.)	2013	23359164	\N	\N
472	Quantitative real-time PCR expression analysis of peripheral blood mononuclear cells in pancreatic cancer patients	Batra SK, Baine MJ, Mallya K	Methods in molecular biology (Clifton, N.J.)	2013	23359153	\N	\N
473	Tumor suppression by collagen XV is independent of the restin domain	Lewandowska MA, Mutolo MJ, Morris KJ, Leir SH, Hollingsworth MA, Harris A, Caffrey TC	Matrix biology : journal of the International Society for Matrix Biology	2012	22531369	\N	\N
474	Overexpression of ecdysoneless in pancreatic cancer and its role in oncogenesis by regulating glycolysis	Dey P, Batra SK, Gurumurthy CB, Hollingsworth MA, Lele S, Chakraborty S, Band V, Rachagani S, Singh PK, Anderson JM, Zhao X	Clinical cancer research : an official journal of the American Association for Cancer Research	2012	22977192	\N	\N
475	Interplay between smoking-induced genotoxicity and altered signaling in pancreatic carcinogenesis	Wittel UA, Kaur S, Ponnusamy MP, Kumar S, Momi N, Batra SK	Carcinogenesis	2012	22623649	\N	\N
477	Potential role of HE4 in multimodal screening for epithelial ovarian cancer	Forrest RM, Urban N, Kampani AV, Thorpe JD, Scholler N, Bergan LA, O	Journal of the National Cancer Institute	2011	21917606	\N	\N
478	Evaluation of ovarian cancer remission markers HE4, MMP7 and Mesothelin by comparison to the established marker CA125	Urban N, Schummer M, Hellström KE, Gough S, Hellström I, Thorpe J, Drescher C, Forrest R	Gynecologic Oncology	2012	22155417	\N	\N
479	Interpretation of single and serial measures of HE4 and CA125 in asymptomatic women at high risk for ovarian cancer	Urban N, Thorpe J, McIntosh MW, Paley P, Drescher CW, Daly MB, Palomares MR, Karlan BY	Cancer Epidemiology, Biomarkers & Prevention	2012	22962406	\N	\N
483	Designing early detection programs for ovarian cancer	Urban N	Annals of Oncology	2011	22180403	\N	\N
484	Biomarker discovery for heterogeneous diseases	Anderson KS, Labaer J, Wallstrom G	Cancer Epidemiology, Biomarkers & Prevention	2013	23462916	\N	\N
485	A unique proteolytic fragment of alpha1-antitrypsin is elevated in ductal fluid of breast cancer patient	Chan-Li Y, Chan DW, Zhou J, Tsangaris TN, Li J, Shapiro D, Trock B, Friedman NB, Brotzman M	Breast cancer research and treatment	2010	19902353	\N	\N
486	Suppression of annexin A11 in ovarian cancer: implications in chemoresistance	Shih IeM, Chan DW, Zhang Z, Song J	Neoplasia (New York, N.Y.)	2009	19484149	\N	\N
489	Antibody-based detection of ERG rearrangement-positive prostate cancer	Mehra R, Park K, Suleman K, Brenner JC, Srivastava A, Pestano G, Tewari AK, Tomlins SA, Mudaliar KM, Kunju LP, Rubin MA, Chinnaiyan AM, MacDonald T, Nagy D, Sathyanarayana U, Varambally S, Demichelis F, Esgueva R, Chiu YL	Neoplasia (New York, N.Y.)	2010	20651988	\N	\N
491	The neuronal repellent SLIT2 is a target for repression by EZH2 in prostate cancer	Varambally S, Chen G, Wu JY, Li J, Wu L, Grasso C, Palanisamy N, Yu J, Lonigro RJ, Dallol A, Cao Q, Latif F, Cao X, Chinnaiyan AM, Mehra R	Oncogene	2010	20622896	\N	\N
492	Rearrangements of the RAF kinase pathway in prostate cancer, gastric cancer and melanoma	Han B, Ramnarayanan K, Fullen DR, Giordano TJ, Palanisamy N, Bismar TA, LaFargue CJ, Demichelis F, Cao Q, Suleman K, Johnson TM, Banerjee S, Dhanasekaran SM, Rubin MA, Cao X, Chinnaiyan AM, Maher CA, Esgueva R, Ateeq B, Kumar-Sinha C, Greenson JK, Siddiqui J, Varambally S, Moeller P, Pflueger D, Shankar S, Chen YB, Kalyana-Sundaram S, Tomlins SA, Kuefer R, Tan P	Nature medicine	2010	20526349	\N	\N
493	Predicting prostate cancer biochemical recurrence using a panel of serum proteomic biomarkers	Chan DW, Zhang Z, Rosenzweig CN, Partin AW, Sokoll LJ, Osborne K, Sun X	The Journal of urology	2009	19157448	\N	\N
494	Glycoproteomics for prostate cancer detection: changes in serum PSA glycosylation patterns	Meany DL, Zhang Z, Zhang H, Sokoll LJ, Chan DW	Journal of proteome research	2009	19035787	\N	\N
495	Circulating IL-8 and anti-IL-8 autoantibody in patients with ovarian cancer	Gorelik E, Marrangoni AM, Winans M, Modugno F, Velikokhatnaya L, Landsittel D, Nolen BM, Lokshin AE	Gynecologic Oncology	2006	16434085	\N	\N
496	Combined antiangiogenic and immune therapy of prostate cancer	Krasinskas A, Lokshin A, and Gorelik E, Raskovalova T, Huang X, Wolf SF, Watkins S, Devlin J	Angiogenesis	2005	16132614	\N	\N
497	Detection of RNA biomarkers in sputum of lung cancer patients and high risk smokers	Keith R, Bemis L., Mitchell J, Sugita M, Miller Y, Haney J, Franklin W, Kennedy T, Hirsch F	Lung Cancer	2005	N/A	\N	\N
498	Chromosomal aneusomy in sputum predicts for lung cancer in nested case-control study	Miller YE, Franklin W, Byers T, Schulte AP, Varella-Garcia M., Zeng C, Wolf HJ, Baron AE, Hirsch FR, Yin X	Journal of Clinical Oncology	2006	17989344	\N	\N
500	The spectrum of bronchioloalveolar carcinoma (BAC)	Garfield DH, Wislez M, Hirsch FR, Franklin WA, Cadranel JL	Journal of Thoracic Oncology	2006	17409882	\N	\N
501	Multiplexed immunobead-based cytokine profiling for early detection of ovarian cancer	Landsittel DP, Modugno F, Marrangoni AM, Gorelik E, Herberman RB, Winans MT, Lokshin AE, Bigbee WL, Velikokhatnaya L	Cancer Epidemiology, Biomarkers & Prevention	2005	15824174	\N	\N
502	Multianalyte profiling of serum cytokines for detection of pancreatic cancer	Lokshin AE, Gorelik E, Whitcomb D, Moser A, Siegfried JM, Slivka A, Velikokhatnaya L, Bartlett D, Landsittel DP, Lotze MT, Lee K, Papacristou G, Winikoff S, Bigbee WL, Marrangoni AM, Zeh HJ, Winans MT	Cancer Biomarkers	2005	17192050	\N	\N
503	Obesity, adipokines, and prostate cancer in a prospective population-based study	Platz EA, Haffner S, Pollock BH, Ankerst DP, Thompson IM, Troyer D, Lokshin A, Lynch S, Higgins B, Hernandez J, Baillargeon J, Leach RJ, Rose DP	Cancer Epidemiology, Biomarkers & Prevention	2006	16835332	\N	\N
504	High-sensitivity blood-based detection of breast cancer by multi photon detection diagnostic proteomics	Holcman J, Krasik G, Brown LR, Tomaszewski JE, Koenig C, Drukier AK, Schors E, Schnall MD, Sulkowski M, Grigoriev I, Godovac-Zimmermann J, Sainsbury R, Ossetrova N, Lokshin AE	Journal of Proteome Research	2006	16889412	\N	\N
505	Distinctive serum protein profiles involving abundant proteins in lung cancer patients based upon antibody microarray analysis	Hanash SM, Greenberg AK, Gao WM, Orchekowski RP, Qiu J, Kuick R, Rom WN, Haab BB, Omenn GS, Brenner DE, Misek DE	BMC Cancer	2005	16117833	\N	\N
506	Characterization of PacMetUT1, a recently isolated human prostate cancer cell line	deGraffenried LA, Sun LZ, Bedolla R, Adhvaryu SG, Thompson IM, Friedrichs WE, Tang Y, Abboud-Werner S, Troyer DA	The Prostate	2008	18361412	\N	\N
507	Genomic alterations in cultured human embryonic stem cells.	Sui G, Kassauei K, Schulz TC, Sartipy P, Shivapurkar N, Cutler DJ, Gazdar, Liu Y, Carpenter M, Noaksson K, Brimble SN, Hyllner J, AF, Abraham S, Freed WJ, Ikeda M, Stastny VA, Zeng X, Matsui SI, Crook J, Rao M, Arking DE, Maitra A, Colman A, Chakravarti A	Nat Genet	2005	16142235	\N	\N
508	Aberrant methylation of SPARC in human lung cancers.	Hao C, Hiroshima K, Iizasa T, Shivapurkar N, Sathyanarayana UG, Suzuki M, Shigematsu H, Gazdar AF, Takahashi T, Fujisawa T	Br J Cancer	2005	15756262	\N	\N
509	Evidence for alternative candidate genes near RB1 involved in clonal expansion of in situ urothelial neoplasia.	Kuang TC, Yoon DS, Li JZ, Johnston DA, Ptaszynski K, Czerniak B, Zhang RD, Zhou JH, HB, Benedict WF, Sathyanarayana UG, Grossman, Tuziak T, Kim MS, Jeong J, Gazdar AF, Scherer SE, Kram A, Majewski T	Laboratory Investigation	2006	16402033	\N	\N
510	DNA methylation-associated inactivation of TGF-beta related genes DRM/Gremlin, RUNX3, and HPP1 in human cancers.	Frenkel EP, Sunaga N, Suzuki M, Shames DS, Takahashi T, Gazdar AF, Shigematsu H, Iizasa T, Shivapurkar N, Fujisawa T, Minna JD	Br J Cancer	2005	16234815	\N	\N
511	Aberrant promoter methylation of multiple genes during multistep pathogenesis of colorectal cancers.	Nomura M, Shigematsu H, Takahashi T, Meltzer SJ, Suzuki M, Gazdar AF, Yin J, Feng Z, Reddy JL, Shivapurkar N, Augustus M, Zheng Y	International Journal of Cancer	2006	16108009	\N	\N
512	Methylation of apoptosis related genes in the pathogenesis and prognosis of prostate cancer.	T, Gazdar AF, Suzuki M, EP, N, Reddy JL, Takahashi, Shivapurkar, Miyajima K, Shigematsu H, and Frenkel	Cancer Letters	2006	16458425	\N	\N
514	Application of a methylation gene panel by quantitative PCR for lung cancers.	Gazdar AF, Feng Z, Li L, Suzuki M, Zheng Y, Prinsen C, Hol B, Stastny VA, Shivapurkar N, Wistuba II, Thunnissen FB	Cancer Letters	2007	16644104	\N	\N
515	Gefitinib therapy in advanced bronchioloalveolar carcinoma: Southwest Oncology Group Study S0126.	Crowley JJ, Franklin WA, Vance R, Chansky K, Gumerlock PH, McCoy J, Lau DH, West HL, Gandara DR	Journal of Clinical Oncology	2006	16622257	\N	\N
517	Preneoplastic lesions of the lung	Rom WN, Greenberg AK, Yee H	Respir Res	2002	N/A	\N	\N
518	Glucocorticoids inhibit lung cancer cell growth through both the extracellular signal-related pathway and cell cycle regulators	Basu S, Hu J, Reibman J, Yie TA, Greenberg AK, Rom WN, Lee TC, Hay J, Tchou-Wong KM	Am J Respir Cell Mol Biol	2002	12204894	\N	\N
519	Selective P38 activation in human non-small cell lung cancer	Lee TC, Hu J, Greenberg AK, Tchou-Wong KM, Yie TA, Rom WN, Basu S	Am J Respir Cell Mol Biol	2002	11970907	\N	\N
521	N-Hydroxy-4-aminobiphenyl-DNA binding in human p53 gene:  Sequence preference and the effect of C5 cytosine methylation	Beland FA, Rom WN, Tang M-s, Feng Z, Hu W	Biochemistry	2002	12009904	\N	\N
1746	Survival Model Accuracy and ROC Curves	Zheng Y, Heagerty P	Biometrics	2005	15737082	\N	\N
522	4-Aminobiphenyl is a major etiological agent of human bladder cancer: evidence from its DNA binding spectrum in human p53 gene	Tang M-s, Feng Z, Beland FA, Rom WN, Hu W	Carcinogenesis	2002	12376482	\N	\N
523	Chromium exposure enhances polycyclic aromatic hydrocarbon – DNA binding at the p53 gene in human lung cells	Rom W, Tang M-s, Feng Z, Hu W, Costa M	Carcinogenesis	2003	12727806	\N	\N
525	The major CD9 and CD81 molecular partner: Identification and characterization of the complexes	Le Naour F, Faure G, Charrin S, Oualid M, Billard M, Boucheix C, Hanash SM, and Rubinstein E	Journal of Biological Chemistry	2001	11278880	\N	\N
527	History and molecular genetics of Lynch syndrome in Family G	Bonner J, Meister KA, Watson P, Douglas JA, Krush AJ, Lynch HT, Gruber SB	Journal of the American Medical Association	2005	16264161	\N	\N
528	Peptide sequence confidence in accurate mass and time analysis and its use in complex proteomics experiments	and McIntosh M, Hanash S, Law W, May D, Liu Y, Fitzgibbon M, Wang H	Journal of Proteome Research	2008	19367719	\N	\N
529	Technological and statistical barriers to biomarker validation, Invited Commentary	McIntosh M	Nature Biotechnology	2009	N/A	\N	\N
530	Integrating Biomedical Knowledge to Model Pathways of Prostate Cancer Progression	Rhodes DR, Morris DS, Shah RB, Tomlins SA, Mehra R, Chinnaiyan AM	Cell Cycle	2007	17495538	\N	\N
531	Oncomine 3.0: genes, pathways, and networks in a collection of 18,000 cancer gene expression profiles.	Anstet MJ, Kincead-Beal C, Varambally R, Rhodes DR, Ghosh D, Kalyana-Sundaram S, Barrette TR, Varambally S, Kulkarni P, Briggs BB, Chinnaiyan AM, Mahavisno V, Yu J	Neoplasia	2007	17356713	\N	\N
532	Diagnostic markers of ovarian cancer by high-throughput antigen cloning and detection on arrays	Levin NK, Witkins SS, Abrams J, Ali-Fehmi R, Ye B, Wang X, Munkarah A, Tainsky MA, Ionan A, Shirley NN, Nahhas FA, Draghici S, Mohapatra S, Tromp G, Fishman D, Chatterjee M, Lu K, Nowak J, Bawa G, Morris R	Cancer Research	2006	16424057	\N	\N
533	Software platform for rapidly creating computational tools for mass spectrometry-based proteomics	Fang Q, Fitzgibbon M, Law W, May D, and McIntosh M	Journal of Proteome Research	2009	19309175	\N	\N
534	Autoantibody approach for serum-based detection of head and neck cancer	Wojciechowski J, Mohapatra S, Basson MD, Ionan A, Chatterjee M, Pan CJ, Ye B, Talwar HS, Draghici S, Lonardo F, Abrams J, Yoo GH, Tarca AL, Peshek B, Lin HS, Tainsky MA, Folbe AJ	Cancer Epidemiology, Biomarkers & Prevention	2007	18006929	\N	\N
535	Modes of inference for evaluating the confidence of peptide identifications	and McIntosh M, Li Q, Fitzgibbon M	Journal of Proteome Research	2008	18067248	\N	\N
536	Role of the TMPRSS2-ERG gene fusion in prostate cancer	Cao X, Helgeson BE, Prensner JR, Shah RB, Cao Q, Laxman B, Tomlins SA, Chinnaiyan AM, Rubin MA, Yu J, Varambally S, Mehra R	Neoplasia	2008	18283340	\N	\N
537	Next-generation highdensity self-assembling functional protein arrays	Andreas Rolfs, Yanhui Hu & Joshua LaBaer, Niroshan Ramachandran, Manuel G Fuentes, Eugenie Hainsworth, Gokhan Demirkan, Jacob V Raphael	Nature Methods	2008	18469824	\N	\N
538	A first-generation multiplex biomarker analysis of urine for the early detection of prostate cancer.	Chinnaiyan AM, Morris DS, Tsodikov A, Mehra R, Wei JT, Yu J, Siddiqui J, Cao J, Lonigro RJ, Laxman B, Tomlins SA	Cancer Research	2008	18245462	\N	\N
539	Use of cancer-specific yeast-secreted in vivo biotinylated recombinant antibodies for serum biomarker discovery	Scholler N, Wells L, Loch CM, Garvik B, Gross JA, and Urban N, McIntosh MW, Liu Y, Ramirez AB, Lampe PD	Journal of Translational Medicine	2008	18652693	\N	\N
540	Comparison of total PSA and derivative levels in a screening population of African-American, Caucasian, and Korean-American men.	Partin AW, Sokoll LJ, Gurganus R, Khan MA, Mangold LA, and Veltri RW., Park J, Bruzek DJ, Chan DW	Clinical Prostate Cancer	2004	15040861	\N	\N
541	RAD51 135G&#062;C modifies breast cancer risk among BRCA2 mutation carriers: Results from a combined analysis of 19 studies	Coupier I, Domcheck SM, Simard J, Léoné M, Sinilnikova OM, Belotti M, Lynch HT, Rebbeck TR, Bignon Y-J, Antoniou AC, and 65 more authors, Neuhausen SL, Dumont M, Bonadona V, Stoppa-Lyonett D, Lasset C, Barjhoux L, Struewing JP, Hughes DJ, Wagner T, Genetic Modifiers of Cancer Risk in BRCA1/2 Mutation Carriers Study (GEMO)	American Journal of Human Genetics	2007	17999359	\N	\N
542	S-adenosylmethionine as a biomarker for the early detection of lung cancer.	Rom WN, Rimal B, Zafar S, Hung J, Phalan B, Eylers E, Felner K, Goldberg JD, Naidich D, Zhang M, Crawford B, Merali S., Greenberg AK	CHEST	2007	17934114	\N	\N
543	Prediction of PSA Recurrence in Men with 12 years Post-prostatectomy Follow-up.	Veltri RW, Isharwal S, Partin AW, BS., Marlow C, Makarov DV, Miller MC	Cancer Epidemiology, Biomarkers & Prevention	2008	18199716	\N	\N
548	Proteomic analysis of Dunning Prostate Cancer Cell Lines with Variable Metastatic Potential using SELDI-TOF.	and Veltri RW., Gretzer MB, Rosenzweig JM, Chan DW, Mangold LA, van Rootselaar CL, Dalrymple S, Partin AW	The Prostate	2004	15264244	\N	\N
549	Stromal-Epithelial Measurements of Prostate Cancer in Native Japanese and Japanese-American Men.	Jae Park, Munekado Kojima, Veltri, Leonard S. Marks, M.C. Miller, and Alan W. Partin., Cameron van Rootselaar, Masood A. Khan, RW	The Prostate	2004	15303120	\N	\N
550	Aquaporin 1 is overexpressed in lung cancer and stimulates NIH-3T3 cell proliferation and anchorage-independent growth	Lee,J, Saoria,JC, Desmaze,C, Upadhyay,S, Moon,C, Trink,B, Sidransky,D, Woo,J, Mai,L, Lee,T, Jang,SJ, Hoque,MO, Monitto,C	American Journal of Pathology	2006	16565507	\N	\N
551	PGP9.5 methylation in diffuse-type gastric cancer	Osada,M, Park,HL, Kim,MS, Inoue,H, Sidransky,D, Tokumaru,Y, Yamashita,K, Mori,M	Cancer Research	2006	16585221	\N	\N
552	RASSF1A hypermethylation and its inverse correlation with BRAF and/or KRAS mutations in MSI-associated endometrial carcinoma	Seo,SS, Dong, Park,SY, Jeon,ES, Kim,HS, SM, Sidransky,D, Kim,H, Lee,S, Kang,S, Lee,JM	International Journal of Cancer	2006	16619251	\N	\N
553	Assessment of gene promoter hypermethylation for detection of cervical neoplasia	Reesink-Peters,N, Nijhuis,ER, Volders,HH, Koning,AJ, Schuuring,E, Hoque,MO, Buikema,HJ, Hollema,H, Boezen,HM, Sidransky,D,, Wisman,GB	International Journal of Cancer	2006	16736496	\N	\N
554	Quantitation of promoter methylation of multiple genes in urine DNA and bladder cancer dectection	Sidransky,D, Schoenberg,M, Topaloglu,O, Zahurak,M, Hoque,MO, Chatterjee,A, Begum,S, Goodman,SN, Van Criekinge,W, Rosenbaum,E, Westra,WH	Journal of the National Cancer Institute	2006	16849682	\N	\N
556	Mitochondrial DNA mutations in human cancer	Chatterjee,A, Mambo,E, Sidransky,D	Oncogene	2006	16892080	\N	\N
557	Detection of aberrant methylation of four genes in plasma DNA for the detection of breast cancer	Hoque,MO, Toure,P, Rosenbaum,E, Sidransky,D, Trink,B, Kiviat,NB, Wood,T, Stern,J, Yu,M, Dem,A, Hawes,SE, Feng,Q, Jeronimo,C, Critchlow,CW	J Clin Oncol	2006	16908936	\N	\N
1747	Evaluating technologies for classification and prediction in medicine	Pepe MS	Statistics in Medicine	2005	16320261	\N	\N
558	LKB1/STK11 Suppresses Cyclooxygenase-2 Induction and Cellular Invasion through PEA3 in Lung Cancer	Upadhyay,S, Chatterjee,A, Kim,MS, Trink,B, Engles,J, Ratovitski,E, Sidransky,D, Westra,W, Hoque,MO, Liu,C	Cancer Research	2006	16912160	\N	\N
559	An oligonucleotide microarray for high-throughput sequencing of the mitochondrial genome	Kassauei,K, Califano,J, Zhou,S, Maitra,A, Cutler,DJ, Kennedy,GC, Sidransky,D	J Mol Diagn	2006	16931588	\N	\N
560	Serum SELDI-TOF-MS expression profiling and Luminex Xmap® marker panel classification analysis for pancreatic cancer.	Bartlett DL, Lotze MT, Bigbee WL., Zeh HJ III, Siegfried JM, Malehorn DE, Winikoff SE, Lokshin AE	Proceedings of American Association for Cancer Research	2004	N/A	\N	\N
561	Serum proteomic patterns for the diagnosis of lung cancer.	Shyr Y, Massion PP., Caprioli RM, Bigbee WL, Carbone DP, Yildiz P, Ninan M, Johnson DH, Moore JH, Rahman SMJ, Siegfried JM	Proceedings of American Association for Cancer Research	2004	N/A	\N	\N
562	Serum protein expression profiling for cancer detection: validation of a SELDI-based approach for prostate cancer.	Verma M, Johnsey D, Semmes OJ, Thornquist MD, Adam BL, Zhang Z, McCarthy DB, Bigbee WL, Leach RJ, Zou Z., Grizzle WE, Kagan J, Conrads TP, Srivastava S, Carroll C, Jendoubi M, Izbicka E, Thompson IM, Feng Z	Disease Markers	2004	15258333	\N	\N
563	Head and neck cancer early detection and classification using SELDI-TOF-MS serum protein expression profiling.	Siegfried JM, Bigbee WL., Ferris RL, Malehorn DE	Proceedings of American Association for Cancer Research	2004	20359086	\N	\N
564	Feature selection for classification of SELDI-TOF-MS proteomic profiles.	Zeh HJ, III, Lotze MT, Malehorn DE, Pelikan R, Bigbee WL, Hauskrecht M, Whitcomb DC, Lyons-Weiler J.	Applied Bioinformatics	2005	16309341	\N	\N
565	Multiplexed analysis of serum cytokines as clinical biomarkers of disease in patients with SCCHN.	Gooding W, Hathaway B, Whiteside TL, Bigbee WL, Siegfried J, Landsittel D, Grandis JR, Ferris RL.	Laryngoscope	2005	15744170	\N	\N
569	Novel dual-color immunohistochemical methods for detecting ERG-PTEN and ERG-SPINK1 status in prostate carcinoma	Rubin MA, Christopherson K, Siddiqui J, Palanisamy N, Park K, Tomlins SA, Kunju LP, Pestano GA, Carskadon S, Bhalla R, Cortez C, Mosquera JM, Chinnaiyan AM	Modern pathology : an official journal of the United States and Canadian Academy of Pathology, Inc	2013	23348902	\N	\N
570	Epigenomic alterations in localized and advanced prostate cancer	Elemento O, Tewari AK, Garraway LA, Beltran H, Sboner A, Park K, Giannopoulou EG, Rubin MA, Lin PC, Mosquera JM	Neoplasia (New York, N.Y.)	2013	23555183	\N	\N
571	Correlation of urine TMPRSS2:ERG and PCA3 to ERG+ and total prostate cancer burden	Kunju LP, Chinnaiyan AM, Tomlins SA, Young A, Palanisamy N, Wei JT, Wood DP, Siddiqui J	American journal of clinical pathology	2012	23086769	\N	\N
572	Role of transcriptional corepressor CtBP1 in prostate cancer progression	Schumann TE, Ateeq B, Mehra R, Lonigro RJ, Otte AP, Nyati MK, Cao Q, Rubin MA, Menawat R, Wang R, Asangani IA, Kunju LP, Pienta KJ, Zheng H, Chinnaiyan AM, Varambally S, Jing X, Dhanasekaran SM, Chakravarthi BV, Tomlins SA, McGregor N, Mani RS, Palanisamy N, Camacho DF, Siddiqui J	Neoplasia (New York, N.Y.)	2012	23097625	\N	\N
574	Characterization of the EZH2-MMSET histone methyltransferase regulatory axis in cancer	Zhao M, Kumar-Sinha C, Chinnaiyan AM, Cao X, Siddiqui J, Dodson L, Ateeq B, Kim JH, Iyer MK, Maher CA, Kunju LP, Asangani IA, Pandhi M, Cao Q, Qin ZS, Lonigro RJ, Mehra R, Varambally S, Palanisamy N, Wu YM	Molecular cell	2013	23159737	\N	\N
575	Epigenetic repression of miR-31 disrupts androgen receptor homeostasis and contributes to prostate cancer progression	Mosquera JM, Tewari AK, Demichelis F, Banerjee S, Chiu YL, Beltran H, Lin PC, Rubin MA, Giannopoulou E, Alves P, Melnick AM, Elemento O, Gerstein MB, Park K	Cancer research	2013	23233736	\N	\N
576	New strategies in prostate cancer: translating genomics into the clinic	Rubin MA, Beltran H	Clinical cancer research : an official journal of the American Association for Cancer Research	2013	23248095	\N	\N
577	Identification of recurrent NAB2-STAT6 gene fusions in solitary fibrous tumor by integrative sequencing	Antonescu CR, Kalyana-Sundaram S, Roychowdhury S, Siddiqui J, Cao X, Chen CL, Iyer MK, Chinnaiyan AM, Kunju LP, Singer S, Schuetze SM, Robinson DR, Pienta KJ, Su F, Wang R, Zhang L, Sung YS, Mosquera JM, Wu YM, Lonigro RJ, Talpaz M	Nature genetics	2013	23313952	\N	\N
578	Concurrent AURKA and MYCN gene amplifications are harbingers of lethal treatment-related neuroendocrine prostate cancer	Robinson BD, Nanus DM, MacDonald TY, Perner S, Beltran H, Nelson JB, Mosquera JM, Park K, Tagawa ST, Dhir R, Bismar TA, Rubin MA, Erbersdobler A	Neoplasia (New York, N.Y.)	2013	23358695	\N	\N
579	Current status of molecular markers for early detection of sporadic pancreatic cancer	Batra SK, Baine MJ, Chakraborty S, Sasson AR	Biochimica et biophysica acta	2011	20888394	\N	\N
581	MUC4 down-regulation reverses chemoresistance of pancreatic cancer stem/progenitor cells and their progenies	Mimeault M, Johansson SL, Senapati S, Chakraborty S, Batra SK, Momi N	Cancer letters	2010	20303649	\N	\N
582	Elevated serum neutrophil gelatinase-associated lipocalin is an early predictor of severity and outcome in acute pancreatitis	Muddana V, Chakraborty S, Papachristou GI, Whitcomb D, Kaur S, Wittel UA, Batra SK, Brand RE, Sharma N	The American journal of gastroenterology	2010	20179686	\N	\N
583	Activated Kras(G12D) is associated with invasion and metastasis of pancreatic cancer cells through inhibition of E-cadherin	Rachagani S, Smith LM, Batra SK, Jain M, Senapati S, Chakraborty S, Ponnusamy MP, Kumar S	British journal of cancer	2011	21364589	\N	\N
585	Role of mucins in the skin during benign and malignant conditions	Chakraborty S, Swanson BJ, Batra SK, Bonthu N	Cancer letters	2011	21146919	\N	\N
586	Novel INTeraction of MUC4 and galectin: potential pathobiological implications for metastasis in lethal pancreatic cancer	Chaney WG, Senapati S, Batra SK, Chaturvedi P, Sasson AR, Chakraborty S, Gnanapragassam VS	Clinical cancer research : an official journal of the American Association for Cancer Research	2011	21059814	\N	\N
587	MicroRNA in pancreatic cancer: pathological, diagnostic and therapeutic implications	Rachagani S, Batra SK, Kumar S	Cancer letters	2010	20004512	\N	\N
588	Mucin-interacting proteins: from function to therapeutics	Das S, Batra SK, Senapati S	Trends in biochemical sciences	2010	19913432	\N	\N
589	Cigarette smoking is strongly associated with mutation of the K-ras gene in patients woth primary adenocarcinoma of the lung	YR, Yang,SC, Kajdacsy-Balla,A, Sidransky,D, Demeure,MJ, Sanchez-Cespedes,M, Zhu Yr, Alawi,EA, Ahrendt,SA, Decker,PA, Haasler,GB	Cancer	2001	11745231	\N	\N
590	Adenomatous polyposis coli gene promoter hypermethylation in non-small cell lung cancer is associated with survival	Sidransky,D, Singer,J, Brabender,J, Holscher,AH, Park,J, Salonga,D, Schneider,PM, Usadel,H, Lum,CE, Wickramasinghe,K, Metzger,R, Meltzer,SJ, Lord,RV, Danenberg,PV, Danenberg,KD	Oncogene	2001	11429699	\N	\N
591	Loss of chromosome arms 3p and 9p and inactivation of P16 (INK4a) in normal epithelium of patients with primary lung cancer	White,P, Herman,JG, Westra,WH, Cohen,D, Lengauer,C, Sidransky,D, Caballero,OL, Bonacum,J, Engles,J, Esteller,M, Liu,Q, Yochem,R	Genes, Chromosomes & Cancer	2001	11550279	\N	\N
592	Molecular detection of prostate cancer in urine by GSTP1 hypermethylation	Chow,NH, Jeronimo,C, Wu,L, Esteller,M, Schoenberg,M, Sanchez-Cespedes,M, Sidransky,D, Cairns,P, Westra,WB, Herman,JG, Grasso,M	Clinical Cancer Research	2001	11555585	\N	\N
593	Methylation status in the promoter region of the human PGP9.5 gene in cancer and normal tissues	Bittencourt Rosas,SL, Caballero,OL, Jen,J, Dong,SM, Sidransky,D, daCostaCarvalho Mda,G	Cancer Letters	2001	11448537	\N	\N
594	Promoter hypermethylation of multiple genes in carcinoma of the uterine cervix	Kim,HS, Rha,SH, Dong,SM, Sidransky,D	Clinical Cancer Research	2001	11448914	\N	\N
595	Nucleotide substitution in the ectodomain of trail receptor DR4 is associated with lung cancer and head and neck cancer	Aplenc,R, Sidransky,D, El-Deiry,WS, Fisher,MJ, Virmani,AK, Wu,L, Powell,SM, JC, Rebbeck,TR, Harper, Gazdar,AF	Clinical Cancer Research	2001	11410508	\N	\N
596	Increased loss of chromosome 9p21 but not p16 inactivation in primary non-small cell lung cancer from smokers	Sanchez-Cespedes,M, Westra, Decker,PA, Alawi,EA, Demeure,MJ, WH, Esteller,M, Doffek,KM, Ahrendt,SA, Sidransky,D, Herman,JG	Cancer Research	2001	11280771	\N	\N
598	Predicting prostate cancer risk through incorporation of prostate cancer gene 3	Day JR, Parekh D, Ankerst DP, Groskopf J, Pollock BH, Leach RJ, Rittenhouse H, Blase A, Tangen C, Thompson I	The Journal of Urology	2008	18707724	\N	\N
599	Oncogene-induced Nrf2 transcription promotes ROS detoxification and tumorigenesis	Iacobuzio-Donahue C, Frese K, Humpton TJ, Tuveson DA, Mangal D, Scrimieri F, Hruban RH, Winter JM, Kern SE, Wei C, DeNicola GM, Blair IA, Karreth FA, Yu KH, Calhoun ES, Gopinathan A, Yeo CJ	Nature	2011	21734707	\N	\N
600	The association of body mass index and prostate-specific antigen in a population-based study	Baillargeon J, Basler J, Hernandez J, Kristal AR, Thompson I, Troyer D, Bradshaw P, Rozanski T, Higgins B, Pollock BH, Lynch S	Cancer	2005	15668913	\N	\N
601	Yearly prostate specific antigen and digital rectal examination fluctuations in a screened population	Miyamoto R, Parekh DJ, Ankerst DP, Thompson IM, Pollock BH, Nair PV	The Journal of Urology	2009	19286205	\N	\N
602	Confounding effects of hormone replacement therapy in protein biomarker studies	Pitteri SJ, Hanash SM	Cancer epidemiology, biomarkers & prevention : a publication of the American Association for Cancer Research, cosponsored by the American Society of Preventive Oncology	2011	21037107	\N	\N
603	Cellular features of senescence during the evolution of human and murine ductal pancreatic cancer	Hruban RH, Tuveson DA, Jacobetz MA, Martins CP, Maitra A, DeNicola GM, Caldwell ME	Oncogene	2012	21860420	\N	\N
604	Intact-protein analysis system for discovery of serum-based disease biomarkers	Hanash S, Wang H	Methods in molecular biology (Clifton, N.J.)	2011	21468941	\N	\N
605	The reactive tumor microenvironment: MUC1 signaling directly reprograms transcription of CTGF	Bailey JM, Grandgenett PM, Singh PK, Yi CH, Yu F, Hollingsworth MA, Behrens ME	Oncogene	2010	20697347	\N	\N
606	Complete suppression of tumor formation by high levels of basement membrane collagen	Harris H, Hollingsworth MA, Harris A	Molecular cancer research : MCR	2007	18171981	\N	\N
607	Semaphorin 3B and 3F single nucleotide polymorphisms are associated with prostate cancer risk and poor prognosis	Baillargeon J, Garcia D, He X, Canby-Hagino E, Troyer DA, Thompson IM, Naylor SL, Beuten J, Leach RJ, Balic I, Brand TC, Hernandez J	The Journal of Urology	2009	19683737	\N	\N
608	Androgen receptor length polymorphism associated with prostate cancer risk in Hispanic men	Balic I, Johnson-Pais TL, Pollock BH, Troyer DA, Thompson IM, Higgins BA, Leach RJ, Graham ST	The Journal of Urology	2002	12394768	\N	\N
609	Contribution of metabolizing enzymes and DNA repair in increasing risk of lung cancer among females.	Siegfried JM, Gaither-Davis A, Lerdtragool S, Romkes M., Yang P	Proceedings of American Association for Cancer Research	2003	N/A	\N	\N
610	Combinations of genetic polymorphisms for XPD and metabolizing enzymes are associated with elevated lung cancer risk.	Siegfried JM, Yang P, Gaither-Davis A, Lerdtragool S, Romkes M.	Proceedings of American Association for Cancer Research	2003	N/A	\N	\N
611	Nuclear matrix protein alterations associated with colon cancer metastasis to the liver.	Bauer AJ, Getzenberg RH., Brünagel G, Schoen RE, Vietmeier BN	Clinical Cancer Research	2002	1237467	\N	\N
613	Identification of calreticulin as a nuclear matrix protein associated with human colon cancer.	Brünagel G, Schoen RE, Getzenberg RH., Shah U	Journal of Cellular Biochemistry	2003	12704787	\N	\N
615	GRPR expression in head and neck squamous cell carcinogenesis.	Dyer K, Shriver S, Rubin Grandis J., Siegfried JM	Proceedings of American Association for Cancer Research	2000	19536772	\N	\N
616	Increased GRPR expression early in head and neck carcinogenesis.	Siegfried JM, Rubin-Grandis JR., Lango MN, Dyer KF, Gooding WE	Proceedings of American Association for Cancer Research	2001	N/A	\N	\N
617	Gastrin-releasing peptide receptor-mediated autocrine growth in squamous cell carcinoma of the head and neck.	Lui VW, Lango MN, Grandis JR., Siegfried JM, Gooding WE, Gubish C, Dyer KF	Journal of the National Cancer Institute	2002	11880476	\N	\N
618	Identification of nuclear matrix protein alterations associated with human colon cancer.	Schoen RE, Vietmeier BN, Bauer AJ, Getzenberg RH., Brünagel G	Cancer Research	2002	11956108	\N	\N
619	Polymorphism of DNA ligase I and risk of lung cancer - A case-control analysis	Spitz MR, Shen H, Hong WK, Qiao Y, Wei Q, Zheng Y	Lung Cancer	2002	12009232	\N	\N
620	Restoring E-cadherin expression increases sensitivity to epidermal growth factor receptor inhibitors in lung cancer cell lines.	Helfrich B, Girard L, Hirsch FR, Baron A, Gazdar AF, Dziadziuszko R, Chan DC, Ravdel L, Coldren CD, Hedman K, Franklin W, Chan Z, Drabkin HA, Minna JD, Gemmill RM, Witta SE, Bunn PA Jr., Sugita M	Cancer Research	2006	16424029	\N	\N
623	Promoter characterization of Semaphorin SEMA3F, a tumor suppressor gene.	Potiron V, Roche J., Zeng C, Drabkin HA, Franklin W, Brambilla E, Kusy S, Minna J	Biochim Biophys Acta	2005	16005989	\N	\N
624	High prevalence of occult endobronchial malignancy in high risk patients with moderate sputum atypia.	Franklin WA, Shroyer KR, Dempsey EC, Cook R, Miller YE., Kennedy TC, Merrick TA, Keith RL, Byers T, Prindiville SA, Hirsch FR, Bunn PA Jr, Petty TL	Lung Cancer	2005	16022912	\N	\N
625	Analysis of orthologous gene expression between human pulmonary adenocarcinoma and a carcinogen-induced murine model.	Zerbe L, Franklin WA, Merrick DT, Blaine SA, Dwyer-Nield L, Johnson GL, Hirsch FR, Keith RL, Stearman RS, Nemenoff RA, Chan Z, Baron AE, Malkinson AM, Bunn PA Jr, Geraci MW.	American Journal of Pathology	2005	16314486	\N	\N
626	HER3 genomic gain and sensitivity to gefitinib in advanced non-small-cell lung cancer patients.	Ceresoli GL, Magrini E, Bemis L, Cappuzzo F, Domenichini I, Ludovini V, Cancellieri A, Bunn PA Jr, Franklin WA, Crino L, Varella-Garcia M., Bartolini S, Rossi E, Toschi L, Hirsch FR	British Journal of Cancer	2005	16288303	\N	\N
627	Structural And Numerical Chromosomal Abnormalities In Bronchial Cells From Heavy Smokers	Miller YE, Kennedy TC, Chen -L, Franklin WA, Mitchell JD, Powell RL, Varella-Garcia M, Keith R, Hirsch FR	American Journal of Respiratory And Critical Care Medicine	2007	17600274	\N	\N
628	Baseline gene expression predicts sensitivity to gefitinib in non-small cell lung cancer cell lines	Zeng C, Helfrich BA, Geraci MW, Barón A, Coldren C, Hirsch FR, Lapadat R, Bunn PA Jr., Sugita M, Witta SE, Franklin WA	Molecular Cancer Research	2006	16877703	\N	\N
629	Moving to the routine management of pre symptomatic lung cancer.  Lung Cancer.	Mulshine JL, Tockman MS, De Luca LM, Tauler J, Placke ME, Martinez A, Hong S, and Cuttitta F., Avis I	Lung Cancer	2001	11720735	\N	\N
630	Lung cancer evolution to preinvasive management	Cuttitta F, Tockman MS, and De Luca LM., Mulshine JL	Clinical Chest Med.	2002	11901918	\N	\N
631	The human 9-oxoguanine DNA N-glycosylase 1 (hOGG1) DNA repair enzyme and its association with lung cancer risk.	Park J, Elahi A, Lazarus P., Tockman MS, Chen L	Pharmacogenetics	2004	15077011	\N	\N
632	Genetic analysis of microsomal epoxide hydrolase gene and its association with lung cancer risk.	Park J, Elahi A, Chen L, and Tockman MS., Lazarus P	European Journal of Cancer and Prevention.	2004	15901990	\N	\N
633	Data mining techniques for cancer detection using serum proteomic profiling.	Tockman MS, Li L, Wu Z, Tang H, Gong J, Gruidl M, Clark RA., Zhou J	Artificial Intelligence in Medicine	2004	15364092	\N	\N
634	Discovery of distinct protein profiling specific for lung tumors and pre-malignant lung lesions by SELDI mass spectrometry.	Tockman MS., Zhukov TA, Johanson R	Proceedings of American Association for Cancer Research	2002	N/A	\N	\N
635	Heterogeneous Ribonucleoprotein (hnRNP) Antibody in Thyroid Neoplasia.	Tannenbaum M, and Tockman MS., Zhukov TA, Bidot P, Morgan MB	American Assoc of Clin Endocrinologists	2000	11421561	\N	\N
637	Data reduction using a discrete wavelet transform in discriminant analysis of very high dimensional data	Cazares L, Feng Z, Schellhammer PF, Adam BL, Potter JD, Yasui Y, Wright GL, Qu Y, Thornquist M, Clements MA, Thompson ML, Davis J	Biometrics	2003	12762451	\N	\N
638	A novel approach towards development of a rapid blood test for breast cancer	Semmes OJ, Wilson L, Perry RR, Wright GL, Faranga C, Fournier K, Vlahou A, Gregory B	Clinical Breast Cancer	2003	14499014	\N	\N
641	A strategy for the comparative analysis of serum proteomes for the discovery of biomarkers for hepatocellular carcinoma	Seeholzer SH, London WT, Dwek R and Block TM, Steel LF, Trotter M, Shumpert D, Evans AA	Proteomics	2003	12748940	\N	\N
642	A proteomic approach for the discovery of early detection markers of hepatocellular carcinoma	London WT and Block T, Mehta A, Mattu TS, Steel LF, Dwek R, Evans AA, Hebestreit H	Disease Markers	2001	11790885	\N	\N
643	Observational studies, clinical trials and the Women&#39;s Health Initiative.	Prentice RL	Lifetime Data Analysis	2007	17943443	\N	\N
644	Non-traditional immunogens and their application to immunotherapy.	Tainsky MA., Chatterjee M	Current Opinion in Molecular Therapeutics	2008	18228183	\N	\N
645	Methods for Assessing Improvement in Specificity When a Biomarker is Combined with a Standard Screening Test	Etzioni R, Shaw PA, Pepe MS, Alonzo TA	Statistics in Biopharmaceutical Research	2009	20054437	\N	\N
646	Genomic and proteomic biomarkers for cancer: A multitude of opportunities.	Tainsky MA	Biochim Biophys Acta	2009	19406210	\N	\N
647	Discovery of antibody biomarkers using protein microarrays of tumor antigens cloned in high throughput.	Tainsky MA., Wojciechowski J, Chatterjee M	Methods Mol Biol.	2009	19381945	\N	\N
648	Analysis of the Expression of Human Tumor Antigens in Ovarian Cancer Tissues	Bryant CS, Alekseev OM, Shah J, Morris R, Tainsky MA, Abrams J, Hewitt SM, Munkarah A, Ionan A, Ali-Fehmi A, Chatterjee M, Bandyopadhyay S, Levin NK, O’Rand MG, Arabi H	Cancer Biomarkers	2009	20164540	\N	\N
649	CYP1B1 variants are associated with prostate cancer in non-Hispanic and Hispanic Caucasians	Johnson-Pais TL, Leach RJ, Balic I, Price DK, Thompson IM, Crandall AC, Beuten J, Gelfond JA, Byrne JJ	Carcinogenesis	2008	18544568	\N	\N
650	Characterization of TMPRSS2:ETV5 and SLC45A3:ETV5 gene fusions in prostate cancer	Laxman B, Helgeson BE, Shah N, Tomlins SA, Chinnaiyan AM, Cao Q, Montie JE, Singla N, Mehra R, Prensner JR, Varambally S, Cao X	Cancer Research	2008	18172298	\N	\N
651	A polycomb repression signature in metastatic prostate cancer predicts cancer outcome.	Chen G, Cao X, Varambally S, Ghosh D, Rhodes DR, Mehra R, Chinnaiyan AM, Wang X, Yu J, Tomlins SA, Pienta KJ, Shah RB	Cancer Research	2007	18006806	\N	\N
652	Single and multivariate associations of MSR1, ELAC2, and RNASEL with prostate cancer in an ethnic diverse cohort of men	Gelfond JA, Leach RJ, Shook S, Johnson-Pais TL, Beuten J, Franke JL, Thompson IM	Cancer Epidemiology, Biomarkers & Prevention : A Publication of the American Association for Cancer Research, cosponsored by the American Society of Preventive Oncology	2010	20086112	\N	\N
653	Distinct classes of chromosomal rearrangements create oncogenic ETS gene fusions in prostate cancer.	Varambally S, Cao Q, Menon A, Jing X, Han B, Mehra R, Montie JE, Pienta KJ, Dhanasekaran SM, Shah RB, Rubin MA, Laxman B, Roulston D, Morris DS, Cao X, Tomlins SA, Chinnaiyan AM, Helgeson BE, Yu J, Wang L	Nature	2007	17671502	\N	\N
654	[-2]proPSA for Prostate Cancer Detection: an NCI Early Detection Research Network Validation Study	Partin AW, Feng Z, Chan DW, Thompson IM, Kagan J, Sanda MG, Sokoll LJ, Wang Y	Journal of Urology	2008	18550118	\N	\N
655	Integrative genomics analysis reveals silencing of beta-adrenergic signaling by polycomb in prostate cancer	Laxman B, Shen R, Cao Q, Morris DS, Chen G, Tomlins SA, Shah RB, Dhanasekaran SM, Mehra R, Marquez VE, Ghosh D, Chinnaiyan AM, Yu J, Varambally S, Creighton CJ	Cancer Cell	2007	17996646	\N	\N
656	Integrative analysis of genomic aberrations associated with prostate cancer progression.	Ghosh D, Chinnaiyan AM, Gu W, Pienta KJ, Kumar-Sinha C, Shedden K, Dhanasekaran SM, Wang L, Cao X, Mehra R, Montie JE, Dash A, Kim JH, Rubin MA, Tomlins SA, Yu J, Shah RB	Cancer Research	2007	17804737	\N	\N
657	Multiple Independent Genetic Variants in the 8q24 Region are Associated with Prostate Cancer Risk	Stanford JL, Ostrander EA, Karyadi DM, Salinas CA, Carlson C, Kwon E, Feng Z, Koopmeiners JS	Cancer Epidemigology, Biomarker, and Prevention	2008	18483343	\N	\N
658	Ulcerative colitis as a disease of accelerated colon aging: evidence from telomere attrition and DNA damage	Mandelson MT, Brentnall TA, Lai LA, Rabinovitch PS, Risques RA, Li L, Feng Z, Potter JD, Bronner MP, Gallaher J	Gastroenterology	2008	18519043	\N	\N
659	Polymorphisms in steroid hormone biosynthesis genes and risk of breast cancer and fibrocystic breast conditions in Chinese women	Blackston C, Thomas D, Chen C, Sakoda L, Feng Z, Gao DL, Doherty J, Lin MG, Ray R, Stalsberg H	Cancer Epidemiology, Biomarkers & Prevention	2008	18483327	\N	\N
660	Polymorphisms of the DNA repair gene XRCC1 and lung cancer risk	Erozan Y, Taylor, Tangrea JA, Barrett MJ, Ratnasinghe D, PR, Giffen CA, Tockman MS, Andersen MR, Qiao YL, Yao SX	Cancer Epidemiology, Biomarkers & Prevention	2001	11219768	\N	\N
661	Microsatellite Instability at AAAG Repeat Sequences in Respiratory Tract Cancer	Jen J, Tockman MS, Spafford M, Xu L, Lee SM, Ahrendt SA, Sidransky D, Eisenberger C, Chow J, Bonacum J, Piantadosi S, Wu L	International Journal of Cancer	2001	11146445	\N	\N
664	Model checking for ROC regression analysis	Cai T, Zheng Y	Biometrics	2007	17447940	\N	\N
665	The risk of extra-colonic, extra-endometrial cancer in the Lynch syndrome	Bernstein I, Mecklin JP, Vasen HF, Järvinen HJ, Myrhøj T, Wijnen JT, Lynch HT, Sunde L, Aarnio M, Watson P	International Journal of Cancer	2008	18398828	\N	\N
667	Mutational load distribution analysis yields metrics reflecting genetic instability during pancreatic carcinogenesis	Ladner D, Topazian M, Costa J, Lynch H, Tuck D, Lizardi P, Deters C, Brand R, Capella G, Moreno V, Tarafa G	Proc Natl Acad Sci USA	2008	18337498	\N	\N
668	Immunology and the Lynch syndrome	Lynch HT, Drescher KM, de la Chapelle A	Gastroenterology	2008	18395102	\N	\N
669	Downregulation of death-associated protein kinase 1 (DAPK1) in chronic lymphocytic leukemia	Jansen M, de Jong PJ, Matkovic JJ, Plass C, Lynch H, Weisenburger D, Murray F, Perko JD, Beck S, de la Chapelle A, Byrd JC, Lucas DM, Hackanson B, Lin TS, Coggill P, Tanner SM, Chen S-S, Angerman EB, Watson P, Grever MR, Lynch J, Kipps TJ, Yoshinaga Y, Raval A, Rosenquist R, Sanger W	Cell	2007	17540169	\N	\N
670	Who should be sent for genetic testing in hereditary colorectal cancer syndromes?	Lynch PM, Rodriguez-Bigas MA, Boland CR, Lynch HT, Amos C, Lynch JF	Journal of Clinical Oncology	2007	17687158	\N	\N
671	Hereditary cancer syndrome diagnosis: molecular genetic clues and cancer control	Lynch HT, Lynch JF, Fusaro RM	Future Oncology	2007	17381417	\N	\N
672	Toward a consensus in molecular diagnosis of hereditary nonpolyposis colorectal cancer (Lynch syndrome)	Lynch PM, Lynch HT, Lynch JF	Journal of the National Cancer Institute	2007	17312298	\N	\N
673	Inactivation of cyclin D2 gene in prostate cancers by aberrant promoter methylation	Minna JD and Gazdar AF, Suzuki M, Maruyama R, Sathyanarayana UG, Padar A, Hsieh JT, Frenkel EP	Clinical Cancer Research	2003	14581343	\N	\N
675	Quantitative detection of promoter hypermethylation as a biomarker of acyte kidney injury during transplantation	Rahman,MH, Hoque,MO, Kraus,E, Sidransky,D, Montgomery,R, Ugarte,R, Rabb,H, Melancon,K, Mehta,TK	Transplant Proc	2006	17175292	\N	\N
677	Increased expression and activity of repair genes TDP1 and XPF in non-small cell lung cancer	Zhou,S, Califano,JA, Westra,WH, Sidransky,D, Begum,S, Brock,M, Liu,C	Lung Cancer	2007	17118488	\N	\N
678	Dysfunctional KEAP1-NRF2 interaction in non-small-cell-lung cancer	Gabrielson,E, Singh,Am Misra,V, Lee,H, Baylin,SB, Herman,JG, Brock,MV, Ames,S, Sidransky,D, Biswal,S, Thimmulappa,RK, Hoque,MO	PLoS Med	2006	17020408	\N	\N
679	Smoke exposure, histologic type and geography-related differences in the methylation profiles of non-small cell lung cancer	Virmani AK, Fukuyama Y, Zochbauer-Muller S, Feng Z, Shimizu K, Sugio K, Chen CY, Minna JD and Gazdar AF, Gilcrease M, Toyooka S, Shimizu N, Tsukuda K, Maruyama R, McLerran D, Toyooka KO, Fong KM, Roth JA, Lee H	International Journal of Cancer	2003	12455028	\N	\N
680	Targeting of mutant hogg1 in mammalian mitochondria and nucleus: effect on cellular survival upon oxidative stress	Mambo,E, Sidransky,D, Deweese,T, Chatterjee,A, Zhang,Y	BMC Cancer	2006	17018150	\N	\N
681	Hypermethylation of Cyclin D2 is associates with loss of mRNA expression and tumor development prostate cancer	Oliveira,J, Xosta,VL, Sidransky,D, Cerveira,N, Henrique,R, Hoque,MO, Caralho,AL, Teixeira,MR, Jeronimo,C, Ribeiro,FR	J Mol Med	2006	17016690	\N	\N
682	The early detection of occult lung cancer	Tockman MS, Mulshine JL	Chest Surg Clin N Am	2000	11091923	\N	\N
684	Frequent 14-3-3 sigma promoter methylation in benign and malignant prostate lesions	Sidransky,D, Lopes,C, Carvalho,AL, Hoque,MO, Teixeira,MR, Henrique,R, Jeronimo,C, Oliveria,J	DNA Cell Biol	2005	15812243	\N	\N
686	Colon cancer specific nuclear matrix protein alterations in human colonic adenomatous polyps.	Getzenberg RH., Brünagel G, Schoen RE	Journal of Cellular Biochemistry	2004	14743395	\N	\N
687	Early identification of individuals with prostate cancer in negative biopsies.	Getzenberg RH., Arlotti J, Dhir R, Masterson R, Acquafondata M, Landsittel D, Vietmeier B	Journal of Urology	2004	15017188	\N	\N
688	Characterization of amplifiable, circulating RNA in plasma and its potential as a tool for cancer diagnostics.	Godfrey TE., Kirkwood JM, El-Hefnawy T, Raja S, Bigbee WL, Kelly L, Luketich JD	Clinical Chemistry	2004	14718398	\N	\N
694	SELDI-TOF-MS serum protein expression profiling for lung cancer detection and classification.	Fernando HC, El-Hefnawy T, Bigbee WL, Weissfeld JL, Landreneau RJ, Malehorn DE, Luketich JD, Siegfried JM.	Proceedings of American Association for Cancer Research	2004	N/A	\N	\N
696	Mitochondrial cytochrome B gene mutation promotes tumor growth in bladder cancer	Sidransky D, Dasgupta S, Hoque MO, Upadhyay S	Cancer Research	2008	18245469	\N	\N
697	A panel of sputum-based genomic markers for early detection of lung cancer.	Jiang F, Todd NW, Li R, Stass SA., Zhang H, Fang H	Cancer Prev Res (Phil)	2010	20864512	\N	\N
698	ALDH1A1 is a marker for malignant prostate stem cells and predictor of prostate cancer patients&#39; outcome.	Leng B, Leng !, Yun S, Liu Z, Mei Y, Stass SA, Jiang F., Li T	Laboratory Investigation	2010	20010854	\N	\N
700	Relationship between normal rectal methylation, smoking status, and th presence or absence of colorectal adenomas.	KuKuruga D, Yang J, Stass S, Paun B, Cheng Y, Abraham J, Agarwal R, Meltzer S., Mori Y, Olaru A, David S, Selaru F, Mailton J	Cancer	2010	20572039	\N	\N
701	Aldehyde dehydrogenase 1 is a tumor stem cell-associated marker in lung cancer.	Qiu Q, Su Y, Khanna A, Liu Z, Xing L, Jiang F, Deepak J, Stass SA, Todd NW, Wang J, Kath RL.	Mol Cancer Res	2009	19276181	\N	\N
702	Phospho-p70S6K/p85S6K and cdc2/cdk1 are novel targets of difuse large B-cell lymphoma combination therapy	Zhao XF, Zhao MY, Burger A, Auerbach A, D&#39;Costa A, Jiang F, Rapoport A, Sands A, Stass S, Sausville E, Aguilera N	Clinical Cancer Research	2009	19223503	\N	\N
703	Targeted disruption of Aurora-A causes abnormal mitotic spindle assembly, chromosome misalignment and embryonic lethality	Sasai K, Adams HP, Stass SA, Brandt ME, Katayama H, Killary AM, Parant JM, Sen S, Carter JL	Oncogene	2008	18345035	\N	\N
704	C-MYC rearrangements are frequent in aggressive mature B-Cell lymphoma with atypical morphology	Hassan A, Zhao X, Dehner L, Ning Y, Perry A, Stass S	International Journal of Clinical and Experimental Pathology	2008	18784824	\N	\N
705	Detecting genomic aberrations by fluorescence in situ hybridization with quantum dots-labeled probes	Li R, Todd NW, Jiang Z, Stass SA, Jiang F	J Nanosci Nanotechnol	2007	18283800	\N	\N
706	Detection of the Potential Pancreatic Cancer Marker MUC4 in Serum Using Surface-Enhanced Raman Scattering	Chakraboty S, Porter MD, Wang G, Torres MP, Brand RE, Lipert RJ, Jain M, Kaur S, Batra SK	Analytical chemistry	2011	21391573	\N	\N
707	Differential expression of anterior gradient gene AGR2 in prostate cancer	Goodglick L, Liebeskind ES, Bagryanova L, Alavi M, Maresh EL, Knutzen LA, Liu AY, Horvath S, Mah V, Chia D, Zhou Y	BMC cancer	2010	21144054	\N	\N
708	Nidogen-2: a new serum biomarker for ovarian cancer	Kobayashi H, Kuk C, Soosaipillai A, Li L, Diamandis EP, Zheng Y, Gunawardana CG	Clinical biochemistry	2010	19883638	\N	\N
709	Robust Prediction of t-Year Survival with Data from Multiple Studies	Chen J, Cai T, Zheng Y, Gerds TA	Biometrics	2010	20670303	\N	\N
710	Genomic instability and copy-number heterogeneity of chromosome 19q, including the kallikrein locus, in ovarian carcinomas	Li L, Squire JA, Katsaros D, Lassus H, Marrano P, Butzow R, Bayani J, Zheng Y, Diamandis EP, Graham C	Molecular oncology	2011	20800559	\N	\N
711	Estimating the diagnostic likelihood ratio of a continuous marker	Gu W, Pepe MS	Biostatistics (Oxford, England)	2011	20639522	\N	\N
712	CD90/THY1 is overexpressed in prostate cancer-associated fibroblasts and could serve as a cancer biomarker	Ye M, Tjoelker LW, True LD, Zhang H, Kim JS, Qian WJ, von Haller PD, Ellis WJ, Liu AY, Huang CY, Liebeskind ES, Smith RD, Nelson PS	Modern Pathology	2010	20562849	\N	\N
714	Gene expression down-regulation in CD90+ prostate tumor-associated stromal cells involves potential organ-specific genes	Liebeskind ES, Vêncio RZ, Page LS, Chambers AA, Goo YA, Liu AY, Takayama TK, True LD, Pascal LE	BMC Cancer	2009	19737398	\N	\N
715	The use of kallikrein-related peptidases as adjuvant prognostic markers in colorectal cancer	Scorilas A, Diamandis EP, Talieri M, Soosaipillai A, Zheng Y, Xynopoulos D, Alexopoulou DK, Li L	British journal of cancer	2009	19367279	\N	\N
716	Molecular characteristics of non-small cell lung cancer	Zhang,W, Chen,Y, Dracheva,T, Cook,B, Zhang,M, Gao,Y, Curran,J, Guo,M, Fujii,T, Dufault,M, Sidransky,D, Nacht,M, Han,S, Akmaev,V, Player,A, Buetow,K, Madden,SL	Proc National Acad Science USA	2001	11752463	\N	\N
717	I105V polymorphism and promoter methylation of the GSTP1 gene in prostate adenocarcinoma	Sidransky,D, Lopes,C, Varzim,G, Henrique,R, Oliveira,J, Bento,MJ, Silva,C, Jeronimo,C	Cancer Epidemiology, Biomarkers & Prevention	2002	12010858	\N	\N
718	Mitochondrial mutations in early stage prostate cancer and bodily fluids	Jeronimo,C, Usadel,H, Nomoto,S, Caballero, MS, Oliveira,J, OL, D, Lopes,C, Varzim,G, Fliss, Henrique,R, Sidransky	Oncogene	2001	11526508	\N	\N
719	Tumor&#39;s other immune targets: dendritic cells	Shurin GV, Esche C, Rabinowich H, Watkins SC, Shurin MR, Lotze MT, Lokshin A, Gastman BR	Journal of Leukocyte Biology	1999	10449178	\N	\N
720	Identification of a mononucleotide repeat as a major target for mitochondrial DNA alternations in human tumors	Sidransky,D, Xiao,Y, Fazio,VM, Cohen,D, Mazzarelli,P, Nicol,T, Sanchez-Cespedes,M, Jeronimo,C, Jordan,RC, Schoenberg,M, Koch,WM, Normoto,S, Parella,P, Esteller,M	Cancer Research	2001	11585726	\N	\N
721	Detection of mitochondrial DNA mutations in primary breast cancer and fine-needle aspirates	Spencer,M, Fliss,M, Rinaldi,M, Sidransky,D, Mazzarelli,P, Rabitti,C, Cohen,D, Sanchez-Cespedes,M, Nicol,T, Parrella,P, Gabrielson,E, Fazio,VM, Pandit,S, Cuomo,C, Xiao,Y	Cancer Research	2001	11606403	\N	\N
722	Quantitation of GSTP1 methylation in non-neoplastic prostatic tissue and organ-confined prostate adenocarcinoma	Sidransky,D, Nelson,WG, Oliveira,J, Usadel,H, Jeronimo,C, Henrique,R, Lopes,C	Journal of the National Cancer Institute	2001	11717336	\N	\N
723	O(6)-Methlguanine-DNA methyltransferase promoter hypermethylation shifts the p53 mutations spectrum in non-small lung cancer	Sidransky,D, Doffek,K, Wolf,P, Ahrendt,SA, Hu,YC	Cancer Research	2001	11719438	\N	\N
724	Differential regulation of maturation and apoptosis of human monocyte-derived dendritic cells mediated by MHC class II	Lokshin AE, Marrangoni AM, Edwards RP, Storkus WJ, Muller-Berghaus J, Gorelik E, Peng X, Sassi RR, Mailliard RB, Kalinski P	International Immunology	2002	12202400	\N	\N
725	Rethinking screening for breast cancer and prostate cancer	Thompson I, Shieh Y, Esserman L	JAMA : The Journal of the American Medical Association	2009	19843904	\N	\N
727	Improving international research with clinical specimens: 5 achievable objectives	LaBaer J	Journal of Proteome Research	2012	22998582	\N	\N
728	High density diffusion-free nanowell arrays	Festa F, Wiktor P, LaBaer J, Means S, Magee DM, Bian X, Park JG, Miersch S, Syal K, Mendoza A, Kahn P, Takulapalli BR, Brunner A, Barker K, Qiu J	Journal of Proteome Research	2012	22742968	\N	\N
729	High-throughput cloning and expression library creation for functional proteomics	Bian X, Steel J, Labaer J, Festa F	Proteomics	2013	23457047	\N	\N
730	Biologic characteristics of premalignant breast disease	Anderson KS, Tabernero M, Cole K	Cancer Biomarkers : section A of Disease markers	2010	22112476	\N	\N
731	MUC1 mucin stabilizes and activates hypoxia-inducible factor 1 alpha to regulate metabolism in pancreatic cancer	Hollingsworth MA, Purohit V, Mehla K, Chaika NV, Singh PK, Zhang B, Radhakrishnan P, Powers R, Lewallen ME, Gebregiworgis T, Liu X, Johnson KR, Caffrey T, Yu F, Brown RB	Proceedings of the National Academy of Sciences of the United States of America	2012	22869720	\N	\N
732	Robust microarray production of freshly expressed proteins in a human milieu	Yu X, Webb B, Jensen P, Kilmer G, Qiu J, Rollins SM, Mendoza EA, Festa F, Hathaway M, Labaer J, Ryan ET, Lorenz P, Vattem K	Proteomics. Clinical Applications	2012	23027544	\N	\N
733	Cathepsin B promotes the progression of pancreatic ductal adenocarcinoma in mice	Karreth FA, Tuveson DA, Reinheckel T, Cook N, Frese KK, Denicola GM, Gopinathan A, Lerch MM, Mayerle J	Gut	2012	22157328	\N	\N
734	Rosiglitazone and Gemcitabine in combination reduces immune suppression and modulates T cell populations in pancreatic cancer	Mohr AM, Grandgenett PM, Hollingsworth MA, Bailey JM, Bunt SK	Cancer immunology, immunotherapy : CII	2013	22864396	\N	\N
736	Association of chromosome 8q variants with prostate cancer risk in Caucasian and Hispanic men	Martinez-Fierro ML, Crandall AC, Thompson IM, Gelfond JA, Rojas-Martinez A, Beuten J, Leach RJ, Weldon KS	Carcinogenesis	2009	19528667	\N	\N
737	Association of polymorphisms in TGFB1 and prostate cancer prognosis	Baillargeon J, Thompson IM, Troyer DA, Naylor SL, Brand TC, Bermejo C, Canby-Hagino E, Leach RJ	The Journal of Urology	2008	18082198	\N	\N
738	Prostate cancer detection strategies	Thompson IM, Canby-Hagino ED, Brand TC, Hernandez J, Basler JW	Current Urology Reports	2006	16630521	\N	\N
739	Prostate cancer risk with positive family history, normal prostate examination findings, and PSA less than 4.0 ng/mL	Canby-Hagino E, Thompson IM, Leach RJ, Ankerst DP, Higgins B, Brand TC, Troyer DA, Hernandez J, Parekh DJ	Urology	2007	17991549	\N	\N
740	Validation of genome-wide prostate cancer associations in men of African descent	Leach RJ, Kibel AS, Neslund-Dudas C, Stern MC, Xu J, Ingles SA, Casey G, Cooney K, Thompson IM, Corral R, Benford ML, John EM, Kidd LR, Chang BL, Witte J, Stefflova K, Joshi AD, Rebbeck TR, Spangler E, Isaacs W, Giri VN, Henderson B, Zeigler-Johnson C, Ostrander EA, Park J, Stanford JL, Hsing AW, Eeles R, Strom S, Gallagher S, Rybicki B, Hu JJ, Haiman CA, Chanock S	Cancer Epidemiology, Biomarkers & Prevention : a publication of the American Association for Cancer Research, cosponsored by the American Society of Preventive Oncology	2011	21071540	\N	\N
741	XPA Polymorphism Associated with Reduced Lung Cancer Risk by Modulating Nucleotide Excision Repair Capacity	Qiao Y, Hong WK, Amos CI, Wu X, Wei Q, Zhang K, Zhao H, Spitz MR, Guo Z	Cancer Research	2002	N/A	\N	\N
742	BPDE-induced lymphocytic 3p21.3 aberrations may predict head and neck cancer risk	Zheng Y, Hong WK, Spitz MR, Zhu Y, Wu X	Cancer	2002	12209748	\N	\N
744	Microsomal Epoxide Hydrolase Polymorphisms and Lung Cancer Risk in Non-Hispanics Whites	Gwyn KM, Wu X, Spitz MR, Zhao H	Molecular Carcinogenesis	2002	11813302	\N	\N
745	Lung cancer susceptibility associated with p53 genotypes and haplotypes in various ethnic groups	Hong WK, Spitz MR, Amos CI, Shete S, Kadlubar FF, Wu X, Zhao H, Makan N	Journal of the National Cancer Institute	2002	11983757	\N	\N
746	Chromosome Instability in Lymphocytes:  A Potential Indicator of Predisposition to Oral Premalignant Lesions	Lee JJ, Spitz MR, Tomas M, Lippman SM, Wu X, Hong WK, Zhu Y, Wei QV	Cancer Research	2002	12019158	\N	\N
747	Sulphotransferase (SULT) 1A1 Polymorphism as a Predisposition Factor for Lung Cancer:  A Case-Control Analysis	Wang Y, Makan N, Spitz MR, Zhang K, Wu X, Tsu A	Lung Cancer	2002	11804685	\N	\N
748	XPD/ERCC2 EXON 8 Polymorphisms:  rarity and lack of significance in risk of squamous cell carcinoma of the head and neck	Eicher SA, Wei Q, Strom SS, Li L, Castillo EJ, Sturgis EM, Spitz MR	Oral Oncology	2002	12110342	\N	\N
749	P53 codon 72 Polymorphism and risk of squamous cell carcinoma of the head and neck - A case-control study	Eicher SA, Spitz MR, Strom SS, Sturgis EM, Shen H, Wei Q, Zheng Y	Cancer Letters	2002	12065086	\N	\N
750	A variant of the DNA repair gene XRCC3 and risk of squamous cell carcinoma of the head and neck - A case controlled analysis	Dahlstrom KR, Wei Q, Zheng Y, Spitz MR, Sturgis EM, Shen H	International Journal of Cancer	2002	12115490	\N	\N
751	Quantitation of Site-specific HPV 16 DNA Methylation by Pyrosequencing	Swan DC, Lee DR, Duncan K, Limor JR., Rajeevan MS, Unger ER	J Virol Methods	2006	17045346	\N	\N
752	Low-coherent backscattering spectroscopy for tissue characterization	Liu Y, Roy HK, Wali RK, Kim YL, Backman V.	Appl Opt	2005	15717826	\N	\N
753	Depth-resolved low-coherence enhanced backscattering.	Liu Y, Backman V., Turzhitsky VM, Roy HK, Kim YL, Wali RK	Opt Lett	2005	15832924	\N	\N
754	Assessment of blood supply in superficial tissue by polarization-gated elastic light-scattering spectroscopy.	Wali RK, Siegel MP, Roy HK, Backman V., Kim YL	Appl Opt	2006	16422163	\N	\N
755	Practicing Medicine at the Front Lines of the Genomic Revolution	Rubinstein WS, Roy HK	Arch Intern Med	2005	16157823	\N	\N
757	Evaluation of RNA markers for early detection of cervical neoplasia in exfoliated cervical cells	Flowers LC, Lee DR, Horowitz IR, Vernon SD, Ruffin MT, Steinau M, Kmak D, Tadros T, Husain M, Unger ER, Longton G, Rajeevan MS, Birdsong G	Cancer Epidemiology, Biomarkers & Prevention	2007	17301262	\N	\N
758	Cellular features of senescence during the evolution of human and murine ductal pancreatic cancer	DeNicola GM, Caldwell ME, Jacobetz MA, Hruban RH, Tuveson DA, Maitra A, Martins CP	Oncogene	2012	21860420	\N	\N
759	Expression of Transforming Growth Factor ß Type II Receptors in Head and Neck Squamous Cell Carcinoma	Anderson M, Cordero J, Munoz-Antonia T, Muro-Cacho CA	Clinical Cancer Research	1999	10389906	\N	\N
760	Transforming Growth Factor ß Receptors in Verrucous and Squamous Cell Carcinoma	Anderson M, Muro-Cacho CA, Cordero J, Munoz-Antonia T, Livingston S	Arch Otolaryngo Head & Neck Surg	1999	10448730	\N	\N
761	Transforming Growth Factor-ß Type II Receptors and Smad Proteins in Follicular Thyroid Tumors	West J, Munoz-Antonia T, Johnson JG, Klotch D, Muro-Cacho CA	The Laryngoscope	2000	10942134	\N	\N
763	Transforming Growth Factor ß Receptors and p27kip in Thyroid Carcinoma	Klotch D, Livingston S, Munoz-Antonia T, Muro-Cacho CA	Arch Otolaryngol Head & Neck Surg	1999	9932593	\N	\N
765	Suppression of transformed phenotype and tumorigenicity after transfer of chromosome 4 into U251 human glioma cells	Yung WKA, Steck PA, Pereira-Smith OM, Pershouse MA, Ligon AH, Killary AM	Genes, Chromosomes & Cancer	1997	9365833	\N	\N
767	A mucoepidermoid carcinoma of minor salivary gland with t(11;19)(q21;p13.1) as the only karyotypic abnormality	Killary AM, Batsakis JG, El-Naggar AK, Clayman GL, Lovell M	Cancer Genetics and Cytogenetics	1996	8646736	\N	\N
768	Tumor suppression and apoptosis of human prostate carcinoma mediated by a genetic locus within human chromosome 10pter-q11	Wolf-Ledbetter ME, Wong PE, Lovell M, Sanchez Y, Killary AM, McDonnell TJ, Marin MC	Proceedings of the National Academy of Sciences of the United States of America	1996	8637912	\N	\N
769	Metastasis suppressor genes for prostate cancer	Kugoh H, Killary AM, Barrett JC, Shimazaki J, Ichikawa T, Isaacs JT, Oshimura M, Nihei N, Kawana Y, Kuramochi H, Rinker-Schaeffer CW	Prostate. Supplement	1996	8630227	\N	\N
770	An 80 Kb P1 clone from chromosome 3p21.3 suppresses tumor growth in vivo	Veldhuis P, Siciliano MJ, Liu P, Xiang R-H, Naylor SL, Hensel CH, Kerbacher KE, Moore SL, Buys CHCM, Todd MC, Killary AM, Garcia DK, Kok K, van der Berg A	Oncogene	1996	8957080	\N	\N
771	Report of the Sixth International Workshop on Human Chromosome 3	Alexander C, Krols L, Smith DI, Strachen T, Gizatullin R, Gemmill RM, Deng G, Alimov A, Boileau C, van den Berg A, Grompe M, Bugert P, Killary A, Naylor SL, Zabarovsky E, Opalka B, Allderdice P, Martinsson T, Bonifas J, Drabkin H, Joensuu T, Sankila E-M, Beroud C, O’Connell P, Messiaen L, Ashworth T, Plaetke R, Jonasdottir A, Carritt B, Lott ST, Chipperfield MA, Buys CHCM, Leach RJ	Cytogenetics and Cell Genetics	1996	8641130	\N	\N
772	Early detection of colon cancer: new tests on the horizon	Turgeon DK, Gupta AK, Brenner DE	Molecular Diagnosis Therapeutics	2008	18422372	\N	\N
773	Cooperation of adenosine and prostaglandin E(2) (PGE (2)) in amplification of cAMP-PKA signaling and immunosuppression.	Lokshin A, Gorelik E., Su Y, Huang X, Jackson E, Raskovalova T, Zacharia L	Cancer Immunol Immunother	2008	18327580	\N	\N
774	Biomarkers for cancer risk, early detection and prognosis:  The validation conundrum	Normolle D, Brenner DE	Cancer Epidemiology, Biomarkers & Prevention	2007	17932336	\N	\N
777	Initial analyses of colon cancer-specific antigen (CCSA)-3 and CCSA-4 as colorectal cancer-associated serum markers.	Getzenberg RH., Sokoll LJ, Weissfeld JL, Cannon GW, Schoen RE, Leman ES, Chan DW	Cancer Research	2007	17575123	\N	\N
779	Autoantibody profiles reveal ubiquilin 1 as a humoral immune response target in lung adenocarcinoma.	Beer DG, Fielhauer J, Giordano TJ, Wang X, Chang AC, El-Hefnawy T, Orringer MB, Wang R, Varambally S, Thomas DG, Bigbee WL, Ghosh D, Chinnaiyan AM., Wang Z, Chen G, Vishnu P, Lin M-Y, Giacherio D, Yu J	Cancer Research	2007	17409457	\N	\N
780	A multiparametric panel for ovarian cancer diagnosis, prognosis and response to chemotherapy	Feng Z, Longrais I, Simon I, Wolfert R, Shan S, Diamandis E, Katsaros D, Li L, Scorilas A, Kim N, Zheng Y, Massobrio M	Clinical Cancer Research	2007	18056174	\N	\N
781	Understanding the development of human bladder cancer by using a whole-organ genomic mapping strategy	Ahmed SS, Scherer SE, McCondey DJ, Harris RA, Chung W, Lynch HT, Bar-Eli M, Jeon J, Dinney CP, Bondaruk J, Park W-S, Issa J-P, Kim M-S, Watson P, Tang KS, Wu XF, Czerniak B, Shen L, Snyder C, Kram A, Narod SA, Tuziak T, Zhou J-H, Baggerly K, Yoon D-S, Filipek S, Grossman HB, Majewski T, Johnston DA, Benedict WF, Gazdar A, Lee S	Laboratory Investigation	2008	18458673	\N	\N
782	Cancer biomarker discovery in plasma using a tissue-targeted proteomic approach	Zhang H, Chan DW	Cancer Epidemiology, Biomarkers & Prevention	2007	17932335	\N	\N
786	Enzymes and related proteins as cancer biomarkers: a proteomic approach	Chan DW, Liang SL	Clinica Chimica  Acta	2007	17382922	\N	\N
787	Microarrays of tumor cell derived proteins uncover a distinct pattern of prostate cancer serum immunoreactivity	Omenn GS, Haab BB and Hanash S, Qiu J, Partin AW, Mangold L, Misek DE, Zhou H, Vogt R, Bouwman K, Erlandson E, Schotanus M, Trenkle J	Proteomics	2003	14595819	\N	\N
788	Assessing Accuracy of Mammography in the Presence of Verification Bias and Intrareader Correlation	Zheng Y, Cutter G, Barlow W	Biometrics	2005	15737102	\N	\N
790	Surface chemistries for antibody microarrays.	Rodland, S.L., C.L., Baird, and Zangar, R.C., Seurynck-Servoss, K.D.	Front. Biosci.	2007	17485349	\N	\N
791	Reproducible two-dimensional capillary electrophoresis analysis of Barrett’s esophagus tissues	Dickerson JA, Eggertson M, Paulson TG,\tSanchez CA, Odze R, Harwoood MM, Feng Z, Jones MR, Reid BJ, Dovichi NJ, Kraly JR, Gomez DG	Analytical Chemistry	2006	16944874	\N	\N
792	Comparing the predictive values of diagnostic tests: sample size and analysis for paired study designs	Pepe MS, Moskowitz CS	Clinical Trials	2006	16895044	\N	\N
793	Telomere length in the colon declines with age: relation to colorectal cancer?	Brentnall T, Mandelson M, Bronner M, MacMillan M, Feng Z, Rabinovitch P, Bisques R, O’Sullivan J, Chen L, Potter J, Seibert J	Cancer Epidemiology, Biomarkers & Prevention	2006	16537718	\N	\N
794	Ultrasensitive Detection and Characterization of Posttranslational Modifications Using Surface-Enhanced Raman Spectroscopy	Sung K, N, Feng Z, Berlin A, Gafken P, Zhang J, Sun L, McLerran D, Su X, Randolph T, Yamakawa M, Chan S, Mao D, Koo T-W, Sundarajan, Roth M	Analytical Chemistry	2006	16737206	\N	\N
798	Recent progress on tissue-resident adult stem cell biology and their therapeutic implications	Batra SK, Mimeault M	Stem Cell Rev	2008	18288619	\N	\N
800	Development of a multimarker assay for early detection of ovarian cancer	Pulsipher T, Badgwell D, Gorelik E, Lomakin A, Bast RC, Nolen B, Skates S, Lokshin AE, Yurkovetsky Z, Modugno F, Jacobs I, Godwin A, Menon U, Lu K, Marks J	Journal of Clinical Oncology	2010	20368574	\N	\N
801	Ovarian cancer biomarker performance in prostate, lung, colorectal, and ovarian cancer screening trial specimens	Pinsky PF, Urban N, Godwin AK, Zhang Z, Cramer DW, Lu KH, Patriotis C, Thornquist MD, Skates SJ, Lokshin AE, Scholler N, Bast RC, Ward DC, Hartge P, Berg CD, Mor G, McIntosh MW, Srivastava S, Diamandis EP, Sluss PM, Zhu CS	Cancer Prevention Research	2011	21372036	\N	\N
802	Multiplexed detection of antibodies using programmable bead arrays	Anderson KS	Methods Mol Biol	2011	21370069	\N	\N
804	p53 autoantibodies as potential detection and prognostic biomarkers in serous ovarian cancer	Crum CP, Cramer D, Labaer J, Vitonis A, Wong J, Sluss PM, Anderson KS	Cancer Epidemiology, Biomarkers & Prevention	2010	20200435	\N	\N
805	Rapid detection of antibodies in sera using multiplexed self-assembling bead arrays	Lokko NN, Anderson KS, Sibani S, LaBaer J, Wong J	Journal of Immunological Methods	2009	19732778	\N	\N
806	Cancer biomarkers: can we turn recent failures into success?	Diamandis EP	Journal of the National Cancer Institute	2010	20705936	\N	\N
807	Pentraxin-3 Is a Novel Biomarker of Lung Carcinoma	Thornquist MD, Diamandis EP, Goodglick L, Planque C	Clinical cancer research : an official journal of the American Association for Cancer Research	2011	21257721	\N	\N
808	Serum biomarker profiles and response to neoadjuvant chemotherapy for locally advanced breast cancer	Ta, Marks JR, Nolen BM	Breast cancer research : BCR	2008	18474099	\N	\N
809	Yeast screens identify the RNA polymerase II CTD and SPT5 as relevant targets of BRCA1 interaction	Westmoreland TJ, Falae AI, Mishina YV, Selim AL, Galli A, Bailey DD, Greenleaf AL, Huper G, Verrier CS, Sabin TL, Bennett CB, Madison ER, Marks JR, Olson JA, Blanchette CA, Phatnani HP	PloS one	2008	18197258	\N	\N
810	Cancer proteomics: in pursuit of	Zhang Z, Chan DW	Cancer Epidemiology, Biomarkers & Prevention	2005	16214905	\N	\N
812	Clinical utility of proPSA and &quot;benign&quot; PSA when percent free PSA is less than 15%.	Evans CL, Rittenhouse HG, Mohr P, Mangold LA, Linton HJ, Partin AW, Khan MA, Sokoll LJ, Mikolajczyk SD, Chan DW	Urology	2004	15596190	\N	\N
813	Detection of prostate cancer using serum proteomic pattern	Chan DW,, Partin AW, Rosenzweig J, Mangold L, White N, Zhang Z, Li J	Journal of Urology	2004	15076276	\N	\N
815	MicroRNAs play a central role in molecular dysfunctions linking inflammation with cancer	Michaille JJ, Croce CM, Tili E	Immunological reviews	2013	23550646	\N	\N
816	In vivo NCL targeting affects breast cancer aggressiveness through miRNA regulation	Talabere T, Lagana A, Shapiro CL, Piovan C, Marcucci G, Cascione L, Rocci A, Volinia S, Guan J, Nuovo G, Balatti V, Freitas MA, You J, Byrd JC, Consiglio J, Gasparini P, Hofmeister CC, Croce CM, Palmieri D, Pichiorri F, Coppola V, De Luca L	The Journal of experimental medicine	2013	23610125	\N	\N
817	Prognostic microRNA/mRNA signature from the integrated analysis of patients with invasive breast cancer	Volinia S, Croce CM	Proceedings of the National Academy of Sciences of the United States of America	2013	23589849	\N	\N
819	Transcription signatures encoded by ultraconserved genomic regions in human prostate cancer	Volfovsky N, Yi M, Prueitt RL, Schetter AJ, Calin GA, Croce CM, Van Roosbroeck K, Volinia S, Ambs S, Liu CG, Stephens RM, Esposito D, Hudson RS	Molecular cancer	2013	23409773	\N	\N
820	A new role for microRNAs, as ligands of Toll-like receptors	Paone A, Croce CM, Calore F, Fabbri M, Galli R	RNA biology	2013	23296026	\N	\N
821	miRNA profiling of cancer	Croce CM, Di Leva G	Current opinion in genetics & development	2013	23465882	\N	\N
822	Integrated microRNA and mRNA signatures associated with survival in triple negative breast cancer	Shapiro CL, Ferro A, Gasparini P, Carasi S, Huebner K, Croce CM, Lovat F, Cascione L, Pulvirenti A, He G, Alder H, Vecchione A	PloS one	2013	23405235	\N	\N
823	Clinical applications for microRNAs in cancer	Nana-Sinkam SP, Croce CM	Clinical pharmacology and therapeutics	2013	23212103	\N	\N
824	Effects of blood collection conditions on ovarian cancer serum markers	Nelson B, Segal E, McIntosh M, Brown L, Lowe K, Anderson GL, and Urban N, Thorpe JD, Forrest R, Duan X	PLoS ONE	2007	18060075	\N	\N
826	Current status of mucins in the diagnosis and therapy of cancer	Batra SK, Rachagani S, Torres MP, Moniaux N	BioFactors (Oxford, England)	2009	19904814	\N	\N
830	Membrane-bound mucins: the mechanistic basis for alterations in the growth and survival of cancer cells	Batra SK, Bafna S, Kaur S	Oncogene	2010	20348949	\N	\N
832	External validation of the Prostate Cancer Prevention Trial risk calculator in a screened population	Parekh DJ, Higgins BA, Leach RJ, Brand T, Ankerst DP, Thompson IM, Canby-Hagino E, Hernandez J, Troyer DA	Urology	2006	17169636	\N	\N
834	Body mass index adjusted prostate-specific antigen and its application for prostate cancer screening	Liang Y, Sanchez M, Thompson IM, Ankerst DP, Leach RJ	Urology	2010	20739049	\N	\N
835	Prospective evaluation of operating characteristics of prostate cancer detection biomarkers	Thompson IM, Ankerst DP, Leach RJ, Liang Y, Shah G, Ercole B, Shaughnessy JD, Ketchum NS	The Journal of Urology	2011	21074193	\N	\N
836	Urine metabolomics analysis for kidney cancer detection and biomarker discovery	Thompson IM, Kim K, Aronov P, Zakharkin SO, Anderson D, Weiss RH, Perroud B	Molecular & Cellular Proteomics : MCP	2009	19008263	\N	\N
837	Prostate-specific antigen: a review of the validation of the most commonly used cancer biomarker	Thompson IM, Hernández J	Cancer	2004	15329895	\N	\N
838	Association between an estrogen receptor alpha gene polymorphism and the risk of prostate cancer in black men	Hernández J, Higgins BA, Balic I, Thompson IM, Torkko KC, Johnson-Pais TL, Leach RJ	The Journal of Urology	2006	16406987	\N	\N
839	Regulation of Cox-2 by cyclic AMP response element binding protein in prostate cancer: potential role for nexrutine	Thompson IM, Kumar AP, Inoue H, Troyer DA, Crosby K, Garcia GE, Ghosh R	Neoplasia (New York, N.Y.)	2007	18030357	\N	\N
842	Molecular predictors of outcome with gefitinib in a phase III placebo-controlled study in advanced non-small-cell lung cancer.	R. Dziadziuszko, E. Donald, J. von Pawel, G. Ellison, J. R. Pereira, C. Watkins, T. Ciuleanu, P. A. Bunn Jr, L. Knight, N. Botwood, D. Parums, A. Flannery, M. Varella-Garcia, Hirsch, F. R., and B. Holloway., P. Parikh, N. Thatcher, W. A. Franklin, A. Chang	Journal of Clinical Oncology	2006	17075123	\N	\N
843	p53 mutations and survival in stage I non-small-cell lung cancer: results of a prospective study	Ahrendt,SA, Benoit,N, Buta,M, Sidransky,D, Yang,SC, Wu,L, Hu,Y, McDermott,MP	J National Cancer Inst	2003	12837832	\N	\N
844	Gene promoter hypermethylation in tumors and lymph nodes of stage I lung cancer patients	Tokumaru,Y, Goodman,S, Yang,SC, Sidransky,D, Harden,SV, Ahrendt,SA, Westra,WH	Clinical Cancer Research	2003	12684406	\N	\N
845	Promoter hypermethylation of multiple genes in sputum precedes lung cancer incidence in a high-risk cohort.	Belinsky, W. A. Franklin, and T. Byers., T. C. Kennedy, K. Vu, Y. Miller, J. G. Herman, J. Haney, H. J. Wolf, S. A., F. R. Hirsch, P. A. Bunn, F. D. Gentry, K. C. Liechty, S. B. Baylin, J. Rogers	Cancer Research	2006	16540689	\N	\N
846	Plasma Levels of Insulin-like Growth Factor-1 and  Binding Protein-3 and their association with Bladder Cancer Risk	Zhao H, Zhang K, Spitz MR, Lerner SP, Wu X, Grossman HB	The Journal of Urology	2002	12544349	\N	\N
848	Inherited Genetic Instability of Specific Chromosomes Associated with Family History of Cancer	Spitz MR, Hsu TC, Wu X, Zhu Y	Cancer Genetics and Cytogenetics	2002	9118034	\N	\N
849	Making sense of microarray data to classify cancer	C, Hanash, S and Creighton	Pharmacogenomics Journal	2003	14597962	\N	\N
850	Diminished Expression of S100A2 a Putative Tumor Suppressor at Early Stage of Human Lung Carcinogenesis	Lotan R, Feng G, Youssef EM, Xu X	Cancer Research	2001	11691825	\N	\N
851	Polymorphisms of Methylene-tetrahydrofolate Reductase and Risk of Lung Cancer - A Case Control Study	Hong WK, Spitz MR, Wei Q, Shen H, Wang L	Cancer Epidemiology, Biomarkers & Prevention	2001	11319182	\N	\N
853	Modulation of Nucleotide Excision Repair Capacity by XPD Polymorphisms in Lung Cancer Patients	Wei Q, Shete S, Wu X, Lei L, Amos CI, Mohrenweiser H, Guo Z, Spitz MR, Wang Y, Wang L-E	Cancer Research	2001	11245433	\N	\N
854	Mitochondrial DNA alterations in thyroid cancer	Westra,WH, Tong,BC, Dhir,K, Ha,PK, Califano,JA, XIng,M, Sidransky,D	J Surg Oncol	2003	12619060	\N	\N
855	Aberrant methylation of HIN-1 (high in normal-1) is a frequent event in many human malignancies.	Takahashi T, Pass HI, Suzuki M, Shivapurkar N, Fujisawa T, Shigematsu H, Miyajima K, Tomlinson GE, Toyooka S, Brambilla E, Gazdar AF, Sathyanarayana UG, Czerniak B, Shimizu N, Mastrangelo D	International Journal of Cancer	2005	15472908	\N	\N
856	Aberrant methylation of Reprimo in human malignancies.	Nomura M, Shigematsu H, Echebiri C, Wistuba II, Shivapurkar N, Stastny VA, Takahashi T, Wu CW, Meltzer SJ, Augustus M, Gazdar AF, Suzuki M	International Journal of Cancer	2005	15700311	\N	\N
857	Clinical and biological features associated with Epidermal Growth Factor Receptor gene mutations in lung cancers.	Minna JD, Shimizu N, Herz J, Takahashi T, Suzuki M, Lin L, Roth JA, Wistuba II, Fong KM, Toyooka S, Fujisawa T, Nomura M, Shigematsu S, Lee H, Gazdar AF, Feng Z	Journal of the National Cancer Institute	2005	15741570	\N	\N
858	Aberrant promoter hypermethylation of multiple genes in gallbladder carcinoma and chronic cholecystitis.	Reddy JL, Miyajima K, Shivapurkar N, Wistuba, II, Riquelme E, Zhou X, Takahashi T, Bekele BN, Shigematsu H, Suzuki M, Gazdar AF	Clinical Cancer Research	2004	15447999	\N	\N
859	Somatic mutations of the HER2 kinase domain in lung adenocarcinomas.	Lee H, Toyooka S, Fujisawa T, Fong KM, Takahashi T, Shigematsu S, Minna JD, Majmudar K, Gazdar AF, Nomura M, Suzuki M, Shimizu N, Wistuba II	Cancer Research	2005	15753357	\N	\N
860	Differential methylation of genes that regulate cytokine signaling in lymphoid and hematopoietic tumors.	Takahashi T, Reddy JL, Zochbauer-Muller S, Stastny VA, Gazdar AF, McKenna, Drach J, Zheng Y, Crumrine K, RW, Parikh G, Echebiri C, Shivapurkar N, Kroft SH, Feng Z	Oncogene	2005	15580314	\N	\N
861	Novel real time PCR assay using a universal molecular marker for diagnosis of hematologic cancers.	Shivapurkar N, Reddy JL, Gazdar AF, Takahashi T, Stastny VA, Suzuki M, Echebiri C	International Journal of Cancer	2005	15825171	\N	\N
862	Aberrant methylation profile of human malignant mesotheliomas and its relationship to SV40 infection.	Carbone M, Takahashi T, Pass HI, Miyajima K, Fujisawa T, Toyooka S, Shivapurkar N, Shigematsu H, Suzuki M, Gazdar AF, Zern AL, Stastny VA	Oncogene	2005	15592515	\N	\N
863	Quantitative GSTP1 methylation and the detection of prostate adenocarcinoma in sextant biopsies	Godman,SN, Sidransky,D, Walsh,PC, Partin,AA, Sanderson,H, Harden,SV, Epstein,JI	Journal of the National Cancer Institute	2003	14600096	\N	\N
864	Belinsky, S. A., M. J. Grimes, E. Casas, C. A. Stidley, W. A. Franklin, T. J. Bocklage, D. H. Johnson, and J. H. Schiller.	S. A., W. A. Franklin, E. Casas, Belinsky, C. A. Stidley, D. H. Johnson, and J. H. Schiller., T. J. Bocklage, M. J. Grimes	British Journal of Cancer	2007	17406356	\N	\N
865	Chromosome 18 suppresses the tumorigenicity of prostate cancer cells	Johnson-Pais TL, Padalecki SS, Leach RL, Killary AM	Cancer Genetics and Cytogenetics	2001	11170278	\N	\N
867	Multiple unrelated translocations in a metastatic epimyoepithelial carcinoma of the parotid gland	Ordonez NG, El-Naggar AK, Lovell M, Killary AM	Cancer Genetics and Cytogenetics	1998	9428361	\N	\N
868	Physical and functional mapping of a tumor suppressor locus for renal cell carcinoma within chromosome 3p12	Lott ST, Naylor SL, Killary AM, Lovell M	Cancer Research	1998	9721855	\N	\N
869	Cytogenetic analysis of a primary salivary gland myoepithelioma	Ordonez NG, Lovell M, Callender DL, El-Naggar AK, Killary AM	Cancer Genetics and Cytogenetics	1999	10459346	\N	\N
870	Functional evidence for an ovarian cancer tumor suppressor gene on chromosome 22 by microcell-mediated chromosome transfer	Cabeza-Arvelaiz Y, Yu  Y, Killary AM, Wiener JR, Bast RC. Jr, Lovell M, Mills GB, Pershouse M, Kruzelock RP, Cuevas BD, Xu F-J	Oncogene	2000	11175342	\N	\N
871	Limited non-random chromosomal aberrations in a recurrent adenoid cystic carcinoma of the parotid gland	Lovell M, Killary AM, El-Naggar A, Callender DL	Cancer Genetics and Cytogenetics	1999	9973962	\N	\N
873	Recent developments in biomarkers for the early detection of lung cancer: perspectives based on publications 2003 to present	Merrick DT, Franklin WA, Chanin TD, Hirsch FR	Curr Opin Pulm Med	2004	15220746	\N	\N
875	Mitochondrial DNA as a cancer biomarker	Parr RL, Maragh S, Dakubo GD, Jakupciak JP	Current Opinion in Molecular Therapeutics	2006	15858150	\N	\N
876	Standards for validation of cancer biomarkers	and Jakupciak JP, O’Connell CD, Atha DH	Cancer Biomarkers	2005	17192047	\N	\N
877	Real-time telomerase activity measurements for detection of cancer	Jakupciak JP	Expert Review of Molecular Diagnostics	2005	16149877	\N	\N
878	Mitochondrial DNA as a cancer biomarker	Ally D, Barker PE, Srivastava S, Jakupciak JP, O&#39;Connell CD, Wang W, Maitra A, Coble M, Sidransky D, Markowitz ME	Journal of Molecular	2005	15858150	\N	\N
879	Real-time telomerase assay of less-invasive collected samples	Taylor PR, Wang W, Atha DH, Srivastava S, Abnet CC, Wei W-Q, McGruder BM, Huppi K, Dawsey SM, Qiao Y-L, Jakupciak JP	Cancer Letters	2006	16569479	\N	\N
880	Inter-rater agreement on chromosome 5 breakage in FISH-based mutagen sensitivity assays (MSAs)	Wagner PD, Pinsky P, Wang W, Barker PE	Mutation Research	2004	15279836	\N	\N
881	Semiconductor nanocrystal conjugates, FISH and pH	Telford WG, Barker PE, Xiao Y, Locascio LE, Ball JC	Nature Methods	2005	16179915	\N	\N
882	Preface to standards for healthcare: needs assessment and development	Barker PE	Cancer Biomarkers	2005	N/A	\N	\N
883	Preparation and characterization of candidate reference materials for telomerase assays	Jakupciak JP, Wang W, Atha DH, Barker PE, Srivastava S	Clinical Chemistry	2005	15951318	\N	\N
884	Deregulated EGFR signaling during lung cancer progression: Mutations, amplicons, and autocrine loops	Gazdar AF, Minna JD	Cancer Prevention Research	2008	19138950	\N	\N
886	Global leukocyte DNA methylation is similar in African American and Caucasian under conditions of controlled folate intake.	S.S. Pogribny, Smith, D.J. and Caudill, Axume, Moriarty, J., M.A., I.	Epigenetics	2007	17965592	\N	\N
887	Prostate Cancer Molecular Markers GSTP1 and hTERT in Expressed Prostatic Secretion as Predictors of Biopsy.	Crocitto, Shevchuk, Blair, L., Korns, Kretzner, S.S., L.E., and Smith, S.L., T.G.,Ramin, T., Kawachi, D., S., Wilson, M.H.	Urology	2004	15491741	\N	\N
888	Design and Analysis of Nanoscale Bioassemblies	J., and Smith, D.R. Korns, Clark, S.S., E.M. Singer	Biotechniques	2004	15211750	\N	\N
889	Construction of Ordered Protein Arrays.	Crocitto, Clark, Dabur, P.M., J., Ya.I. and Smith, R., S.S., L.E. Buryanov, T. Swederski, Shevchuk	Methods in Molecular Biology	2005	15657490	\N	\N
890	Transgene-Induced CCWGG Methylaton Does Not Alter Human CG Methylation Patterning	Caudhill, Munson, T., K., Buryanov,Y., J., O.V., Shevchuk, Kretzner, M.A., L., Dyachenko, Auxme	Nucleic Acids Research	2005	16246913	\N	\N
891	Application of Nanoscale Bioassemblies to Clinical Laboratory Diagnostics	J. and Smith, S. S., Clark	Advances in Clinical Chemistry	2006	N/A	\N	\N
892	Gastric Carcinogenesis Through Tobacco Chewing: in vitro Mechanistic Studies of DNA Nitrite Attack.	S. S. and R.E. Schwartz, Smith	Cancer Letters	2006	15946796	\N	\N
893	Nucleoprotein Assemblies for Cellular Biomarker Detection	E. M. and Smith, Singer, S. S.	NanoLetters	2006	16771577	\N	\N
894	Isoform  Analysis of LC-MS/MS Data from Multidimensional Fractionation of the Serum Proteome	Krasnoselsky AL, Hanash SM, Zhang Q, Faca VM, Pitteri SJ	Journal of Proteome Research	2008	18419151	\N	\N
895	Contribution of protein fractionation to depth of analysis of the serum and plasma proteomes	Krasnoselsky A, Fitzgibbon M, Zhang Q, Struthers J, Wang H, Faca V, Pitteri S, McIntosh M, Eng J, Newcomb L, Hanash S, Glukhova V, Phanstiel D	Journal of Proteome Research	2007	17696519	\N	\N
898	Identification of 14-3-3 theta as an antigen that induces a humoral response in lung cancer	Kuick R, Misek DE, Puravs E, Krasnoselsky A, Tammemagi M, Phanstiel D, Brenner DE, Edelstein C, Thornquist M, Pereira-Faca S, Caporaso N, Pfeiffer R, Qiu J, Landi M, Hanash SM, Zhang Q, Hinderer R, Goodman G, Barnett M	Cancer Research	2007	18089831	\N	\N
899	Integral protein microarrays for the identification of lung cancer antigens in sera that induce a humoral immune response	Madoz-Gurpide J et al	Molecular and Cellular Proteomics	2008	17916591	\N	\N
900	Osteopontin is linked to p65 and MMP-9 expression in pulmonary adenocarcinoma but not in malignant pleural mesothelioma.	Frey AB, Wali A, Lonardo F, Pass H	Histopathology	2007	17493236	\N	\N
901	Mitochondrial D-loop mutations as clonal markers in multicentric hepatocellular carcinoma and plasma	Sidransky,D, Nomoto,S, Yamashita,K, Koshikawa,K, Nakao,A	Clinical Cancer Research	2002	11839667	\N	\N
902	A mesothelioma epidemic in Cappadocia: scientific developments and unexpected social outcomes	Emri S, Tuncer M, Pass HI, Steele I, Dogan AU, Carbone M, Baris YI	Nat Rev Cancer	2007	17251920	\N	\N
903	Aberrant promoter methylation of insulin-like growth factor binding protein-3 gene in human cancers	Kisimoto T, Tsukuda K, Naitou M, Asano H, Tomii K, Katayama H, Date H, Toyooka S, Pass HI, Shimizu N, Dote H, Hanafusa T, Doihara H	International Journal of Cancer	2007	17096329	\N	\N
904	Discovery of cancer biomarkers through the use of mouse models	Webb CP, Kuick R, Wang H, Misek DE, Omenn GS, Hanash SM, Peterson KJ, Monsma DJ, Pisano M	Cancer Letters	2007	17320282	\N	\N
906	Epitomics: serum screening for the early detection of cancer on microarrays using complex panels of tumor antigens.	Tainsky MA., Draghici S, Chatterjee M	Expert Rev Mol Diagn.	2005	16149876	\N	\N
907	Alpha-fetoprotein, des-gamma carboxyprothrombin, and Lectin-bound alpha-fetoprotein in early hepatocellular carcinoma.	Marrero JA, Reddy KR, Srivastava S, Feng Z, Lok AS, Wang Y, Normolle D, Nguyen MH, Llovet JM, Dalhgren J, Schwartz M, Roberts LR, Wagner PD, Befeler AS, Harnois D, Chia D	Gastroenterology	2009	19362088	\N	\N
908	A multicenter, double-blinded validation study of methylation biomarkers for progression prediction in Barrett&#39;s esophagus	Romero Y, Nelson MA, David S, Kan T, Olaru AV, Sato F, Meltzer SJ, Hamilton JP, Abraham JM, Selaru FM, Wolfsen HC, Wagner PD, Ito T, Feng Z, Shaheen NJ, Agarwal R, Bhattacharyya A, Yang J, Gu W, Jin Z, Wang KK, Paun BC, Sampliner RE, Cheng Y, Washington K, Wallace MB, Mori Y, Zheng Y, Canto MI, Wang J	Cancer Research	2009	19435894	\N	\N
909	Estimation and Comparison of Receiver Operating Characteristic Curves.	Longton G, Janes H, Pepe M	The Stata journal	2009	20161343	\N	\N
910	Psychosocial factors in risk of cervical intraepithelial lesions	Bailey JM, Ruffin MT, Bieniasz ME, Wilkerson JE, Murray SI	J Womens Health (Larchmt)	2009	19361319	\N	\N
911	Characterization of the human cervical mucous proteome	Panicker G, Ye Y, Wang D, Unger ER	Clinical Proteomics	2010	20461121	\N	\N
912	Integration of proteomics into systems biology of cancer	Hanash S, Taguchi A, Zhang Q, Schliekelman M	Wiley interdisciplinary reviews. Systems biology and medicine	2012	22407608	\N	\N
913	Tumor microenvironment-derived proteins dominate the plasma proteome response during breast cancer induction and progression	Buson TB, Gurley KE, Kennedy J, Zhang Q, Pitteri SJ, Hanash SM, Nelson PS, Kemp CJ, Wang H, Chin A, Wong CH, Chodosh LA, Kelly-Spratt KS	Cancer research	2011	21653680	\N	\N
914	Plasma proteome profiles associated with inflammation, angiogenesis, and cancer	Liggitt D, Wong CH, Kelly-Spratt KS, Kemp CJ, Hanash SM, Zhang Q, Buson TB, Kennedy J, Pitteri SJ, Wang H, Chin A, Gurley KE	PloS one	2011	21589862	\N	\N
915	Lung cancer signatures in plasma based on proteome profiling of mouse tumor models	Gazdar AF, Taguchi A, Dinulescu DM, Goodman G, Varmus HE, Depinho RA, Wong CH, Faça VM, Pitteri SJ, Zhang Q, Hanash SM, Kelly-Spratt K, Park KS, Kemp CJ, Politi K, Sage J, Kucherlapati R, Lockwood WW, Chin A	Cancer cell	2011	21907921	\N	\N
916	Targets of the tumor suppressor miR-200 in regulation of the epithelial-mesenchymal transition in cancer	Schliekelman MJ, Kurie JM, Hanash SM, Ungewiss C, Shin DH, Wang H, Ahn YH, Gibbons DL, Creighton CJ, Wong CH, Zhang Q, Faca VM, Rizvi ZH	Cancer research	2011	21987723	\N	\N
917	Comprehensive proteomic profiling of aldehyde dehydrogenases in lung adenocarcinoma cell lines	Schliekelman M, Misek DE, Zhang Q, Hanash S, Chin A, Taguchi A, Wong CH, Kuick R	International journal of proteomics	2011	22110949	\N	\N
918	Microparticles from ovarian carcinomas are shed into ascites and promote cell migration	Goff BA, Reyes M, Pitteri SJ, Pennil C, Press JZ, Swisher EM, Garcia R, Hanash SM	International journal of gynecological cancer : official journal of the International Gynecological Cancer Society	2012	22315094	\N	\N
919	Concordant release of glycolysis proteins into the plasma preceding a diagnosis of ER+ breast cancer	Hanash SM, McIntosh M, Prentice RL, Porter P, Disis M, Ladd JJ, Wong CH, Li CI, Lampe P, Pitteri SJ, Amon LM, Zhang Q	Cancer research	2012	22367215	\N	\N
920	Low-coherence enhanced backscattering: review of principles and applications for colon cancer screening.	Wali RK, Liu Y, Subramanian H, Backman V, Roy HK, Pradhan P, Kim YL, Turzhitsky VM	J Biomed Opt	2006	16965153	\N	\N
923	Colon cancer screening: the good, the bad, and the ugly	Backman V, Roy HK, Goldberg MJ	Archives of Internal Medicine	2006	17101934	\N	\N
924	Virtual Genome Scan: A Tool for Restriction Landmark Based Scanning of the Human Genome	Muleris M., Erson A.E., Wimmer K., Kuick R., Rouillard J.M., Asakawa, and Hanash S, J., Petty E.M.	Genome Research	2001	11483587	\N	\N
925	Protein based microarrays: A tool for probing the proteome of cancer cells and tissues	J, H, Hanash, Brichory, F, Madoz-Gurpide, Misek, Wang, SM, DE	Proteomics	2001	11721639	\N	\N
926	Integrating the predictiveness of a marker with its performance as a classifier	Feng Z, Zheng Y, Prentice R, Longton G, Thompson IM, Pepe MS, Huang Y	American Journal of Epidemiology	2008	17982157	\N	\N
927	Mutational and deletion analyses of the chromosome 4q24-31 region in esophageal adenocarcinoma.	Meltzer SJ., Hamilton JP, Wang S, Mori Y, Abraham JM, Berki A, Cai K, Sterian A, Schulmann K, Olaru A, Greenwald BD, Paun B, Kan T, Sato F	Oncogene	2006	16837775	\N	\N
928	Promoter hypermethylation and response to chemotherapy and radiation in esophageal cancer.	Ito T, Abraham JM, Meltzer SJ., Mori Y, Sato F, Paun T, Berki AT, Wang S, Mantzur C, Doyle LA, Kan T, Suntharalingam M, Jin Z, Greenwald BD, Hamilton JP, Krasna MJ, Edelman MJ	Clin. Gastroenterol. Hepatol.	2006	16678495	\N	\N
929	Transcriptional profiling supports that Barrett&#39;s metaplasia is an advanced intermediate stage in esophageal adenocarcinoma.	Chai K, Xu Y, Schulmann K, Hamilton JP, Sterian A, Greenwald BD and Meltzer SJ., Mori Y, Zhan M, Berki AT, Olaru A, Yin J, Deacu E, Li H, Abraham JM, Wang S, Kan T, Sato F	Oncogene	2006	16449976	\N	\N
930	Telomere length in the colon declines with age: relation to colorectal cancer?	Reid B, Feng Z, Paulson TG, Norwood TH, Opheim K, Klingelhutz A, Palanca-Wessels MCA, Rabinovitch P	Cancer Epidemiology, Biomarkers & Prevention	2006	16537718	\N	\N
931	RAB32 hypermethylation and microsatellite instability in gastric and endometrial adenocarcinomas.	Yin J, Karpeh MS, Sato F, Chung TKH, Wong YF, Meltzer SJ., Zhang L, Mori Y, Lo WK, Jr., Shibata D, Cai K, Elahi A, Hamelin R	International Journal of Cancer	2006	16557577	\N	\N
934	Reprimo methylation is a potential early biomarker of Barrett’s-associated neoplastic progression.	Hamilton JP, Mori Y, Ito T, Sato F, Kan T, Meltzer SJ., Paun B, Wang S, Jin Z, Cheng Y, Abraham JM, Greenwald BD, Mantzur C	Clinical Cancer Research	2006	17121882	\N	\N
935	A genome-wide search identifies epigenetic silencing of somatostatin, tachykinin-1, and five other genes in colon cancer.	Paun B, Wang S, Meltzer SJ., Abraham JM, Ito T, Mantzur C, Kan T, Jin Z, Mori Y, Cheng Y, Sato F, Hamilton JP, Cai K, Berki AT	Gastroenterology	2006	16952549	\N	\N
936	NF-kappaB in Lung Tumorigenesis.	Tchou-Wong K-M, Cai Z, Rom WN,	Cancers.	2011	N/A	\N	\N
937	Molecular analysis of plasma DNA for the early detection of lung cancer by quantitative methylation specific PCR	David AG, Loyo M, Siegfried J, Hoque M, Greenberg A, Ostrow K, Bigbee W, Rom W, Brait M, Grandis J, Sidransky D.	Clinical Cancer Research	2010	20592015	\N	\N
939	Resection of non-small cell lung cancers reverses tumor-induced gene expression changes in the peripheral immune system.	Kossenkov A, Billouin S, Albelda SM, Showe LC., Rom WN, Homg W, Vachani A, Chang C, Showe MK, Nichols C	Clinical Cancer Research	2011	21807633	\N	\N
940	Detection of lung cancer using weighted digital analysis of breath biomarkers.	Kloss R, Pass HI, Altorki N, Cataneo RN, Phillips M, Schmitt P, Austin JHM, Rashid A, Cameron RB, Munawar MI, Wai J., Rom WN, Maxfield RA	Clinica Chimica Acta	2008	18420034	\N	\N
941	Performance of mitochondrial DNA mutations detecting early stage cancer.	Maitra A, Barker PE, Rom WN, Jakupciak JP, Wagner PD, Maragh S, O&#39;Connell CD., Markowitz ME, Srivastava S, Hoque MO, Sidransky D, Greenberg AD	BMC Cancer	2008	18834532	\N	\N
944	Update on ovarian cancer screening	Chatterjee M, Munkarah A, Tainsky MA	Curr Opin Obstet Gynecol.	2007	17218847	\N	\N
945	Epitomics: global profiling of immune response to disease using protein microarrays	Ionan A, Tainsky MA, Draghici S, Chatterjee M	OMICS	2006	17233560	\N	\N
946	Expression of nucleotide excision repair genes and the risk for squamous cell carcinoma of the head and neck	Guo Z, Honn S, Eicher SA, Sturgis EM, Spitz MR, Guan Y, Cheng L, Wei Q	Cancer	2002	11900225	\N	\N
947	Gene Methylation and Early Detection of Genitourinary Cancer	P, Cairns	Nature Reviews Cancer	2007	17585333	\N	\N
948	Multiplex analysis of serum cytokines in melanoma patients treated with interferon-alpha2b	Kirkwood JM, Edington HD, Winans MT, Gorelik E, Yurkovetsky ZR, Velikokhatnaya L, Marrangoni AM, Lokshin AE	Clinical Cancer Research	2007	17438101	\N	\N
949	Multiple biomarker panels for early detection of ovarian cancer	Yurkovetsky ZR, Lokshin AE, Linkov FY, E Malehorn D	Future Oncology	2006	17155900	\N	\N
950	Protein Microarray Signature of Autoantibody Biomarkers for the Early Detection of Breast Cancer	Wallstrom G, Sibani S, Wagner MR, Ramachandran N, Godwin AK, Park JG, Lokko N, Marks J, Raphael J, Qiu J, Wong J, Anderson KS, LaBaer J, Engstrom P, Logvinenko T, Hainsworth E, Mendoza EA	Journal of Proteome Research	2011	20977275	\N	\N
952	MicroRNAs bind to Toll-like receptors to induce prometastatic inflammatory response.	Wernicke F, Croce CM., Calore F, Gaudio E, Alder H, Lovat F, Santhanam R, Ozer GH, Fadda P, Zanesi N, Nana-Sinkam P, Fabbri M, Crawford M, Perrotti D, Galli R, Paone A	PNAS	2012	22753494	\N	\N
953	Monoclonal antibodies recognizing the non-tandem repeat regions of the human mucin MUC4 in pancreatic cancer	Venkatraman G, Kumar S, Kaur S, Chakraborty S, Varshney GC, Batra SK, Jain M, Moniaux N	PloS one	2011	21886786	\N	\N
956	Marital status and survival in pancreatic cancer patients: a SEER based analysis	Baine M, Chakraborty S, Batra SK, Sahak F, Lin C, Lyden E	PloS one	2011	21698253	\N	\N
957	The Author Replies to a Letter from Dr. Cook	Pepe MS	American Journal of Epidemiology	2011	N/A-not peer reviewed	\N	\N
958	Great promise of tissue-resident adult stem/progenitor cells in transplantation and cancer therapies	Mimeault M, Batra SK	Advances in experimental medicine and biology	2012	22457110	\N	\N
959	Conditional estimation after a two-stage diagnostic biomarker study that allows early termination for futility	Pepe MS, Koopmeiners JS, Feng Z	Statistics in Medicine	2012	22238117	\N	\N
961	Comparison of surgical and endoscopic sample collection for pancreatic cyst fluid biomarker identification	Haab BB, Maupin KA, Simeone DM, Allen P, McDonald M, Brand R, Partyka K, Kwon R	Journal of proteome research	2012	22439797	\N	\N
963	Pathobiological implications of MUC16 expression in pancreatic cancer	Das S, Wittel UA, Batra SK, Haridas D, Anderson JM, Hollingsworth MA, Ponnusamy MP, Chakraborty S, Cruz E, Kumar S, Lakshmanan I, Lele SM, Rachagani S	PloS one	2011	22066010	\N	\N
964	Assessment of fifty-four biomarkers for biopsy-detectable prostate cancer	Baillargeon J, Lokshin A, Troyer DA, Thompson IM, Parekh DJ, Ankerts DP, Hernandez H, Leah RJ	Cancer Epidemiology, Biomarkers & Prevention	2007	17932343	\N	\N
965	Aberrant methylation during cervical carcinogenesis	Zoechbauer-Mueller S, Virmani AK, Rathi A, Gazdar AF, Mathis M, Muller C	Clinical Cancer Research	2001	11297252	\N	\N
966	Aberrant methylation and simian virus 40 Tag sequences in malignant mesothelioma	Maruyama R, Pass HI, Minna JD, Fukuyama Y, Farinas A, Gazdar AF, Gilcrease M, Toyooka S, Toyooka KO, Shivapurkar N	Cancer Research	2001	11479207	\N	\N
967	DNA methylation profiles of lung tumors	Sugio K, Toyooka S, Miyajima K, Brambilla E, Gilcrease M, Girard L, Virmani AK., Harada K, Minna JD, Takahashi T, Gazdar AF, Ariyoshi Y, Toyooka KO, Maruyama R	Molecular Cancer Therapeutics	2001	12467239	\N	\N
968	Deletions of chromosome 4 occur early during the pathogenesis of colorectal carcinoma	Gazdar AF, Maitra A, Milchgrub S, Shivapurkar N	Human Pathology	2001	11230704	\N	\N
969	Loss of expression and aberrant methylation of the CDH13 (H-cadherin) gene in breast and lung carcinomas	Euhus DM, Toyooka S, Sathyanarayana UG, Toyooka KO, Gilcrease M, Minna JD, Gazdar AF, Virmani AK	Cancer Research	2001	11389090	\N	\N
971	Aberrant promoter methylation profile of bladder cancer and its relationship to clinicopathological features	Virmani AK, Toyooka KO, Gazdar AF, Farinas AJ, Vakar-Lopez F, Toyooka S, Zochbauer-Muller S, Harada K, Sagalowsky A, Maruyama R, Minna JD, Czerniak B	Cancer Research	2001	11751381	\N	\N
973	Identification of an autoantibody panel to separate lung cancer from smokers and nonsmokers.	Addrizzo-Harris D, Tan EM., Watson HN, Liu D, Khilkin M, Crawford B, Goldberg JD, Eylers E, Greenberg AK, Naidich DP, Rom WN	BMC Cancer	2010	20504322	\N	\N
975	Erectile dysfunction and subsequent cardiovascular disease	Coltman CA, Probstfield JL, Thompson IM, Moinpour CM, Goodman PJ, Tangen CM	JAMA : The Journal of the American Medical Association	2005	16414947	\N	\N
976	Finasteride improves the sensitivity of digital rectal examination for prostate cancer detection	Lucia MS, Lippman SM, Coltman CA, Tangen CM, Goodman PJ, Thompson IM, Parnes HL	The Journal of Urology	2007	17437804	\N	\N
977	Sequence specificity of Cr(III)-DNA adduct formation in the p53 gene: NGG sequences are preferential adduct-forming sites	Rom W, Tang MS, Costa M, Wu F, Arakawa H	Carcinogenesis	2006	16251206	\N	\N
978	VDR and SRD5A2 polymorphisms combine to increase risk for prostate cancer in both non-Hispanic White and Hispanic White men	Beuten J, Barón AE, van Bokhoven A, Mai P, Balic I, Byers TE, Thompson IM, Norris JM, Leach RJ, Hokanson JE, Torkko KC, Lucia MS	Clinical Cancer Research : An Official Journal of the American Association for Cancer Research	2008	18483391	\N	\N
980	An empirical evaluation of guidelines on prostate-specific antigen velocity in prostate cancer detection	Till C, Lilja H, Thompson IM, Tangen CM, Vickers AJ	Journal of the National Cancer Institute	2011	21350221	\N	\N
1063	Up-regulation of 14-3-3ƒê in Lung Cancer and its Implication as Prognostic and Therapeutic Target.	Qiu Q, Li R, Todd NW, Zhao RY, Stass S, Katz R, Shen J, Wang H, Jiang F., Fang H-B, Caraway N, Fan T	Cancer Research	2007	17699796	\N	\N
981	SELDI-TOF-MS Whole Serum Proteomic Profiling With IMAC Surface Does Not Reliably Detect Prostate Cancer	Zhang Z, Troyer D, Lin D, Wright GL, Malik G, Thompson IM, Thornquist M, McLerran D, Grizzle WE, Srivistava S, Sokoll L, Randolph T, Dahlgren J, Semmes J, Chan DW, Oelschlager D, Kagan J, Diaz J, Partin A, Zhu L, Feng Z, Bigbee WL, Cazares LH	Clinical Chemistry	2008	18024530	\N	\N
982	Using the ROC curve for gauging treatment effect in clinical trials	Pepe MS, Brumback LC, Alonzo TA	Statistics in Medicine	2006	16220481	\N	\N
983	The sensitivity and specificity of markers for event times	Pepe MS, Lumley T, Jenny N, Zheng Y, Cai T	Biostatistics	2006	16079162	\N	\N
984	Combining predictors for classification using the area under the ROC curve	Cai T, Longton G, Pepe MS	Biometrics	2006	16542249	\N	\N
985	Assessing prostate cancer risk: results from the Prostate Cancer Prevention Trial	Ankerst D, Goodman P, Parnes H, Lucia M, Coltman C, Tangen C, Feng Z, Chi C, Thompson I	Journal of the National Cancer Institute	2006	16622122	\N	\N
986	The optimal ratio of cases to controls for estimating the classification accuracy of a biomarker	Janes H, Pepe M	Biostatistics	2006	16428259	\N	\N
987	FDR-controlling testing procedures and sample size determination for microarrays	Potter J, Feng Z, Li S, Bigler J, Lampe J	Statistics in Medicine	2006	15977294	\N	\N
988	Application of the time-dependent ROC curves for prognostic accuracy with multiple biomarkers	Cai T, Zheng Y, Feng Z	Biometrics	2006	16542256	\N	\N
989	Optimized normalization for antibody microarrays and application to serum-protein profiling	Hamelinck D, Costa J, Z, Habb B, Feng, Zhou H, Dillon D, Verweij C, Li L	Molecular and Cellular Proteomics	2005	15793073	\N	\N
990	Aberrant promoter methylation profile of prostate cancers and its relationship to clinicopathological features	Virmani AK, Gazdar AF, Farinas AJ, Zochbauer-Muller S, Maruyama R, Toyooka S, Minna JD, McConnell J, Toyooka KO, Frenkel EP	Clinical Cancer Research	2002	14695140	\N	\N
991	Presence of simian virus 40 DNA sequences in human lymphomas	Harada K, Xu Y, Scheuermann RH, Kroft SH, Reddy J, Gazdar AF, McKenna RW, Shivapurkar N, Milchgrub S, Feng Z	Lancet	2002	11897287	\N	\N
992	Distinguishing Healthy Smokers from Head and Neck Cancer	Adam BL, Cazares LH, Stack BC, Wright GL, Semmes OJ, Somers KD, Wadsworth JT	Archives of Otolaryngology HN Surgery	2004	14732777	\N	\N
993	The EDRN SELDI prostate cancer detection study: atudy in biomarker validation in GU oncology	Feng Z, Grizzle W, Thompson I, Basler J, Izicka E, Srivastava S, Semmes OJ	Urologic Oncology	2004	15283893	\N	\N
994	Selective capture of prostatic basal cells and secretory epithelial cells for proteomic and genomic analysis.	LH, Diaz JI, Corica A, Semmes OJ., Cazares	Urologic Oncology	2004	15283892	\N	\N
996	Focus on bladder cancer.	Siefker-Radtke AO, McConkey DJ, Millikan RE, Adam L, Benedict WF, Bar-Eli M, Dinney CP, Kamat AM, Tuziak T, Wu X, and Czerniak B., Grossman HB, Sabichi AL	Cancer Cell	2004	15324694	\N	\N
997	Aberrant methylation of HIN-1 (high in normal-1) is a frequent event in many human malignancies.	Fujisawa T, Mastrangelo D, Tomlinson GE, Pass HI, Toyooka S, Shigematsu H, Shimizu N, Suzuki M, Czerniak B, Takahashi T, Gazdar AF., Sathyanarayana UG, Shivapurkar N, Miyajima K, Brambilla E	International Journal of Cancer	2005	15472908	\N	\N
998	Specific chromosome aberrations in peripheral blood lymphocytes are associated with risk of bladder cancer.	Lerner SL, Bondaruk J, Shao L, Wu X., Spitz MR, Czerniak BA, Grossman HB, Zeng X	Genes, Chromosomes & Cancer	2004	15390184	\N	\N
1000	Alterations in transcription clusters underlie development of bladder cancer along papillary and nonpapillary pathways.	Hu L, Czerniak B., Wang Z, Kim MS, Zhang W, Grossman HB, Kim JH, Baggerly K, Bondaruk J, Tuziak T, Fuller G, Dinney C	Laboratory Investigation	2005	15778693	\N	\N
1001	High-resolution whole-organ mapping with SNPs and its significance to early events in carcinogenesis.	Jeong J, Yoon DS, Johnston D, Kuang TC, Kim MS, Majewski T, Wang Z, Tuziak T, Baggerly K, Czerniak B., Steinberg J	Laboratory Investigation	2005	15908911	\N	\N
1002	Aberrant promoter methylation and silencing of laminin-5-encoding genes in breast carcinoma	Sathyanarayana UG, Padar A, Shigematsu H, Suzuki M, Huang CX, Bekele BN and Gazdar AF	Clinical Cancer Research	2003	14695139	\N	\N
1003	DNA methylation profiles of lymphoid and hematopietic malignancies	Takahashi T, Miyajima K, Feng Z, Kroft SH, Parikh G, Suzuki M, McKenna RW and Gazdar AF, Zochbauer-Muller S, Drach J, Zheng Y, Reddy J, Shigematsu H, Toyooka S, Shivapurkar N, Timmons C	Clinical Cancer Research	2004	15131027	\N	\N
1004	Aberrant methylation of TRAIL decoy receptors is frequent in multiple tumor types	Toyooka S, Miyajima K, Parikh G, Suzuki M, Reddy J, Pass HI, Shigematsu H, Takahashi T, Shivapurkar N, Chaudhary PM and Gazdar AF, Toyooka KO	International Journal of Cancer	2004	14999791	\N	\N
1005	Lung cancer: chemoprevention and intermediate effect markers	Tockman MS	IARC Sci Publ	2001	11220665	\N	\N
1006	Aberrant methylation of TMS1 in small cell, non-small cell lung cancer and breast cancer	Rathi A, Kischel FC, Toyooka S, Minna JD, Virmani A, Padar A, Sathanarayana UG, Takahashi T, Euhus DM, Gazdar AF, Roth JA, Sugio K, Tonk V	International Journal of Cancer	2003	12800194	\N	\N
1007	Efficacy of Two Sputum Collection Techniques in Patients with Air Flow Obstruction. ACTA Cytologica	Piantadosi S, Kennedy TC, Petty TL, Proudfoot SP, Wu L, Tockman MS, Saccomanno G	ACTA Cytologica	1999	10432886	\N	\N
1008	Considerations in developing successful, population-based molecular screening lung cancer.  Cancer	Mulshine JL, Webster R, Dedrick RL, Tockman MS, Placke ME, De Luca LM	Cancer	2000	11147628	\N	\N
1010	Mutations and addiction to EGFR - the Achilles &quot;heal&quot; of lung cancers?	Herz J, Minna JD, Gazdar AF, Shigematsu H	Trends Mol Med	2004	15464447	\N	\N
1011	Lynch syndrome: Genetics, natural history, genetic counseling, and prevention	Lynch JF, Lynch HT	Journal of Clinical Oncology	2000	11060321	\N	\N
1012	Optimization of MALDI/TOF MS detection for enhanced sensitivity of affinity-captured proteins spanning a 100 kDa mass range	Cazares L, Semmes OJ Malyarenko DI, CL, Gatlin-Bunai, Cooke WF	Journal of Proteome Research	2007	17918874	\N	\N
1015	Signal detection in high-resolution mass spectrometry data.	Semmes OJ, McLerran DF, Randolph T, Feng Z, Cazares L	Journal of Proteome Research	2008	18173224	\N	\N
1016	Phosphorylation of MUC1 by MET modulates interaction with p53 and MMP1 expression	Eggers JP, Cerny RL, Bailey JM, Gendler SJ, Hollingsworth MA, Shanmugam K, Behrens ME, Bennett EP, Singh PK	The Journal of Biological Chemistry	2008	18625714	\N	\N
1017	ADH-1 suppresses N-cadherin-dependent pancreatic cancer progression	Shintani, Hollingsworth, K, PM, Grandgenett, Wheelock, Chaika, Y, MA, N, Fukumoto, Johnson, MJ	International Journal of Cancer	2008	17721921	\N	\N
1093	Structured penalties for functional linear models — partially empirical eigenvectors for regression	Feng Z, Randolph T, Harezlak J	Electronic Journal of Statistics	2012	22639702	\N	\N
1021	Epidermal growth factor receptor messenger RNA expression, gene dosage, and gefitinib sensitivity in non-small cell lung cancer.	R., F. Cappuzzo, K. Tanaka, P. A. Bunn Jr, M. Varella-Garcia, S. E. Witta, A. E. Baron, L. Crino, K. D. Danenberg, S. Park, Dziadziuszko, W. A. Franklin, P. V. Danenberg, and F. R. Hirsch.	Clinical Cancer Research	2006	16707605	\N	\N
1022	Optimization of SELDI-TOF profiling for analysis of cervical mucous	Lee DR, Unger ER, Panicker G	Journal of Proteomics	2009	19064004	\N	\N
1023	Hypermethylation of the Pendred syndrome gene SLC26A4 is an early event in thyroid tumorigenesis	Ladenson,PW, Sidransky,D, Xing,M, Tokumaru,Y, Westra,WB, Wu,G	Cancer Research	2003	12727855	\N	\N
1024	Electrophile and oxidant damage of mitochondrial DNA leading to rapid evolution of homoplasmic mutations	Guo,Z, Mambo,E, Talalay,P, Sidransky,D, Gao,X, Cohen,Y	Proc National Acad Sci USA	2003	12578990	\N	\N
1025	Profiling the cell surface proteome	JH and Hanash S, Jang	Proteomics	2003	14625857	\N	\N
1026	Prediction of ovarian cancer prognosis and response to chemotherapy by a serum-based multiparametric Model	Oikonomopoulou K, Zheng Y, Simickova M, Simon I, Li L, Valik D, Nekulova M, Wolfert R, Frgala T and Diamandis E	British Journal of Cancer	2008	18766180	\N	\N
1027	Evaluation of the branched-chain DNA assay for measurement of RNA in formalin-fixed tissues	Maqsodi B, Allen AN, Vessella RL, Karademos J, Davies JE, McMaster GK, Kristal AR, Knudsen GS, McLerran DF	Journal of Molecular Diagnostics	2008	18310059	\N	\N
1028	EGFR-mutant lung adenocarcinoma in a patient with Li-Fraumeni syndrome.	R. McFarlane, W. A. Robinson, Bemis, K. Kelly, E. Buyers, L. T., J. D. Mitchell, and W. A. Franklin., M. Varella-Garcia	Lancet Oncology	2007	17540308	\N	\N
1029	Death-associated protein kinase promoter hypermethlation in normal human lymphocytes	Kim,M, Benoit,N, Sidransky,D, Clinger,J, Reddy,AN, Jiang,WW, Taylor,R, Califano,J	Cancer Research	2003	14633692	\N	\N
1031	Statistical Aspects of the Use of Biomarkers in Nutritional Epidemiology Research	Beresford SA, Prentice RL, Neuhouser ML, Tinker LF, Huang Y, Lampe JW	Statistics in Biosciences	2009	19841649	\N	\N
1032	Detecting genomic aberrations using products in a multiscale analysis	Yu X, Tang H, Randolph TW, Hsu L	Biometrics	2010	19817738	\N	\N
1033	Association of serum phospholipid fatty acids with breast cancer risk among postmenopausal cigarette smokers	King IB, Takata Y, Goodman GE, Neuhouser ML, Schaffer S, Barnett M, Peters U, Thornquist M	Cancer Causes & Control	2009	19255861	\N	\N
1034	A Protein Microarray Signature of Autoantibody Biomarkers for the Early Detection of Breast Cancer	Engstrom P, and LaBaer J., Ramachandran N, Wallstrom G, Anderson KS, Qiu J, Godwin A, Montor W, Hainsworth E, Marks J, Sibani S, Wong J, Raphael, Lokko N, Mendoza E, J	Journal of Proteome Research	2011	20977275	\N	\N
1035	Statistical issues in the evaluation of screening and early detection modalities	Etzioni R	Urologic Oncology	2008	18452826	\N	\N
1036	Contrasting two frameworks for ROC analysis of ordinal ratings	Pepe MS, Morris DE, Barlow WE	Medical Decision Making	2010	20147599	\N	\N
1037	Measures to Summarize and Compare the Predictive Capacity of Markers	Gu W, Pepe M	The international journal of biostatistics	2009	20224632	\N	\N
1039	Hepatitis B virus-mediated changes of apolipoprotein mRNA abundace in cultured hepatoma cells	Mehta AS, Norton PA, Lu X and Block TM, Gong Q	Journal of Virology	2003	12692252	\N	\N
1040	Gene amplification in esophageal adenocarcinomas and Barrett’s adenocarcinomas with high grade dysplasia	Moy JR, Beer DG, Orringer MB, Iannetoni MD, Schipper M, Normolle D, Miller CT, Lin L, Brenner DE	Clinical Cancer Research	2003	14581353	\N	\N
1041	Clinical implications and utility of field cancerization	Birch-Machin MA, Jakupciak JP, Dakubo GD, Parr RL	Cancer Cell International	2007	17362521	\N	\N
1042	The pseudo-mitochondrial genome influences mistakes in heteroplasmy interpretation	Thayer RE, Jakupciak JP, Robinson K, Aguirre A, Parr RL, Dakubo GD, Reguly B, Wittock R, Maki J	BMC Genomics	2006	16859552	\N	\N
1044	Lectin capture strategies combined with mass spectrometry for the discovery of serum glycoprotein biomarkers	Schwegler EE, Block TM, Drake R, Malik G, Diaz J, Mehta AS and Semmes OJ	Molecular and Cellular Proteomics	2006	16760258	\N	\N
1045	Proteomic analysis of serum associated fucosylated glycoproteins in the development of primary hepatocellular carcinoma	Long RE, Lowman, Comunale MA, Block TM and Mehta AS, Philip R, Krakover J, Evans AA, Hann HW, MA, Seeholzer S	Journal of Proteome Research	2006	16457596	\N	\N
1048	Molecular virology of hepatitis B virus for clinicians	Guo H and Guo J-T, Block TM	Disease Markers	2007	17981225	\N	\N
1050	Development of natural protein microarray for diagnosing cancer based on antibody response to tumor antigens	Madoz-Gurpide J, Misek DE, Michailidis G, Hanash S, Haab BB, Qiu J, Kuick R, Brenner DE, Omenn GS	J Proteome Res	2004	15113102	\N	\N
1051	Emerging molecular biomarkers--blood-based strategies to detect and monitor cancer	Baik CS, Kallioniemi O, Hanash SM	Nature reviews. Clinical oncology	2011	21364687	\N	\N
1052	Harnessing the immune response for cancer detection	Hanash S	Cancer epidemiology, biomarkers & prevention : a publication of the American Association for Cancer Research, cosponsored by the American Society of Preventive Oncology	2011	21454417	\N	\N
1053	The sentinel within: exploiting the immune system for cancer biomarkers	LaBaer J, Anderson KS	Journal of Proteome Research	2005	16083262	\N	\N
1054	Next-generation high-density self-assembling functional protein arrays	Hu Y, Ramachandran N, Demirkan G, Fuentes MG, LaBaer J, Rolfs A, Hainsworth E, Raphael JV	Nature methods	2008	18469824	\N	\N
1055	Applications of protein microarrays for biomarker discovery	Srivastava S, Labaer J, Ramachandran N	Proteomics. Clinical applications	2008	21136793	\N	\N
1056	Autoantibody profiles as biomarkers of breast cancer	Lv LL, Anderson KS, Tabernero MD	Cancer biomarkers : section A of Disease markers	2010	20938085	\N	\N
1057	Tumor vaccines for breast cancer	Anderson KS	Cancer investigation	2009	19358018	\N	\N
1058	Rapid detection of antibodies in sera using multiplexed self-assembling bead arrays	LaBaer J, Sibani S, Anderson KS, Lokko NN, Wong J	Journal of immunological methods	2009	19732778	\N	\N
1059	p53 autoantibodies as potential detection and prognostic biomarkers in serous ovarian cancer	Wong J, Sluss PM, Cramer D, Labaer J, Crum CP, Anderson KS, Vitonis A	Cancer epidemiology, biomarkers & prevention : a publication of the American Association for Cancer Research, cosponsored by the American Society of Preventive Oncology	2010	20200435	\N	\N
1062	Profiling of pathway-specific changes in gene expression following growth of human cancer cell lines transplanted into mice	Omenn, Brichory, Kuick, Misek, FM, Rouillard, Creighton, R, S, Rickman, C, JM, DS, DE, GS and Hanash	Genome Biology	2003	12844362	\N	\N
1064	Gene expression profiles predict survival of pateints with lung adenocarcinoma	Chen, S, Beer, R, Thomas, MB and Hanash, Huang, Giordano, Hayasaka, TJ, Iannettoni, DG, MD, DE, C-C, TG, Kardia, Misek, JMG, L, G, SLR, AM, Kuick, Taylor, Lizyness, Levin, Orringer, Lin, Gharib, ML	Nature Medicine	2002	12118244	\N	\N
1065	Global and specific translational control by rapamycin in T cells uncovered by microarray and proteomics	Pradet-Balade, L, J, JA and Beretta, Garcia-Sanz, Hanash, A, B, E, S, Grolleau, Bowman, Puravs	Journal of Biological Chemistry	2002	11943782	\N	\N
1066	Discordant protein and mRNA expression in lung adenocarcinomas	Orringer, G, DG, Huang, Gharib, Chen, Taylor, MB, SM and Beer, JM, TJ Iannettoni, TG, MD, Kardia, CC, Misek, DE, Hanash, SL and Giordano	Molecular and Cellular Proteomics	2002	12096112	\N	\N
1067	A lung cancer protein database	E., Puravs, Oh, Tra, J., F., Beer, Brichory, D. and Hanash S	Proteomics	2001	11721642	\N	\N
1069	Gene expression patterns define pathways correlated with loss of differentiation in lung adenocarcinomas	S and Beer, D, Creighton, C, Hanash	FEBS Letters	2003	12681502	\N	\N
1070	Mining gene expression databases for assocation rules	C and Hanash, Creighton, S	Bioinformatics	2003	12499296	\N	\N
1071	Global profiling of the cell surface proteome of cancer cells uncovers an abundance of proteins with chaperone function	Tra, Brichory, Jang, Shin, Puravs, F, R, D and Hanash, Michael, Yim, Le Naour, Wang, S, E, C, H, J, A, B, Misek, Zhao	Journal of Biological Chemistry	2002	12493773	\N	\N
1072	ProMAT: Protein Microarray Analysis Tool	Varnum SM, Anderson KK, Zangar RC, Bollinger N, White AM, Daly DS	Bioinformatics	2006	16595561	\N	\N
1073	Advancing ELISA microarray technology into a high-throughput system for cancer biomarker validation.	White, Zangar RC, AM, Daly DS	Expert Rev. Proteomics	2006	16445349	\N	\N
1074	Polymorphisms, Mutations, and Amplification of the EGFR Gene in Non-Small Cell Lung Cancers	Shay JW, Estess P, Kato H, Wistuba II, Siegelman M, Takahashi T, Suzuki M, Feng Z, Shigematsu H, Gazdar AF, Marchetti A, Nomura M, Li L, Spitz MR, Minna JD	PLOS Med	2007	17455987	\N	\N
1075	Polymorphisms, Mutations, and Amplification of the EGFR Gene in Non-Small Cell Lung Cancers	Wistuba II, Estess P, Gazdar AF, Takahashi T, Minna JD, Shay JW, Marchetti A, Suzuki M, Kato H, Shigematsu H, Nomura M, Spitz MR, Feng Z, Li L, Siegelman M	PLOS Med	2007	17455987	\N	\N
1076	Scale-based normalization of spectral data	Randolph T	Disease Markers	2006	17192066	\N	\N
1077	SELDI-TOF-MS Whole Serum Proteomic Profiling With IMAC Surface Does Not Reliably Detect Prostate Cancer	Oelschlager D, Wright GL, Srivistava S, Lin D, Zhu L, Partin A, Chan DW, Malik G, Thompson IM, Zhang Z, Bigbee WL, Cazares LH, Troyer D, Dahlgren J, Thornquist M, Kagan J, Semmes J, Grizzle WE, Diaz J, Feng Z, Randolph T, McLerran D, Sokoll L	Clinical Chemistry	2008	18024530	\N	\N
1078	SELDI-TOF-MS Whole Serum Proteomic Profiling With IMAC Surface Does Not Reliably Detect Prostate Cancer	Cazares LH, Sokoll L, Partin A, Troyer D, Wright GL, Randolph T, Chan DW, Thornquist M, Kagan J, Diaz J, Srivistava S, Thompson IM, Zhu L, Bigbee WL, Grizzle WE, Feng Z, Malik G, Lin D, Semmes J, Zhang Z, Dahlgren J, Oelschlager D, McLerran D	Clinical Chemistry	2008	18024530	\N	\N
1079	Estimating the capacity for improvement in risk prediction with a marker	Gu W, Pepe MS	Biostatistics	2009	18714084	\N	\N
1080	SELDI-TOF-MS Whole Serum Proteomic Profiling With IMAC Surface Does Not Reliably Detect Prostate Cancer	Troyer D, Zhu L, Dahlgren J, Diaz J, Grizzle WE, Randolph T, Chan DW, Sokoll L, Bigbee WL, Malik G, Srivistava S, Zhang Z, Thornquist M, Kagan J, Cazares LH, Wright GL, Lin D, Thompson IM, Oelschlager D, Semmes J, Feng Z, McLerran D, Partin A	Clinical Chemistry	2008	18024530	\N	\N
1081	SELDI-TOF-MS Whole Serum Proteomic Profiling With IMAC Surface Does Not Reliably Detect Prostate Cancer	Randolph T, Dahlgren J, Thornquist M, Kagan J, Semmes J, Lin D, Zhu L, Oelschlager D, Bigbee WL, Wright GL, Diaz J, Zhang Z, Srivistava S, Partin A, Malik G, Cazares LH, McLerran D, Chan DW, Grizzle WE, Feng Z, Troyer D, Thompson IM, Sokoll L	Clinical Chemistry	2008	18024530	\N	\N
1082	SELDI-TOF-MS Whole Serum Proteomic Profiling With IMAC Surface Does Not Reliably Detect Prostate Cancer	Cazares LH, Lin D, Zhang Z, Randolph T, Zhu L, Wright GL, Srivistava S, Semmes J, Chan DW, Thornquist M, Grizzle WE, McLerran D, Kagan J, Bigbee WL, Oelschlager D, Sokoll L, Feng Z, Partin A, Thompson IM, Diaz J, Malik G, Dahlgren J, Troyer D	Clinical Chemistry	2008	18024530	\N	\N
1083	SELDI-TOF-MS Whole Serum Proteomic Profiling With IMAC Surface Does Not Reliably Detect Prostate Cancer	Feng Z, Malik G, Diaz J, McLerran D, Srivistava S, Lin D, Chan DW, Cazares LH, Grizzle WE, Kagan J, Dahlgren J, Randolph T, Wright GL, Partin A, Semmes J, Thornquist M, Zhu L, Oelschlager D, Troyer D, Zhang Z, Bigbee WL, Sokoll L, Thompson IM	Clinical Chemistry	2008	18024530	\N	\N
1084	Effect of CpG methylation at different sequence context on acrolein-and BPDE-DNA binding and mutagenesis.	Chung FL, Weng MW, Wang HT, Wu XR, Pan J, Tang MS., Rom W, Chen WC, Yobin M	Carcinogenesis	2013	23042304	\N	\N
1085	Variant Cizl is a circulating biomarker for early-stage lung cancer.	IJ, Watson, Ainscough JFX, Higgins G, Coverley D., Rom WN, Roper KM, Pass HI, Blackhall FH	Proc Nat&#39;l Acad Science	2012	23074256	\N	\N
1087	Fibulin-3 as a blood and effusion biomarker for pleural mesothelioma	Carbone M, Levin SM, Chia D, Goodman GE, de Perrot M, Thornquist MD, Huflejt M, Goparaju C, Pass HI, Chiriboga L, Melamed J, Goodglick L, Harbut MR, Liu G, Donington J, Tsao MS	The New England journal of medicine	2012	23050525	\N	\N
1088	Prostate cancer cell phenotypes based on AGR2 and CD10 expression	True LD, Corey E, Goodglick L, Dumpit R, Mah V, Maresh EL, Kim SR, Ho ME, Bagryanova L, Morrissey C, Nelson PS, Liu AY, Chia D, Horvath S, Alavi M, Quek SI, Vessella RL	Modern pathology : an official journal of the United States and Canadian Academy of Pathology, Inc	2013	23348903	\N	\N
1089	Cigarette smoke induces methylation of the tumor suppressor gene NISCH.	Mohammed., David; Hoque, Rafael; Greenberg, William; Sidransky, Alissa; Rom, Kimberly; Michailidi, Christina; Guerrero-Preston, Ostrow	Epigenetics	2013	23503203	\N	\N
1090	Expression of phosphorylated raf kinase inhibitor protein (pRKIP) is a predictor of lung cancer survival	Maresh EL, Chia D, Rivera-Pazos CM, Chatterjee D, Yoon NK, Hernandez-Cueto A, Vega MI, Huerta-Yepez S, Mah V, Goodglick L, Bonavida B, Horvath S	BMC cancer	2011	21689459	\N	\N
1091	Na,K-ATPase is a target of cigarette smoke and reduced expression predicts poor patient outcome of smokers with lung cancer	Wu DC, Sampson VB, Chia D, Rajasekaran AK, Mah V, Fishbein MC, Langhans SA, Sarafian T, Alavi M, Harper J, Dubinett SM, Huynh TP, Horvath S, Goodglick L	American journal of physiology. Lung cellular and molecular physiology	2012	22345575	\N	\N
1092	Humoral response profiling reveals pathways to prostate cancer progression.	Wei JT, Chinnaiyan AM, Laxman B, Sreekumar A, Nesvizhskii AI, Kalyana-Sundaram S, Pal M, Ghosh D, Yu J, Menon A, Taylor BS, Omenn GS, Lubman DM, Zhao R	Molecular and Cellular Proteomics	2008	18077443	\N	\N
1094	Statistical methods for analyzing tissue images---algorithmic scoring and co-training	Linden M, Wang P, Yan D, Randolph T, Knudsen B	Annals of Applied Statistics	2012	22984376	\N	\N
1095	Bioinformatics: Biomarkers of early detection	Crichton DJ, Anton K, Mattmann CA, Hughes JS, Thornquist M	Cancer biomarkers : section A of Disease markers	2011	22112493	\N	\N
1096	Cruciferous vegetable supplementation in a controlled diet study alters the serum peptidome in a GSTM1-genotype dependent manner	Randolph TW, Chen C, Lampe JW, Brauer HA, Mitchell BL, Lampe PD, Yasui YY, Li L, Libby TE	Nutrition Journal	2011	21272319	\N	\N
1097	Problems with risk reclassification methods for evaluating prediction models	Pepe MS	American Journal of Epidemiology	2011	21555714	\N	\N
1098	Commentary: Reporting standards are needed for evaluations of risk reclassification	Janes H, Pepe MS	International journal of epidemiology	2011	21571811	\N	\N
1099	Assessing Treatment-Selection Markers using a Potential Outcomes Framework	Janes H, Huang Y, Gilbert PB	Biometrics	2012	22299708	\N	\N
1100	Efficient use of longitudinal CD4 counts and viral load measures in survival analysis	Ding J, Baeten JM, Overbaugh J, Tien J, Randolph TW, Holte SE, McClelland RS	Statistics in Medicine	2012	22415871	\N	\N
1101	Quantifying LC-MS/MS data by ion abundance and spectral count: two case studies	Milac T, Randolph T, Wang P	Statistics and Its Interface	2012	24163717	\N	\N
1102	Prevalidation of salivary biomarkers for oral cancer detection	Abemayor E, Wong DT, Lingen M, Randolph T, Zhou H, Feng Z, Xiao H, Akin D, Sinha U, Hu S, Chia D, Reiss J, Wang J, Elashoff D, Kastratovic DA, Nabili V, Morris D, Arellano M, Le A, Henson B, Messadi D, Wang M	Cancer Epidemiology, Biomarkers & Prevention	2012	22301830	\N	\N
1103	Higher levels of GATA3 predict better survival in women with breast cancer.	Goodglick L., Apple S, Horvath S, Maresh EL, Elshimali Y, Yoon NK, Mah V, Chia D, Shen D, Chang HR, Bose S	Human Pathology	2010	21078439	\N	\N
1104	Differential expression of anterior gradient gene AGR2 in prostate cancer.	Liu AY, Horvath S, Maresh EL, Chia D, Zhou Y, Alavi M, Liebeskind ES, Bagryanova L, Knutzen LA, Goodglick L., Mah V	BMC Cancer.	2010	21144054	\N	\N
1105	Higher expression levels of 14-3-3sigma in ductal carcinoma in situ of the breast predict poorer outcome.	Seligson DB, Mah V, Maresh E, Goodglick L., Bose S, Sulur G, Elshimali Y, Li A, Bonavida B, Yoon NK, Horvath S, Chia D	Cancer Biomark	2009	19729831	\N	\N
1106	Snail promotes CXCR2 ligand-dependent tumor progression in non-small cell lung carcinoma.	Goodglick L, Hong L, Yanagawa J, Dubinett SM., Sharma S, Mah V, Strieter RM, Magyar CE, Fishbein MC, Chia D, Lee JM, Luo J, Walser TC, Elashoff DA, St John MA, Dohadwala M, Zhu LX	Clinical Cancer Research	2009	19887480	\N	\N
1107	Elevated MED28 expression predicts poor outcome in women with breast cancer.	Elshimali Y, Yoon NK, Goodglick L., Maresh EL, Chia D, Li A, Horvath S, Seligson DB	BMC Cancer.	2009	20584319	\N	\N
1109	Unlocking biomarker discovery: Large scale application of aptamer proteomic technology for early detection of lunc cancer.	and Brody EN., Ostroff RM, Rom WN, Siegfried JM, Gold L, Weissfeld JL, Stewart A, Williams S, Pass HI, Walker JJ, Bigbee WL, Franklin W, Mehan M, Miller YE, Zichi D	PLoS ONE 2010	2010	21170350	\N	\N
1111	Global Levels of Histone Modifications Predict Prognosis in Different Cancers.	McBrian MA, Tze S, Yu H, Seligson DB, Horvath S, Goodglick L, Wang Q, Mah V, Kurdistani SK., Chia D	American Journal of Pathology	2009	19349354	\N	\N
1113	Analysis of genetic and epigenetic alterations of the PTEN gene in gastric cancer	Meltzer SJ, Sakata K, Usuba O, Motoyama T, Zou T, Sato K, Endoh Y, Tsuchiya T, Kimura W, Terashima M, Nishizuka S, Tamura G	Virchows Archiv	2002	11964046	\N	\N
1114	Artificial neural networks distinguish among subtypes of neoplastic colorectal lesions	Zou T, Harpaz N, Wang S, Leytin A, Abraham JM, Yin J, Liu TC, Sato F, Xu Y, Mori Y, Selaru F, Twigg C, Shibata D, Meltzer SJ, Olaru A	Gastroenterology	2002	11874992	\N	\N
1115	Hypermethylation of the p14&#060;sup&#062;ARF&#060;/sup&#062; gene in ulcerative colitis-associated colorectal carcinogenesis	Yin J, Selaru F, Zou T-T, Sato F, Leytin A, Meltzer SJ, Wang S, Xu Y, Harpaz N, Shibata D, Mori Y, Desai K, Abraham JM	Cancer Research	2002	11861396	\N	\N
1116	Global gene expression profiling in Barrett’s esophagus and esophageal cancer: a comparative analysis using cDNA microarrays	Wang S, Meltzer SJ, Selaru F, Sato F, Mori Y, Greenwald BD, Abraham JM, Xu Y, Yin J, Shustova V, Zou T, Krasna MJ	Oncogene	2002	11821959	\N	\N
1117	Application of cDNA microarrays to generate a molecular taxonomy capable of distinguishing between colon cancer and normal colon	Sato F, Shustova V, Zou T, Meltzer SJ, Selaru F, Liu TC, Mori Y, Yin J, Xu Y, Abraham JM	Oncogene	2002	12101425	\N	\N
1118	Aberrant methylation of the CDH13 (H-cadherin) promoter region in colorectal cancers and adenomas	Toyooka KO, Meltzer SJ, Harada K, Sato F, Shivapurkar N, Makarla P, Miyajima K, Gazdar AF, Sathyanarayana UG, Yin J, Toyooka S	Cancer Research	2002	12067979	\N	\N
1120	Activation of the Esophagin Promoter during Esophageal Epithelial Cell Differentiation	Abraham JM, Souza RF, Meltzer SJ, Fleisher AS, Smolinski KN, Kong D, Wang S, Zou T-T, Yin J	Genomics	2002	12036303	\N	\N
1121	Genetic modeling of human urinary bladder carcinogenesis	Ro JY, Johnston DA, Logothetis C, Li  L*, von Eschenbach  AC, Chaturvedi V, Czerniak  B	Genes, Chromosomes & Cancer	2000	10719370	\N	\N
1122	Instabilotyping reveals novel unique mutational spectra in microsatellite-unstable gastric cancers	Leggett B, Selaru M, Matsubara N, Olaru A, Abraham JM, Xu Y, Perry K, Stine OC, Zou T-T, Sato F, Young J, Meltzer SJ*, Kimos MC, Yin J, Mori Y, Wang S, Tamura G, Shibata D, Nukiwa T	Cancer Research	2002	12097267	\N	\N
1123	Defining the role of mass spectrometry in cancer diagnostics	Semmes OJ	Cancer Epidemiology, Biomarkers & Prevention	2004	15466969	\N	\N
1124	Measurement reproducibility in the early stages of biomarker development	Liggett WS, Barker PE, Cazares LH, Semmes OJ	Disease Markers	2004	15665389	\N	\N
1125	SELDI-TOF serum profiling for prognostic and diagnostic  classifiication of breast cancers	Laronga C, Semmes OJ, Becker S, Cazares L, Drake R	Disease Markers	2004	15258337	\N	\N
1126	Expression of genes and proteins specific for prostate cancer	Semmes OJ, Gelman E	Journal of Urology	2004	15535438	\N	\N
1128	Validation of SELDI-TOF Protein Profiling for Identification of Prostate Cancer	Conrads TP, Ahang Z, Thornquist MD, Srivastavas, Semmes OJ, Johnsey D, Verma M, Grizzle W, Thompson I, Bigbe WL, Kagan J, Jendoubi M, McCarthy DB, Carroll C, Zou Z, Feng Z, Leach RJ, Adam BL, Izbecka E	Disease Markers	2004	15258333	\N	\N
1130	Semi-parametric estimation of time dependent ROC curves for longitudinal marker data	Heagerty P., Zheng Y	Biostatistics	2004	15475423	\N	\N
1131	Design of studies to compare accuracy of tests for detecting presence of disease	Moskowitz C., Alonzo T, Pepe MS	Statistics in Medicine	2002	11870820	\N	\N
1132	A data-analytic strategy for protein-biomarker discovery: profiling of high-dimensional proteomic data for cancer detection	Adam B-L, Wright G Jr, Winget M, Pepe M, Thornquist M, Qu Y, Feng Z, Yasui Y, Potter JD, Thompson ML	Biostatistics	2003	12925511	\N	\N
1133	An automated peak-identification / calibration procedure for high-dimensional protein measures from mass spectrometers	Adam B-L, Thornquist M, McLerran D, Winget M, Feng Z, Yasui Y	Journal of Biomedicine and Biotechnology	2003	14615632	\N	\N
1134	Selecting differentially expressed genes from microarray experiments	Longton G, Pepe MS, Schummer M, Anderson G	Biometrics	2003	12762450	\N	\N
1135	Factors Influencing Serum CA125II Levels in Healthy Postmenopausal Women	Skates SJ, McIntosh M, Symecko HL, Pauler DK, Jacobs IJ, Menon U	Cancer Epidemiology, Biomarkers & Prevention	2001	11352859	\N	\N
1136	Screening Based on the Risk of Cancer Calculation from Bayesian Hierarchical Change-Point Models of Longitudinal Markers	Pauler DK, Skates SJ, Jacobs IJ	Journal of the American Statistical Association	2001	N/A	\N	\N
1137	Mitotic phosphorylation of histone H3: Spatio-temporal regulation by mammalian Aurora kinases	Kimura M, David Allis C, Sasson-Corsi P, Maria Fimia G, Zhou H, Okano Y, Loury R, Sen S, Crosio C	Molecular and Cellular Biology	2002	11784863	\N	\N
1138	Genetic variation in CYP19A1  and risk of breast cancer and fibrocystic breast conditions among women in Shanghai, China	Fish S, Lin MG, Ray  RM, Loomis  MM, Zhao LP, Gao  DL, Doherty JA, Stalsberg H, Chen C, Fan  W, Feng  Z, Sakoda  LC, Thomas DB	Cancer Epidemiology, Biomarkers & Prevention	2008	19064562	\N	\N
1139	Assessing the Diagnostic Accuracy of a Sequence of Tests	Thompson ML	Biostatistics	2003	12925502	\N	\N
1140	Smoke exposure, histologic type and geography related differences in the methylation profiles of non-small cell lung cancer	Roth J, Minna J, Fukuyama Y, Zochbauer-Muller S, Shimizu K, Lee H, Toyooka K, Maruyama R, Shimizu N, Sugio K, McLerran D, Virmani A, Gilcrease M, Fong K, Gazdar A, Chen C, Feng Z, Tsukuda K, Toyuooka S	International Journal of Cancer	2003	12455028	\N	\N
1141	Bridging the gap.  An ELISA microarray platform for validating cancer biomarkers.	Zangar, R.C.	BIOforum Europe	2006	N/A	\N	\N
1143	Evaluation of surface chemistries for antibody microarrays.	Baird, R.C., Rodland, S.L., A.M., Seurynck-Servoss, White, and Zangar, C.L., K.D.	Anal. Biochem.	2007	17718996	\N	\N
1144	Gender and lung cancer	J, Rom WN, Gasperino	Clin Lung Cancer	2004	15217534	\N	\N
1145	Bias-reduced estimators and confidence intervals for odds ratios in genome-wide association studies	Zhong H and Prentice RL	Biostatistics	2008	18310059	\N	\N
1146	Biomarker evaluation using the controls as a reference population	Huang Y, Pepe MS	Biostatistics	2009	18755739	\N	\N
1147	Gauging the performance of SNPs, biomarkers and clinical factors for predicting risk of breast cancer (editorial)	Pepe MS, Janes HE	Journal of the National Cancer Institute	2008	18612128	\N	\N
1148	Pivotal evaluation of the accuracy of a biomarker used for classification or prediction: Standards for study design	Janes H, Pepe MS, Bossuyt P and Potter J, Feng Z	Journal of the National Cancer Institute	2008	18840817	\N	\N
1149	Evaluating the ROC performance of markers for future events	Levy W, Pepe MS, Zheng Y, Jin Y, Parikh C, Huang Y	Lifetime Data Analysis	2008	18064569	\N	\N
1150	A Multiparametric serum Kallikrein panel for diagnosis of non-small cell Lung Carcinoma	Planque C, Chia D, Li L, Reckamp K, Diamandis E and Goodglick L, Zheng Y, Soosaipillai A	Clinical Cancer Research	2008	18316555	\N	\N
1151	Glutathione S-transferase M1 and P1 polymorphisms and risk of breast cancer and fibrocystic breast conditions in Chinese women	Doherty J, Sakoda L, Thomas D, Ray R, Chen C, Lin M, Gao D, Stalsberg H, Xue K, Blackston C, Feng Z	Breast  Cancer Research and Treatment	2008	17624589	\N	\N
1152	Three-Tiered Risk Stratification Model to Predict Progression in Barrett&#39;s Esophagus Using Epigenetic and Clinical Features	Wu T-T, Greenwald BD, Yfantis HG, Fredericksen MB, Hamilton JP, Paun B, Cheng Y, Abraham JM, Schulmann K, Feng Z, Wang J, Kan T, David S, Mori Y, Olaru A, Yang J, Sato F, Wang KK, Romero Y, Ito T, Canto M, Jin Z, Meltzer SJ	PLoS ONE	2008	18382671	\N	\N
1153	Time-dependent predictive values of prognostic biomarkers with failure time outcome	Pepe MS, WC, Levy, Zheng Y, Cai T	Journal of the American Statistical Association	2008	19655041	\N	\N
1154	Recruitment to multicentre trials -- lessons from UKCTOCS: descriptive study.	Ryan A, Menon U, Oram D, McGuire A, Skates S, Williamson K, Murdoch J, Herod J, Campbell S, Mould T, Dobbs S, Cruickshank D, Woolas R, Hallett R, Gentry-Maharaj A, Lopez A, Lewis S, Sharma A, Jacobs I, Amso N, Seif M, Parmar M, Burnell M, Fallowfield L, Godfrey K, Leeson S, Scott I	British Medical Journal	2008	19008269	\N	\N
1155	Identification of epithelial cell adhesion molecule autoantibody in patients with ovarian cancer	Mok SC, Feltmate CM, Wong KK, Berkowitz RS, Uede T, Schorge JO, Cramer DW, Kim JH, Skates SJ	Clinical Cancer Research	2003	14581349	\N	\N
1156	Semiparametric methods for evaluating risk prediction markers in case-control studies	Huang Y, Pepe MS	Biometrika	2009	22822247	\N	\N
1158	The use of multiple novel tumor biomarkers for the detection of ovarian carcinoma in patients with a pelvic mass	Brown AK, Jr, Moore RG, Steinhoff M, Allard WJ, Miller MC, Bast RC, Skates S, Granai CO, Verch T, DiSilvestro P, Messerlian G	Gynecologic Oncology	2008	18061248	\N	\N
1159	Prospective Accuracy for Longitudinal Markers	Heagerty P, Zheng, Y	Biometrics	2007	17688486	\N	\N
1160	Insights into latent class analysis of diagnostic test performance	Janes H, Pepe MS	Biostatistics	2007	17085745	\N	\N
1161	Application of a methylation gene panel by quantitative PCR for lung cancers	Suzuki M, Shivapukar N, Feng Z, Thunnissen F, Stastny V, Gazdar A, Prinsen C, Hol B, Li L, Zheng Y, Wistuba I	Cancer Letters	2007	16644104	\N	\N
1162	Polymorphisms, Mutations, and Amplification of the EGFR Gene in Non-Small Cell Lung Cancers	Takahashi T, Estess P, Minna JD, Shay JW, Siegelman M, Nomura M, Li L, Marchetti A, Spitz MR, Kato H, and Gazdar AF, Feng Z, Wistuba II, Shigematsu H, Suzuki M	PLOS Med	2007	17455987	\N	\N
1164	Evaluating the predictiveness of a continuous marker	Pepe MS, Huang Y, and Feng Z	Biometrics	2007	17489968	\N	\N
1165	Matching in studies of classification accuracy: Implications for analysis, efficiency, and assessment of incremental value	Janes H, Pepe MS	Biometrics	2008	17501939	\N	\N
1166	Optimal use of a panel of methylation markers with GSTP1 hypermethylation in the diagnosis of prostate adenocarcinoma	Sun,DI, Epstein,JI, Harden,SV, Tokumaru,Y, Yamashita,K, Sidransky,D	Clinical Cancer Research	2004	15328191	\N	\N
1168	Quantitative RARbeta2 hypermethylation: a promising prostate cancer marker	Oliveira,J, Teixeira,MR, Sidransky,D, Jeronimo,C, Henrique,R, Hoque,MO, Fonseca,D, Ribeiro,FR, Lopes,C	Clinical Cancer Research	2004	15217932	\N	\N
1170	Quantitative GSTP1 methylation levels correlate with Gleason grade and tumor volume in prostate needle biopsies	Sidransky,D, Tokumaru,Y, Epstein,JI, Zhou,M	The Journal of Urology	2004	15126784	\N	\N
1171	Detecting cervical cancer by quantitative promoter hypermethylation assay on cervical scrapings: a feasibility study	Buikema,HJ, Cohen,Y, Tokumaru,CY, Dong,SM, Wisman,GB, Sidransky,D, Suurmeijer,AJ, Hollema,H, Klip,HG, van derZee,AG, Reesink-Peters,N, Boezen,HM, Jeronimo,C	Mol Cancer Res	2004	15192122	\N	\N
1172	Detection of promoter hypermethylation of multiple genes in the tumor and bronchoalveolar lavage of patients with lung cancer	Lee,J, Moon,CS, Ratovitski,E, Topaloglu,O, Hoque,MO, Sidransky,D, Tokumaru,Y	Clinical Cancer Research	2004	15073103	\N	\N
1173	The Human MitoChip:  a high-throughput sequencing microarray for mitochondrial mutation detection	Hoque,MO, Califano,J, Sidransky,D, Maitra A, Shah,N, Mambo,E, Fukushima,N, Cohen,Y, Gillespie,SE, Chakravarti,A, Goggins,M	Genome Res	2004	15123581	\N	\N
1174	Detection of LOH and mitochondrial DNA alterations in ductal lavage and nipple aspirate fluids from high risk patients	Liu,M, Singh,B, Pennanen,M, Haddad,BR, Sidransky,D, Shankar,LK, Rone,JD, Gallagher,A, Isaacs,C, Cavalli,LR, Freedman,M, Cohen,Y, Dickerson,RB	Breast Cancer Res Treat	2004	14999140	\N	\N
1175	Aspects of the design and analysis of high-dimensional SNP studies for disease risk estimation	Prentice RL and Qi L	Biostatistics	2006	16443924	\N	\N
1176	Sample size and analysis for paired study designs comparing the predictive values of binary diagnostic tests	Moskowitz CS, Pepe MS	Clinical Trials	2006	16895044	\N	\N
1177	Combining Results of Microarray Experiments:  A Rank Aggregation Approach	Clegg N, Hawley S, Falcon S, Etzioni R, DeConde RP	Statistical Applications in Genetics and Molecular Biology	2006	17049026	\N	\N
1179	Distinctive serum protein profiles involving abundant proteins in lung cancer patients based upon antibody microarray analysis	Orchekowski RP, Hanash SM, Greenberg AK, Brenner DE, Haab BB, Rom WN, Kuick R, Omenn GS, WM, Misek DE, Qiu J, Gao	BMC Cancer	2005	16117833	\N	\N
1180	Quantitative Analysis of Acrylamide Labeled Serum Proteins by LC-MS/MS	Coram M, McIntosh M, Zhang Q, Fitzgibbon M, Faca V, Glukhova V, Phanstiel D, Hanash S	Journal of Proteome Research	2006	16889424	\N	\N
1181	Challenges in deriving high-confidence protein identifications from data gathered by a HUPO plasma proteome collaborative study	Fermin D, Hanash SM, Omenn GS, Eng J, Speicher DW, States DJ, Blackwell TW	Nature Biotechnology	2006	16525410	\N	\N
1182	MicroRNA dysregulation in cancer: diagnostics, monitoring and therapeutics. A comprehensive review	Iorio MV, Croce CM	EMBO molecular medicine	2012	22351564	\N	\N
1183	Causes and consequences of microRNA dysregulation	Croce CM, Iorio MV	Cancer journal (Sudbury, Mass.)	2012	22647357	\N	\N
1184	MicroRNA-1 is a candidate tumor suppressor and prognostic marker in human prostate cancer	Borin JF, Esposito D, Watkins SK, Hudson RS, Naslund MJ, Stephens RM, Alexander RB, Yi M, Lee DH, Yfantis HG, Dorsey TH, Ambs S, Croce CM, Hurwitz AA	Nucleic acids research	2012	22210864	\N	\N
1186	microRNA involvement in human cancer	Iorio MV, Croce CM	Carcinogenesis	2012	22491715	\N	\N
1187	miR-EdiTar: a database of predicted A-to-I edited miRNA target sites	Russo F, Pulvirenti A, Cascione L, Gasparini P, Shasha D, Giugno R, Macca V, Ferro A, Veneziano D, Nigita G, Paone A, Carasi S, Laganà A, Croce CM	Bioinformatics (Oxford, England)	2012	23044546	\N	\N
1188	MiR-494 is regulated by ERK1/2 and modulates TRAIL-induced apoptosis in non-small-cell lung cancer through BIM down-regulation	Romano G, Croce CM, Bolon B, Acunzo M, Condorelli G, Cascione L, Zanca C, Di Leva G, Garofalo M	Proceedings of the National Academy of Sciences of the United States of America	2012	23012423	\N	\N
1189	miRNAs in precancerous lesions of the gastrointestinal tract	Fassan M, Croce CM, Rugge M	World journal of gastroenterology : WJG	2011	22219591	\N	\N
1190	miRNAs in the spotlight: Understanding cancer gene dependency	Croce CM	Nature medicine	2011	21818092	\N	\N
1192	Classification versus association models: should the same methods apply?	Feng Z	Scandinavian Journal of  Clinical and Laboratory Investigation. Supplementum	2010	20515278	\N	\N
1193	Boosting with missing predictors	Feng Z, Wang CY	Biostatistics	2010	19948743	\N	\N
1194	Glycosylation variants of mucins and CEACAMs as candidate biomarkers for the diagnosis of pancreatic cystic neoplasms	Barnes D, Yue T, Haab BB, Anderson MA, Scheiman J, Simeone DM, Porter A, Feng Z, Li L, Schmidt CM	Annals of Surgery	2010	20395854	\N	\N
1196	Ulcerative colitis-associated colorectal cancer arises in a field of short telomeres, senescence, and inflammation	Brentnall TA, Rabinovitch PS, Feng Z, Lai LA, Risques RA, Al-Lahham B, Kowdley KV, Himmetoglu C, Bronner MP, Li L, Ebaee A, Lindor KD	Cancer Research	2011	21363920	\N	\N
1197	Canary Prostate Active Surveillance Study: design of a multi-institutional active surveillance cohort and biorepository	Feng Z, Brooks JD, Newcomb LF, Lin DW, Nelson PS, Thompson IM, Gleave ME, Carroll PR	Urology	2010	19758683	\N	\N
1198	Borrowing information across populations in estimating postive and negative predictive values	Fong Y, Huang Y, Wei J, Feng Z	Journal of Royal Statistical Society, Series C	2011	22021938	\N	\N
1199	Assessing risk prediction models in case-control studies using semiparametric and nonparametric methods	Pepe MS, Huang Y	Statistics in Medicine	2010	20527013	\N	\N
1200	Multifocal lung cancers - clonality vesus field cancerization and does it matter?	Minna JD, Gazdar AF	Journal of the National Cancer Institute	2009	19351914	\N	\N
1201	Investigation of complement activation product c3d as a diagnostic and prognostic biomarker for lung cancer	Torre W, Jantus-Lewintre E, Camps C, Corrales L, de-Torres JP, Pajares MJ, Perez-Garcia JL, Montuega LM, Agorreta J, Lozano MD, Ajona D, Pio R, Zulueta JJ, Massion PP	J Natl Cancer Inst	2013	23940286	\N	\N
1202	Identification of Androgen-regulated Genes by Serial Analysis of Gene Expression and Proteomic Analysis	Hanash, Waghray, Feroze, Schober, S and Chen YQ, F, E, C, Puravs, A, Wood, Yao, M, Krause	Proteomics	2001	11721644	\N	\N
1203	Two messenger RNAs and five isoforms for Po66-CBP, a galectin-8 homolog in a human lung carcinoma cell line	Bourguet P, Hanash S, Dazord L, Brichory F, Le Pennec J, Bidon N	Gene	2001	11675018	\N	\N
1204	Proteomics-based identification of RS/DJ-1 as a novel circulating tumor antigen in breast cancer	Le Naour F, Deneux L, Giordano TJ, Misek DE, Krause MC, and Hanash SM	Clinical Cancer Research	2001	11705844	\N	\N
1205	Differential Methylation of a Short CpG-Rich Sequence within Exon 1 of TCF21 Gene: A Promising Cancer Biomarker Assay	Thunnissen FB, Stastny V, Prinsen C, Xie Y, Minna JD, Czerniak B, Frenkel E, Shivapurkar N, Gazdar AF	Cancer Epidemiology, Biomarkers & Prevention	2008	18398044	\N	\N
1285	Integrating the predictiveness of a marker with its performance as a classifier	Thompson IM, Longton G, Prentice R, Feng Z, Huang Y, Pepe MS, Zheng Y	American Journal of Epidemiology	2008	17982157	\N	\N
1206	Understanding the development of human bladder cancer by using a whole-organ genomic mapping strategy	Shen L, Majewski T, Jeong J, Johnston DA, Czerniak B., Wu XF, McConkey DJ, Grossman HB, Yoon DS, Tang KS, Gazdar A, Bar-Eli M, Kim MS, Filipek S, Lee S, Narod SA, Bondaruk J, Scherer SE, Issa JP, Harris RA, Tuziak T, Ahmed SS, Baggerly K, Dinney CP, Chung W, Lynch HT, Watson P, Snyder C, Zhou JH, Kram A, Benedict WF, Park WS	Laboratory Investigation	2008	18458673	\N	\N
1207	A blood-based proteomic classifier for the molecular characterization of pulmonary nodules	Butler H, Law S, Massion PP, Hayward C, Gingras O, Lamontagne J, McLean M, Rom WN, Kearney P, Li XJ, Dominguez M, Allard R, Lam S, Schirm M, Hood L, Vachani A, Chelsky D, Hunsucker SW, Pass H, Lee LW, Fong PY, Fang KC, Price ND	Sci Transl Med	2013	24132637	\N	\N
1208	Proteomic analysis of cytokeratin isoforms uncovers association with survival in lung adenocarcinoma	Hanash S and Beer DG, Giordano TJ, Yee J, Huang C-C, Wang H, Gharib TG, Chen G, Taylor JMG, Orringer MB, Shedden K, Thomas DG, Prescott MS, Misek DE, Kardia S	Neoplasia	2002	12192603	\N	\N
1209	A distinct repertoire of autoantibodies in hepatocellular carcinoma identified by proteomic analysis	Le Naour F, Hanash SM and Beretta L, Brechot C, Misek DE, Brichory F	Molecular and Cellular Proteomics	2002	12096119	\N	\N
1210	Cytoglobin, the newest member of the globin family, functions as a tumor suppressor gene	Wistuba, Czerniak B, Field JK, Xinarianos G, Minna JD, Shivapurkar N, Stastny V, Xie Y, Liloglou T, Roth JA, Okumura N, Girard L, II, Gazdar AF, Prinsen C, Thunnissen FB, Frenkel E	Cancer Research	2008	18794132	\N	\N
1211	Predictors of contralateral prophylactic mastectomy in women with a BRCA1 or BRCA2 mutation	Manoukian S, Ghadirian P, Lynch H, Domchek S, Weitzel J, Moller P, Lubinski J, Friedman E, Gronwald J, Isaacs C, Kim-Sung C, Sun P, Tung N, Narod SA, Wagner T, Foulkes WD, Ainsworth P, Metcalfe KA, Cummings S, Hereditary Breast Cancer Clinical Study Group	Journal of Clinical Oncology	2008	18195327	\N	\N
1212	Serum MMP-2 and TIMP-2 Expression in Ovarian Cancer	Graves LE, Stack MS, Matzel H, Fishman DA, Rademaker AW	Cancer	2002	N/A	\N	\N
1214	Activation of MAPKs ERK1/2 in Ovarian Derived Cell Lines	Stack S, Santiago JY, Fishman DA, Woodruff TK, Dunn MH, Roberson M	The Journal of Biological Chemistry	2002	N/A	\N	\N
1215	In silico estimates of tissue components in surgical samples based on expression profiling data	Sawyers A, Xia XQ, McClelland M, Mercola D, Jia Z, Wang-Rodriquez J, Yao H, Wang Y	Cancer research	2010	20663908	\N	\N
1216	Sputum-Based Molecular Biomarkers for the Early Detection of Lung Cancer; Limitations and Promise.	Rom WN., Kim CE, Tchou-Wong KM	Cancers 2011	2011	24212941	\N	\N
1218	Mutator activity induced by miR-155 links inflammation and cancer.	Wernicke D, Michaillea J-J, Volinia S and Croce CM., Costinean S, Tili E, Alder H	Proc. Nat. Acad. Sci, USA	2011	21383199	\N	\N
1219	Mutated beta-catenin evades a microRNA dependent regulatory loop.	D’Abbundo L, Visone R, Negrini M, Ferracin M, Bolondi L, Veronese A, Gramantieri L, Miotto E, Lovat F, Croce CM., Perrotti D, Kim T, Consiglio J, Acunzo M, Balatti V, Lupini L, Pekarsky Y	Proc. Nat. Acad. Sci, USA	2011	21383185	\N	\N
1220	MicroRNAs: master regulators as potential therapeutics in cancer	Garofalo M, Croce CM.	Annual Review Toxicology and Pharmacology	2011	20809797	\N	\N
1221	MicroRNA-21 (miR-21) induces resistance to 5-fluorouracil by down-regulating human DNA MutS homolog 2 (hMSH2)	Valeri N, Fabbri M, Lovat F, Alder H, Braconi C, Fishel R and Croce CM., Nuovo GJ, Paone A, Amadori D, Sumani KM, Gasparini P, Patel  T	Proc. Nat. Acad. Sci, USA	2010	21078976	\N	\N
1222	CpG island hypermethylation-associated silencing of non-coding RNAs transcribed from ultraconserved regions in human cancer.	Rossi S, Portela A, Spizzo R, Esteller M., Croce CM, Melo SA, Lujambio A, Calin GA, Liz J	Oncogene	2010	20802525	\N	\N
1223	Adopting nested case-control quota sampling designs for the evaluation of risk markers	Cai T, Zheng Y, Pepe MS	Lifetime Data Analysis	2013	23807695	\N	\N
1225	The risk of biopsy-detectable prostate cancer using the prostate cancer prevention Trial Risk Calculator in a community setting	Thompson IM, Feng Z, Stanford JL, Liang Y, Ankerst DP, Fu R	Urologic Oncology	2013	22552047	\N	\N
1226	Pro-surfactant protein B as a biomarker for lung cancer prediction	Sin DD, Barnett MJ, Tammemagi CM, Goodman GE, Auman H, Feng Z, Taguchi A, Tam A, Hanash S, Duan X, Lam S	Journal of Clinical Oncology	2013	24248694	\N	\N
1228	Aberrant expression of mucin core proteins and o-linked glycans associated with progression of pancreatic cancer	Mandel U, Lazenby AJ, Wandall HH, DiMaio DJ, Anderson JM, Remmers N, Linde EM, Hollingsworth MA, Clausen H, Yu F	Clinical cancer research : an official journal of the American Association for Cancer Research	2013	23446997	\N	\N
1229	Design and estimation for evaluating principal surrogate markers in vaccine trials	Gilbert PB, Huang Y, Wolfson J	Biometrics	2013	23409839	\N	\N
1230	Altered miRNA expression in sputum for diagnosis of non-small cell lung cancer.	Todd NW, Alattar M, Deepak J, Stass SA, Xie Y, Zhan M, Jiang F, Fang H, Peng H, Liu Z	Lung Cancer	2010	19446359	\N	\N
1231	Combined genetic analysis of sputum and computed tomography for noninvasive diagnosis of non-small cell lung cancer.	Todd NW, Jiang F, Stass SA, Katz RL, Qiu Q,Liu Z	Lung Cancer	2009	19181417	\N	\N
1232	Expression levels of estrogen receptor beta in conjunction with aromatase predict survival in non-small cell lung cancer.	Horvath S, Marquez D, Zhang L, Goodglick L., Chia D, Fishbein MC, Bagryanova L, Yoon N, Maresh EL, Pietras R, Alavi M, Mah V	Lung Cancer	2011	21511357	\N	\N
1234	Fluorescent metal nanoshell probe to detect single miRNA in lung cancer cell.	Zhang J, Jiang F, Mei Y, Fu Y, Lakowicz JR.	Anal Chem.	2010	20433154	\N	\N
1235	Small nucleolar RNA signatures as biomarkers for non-small cell lung cancer.	Guarnera M, Li R, Liao J, Yu L. Mei Y, Jiang F., Liu Z, Shen J	Molecular Cancer	2010	20663213	\N	\N
1236	Altered miRNA expression in sputum for diagnosis of non-small cell lung cancer.	Fang H, Zhan M, Xie Y, SA, Liu Z, Stass, Todd NW, Alattar M. Deepak J, Peng H	Lung Cancer	2010	19446359	\N	\N
1237	Combined genetic analysis of sputum and computed tomography for noninvasive diagnosis of non-small cell lung cancer.	Jiang F, Stass SA., Todd NW, Liu Z, Qiu Q, Katz RL	Lung Cancer	2009	19181417	\N	\N
1239	Plasma microRNAs are potential biomarkers for non-small cell lung cancer.	Yu L, Jiang F., Todd NW, Katz RL, Jiang Z, Liao J, Fang H, Lu CL, Mei Y, Guarnera M, Zhang H, Chou A, Lingxiao X, Shen J	Laboratory Investigation	2011	21116241	\N	\N
1240	Identification of putative oncogenes in lung adenocarcinoma by a comprehensive functional genomic approach.	Katz RL, Li R, Jiang F., Yin Z, NP, Caraway, Stass SA, Wang H	Oncogene	2006	16369491	\N	\N
1241	Prediction of survival in patients with esophageal carcinoma using artificial neural networks.	SA, Shibata D, Meltzer SJ., Maeda M, Imamura M, Mori Y, Sato F, Stass, Selaru F, Shimada Y, Watanabe G	Cancer	2005	15751017	\N	\N
1242	Reconstitution of galectin-3 alters glutathione content and potentiates TRAIL-induced cytotoxicity by dephosphorylation of Akt	Kim HR, Kim JH, Li L, Song YK, Siervo-Sassi RR, Song JJ, Lokshin A, Lee YJ, Spitz DR	Experimental Cell Research	2003	12878156	\N	\N
1243	Proteomic approaches within the NCI early detection research network for the discovery and identification of cancer biomarkers	Verma M, Wright Jr. GL, Hanash SM, Srivastava S, Gopal-Srivastava R	Annals of the New York Academy of Sciences	2001	11708463	\N	\N
1244	Boosted decision tree analysis of SELDI mass spectral serum profiles discriminates prostate cancer from non-cancer patients	Yasui Y, Semmes OJ, Ward MD, Adam B-L, Feng Z, Qu Y, Wright Jr. GL, Schellhammer PF, Cazares LH	Clinical Chemistry	2002	12324514	\N	\N
1246	Development of a novel proteomic approach for the detection of transitional cell carcinoma of the bladder in urine	Kondylis FI, Mendrinos S, Gong L, Patel K, Vlahou A, Schellhammer PF, et al	American Journal of Pathology	2001	11290567	\N	\N
1247	Proteomics in early detection of cancer	Sriniva PR, Srivastava S, Wright Jr. GL, Hanash S	Clinical Chemistry	2001	11568117	\N	\N
1248	Proteomic approaches to biomarker discovery in prostate and bladder cancers	Vlahou A, Semmes OJ, Adam B-L, Wright Jr. GL	Proteomics	2001	11721637	\N	\N
1249	Interrogating DNA repair in cancer risk assessment (Editorial Comment)	Paz-Elizur, Brenner DE, T, Livneh Z	Cancer Epidemiology, Biomarkers & Prevention	2005	16030087	\N	\N
1250	Hypermethylation of the hMLH1 gene promoter is associated with microsatellite instability in early human gastric neoplasia	James SP, Tamura G, Kong D, Fleisher AS, Esteller M, Wilson KT, Yin J, Meltzer SJ, Zou TT, Herman JG, Rashid A, Stine OC	Oncogene	2001	11313962	\N	\N
1251	Genetic Delections in Sputum as Diagnostic Markers for Early Detection of Stage I Non-Small-Cell Lung Cancer.	Katz R, S, Jiang F., Fang H, Rodgers W, Todd N, Stass, Li R, Zhao R, Qiu Q, Fan T	Clinical Cancer Research	2007	17255269	\N	\N
1252	Quantitative GSTP1 methylation clearly distinguishes benign prostatic tissue and limited prostate adenocarcinoma	Epstein,JI, Harden,SV, Guo,Z, Sidransky,D	The Journal of Urology	2003	12576869	\N	\N
1253	Autoantibody Signatures in Prostate Cancer.	D., Rubin, M.G., Wei, X. Yu, Kantoff, Sreekumar, S., Mehra, J.T., Shen, Ghosh, Montie, J.E., P.W., Varambally, Sanda, K.J., M.A., A.M., A., Pienta, J., Chinnaiyan, R. Giacherio, Wang, R.	New England Journal of Medicine	2005	16177248	\N	\N
1255	Protein profiling in urine for the diagnosis of bladder cancer	Vlahou A, Manousakas T, Wright GL, Semmes OJ, Schellhammer PF, Gregory BW, Wilson LL, Giannopoulos A, Kondylis FI	Clinical Chemistry	2004	15277356	\N	\N
1256	Endothelin B receptor gene hypermethylation in prostate adenocarcinoma	Jeronimo,C, Henrique,R, Sidransky,D, Oliveira,J, Lopes,C, Caballero,OL, Campos,PF	J clin Pathol	2003	12499435	\N	\N
1257	cPSA as a staging tool for prostate cancer: a prospective study in 420 men	Bruzek DJ, Chan DW, Wallerson G, Partin AW, Dunn W, Mangold LA, Mohr P, Epstein JI, Sokoll LJ	Urology	2002	12384158	\N	\N
1259	Partially supervised learning using an EM-boosting algorithm	Feng Z, Hsu L, Yasui Y, Adam B-L, Pepe M	Biometrics	2004	15032790	\N	\N
1260	Phases of biomarker development for early detection of cancer	Pepe MS, Potter J, Thornquist M, Etzioni R, Winget M, Feng Z, Yasui Y	Journal of the National Cancer Institute	2001	11459866	\N	\N
1262	Biomarker-Based Methods for Determining Non-compliance in a Prevention Trial	Crowley J, Gower KB, Goodman P, Pauler DK, Thompson I	Controlled Clinical Trials	2002	12505245	\N	\N
1263	Partial AUC estimation and regression	Pepe MS, Dodd L	Biometrics	2003	14601762	\N	\N
1264	Combining biomarkers to detect disease with application to prostate cancer	Etzioni R, Pepe MS, Smith R, Kooperberg C, Gann P	Biostatistics	2003	14557109	\N	\N
1265	Effect of storage temperatures on the stability of cytokines in cervical mucous	Nisenbaum R, Lee DR, Meadows K, Panicker G, Unger ER	Cytokines	2007	17449271	\N	\N
1267	Familial pancreatic carcinoma in Jews	Deters CA, Brand RE, Lynch JF, Lynch HT	Familial Cancer	2004	15516847	\N	\N
1268	Semiparametric Models of Time-dependent Predictive Values of Prognostic Biomarkers	Cai T, and Stanford J, Feng Z, Zheng Y	Biometrics	2010	19397579	\N	\N
1269	Conditional Estimation of Sensitivity and Specificity from a Phase 2 Biomarker Study Allowing Early Termination for Futililty	Pepe MS, Koopmeiners J, Feng Z, Longton G	Statistics in Medicine	2009	19097251	\N	\N
1270	Activated leukocyte cell adhesion molecule: A novel biomarker for breastcancer	Zheng Y, Leon AE, Soosaipillai A, Gion M and Diamandis E, Kulasingam V	International Journal of Cancer	2009	19322904	\N	\N
1271	Accommodating covariates in ROC analysis	Longton G and Pepe M, Janes H	Stata	2009	20046933	\N	\N
1272	Adjusting for covariate effects on classification accuracy using the covariate adjusted ROC curve	Janes H, Pepe MS	Biometrika	2009	22822245	\N	\N
1273	A parametric ROC model based approach for evaluating the predictiveness of continuous markers in case-control studies	Huang Y, Pepe MS	Biometrics	2009	19459841	\N	\N
1274	Multianalyte tests for the early detection of cancer: speedbumps and barriers.	Chatterjee M, Abrams J., Levin NK, Draghici S, Tainsky MA	Biomark Insights	2007	19662209	\N	\N
1275	Osteopontin as an adjunct to CA125 in detecting recurrent ovarian cancer.	Mok SC, Rajanbabu R, Drake RD, Kim JH, Berkowitz RS, Schorge JO, Miller DS, Cramer DW, Lee H, Skates SJ	Clinical Cancer Research	2004	15161704	\N	\N
1276	Urokinase-type plasminogen activator receptor: a beacon of malignancy?	Clauss A, Skates S, Drapkin R	Clinical Cancer Research	2008	18794069	\N	\N
1277	Promoter hypermethylation profile of ovarian epithelial neoplasms	Toyooka KO, Gazdar AF, Minna JD, Schorge JO, Makarla PB, Ashfaq R, Toyooka S, Saboorian MH	Clinical Cancer Research	2005	16061849	\N	\N
1279	Annexin XI Is Associated with Cisplatin Resistance and Related to Tumor Recurrence in Ovarian Cancer Patients	Zhang Z, Song J, Chan DW, Salani R, Shih IeM	Clinical Cancer Research	2007	17982121	\N	\N
1280	Clinical utility of five genetic variants for predicting prostate cancer risk and mortality	Lin DW, Koopmeiners J, Kwon EM, FitzGerald L, Salinas C, Ostrander EA, Feng Z, Stanford JL	Prostate	2009	19058137	\N	\N
1281	Observational studies, clinical trials and the Women&#39;s Health Initiative. Lifetime Data Analysis	Prentice RL	Lifetime Data Analysis	2007	17943443	\N	\N
1282	A practical multifaceted approach to selecting differentially expressed genes	Pepe MS, Zheng, Y	Cancer Informatics	2007	19455259	\N	\N
1283	A multiparametric panel for ovarian cancer diagnosis, prognosis and response to chemotherapy	Diamandis E, Kim N, Zheng Y, Simon I, Scorilas A, Feng Z, Li L, Massobrio M, Shan S, Longrais I, Wolfert R, Katsaros D	Clinical Cancer Research	2007	18056174	\N	\N
1284	Invited discussion of ‘The skill plot: a graphical technique for evaluating diagnostic tests	Pepe MS	Biometrics	2008	N/A	\N	\N
1287	Letter to the editor regarding “Special Report, Use and Misuse of the Receiver Operating Characteristic Curve in Risk Prediction	Pepe MS, Gu JW, Janes H	Circulation 2007	2007	17679623	\N	\N
1289	Polymorphisms in the Glutathione S-Transferase M1, T1, and P1 Genes and Prostate Cancer Prognosis	Agalliu l, Stanford J, Salinas C, Lin D, Feng Z	Prostate	2006	16921513	\N	\N
1290	Decreased mitochondrila DNA content in posttreatment salivary rinses from head and neck cancer pateints	Mambo,E, Masayesva,B, Alberg,AJ, Sidransky,D, Zahurak,M, Westra,WH, Carvalho,AL, Koch,W, Zhou,S, Califano,JA, Jiang,WW, Rosenbaum,E	Clinical Cancer Research	2006	16533782	\N	\N
1291	Frequency and phenotypic implications of mitochondrial DNA mutations in human squamous cell cancers of the head and neck	Maitra,A, Carducci,M, Poeta,L, Mithani,SK, Wu,G, Chuang,A, Glazer,C, Califano,D, Verma,A, Kachhap,S, Koch,W, Zhou,S, Chatterjee,A, Grumbine,L, Sidransky,D, Westra,WH, McFAte,T, Sun,W	Proc Natinal Acad Sci USA	2007	17456604	\N	\N
1292	Inverse correlation between RASSF1A hypermthylation, KRAS and BRAF mutations in cervical adenocarcinoma	SY, Dong,SM, Sidransky,D, Kang,S, Seo,SS, Kim,HS, Park	Gynecologic Oncology	2007	17360030	\N	\N
1293	Mitochondrial DNA content increase in response to cigarette smoking	Masayesva,BG, Sidransky,D, Mambo,E,Taylor,RJ, Alberg,AJ, Zhou,S, Goloubeva,OG, Cohen,Y, Califano,J, Minhas,K, Koch,W, Sciubba,J	Cancer Epidemiology, Biomarkers & Prevention	2006	16434581	\N	\N
1294	Detection of serum deoxyribonucleic acid ,ethylation markers: a novel diagnostic tool for thyroid cancer	Tufaro,AP, Ewertz,M, Basaria,S, Tufano,RP, Carvalho,AL, Cooper,DS, Liu,D, Hu,S, Brait,M, Ladenson,PW, Sidransky,D	J Clin Endocrinol Metab	2006	16263813	\N	\N
1295	A quantitative promoter methylation profile of prostate cancer	Lopes,C, Jeronimo,C, Ribeiro,FR, Oliveira,J, Henrique,R, Teixeira,MR, Hoque,MO, Sidransky,D, Varzim,G, Mambo,E	Clinical Cancer Research	2004	N/A	\N	\N
1296	Molecular margin analysis predicts local recurrence after sublobar resection of lung cancer	Masasyesva,BG, Pilkington,T, Califano,J, Goldenberg,D, Harden,S, westra,WH, Tong,BC, Brock,MV, Sidransky,D	International Journal of Cancer	2005	15515012	\N	\N
1298	A functional annotation of subproteomes in human plasma	Yang Z, Gronborg M, Rekha B, Gerszten RE, Gandhi TK, Hancock WS, Hanash SM, Kellmann M, Paik YK, Peri S, Menon R, Shet AS, Chaerkady R, Raftery M, Drwal G, Omenn GS, Wasinger V, Wu H, States DJ, Ping P, Kwon MS, Cho SY, Molina H, Schulz-Knappe P, Vondriska TM, Suresh S, Creighton CJ, Pandey A	Proteomics	2005	16104058	\N	\N
1299	Evaluation of expression based markers for the detection of breast cancer cells	Friedman PN, and Marks JR, Henslee J, Huper G, Stenzel T, Brown NM	Breast Cancer Research and Treatment	2006	16319979	\N	\N
1300	A wide range of protein isoforms in serum and plasma uncovered by a quantitative intact protein analysis system	Strahler JR, Galchev V, Omenn GS, Amunugama R, Hanash SM, Deng B, Kuick R, Wang H, Walker AK, Zhao R, Misek DE, Tra J, Pisano MR, Andrews P, Allen D	Proteomics	2005	16047307	\N	\N
1302	TAFII70 isoform specific growth suppression correlates with its ability to complex with the GADD45 protein	and Marks JR, Wang W, Nahta R, Huper G	Molecular Cancer Research	2004	15328371	\N	\N
1303	Association of polymorphisms in the cyclin D1 and XPD genes and susceptibility to cancers of the upper aero-digestive tract.	Grandis JR, Zhu B, Odom D, Buch S, Davis AG, Siegfried JM, Romkes M.	Molecular Carcinogenesis	2005	15754315	\N	\N
1304	Multianalyte profiling of serum cytokines for detection of pancreatic cancer.	Winans MT, Lokshin AE., Moser A, Gorelik E, Siegfried JM, Landsittel DP, Lotze MT, Velikokhatnaya L, Lee K, Zeh HJ, Marrangoni AM, Bartlett D, Whitcomb D, Slivka A, Winikoff S, Bigbee WL	Cancer Biomarkers	2005	17192050	\N	\N
1305	Expressed pseudogenes in the transcriptional landscape of human cancers	Kumar-Sinha C, Asangani IA, Prensner JR, Lonigro RJ, Shankar S, Kothari V, Iyer MK, Cao X, Barrette T, Kalyana-Sundaram S, Shanmugam A, Chinnaiyan AM, Wu YM, Dhanasekaran SM, Palanisamy N, Robinson DR	Cell	2012	22726445	\N	\N
1306	The mutational landscape of lethal castration-resistant prostate cancer	Cao X, Robinson DR, Ateeq B, Siddiqui J, Lonigro RJ, Wu YM, Asangani IA, Raphael BJ, Prensner JR, Jing X, Dhanasekaran SM, Sam L, Vandin F, Grasso CS, Chinnaiyan AM, Brenner JC, Khan AP, Ryslik GA, Quist MJ, Pienta KJ, Chun SY, Rhodes DR, Palanisamy N, Mehra R, Tomlins SA, Anstett M, Kunju LP	Nature	2012	22722839	\N	\N
1308	SLC45A3-ELK4 chimera in prostate cancer: spotlight on cis-splicing	Kumar-Sinha C, Chinnaiyan AM, Kalyana-Sundaram S	Cancer discovery	2012	22787087	\N	\N
1309	Pathway-directed weighted testing procedures for the integrative analysis of gene expression and metabolomic data	Poisson LM, Chinnaiyan AM, Ghosh D, Sreekumar A	Genomics	2012	22497771	\N	\N
1310	Role of microRNAs in lymphoid biology and disease	Fabbri M, Croce CM	Current opinion in hematology	2011	21519241	\N	\N
1311	Exome sequencing identifies recurrent SPOP, FOXA1 and MED12 mutations in prostate cancer	Lander ES, Stransky N, Voet D, Garraway LA, Stojanov P, Rubin MA, Chae SS, Morrissey C, Gabriel SB, Moch H, Kitabayashi N, Baca SC, Mosquera JM, Hussain WM, Boysen G, Ardlie K, Park K, Sheikh K, Blattner M, Sivachenko A, Golub TR, Auclair D, Redman MC, Vuong T, Meyerson M, Cibulskis K, Rupp N, Theurillat JP, Onofrio RC, Guiducci C, MacDonald TY, Winckler W, Ramos AH, Barbieri CE, Tewari AK, Saksena G, Demichelis F, Carter SL, Nelson PS, Getz G, Wild PJ, Nickerson E, Kantoff PW, Van Allen E, White TA, Lawrence MS	Nature genetics	2012	22610119	\N	\N
1312	From sequence to molecular pathology, and a mechanism driving the neuroendocrine phenotype in prostate cancer	Boutros PC, Shukin R, Wyatt AW, Fazli L, Hajirasouliha I, Lapuk AV, Hach F, Wang Y, Zhao Y, Anderson S, Maher CA, Sahinalp SC, Fanjul A, Bell RH, Beltran H, Hurtado-Coll A, Mo F, Zoubeidi A, Gleave ME, Collins CC, Hormozdiari F, Wu C, Jones EC, Chinnaiyan AM, Marra MA, Rubin MA, Volik SV, Bristow RG, McPherson A, Haegert A, Brahmbhatt S, McConeghy BJ	The Journal of pathology	2012	22553170	\N	\N
1313	Systematic, evidence-based discovery of biomarkers at the NCI	Prensner JR, Srivastava S, Chinnaiyan AM	Clinical & experimental metastasis	2012	22868876	\N	\N
1314	Gene fusions associated with recurrent amplicons represent a class of passenger aberrations in breast cancer	Chinnaiyan AM, Shankar S, Palanisamy N, Iyer MK, Kumar-Sinha C, Kalyana-Sundaram S, Deroo S	Neoplasia (New York, N.Y.)	2012	22952423	\N	\N
1315	Measuring the performance of markers for guiding treatment decisions	Pepe MS, Bossuyt PM, Janes H, Barlow WE	Annals of Internal Medicine	2011	21320940	\N	\N
1316	The potential of genes and other markers to inform about risk	Morris DE, Gu JW, Pepe MS	Cancer Epidemiology, Biomarkers & Prevention	2010	20160267	\N	\N
1317	Strengthening the reporting of genetic risk prediction studies (GRIPS): explanation and elaboration	Kraft P, Janes H, Freedman AN, Hlatky MA, Ioannidis JP, Janssens AC, Melillo S, Gwinn M, Bedrosian S, Gulcher J, Grimshaw JM, Fortier I, Boffetta P, Dolan SM, O, Dowling N	European journal of clinical investigation	2011	21434890	\N	\N
1318	Strengthening the reporting of genetic risk prediction studies (GRIPS): explanation and elaboration	Gwinn M, Gulcher J, Bedrosian S, Dowling N, Kraft P, Grimshaw JM, Janes H, Janssens AC, Freedman AN, Boffetta P, Fortier I, O, Dolan SM, Ioannidis JP, Hlatky MA, Melillo S	European Journal of Epidemiology	2011	21424820	\N	\N
1319	Strengthening the reporting of genetic risk prediction studies (GRIPS): explanation and elaboration	Bedrosian S, Hlatky MA, O, Janssens AC, Freedman AN, Kraft P, Dolan SM, Fortier I, Ioannidis JP, Gulcher J, Janes H, Boffetta P, Dowling N, Grimshaw JM, Melillo S, Gwinn M	European Journal of Human Genetics	2011	21407270	\N	\N
1320	Strengthening the reporting of Genetic RIsk Prediction Studies (GRIPS): explanation and elaboration	Melillo S, O, Gulcher J, Boffetta P, Ioannidis JP, Dolan SM, Dowling N, Kraft P, Fortier I, Bedrosian S, Hlatky MA, Grimshaw JM, Janssens AC, Gwinn M, Janes H, Freedman AN	Journal of  Clinical Epidemiology	2011	21414753	\N	\N
1321	Accommodating Covariates in ROC Analysis	Pepe M, Janes H, Longton G	The Stata journal	2009	20046933	\N	\N
1322	Estimation and comparison of receiver operating characteristic curves	Pepe MS, Longton G, Janes H	Stata Journal	2009	20161343	\N	\N
1323	Response to Dr. Stern &quot;Assessing the value of risk predictions by using risk-stratification tables&quot;	Gu JW, Pepe MS, Janes H	Annals of Internal Medicine	2009	N/A	\N	\N
1324	RANTES expression is a predictor of survival in stage I lung adenocarcinoma	Arenberg DA, Orringer MB, Chen G, Huang CC, Thomas DG, Hanash S and Beer DG, Moran CJ, Giordano TJ, Misek DE, Iannettoni MD	Clinical Cancer Research	2002	12473593	\N	\N
1325	Overexpression of oncoprotein 18 correlates with poor differentiation in lung adenocarcinomas	Orringer MB, Iannettoni MD, Taylor JM, Hanash SM and Beer DG, Shedden KA, Giordano TJ, Thomas DG, Chen G, Kuick R, Gharib TG, Misek DE, Huang CC, Kardia SL, Wang H	Molecular and Cellular Proteomics	2003	12644570	\N	\N
1326	Transforming Properties of a Q18--&#062;E mutation of the microtubule regulator Op18 in esophageal cancer	Misek DE, Hinderer R, Chang CL, Kuick R, Beer DG and Hanash SM, Giordano TJ	Cancer Cell	2002	12242154	\N	\N
1328	Proteomic analysis of elF5A in lung adenocarcinomas	Gharib TG, Orringer MB, Hanash SM and Beer DG, Thomas DG, Iannettoni MD, Kuick R, Giordano TJ, Misek DE, Huang CC, Chen G	Proteomics	2003	12687616	\N	\N
1330	Increased C-CRK proto-oncogene expression is associated with an aggressive phenotype in lung adenocarcinomas	Gharib TG, Yee J, Wang H, Thomas DG, Miller CT, Misek DE, Giordano TJ, Hanash SM and Beer DG, Orringer MB, Chen G	Oncogene	2003	12970743	\N	\N
1332	Protein profiles associated with survival in lung adenocarcinoma.	Misek DE, Thomas DG, Iannettoni MD, Hanash SM and Beer DG, Chen G, Hogg PJ, Taylor JMG, Yee J, Shedden KA, Kuick R, Wang H, Kardia SLR, Giordano TJ, Huang C-C, Gharib TG, Orringer MB	Proceedings of the National Academy of Sciences	2003	14573703	\N	\N
1334	Tumor Vaccines for Breast Cancer	Anderson KS	Cancer Investigation	2009	19358018	\N	\N
1335	Pepitome: evaluating improved spectral library search for identification complementarity and quality assessment	Chambers MC, Carpenter KL, Tabb DL, Martinez MA, Ham AJ, Dasari S, Vega-Montoto LJ	Journal of proteome research	2012	22217208	\N	\N
1336	Biologic Characteristics of Premalignant Breast Disease	Anderson KS, Cole K, Tabernero M	Cancer Biomarkers: Section A of Disease Markers	2010	22112476	\N	\N
1337	GeLC-MRM quantitation of mutant KRAS oncoprotein in complex biological samples	Halvey PJ, Liebler DC, Ferrone CR	Journal of proteome research	2012	22671702	\N	\N
1338	Proteomic analysis of exosomes from mutant KRAS colon cancer cells identifies intercellular transfer of mutant KRAS	Whitwell C, Li M, Higginbotham JN, Liebler DC, Coffey RJ, Ham AJ, Halvey PJ, Franklin JL, Imasuen IE, Demory Beckler M	Molecular & cellular proteomics : MCP	2013	23161513	\N	\N
1339	Identifying proteomic LC-MS/MS data sets with Bumbershoot and IDPicker	Holman JD, Ma ZQ, Tabb DL	Current protocols in bioinformatics / editoral board, Andreas D. Baxevanis ... [et al.]	2012	22389012	\N	\N
1340	Protein identification using customized protein sequence databases derived from RNA-Seq data	Tabb DL, Liebler DC, Slebos RJ, Zhang B, Halvey PJ, Wang X, Wang D	Journal of proteome research	2012	22103967	\N	\N
1341	Aging of tissue-resident adult stem/progenitor cells and their pathological consequences	Mimeault M, Batra SK	Panminerva medica	2009	19776709	\N	\N
1343	The &quot;omics&quot; haystack: defining sources of sample bias in expression profiling.	Semmes OJ	Clinical Chemistry	2005	16120944	\N	\N
1345	Emerging role of mucins in epithelial to mesenchymal transition	Seshacharyulu P, Chugh S, Vaz AP, Ponnusamy MP, Batra SK, Lakshmanan I	Current cancer drug targets	2013	24168188	\N	\N
1346	MicroRNA-200c modulates the expression of MUC4 and MUC16 by directly targeting their coding sequences in human pancreatic cancer	Batra SK, Mohr AM, Hollingsworth MA, Grandgenett PM, Radhakrishnan P, Steele MM	PloS one	2013	24204560	\N	\N
1347	MUC1 regulates expression of multiple microRNAs involved in pancreatic tumor progression, including the miR-200c/141 cluster	Tapprich W, Mohr AM, Radhakrishnan P, Yu F, Lewallen ME, Hollingsworth MA, Bailey JM, Liu X	PloS one	2013	24143167	\N	\N
1348	Whole transcriptome amplification for gene expression profiling and development of molecular archives.	Chinnaiyan AM, Rhodes DR, Makarov V, Mehra R, Tomlins SA, Bruening E, Rubin MA, Shah RB	Neoplasia	2006	16611408	\N	\N
1349	Expression of MUC4 mucin is observed mainly in the intestinal type of intraductal papillary mucinous neoplasm of the pancreas	Yokoyama S, Higashi M, Kitamoto S, Kitazono I, Osako M, Horinouchi M, Goto M, Shimizu T, Yonezawa S, Tabata M, Batra SK	Pancreas	2013	23921963	\N	\N
1351	Muc17 protects intestinal epithelial cells from enteroinvasive E. coli infection by promoting epithelial barrier integrity	Das S, Batra SK, Ho SB, Resta-Lenert S	American journal of physiology. Gastrointestinal and liver physiology	2011	21393431	\N	\N
1353	Nanotechnology: emerging developments and early detection of cancer	Srivastava S, Barker PE, Looney JP, Zullo S, Srinivas P	Disease Markers	2002	12590168	\N	\N
1354	High-Throughput Analysis of Telomerase by Capillary Electrophoresis	Srivastava S, Highsmith WE, Xu J, Wu OC, Hess JL, Sanow AD, Atha DH, Wang W, Miller K	Electrophoresis	2002	12652580	\N	\N
1355	p53 Regulates Epithelial-Mesenchymal Transition through MicroRNAs targeting ZEB1 and ZEB2.	Pichiorri F, Volinia S, Marchio A, Liu C-G, Kim T, Pineau P, Jeon Y-J, Suh S-S, Lee TJ, Dejean A and Croce CM., Alder H, Veronese V	J Exp Med	2011	21518799	\N	\N
1356	Modulation of repair of ultraviolet damage in the host-cell reactivation assay by polymorphic XPC and XPD/ERCC2 genotypes	Wei Q, Grossman L, Shete S, Guo Z, Sheng H, Spitz MR, Qiao Y, Hadeyati H, Mohrenweiser H	Carcinogenesis	2002	11872635	\N	\N
1357	An Association Between Asbestos Exposure, Tobacco Smoke, Myeloperoxidase (MPO) Genotypes, and Lung Cancer Risk	Gunn GB, Schabath MD, Whitehead LW, Delclos GL, Spitz MR, Wu X	American Journal of Industrial Medicine	2002	12111688	\N	\N
1358	Myeloperoxidase Polymorphism associated with reduced risk of lung cancer	Whitehead LW, Hong WK, Spitz MR, Delclos GL, Reynolds WF, Wu X, Gunn GB, Schabath MB	Lung Cancer	2002	12057865	\N	\N
1359	Breast cancer signatures for invasiveness and prognosis defined by deep sequencing of microRNA.	Volinia S, Galasso M,Sana ME, Croce CM., Huebner KF, Wise T, Palatini j	PNAS	2012	22315434	\N	\N
1360	High-throughput TRAP/PCR analysis of telomerase using capillary electrophoresis	Hess JL, Sanow AD, Wang W, Atha DH, Xu J, Highsmith WE, Miller K, Srivastava S, Wu OC	American Journal of Human Genetics	2002	N/A	\N	\N
1361	Estimates of consensus in cell selection and scoring of FISH data	Pinsky P, Hocker D, Srivastava S, Spitz M, Wang W, Barker PE, Wu X	American Journal of Human Genetics	2002	N/A	\N	\N
1363	Mitochondria C-tract alteration in premalignant lesions of the head and neck: a marker for progression and clonal proliferation	Califano,JA, Westra,WH, Sidransky,D, Ha,PK, Zahurak,M, Sanchez-Cespedes,M, Tong,BC, Parrella,P	Clinical Cancer Research	2002	12114429	\N	\N
1364	Use of high density antibody arrays to validate and discover cancer serum biomarkers	Scholler N, Sather CL, and Lampe PD, McIntosh MW, Urban ND, Ramirez AB, Liu Y, Garvik BM, Loch CM, Delrow JJ	Molecular Oncology	2007	19383305	\N	\N
1365	Characterization of TMPRSS2-ETS gene aberrations in androgen-independent metastatic prostate cancer	Rubin MA, Menon A, Yu J, Wang L, Shah RB, Tomlins SA, Mehra R, Chinnaiyan AM, Cao X, Pienta KJ	Cancer Research	2008	18483239	\N	\N
1366	Semi-parametric regression for the area under the Receiver Operating Characteristic Curve	Pepe MS, Dodd L	Journal of the American Statistical Association	2003	N/A	\N	\N
1367	Limitations of the odds ratio in gauging the performance of a diagnostic or prognostic marker	Newcomb P, Pepe MS, Longton G, Janes H, Leisenring W	American Journal of Epidemiology	2004	15105181	\N	\N
1368	Data Reduction Using a Discreet Wavelet Transform in Discriminant Analysis of Very High Dimensionality Data	Yasui Y, Schellhammer PF, Thornquist M, Dalmasso EA, Potter JD, Clements MA, Qu Y, Davis J, Cazares L, Wright GL, Thompson ML, Feng Z, Adam BL	Biometrics	2003	12762451	\N	\N
1370	Activin type II receptor restoration in ACVR2-deficient colon cancer cells induces TGF-beta response pathway genes.	Deacu E, Meltzer SJ., Xu Y, Olaru A, Sato F, Schulmann K, Sterian A, Bryant L, Abraham JM, Yin J, Wang S, Kan T, Mori Y	Cancer Research	2004	15520171	\N	\N
1372	Methylation profiling for the prediction of Barrett’s esophagus progression.	Yin J, Schulmann K, Sterian A, Sato F, Brenner DE, Wang S, Bryant L, Meltzer SJ., Krasna MJ, Xu T, Greenwald BD, Deacu E, Baron JA, Mori Y, Olaru A, Abraham JM	Gastroenterology	2004	23996928	\N	\N
1373	Promoter methylation regulates cyclooxygenase (COX-2) expression in human and murine breast cancer	Kundu N, Wilson KT, Yang Q, Fulton AM, Ma X, Meltzer SJ	Breast Cancer Research	2004	15217498	\N	\N
1374	Transcriptional responses of intestinal epithelial cells to infection with Vibrio cholerae.	Zhou X, Stokes NR, Kaper JB, Meltzer SJ	Infect Immun	2004	15213169	\N	\N
1375	A multigene expression panel for the molecular diagnosis of Barrett’s esophagus and Barrett’s adenocarcinoma of the esophagus.	Lord RV, Holscher AH, Metzger R, Schneider S, Danenberg KD, Brabender J, Yin J, Park JM, Salonga D, Schneider PM, Meltzer SJ, Danenberg PV, Marjoram P	Oncogene	2004	15107828	\N	\N
1377	An unsupervised approach to identify molecular phenotypic components influencing breast cancer features	Yin J, Selaru FM, Stass SA, Sterian A, Sato F, Xu Y, Olaru A, Shibata D, Fulton A, Baquet C, Mori Y, Wang S, Deacu E, Abraham JM, Epstein S, Meltzer SJ	Cancer Research	2004	14996713	\N	\N
1378	An LOH and mutational analysis of the ACTRII gene locus in human colorectal tumors	Abraham JM, Wang S, Mori Y, Sato F, Kimos MC, Perry K, Olaru A, Shibata D, Yin J, Xu Y, Meltzer SJ, Selaru FM, Deacu E	Laboratory Investigation	2003	14691305	\N	\N
1379	Micro RNA-221/222 confers breast cancer fulvestrant resistance by regulation multiple signaling pathways.	Nephew KP, Li M, Croce CM, Hartman-Frey C, Burow ME, Devlin C, Di Leva G, Fang F, Ivan M, Rao X	Oncogene	2011	21057537	\N	\N
1380	LINCing chromatin remodeling to metastasis.	Croce CM	Nat. Biotech.	2010	20829831	\N	\N
1381	Modulation of mismatch repair and cancer progression by miR-155.	Costinean S, Lanza G, Braconi C, Fishel R and Croce CM., Alder H, Fabbri M, Bottoni A, Lovat F, Calore F, Fanini F, Gasparini P, Nuovo GJ, Valeri N, McIlhatton MA, Ferracin M, Negrini M, Adair B, Veronese A, Vannini I, Sandhu SK, Volinia S, Gafa R, Amadori D	Proceedings National Academy of Sciences	2010	20351277	\N	\N
1382	Oncogenic Role of miR-483-3p at the IGF2/483 locus.	Bolondi L, Querzoli P, Visone R, Consiglio J, Gramantieri L, Alder H, Veronese A, Croce CM and Negrini M., D’Elia G, Lanza G, Lupini L, Angioni A, Zanesi N, Ferracin M, Forani F	Cancer Research	2010	20388800	\N	\N
1383	Interplay between microRNAs and the epigenetic machinery: An intricate network.	Iorio MV, Piovan C and Croce CM.	Biochim Biophys Acta	2010	20493980	\N	\N
1384	MicroRNA cluster 221-222 and estrogen receptor alpha interactions in breast cancer.	Gasparini PL, Iorio MV, Di Leva GP, Ngankeu A, Piovan C, Alder H, Taccioli C, Garofalo M, Liu Y, Volinia S, Li M, Nakamura T, Nuovo G, Nephew KP and Croce CM.	Journal of the National Cancer Institute	2010	20388878	\N	\N
1385	Chemoprevention of cigarette smoke-induced alterations of MicroRNA expression in rat lungs	Izzotti A, Cartiglia C, De Flora S, Croce CM, Steele VE, Longobardi M, Calin GA	Cancer Prev Research	2010	20051373	\N	\N
1386	Identification of microRNA activity by Targets’ Reverse Expression.	and Croce CM., Rossi E, Galasso M, Visone R, Volinia S	Bioinfomatics	2010	19897564	\N	\N
1387	Reprogramming of miRNA networks in cancer and leukemia.	Dejean A, Ambs S, Gamberoni G, Catozzi M, Palumbo T, Drusco A, Bottoni A, Aqeilan R, Zane, Nickoloff B, TaccioliC, Gasparini P, Garzon R, Mascellani N, Rassenti LZ, Huebner K, Marchesini J, Harris CC, Baffa R, Dillhoff M, Pichiorri F, Tagliavini L, Galasso M, Iorio MV, Sana ME, Garofalo M, Jarour R, Desponts C, Teitell M, Visone R, Di Leva G, Costinean S, Fabbri M, Kipps TJ, Bloomston M, Buendia M-A, Cairo S, Lenze D, Pineau P, Previati M, Volinia S, Pekarsky Y, Veronese A, de la Chapelle A	Genome Research	2010	20439436	\N	\N
1388	Single-Nucleotide polymorphisms inside microRNA target sites influence tumor susceptibility.	Manoukian S, Wang X, Wickramasinghe P, Xiao L, Calin GA., Shimizu M, Ravagnani F, Sun H, Secreto G, Spizzo R, Radice P, Kim H, Nicoloso MS, Croce CM, Kunej T, Ferdin J, Wojcik SE, Davuluri RV	Cancer Research	2010	20332227	\N	\N
1389	Development of common data elements: the experience and recommendations from the Early Detection Research Network	Baron JA, Spitz MR, Feng Z, Brenner DE, Kincaid H, Winget MD, Thornquist M, Warzel D	International Journal of Medical Informatics	2003	12706181	\N	\N
1390	Association of HPC2/ELAC2 polymorphisms with risk of prostate cancer in a population-based study	Noonan E, Sabacan L, Stanford J, Shu J, Feng Z, Ostrander E, Iwasaki L	Cancer Epidemiology, Biomarkers & Prevention	2003	14504198	\N	\N
1392	Vitamin D receptor gene polymorphisms and prostate cancer risk	Iwasaki L, Ostrander E, Feng Z, Langlois M, Cheteri K, Friedrichsen D, Peters M, Stanford J	The Prostate	2004	15065089	\N	\N
1393	Statistical considerations in combining biomarkers for disease classification	Yasui Y, Feng Z	Disease Markers	2004	15322313	\N	\N
1394	A web-based system for managing and coordinating multi-center studies	Kincaid H, Li L, Thornquist M, Winget M, Lin P, Kelly S	Clinical Trials	2005	16279578	\N	\N
1395	Aberrant promoter methylation profile of bladder cancer and its relationship to clinicopathologic features	Sagalowsky A, Gazdar A, Zochbauer-Muller S, Virmani AK, Toyooka S, Toyoka KO, Maruyama R, Harada K, Farinas AJ, Czerniak B, Vakar-Lopez F	Cancer Research	2001	11751381	\N	\N
1396	Filling  the void: Urinary markers for bladder cancer risk and diagnosis	Czerniak  B, Gazdar  AF	Journal of the National Cancer Institute	2001	11259458	\N	\N
1398	Mapping and Genome Sequence Analysis of Chromosome 5 Regions Involved in Bladder Cancer Progression	Ro JY, Johnston D, Czerniak B, Grossman HB, Kram  A, Zhang  RD, Scherer S, Li  L, Yoon DS	Laboratory Investigation	2001	11454992	\N	\N
1399	Functional clustering algorithm for high-dimensional proteomics data	Semmes OJ, Aruna B, Haoudi A, Bensmail H	J. Biomed. Biotechnol.	2005	16046812	\N	\N
1400	Amplification/Overexpression of a mitotic kinase gene in human bladder cancer	Jiang F, Vakar-Lopez F, Grossman H, Katz RL, Brinkley W, Johnston DA, Ruifrok AC, Czerniak B, Sen S, Zhang R, Zhou H, Ito S, Yoon D	Journal of the National Cancer Institute	2002	12208897	\N	\N
1402	Proteomic Analysis of Human Prostate Cancer Reveals Marked Heterogeneity of Tumor Alterations	Raffeld M, Chuaqui RF, Zhao Y, Gillespie JW, Flaig MJ, Best CJM, Ahram M, Emmert-Buck MR, Duray PH, Leiva I, Zhou G, Shu H, Linehan WM, Petricoin III EF, Ornstein D	Molecular Carcinogenesis	2001	11807953	\N	\N
1403	2D Differential In-gel Electrophoresis (DIGE) for the Identification of Esophageal Squamous Cell Cancer-Specific Protein Markers	Li H, Liotta LA, Emmert-Buck MR, Zhou G, Flaig M, Zhao Y, Taylor PR, Gillespie JW, Hu N, Shu H, Chen S, DeCamp D, Petricoin III EF, Gong Y	Molecular and Cellular Proteomics	2001	12096129	\N	\N
1405	Advances in Sputum Analysis for Screening and Early Detection of Lung Cancer	Tockman MS	Cancer Control	2000	10740657	\N	\N
1406	Assessing Lead Time of Selected Ovarian Cancer Biomarkers: A Nested Case-Control Study	Anderson G, et al, McIntosh M	Journal of the National Cancer Institute	2009	20042715	\N	\N
1407	Biomarkers for prostate cancer detection	Parekh DJ, Ankerst DP, Troyer D, Thompson IM, Srivastava S	The Journal of Urology	2007	17936845	\N	\N
1408	New promising drug targets in cancer- and metastasis-initiating cells	Mimeault M, Batra SK	Drug discovery today	2010	20338259	\N	\N
1409	MicroRNAs as potential biomarkers inhuman solid tumors.	Stass SA, Jiang F., Shen J	Cancer Letters	2013	23196059	\N	\N
1410	Targeted quantitation of proteins by mass spectrometry	Liebler DC, Zimmerman LJ	Biochemistry	2013	23517332	\N	\N
1412	Pathology of genetically engineered mouse models of pancreatic exocrine cancer: consensus report and recommendations	Lauwers GY, Albores-Saavedra J, Longnecker DS, Redston M, Pérez-Gallego L, Adsay NV, Klimstra DS, Furukawa T, Furth EE, Hruban RH, Offerhaus GJ, Maitra A, Anver MR, Tuveson DA, Boivin GP, Luttges J, Biankin AV, Klein A, Kloppel G	Cancer Research	2006	16397221	\N	\N
1414	Chronic pancreatic inflammation induced by environmental tobacco smoke inhalation in rats.	Batra SK, Pandey KK, Brand RE, Cullen DM, Wittel UA, Andrianifahanana M, Akhter MP, Prokopczyk B, Johansson SL	American Journal of Gastroenterology	2006	16405548	\N	\N
1415	Regulation of mucin expression: mechanistic aspects and implications for cancer and inflammatory diseases	Andrianifahanana M, Batra SK, Moniaux N	Biochimica et Biophysica Acta (BBA) - Reviews on Cancer	2006	16487661	\N	\N
1416	Mucin expression in pleomorphic adenoma of salivary gland: a potential role for MUC1 as a marker to predict recurrence	Irimura T, Hamada T, Goto M, Yonezawa S, Sugihara K, Sueyoshi K, Matsukita S, Batra SK, Kitajima S	Journal of Clinical Pathology	2004	15280401	\N	\N
1417	ErbB2 growth factor receptor, a marker for neuroendocrine cells?	Büchler MW, Andrianifahanana M, Schneider M, Moniaux N, Wisecarver JL, Ulrich A, Batra SK, Adrian TE, Standop J, Pour PM, Bridge JA, Brand RE	Pancreatology	2005	15775699	\N	\N
1419	Application of traditional clinical pathology quality control techniques to molecular pathology	Hafez MJ, Lin M-T, Liang S-L, Gocke CD, Eshleman JR, Murphy KM, Sokoll LJ	Journal of Molecular Diagnostics	2008	18258922	\N	\N
1420	[-2]proPSA for prostate cancer detection: an NCI Early Detection Research Network validation study.	Partin AW, Sanda MG, Wang Y, Sokoll LJ, Chan DW, Thompson IM, Feng Z, Kagan J	Journal of Urology	2008	18550118	\N	\N
1421	Quantitation of HER2 and telomerase biomarkers in solid tumors	Xiao Y, Gao X, Gannot G, Emmert-Buck MR, Wagner PD,, Srivastava S	International Journal of Cancer	2008	18214859	\N	\N
1422	Combining multiple serum tumor markers improves detection of stage I epithelial ovarian cancer.	Chan DW, de Bruijin HW, Woolas RP, Bast RC Jr, Skates S, Zhang Z, Havrilesky LJ, Yu Y, Xu F, van der Zee AG, van Haaften-Day C, Jacobs IJ, Berchuck A	Gynecologic Oncology	2007	17920110	\N	\N
1423	Analytical Validation of Serum Proteomic Profiling for Diagnosis of Prostate Cancer: Sources of Sample Bias	Oelschlager D, Zhang Z, Izbicka E, Yasui Y, Wright GL, Grizzle WE, Thornquist M, McLerran D, Kagan J, Banez LL, Thompson IM, Troyer D, Zhu L, Feng Z, Semmes J, Chan DW, Srivastava S, Bigbee WL, Randolph T, Rosenzweig N, Diaz J, Cazares LH, Partin A, Malik G	Clinical Chemistry	2008	17981926	\N	\N
1424	Signal detection in high-resolution mass spectrometry data	Randolph TW, McLerran DF, Cazares L, Semmes OJ, Feng Z	Journal of Proteome Research	2008	18173224	\N	\N
1425	Nanocytology for Field Carcinogenesis Detection: Novel Paradigm for Lung Cancer Risk Stratification	Backman V, Hensing T, Roy HK	Future Oncology	2010	21174531	\N	\N
1427	A framework for evaluating biomarkers for early detection: validation of biomarker panels for ovarian cancer	Skates SJ, Berg CD; PLCO Project Team, Zhang Z, Hartge P, Cramer DW, Marrangoni AM, Pinsky PF, Ward DC, Buys SS, Zhu CS, Vitonis A, Lokshin AE, Symanowski JT, Moore LE, Lomakin A, Sluss PM, Srivastava S, McIntosh MW, Mor G, Patriotis C, Fung ET, Lu KH, Pfeiffer RM, Ransohoff DF, Bast RC Jr, Urban N, Scholler N	Cancer Prevention Research	2011	21372037	\N	\N
1428	Aurora-A and p16 polymorphisms contribute to an earlier age at diagnosis of pancreatic cancer in Causians	Li D, Sen S, Evans DB, Chen J, Amos CI, Killary AM, Wei C, Abbruzzese JL, Frazier ML	Clinical Cancer Research	2007	17505013	\N	\N
1429	DNMT1 stability is regulated by proteins coordinating deubiquitination and acetylation-driven ubiquitination	Wang Z, Song J, Sedwick D, Markowitz SD, Zhao Y, Guda K, Xu Y, Du Z, Kao HY, Ewing RM, Willis J, Wang Y, Yang S	Science signaling	2010	21045206	\N	\N
1431	PUMA-mediated intestinal epithelial apoptosis contributes to ulcerative colitis in humans and mice	Schoen RE, Regueiro MD, Buchanan ME, Wu B, Qiu W, Hartman DJ, Zhang L, Wang X, Yu J	The Journal of clinical investigation	2011	21490394	\N	\N
1432	Allele-specific expression of TGFBR1 in colon cancer patients	Tanner SM, Hampel H, de la Chapelle A, Natale L, Tomsic J, Guda K, Markowitz SD, Liyanarachchi S	Carcinogenesis	2010	20705955	\N	\N
1433	One year recurrence of aberrant crypt foci	Charabaty A, Umar A, Schoen RE, Seligson D, Pinsky PF, Mutch M, Dry S, Fleshman J, Rall C	Cancer prevention research (Philadelphia, Pa.)	2010	20570885	\N	\N
1434	Chemoprevention by nonsteroidal anti-inflammatory drugs eliminates oncogenic intestinal stem cells via SMAC-dependent apoptosis	Yu J, Okada H, Oue N, Liu H, Qiu W, Leibowitz B, Wang X, Clevers H, Yasui W, Barker N, Zhang L, Schoen RE	Proceedings of the National Academy of Sciences of the United States of America	2010	21041628	\N	\N
1437	Fine Mapping of the NRC-1 Tumor Suppressor Locus within Chromosome 3p12	and Killary, Zhang, F., Lott, A.M., K., S.T., Jin	Biochemical and Biophysical Research Communications	2007	17624313	\N	\N
1438	Aurora-A and p16 Polymorphisms contribute to an earlier age at diagnosis of Pancreatic Cancer in Caucasians.	Wei C, Killary AM, Amos CI, Sen S, Evans DB, Li D, Chen J, Frazier ML., Abbruzzese JL	Clinical Cancer Research	2007	17505013	\N	\N
1439	Biomarkers from Protein Microarrays	Tainsky, MA, Chatterjee M, Ali-Fehmi R,Draghici S	BIOforum Europe	2006	N/A	\N	\N
1440	Tissue inhibitor of metalloproteinases-3 promoter methylation is an independent prognostic factor for bladder cancer	Goodman SN, Jeronimo C, Westra WH, Schoenberg M, Zahurak M,. Ostrow KL, Hoque MO, Begum S, Rosenbaum E, Trock B, Sidransky D, Brait M	The Journal of Urology	2008	18082200	\N	\N
1441	Epigentic silencing of human T (brachyury homologue) gene in non-small-cell lung cancer	Kim MS, Ostrow K, Lee J, Son CH, Sidransky D, Chae YK, Park JC, Moon C, Hoque MO	Biochem Bipphys Res Commun,	2008	17980147	\N	\N
1442	Novel molecular targets for risk identification: DNA repair enzyme activities	Krupsky M, Livneh Z, Paz-Elizur T, Schechtman E, Elinger D, Blumenstein S	Cancer Biomarkers	2007	17611303	\N	\N
1443	Reduced repair of the oxidative 8-oxoguanine DNA damage and risk of head and neck cancer	Vexler A, Elinger D, Berrebi A, Livneh Z, Krupsky M, Freedman L, Paz-Elizur T, Ben-Yosef R, Shani A, Schechtman E	Cancer Research	2006	17178863	\N	\N
1446	Epigenetic silencing of CDX2 is a feature of squamous esophafeal cancer	Herman JG, Brock MV, Guo M, House MG, Suzuki H, Liu Z, Ye Y, Rustgi AK, Lu F	International Journal of Cancer	2007	17534889	\N	\N
1449	Secondary chemoprevention of Barrett&#39;s esophagus with celecoxib:  results of a randomized trial	Herman JG, Forastiere AA, Montgomery E, Hawk E, Weinstein WM, Piantadosi S, Yang VW, Dannenberg AJ, Canto MI, and the Chemoprevention for Barrett&#39;s Esophagus Trial Research Group, Shar AO, Heath El	Journal of the National Cancer Institute	2007	17405999	\N	\N
1450	Mitochondrial resequencing arrays detect tumor-specific mutations in sa;ivary rinses of patients with head and neck cancer	Koch WM, Mithani SK, Maitra A, Smith IM, Califano JA, Gray A, Zhou S	Clinical Cancer Research	2007	18094415	\N	\N
1451	Disease proteomes	Hanash S	Nature	2003	12634796	\N	\N
1452	Harnessing immunity for cancer marker discovery	Hanash, S	Nature  Biotechnology	2003	12511908	\N	\N
1453	Teaching genomics, proteomics and informatics	Hanash S	Nature Cell Biology	2003	N/A	\N	\N
1454	Multi-dimensional liquid based separations in proteomics	S, H and Hanash, Wang	Journal of Chromotography	2003	12659729	\N	\N
1455	The human proteome organization: a mission to advance proteome knowledge	Hanash, JE, S and Celis	Molecular and Cellular Proteomics	2002	12169681	\N	\N
1456	The need for an organized effort in proteomics	Hanash S	Current Opinion in Molecular Therapeutics	2002	N/A	\N	\N
1457	Identification of tumor-associated antigens using proteomics	F, Beretta, SM, Brichory, Le Naour, L and Hanash	TCRT	2002	12625784	\N	\N
1458	Contributions of proteome profiling to the molecular analysis of cancer	S, Wang, H and Hanash	TCRT	2002	12625782	\N	\N
1459	High throughput detection of M6P/IGF2R hypermethylation and LOH in ovarian cancer	Huang Z, Wen Y, Shandilya R, Marks JR, Murphy SK, Berchuck A	Nucleic Acids Research	2006	16432260	\N	\N
1460	Molecular analysis of cancer using DNA and protein microarray	SM, J and Hanash, Madoz-Gurpide	Advances in Experimental Medicine and Biology	2003	12908549	\N	\N
1461	Proteomics approaches to uncover the repertoire of circulating biomarkers for breast cancer	S, Hong, BK, Shin, W and Hanash	Journal of Mammary Gland Biology Neoplasia	2003	12882525	\N	\N
1463	Canary Prostate Active Surveillance Study: design of a multi-institutional active surveillance cohort and biorepository	Lin DW, Brooks JD, Newcomb LF, Carroll PR, Thompson IM, Gleave ME, Nelson PS, Feng Z	Urology	2010	19758683	\N	\N
1465	Longitudinal multistage model for lung cancer incidence, mortality, and CT detected indolent and aggressive cancers	Feng Z, Rom WN, Hazelton WD, Moolgavkar S, Thornquist M, Goodman G, Weissfeld JL, Tockman M	Mathematical biosciences	2012	22705252	\N	\N
1466	Plasma-derived exosomal survivin, a plausible biomarker for early detection of prostate cancer	Ashok A, Valenzuela MM, Lilly MB, Aspe JR, Khan S, Turay D, Mirshahidi S, Mercola D, Jutzy JM, Wall NR	PloS one	2012	23091600	\N	\N
1468	Expression changes in the stroma of prostate cancer predict subsequent relapse	Lernhardt W, Mercola D, Rahmatpanah FB, Sawyers A, Sutton M, Xia XQ, McClelland M, Jia Z, Wang Y, Chen X	PloS one	2012	22870216	\N	\N
1469	A sample selection strategy to boost the statistical power of signature detection in cancer expression profile studies	Koziol JA, Ye K, Lernhardt W, Hu Y, Mercola D, Jia Z, Wang Y, McClelland M, McLaren C, Yu Y, Xia XQ	Anti-cancer agents in medicinal chemistry	2013	22934703	\N	\N
1470	TGF-&#946; mediated DNA methylation in prostate cancer.	Dash A, Zi X, McClelland M, Zhang Q, C, Soares MB, Rahmatpanah F, Mercola D., Jia Z	Translational Andrology and Urology	2012	25133096	\N	\N
1471	Global comparisons of lectin-glycan interactions using a database of analyzed glycan array data	Bern M, Singh S, Kletter D, Haab BB	Molecular & cellular proteomics : MCP	2013	23399549	\N	\N
1472	The fine specificity of mannose-binding and galactose-binding lectins revealed using outlier motif analysis of glycan array data	Liden D, Haab BB, Maupin KA	Glycobiology	2012	21875884	\N	\N
1473	Using lectins in biomarker research: addressing the limitations of sensitivity and availability	Haab BB	Proteomics. Clinical applications	2012	22927350	\N	\N
1474	High-throughput studies of protein glycoforms using antibody-lectin sandwich arrays	Yue T, Haab BB	Methods in molecular biology (Clifton, N.J.)	2011	21901603	\N	\N
1476	CUB and zona pellucida-like domain-containing protein 1 (CUZD1): a novel serological biomarker for ovarian cancer	Leung F, Soosaipillai A, Kulasingam V, Diamandis EP	Clinical biochemistry	2012	22985796	\N	\N
1477	Folate-receptor 1 (FOLR1) protein is elevated in the serum of ovarian cancer patients	Kulasingam V, Dimitromanolakis A, Kobayashi H, Diamandis EP, Leung F	Clinical biochemistry	2013	23528302	\N	\N
1478	Proliferation and Cdk4 expression in microsatellite unstable colon cancers with TGFBR2 mutations	Olechnowicz J, Markowitz SD, Ferguson K, Munoz N, Gautam S, Romero-Gallo J, Willis JE, Grady WM, Trobridge P	International journal of cancer. Journal international du cancer	2006	16108056	\N	\N
1479	Epigenomic enhancer profiling defines a signature of colon cancer	Myeroff L, Lupien M, Saiakhova A, Kalady MF, Bartels CF, Cowper-Sal-lari R, Tesar PJ, Corradin O, Jarrar A, Laframboise T, Scacheri PC, Markowitz S, Balasubramanian D, Akhtar-Zaidi B, Willis J, Moore JH, Lutterbaugh J	Science (New York, N.Y.)	2012	22499810	\N	\N
1480	Modulation of glycan detection on specific glycoproteins by lectin multimerization	Brouhard E, McDonald M, Brand RE, Hincapie M, Partyka K, Cao Z, Hancock WS, Haab BB	Analytical chemistry	2013	23286506	\N	\N
1481	Glycoproteomic analysis of bronchoalveolar lavage (BAL) fluid identifies tumor-associated glycoproteins from lung adenocarcinoma	Chan DW, Shah P, Askin F, Chen J, Zhang H, Gabrielson E, Molena D, Aiyetan PO, Li Y, Li QK, Yung R	Journal of proteome research	2013	23802180	\N	\N
1482	Expression of core 3 synthase in human pancreatic cancer cells suppresses tumor growth and metastasis	Hollingsworth MA, Grandgenett PM, Mohr AM, Radhakrishnan P, Yu F, Bunt SK, Chowdhury S	International journal of cancer. Journal international du cancer	2013	23754791	\N	\N
1483	Prospects of miRNA-based therapy for pancreatic cancer	Batra SK, Rachagani S, Are C, Pai P	Current drug targets	2013	23834151	\N	\N
1484	Emerging trends for radioimmunotherapy in solid tumors	Jain M, Ponnusamy MP, Kaur S, Batra SK, Gupta S	Cancer biotherapy & radiopharmaceuticals	2013	23844555	\N	\N
1485	Mucins in pancreatic cancer and its microenvironment	Momi N, Kaur S, Kumar S, Batra SK, Sasson AR	Nature reviews. Gastroenterology & Hepatology	2013	23856888	\N	\N
1486	Analysis of serum protein glycosylation by a differential lectin immunosorbant assay (dLISA)	Li D, Chiu H, Zhang H, Chan DW	Clinical proteomics	2013	24015777	\N	\N
1488	Epigenetics and colorectal cancer	Lao VV, Grady WM	Nature reviews. Gastroenterology & hepatology	2011	22009203	\N	\N
1489	Epigenetic biomarkers in esophageal cancer	Grady WM, Kaz AM	Cancer letters	2012	22406828	\N	\N
1490	MicroRNA signatures in tissues and plasma predict development and prognosis of computed tomography detected lung cancer.	Roz L, Pastorino U, Sozzi G, Boeri M, Croce CM, Conte D, Calabrò E, Verri C, Modena P, Facchinetti F	PNAS	2011	21300873	\N	\N
1492	Aberrantly methylated PKP1 in the progression of Barrett	Luo Y, Kaz AM, Dzieciatkowski S, Leidner RS, Upton MP, Chak A, Grady WM, Willis JE	Genes, chromosomes & cancer	2012	22170739	\N	\N
1493	DNA methylation profiling in Barrett	Chak A, Kaz AM, Leidner RS, Grady WM, Willis JE, Washington MK, Virgin JB, Wong CJ, Luo Y	Epigenetics : official journal of the DNA Methylation Society	2011	22139570	\N	\N
1494	A major lung cancer susceptibility locus maps to chromosome 6q23-25	Anderson MW, Pinney SM, Coons T, Slusser J, Zhou X, Klein C, Rothschild H, de Andrade M, Franklin W, Petersen GM, Lee J, Wiest JS, Perez A, Kupert E, Gazdar A, Mandal D, Amos CI, Seminara D, Zhang Q, Gaba C, Schwartz AG, You M, Minna J, Liu Q, Bailey-Wilson JE, Fain P, Zeng D	American Journal of Human Genetics	2004	15272417	\N	\N
1495	Evolving concepts in the pathology and computed tomography imaging of lung adenocarcinoma and bronchioloalveolar carcinoma	Vazquez M, Kerr K, Henderson DW, Garg K, Padera R, Flieder DB, Hirsch F, Johnson BE, Ginsberg M, Tsao MS, Noguchi M, Wistuba II, Kakinuma R, Franks TJ, Franklin WA, Brambilla E, Sabloff B, Yankelevitz D, Galvin JR, Cappuzzo F, Jacobson F, Zakowski M, Hasleton PS, Travis WD, Thunnisen F, Nicholson AG, Roggli V, Geisinger KR	Journal of Clinical Oncology	2005	15886315	\N	\N
1496	Proteomic patterns of preinvasive bronchial lesions.	Yanagisawa K, Gonzalez AL, Rahman SMJ, Ninan M, Miller Y, Zhang J, Shyr Y,Yildiz P, Li H, Chaurand P, Massion PP, Moore J, Caprioli RM, Miller R, Carbone DP, Franklin WA, Slovis B	American Journal of Respiratory and Critical Care Medicine	2005	16179643	\N	\N
1497	Increased HER2 Gene Copy Number Enhances Response to Gefitinib Therapy in Advanced Non-Small Cell Lung Cancer	Gregorc V, Crino L, Bartolini S, Cappuzzo F, Ludovini V, and Hirsch FR, Domenichini I, Bunn PA, Varella-Garcia M, Franklin WA, Toschi L, Ceresoli GL, Rossi E	Journal of Clinical Oncology	2005	16051952	\N	\N
1498	Analysis of methylation-sensitive transcriptome identifies GADD45a as a frequently methylated gene in breast cancer	Huper G, Guo Y, Wang W, Olson JA, Murphy SK, Marks JR	Oncogene	2005	15735726	\N	\N
1499	Patterns of Gene Expression That Characterize Long-term Survival in Advanced Stage Serous Ovarian Cancers	Lee P, Murphy S, Pittman J, Dressman HK, Iversen ES, Luo J, Nevins JR, Berchuck A, Febbo PG, Lancaster JM, Marks JR, West M	Clinical Cancer Research	2005	15897565	\N	\N
1501	Estrogen receptor alpha (ESR1) mutant A908G is not a common feature in benign and malignant proliferations of the breast	Tebbit CL, Olson JA, Marks JR, Jr., Bentley RC	Genes, Chromosomes & Cancer	2004	15034868	\N	\N
1502	DNA and RNA references for qRT-PCR assays in exfoliated cervical cells	Rajeevan MS, Steinau M, Unger ER	Journal of Molecular Diagnostics	2006	16436642	\N	\N
1503	Correlates of cervical mucosal antibodies to Human Papillomavirus 16:  Results from a case control study	Reeves WC, Bierl C, Follen M, Poon AC, Swan D, Wideroff L, Tortolero-Luna G, Karem K, Unger ER	Gynecologic Oncology	2005	16229879	\N	\N
1504	Epidemiologic and viral factors associated with cervical neoplasia in HPV 16-positive women	Swan DC, Lee DR, Srivastava S, Birdsong G, Vernon SD, Tadros T, Horowitz IR, Ruffin MT, Rajeevan MS, Husain M, Unger ER, Flowers LC, Kmak D, Nisenbaum RA	International Journal of Cancer	2005	15688414	\N	\N
1505	Molecular markers for early detection of cervical neoplasia	Lee DR, Unger ER, Steinau M, Swan D, Rajeevan MS, Vernon SD	Disease Markers	2004	15322318	\N	\N
1506	Relationship of body mass index and prostate specific antigen in a population-based study	Naylor S, Leach R, Higgins B., Pollock B, Thompson IM, Troyer D	Urologic Oncology	2004	15082010	\N	\N
1507	The prevalence of prostate cancer in men with a normal PSA.	Minasian LM, Crowley JJ, Coltman CA., Pauler DK, Crawford ED, Tangen CM, Goodman PJ, Lucia MS, Ford LG, Thompson IM, Parnes HL, Lippman SM	New England Journal of Medicine	2004	15163773	\N	\N
1511	A functional link between adhesion and proteolysis in ovarian epithelial ovarian carcinoma cells	Fishman DA, Stack MS, Kearns A, Bafetti LM	Invasion and Metastasis	1999	N/A	\N	\N
1513	Whole-Abdominal Radiation in Endometrial Carcinoma - An Analysis of Toxicity Patterns of Recurrence and Survival	Zusag T, Small Jr. W, Rademaker A, Kalapurakal JA, Lurain J, Vallow L, Chang S, Roland P, Mahadevan A, Masad S, Fishman D	The Cancer Journal	2000	11131490	\N	\N
1514	BRCA1 and BRCA2 Mutation Analysis of 208 Ashkenazi Jewish Women with Ovarian Cancer	Warner E, Moslehi R, David YB, Rosenblatt J, Russo D, Risch H, Schwartz P, Fishman DA, Karlan B, Tung N, Brunet JS, Fields A, Rosen B, Narod S, Smotkin D	American Journal of Human Genetics	2000	10739756	\N	\N
1516	Metastatic Ovarian Cancer, Cancer Case Presentations	Plunkett E, Fishman DA	The Tumor Board American College of Surgeons	2000	N/A	\N	\N
1517	Detection of K-ras mutation in urine of patients with colorectal cancer	Su YH, Aiamkitsumrit B, Block TM, Brenner DE, Wang M	Cancer Biomarkers	2005	17192038	\N	\N
1518	Aberrant methylation of multiple genes in sporadic ovarian cancer and non malignant ovaries from high risk women	Virmani AK, Elias KJ, Mok SC, Rathi A, Gazdar AF, Fishman DA, Schorge JO	Cancer Research	2002	12429618	\N	\N
1519	Ultrasound and ovarian cancer	Cohen L, Fishman DA	Cancer Treatment and Research	2002	11775447	\N	\N
1520	Clinical correlation of asbestos bodies in BAL fluid	Rom WN, Bodkin M, Addrizzo-Harris DJ, Harkin TJ, Vathesatogkit P, Crane M	Chest	2004	15364780	\N	\N
1521	Molecular and genetic aspects of lung cancer	Lee TC, Tchou-Wong KM, Jiang Y, Rom WN, Hay JG	Am J Respir Crit Care Med	2000	10764334	\N	\N
1523	Functional genomics in lung cancer and biomarker detection	Tchou-Wong KM, Rom WN	Am J Respir Cell Mol Biol	2003	12878582	\N	\N
1525	Distribution of CWG and CCWGG in the Human Genome.	and Smith, S.S., K., B., Munson, Clark, T., Watson, J. Shevchuk	Epigenetics	2007	17965623	\N	\N
1526	Biomarker Target Recovery in the Methylation Sensitive QPCR.	K.,and Smith, K., Clark, Lamparska-Kupsik, Munson, S.S., J.	Nucleic Acids Research	2007	17439964	\N	\N
1527	Nanotechnology of Emerging Targeting Systems.	S.S., Smith	Minerva Biotechnologica	2008	21687833	\N	\N
1530	Autoantibody profiles reveal ubiquilin 1 as a humoral immune response target in lung adenocarcinoma.	Beer DG, Thomas DG, Wang R, Ghosh D, Chen G, Wang Z, Lin M-Y, Orringer MB, El-Hefnawy T, Giacherio D, Bigbee WL, Giordano TJ, Yu J, Vishnu P, Chang AC, Wang X, Chinnaiyan AM., Varambally S, Fielhauer J	Cancer Research	2007	17409457	\N	\N
1532	Structure, evolution, and biology of the MUC4 mucin	Chaturvedi P, Batra SK, Singh AP	FASEB	2008	18024835	\N	\N
1533	Distinctive serum profiles involving abundant proteins in lung cancer patients based upon antibody microarray analysis	Misek, Qiu J, Hanash SM, Orcheskowski RP, Omenn GS, Kuick R, Brenner DE, Rom WN, Gao WM, Greenberg AK, Haab BB	BMC Cancer	2005	16117833	\N	\N
1534	Human MUC4 mucin induces ultra-structural changes and tumorigenicity in pancreatic cancer cells	Meza JL, Varshney GC, Chaturvedi P, Rodriguez-Sierra JF, Aubert JP, Moniaux N, Batra SK	British Journal of Cancer	2007	17595659	\N	\N
1536	Engineering antibodies for clinical applications	Batra SK, Jain M, Kamal N	Trends in Biotechnology	2007	17512622	\N	\N
1537	Optimization of radioimmunotherapy of solid tumors: biological impediments and their modulation	Venkatraman G, Batra SK, Jain M	Clinical Cancer Research	2007	17309914	\N	\N
1538	Detection of mutated K-ras DNA in urine, plasma and serum from patients with colorectal carcinoma or adenomatous polyps	Wang M, Su Y-H, Brenner DE, Norton PA and Block TM	Annals of the New York Academy of Sciences	2008	18837947	\N	\N
1539	Distinctive serum protein profiles involving abundant proteins in lung cancer patients based upon antibody microarray analysis	Misek DE, Qiu J, Kuick R, Haab BB, Greenberg AK, Hanash SM, Brenner DE, Rom WN, Omenn GS, Orchekowski RP, Gao WM	BMC Cancer	2005	16117833	\N	\N
1541	Cancer metastasis facilitated by developmental pathways: Sonic hedgehog, Notch, and bone morphogenic proteins	JM, Bailey, Singh, Hollingsworth, MA, PK	Journal of Cellular Biochemistry	2007	17914743	\N	\N
1542	The lectin domains of polypeptide GaINAc-transferases exhibit carbohydrate-binding specificity	Suryanarayanan, EP, Takeuchi, K, HH, Wandall, G, Hollingsworth, Irazoqui, MA, U, Tarp, T, F, Bennett, Clausen, H, Mandel, Kato, Irimura	Glycobiology	2007	17215257	\N	\N
1545	CCL21 induces extensive intratumoral immune cell infiltration and specific antitumor cellular immunity	JC, MA, Talmadge, Singh, HR, Solheim, Hollingsworth, Lin, RK, JE, Ashour, X, AE, Turnquist	International Journal of Oncology	2007	17273764	\N	\N
1546	Loss of Fibulin-2 Expression Is Associated with Breast Cancer Progression	MA, Smith, C-H, West, Yi, DJ, WW, Hollingsworth	American Journal of Pathology	2007	17456760	\N	\N
1548	MUC4 Mucin Interacts with and Stabilizes the HER2 Oncoprotein in Human Pancreatic Cancer Cells	Chauhan, JL, Chaturvedi, Singh, Chakraborty, P, Mehta, PP, SC, Bafna, S, MA, AP, Batra, SK, PK, Meza, Hollingsworth	Cancer Research	2008	18381409	\N	\N
1549	Magnetic enrichment of bronchial epithelial cells from sputum for lung cancer diagnosis.	S.A., Todd, Stass, Katz, Qin, Li R., N.W., R.L., & Jiang, F., Q.	Cancer	2008	18484646	\N	\N
1550	Mutations, and Amplification of the EGFR Gene in Non-Small Cell Lung Cancers	Spitz MR, Li L, Estess P, Takahashi T, Marchetti A, Nomura M, Shigematsu H, Siegelman M, Minna JD, Kato H, Wistuba, Feng Z, Shay JW, Suzuki M, II, Gazdar AF	Laboratory Investigation	2007	17455987	\N	\N
1551	Interrogating DNA repair in cancer risk assessment	Livneh Z, Paz-Elizur T, Brenner DE	Cancer Epidemiology, Biomarkers & Prevention	2005	16030087	\N	\N
1553	Cleavage of endoplasmic reticulum proteins in hepatocellular carcinoma: Detection of generated fragments in patient sera	Beretta L., Chignard N, Shang S, Wang H, Marrero J, Brechot C, Hanash S	Gastroenterology	2006	16762624	\N	\N
1555	COX-2-dependent stabilization of surviving in non-small cell lung cancer.	Dubinett S., Lin Y., Goodglick L., Pold M., Luo J., Heuze-Vourc’h N., Dohadwala M., Seligson D., Wang H., Chia D., Zhu L., Krysan K., Strieter R., Sharma S., Merchant F.H.	The FASEB Journal	2004	14597555	\N	\N
1556	A multiparametric serum kallikrein panel for diagnosis of non-small cell lung carcinoma.	Diamandis EP, Soosaipillai A, Goodglick L., Zheng Y, Chia D, Planque C, Reckamp K, Li L	Clinical Cancer Research	2008	18316555	\N	\N
1557	Discovery of cancer biomarkers through the use of mouse models	Monsma DJ, Wang H, Kuick R, Omenn GS, Hanash SM., Pisano M, Peterson KJ, Webb CP, Misek DE	Cancer Letters	2007	17320282	\N	\N
1558	Expression of X-linked inhibitor of apoptosis protein is a strong predictor of human prostate cancer recurrence.	Hongo F, Miki T, Mizutani Y, Huerta-Yepez S, Seligson DB, Goodglick L, Bonavida B., Horvath S, Yu H, Chia D	Clinical Cancer Research	2007	17947468	\N	\N
1559	Increased osteonectin expression is associated with malignant transformation and tumor associated fibrosis in the lung	Wali,A., Sarkar,F.H., Siddiq,F., Pass,H.I. and Lonardo,F	Lung Cancer	2004	15246191	\N	\N
1561	Reducing heterophilic antibody interference in immunoassays using single-chain antibodies	Tan R, Rodland KD, Fischer CJ, Zangar RC, Baird CL, Victry KD	Analytical biochemistry	2011	21933659	\N	\N
1562	Systems biology and biomarker discovery	Rodland KD	Disease markers	2010	20534904	\N	\N
1564	Analysis of serum total and free PSA using immunoaffinity depletion coupled to SRM: correlation with clinical immunoassay tests	Kronewitter SR, Chan DW, Leach RJ, Kagan J, Rodland KD, Camp DG, Hossain M, Liu T, Sokoll LJ, Fillmore TL, Smith RD, Thompson IM, Srivastava S, Qian WJ, Schepmoes AA, Shi T, Izmirlian G	Journal of proteomics	2012	22846433	\N	\N
1565	Pancreatic cancer serum detection using a lectin/glyco-antibody array method	Shedden KA, Simeone DM, Ruffin MT, Brenner DE, Li C, Anderson MA, Lubman DM	Journal of proteome research	2009	19072160	\N	\N
1566	Updating risk prediction tools: a case study in prostate cancer	Wei JT, Partin AW, Ankerst DP, Sokoll L, Leach RJ, Liang Y, Thompson IM, Kagan J, Chan DW, Koniarski T, Sanda MG, Feng Z	Biometrical journal. Biometrische Zeitschrift	2012	22095849	\N	\N
1567	CT scan screening for lung cancer: risk factors for nodules and malignancy in a high-risk urban cohort	Goldberg JD, Tsay JC, Rom WN, Chachoua A, Eylers E, Greenberg AK, Naidich D, Crawford B, Lu F, Yie TA, Addrizzo-Harris D, Tchou-Wong KM, McGuinness G, Pass H	PloS one	2012	22768300	\N	\N
1568	Quantitative assessment of promoter methylation profilesin thyroid neoplasms	Ladenson,P, Hoque,MO, Sidransky,D, Rosenbaum,E, Zeiger,MA, Xing,M, Westra,WH, Umbricht,CB	J Clin Endocrinol Metab	2005	15840741	\N	\N
1569	Increased mitochondrial DNA content in saliva associated with head and neck cancer	Jiang,WW, Westra,WH, Rosenbaum,E. Mambo,E, Koch,W, Alberg,A, Zahurak,M, Masayesva,B, Zhou,S, Sidrnasky,D, Benoit,N, Califano,J, Carvalho,AL, Minhas,K	Clinical Cancer Research	2005	15814624	\N	\N
1570	MT1G hypermethylation is associated with higher tumor stage in prostate cancer	Teixeira,MR, Hoque,MO, Sidransky,D, Henrique,R, Oliveira,J, Nomoto,MO. Carvalho,AL, Lopes,C, Jeronimo,C, Costa,VL	Cancer Epidemiology, Biomarkers & Prevention	2005	15894685	\N	\N
1571	PGP(.5 promoter methylation is an independent prognostic factor for esophageal squamous cell carcinoma	Mori,M, Tokumaru,Y, Sidransky,D, Howard,DL, Mimori,K, Tanaka,Y, Kim,MS, Jiang,WW, Yamashita,K, Mandelker,DL, Osada,M, Park,HL, Carvalho,AL	Cancer Research	2005	15930319	\N	\N
1572	Oxidized guanine lesions and hOgg1 activity in lung cancer	Sidransky,D, Dizdaroglu,M, Hogue,BA, Chatterjee,A, Hoque,MO, Mayard,S, Bohr,VA, Mambo,E, de Souza-Pinto,NC	Oncogene	2005	15856018	\N	\N
1573	Mitochondrial DNA as a cancer biomarker	Wang,W, O&#39;Connell,CD, Sidransky,D, Coble,M, Srivastava,S, Barker,PE, Ally,D, Markowitz,ME, Jakupciak,JP, Maitra,A	J Mol Diagn	2005	15858150	\N	\N
1576	Aberrant expression of MUC4 in ovarian carcinoma: diagnostic significance alone and in combination with MUC1 and MUC16 (CA125)	Singh AP, Smith LM, Moniaux N, Chauhan SC, Jain M, Ruiz F, Johansson SL, Batra SK	Modern Pathology	2006	16880776	\N	\N
1577	Biomarkers in Diagnosis of pancreatic carcinoma in fine-needle aspirates	Grizzle WE, Manne U, Vickers SM, Batra SK, Jhala D, Jones JJ, Jhala N, Eltoum I, Eloubeidi M	American Journal of Clinical Pathology	2006	17019794	\N	\N
1578	Characterization of human mucin MUC17. Complete coding sequence and organization	Jones AM, Singh AP, Batra SK, Junker WM, Moniaux N	J. Biol. Chem	2006	16737958	\N	\N
1579	MUC4 is a novel prognostic factor of extrahepatic bile duct carcinoma	Shibahara H, Yonezawa S, Imai K, Goto M, Batra SK, Tamada S, Higashi M	Clinical Cancer Research	2006	16857800	\N	\N
1580	Recent advances on multiple tumorigenic cascades involved in prostatic cancer progression and targeting therapies	Mimeault M, Batra SK	Carcinogenesis	2006	16195239	\N	\N
1581	MUC4 expression is a novel prognostic factor in patients with invasive ductal carcinoma of the pancreas	Yonezawa S, Nagata K, Goto M, Hamada T, Horinouchi M, Aikou T, Batra SK, Takao S, Imai K, Osako M, Tamada S, Saitou M	J. Clin. Path.	2005	16049287	\N	\N
1582	Pooling of case specimens to create standard serum sets for screening cancer biomarkers	Marks JR, Moy JM, Sluss P, Skates SJ, Minihan AM, Horick NK, Cramer DW, Seiden MV	Cancer Epidemiology, Biomarkers & Prevention	2007	17301268	\N	\N
1583	Deep sequencing reveals distinct patterns of DNA methylation in prostate cancer	Kominsky HD, Huang C, Iyer M, Robinson D, Hu M, Chinnaiyan AM, Dhanasekaran SM, Mehra R, Jing X, Shankar S, Palanisamy N, Kim JH, Siddiqui J, Maher CA, Prensner JR, Kalyana-Sundaram S, Grasso C, Yu J, Cao X, Qin ZS, Sam L	Genome research	2011	21724842	\N	\N
1585	Mechanistic rationale for inhibition of poly(ADP-ribose) polymerase in ETS gene fusion-positive prostate cancer	Yang J, Hussain M, Mehra R, Liang H, Chinnaiyan AM, Maher CA, Lonigro RJ, Palanisamy N, Cao X, Navone NM, Sabolch A, Tomlins SA, Patel S, Basrur V, Asangani IA, Wang X, Cao Q, Feng FY, Pienta KJ, Yan W, Varambally S, Li Y, Siddiqui J, Brenner JC, Elenitoba-Johnson KS, Ateeq B, Yocum AK, Yu J	Cancer cell	2011	21575865	\N	\N
1587	Amplified RPS6KB1 and CDC2 genes are potential biomarkers for aggressive HIV+/EBV+diffuse large B-cell lymphomas.	Tan M, STass SA,, KuKuruga D, Zhao XF, Zhao MY, Chai L	Int J Clin Exp Pathol.	2013	23330000	\N	\N
1588	Downregulation of miR-486-5p contributes to tumor progression and metastasis by targeting protumorigenic ARHGAP5 in lung cancer	Wang J, Han R, Xing L, Donahue JM, Yan X, Wang X, Zhang X, Tian X, Stass SA, Xue L, Jiang F, Liu Y, Mannoor K, Shen J, Shen H, Deepak J	Oncogene	2013	23474761	\N	\N
1589	Combining urinary detection of TMPRSS2:ERG and PCA3 with serum PSA to predict diagnosis of prostate cancer	Sanda MG, Bueti G, Rubin MA, Regan MM, Schmidt F, Scherr D, Laxman B, Rickman DS, Siddiqui J, Salami SS, Wei JT, Chinnaiyan AM, Tomlins SA	Urologic oncology	2011	21600800	\N	\N
1590	TMPRSS2-ERG-mediated feed-forward regulation of wild-type ERG in human prostate cancers	Brenner JC, Wang L, Varambally S, Lonigro RJ, Tomlins SA, Ghosh A, Cao Q, Iyer MK, Mani RS, Cao X, Chinnaiyan AM	Cancer research	2011	21676887	\N	\N
1591	Beyond PSA: the next generation of prostate cancer biomarkers	Prensner JR, Wei JT, Rubin MA, Chinnaiyan AM	Science translational medicine	2012	22461644	\N	\N
1593	Targeting the EGFR signaling pathway in cancer therapy	Jain M, Ponnusamy MP, Batra SK, Seshacharyulu P, Haridas D, Ganti AK	Expert opinion on therapeutic targets	2012	22239438	\N	\N
1594	Mucin-based Targeted Pancreatic Cancer Therapy	Chakraborty S, Souchek J, Torres MP, Batra SK	Current pharmaceutical design	2012	22372499	\N	\N
1595	Incidence and Prognostic Significance of Second Primary Cancers in Renal Cell Carcinoma	Batra SK, Hauke RJ, Tarantolo SR, Chakraborty S	American journal of clinical oncology	2013	22441339	\N	\N
1596	Mucins and Toll-like receptors: Kith and kin in infection and cancer	Tarang S, Batra SK, Kumar S	Cancer letters	2012	22306702	\N	\N
1600	Recent trends in antibody-based oncologic imaging	Batra SK, Jain M, Senapati S, Garg PK, Kaur S, Venktaraman G	Cancer letters	2012	22104729	\N	\N
1603	Epidermal Growth Factor Receptor Gene and Protein and Gefitinib Sensitivity in Non-Small Cell Lung Cancer	Varella-Garcia M, Bunn PA, Magrini E, Haney J, Bartolini S, Sidoni A, Franklin WA, Crino L, Ludovini V, Bemis L, Danenberg K, Tonato M, Cappuzzo F, Ceresoli GL, Hirsch FR, Domenichini I, Gregorc V, Rossi E, Doglioni C, Witta S	Journal of the National Cancer Institute	2005	15870435	\N	\N
1605	Nuclear accumulation of beta-catenin occurs commonly in the epithelial cells of juvenile polyps	Franklin WA, Ahnen DJ, Iwamoto M, Doctolero R, Hoffenberg, EJ, Carethers JM, Sugano K, Tajima  A	Pediatr Res	2004	15557107	\N	\N
1607	Sputum cytological atypia as a predictor of incident lung cancer in a cohort of heavy smokers with airflow obstruction	Zang C, Prindiville SA, Wolf HJ, Bunn PA, Franklin WA, Vu KO, Baron AE, Miller YE, Shroyer K, Hirsch FRN, Kennedy TC, Byers T	Cancer Epidemiology, Biomarkers & Prevention	2003	14578133	\N	\N
1608	Hereditary nonpolyposis colorectal carcinoma (HNPCC) and HNPCC-like families:Problems in diagnosis, surveillance, and management	Lynch HT, Weismann S, Riley BD, Coronel SM, Rubinstein WS, Kinarsky Y, Shaw TG, Lynch JF	Cancer	2004	14692024	\N	\N
1609	Screening adherence in BRCA 1/2 families is associated with primary physicians behavior	Coughlin S, Tinley ST, Wenzel L, Clark MB, Lynch HT, Houfek J, Watson P	American Journal of Medical Genet	2004	14755459	\N	\N
1610	A founder mutation of the MSH2 gene and hereditary nonpolyposis colorectal cancer in the United States	Fodde R, Lynch HT, Barrows A, Sweet K, Franken P, Lynch JF, de la Chapelle A, Coronel SM, Hampel H, Wagnr A, Okimoto R, Wijnen J, van der Klift H	Journal of the American Medical Association	2004	14871915	\N	\N
1611	Challenging colonic polyposis pedigrees: differential diagnosis, surveillance, and management concerns	Tinley ST, Lynch HT, Howe JR, Lynch JF, Attard TM, Shaw TG	Cancer Genetics and Cytogenetics	2004	14734220	\N	\N
1612	Three new mutations in hereditary nonpolyposis colorectal cancer (Lynch syndrome II) in Uruguay	Sarroca C, Dominguez A, Peltomaki P, Alfano N, Tedesco G, Lynch HT, Della Valle A	Cancer Genetics and Cytogenetics	2003	12660027	\N	\N
1614	Hereditary breast-ovarian cancer at the bedside: role of the medical oncologist	Rubinstein WS, Lynch JF, Riley BD, Snyder CL, Lynch HT	Journal of Clinical Oncology	2003	12586815	\N	\N
1615	Loss of surface and cyst epithelial basement membranes and preneoplastic morphologic changes in prophylactic oophorectomies	Godwin AK, Xu X-X, Hamilton TC, Lynch HT, Daly MB, Yang D-H, Roland IH, Yang W-L, Ozols RF	Cancer	2003	14669280	\N	\N
1617	Genomic Medicine: Hereditary colorectal cancer	Lynch HT, de la Chapelle A	New England Journal of Medicine	2003	12621137	\N	\N
1618	Estrogen and Ovarian Cancer	Piper Z, Fishman DA, Kearns A, Kazmierczak T, Stack MS, Banionis S, Hegg A	Cancer	2001	N/A	\N	\N
1619	The Role of Ultrasound in the Detection of Early Rather Than Advanced Stage Ovarian Carcinoma	Fishman DA, Bozorgi K, Cohen L, Lurain J	Medica Mundi	2001	N/A	\N	\N
1620	The scientific basis for the detection of early stage epithelial ovarian carcinoma	Bozorgi K, Lurain JR, Fishman DA	The Journal of the Bellevue Obstetrical and Gynecological Society	2001	11775458	\N	\N
1621	EGF receptor/ErbB isoforms as serum biomarkers in breast and ovarian cancer	Christensen TA, Perez EA, Lee H, Fishman DA, Lafky JM, Greenwood T, Baron AT, Suman VJ, Boardman CH, Maihle NJ, Reiter JL, Podratz KC, Cora EM	Journal of Clinical Ligand Assay	2002	19431095	\N	\N
1622	Tubal Ligation and the Risk of Ovarian Cancer in Carriers of BRCA1 or BRCA2 Mutations: A Case-Control Study	Tung N, Fishman DA, Isaacs C, Sun P, the Hereditary Ovarian Cancer Clinical Study Group, Lynch H, Karlan B, Rosen B, Ghadirian P, Weber B, Neuhausen S, Garber J, Narod SA	Lancet	2001	11377596	\N	\N
1623	Lysophosphatidic acid promotes matrix metalloproteinase (MMP) activation and MMP-dependent invasion in ovarian cancer cells	Fishman DA, Liu Y, Stack MS, Ellerbrok S	Cancer Research	2001	11306508	\N	\N
1625	Three-dimensional power Doppler ultrasound improves the diagnostic accuracy for ovarian cancer prediction	Scharm C, Glimco B, Cohen LS, Escobar PF, Fishman DA	Gynecologic Oncology	2001	11426960	\N	\N
1627	Blood and urine markers for ovarian cancer: A comprehensive review	Vitonis AF, Mok SC, Skates SJ, Cramer DW., Ye B, Terry KL, Sluss PM	Disease Markers	2004	15322314	\N	\N
1628	Preferential DNA damage and poor repair determine &#060;i&#062;ras&#060;/i&#062; gene mutational hotspot in human cancer	Hung M-C, Pao A, Li H, Rom WN, Chen J, Tang M-s, Hu W, Feng Z	Journal of the National Cancer Institute	2002	12381705	\N	\N
1629	Osteopontin as a potential diagonistic biomarker for ovarian cancer	Berkoqitz RS, Schorge JO, Feltmate CM, Kim JH, UEDA T, Womg KK, Cramer DW, Skates SJ, Mok SC.	Journal of the American Medical Association	2002	11926891	\N	\N
1630	Analysis of prostate cancer by proteomics using tissue specimens.	Liu AY, Zhang H, Diamond DL, Sorensen CM	The Journal of Urology	2005	15592032	\N	\N
1631	Gene expression profiling of dysplastic differentiation in cervical epithelial cells harboring HPV 16	Rajeevan MS, Lee DR, Vernon SD, Ranamukhaarachchi DG, Unger ER	Genomics	2005	15885499	\N	\N
1632	Proenzyme PSA for the early detection of prostate cancer in the 2.5-4.0 ng/mL total PSA range: preliminary analysis	Linton HJ, Rittenhouse HG, Partin AW, Horninger W, Evans CL, Klocker H, Mikolajczyk SD, Bartsch G, Mangold  LA, Chan DW, Mohr P, Sokoll LJ	Urology	2003	12597929	\N	\N
1633	An autoantibody-mediated immune response to calreticulin isoforms in pancreatic cancer	Hong SH, Simeone DM, Giordano TJ, Greenson JK, Hanash SM, Misek DE, Logsdon CD, Brenner DE, Wang H, Puravs E	Cancer Research	2004	15289361	\N	\N
1634	Design of early validation trials of biomarkers	Normolle DP, Brenner DE, Ruffin MT	Cancer Informatics	2005	19305629	\N	\N
1635	Relevance of MUC1 mucin variable number of tandem repeats polymorphism in H pylori adhesion to gastric epithelial cells	Mendes N, Santos-Silva F, Costa NR, Hollingsworth MA, Caffrey T, Marcos NT, Reis CA	World J Gastroenterol	2008	18322957	\N	\N
1636	MUC4 and MUC5AC are highly specific tumour-associated mucins in biliary tract cancer	Qureshi U, Matull WR, Swallow DM, Pereira SP, Loh A, Deheragoda M, Andreola F, Batra SK, Adiguzel Z	British Journal of Cancer	2008	18475301	\N	\N
1637	Diagnostic accuracy of MALDI mass spectrometric analysis of unfractionated serum in lung cancer.	Rahman JS, PB, Carbone DP, Weissfeld JL, Wardwell NR, Ninan M, Yildiz, Shakhtour B, Siegfried JM, Johnson DH, Zimmerman LJ, Chen S, Li M, Bigbee WL, Shyr Y, Roder H, Caprioli RM, Massion PP., Gray WH, Liebler DC, Gonzalez AL	Journal of Thoracic Oncology	2007	17909350	\N	\N
1639	An unsupervised approach to identify molecular phenotypic components influencing breast cancer features.	Stass SA, Sterian A, Wang S, Epstein SH, Xu Y, Shibata D, Abraham JM, Olaru A, Selaru FM, Fulton A, Mori Y, Baquet C, Sato F, Yin J, Deacu E, Meltzer J	Cancer Research	2004	14996713	\N	\N
1640	Clinical potential of mucins in diagnosis, prognosis, and therapy of ovarian cancer	Senapati S, Singh AP, Jain M, Lele SM, Batra SK, Ponnusamy MP, Davis JS, Remmenga S	Lancet Oncology	2008	19012856	\N	\N
1641	Aberrant expression of transmembrane mucins, MUC1 and MUC4, in human prostate carcinomas	Johansson SL, Chauhan SC, Bafna S, Lin MF, Batra SK, Smith LM, Singh AP, Moniaux N	Prostate	2006	16302265	\N	\N
1642	The MUC gene family: Their role in the diagnosis and prognosis of gastric cancer	Bafna S, Roy HK, Sharma P, Senapati S, Batra SK	Histology and Histopathology	2008	18830939	\N	\N
1643	Development of common data elements: the experience of and recommendations from the early detection research network	Kincaid H, Winget MD, Brenner DE, Feng Z, Spitz MR, Thornquist M, Baron JA, Warzel D	Int J Med Informatics	2003	12706181	\N	\N
1645	MUC6 mucin expression inhibits tumor cell invasion	Leir SH, Harris A	Experimental cell research	2011	21851820	\N	\N
1646	Mining the plasma proteome for disease applications across seven logs of protein abundance	Faca V, Zhang Q, Hanash S	Journal of proteome research	2011	21062094	\N	\N
1647	Design of a covalently bonded glycosphingolipid microarray	Levery SB, Arigi E, Buschard K, Blixt O, Clausen H	Glycoconjugate journal	2012	22102144	\N	\N
1649	Three-tiered risk stratification method to predict progression in Barrett’s esophagus using epigenetic and clinical features.	Greenwald BD, Cheng Y, Paun B, Yfantis HG, Yang J, Olaru A, Wang J, Wang KK, Hamilton JP, Jin Z, Abraham JM, Fredericksen MB, Ito T, Kan T, Romero Y, Wu T, Schulmann K, Feng Z, Meltzer SJ., Mori Y, David S, Canto M, Sato F	PLoS ONE	2008	18382671	\N	\N
1650	Hypermethylation of the somatostatin promoter is a common, early event in human esophageal carcinogenesis.	Jin Z, Sato F, Ito T, Mori Y, Hamilton JP, Olaru A, Agarwal R, Yang J, Kan T, Paun B, Meltzer SJ.	Cancer	2008	18729198	\N	\N
1651	Hypermethylation of Tachykinin-1 is Associated with a Poor Prognosis in Human Esophageal Squamous Cell Carcinoma.	Ito T, Paun B, Wang S, Mori Y, Olaru A, Jin Z, Sato F, Beer DG, Hamilton JP, Cheng Y, David S, Agarwal R, Kan T, Yang J, Mantzur C, Meltzer SJ., Abraham JM	Clinical Cancer Research	2007	17975140	\N	\N
1653	Hypermethylation of the AKAP12 Promoter is a Potential Biomarker of Barrett&#39;s-Associated Esophageal Neoplastic Progression.	Kan T, Ito T, Abraham JM, Meltzer SJ., Olaru A, Paun B, Cheng Y, Yang J, Hamilton JP, Mori Y, Agarwal R, Sato F, David S, Jin Z	Cancer Epidemiology, Biomarkers & Prevention	2008	18199717	\N	\N
1654	Modelling oncogenic Ras/Raf signalling in the mouse	Tuveson DA, Farreth FA	Current opinion in genetics & development	2009	19201597	\N	\N
1655	Non-genomic biomarkers of risk in ovarian cancer	Cramer DW, Pinheiro SP	Disease Markers	2007	18057519	\N	\N
1656	Integrated mass spectrometry-based analysis of plasma glycoproteins and their glycan modifications	Tanaka K, Wong CH, Sekiya S, Kajihara S, Takahashi H, Murase M, Iwamoto S, Hanash S, Taguchi A, Taylor A, Chin A, Wang H	Nature protocols	2011	21372808	\N	\N
1657	Application of a methylation gene panel by quantitative PCR for lung cancers	Prinsen C, Hol B, Li L, Wistuba, II, Gazdar AF, Thunnissen FB, Zheng Y, Feng Z, Stastny V, Suzuki M, Shivapurkar N	Cancer Letters	2007	16644104	\N	\N
1658	Methods for detecting DNA methylation in tumors: From bench to bedside	Gazdar AF, Shames DS, Minna JD	Cancer Letters	2007	17166656	\N	\N
1659	DNA methylation in health, disease, and cancer.	Minna JD, Shames DS, Gazdar AF	Current Molecular Medicine	2007	17311535	\N	\N
1660	Sun exposure related methylation in malignant and non-malignant skin lesions	Minna JD, Gazdar AF, Padar A, Stastny V, Li L, Makarla P, Moore AY, Majmudar K, Suzuki M, Feng Z, Sathyanarayana UG	Cancer Letters	2007	16494996	\N	\N
1661	A Mouse to Human Search for Plasma Proteome Changes Associated with Pancreatic Tumor Development	Redston MS, Plentz RR, McIntosh MW, Gurumurthy S, Edelstein C, Katayama H, Goodman GE, Depinho RA, Barnett MJ, Song KS, Faca VM, Scholler N, Brenner DE, Ireton RC, Misek D, Phanstiel D, Newcomb LF, Krasnoselsky AL, Urban ND, Thornquist MD, Pitteri SJ, Zhang Q, Glukhova V, Anderson MA, Bardeesy N, Wang H, Hanash SM, Pereira-Faca SR	PLoS	2008	18547137	\N	\N
1662	Recent advances on the molecular mechanisms involved in pancreatic cancer progression and therapies	Brand RE, Mimeault M, Batra SK, Sasson AA	Pancreas	2005	16258363	\N	\N
1663	Evaluation of candidate methylation markers to detect cervical neoplasia	Nayar R, Rader JS, Gazdar AF, Echebiri C, Sherman ME, Stastny V, Wang SS, Bonfiglio TA, Shivapurkar N	Gynecologic Oncology	2007	17894941	\N	\N
1665	A mouse plasma PeptideAtlas as a resource for disease proteomics	Hanash SM, Faca VM, Newcomb LF, Kucherlapati R, States DJ, Pitteri SJ, Omenn GS, Bardeesy N, Politi K, Depinho RA, Dinulescu D, Aebersold R, Zhang Q, Jacks T, Menon R, Hung KE, Wang H, Deutsch EW	Genome Biology	2008	18522751	\N	\N
1666	Identification of intelectin overexpression in malignant pleural mesotheliomaby serial analysis of gene expression (SAGE)	Morin PJ, Lonardo F, Wali A, Seya T, Carbone M, Hough CD, Pass HI.	Lung Cancer	2005	15777968	\N	\N
1667	SV40 detection in human tumor specimens	Ramos Nino M,, Carbone M, De Marco MA, Rdzanek MA, Rudzinski JJ, Bocchetta M	Cancer Research	2005	16267039	\N	\N
1668	Nuclear estrogen receptor beta in lung cancer: expression and survival differences by sex	Brooks S, Prysak GM, Lonardo F, Schwartz J, Schwartz AG, Pass H, Murphy V	Clinical Cancer Research	2005	16243798	\N	\N
1669	Cellular and molecular parameters of mesothelioma	Pass HI, Carbone M, Altomare DA, Bocchetta M, Ramos-Nino ME, Testa JR, Mossman BT	J Cell Biochem	2006	16795078	\N	\N
1670	TNF-{alpha} inhibits asbestos-induced cytotoxicity via a NF-{kappa}B-dependent	Pass HI, Testa JR, Kroczynska B, Elmishad AG, Mossman BT, Liu Z, Franzoso G, Bubici C, Chen Y, Carbone M., Yang H, Bocchetta M	Proc Natl Acad Sci	2006	16798876	\N	\N
1671	Crocidolite asbestos and SV40 are cocarcinogens in human mesothelial cells and in causing mesothelioma in hamsters.	Yang H, Ramos-Nino M, Carbone M., Mossman BT, Kroczynska B, Vacek P, Pass HI, Cutrone R, Bocchetta M, Elmishad AG	Proc Natl Acad Sci U S A.	2006	16966607	\N	\N
1672	Validation of Soluble Mesothelin Related Peptide Level Elevations in Mesothelioma Serum and Pleural Effusions	Federico Steiner MD#, Harvey I. Pass MD#, Sergey Ivanov PhD#, Michael Harbut MD*, Michele Carbone MD, Alla Ivanova PhD#, and Jeffrey Allard PhD&., PhD+	Annals of Thoracic Surgery	2007	18154821	\N	\N
1673	Asbestos exposure, pleural mesothelioma, and serum osteopontin levels	Tang N, Harbut M, Lonardo F, Pass HI, Liu Z, Carbone M, Webb C, Wali  A, Lott D	N Engl J Med	2005	16221779	\N	\N
1674	A Systemic Review and Lessons Learned From Early Lung Cancer Detection Trials Using Low-Dose Computed Tomography of the Chest	Tockman MS, Bepler G, Clark RA, Carney DG, Djulbegovic B	Cancer Control	2003	12915809	\N	\N
1675	Evaluating Serial Observations of Precancerous Lesions For Further Study as a Trigger For Early Intervention	Baker SG and Tockman MS	Statistics in Medicine	2002	12210622	\N	\N
1676	Familial multiple myeloma: a family study and review of the literature	Weisenburger D,, Quinn-Laquer B, Pirruccello S, Sanger WG, Lynch HT	Journal of the National Cancer Institute	2001	11584064	\N	\N
1677	Hereditary chronic lymphocytic leukemia: An extended family study and literature review	Lynch JF, Lynch HT, Watson P, Weisenburger DD, Sanger WG, Quinn-Laquer B	American Journal Medical Genet	2002	12407690	\N	\N
1748	Impact of freeze thaw cycles and storage time on plasma samples used in mass spectrometry based biomarker discovery projects	Yasui Y, Mitchell B, Li C, Fitzpatrick A, Lampe PD	Cancer Informatics	2005	19325868	\N	\N
1679	CYP24A1 is an independent prognostic marker of survival in patients with lung adenocarcinoma	Giordano TJ, Beer DG, Brenner DE, Kim SH, Lin L, Chen G, Wang Z, Ramnath N, Simpson RU, Christensen PJ, King AN, Zhao L, Thomas DG	Clinical cancer research : an official journal of the American Association for Cancer Research	2011	21169243	\N	\N
1682	Molecular targets and clinical cancer risk reductive interventions	Brenner DE, Kakarala M	Progress in molecular biology and translational science	2010	21075336	\N	\N
1683	Evaluation of Known Oncoantibodies, HER2, p53, and Cyclin B1, in Prediagnostic Breast Cancer Sera	Ladd J, Li CI, Pitteri SJ, Wu M, Goodell V, Feng Z, Lu H, Disis ML, Prentice R, Hanash SM	Cancer prevention research (Philadelphia, Pa.)	2012	22715141	\N	\N
1684	Occurrence of autoantibodies to annexin I, 14-3-3 theta and LAMR1 in prediagnostic lung cancer sera	Feng Z, Li L, Pitteri SJ, Wang H, Edelstein C, Thornquist MD, Brenner DE, Hanash SM, Choi G, Barnett MJ, Pereira-Faca SR, Omenn GS, Krasnoselsky AL, Goodman GE, Randolph TW, Qiu J	Journal of clinical oncology : official journal of the American Society of Clinical Oncology	2008	18794547	\N	\N
1685	Microsatellite instability and DNA mismatch repair protein deficiency in Lynch syndrome colorectal polyps	Hornick JL, Yurgelun MB, Turgeon DK, Goel A, Ruffin MT, Bresalier RS, Stoffel EM, Syngal S, Boland CR, Marcon NE, Brenner DE, Baron JA, Sen A	Cancer prevention research (Philadelphia, Pa.)	2012	22262812	\N	\N
1686	Screening for Lung Cancer with CT:  A Preliminary Cost-Effective Analysis	Hazelton T, and Clark R, Tockman MS, Chirikos T	CHEST	2002	12006436	\N	\N
1687	Breast cancer histology and receptor status characterization in Asian Indian and Pakistani women in the U.S.--a SEER analysis	Kakarala M, Liyanage S, Cote M, Brenner DE, Rozek L	BMC cancer	2010	20459777	\N	\N
1688	Effect of cyclooxygenase genotype and dietary fish oil on colonic eicosanoids in mice	Brenner DE, Lager C, Smith WL, Sen A, Djuric Z, Jiang Y, Neilson AP, Hong YH, Ren J, Reuven S	The Journal of nutritional biochemistry	2012	21937210	\N	\N
1689	Lectin Capture Strategies Combined with Mass Spectrometry for the Discovery of Serum Glycoprotein Biomarkers	Block T, Mehta A, Diaz JI, Semmes OJ, Malik G, Schwegler EE, Drake RR	Molecular and Cellular Proteomics	2006	16760258	\N	\N
1690	Application of Mass Spectrometry to the Discovery of Biomarkers for Detection of Prostate Cancer	Ward M, Malik G, Semmes OJ	Journal of Cellular Biochemistry	2006	16552720	\N	\N
1691	Clinical proteomics: A need to define the field and to begin to set adequate standards	Julian BA, Semmes OJ, Neusuess C, Massy ZA, Conaway M, Fliser D, Hermjakob H, Thongboonkerd V, Van Eyk JE, Mischak H, Hochstrasser D, Girolami M, Jankowski J, Ehrich JHH, Theodorescu D, Kolch W, Yamamoto T, Rossing K, Coon J, Dominiczak A, Peter K, Banks RE, Weissinger EM, Apweiler R, Schanstra J, Novak J	Proteomics Clinical Applications	2007	21136664	\N	\N
1692	Analytical Validation of Protein Expression Profiling for Diagnosis of PCa; Sources of Sample Bias	Cazares LH, Srivastava Sudhir, Semmes OJ, Yasui Y, Rosenzweig N, Zhang Z, Grizzle WE, Kagan J, Thornquist M, Oelschlager D, Banez LL, Bigbee WE, Chan DW, Thompson IM, Partin A, Zhu L, Malik G, Izbicka E, Randolph T, Feng Z, Diaz JI, Srivastava Shiv, McLerran D, Troyer D	Clinical Chemistry	2008	17981926	\N	\N
1693	Mining the Low Molecular Weight Proteome of Blood	Semmes OJ, Cazares L, Drake RR	Proteomics	2007	21136732	\N	\N
1694	SELDI Protein Profiling of Dunning R-3327 Cell Lines: Identification of Molecular Markers of Cancer Progression	Veltri RW, Malik G, Rojahn E, Semmes OJ, Partin AW, Gretzer MB, Ward MD	Prostate	2007	17705230	\N	\N
1695	SELDI-TOF-MS Whole Serum Proteomic Profiling With IMAC Surface Does Not Reliably Detect Prostate Cancer	Malik G, Randolph T, Thornquist  M, Thompson IM, Chan DW, Lin D, Sokoll L, Srivastava Shiv, Dahlgren J, Grizzle WE, Semmes OJ, Diaz JI, Zhang Z, Zhu L, McLerran D, Oelschlager D, Troyer D, Yasui Y, Cazares LH, Bigbee WL, Feng Z, Kagan J, Partin A, Srivastava Sudhir	Clinical Chemistry	2008	18024530	\N	\N
1696	Serum biomarkers to differentiate benign and malignant mammographic lesions	Drake RR, Shin S, Perry RR, Schneider H, Laronga C, Cazares L, Semmes OJ, Mitchell S	Journal of the American College of Surgeons	2007	17481542	\N	\N
1698	Cell surface-associated mucins in signal transduction	MA, Singh PK, Hollingsworth	Trends in Cell Biology	2006	16904320	\N	\N
1699	Notch 2-positive progenitors with the intrinsic ability to give rise to pancreatic ductal cells	Yasuda H, Hollingsworth MA, Ouellette MM, Lee KM	Laboratory Investigation	2005	15924149	\N	\N
1700	Recurrent fusion of TMPRSS2 and ETS transcription factor genes in prostate cancer.	Chinnaiyan AM., Dhanasekaran SM, Shah RB, Tchinda J, Tomlins SA, Sun XW, Cao X, Pienta KJ, Varambally S, Rubin MA, Rhodes DR, Perner S, Mehra R, Lee C, Kuefer R, Montie JE	Science	2005	16254181	\N	\N
1701	Evaluation of MUC6 mucin tandem repeats	Palmai-Pallag T, Morris HR, Sutton-Smith M, Hollingsworth MA, Parry S, Leir SH, Harris A, Dell A, Heal P	Biochim Biophys Acta	2004	15716126	\N	\N
1702	Role of antiapoptotic proteins in tumor necrosis factor-related apoptosis-inducing ligand and cisplatin-augmented apoptosis	Lee YJ, Kim JH, Ajaz M, Lokshin A	Clinical Cancer Research	2003	12912965	\N	\N
1703	Noninvasive detection of TMPRSS2:ERG fusion transcripts in the urine of men with prostate cancer.	Shah RB, Rubin MA, Wang L, Laxman B, Chinnaiyan AM., Helgeson BE, Wei JT, Mehra R, Morris DS, Tomlins SA	Neoplasia	2006	17059688	\N	\N
1704	TMPRSS2:ERG Fusion-Associated Deletions Provide Insight into the Heterogeneity of Prostate Cancer.	Sellers WR, Pienta KG, Rubin MA., Vessella R, Hofer MD, Beroukhim R, Kuefer R, Setlur S, Demichelis F, Schmidt FH, Tchinda J, Lee C, Meyerson M, Mosquera JM, Perner S, Chinnaiyan AM, Sun XW, Tomlins SA	Cancer Research	2006	16951139	\N	\N
1706	TMPRSS2:ETV4 gene fusions define a third molecular subtype of prostate cancer.	Chinnaiyan AM., Cao X, Roulston D, Helgeson BE, Smith LR, Rubin MA, Mehra R, Shah RB, Wei JT, Rhodes DR, Tomlins SA	Cancer Research	2006	16585160	\N	\N
1707	In vitro mechanisms of lovastatin on lung cancer cell lines as a potential chemopreventive agent.	Yie TA, Maksimova E, Rom Wn.	Lung	2008	18034278	\N	\N
1708	Plasma biomarker profiles differ depending on breast cancer subtype but RANTES is consistently increased	Daly DS, Tan R, Marks JR, Zangar RC, Gonzalez RM	Cancer epidemiology, biomarkers & prevention : a publication of the American Association for Cancer Research, cosponsored by the American Society of Preventive Oncology	2011	21586622	\N	\N
1709	Coordinated regulation of polycomb group complexes through microRNAs in cancer	Ateeq B, Cao Q, Palanisamy N, Pandhi M, Lonigro RJ, Tomlins SA, Prensner JR, Li Y, Cao X, Varambally S, Chinnaiyan AM, Wu YM, Mani RS, Dhanasekaran SM, Asangani IA, Wang R, Qin Z, Maher CA, Jing X, Dahiya A, Yu J, Kim JH, Brenner JC, Wang L	Cancer cell	2011	21840484	\N	\N
1744	Operating characteristics of prostate-specific antigen in men with an initial PSA level of 3.0 ng/ml or lower	Lucia MS, Parnes HL, Chi C, Ankerst DP, Goodman PJ, Coltman CA, Thompson IM, Crowley JJ	JAMA : The Journal of the American Medical Association	2005	15998892	\N	\N
1710	Urine TMPRSS2:ERG fusion transcript stratifies prostate cancer risk in men with elevated serum PSA	Blase A, Wei JT, Palanisamy N, Sanda MG, Meinke J, Meyers S, Rittenhouse H, Lonigro RJ, Day JR, Silberstein JL, Sefton-Miller L, Rhodes DR, Hodge P, Fradet Y, Siddiqui J, Han B, Sakamoto K, Groskopf J, Williamsen S, Miick S, Penabella Y, Wood D, Chinnaiyan AM, Rubin MA, Wang L, Amberson JB, Varambally R, Tomlins SA, Aubin SM, Hollenbeck B	Science translational medicine	2011	21813756	\N	\N
1711	Functionally recurrent rearrangements of the MAST kinase and Notch gene families in breast cancer	Natrajan R, Iyer M, Shankar S, Sabel MS, Chinnaiyan AM, Palanisamy N, Kleer CG, Reis-Filho JS, Asangani IA, Giordano TJ, Wu YM, Lonigro RJ, Maher CA, Siddiqui J, Mehra R, Lambros MB, Kumar-Sinha C, Ateeq B, Cao X, Robinson DR, Quist M, Kalyana-Sundaram S, Grasso CS, Jing X	Nature medicine	2011	22101766	\N	\N
1712	The emergence of lncRNAs in cancer biology	Chinnaiyan AM, Prensner JR	Cancer discovery	2011	22096659	\N	\N
1713	Personalized oncology through integrative high-throughput sequencing: a pilot study	Barrette T, Chinnaiyan AM, Siddiqui J, Lonigro RJ, Logothetis CJ, Talpaz M, Araujo JC, Roychowdhury S, Gruber SB, Roberts JS, Troncoso P, Robinson DR, Lao CD, Navone N, Pienta KJ, Cao X, Quist MJ, Smith DC, Balbin OA, Everett J, Iyer MK, Wu YM, Sam L, Innis JW, Kalyana-Sundaram S, Kunju LP, Kim SY	Science translational medicine	2011	22133722	\N	\N
1714	Detection of somatic copy number alterations in cancer using targeted exome capture sequencing	Tomlins SA, Pienta KJ, Robinson DR, Lonigro RJ, Cao X, Jing X, Grasso CS, Chinnaiyan AM, Wu YM, Quist MJ	Neoplasia (New York, N.Y.)	2011	22131877	\N	\N
1715	Glutamine synthetase is a genetic determinant of cell type-specific glutamine independence in breast epithelia	Marks JR, Chi JT, Kung HN	PLoS genetics	2011	21852960	\N	\N
1716	Validation of ovarian cancer gene expression signatures for survival and subtype in formalin fixed paraffin embedded tissues	Murphy SK, Akushevich L, Berchuck A, Whitaker R, Marks JR, Schildkraut JM, Sfakianos GP, Iversen ES	Gynecologic oncology	2013	23274563	\N	\N
1717	Overexpression of GalNAc-transferase GalNAc-T3 promotes pancreatic cancer cell growth	Tanouchi A, Kotani N, Honke K, Kohno K, Saibara T, Taniuchi K, Hollingsworth MA, Cerny RL	Oncogene	2011	21625220	\N	\N
1718	Pathobiological implications of MUC16 expression in pancreatic cancer	Wittel UA, Chakraborty S, Rachagani S, Batra SK, Lele SM, Ponnusamy MP, Das S, Haridas D, Kumar S, Anderson JM, Hollingsworth MA, Lakshmanan I, Cruz E	PLoS One	2011	22066010	\N	\N
1720	Cyclin-dependent kinase 5 is amplified and overexpressed in pancreatic cancer and activated by mutant K-Ras	Singh PK, Collisson EC, Swanson BJ, Lewallen ME, High RR, Hollingsworth MA, Caffrey TC, Tremayne J, Ouellette M, Eggers JP, Andersen JM, Grandgenett PM	Clinical cancer research : an official journal of the American Association for Cancer Research	2011	21825040	\N	\N
1721	Aberrant vimentin methylation is characteristic of upper gastrointestinal pathologies	Leidner RS, Chak A, Willis JE, Moinova H, Markowitz SD, Ravi L, Barnholtz-Sloan JS, Lutterbaugh J, Chen Y	Cancer epidemiology, biomarkers & prevention : a publication of the American Association for Cancer Research, cosponsored by the American Society of Preventive Oncology	2012	22315367	\N	\N
1722	The microRNAs, MiR-31 and MiR-375, as candidate markers in Barrett	Leahy P, Barnholtz-Sloan J, Canto M, Ravi L, Leidner RS, Streppel M, Bednarchik B, Maitra A, Chen Y, Wang JS, Adams MD, Markowitz SD, Chak A, Guda K, Willis J	Genes, chromosomes & cancer	2012	22302717	\N	\N
1723	Evaluating prognostic accuracy of biomarkers in nested case-control studies	Zheng Y, Cai T	Biostatistics	2012	21856652	\N	\N
1724	Evaluating Prognostic Accuracy of Biomarkers under Competing Risk	Zheng Y, Jin Y, Cai T, Feng Z	Biometrics	2012	22150576	\N	\N
1725	The multifaceted roles of neutrophil gelatinase associated lipocalin (NGAL) in inflammation and cancer	Batra SK, Guha S, Kaur S, Chakraborty S	Biochimica et biophysica acta	2012	22513004	\N	\N
1726	Role of MUC4-NIDO domain in the MUC4-mediated metastasis of pancreatic cancer cells	Momi N, Gnanapragassam VS, Moniaux N, Batra SK, Senapati S	Oncogene	2011	22105367	\N	\N
1727	Filling the void: urinary markers for bladder cancer risk and diagnosis	Gazdar AF, Czerniak B	Journal of the National Cancer Institute	2001	11259458	\N	\N
1728	Polymorphic hchk2/hcds1 codon 84 allele and risk of squamous cell carcinoma of the head and neck - A case-control analysis	Shen H, Eicher SA, Spitz MR, Sturgis ER, Strom SS, Zheng Y, Wei Q, Li L	Carcinogenesis	2001	11751432	\N	\N
1729	&#915;-Radiation-induced G2 Delay, Apoptosis and p53 Response as Potential Susceptibility Markers For Lung Cancer	Spitz MR, Zhang H, Tomlinson GE, Zhao H, Minna JD, Wu X	Cancer Research	2001	11691798	\N	\N
1730	A single nucleotide polymorphism in the matrix metalloproteinase-1 promoter enhances lung cancer susceptibility	Lei L, Spitz MR, Zhu Y, Wu X	Cancer Research	2001	11691799	\N	\N
1731	Cyclin D1 polymorphism and risk for squamous cell carcinoma of the head and neck – a case-control study	Wei Q, Wang L, Zheng Y, Shen H, Sturgis EM, Strom SS, Frazier ML, Spitz MR, Eicher SA	Carcinogenesis	2001	11470749	\N	\N
1732	The association of microsomal epoxide hydrolase polymorphisms and lung cancer risk in African-Americans and Mexican-Americans	Gwyn K, Spitz MR, Amos CI, Hong WK, Makan N, Wu X	Carcinogenesis	2001	11375900	\N	\N
1733	Alcohol Dehydrogenase 3 Genotype is Not Associated with Risk of Squamous Cell Carcinoma of the Oral Cavity and Pharynx	Dahlstrom KR, Guan Y, Eicher SA, Strom SS, Sturgis EM, Spitz MR, Wei Q	Cancer Epidemiology, Biomarkers & Prevention	2001	N/A	\N	\N
1735	BPDE-induces 3/21.3 and CCND1 Aberrations and Genetic Predisposition to HNSCC	Wu X, Lee JJ, Spitz MR, Frazier ML, Hong WK, Zheng  PJ	Proceedings of American Association for Cancer Research	2001	N/A	\N	\N
1736	Prostate cancer detection: a view of the future	Leach RJ, Ankerst DP, Thompson IM	European Urology	2011	21130561	\N	\N
1737	Prediction of prostate cancer for patients receiving finasteride: results from the Prostate Cancer Prevention Trial	Chi C, Pauler Ankerst D, Tangen CM, Thompson IM, Lippman SM, Parnes HL, Coltman CA, Lucia MS, Goodman PJ	Journal of Clinical Oncology : Official Journal of the American Society of Clinical Oncology	2007	17634486	\N	\N
1739	Association of RNASEL variants with prostate cancer risk in Hispanic Caucasians and African Americans	Torkko KC, Johnson-Pais TL, Shook SJ, Troyer DA, Beuten J, Leach RJ, Thompson IM	Clinical Cancer Research : An Official Journal of the American Association for Cancer Research	2007	17908993	\N	\N
1740	Total prostate specific antigen stability confirmed after long-term storage of serum at -80C	Leach RJ, Ankerst DP, Vipraio G, Reed AB, Thompson IM, Parekh DJ	The Journal of Urology	2008	18550121	\N	\N
1742	Active surveillance for prostate cancer	Klotz L, Thompson IM	JAMA : The Journal of the American Medical Association	2010	21119090	\N	\N
1743	Prostate-specific antigen in the early detection of prostate cancer	Thompson IM, Ankerst DP	CMAJ : Canadian Medical Association journal = journal de l	2007	17576986	\N	\N
1749	Quantifying peptide signal in MALDI-TOF mass spectrometry data	Lampe P, Mitchell B, McLerran D, Randolph T, Feng Z	Molecular and Cellular Proteomics	2005	16195224	\N	\N
1750	Epidemiology informing clinical practice: from bills of mortality to population laboratories	Potter J	Nature Clinical Practice	2005	16341118	\N	\N
1751	Inactivation of p16, RUNX3, and HPP1 occurs early in Barrett’s-associated neoplastic progression and predicts progression risk	Olaru A, Deacu E, Yin J, Krasna M, Schulmann K, Sterian A, Abraham J, Greenwald B, Meltzer S, Sato F, Berki A, Mori Y, Beer D, Schmiegel W, Feng Z, Wang S, Kan T, Xu Y	Oncogene	2005	15824739	\N	\N
1752	Differential methylation of genes that regulate cytokine signaling in lymphoid hematopoietic tumors	Stastny V, Zochbauer-Muller S, Drach J, Gazdar A, Kroft S, Takahashi T, Parikh G, Zheng Y, Crumrine K, McKenna R, Feng Z, Echebiri C, Shivapurkar N, Reddy J	Oncogene	2005	15580314	\N	\N
1753	Clinical and biological features associated with Epidermal Growth Factor Receptor Factor gene mutations in lung cancers	Feng Z, Fujisawa T, Lee H, Minna J, Suzuki M, Roth J, Herz J, Shimizu N, Takahashi T, Toyooka H, Gazdar A, Wistuba I, Shigematsu H, Li L, Nomura M, Fong K	Journal of the National Cancer Institute	2005	15741570	\N	\N
1755	Proteomic strategies for biomarker identification: Progress and challenges	Wright Jr. GL, Fung ET, Dalamasso EA	Current Opinion in Molecular Therapeutics	2000	11249741	\N	\N
1757	Use of proteomic patterns in serum to identify ovarian cancer	Fusaro VA, Fishman DA, Petricoin III EF, Steinberg SM, Hitt BA, Kohn EC, Simone C, Ardekani AM, Liotta LA, Levine PJ, Mills GB	Lancet	2002	11867112	\N	\N
1758	New approaches to proteomic analysis of breast cancer	Paweletz CP, Petricoin III EF, McLean KC, Wulfkuhle JD, Trock BJ, Sgroi DC, Steeg PS	Proteomics	2001	11721633	\N	\N
1760	A meeting of minds in proteomics	Petricoin III E, Hanash S, Liotta L	Proteomics	2001	11822353	\N	\N
1761	Establishment and validation of real time PCR method for CDH1 promoter methylation	Toyooka S, Feng Q, Gazdar AF, Minna JD, Smith A, Toyooka KO, Kiviat N, Maitra A, Ashfaq R	American Journal of Pathology	2002	12163387	\N	\N
1763	Progressive aberrant methylation of the RASSF1A gene in simian virus 40 infected human mesothelial cells	Bocchetta M, Minna JD, Carbone M, Shivapurkar N, Toyooka, Toyooka KO, Gazdar AF, S	Oncogene	2002	12082623	\N	\N
1764	SELDI-TOF MS Profiling of Serum for Detection of the Progression of Chronic Hepatitis C to Hepatocellular Carcinoma.	Johnson DA, Schwegler EE, Semmes OJ, Steel LF, Block TM, Marrero JA, Adam BL, Drake RR., Cazares L	Hepatology	2005	15726646	\N	\N
1765	Serum, salivary and tissue proteomics for discovery of biomarkers for head and neck cancers	Wadsworth JT., Semmes OJ, Drake RR, Cazares L	Expert Reviews Molecular Diagnostics	2005	15723595	\N	\N
1766	Preferential isolation of fragmented DNA enhances the detection of circulating mutated k-ras DNA	Steel L, Wang M, Su YH, Brenner DE, Block TM	Clinical Chemistry	2004	14709652	\N	\N
1768	Low dose topical delivery of all-trans retinoic acid for CIN II and III	Michael CW, Bailey JM, Normolle DP, Brenner DE, Unger ER, Ruffin MT, Bieniasz ME, Kmak DC	Cancer Epidemiology, Biomarkers & Prevention	2004	15598773	\N	\N
1769	Gene expression profile of cervical tissue compared to exfoliated cells: Impact on biomarker discovery	Rajeevan MS, Ruffin MT, Steinau MS, Vernon SD, Lee DR, Unger ER	BMC Genomics	2005	15876354	\N	\N
1770	Serum Levels of an Isoform of Apolipoprotein A-II as a Potential Marker for Prostate Cancer.	Semmes OJ., Adam B-L, Malik G, Ward M	Clinical Cancer Research	2005	15709174	\N	\N
1771	Cancer risk in mismatch repair gene mutation carriers	Lynch HT, Watson P	Familial Cancer	2001	14574017	\N	\N
1772	Tumor-infiltrating lymphocytes are a marker for microsatellite instability in colorectal carcinoma	Watson P, Lynch HT, Kaul K, Smyrk TC	Cancer	2001	11413533	\N	\N
1773	Familial adenomatous polyposis and extracolonic cancer	McComb RD, Lynch HT, Thorson AG, Franklin BA, Tinley ST, Lynch JF,	Digestive Diseases and Sciences	2001	11713930	\N	\N
1774	Discovery of distinct protein profiles specific for lung tumors and pre-malignant lung lesions by SELDI mass spectrometry	Johanson RA, Tockman MS, Zhukov TA, Clark RA, Cantor AB	Lung Cancer	2003	12781425	\N	\N
1775	Differential Expression of FEZ1/LZTS1 Gene in Lung Cancers and Their Cell Cultures	Toyooka S, Minna JD, Tockman MS, Fukuyama Y, Wistuba II, Gazdar AF	Clinical Cancer Research	2002	12114433	\N	\N
1776	Family with acute myelocytic leukemia, beast, ovarian, and gastrointestinal cancer	Snyder CL, Weisnburger DD, Quinn-Laquer B, Lynch JF, Lynch HT, Sanger WG, Lipkin SM	Cancer Genetics and Cytogenetics	2002	12377407	\N	\N
1777	Hereditary cancer: family history, diagnosis, molecular genetic, ecogenetics, and management strategies.	Lynch JF, Lynch HT	Biochimie	2002	11900873	\N	\N
1779	Proteomic analysis of cancer-cell mitochondria	Verrma,M, Sidransky,D, Kagan,J, Srivastava,S	National Rev Cancer	2003	14570046	\N	\N
1780	Diagnosis of roentgenographically occult lung cancer by sputum cytology	and Placic B, Tockman MS, Petty TL	Clinical Chest Medicine	2002	11901920	\N	\N
1781	Familial sarcoma/Challenging Pedigrees	Deters CA, Hogg D, Kinarsky Y, Gatalica Z, Lynch JF, Lynch HT	Cancer	2003	14584079	\N	\N
1782	Challenging pancreatic cancer-prone pedigrees: A nosologic dilemma	Lynch JF, Deters CA, Brand RA, Lynch HT	American Journal Gastroenterol	2002	12492191	\N	\N
1783	Proteomic biomarker identification for diagnosis of early relapse in ovarian cancer.	Rosenblatt KP, Oh JH, Knowles L, Schorge J, Gurnani P, Gao JX., Nandi A	J Bioinform Comput biol	2006	17245808	\N	\N
1785	Human RNA polymerase II-associated factor complex: dysregulation in cancer	Ponnusamy MP, Deb S, Chaudhary K, Moniaux N, Batra SK	Oncogene	2007	17599057	\N	\N
1786	Prediction of lung cancer using volatile biomarkers in breath.	Austin JHM, Rom WN and Schmitt P., Cameron RB, Pass HI, Rashid A, Altorki N, Greenberg J, Maxfield RA, Phillips M, Kloss R, Cataneo RN, Munawar MI	Cancer Biomarkers	2006	17522431	\N	\N
2	Characterizing expected benefits of biomarkers in treatment selection.	Ying Huang, Eric B Laber, Holly Janes	Biostatistics (Oxford, England)	2014	25190512	\N	\N
1788	Atomic models for the polypeptide backbones of myohemerythrin and hemerythrin.	W A Hendrickson, K B Ward	Biochemical and biophysical research communications	2000	5	\N	\N
1796	Detection of ductal carcinoma in situ and subsequent interval cancers.	Yiwey Shieh, Martin Eklund, Laura Esserman	BMJ (Clinical research ed.)	2016	26834245	1	1
1792	Use of Molecular Tools to Identify Patients With Indolent Breast Cancers With Ultralow Risk Over 2 Decades.	Laura J Esserman, Christina Yau, Carlie K Thompson, Laura J van 't Veer, Alexander D Borowsky, Katherine A Hoadley, Nicholas P Tobin, Bo Nordenskjöld, Tommy Fornander, Olle Stål, Christopher C Benz, Linda S Lindström	JAMA oncology	2017	28662222	1	1
1793	Co-expression modules identified from published immune signatures reveal five distinct immune subtypes in breast cancer.	Dominic Amara, Denise M Wolf, Laura van 't Veer, Laura Esserman, Michael Campbell, Christina Yau	Breast cancer research and treatment	2016	27815749	1	1
1794	Characterizing the immune microenvironment in high-risk ductal carcinoma in situ of the breast.	Michael J Campbell, Frederick Baehner, Tess O'Meara, Ekene Ojukwu, Booyeon Han, Rita Mukhtar, Vickram Tandon, Max Endicott, Zelos Zhu, Jasmine Wong, Gregor Krings, Alfred Au, Joe W Gray, Laura Esserman	Breast cancer research and treatment	2016	27785654	1	1
1799	MYC drives overexpression of telomerase RNA (hTR/TERC) in prostate cancer.	Javier A Baena-Del Valle, Qizhi Zheng, David M Esopi, Michael Rubenstein, Gretchen K Hubbard, Maria C Moncaliano, Andrew Hruszkewycz, Ajay Vaghasia, Srinivasan Yegnasubramanian, Sarah J Wheelan, Alan K Meeker, Christopher M Heaphy, Mindy K Graham, Angelo M De Marzo	The Journal of pathology	2017	28888037	1	1
1801	Phase I Trial of Intratumoral Injection of CCL21 Gene-Modified Dendritic Cells in Lung Cancer	Jay M Lee, Mi-Heon Lee, Edward Garon, Jonathan W Goldman, Ramin Salehi-Rad, Felicita E Baratelli, Dörthe Schaue, Gerald Wang, Fran Rosen, Jane Yanagawa, Tonya C Walser, Ying Lin, Stacy J Park, Sharon Adams, Francesco M Marincola, Paul C Tumeh, Fereidoun Abtin, Robert Suh, Karen L Reckamp, Gina Lee, William D Wallace, Sarah Lee, Gang Zeng, David A Elashoff, Sherven Sharma, Steven M Dubinett	Clinical cancer research : an official journal of the American Association for Cancer Research	2017	28468947	1	1
1803	Use of the Prostate Health Index for detection of prostate cancer: results from a large academic practice.	J J Tosoian, S C Druskin, D Andreas, P Mullane, M Chappidi, S Joo, K Ghabili, J Agostino, K J Macura, H B Carter, E M Schaeffer, A W Partin, L J Sokoll, A E Ross	Prostate cancer and prostatic diseases	2017	28117387	1	1
1804	Oligometastatic prostate cancer: definitions, clinical outcomes, and treatment considerations.	Jeffrey J Tosoian, Michael A Gorin, Ashley E Ross, Kenneth J Pienta, Phuoc T Tran, Edward M Schaeffer	Nature reviews. Urology	2016	27725639	1	1
1805	Radiological Image Traits Predictive of Cancer Status in Pulmonary Nodules.	Ying Liu, Yoganand Balagurunathan, Thomas Atwater, Sanja Antic, Qian Li, Ronald C Walker, Gary T Smith, Pierre P Massion, Matthew B Schabath, Robert J Gillies	Clinical cancer research : an official journal of the American Association for Cancer Research	2016	27663588	1	1
1806	Single cell analysis of human tissues and solid tumors with mass cytometry.	Nalin Leelatian, Deon B Doxie, Allison R Greenplate, Bret C Mobley, Jonathan M Lehman, Justine Sinnaeve, Rondi M Kauffmann, Jay A Werkhaven, Akshitkumar M Mistry, Kyle D Weaver, Reid C Thompson, Pierre P Massion, Mary A Hooks, Mark C Kelley, Lola B Chambless, Rebecca A Ihrie, Jonathan M Irish	Cytometry. Part B, Clinical cytometry	2016	27598832	1	1
1807	Integrated digital error suppression for improved detection of circulating tumor DNA.	Aaron M Newman, Alexander F Lovejoy, Daniel M Klass, David M Kurtz, Jacob J Chabon, Florian Scherer, Henning Stehr, Chih Long Liu, Scott V Bratman, Carmen Say, Li Zhou, Justin N Carter, Robert B West, George W Sledge, Joseph B Shrager, Billy W Loo, Joel W Neal, Heather A Wakelee, Maximilian Diehn, Ash A Alizadeh	Nature biotechnology	2016	27018799	1	1
1809	Imaging-based biomarkers: Changes in the tumor interface of pancreatic ductal adenocarcinoma on computed tomography scans	Ahmed M Amer, Mohamed Zaid, Baishali Chaudhury, Dalia Elganainy, Yeonju Lee, Christopher T Wilke, Jordan Cloyd, Huamin Wang, Anirban Maitra, Robert A Wolff, Gauri Varadhachary, Michael J Overman, Jeffery E Lee, Jason B Fleming, Ching Wei Tzeng, Matthew H Katz, Emma B Holliday, Sunil Krishnan, Bruce D Minsky, Joseph M Herman, Cullen M Taniguchi, Prajnan Das, Christopher H Crane, Ott Le, Priya Bhosale, Eric P Tamm, Eugene J Koay	Cancer	2018	29370450	1	1
1810	The role of imaging in the clinical practice of radiation oncology for pancreatic cancer.	Eugene J Koay, William Hall, Peter C Park, Beth Erickson, Joseph M Herman	Abdominal radiology (New York)	2018	29110053	1	1
1811	Altered hydroxymethylation is seen at regulatory regions in pancreatic cancer and regulates oncogenic pathways.	Sanchari Bhattacharyya, Kith Pradhan, Nathaniel Campbell, Jozef Mazdo, Aparna Vasantkumar, Shahina Maqbool, Tushar D Bhagat, Sonal Gupta, Masako Suzuki, Yiting Yu, John M Greally, Ulrich Steidl, James Bradner, Meelad Dawlaty, Lucy Godley, Anirban Maitra, Amit Verma	Genome research	2017	28986391	1	1
1812	Combined circulating tumor DNA and protein biomarker-based liquid biopsy for the earlier detection of pancreatic cancers.	Joshua D Cohen, Ammar A Javed, Christopher Thoburn, Fay Wong, Jeanne Tie, Peter Gibbs, C Max Schmidt, Michele T Yip-Schneider, Peter J Allen, Mark Schattner, Randall E Brand, Aatur D Singhi, Gloria M Petersen, Seung-Mo Hong, Song Cheol Kim, Massimo Falconi, Claudio Doglioni, Matthew J Weiss, Nita Ahuja, Jin He, Martin A Makary, Anirban Maitra, Samir M Hanash, Marco Dal Molin, Yuxuan Wang, Lu Li, Janine Ptak, Lisa Dobbyn, Joy Schaefer, Natalie Silliman, Maria Popoli, Michael G Goggins, Ralph H Hruban, Christopher L Wolfgang, Alison P Klein, Cristian Tomasetti, Nickolas Papadopoulos, Kenneth W Kinzler, Bert Vogelstein, Anne Marie Lennon	Proceedings of the National Academy of Sciences of the United States of America	2017	28874546	1	1
1813	Editorial: Special Section on Multiscale Cancer Modeling.	Zhihui Wang, Philip K Maini	IEEE transactions on bio-medical engineering	2017	28824199	1	1
1795	Immune DNA signature of T-cell infiltration in breast tumor exomes.	Eric Levy, Rachel Marty, Valentina Gárate Calderón, Brian Woo, Michelle Dow, Ricardo Armisen, Hannah Carter, Olivier Harismendy	Scientific reports	2016	27452728	1	1
1798	CancerLocator: non-invasive cancer diagnosis and tissue-of-origin prediction using methylation profiles of cell-free DNA.	Shuli Kang, Qingjiao Li, Quan Chen, Yonggang Zhou, Stacy Park, Gina Lee, Brandon Grimes, Kostyantyn Krysan, Min Yu, Wei Wang, Frank Alber, Fengzhu Sun, Steven M Dubinett, Wenyuan Li, Xianghong Jasmine Zhou	Genome biology	2017	28335812	1	1
1814	Spatial computation of intratumoral T cells correlates with survival of patients with pancreatic cancer.	Julienne L Carstens, Pedro Correa de Sampaio, Dalu Yang, Souptik Barua, Huamin Wang, Arvind Rao, James P Allison, Valerie S LeBleu, Raghu Kalluri	Nature communications	2017	28447602	1	1
1815	Global Protease Activity Profiling Provides Differential Diagnosis of Pancreatic Cysts.	Sam L Ivry, Jeremy M Sharib, Dana A Dominguez, Nilotpal Roy, Stacy E Hatcher, Michele T Yip-Schneider, C Max Schmidt, Randall E Brand, Walter G Park, Matthias Hebrok, Grace E Kim, Anthony J O'Donoghue, Kimberly S Kirkwood, Charles S Craik	Clinical cancer research : an official journal of the American Association for Cancer Research	2017	28424202	1	1
1816	High prevalence of mutant KRAS in circulating exosome-derived DNA from early-stage pancreatic cancer patients.	K Allenson, J Castillo, F A San Lucas, G Scelo, D U Kim, V Bernard, G Davis, T Kumar, M Katz, M J Overman, L Foretova, E Fabianova, I Holcatova, V Janout, F Meric-Bernstam, P Gascoyne, I Wistuba, G Varadhachary, P Brennan, S Hanash, D Li, A Maitra, H Alvarez	Annals of oncology : official journal of the European Society for Medical Oncology	2017	28104621	1	1
1817	Quantitative imaging to evaluate malignant potential of IPMNs.	Alexander N Hanania, Leonidas E Bantis, Ziding Feng, Huamin Wang, Eric P Tamm, Matthew H Katz, Anirban Maitra, Eugene J Koay	Oncotarget	2016	27588410	1	1
1819	Genetics and biology of pancreatic ductal adenocarcinoma.	Haoqiang Ying, Prasenjit Dey, Wantong Yao, Alec C Kimmelman, Giulio F Draetta, Anirban Maitra, Ronald A DePinho	Genes & development	2016	26883357	1	1
1820	Computer Simulation, Visualization, and Image Processing of Cancer Data and Processes.	David Johnson, James Osborne, Zhihui Wang, Kostas Marias	Cancer informatics	2016	26798209	1	1
1822	Minimally invasive genomic and transcriptomic profiling of visceral cancers by next-generation sequencing	F A San Lucas, K Allenson, V Bernard, J Castillo, D U Kim, K Ellis, E A Ehli, G E Davies, J L Petersen, D Li, R Wolff, M Katz, G Varadhachary, I Wistuba, A Maitra, H Alvarez	Annals of oncology : official journal of the European Society for Medical Oncology	2015	26681674	1	1
1823	Exact and Approximate Statistical Inference for Nonlinear Regression and the Estimating Equation Approach.	Eugene Demidenko	Scandinavian journal of statistics, theory and applications	2017	29033489	1	1
1824	Opportunities and Challenges for Environmental Exposure Assessment in Population-Based Studies.	Chirag J Patel, Jacqueline Kerr, Duncan C Thomas, Bhramar Mukherjee, Beate Ritz, Nilanjan Chatterjee, Marta Jankowska, Juliette Madan, Margaret R Karagas, Kimberly A McAllister, Leah E Mechanic, M Daniele Fallin, Christine Ladd-Acosta, Ian A Blair, Susan L Teitelbaum, Christopher I Amos	Cancer epidemiology, biomarkers & prevention : a publication of the American Association for Cancer Research, cosponsored by the American Society of Preventive Oncology	2017	28710076	1	1
1825	Unsupervised gene set testing based on random matrix theory.	H Robert Frost, Christopher I Amos	BMC bioinformatics	2016	27809777	1	1
1826	The OncoArray Consortium: A Network for Understanding the Genetic Architecture of Common Cancers.	Christopher I Amos, Joe Dennis, Zhaoming Wang, Jinyoung Byun, Fredrick R Schumacher, Simon A Gayther, Graham Casey, David J Hunter, Thomas A Sellers, Stephen B Gruber, Alison M Dunning, Kyriaki Michailidou, Laura Fachal, Kimberly Doheny, Amanda B Spurdle, Yafang Li, Xiangjun Xiao, Jane Romm, Elizabeth Pugh, Gerhard A Coetzee, Dennis J Hazelett, Stig E Bojesen, Charlisse Caga-Anan, Christopher A Haiman, Ahsan Kamal, Craig Luccarini, Daniel Tessier, Daniel Vincent, François Bacot, David J Van Den Berg, Stefanie Nelson, Stephen Demetriades, David E Goldgar, Fergus J Couch, Judith L Forman, Graham G Giles, David V Conti, Heike Bickeböller, Angela Risch, Melanie Waldenberger, Irene Brüske-Hohlfeld, Belynda D Hicks, Hua Ling, Lesley McGuffog, Andrew Lee, Karoline Kuchenbaecker, Penny Soucy, Judith Manz, Julie M Cunningham, Katja Butterbach, Zsofia Kote-Jarai, Peter Kraft, Liesel FitzGerald, Sara Lindström, Marcia Adams, James D McKay, Catherine M Phelan, Sara Benlloch, Linda E Kelemen, Paul Brennan, Marjorie Riggan, Tracy A O'Mara, Hongbing Shen, Yongyong Shi, Deborah J Thompson, Marc T Goodman, Sune F Nielsen, Andrew Berchuck, Sylvie Laboissiere, Stephanie L Schmit, Tameka Shelford, Christopher K Edlund, Jack A Taylor, John K Field, Sue K Park, Kenneth Offit, Mads Thomassen, Rita Schmutzler, Laura Ottini, Rayjean J Hung, Jonathan Marchini, Ali Amin Al Olama, Ulrike Peters, Rosalind A Eeles, Michael F Seldin, Elizabeth Gillanders, Daniela Seminara, Antonis C Antoniou, Paul D P Pharoah, Georgia Chenevix-Trench, Stephen J Chanock, Jacques Simard, Douglas F Easton	Cancer epidemiology, biomarkers & prevention : a publication of the American Association for Cancer Research, cosponsored by the American Society of Preventive Oncology	2016	27697780	1	1
1827	A Novel Pathway-Based Approach Improves Lung Cancer Risk Prediction Using Germline Genetic Variations.	David C Qian, Younghun Han, Jinyoung Byun, Hae Ri Shin, Rayjean J Hung, John R McLaughlin, Maria Teresa Landi, Daniela Seminara, Christopher I Amos	Cancer epidemiology, biomarkers & prevention : a publication of the American Association for Cancer Research, cosponsored by the American Society of Preventive Oncology	2016	27222311	1	1
1828	Boolean analysis identifies CD38 as a biomarker of aggressive localized prostate cancer.	Debashis Sahoo, Wei Wei, Heidi Auman, Antonio Hurtado-Coll, Peter R Carroll, Ladan Fazli, Martin E Gleave, Daniel W Lin, Peter S Nelson, Jeff Simko, Ian M Thompson, Robin J Leach, Dean A Troyer, Lawrence D True, Jesse K McKenney, Ziding Feng, James D Brooks	Oncotarget	2018	29464091	1	1
1830	Genome-wide DNA methylation measurements in prostate tissues uncovers novel prostate cancer diagnostic biomarkers	Marie K Kirby, Ryne C Ramaker, Brian S Roberts, Brittany N Lasseigne, David S Gunther, Todd C Burwell, Nicholas S Davis, Zulfiqar G Gulzar, Devin M Absher, Sara J Cooper, James D Brooks, Richard M Myers	BMC cancer	2017	28412973	1	1
1831	Diagnosis of prostate cancer by desorption electrospray ionization mass spectrometric imaging of small metabolites and lipids.	Shibdas Banerjee, Richard N Zare, Robert J Tibshirani, Christian A Kunder, Rosalie Nolley, Richard Fan, James D Brooks, Geoffrey A Sonn	Proceedings of the National Academy of Sciences of the United States of America	2017	28292895	1	1
1833	MUC1 Expression by Immunohistochemistry Is Associated with Adverse Pathologic Features in Prostate Cancer	Okyaz Eminaga, Wei Wei, Sarah J Hawley, Heidi Auman, Lisa F Newcomb, Jeff Simko, Antonio Hurtado-Coll, Dean A Troyer, Peter R Carroll, Martin E Gleave, Daniel W Lin, Peter S Nelson, Ian M Thompson, Lawrence D True, Jesse K McKenney, Ziding Feng, Ladan Fazli, James D Brooks	PloS one	2016	27846218	1	1
1818	A hybrid agent-based model of the developing mammary terminal end bud.	Joseph D Butner, Yao-Li Chuang, Eman Simbawa, A S Al-Fhaid, S R Mahmoud, Vittorio Cristini, Zhihui Wang	Journal of theoretical biology	2016	27475843	1	1
1834	Loss of Expression of AZGP1 Is Associated With Worse Clinical Outcomes in a Multi-Institutional Radical Prostatectomy Cohort.	James D Brooks, Wei Wei, Jonathan R Pollack, Robert B West, Jun Ho Shin, John B Sunwoo, Sarah J Hawley, Heidi Auman, Lisa F Newcomb, Jeff Simko, Antonio Hurtado-Coll, Dean A Troyer, Peter R Carroll, Martin E Gleave, Daniel W Lin, Peter S Nelson, Ian M Thompson, Lawrence D True, Jesse K McKenney, Ziding Feng, Ladan Fazli	The Prostate	2016	27325561	1	1
1835	Mitotically-Associated lncRNA (MANCR) Affects Genomic Stability and Cell Division in Aggressive Breast Cancer.	Kirsten M Tracy, Coralee E Tye, Prachi N Ghule, Heidi L H Malaby, Jason Stumpff, Janet L Stein, Gary S Stein, Jane B Lian	Molecular cancer research : MCR	2018	29378907	1	1
1836	tsRNA signatures in cancer.	Veronica Balatti, Giovanni Nigita, Dario Veneziano, Alessandra Drusco, Gary S Stein, Terri L Messier, Nicholas H Farina, Jane B Lian, Luisa Tomasello, Chang-Gong Liu, Alexey Palamarchuk, Jonathan R Hart, Catherine Bell, Mariantonia Carosi, Edoardo Pescarmona, Letizia Perracchio, Maria Diodoro, Andrea Russo, Anna Antenucci, Paolo Visca, Antonio Ciardi, Curtis C Harris, Peter K Vogt, Yuri Pekarsky, Carlo M Croce	Proceedings of the National Academy of Sciences of the United States of America	2017	28696308	1	1
1837	Intranuclear and higher-order chromatin organization of the major histone gene cluster in breast cancer.	Andrew J Fritz, Prachi N Ghule, Joseph R Boyd, Coralee E Tye, Natalie A Page, Deli Hong, David J Shirley, Adam S Weinheimer, Ahmet R Barutcu, Diana L Gerrard, Seth Frietze, Andre J van Wijnen, Sayyed K Zaidi, Anthony N Imbalzano, Jane B Lian, Janet L Stein, Gary S Stein	Journal of cellular physiology	2017	28504305	1	1
1838	Selective expression of long non-coding RNAs in a breast cancer cell progression model.	Kirsten M Tracy, Coralee E Tye, Natalie A Page, Andrew J Fritz, Janet L Stein, Jane B Lian, Gary S Stein	Journal of cellular physiology	2017	28488769	1	1
413	A new family-based association test via a least square method	Joo J, Yang S, Lin J, Feng Z	BioMed Central Genetics	2005	16451567	\N	1
1790	Pathobiology of the 129:Stat1 -/- mouse model of human age-related ER-positive breast cancer with an immune infiltrate-excluded phenotype.	Hidetoshi Mori, Jane Q Chen, Robert D Cardiff, Zsofia Penzvalto, Neil E Hubbard, Louis Schuetter, Russell C Hovey, Josephine F Trott, Alexander D Borowsky	Breast cancer research : BCR	2017	28865492	1	1
1802	AIM1 is an actin-binding protein that suppresses cell migration and micrometastatic dissemination.	Michael C Haffner, David M Esopi, Alcides Chaux, Meltem Gürel, Susmita Ghosh, Ajay M Vaghasia, Harrison Tsai, Kunhwa Kim, Nicole Castagna, Hong Lam, Jessica Hicks, Nicolas Wyhs, Debika Biswal Shinohara, Paula J Hurley, Brian W Simons, Edward M Schaeffer, Tamara L Lotan, William B Isaacs, George J Netto, Angelo M De Marzo, William G Nelson, Steven S An, Srinivasan Yegnasubramanian	Nature communications	2017	28747635	1	1
461	2-D or not 2-D is there a fututre for 2-D gels in proteomics? Insights from the York proteomic meeting	Hanash, S	Proteomics	2001	11678032	\N	1
\.


--
-- Name: publication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('publication_id_seq', 1, false);


--
-- Data for Name: publication_program_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY publication_program_link (id, publicationid, programid) FROM stdin;
2	1792	1
3	1793	1
4	1794	1
6	1796	1
8	1799	1
9	1801	1
11	1803	1
12	1804	1
13	1805	1
14	1806	1
15	1807	1
16	1809	1
17	1810	1
18	1811	1
19	1812	1
20	1813	1
21	1814	1
22	1815	1
23	1816	1
24	1817	1
26	1819	1
27	1820	1
28	1822	1
29	1823	1
30	1824	1
31	1825	1
32	1826	1
33	1827	1
34	1828	1
35	1830	1
36	1831	1
37	1833	1
38	1834	1
39	1835	1
40	1836	1
41	1837	1
42	1838	1
43	413	1
46	1790	1
47	1795	1
48	1802	1
49	1798	1
50	461	1
51	1818	1
\.


--
-- Name: publication_program_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('publication_program_link_id_seq', 51, true);


--
-- Name: publication_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('publication_seq', 1838, true);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY species (id, title, description) FROM stdin;
1	Homo sapiens	Human - Taxonomy ID: 9606
2	Mus musculus	House Mouse - Taxonomy ID: 10090
3	Bos taurus	Cattle - Taxonomy ID: 9913
4	Escherichia coli	E. Coli - Taxonomy ID: 562
5	Rattus norvegicus	Rat - Taxonomy ID: 10116
6	Caenorhabditis elegans	Roundworm - Taxonomy ID: 6239
7	Cricetulus griseus 	Chinese hamsters - Taxonomy ID: 10029
8	Saccharomyces cerevisiae 	Yeast  - Taxonomy ID: 4932
\.


--
-- Name: species_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('species_seq', 8, true);


--
-- Data for Name: specimentype; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY specimentype (id, title, description, organs) FROM stdin;
1	Blood		
2	Urine		
3	Tissue		
4	Stool 		
5	Ascites		
6	Saliva 		
7	Endocervical secretion/mucous 		
8	Pancreatic washing/brushing 		
9	Nipple aspirate/discharge 		
10	Pleural fluid 		
11	Seminal fluid 		
12	Biliary washing/brushing 		
13	Bone marrow 		
14	Bronchial washing/brushing 		
15	Buccal swab/scraping 		
16	Cerebrospinal fluid 		
17	Cervical swab/scraping 		
18	Ductal lavage aspirate		
19	Not Applicable		
\.


--
-- Data for Name: specimentype_organ_link; Type: TABLE DATA; Schema: public; Owner: edrn
--

COPY specimentype_organ_link (id, specimentypeid, organid) FROM stdin;
\.


--
-- Name: specimentype_organ_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('specimentype_organ_link_id_seq', 1, false);


--
-- Name: specimentype_seq; Type: SEQUENCE SET; Schema: public; Owner: edrn
--

SELECT pg_catalog.setval('specimentype_seq', 19, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: ci_protocol_link_protocolid_personid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY ci_protocol_link
    ADD CONSTRAINT ci_protocol_link_protocolid_personid_key UNIQUE (protocolid, personid);


--
-- Name: collabgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY collabgroup
    ADD CONSTRAINT collabgroup_pkey PRIMARY KEY (id);


--
-- Name: committee_chair_link_committeeid_personid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY committee_chair_link
    ADD CONSTRAINT committee_chair_link_committeeid_personid_key UNIQUE (committeeid, personid);


--
-- Name: committee_cochair_link_committeeid_personid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY committee_cochair_link
    ADD CONSTRAINT committee_cochair_link_committeeid_personid_key UNIQUE (committeeid, personid);


--
-- Name: committee_member_link_committeeid_personid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY committee_member_link
    ADD CONSTRAINT committee_member_link_committeeid_personid_key UNIQUE (committeeid, personid);


--
-- Name: committee_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY committee
    ADD CONSTRAINT committee_pkey PRIMARY KEY (id);


--
-- Name: committee_program_link_committeeid_programid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY committee_program_link
    ADD CONSTRAINT committee_program_link_committeeid_programid_key UNIQUE (committeeid, programid);


--
-- Name: con_fundedsite_link_fundedsiteid_personid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY con_fundedsite_link
    ADD CONSTRAINT con_fundedsite_link_fundedsiteid_personid_key UNIQUE (fundedsiteid, personid);


--
-- Name: degree_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY degree
    ADD CONSTRAINT degree_pkey PRIMARY KEY (id);


--
-- Name: discipline_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY discipline
    ADD CONSTRAINT discipline_pkey PRIMARY KEY (id);


--
-- Name: disease_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY disease
    ADD CONSTRAINT disease_pkey PRIMARY KEY (id);


--
-- Name: disease_protocol_link_diseaseid_protocolid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY disease_protocol_link
    ADD CONSTRAINT disease_protocol_link_diseaseid_protocolid_key UNIQUE (diseaseid, protocolid);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: fundedsite_institution_link_fundedsiteid_institutionid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY fundedsite_institution_link
    ADD CONSTRAINT fundedsite_institution_link_fundedsiteid_institutionid_key UNIQUE (fundedsiteid, institutionid);


--
-- Name: fundedsite_organ_link_fundedsiteid_organid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY fundedsite_organ_link
    ADD CONSTRAINT fundedsite_organ_link_fundedsiteid_organid_key UNIQUE (fundedsiteid, organid);


--
-- Name: fundedsite_pi_link_fundedsiteid_personid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY fundedsite_pi_link
    ADD CONSTRAINT fundedsite_pi_link_fundedsiteid_personid_key UNIQUE (fundedsiteid, personid);


--
-- Name: fundedsite_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY fundedsite
    ADD CONSTRAINT fundedsite_pkey PRIMARY KEY (id);


--
-- Name: fundedsite_project_link_fundedsiteid_projectid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY fundedsite_program_link
    ADD CONSTRAINT fundedsite_project_link_fundedsiteid_projectid_key UNIQUE (fundedsiteid, programid);


--
-- Name: fundedsite_protocol_link_protocolid_fundedsiteid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY fundedsite_protocol_link
    ADD CONSTRAINT fundedsite_protocol_link_protocolid_fundedsiteid_key UNIQUE (protocolid, fundedsiteid);


--
-- Name: fundedsite_staff_link_fundedsiteid_personid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY fundedsite_staff_link
    ADD CONSTRAINT fundedsite_staff_link_fundedsiteid_personid_key UNIQUE (fundedsiteid, personid);


--
-- Name: group_chair_link_groupid_personid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY group_chair_link
    ADD CONSTRAINT group_chair_link_groupid_personid_key UNIQUE (groupid, personid);


--
-- Name: group_cochair_link_groupid_personid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY group_cochair_link
    ADD CONSTRAINT group_cochair_link_groupid_personid_key UNIQUE (groupid, personid);


--
-- Name: group_member_link_groupid_personid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY group_member_link
    ADD CONSTRAINT group_member_link_groupid_personid_key UNIQUE (groupid, personid);


--
-- Name: group_program_link_groupid_programid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY group_program_link
    ADD CONSTRAINT group_program_link_groupid_programid_key UNIQUE (groupid, programid);


--
-- Name: institution_personnel_link_institutionid_personid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY institution_personnel_link
    ADD CONSTRAINT institution_personnel_link_institutionid_personid_key UNIQUE (institutionid, personid);


--
-- Name: institution_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY institution
    ADD CONSTRAINT institution_pkey PRIMARY KEY (id);


--
-- Name: ksdb_inputfile_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY ksdb_inputfile
    ADD CONSTRAINT ksdb_inputfile_pkey PRIMARY KEY (id);


--
-- Name: organ_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY organ
    ADD CONSTRAINT organ_pkey PRIMARY KEY (id);


--
-- Name: organ_protocol_link_protocolid_organid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY organ_protocol_link
    ADD CONSTRAINT organ_protocol_link_protocolid_organid_key UNIQUE (protocolid, organid);


--
-- Name: person_degree_link_degreeid_personid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY person_degree_link
    ADD CONSTRAINT person_degree_link_degreeid_personid_key UNIQUE (degreeid, personid);


--
-- Name: person_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: pi_protocol_link_protocolid_personid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY pi_protocol_link
    ADD CONSTRAINT pi_protocol_link_protocolid_personid_key UNIQUE (protocolid, personid);


--
-- Name: pi_publication_link_publicationid_personid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY pi_publication_link
    ADD CONSTRAINT pi_publication_link_publicationid_personid_key UNIQUE (publicationid, personid);


--
-- Name: project_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY program
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: protocol_custodian_link_personid_protocolid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY protocol_custodian_link
    ADD CONSTRAINT protocol_custodian_link_personid_protocolid_key UNIQUE (personid, protocolid);


--
-- Name: protocol_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY protocol
    ADD CONSTRAINT protocol_pkey PRIMARY KEY (id);


--
-- Name: protocol_program_link_protocolid_programid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY protocol_program_link
    ADD CONSTRAINT protocol_program_link_protocolid_programid_key UNIQUE (protocolid, programid);


--
-- Name: protocol_publication_link_publicationid_protocolid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY protocol_publication_link
    ADD CONSTRAINT protocol_publication_link_publicationid_protocolid_key UNIQUE (publicationid, protocolid);


--
-- Name: publication_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY publication
    ADD CONSTRAINT publication_pkey PRIMARY KEY (id);


--
-- Name: publication_program_link_publicationid_programid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY publication_program_link
    ADD CONSTRAINT publication_program_link_publicationid_programid_key UNIQUE (publicationid, programid);


--
-- Name: species_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY species
    ADD CONSTRAINT species_pkey PRIMARY KEY (id);


--
-- Name: specimentype_organ_link_specimentypeid_organid_key; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY specimentype_organ_link
    ADD CONSTRAINT specimentype_organ_link_specimentypeid_organid_key UNIQUE (specimentypeid, organid);


--
-- Name: specimentype_pkey; Type: CONSTRAINT; Schema: public; Owner: edrn; Tablespace: 
--

ALTER TABLE ONLY specimentype
    ADD CONSTRAINT specimentype_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: edrn; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: edrn; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: edrn; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: edrn; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: edrn; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: edrn; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: edrn; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: edrn; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: edrn; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: edrn; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: edrn; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: edrn; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: edrn; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ci_protocol_link_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY ci_protocol_link
    ADD CONSTRAINT ci_protocol_link_personid_fkey FOREIGN KEY (personid) REFERENCES person(id);


--
-- Name: ci_protocol_link_protocolid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY ci_protocol_link
    ADD CONSTRAINT ci_protocol_link_protocolid_fkey FOREIGN KEY (protocolid) REFERENCES protocol(id);


--
-- Name: committee_chair_link_committeeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY committee_chair_link
    ADD CONSTRAINT committee_chair_link_committeeid_fkey FOREIGN KEY (committeeid) REFERENCES committee(id);


--
-- Name: committee_chair_link_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY committee_chair_link
    ADD CONSTRAINT committee_chair_link_personid_fkey FOREIGN KEY (personid) REFERENCES person(id);


--
-- Name: committee_cochair_link_committeeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY committee_cochair_link
    ADD CONSTRAINT committee_cochair_link_committeeid_fkey FOREIGN KEY (committeeid) REFERENCES committee(id);


--
-- Name: committee_cochair_link_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY committee_cochair_link
    ADD CONSTRAINT committee_cochair_link_personid_fkey FOREIGN KEY (personid) REFERENCES person(id);


--
-- Name: committee_member_link_committeeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY committee_member_link
    ADD CONSTRAINT committee_member_link_committeeid_fkey FOREIGN KEY (committeeid) REFERENCES committee(id);


--
-- Name: committee_member_link_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY committee_member_link
    ADD CONSTRAINT committee_member_link_personid_fkey FOREIGN KEY (personid) REFERENCES person(id);


--
-- Name: committee_program_link_committeeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY committee_program_link
    ADD CONSTRAINT committee_program_link_committeeid_fkey FOREIGN KEY (committeeid) REFERENCES committee(id);


--
-- Name: committee_program_link_programid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY committee_program_link
    ADD CONSTRAINT committee_program_link_programid_fkey FOREIGN KEY (programid) REFERENCES program(id);


--
-- Name: con_fundedsite_link_fundedsiteid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY con_fundedsite_link
    ADD CONSTRAINT con_fundedsite_link_fundedsiteid_fkey FOREIGN KEY (fundedsiteid) REFERENCES fundedsite(id);


--
-- Name: con_fundedsite_link_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY con_fundedsite_link
    ADD CONSTRAINT con_fundedsite_link_personid_fkey FOREIGN KEY (personid) REFERENCES person(id);


--
-- Name: disease_protocol_link_diseaseid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY disease_protocol_link
    ADD CONSTRAINT disease_protocol_link_diseaseid_fkey FOREIGN KEY (diseaseid) REFERENCES disease(id);


--
-- Name: disease_protocol_link_protocolid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY disease_protocol_link
    ADD CONSTRAINT disease_protocol_link_protocolid_fkey FOREIGN KEY (protocolid) REFERENCES protocol(id);


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fundedsite_institution_link_fundedsiteid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY fundedsite_institution_link
    ADD CONSTRAINT fundedsite_institution_link_fundedsiteid_fkey FOREIGN KEY (fundedsiteid) REFERENCES fundedsite(id);


--
-- Name: fundedsite_institution_link_institutionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY fundedsite_institution_link
    ADD CONSTRAINT fundedsite_institution_link_institutionid_fkey FOREIGN KEY (institutionid) REFERENCES institution(id);


--
-- Name: fundedsite_organ_link_fundedsiteid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY fundedsite_organ_link
    ADD CONSTRAINT fundedsite_organ_link_fundedsiteid_fkey FOREIGN KEY (fundedsiteid) REFERENCES fundedsite(id);


--
-- Name: fundedsite_organ_link_organid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY fundedsite_organ_link
    ADD CONSTRAINT fundedsite_organ_link_organid_fkey FOREIGN KEY (organid) REFERENCES organ(id);


--
-- Name: fundedsite_pi_link_fundedsiteid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY fundedsite_pi_link
    ADD CONSTRAINT fundedsite_pi_link_fundedsiteid_fkey FOREIGN KEY (fundedsiteid) REFERENCES fundedsite(id);


--
-- Name: fundedsite_pi_link_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY fundedsite_pi_link
    ADD CONSTRAINT fundedsite_pi_link_personid_fkey FOREIGN KEY (personid) REFERENCES person(id);


--
-- Name: fundedsite_project_link_fundedsiteid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY fundedsite_program_link
    ADD CONSTRAINT fundedsite_project_link_fundedsiteid_fkey FOREIGN KEY (fundedsiteid) REFERENCES fundedsite(id);


--
-- Name: fundedsite_project_link_projectid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY fundedsite_program_link
    ADD CONSTRAINT fundedsite_project_link_projectid_fkey FOREIGN KEY (programid) REFERENCES program(id);


--
-- Name: fundedsite_protocol_link_fundedsiteid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY fundedsite_protocol_link
    ADD CONSTRAINT fundedsite_protocol_link_fundedsiteid_fkey FOREIGN KEY (fundedsiteid) REFERENCES fundedsite(id);


--
-- Name: fundedsite_protocol_link_protocolid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY fundedsite_protocol_link
    ADD CONSTRAINT fundedsite_protocol_link_protocolid_fkey FOREIGN KEY (protocolid) REFERENCES protocol(id);


--
-- Name: fundedsite_staff_link_fundedsiteid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY fundedsite_staff_link
    ADD CONSTRAINT fundedsite_staff_link_fundedsiteid_fkey FOREIGN KEY (fundedsiteid) REFERENCES fundedsite(id);


--
-- Name: fundedsite_staff_link_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY fundedsite_staff_link
    ADD CONSTRAINT fundedsite_staff_link_personid_fkey FOREIGN KEY (personid) REFERENCES person(id);


--
-- Name: group_chair_link_groupid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY group_chair_link
    ADD CONSTRAINT group_chair_link_groupid_fkey FOREIGN KEY (groupid) REFERENCES collabgroup(id);


--
-- Name: group_chair_link_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY group_chair_link
    ADD CONSTRAINT group_chair_link_personid_fkey FOREIGN KEY (personid) REFERENCES person(id);


--
-- Name: group_cochair_link_groupid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY group_cochair_link
    ADD CONSTRAINT group_cochair_link_groupid_fkey FOREIGN KEY (groupid) REFERENCES collabgroup(id);


--
-- Name: group_cochair_link_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY group_cochair_link
    ADD CONSTRAINT group_cochair_link_personid_fkey FOREIGN KEY (personid) REFERENCES person(id);


--
-- Name: group_member_link_groupid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY group_member_link
    ADD CONSTRAINT group_member_link_groupid_fkey FOREIGN KEY (groupid) REFERENCES collabgroup(id);


--
-- Name: group_member_link_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY group_member_link
    ADD CONSTRAINT group_member_link_personid_fkey FOREIGN KEY (personid) REFERENCES person(id);


--
-- Name: group_program_link_groupid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY group_program_link
    ADD CONSTRAINT group_program_link_groupid_fkey FOREIGN KEY (groupid) REFERENCES collabgroup(id);


--
-- Name: group_program_link_programid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY group_program_link
    ADD CONSTRAINT group_program_link_programid_fkey FOREIGN KEY (programid) REFERENCES program(id);


--
-- Name: institution_personnel_link_institutionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY institution_personnel_link
    ADD CONSTRAINT institution_personnel_link_institutionid_fkey FOREIGN KEY (institutionid) REFERENCES institution(id);


--
-- Name: institution_personnel_link_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY institution_personnel_link
    ADD CONSTRAINT institution_personnel_link_personid_fkey FOREIGN KEY (personid) REFERENCES person(id);


--
-- Name: organ_protocol_link_organid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY organ_protocol_link
    ADD CONSTRAINT organ_protocol_link_organid_fkey FOREIGN KEY (organid) REFERENCES organ(id);


--
-- Name: organ_protocol_link_protocolid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY organ_protocol_link
    ADD CONSTRAINT organ_protocol_link_protocolid_fkey FOREIGN KEY (protocolid) REFERENCES protocol(id);


--
-- Name: person_degree_link_degreeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY person_degree_link
    ADD CONSTRAINT person_degree_link_degreeid_fkey FOREIGN KEY (degreeid) REFERENCES degree(id);


--
-- Name: person_degree_link_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY person_degree_link
    ADD CONSTRAINT person_degree_link_personid_fkey FOREIGN KEY (personid) REFERENCES person(id);


--
-- Name: pi_protocol_link_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY pi_protocol_link
    ADD CONSTRAINT pi_protocol_link_personid_fkey FOREIGN KEY (personid) REFERENCES person(id);


--
-- Name: pi_protocol_link_protocolid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY pi_protocol_link
    ADD CONSTRAINT pi_protocol_link_protocolid_fkey FOREIGN KEY (protocolid) REFERENCES protocol(id);


--
-- Name: pi_publication_link_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY pi_publication_link
    ADD CONSTRAINT pi_publication_link_personid_fkey FOREIGN KEY (personid) REFERENCES person(id);


--
-- Name: pi_publication_link_publicationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY pi_publication_link
    ADD CONSTRAINT pi_publication_link_publicationid_fkey FOREIGN KEY (publicationid) REFERENCES publication(id);


--
-- Name: protocol_custodian_link_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY protocol_custodian_link
    ADD CONSTRAINT protocol_custodian_link_personid_fkey FOREIGN KEY (personid) REFERENCES person(id);


--
-- Name: protocol_custodian_link_protocolid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY protocol_custodian_link
    ADD CONSTRAINT protocol_custodian_link_protocolid_fkey FOREIGN KEY (protocolid) REFERENCES protocol(id);


--
-- Name: protocol_program_link_programid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY protocol_program_link
    ADD CONSTRAINT protocol_program_link_programid_fkey FOREIGN KEY (programid) REFERENCES program(id);


--
-- Name: protocol_program_link_protocolid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY protocol_program_link
    ADD CONSTRAINT protocol_program_link_protocolid_fkey FOREIGN KEY (protocolid) REFERENCES protocol(id);


--
-- Name: protocol_publication_link_protocolid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY protocol_publication_link
    ADD CONSTRAINT protocol_publication_link_protocolid_fkey FOREIGN KEY (protocolid) REFERENCES protocol(id);


--
-- Name: protocol_publication_link_publicationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY protocol_publication_link
    ADD CONSTRAINT protocol_publication_link_publicationid_fkey FOREIGN KEY (publicationid) REFERENCES publication(id);


--
-- Name: publication_program_link_programid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY publication_program_link
    ADD CONSTRAINT publication_program_link_programid_fkey FOREIGN KEY (programid) REFERENCES program(id);


--
-- Name: publication_program_link_publicationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY publication_program_link
    ADD CONSTRAINT publication_program_link_publicationid_fkey FOREIGN KEY (publicationid) REFERENCES publication(id);


--
-- Name: specimentype_organ_link_organid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY specimentype_organ_link
    ADD CONSTRAINT specimentype_organ_link_organid_fkey FOREIGN KEY (organid) REFERENCES organ(id);


--
-- Name: specimentype_organ_link_specimentypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: edrn
--

ALTER TABLE ONLY specimentype_organ_link
    ADD CONSTRAINT specimentype_organ_link_specimentypeid_fkey FOREIGN KEY (specimentypeid) REFERENCES specimentype(id);


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

