/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';

SELECT *
	FROM "VET1".animals
	WHERE
 	name LIKE '%mon';

SELECT id, name, date_of_birth, escape_attempts, neutered, weight_kg
	FROM "VET1".animals
	WHERE
 	neutered = true AND escape_attempts < 3;

SELECT name
	FROM "VET1".animals
    WHERE
    date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT date_of_birth
	FROM "VET1".animals
	WHERE
 	name IN ('Agumon','Pikachu');

SELECT name, escape_attempts
	FROM "VET1".animals
	WHERE
 	weight_kg > 10.5;

SELECT *
	FROM "VET1".animals
	WHERE
 	neutered = true;

SELECT *
	FROM "VET1".animals
	WHERE
 	weight_kg >=10.4 AND weight_kg <=17.3;


//PART2
 -- Begin Transaction
START TRANSACTION

UPDATE "VET1".animals
	SET species = 'unspecified';

SELECT * FROM "VET1".animals

-- Verify the Change
UPDATE "VET1".animals
	SET species = 'unspecified';

ROLLBACK;

-- Update animals with names ending in 'mon'

UPDATE "VET1".animals
	SET species = 'digimon'
	WHERE name LIKE '%mon';
	
UPDATE "VET1".animals
	SET species = 'pokemon'
	WHERE species IS NULL;
	
-- Commit the transaction
COMMIT;

SELECT * FROM "VET1".animals

-- Begin transaction
START TRANSACTION

UPDATE "VET1".animals
	SET species = 'unspecified';

SELECT * FROM "VET1".animals

ROLLBACK;

SELECT * FROM "VET1".animals

-- Begin transaction
START TRANSACTION

UPDATE "VET1".animals
	SET species = 'digimon'
	WHERE name LIKE '%mon';
	
UPDATE "VET1".animals
	SET species = 'pokemon'
	WHERE species IS NULL;
	
SELECT * FROM "VET1".animals

COMMIT;

SELECT * FROM "VET1".animals

-- Delete all records in the animals table
DELETE FROM "VET1".animals;

ROLLBACK;

SELECT * FROM "VET1".animals

-- Begin transaction
START TRANSACTION

DELETE FROM "VET1".animals
	WHERE date_of_birth > '2022-01-01';

SELECT * FROM "VET1".animals
- Create savepoint
SAVEPOINT my_savepoint;

UPDATE "VET1".animals
SET weight_kg = weight_kg * -1;

SELECT * FROM "VET1".animals

ROLLBACK TO my_savepoint;

-- Update negative weights to positive
UPDATE "VET1".animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

COMMIT;

SELECT * FROM "VET1".animals

SELECT COUNT(*) AS total_animals
	FROM "VET1".animals;

SELECT COUNT(*) AS not_escaped
	FROM "VET1".animals
	WHERE escape_attempts = 0;

SELECT
	AVG(weight_kg) AS avg_weight
	FROM
	"VET1".animals;
	
SELECT neutered, SUM(escape_attempts) AS total_escapes
	FROM"VET1".animals
	GROUP BY neutered
	ORDER BY total_escapes DESC
	LIMIT 1;
	
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
	FROM "VET1".animals
	GROUP BY species;

SELECT species, AVG(escape_attempts) AS avg_escape_attempts
	FROM "VET1".animals
	WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
	GROUP BY species;

--JOINT QUERIES
SELECT name FROM public.animals A
INNER JOIN public.owners O
ON A.owner_id = O.id
WHERE O.full_name = 'Melody Pond';

SELECT A.name FROM public.animals A
INNER JOIN species S
ON A.species_id = S.id
WHERE S.name = 'Pokemon';

SELECT full_name, name FROM public.owners O
LEFT JOIN public.animals A
ON A.owner_id = O.id;

SELECT COUNT(*), S.name FROM public.animals A
INNER JOIN public.species S
ON A.species_id = S.id
GROUP BY S.name;

SELECT A.name FROM public.animals A
	INNER JOIN public.species S ON A.species_id = S.id
	INNER JOIN public.owners O ON A.owner_id = O.id
	WHERE O.full_name = 'Jennifer Orwell' AND S.name = 'Digimon';

SELECT name FROM public.animals A
	INNER JOIN public.owners O ON A.owner_id = O.id
	WHERE O.full_name = 'Dean Winchester' AND escape_attempts = 0;

SELECT COUNT(*) as count, full_name FROM public.animals A
	INNER JOIN public.owners O ON A.owner_id = O.id
	GROUP BY O.full_name
	ORDER BY count DESC;

--PART3

SELECT A.name FROM public.visits V
	INNER JOIN public.animals A ON V.animal_id = A.id
	INNER JOIN public.vets B ON V.vet_id = B.id
	WHERE B.name = 'Vet William Tatcher ';
	ORDER BY V.date_of_visit DESC LIMIT 1;

SELECT COUNT(*) AS animals FROM public.visits V
	INNER JOIN public.animals A ON V.animal_id = A.id
	INNER JOIN public.vets B ON V.vet_id = B.id
	WHERE B.name = 'Vet Stephanie Mendez ';

SELECT B.name AS vet, S.name AS species FROM specializations C
	FULL OUTER JOIN public.vets B ON C.vets_id = B.id
	FULL OUTER JOIN public.species S ON C.species_id = S.id;

SELECT A.name FROM public.visits V
	INNER JOIN public.animals A ON V.animal_id = A.id
	INNER JOIN public.vets B ON V.vet_id = B.id
	WHERE B.name = 'Vet Stephanie Mendez ' AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT A.name FROM public.visits V
	INNER JOIN public.animals A ON V.animal_id = A.id
	GROUP BY A.name
	ORDER BY COUNT(date_of_visit) DESC LIMIT 1;

SELECT A.name FROM public.visits V
	INNER JOIN public.animals A ON V.animal_id = A.id
	INNER JOIN public.vets B ON V.vet_id = B.id
	WHERE B.name = 'Vet Maisy Smith  '
	ORDER BY V.date_of_visit LIMIT 1;

SELECT A.name AS animal, B.name AS vet, V.date_of_visit FROM public.visits V
	INNER JOIN public.animals A ON A.id = V.animal_id
	INNER JOIN public.vets B ON B.id = V.vet_id
	ORDER BY date_of_visit DESC LIMIT 1;

SELECT COUNT(*) AS visits FROM public.visits V
  WHERE V.vet_id = (SELECT id FROM public.vets B
  INNER JOIN public.specializations C ON B.id != C.vets_id LIMIT 1)
  
SELECT S.name, COUNT(S.name) AS visits FROM public.animals A
	INNER JOIN public.visits V ON A.id = V.animal_id
	INNER JOIN public.vets B ON V.vet_id = B.id
	INNER JOIN public.species S ON A.species_id = S.id
	WHERE B.name = 'Vet Maisy Smith  '
	GROUP BY S.name
	ORDER BY visits DESC LIMIT 1;

--PART4
EXPLAIN ANALYZE SELECT * FROM public.visits 
WHERE vet_id = 2;

EXPLAIN ANALYZE SELECT COUNT(*) FROM public.visits where animal_id = 4;

EXPLAIN ANALYZE SELECT * FROM public.visits where vet_id = 2;

EXPLAIN ANALYZE SELECT * FROM public.owners where email = 'owner_18327@mail.com';
