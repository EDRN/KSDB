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

---3-21-17----
alter table committee add column chair text;
alter table committee add column cochair text;

CREATE TABLE committee_chair_link(
        id serial NOT NULL,
        committeeid int references committee(id),
        personid int references person(id),
        UNIQUE ( committeeid, personid ));

CREATE TABLE committee_cochair_link(
        id serial NOT NULL,
        committeeid int references committee(id),
        personid int references person(id),
        UNIQUE ( committeeid, personid ));


---4-9-17---
alter table person add column extension text;

----4-17-17---
alter table protocol add column programs text;

CREATE TABLE protocol_program_link(
        id serial NOT NULL,
        protocolid int references protocol(id),
        programid int references program(id),
        UNIQUE ( protocolid, programid ));





---4-9-17---  #Not yet implemented
CREATE TABLE knowledge_object_types(
        id serial NOT NULL,
        obj_type text,
        PRIMARY KEY( id ));

CREATE TABLE knowledge_attributes(
        id serial NOT NULL,
        obj_type_id int,
        obj_attr_name text,
        obj_attr_type text,
        PRIMARY KEY( id ),
        UNIQUE ( obj_type_id, obj_attr_name ));

CREATE TABLE knowledge_objects(
        id serial NOT NULL,
        object_type_id int REFERENCES knowledge_object_types(id),
        created_by text,
        created_date date,
        modified_date date,
        PRIMARY KEY( id ));

CREATE SEQUENCE object_seq START 1;

CREATE TABLE knowledge_values(
        id serial NOT NULL,
        obj_id int REFERENCES knowledge_objects(id),
        obj_attr_id int REFERENCES knowledge_attributes(id),
        knowledge_value_text text,
        knowledge_value_int int,
        knowledge_value_date date,
        knowledge_value_object int,
        PRIMARY KEY( id ));
CREATE SEQUENCE value_seq START 1;

CREATE TABLE knowledge_linkage(
        sourceid int REFERENCES knowledge_objects(id),
        targetid int REFERENCES knowledge_objects(id),
        UNIQUE ( sourceid, targetid ));


insert into knowledge_object_types VALUES (1, 'protocol');
insert into knowledge_object_types VALUES (2, 'organ');
insert into knowledge_object_types VALUES (3, 'person');
insert into knowledge_object_types VALUES (4, 'program');
insert into knowledge_object_types VALUES (5, 'institution');
insert into knowledge_object_types VALUES (6, 'publication');
insert into knowledge_object_types VALUES (7, 'fundedsite');
insert into knowledge_object_types VALUES (8, 'degree');
insert into knowledge_object_types VALUES (9, 'group');
insert into knowledge_object_types VALUES (10, 'disease');
insert into knowledge_object_types VALUES (11, 'committee');
insert into knowledge_object_types VALUES (12, 'species');
insert into knowledge_object_types VALUES (13, 'specimentype');
insert into knowledge_object_types VALUES (14, 'discipline');

insert into knowledge_attributes VALUES (1, 1, 'title', 'text'); 
insert into knowledge_attributes VALUES (2, 1, 'description','text');
insert into knowledge_attributes VALUES (3, 1, 'organs','organ');
insert into knowledge_attributes VALUES (4, 1, 'pis','person');
insert into knowledge_attributes VALUES (5, 1, 'start_date','timestamp');
insert into knowledge_attributes VALUES (6, 1, 'site_contact','text');
insert into knowledge_attributes VALUES (7, 1, 'irb_approval','text');
insert into knowledge_attributes VALUES (8, 1, 'irb_approval_num','text');
insert into knowledge_attributes VALUES (9, 1, 'irb_contact','text');
insert into knowledge_attributes VALUES (10, 1, 'hum_sub_train','text');
insert into knowledge_attributes VALUES (11, 1, 'abstract','text');
insert into knowledge_attributes VALUES (12, 1, 'shortname','text');
insert into knowledge_attributes VALUES (13, 1, 'irb_contact_email','text');
insert into knowledge_attributes VALUES (14, 1, 'site_contact_email','text');
insert into knowledge_attributes VALUES (15, 1, 'cis','person');
insert into knowledge_attributes VALUES (16, 1, 'fundedsites','fundedsite');
insert into knowledge_attributes VALUES (17, 1, 'publications','publication');
insert into knowledge_attributes VALUES (18, 1, 'data_custodians','person');
insert into knowledge_attributes VALUES (19, 1, 'programs','program');

insert into knowledge_attributes VALUES (20, 2, 'name','text');
insert into knowledge_attributes VALUES (21, 2, 'description','text');

