-- Afficher une liste complète des apprenants du Groupe 2,
SELECT * FROM apprenants;

-- Afficher la liste des pénalités pour la salle,
SELECT * FROM pénalités;

-- Afficher la somme totale pour les pénalités de la salle,
SELECT SUM(total) AS 'somme_totale_de_pénalités' FROM pénalités; 

-- Afficher la liste des hommes de la salle,
SELECT  nom, prénom, sexe, anniversary_date FROM apprenants WHERE sexe = 'M';

-- Afficher la liste des femmes de la salle,
SELECT nom, prénom, sexe, anniversary_date FROM apprenants WHERE  sexe= 'F';




-- Afficher les apprenants qui fêtent leur anniversaire ce jour,
SELECT * FROM apprenants WHERE  DATE_FORMAT(`anniversary_date`, "%M %d") = DATE_FORMAT(NOW(), "%M %d");

SELECT `nom`, `prénom`, `sexe` ,`tarif_retard` FROM apprenants 

JOIN retard

ON apprenants.id = retard.apprenant_id;


SELECT `nom`, `prénom`, `sexe`,`tarif_absence` FROM apprenants

JOIN absence

ON apprenants.id = absence.apprenant_id;

SELECT `nom`, `prénom`, `sexe`,`tarif_trouble` FROM apprenants 

JOIN trouble

ON apprenants.id = trouble.apprenant_id;

-- Afficher le nombre des pénalités des femmes de la salle et pouvoir en faire la somme,

SELECT `id`,`nom`,`prénom`,`sexe`,`montant`, `payed_at`,`commited_at` FROM apprenants 

JOIN amande_status

ON apprenants.id = amande_status.apprenant_id WHERE `sexe` = 'F';

SELECT  COUNT(id) AS 'nombre_de_pénalités_des_femmes', SUM(montant) AS 'somme_totale' FROM apprenants 

JOIN amande_status

ON apprenants.id = amande_status.apprenant_id  WHERE `sexe` = 'F';

-- Afficher le nombre des pénalités des hommes de la salle et pouvoir en faire la somme,
SELECT `id`,`nom`,`prénom`,`sexe`,`montant`, `payed_at`,`commited_at` FROM apprenants 

JOIN amande_status

ON apprenants.id = amande_status.apprenant_id WHERE `sexe` = 'M';


SELECT  COUNT(id) AS 'nombre_de_pénalités_des_hommes'  , SUM(montant) AS 'somme_totale' FROM apprenants 

JOIN amande_status

ON apprenants.id = amande_status.apprenant_id  WHERE `sexe` = 'M';



-- Afficher pour chaque apprenant les pénalités qu’il a eu à payer et pouvoir en faire la somme,
SELECT `id`,`nom`,`prénom`,`sexe`,`montant`, `payed_at`,`commited_at` FROM apprenants 

JOIN amande_status

ON apprenants.id = amande_status.apprenant_id;

SELECT  COUNT(id) AS 'nombre_de_pénalités' , SUM(montant) AS 'somme_total_par_personne'  FROM apprenants 

JOIN amande_status

ON apprenants.id = amande_status.apprenant_id;

-- Afficher pour chaque apprenant le nombre de pénalités qu’il a eu à payer
SELECT  `nom`,`prénom`,`sexe`, COUNT(id) AS 'nombre_de_pénalités_par_personne' FROM apprenants 

JOIN amande_status

ON apprenants.id = amande_status.apprenant_id GROUP BY  `id`;





