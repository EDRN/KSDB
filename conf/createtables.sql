CREATE SEQUENCE input_file_id_seq START 1;
CREATE TABLE ksdb_inputfile(id BIGSERIAL primary key, filepath text, folder int);


CREATE SEQUENCE protocol_seq START 1;
CREATE SEQUENCE protocol_organ_seq START 1;


CREATE TABLE protocol(
       id int,
       title text,
       description text,
       organs text,
       pis text,
       start_date timestamp,
       site_contact text,
       irb_approval text,
       irb_approval_num text,
       irb_contact text,
       hum_sub_train text,
       abstract text,
       PRIMARY KEY( id )
    );

CREATE TABLE organ(
        id int,
        name text,
        description text,
        PRIMARY KEY( id ));

CREATE SEQUENCE organ_seq START 1;

CREATE SEQUENCE person_seq START 1;

CREATE TABLE person(
       id int,
       firstname text,
       lastname text,
       degrees int,
       email text,
       telephone text,
       PRIMARY KEY( id )
    );

CREATE TABLE program(
        id serial NOT NULL,
        title text,
        abbreviation text,
        description text,
        PRIMARY KEY( id )
    );


CREATE SEQUENCE program_seq START 1;


CREATE TABLE institution(
        id serial NOT NULL,
        name text,
        department text,
        abbreviation text,
        url text,
        description text,
        personnel text,
        PRIMARY KEY( id )
    );


CREATE SEQUENCE institution_seq START 1;


CREATE TABLE fundedsite(
        id serial NOT NULL,
        description text,
        organs text,
        pis text,
        programs text,
        institutions text,
        staff text,
        PRIMARY KEY( id )
    );


CREATE SEQUENCE fundedsite_seq START 1;


CREATE TABLE publication(
        id serial NOT NULL,
        title text,
        authors text,
        journal text,
        pubyear int,
        pubmedid text,
        PRIMARY KEY( id )
    );


CREATE SEQUENCE publication_seq START 1;


CREATE TABLE degree(
        id serial NOT NULL,
        title text,
        description text,
        PRIMARY KEY( id )
    );
CREATE SEQUENCE degree_seq START 1;

CREATE TABLE person_degree_link(
        id serial NOT NULL,
        personid int references person(id),
        degreeid int references degree(id),
        UNIQUE ( degreeid, personid ));


CREATE TABLE organ_protocol_link(
    id serial NOT NULL,
    protocolid int references protocol(id),
    organid int references organ(id),
    UNIQUE ( protocolid, organid ));

CREATE TABLE pi_protocol_link(
        id serial NOT NULL,
        protocolid int references protocol(id),
        personid int references person(id),
        UNIQUE ( protocolid, personid ));
CREATE TABLE institution_personnel_link(
        id serial NOT NULL,
        institutionid int references institution(id),
        personid int references person(id),
        UNIQUE ( institutionid, personid ));
CREATE TABLE fundedsite_pi_link(
        id serial NOT NULL,
        fundedsiteid int references fundedsite(id),
        personid int references person(id),
        UNIQUE ( fundedsiteid, personid ));

CREATE TABLE fundedsite_organ_link(
        id serial NOT NULL,
        fundedsiteid int references fundedsite(id),
        organid int references organ(id),
        UNIQUE ( fundedsiteid, organid ));

CREATE TABLE fundedsite_staff_link(
        id serial NOT NULL,
        fundedsiteid int references fundedsite(id),
        personid int references person(id),
        UNIQUE ( fundedsiteid, personid ));

CREATE TABLE fundedsite_program_link(
        id serial NOT NULL,
        fundedsiteid int references fundedsite(id),
        programid int references program(id),
        UNIQUE ( fundedsiteid, programid ));

CREATE TABLE fundedsite_institution_link(
        id serial NOT NULL,
        fundedsiteid int references fundedsite(id),
        institutionid int references institution(id),
        UNIQUE ( fundedsiteid, institutionid ));
CREATE TABLE publication_author_link(
        id serial NOT NULL,
        publicationid int references publication(id),
        personid int references person(id),
        UNIQUE ( publicationid, personid ));


--Update 8-5-16
alter table fundedsite add column status text;
alter table person add column description text;
alter table protocol add column shortname text;
alter table protocol alter column site_contact type text;
alter table protocol alter column irb_contact type text;
alter table protocol add column irb_contact_email text;
alter table protocol add column site_contact_email text;
alter table protocol add column cis text;
alter table protocol add column fundedsites text;
CREATE TABLE fundedsite_protocol_link(
    id serial NOT NULL,
    protocolid int references protocol(id),
    fundedsiteid int references fundedsite(id),
    UNIQUE ( protocolid, fundedsiteid ));
