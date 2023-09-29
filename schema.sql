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

CREATE TABLE IF NOT EXISTS "VET1".owners
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    full_name character varying COLLATE pg_catalog."default",
    age integer,
    CONSTRAINT owners_pkey PRIMARY KEY (id)
)

ALTER TABLE IF EXISTS "VET1".owners
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS "VET1".species
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying COLLATE pg_catalog."default",
    CONSTRAINT species_pkey PRIMARY KEY (id)
)

CREATE TABLE public.species
(
    id serial NOT NULL,
   	name character varying,
    PRIMARY KEY (id)
);

ALTER TABLE public.animals
    ADD COLUMN IF NOT EXISTS species_id integer;
	
ALTER TABLE public.animals	
	ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species (id);
	
ALTER TABLE public.animals
	ADD COLUMN IF NOT EXISTS owner_id integer;
	
ALTER TABLE public.animals	
	ADD CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES owners (id);

--PART 4
CREATE TABLE public.vets
(
    id serial NOT NULL,
   	name character varying,
	age integer,
	date_of_graduation date,
    PRIMARY KEY (id)
);

CREATE TABLE public.specializations
(
    vets_id integer,
   	species_id integer
);

ALTER TABLE public.specializations
	ADD CONSTRAINT fk_vets_id FOREIGN KEY (vets_id) REFERENCES vets(id);
	
ALTER TABLE public.specializations
	ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species(id);
	
CREATE TABLE public.visits
(
    vet_id integer,
   	animal_id integer,
	date_of_visit date
);

ALTER TABLE public.visits
	ADD CONSTRAINT fk_vet_id FOREIGN KEY (vet_id) REFERENCES vets(id);

ALTER TABLE public.visits
	ADD CONSTRAINT fk_animal_id FOREIGN KEY (animal_id) REFERENCES animals(id);