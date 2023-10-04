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
	WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE public.animals
	SET owner_id = 5
	WHERE name IN ('Angemon', 'Boarmon');

--PART 4
INSERT INTO public.vets(name,age,date_of_graduation) 
	VALUES('Vet William Tatcher ', 45, '2000-04-23'),
	('Vet Maisy Smith  ', 26, '2019-01-17'),
	('Vet Stephanie Mendez ', 64, '1981-04-05'),
	('Vet Jack Harkness ', 38, '2005-08-05');
	
INSERT INTO public.specializations(vets_id,species_id) 
	VALUES(1,1),(3,2),(3,1),(4,2);

INSERT INTO public.visits(animal_id,vet_id,date_of_visit)
	VALUES(1,1,'2020-05-24'),
	(1,3,'2020-07-22'),
	(2,4,'2021-02-02'),
	(5,2,'2020-05-01'),
	(5,2,'2020-08-03'),
	(5,2,'2020-05-14'),
	(3,3,'2021-04-05'),
	(9,4,'2021-02-03'),
	(7,2,'2019-12-22'),
	(7,1,'2020-08-10'),
	(7,2,'2021-04-07'),
	(10,3,'2019-09-29'),
	(8,4,'2020-03-10'),
	(8,4,'2020-04-11'),
	(4,2,'2019-01-24'),
	(4,2,'2019-05-15'),
	(4,2,'2020-02-27'),
	(4,2,'2020-03-08'),
	(6,3,'2020-05-24'),
	(6,1,'2021-01-11');

--PART4

INSERT INTO  public.visits (animal_id, vet_id, date_of_visit) 
	SELECT * FROM 
	(SELECT id FROM  public.animals) animal_ids, 
	(SELECT id FROM  public.vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into public.owners (full_name, email) 
select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';