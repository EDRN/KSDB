ALTER TABLE IF EXISTS protocol
    ADD COLUMN IF NOT EXISTS edrn_id text;

ALTER TABLE IF EXISTS protocol
    ADD COLUMN IF NOT EXISTS institutions text;

ALTER TABLE IF EXISTS knowledge_linkage
    ADD COLUMN IF NOT EXISTS id bigserial PRIMARY KEY;

ALTER TABLE IF EXISTS labcas_user_profiles
    ADD COLUMN IF NOT EXISTS id bigserial PRIMARY KEY;

ALTER TABLE IF EXISTS labcas_user_profiles
    ADD COLUMN IF NOT EXISTS search_name text NOT NULL DEFAULT '';

ALTER TABLE IF EXISTS labcas_user_profiles
    DROP CONSTRAINT IF EXISTS labcas_user_profiles_username_key;

ALTER TABLE IF EXISTS labcas_user_profiles
    ADD CONSTRAINT labcas_user_profiles_username_search_name_key
    UNIQUE (username, search_name);

CREATE TABLE IF NOT EXISTS fundedsite_institution_visible_id (
    id bigserial PRIMARY KEY,
    fundedsiteid int,
    institutionid int,
    fundedsite_institution_visible_id int,
    UNIQUE (fundedsiteid, institutionid, fundedsite_institution_visible_id)
);

