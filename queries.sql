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