insert into knowledge_attributes VALUES (22, 3, 'firstname','text');
insert into knowledge_attributes VALUES (23, 3, 'lastname','text');
insert into knowledge_attributes VALUES (24, 3, 'degrees','degree');
insert into knowledge_attributes VALUES (25, 3, 'email','text');
insert into knowledge_attributes VALUES (26, 3, 'telephone','text');
insert into knowledge_attributes VALUES (27, 3, 'description','text');
insert into knowledge_attributes VALUES (28, 3, 'dcp','boolean');
insert into knowledge_attributes VALUES (29, 3, 'dcb','boolean');
insert into knowledge_attributes VALUES (30, 3, 'extension','text');

insert into knowledge_attributes VALUES (31, 4, 'title','text');
insert into knowledge_attributes VALUES (32, 4, 'abbreviation','text');
insert into knowledge_attributes VALUES (33, 4, 'description','text');

insert into knowledge_attributes VALUES (34, 5, 'name','text');
insert into knowledge_attributes VALUES (35, 5, 'department','text');
insert into knowledge_attributes VALUES (36, 5, 'abbreviation','text');
insert into knowledge_attributes VALUES (37, 5, 'url','text');
insert into knowledge_attributes VALUES (38, 5, 'description','text');
insert into knowledge_attributes VALUES (39, 5, 'personnel','person');

insert into knowledge_attributes VALUES (40, 6, 'title','text');
insert into knowledge_attributes VALUES (41, 6, 'authors','text');
insert into knowledge_attributes VALUES (42, 6, 'journal','text');
insert into knowledge_attributes VALUES (43, 6, 'pubyear','integer');
insert into knowledge_attributes VALUES (44, 6, 'pubmedid','text');

insert into knowledge_attributes VALUES (45, 7, 'title','text');
insert into knowledge_attributes VALUES (46, 7, 'description','text');
insert into knowledge_attributes VALUES (47, 7, 'organs','organ');
insert into knowledge_attributes VALUES (48, 7, 'pis','person');
insert into knowledge_attributes VALUES (49, 7, 'programs','program');
insert into knowledge_attributes VALUES (50, 7, 'institutions','institution');
insert into knowledge_attributes VALUES (51, 7, 'staff','person');
insert into knowledge_attributes VALUES (52, 7, 'status','text');
insert into knowledge_attributes VALUES (53, 7, 'name','text');
insert into knowledge_attributes VALUES (54, 7, 'funding_date_start','timestamp');
insert into knowledge_attributes VALUES (55, 7, 'funding_date_finish','timestamp');
insert into knowledge_attributes VALUES (56, 7, 'contacts','person');
insert into knowledge_attributes VALUES (57, 7, 'abstract','text');
insert into knowledge_attributes VALUES (58, 7, 'aims','text');
insert into knowledge_attributes VALUES (59, 7, 'abbreviation','text');

insert into knowledge_attributes VALUES (60, 8, 'title','text');
insert into knowledge_attributes VALUES (61, 8, 'description','text');

insert into knowledge_attributes VALUES (62, 9, 'description','text');
insert into knowledge_attributes VALUES (63, 9, 'members','person');
insert into knowledge_attributes VALUES (64, 9, 'programs','program');
insert into knowledge_attributes VALUES (65, 9, 'name','text');
insert into knowledge_attributes VALUES (66, 9, 'chair','person');
insert into knowledge_attributes VALUES (67, 9, 'cochair','person');

insert into knowledge_attributes VALUES (68, 10, 'icd10','text');
insert into knowledge_attributes VALUES (69, 10, 'description','text');

insert into knowledge_attributes VALUES (70, 11, 'title','text');
insert into knowledge_attributes VALUES (71, 11, 'abbreviation','text');
insert into knowledge_attributes VALUES (72, 11, 'description','text');
insert into knowledge_attributes VALUES (73, 11, 'members','person');
insert into knowledge_attributes VALUES (74, 11, 'programs','program');
insert into knowledge_attributes VALUES (75, 11, 'chair','person');
insert into knowledge_attributes VALUES (76, 11, 'cochair','person');

insert into knowledge_attributes VALUES (77, 12, 'title','text');
insert into knowledge_attributes VALUES (78, 12, 'description','text');

insert into knowledge_attributes VALUES (79, 13, 'title','text');
insert into knowledge_attributes VALUES (80, 13, 'description','text');
insert into knowledge_attributes VALUES (81, 13, 'organs','organ');

insert into knowledge_attributes VALUES (82, 14, 'title','text');
insert into knowledge_attributes VALUES (83, 14, 'description','text');

#12/31/2017 modifying protocols to remove and add some fields

alter table protocol add column aims text;
alter table protocol add column end_date timestamp;
