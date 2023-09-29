/* Populate database with sample data. */

INSERT INTO "VET1".animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (1,'Agumon','2020-03-02', 0, true,10.23);
INSERT INTO "VET1".animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (2,'Gabumon','2018-11-15', 2, true, 8);
INSERT INTO "VET1".animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (3,'Pikachu','2021-07-01', 1, false,15.04);
INSERT INTO "VET1".animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (4,'Devimon','2017-05-12', 5, true, 11);


INSERT INTO "VET1".animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
	VALUES (5,'Charmander','2020-02-08', 0, false, -11);

INSERT INTO "VET1".animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
	VALUES (6,'Plantmon','2021-11-15', 2, true, -5.7);
INSERT INTO "VET1".animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
	VALUES (7,'Squirtle','1993-04-02', 3, false, -12.13);
INSERT INTO "VET1".animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
	VALUES (8,'Angemon','2005-06-12', 1, true, -45);
INSERT INTO "VET1".animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
	VALUES (9,'Boarmon','2005-06-07', 7, true, 20.4);
INSERT INTO "VET1".animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
	VALUES (10,'Blossom','1998-10-13', 3, true, 17);
INSERT INTO "VET1".animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
	VALUES (11,'Ditto','2022-05-14', 4, true, 22);

INSERT INTO public.owners(full_name,age) 
	VALUES('Sam Smith',34),
		('Jennifer Orwell',19),
		('Bob',45),
		('Melody Pond',77),
		('Dean Winchester',14),
		('Jodie Whittaker',38);
		
INSERT INTO public.species(name) 
	VALUES('Pokemon'),
		('Digimon');

UPDATE public.animals
	SET species_id = 2
	WHERE name LIKE '%mon';
	
UPDATE public.animals
	SET species_id = 1
	WHERE species_id IS NULL;
	
UPDATE public.animals
	SET owner_id = 1
	WHERE name = 'Agumon';
	
UPDATE public.animals
	SET owner_id = 2
	WHERE name IN ('Gabumon', 'Pikachu');

UPDATE public.animals
	SET owner_id = 3
	WHERE name IN ('Devimon', 'Plantmon');

UPDATE public.animals
	SET owner_id = 4
	WHERE name IN ('Charmander', 'Squirtel', 'Blossom');

UPDATE public.animals
	SET owner_id = 5
	WHERE name IN ('Angemon', 'Boarmon');
	