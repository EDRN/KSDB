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

CREATE TABLE project(
        id serial NOT NULL,
        title text,
        abbreviation text,
        description text,
        PRIMARY KEY( id )
    );


CREATE SEQUENCE project_seq START 1;


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
        projects text,
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

CREATE TABLE fundedsite_project_link(
        id serial NOT NULL,
        fundedsiteid int references fundedsite(id),
        projectid int references project(id),
        UNIQUE ( fundedsiteid, projectid ));

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


'''Update 8-5-16'''
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
