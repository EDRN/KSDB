    sudo -i -u postgres
CREATE USER mab_mart WITH PASSWORD 'mab_mart';
create database mabdb;

CREATE SEQUENCE input_file_id_seq START 1;

CREATE SEQUENCE input_file_id_seq START 1;

CREATE TABLE esis_inputseqfile(id BIGSERIAL primary key, seq_file text, folder int);


    #create protocol and protocol organ link
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
       irb_approval_num int,
       irb_contact text,
       contact_email text,
       hum_sub_train text,
       abstract text,
       PRIMARY KEY( id )
    );
CREATE TABLE organ(
        id int,
        name text,
        description text,
        PRIMARY KEY( id ));
CREATE TABLE organ_protocol_link(
        id serial NOT NULL,
        protocolid int references protocol(id),
        organid int references organ(id),
        UNIQUE ( protocolid, organid ));




    #create person and protocol person link
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
CREATE TABLE pi_protocol_link(
        id serial NOT NULL,
        protocolid int references protocol(id),
        personid int references person(id),
        UNIQUE ( protocolid, personid ));



    #project tables
CREATE TABLE project(
        id serial NOT NULL,
        title text,
        abbreviation text,
        description text,
        sites text,
        PRIMARY KEY( id )
    );

CREATE TABLE project_site_link(
        id serial NOT NULL,
        projectid int references project(id),
        fundedsiteid int references fundedsite(id),
        UNIQUE ( projectid, fundedsiteid ));

CREATE SEQUENCE project_seq START 1;


    #institution tables
CREATE TABLE institution(
        id serial NOT NULL,
        name text,
        department text,
        abbreviation text,
        url text,
        description text,
        PRIMARY KEY( id )
    );

CREATE SEQUENCE institution_seq START 1;


    #fundedsite tables
CREATE TABLE fundedsite(
        id serial NOT NULL,
        title text,
        description text,
        abstract text,
        organs text,
        pis text,
        staff text,
        PRIMARY KEY( id )
    );

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

CREATE SEQUENCE fundedsite_seq START 1;


    #publication tables
CREATE TABLE publication(
        id serial NOT NULL,
        title text,
        authors text,
        journal text,
        pubdate timestamp,
        pubmedid text,
        PRIMARY KEY( id )
    );

CREATE TABLE publication_author_link(
        id serial NOT NULL,
        publicationid int references publication(id),
        personid int references person(id),
        UNIQUE ( publicationid, personid ));

CREATE SEQUENCE publication_seq START 1;


    exit
