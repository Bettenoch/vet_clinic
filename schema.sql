/* Database schema to keep the structure of entire database. */

-- Table: VET1.animals

-- DROP TABLE IF EXISTS "VET1".animals;

CREATE TABLE IF NOT EXISTS "VET1".animals
(
    id integer NOT NULL,
    name text COLLATE pg_catalog."default" NOT NULL,
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric,
    CONSTRAINT animals_pkey PRIMARY KEY (id)
)


ALTER TABLE IF EXISTS "VET1".animals
    OWNER to postgres;

ALTER TABLE IF EXISTS "VET1".animals
    ADD
    COLUMN species VARCHAR(255) NULL;