CREATE TABLE ci_protocol_link(
        id serial NOT NULL,
        protocolid int references protocol(id),
        personid int references person(id),
        UNIQUE ( protocolid, personid ));

alter table person alter column telephone type text;

--Update 12-5-16
alter table fundedsite add column name text;


--Update 2-17-17
CREATE SEQUENCE program_seq START 3;
alter table fundedsite_project_link rename to fundedsite_program_link;
alter table project rename to program;
alter table fundedsite rename column projects to programs;
alter table fundedsite_program_link rename column projectid to programid;

alter table fundedsite add column contacts text;
CREATE TABLE con_fundedsite_link(
        id serial NOT NULL,
        fundedsiteid int references fundedsite(id),
        personid int references person(id),
        UNIQUE ( fundedsiteid, personid ));
alter table fundedsite add column funding_date_start timestamp;
alter table fundedsite add column funding_date_finish timestamp;
alter table protocol add column publications text;
CREATE TABLE protocol_publication_link(
        id serial NOT NULL,
        publicationid int references publication(id),
        protocolid int references protocol(id),
        UNIQUE ( publicationid, protocolid ));
alter table protocol add column data_custodians text;
CREATE TABLE protocol_custodian_link(
        id serial NOT NULL,
        personid int references person(id),
        protocolid int references protocol(id),
        UNIQUE ( personid, protocolid ));

CREATE TABLE collabgroup(
        id serial NOT NULL,
        name text,
        description text,
        members text,
        programs text,
        PRIMARY KEY( id )
    );
CREATE SEQUENCE group_seq START 1;

CREATE TABLE group_member_link(
        id serial NOT NULL,
        groupid int references collabgroup(id),
        personid int references person(id),
        UNIQUE ( groupid, personid ));

CREATE TABLE group_program_link(
        id serial NOT NULL,
        groupid int references collabgroup(id),
        programid int references program(id),
        UNIQUE ( groupid, programid ));

CREATE TABLE disease(
        id int,
        icd10 text,
        description text,
        PRIMARY KEY( id ));
CREATE SEQUENCE disease_seq START 1;

CREATE TABLE disease_protocol_link(
        id serial NOT NULL,
        diseaseid int references disease(id),
        protocolid int references protocol(id),
        UNIQUE ( diseaseid, protocolid ));

---3-3-17----

alter table collabgroup add column chair text;
alter table collabgroup add column cochair text;

CREATE TABLE group_chair_link(
        id serial NOT NULL,
        groupid int references collabgroup(id),
        personid int references person(id),
        UNIQUE ( groupid, personid ));

CREATE TABLE group_cochair_link(
        id serial NOT NULL,
        groupid int references collabgroup(id),
        personid int references person(id),
        UNIQUE ( groupid, personid ));

alter table fundedsite add column abstract text;
alter table fundedsite add column aims text;
alter table fundedsite add column abbreviation text;

alter table person add column dcp boolean;
alter table person add column dcb boolean;

CREATE TABLE committee(
        id int,
        title text,
        abbreviation text,
        description text,
        programs text,
        members text,
        PRIMARY KEY( id ));
CREATE SEQUENCE committee_seq START 1;

CREATE TABLE committee_member_link(
        id serial NOT NULL,
        committeeid int references committee(id),
        personid int references person(id),
        UNIQUE ( committeeid, personid ));

CREATE TABLE committee_program_link(
        id serial NOT NULL,
        committeeid int references committee(id),
        programid int references program(id),
        UNIQUE ( committeeid, programid ));

---3-17-17----

CREATE TABLE species(
        id int,
        title text,
        description text,
        PRIMARY KEY( id ));
CREATE SEQUENCE species_seq START 1;

CREATE TABLE specimentype(
        id int,
        title text,
        description text,
        organs text,
        PRIMARY KEY( id ));
CREATE SEQUENCE specimentype_seq START 1;

CREATE TABLE specimentype_organ_link(
        id serial NOT NULL,
        specimentypeid int references specimentype(id),
        organid int references organ(id),
        UNIQUE ( specimentypeid, organid ));

CREATE TABLE discipline(
        id int,
        title text,
        description text,
        PRIMARY KEY( id ));
CREATE SEQUENCE discipline_seq START 1;
