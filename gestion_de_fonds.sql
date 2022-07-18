/*  creation of the database */
CREATE DATABASE IF NOT EXISTS `gestion_de_fonds`; 
 /* select the database */

 USE `gestion_de_fonds`;

/* create table*/
 
  DROP TABLE IF EXISTS `pénalités`;
  DROP TABLE IF EXISTS `absence`;
  DROP TABLE IF EXISTS `trouble`;
  DROP TABLE IF EXISTS `retard`;
  DROP TABLE IF EXISTS `amande_status`;
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



 CREATE TABLE `pénalités` (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    total INT,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL

 );


 CREATE TABLE `retard` (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    
    retard_type ENUM('7h à 7h15', '7h15 à 7h30', '>7h30'),
    apprenant_id INT NULL,
    tarif_retard INT,
    payed ENUM('Oui', 'Non'),                                  
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
   FOREIGN KEY (apprenant_id) REFERENCES apprenants(id)
 );

   

 CREATE TABLE `absence` (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    apprenant_id INT,
    tarif_absence INT,
    payed ENUM('Oui', 'Non'),
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    FOREIGN KEY (apprenant_id) REFERENCES apprenants(id)
 );

    

 CREATE TABLE `trouble` (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    apprenant_id INT,
    tarif_trouble INT,
    payed ENUM('oui', 'non'),
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    FOREIGN KEY (apprenant_id) REFERENCES apprenants(id)
 );



    

 CREATE TABLE `amande_status` (
    id_amande INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    amande_type VARCHAR(45),
    montant INT,
    apprenant_id INT NULL,
    payed_at TIMESTAMP,
    commited_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
    
    
 );
    INSERT INTO `amande_status` (`amande_type`,`montant`, `apprenant_id`,`payed_at`,`commited_at`, `updated_at`)
                     VALUES
                     ('retard', '50','3' , NOW(),  NOW(), NOW()),
                     ('retard', '50','5' ,  NOW(),  NOW(), NOW()),
                     ('retard', '100','2' ,  NOW(),  NOW(), NOW()),
                     ('retard', '100','8', NOW(),  NOW(), NOW()),
                     ('retard','50','1',NOW(),  NOW(), NOW()),
                     ('absence','1000','1',NOW(),  NOW(), NOW()),
                     ('absence','1000','2', NOW(), NOW(), NOW()),
                     ('trouble','2000','3', NOW(), NOW(), NOW()),
                     ('trouble','400','4', NOW(), NOW(), NOW()),
                     ('trouble','700','1', NOW(), NOW(), NOW()),
                     ('trouble','500','2', NOW(), NOW(), NOW()),
                     ('absence','1000','4', NOW(), NOW(), NOW()),
                     ('absence','1000','3', NOW(), NOW(), NOW()),
                     ('retard','200', '4',NOW(),  NOW(), NOW());


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
                        ('BOURAMA','Wachiou', 'M', '2000-12-31','franck@gmail.com', NOW(), NOW()),
                        ('BONSOA','Henock', 'M', '2000-12-31','franck@gmail.com', NOW(), NOW()),
                        ('TRAORE','Fadilah', 'F', '2000-12-31','Fadilah@gmail.com' ,NOW(), NOW()),
                        ('AROUNA','Mounira', 'F', '2000-12-31','mounlight@gmail.com' ,NOW(), NOW()),
                        ('SESSO','Ayida', 'F', '2000-12-31','ayida@gmail.com' ,NOW(), NOW()),
                        ('EZOULA','Abert', 'M', '2000-12-31','ezoula@gmail.com' ,NOW(), NOW()),
                        ('DJOARE','Nadege', 'F', '2000-12-31','lare@gmail.com' ,NOW(), NOW()),
                        ('ELENEKOU','Erick', 'M', '2000-12-31','Fadilah@gmail.com' ,NOW(), NOW()),
                        ('DIABATE','TRONKA', 'F', '2022-07-17','DIABATE@gmail.com', NOW(), NOW());

      
  INSERT INTO `retard`(`retard_type`, `apprenant_id`,`tarif_retard`,`payed`,`created_at`, `updated_at` )
                     VALUES
                     ('7h à 7h15', '3', '50', 'Oui',  NOW(), NOW()),
                     ('7h à 7h15', '5', '50', 'Oui',  NOW(), NOW()),
                     ('7h15 à 7h30', '2', '100', 'Oui',  NOW(), NOW()),
                     ('7h15 à 7h30', '8', '100', 'Oui',  NOW(), NOW()),
                     ('7h à 7h15', '1','50','Oui', NOW(), NOW()),
                     ('>7h30','4','200', 'Oui', NOW(), NOW());

  INSERT INTO `absence`(`apprenant_id`,`tarif_absence`,`payed`,`created_at`, `updated_at` )
                     VALUES
                     ('3', '1000', 'Oui',  NOW(), NOW()),
                     ('2', '1000', 'Oui',  NOW(), NOW()),
                     ('1','1000','Oui', NOW(), NOW()),
                     ('4','1000', 'Oui', NOW(), NOW());

     INSERT INTO `trouble`(`apprenant_id`,`tarif_trouble`,`payed`,`created_at`, `updated_at` )
                     VALUES
                     ('3', '2000', 'Oui',  NOW(), NOW()),
                     ('2', '500', 'Oui',  NOW(), NOW()),
                     ('1','700','Oui', NOW(), NOW()),
                     ('4','400', 'Oui', NOW(), NOW());
