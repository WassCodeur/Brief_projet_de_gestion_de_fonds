/*  creation of the database */
CREATE DATABASE IF NOT EXISTS `gestion_de_fonds`; 
 /* select the database */

 USE `gestion_de_fonds`;

/* create table*/
DROP TABLE IF EXISTS `apprenants`;

 CREATE TABLE `apprenants` (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    prénom VARCHAR(100),
    sexe ENUM('M','F'),
    anniversary_date DATE,
    email VARCHAR(255) NOT NULL, 
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL

 );

 DROP TABLE IF EXISTS `pénalités`;

 CREATE TABLE `pénalités` (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    total TINYINT,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL

 );

  DROP TABLE IF EXISTS `retard`;

 CREATE TABLE `retard` (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    retard_type ENUM('7h à 7h15', '7h15 à 7h30', '>7h30'),
    tarif TINYINT,
    payed ENUM('Oui', 'Non'),                                  
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL

 );

   DROP TABLE IF EXISTS `absence`;

 CREATE TABLE `absence` (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tarif TINYINT,
    payed ENUM('Oui', 'Non'),
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
 );

    DROP TABLE IF EXISTS `trouble`;

 CREATE TABLE `trouble` (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tarif TINYINT,
    payed ENUM('Oui', 'Non'),
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
 );



    DROP TABLE IF EXISTS `amande_status`;

 CREATE TABLE `amande_status` (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    montant TINYINT,
    payed_at TIMESTAMP,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
 );

 /* insert datas in the tables */

 INSERT INTO `pénalités`(`nom`, `total`,`created_at`, `updated_at`)

                        VALUES
                        ('retard','350', NOW(), NOW()),
                        ('absence','1000', NOW(), NOW()),
                        ('trouble', '00',NOW(), NOW());

 INSERT INTO `apprenants` (`nom`, `prénom`, `sexe`, `anniversary_date`, `email`, `created_at`, `updated_at`)

                        VALUES
                        ('ANANI','Christophe', 'M', '2000-12-31','ganphorose@gmail.com', NOW(), NOW()),
                        ('AMEGNANGLO','Franck', 'M', '2000-12-31','franck@gmail.com', NOW(), NOW()),
                        ('TRAORE','Fadilah', 'F', '2000-12-31','Fadilah@gmail.com' ,NOW(), NOW()),
                        ('DIABATE','TRONKA', 'F', '2022-07-17','DIABATE@gmail.com', NOW(), NOW());

/*Afficher une liste complète des apprenants du Groupe 2,*/
SELECT * FROM apprenants;

/*Afficher la liste des pénalités pour la salle,*/
SELECT * FROM pénalités;

/*Afficher la somme totale pour les pénalités de la salle,*/
SELECT SUM(total) FROM pénalités; 

/*Afficher la liste des hommes de la salle,*/
SELECT * FROM apprenants WHERE sexe = 'M';

/*Afficher la liste des femmes de la salle,*/
SELECT * FROM apprenants WHERE  sexe= 'F';

/*Afficher les apprenants qui fêtent leur anniversaire ce jour,*/
SELECT * FROM apprenants WHERE  `anniversary_date` =  NOW();
SELECT * FROM retard;
SELECT * FROM absence;
SELECT * FROM trouble;


