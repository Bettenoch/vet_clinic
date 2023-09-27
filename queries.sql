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

SELECT * FROM "VET1".animals

ROLLBACK;

-- Update animals with names ending in 'mon'

UPDATE "VET1".animals
	SET species = 'digimon'
	WHERE name LIKE '%mon';
	
UPDATE "VET1".animals
	SET species = 'pokemon'
	WHERE species IS NULL;
	
SELECT * FROM "VET1".animals

-- Commit the transaction
COMMIT;

SELECT * FROM "VET1".animals

START TRANSACTION

UPDATE "VET1".animals
	SET species = 'unspecified';

SELECT * FROM "VET1".animals

ROLLBACK;

SELECT * FROM "VET1".animals

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