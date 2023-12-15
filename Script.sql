CREATE DATABASE foodly;
USE foodly;

CREATE TABLE utilisateur (
id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(100),
prenom VARCHAR(100),
email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE aliment (
id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(100) NOT NULL,
marque VARCHAR(100),
sucre FLOAT,
calories INTEGER NOT NULL,
graisses FLOAT,
proteines FLOAT,
bio BOOLEAN DEFAULT false
);

SHOW tables;
SHOW COLUMNS FROM utilisateur;

INSERT INTO `utilisateur` (`nom`, `prenom`, `email`)
VALUES ('Durantay', 'Quentin', 'quentin@gmail.com');

INSERT INTO `utilisateur` (`nom`, `prenom`, `email`)
VALUES
('Doe', 'John', 'john@yahoo.fr'),
('Smith', 'Jane', 'jane@hotmail.com'),
('Dupont', 'Sebastien', 'sebastien@orange.fr'),
('Martin', 'Emilie', 'emilie@gmail.com');

INSERT INTO `aliment` (`nom`, `marque`, `sucre`, `calories`, `graisses`, `proteines`, `bio`)
VALUES
('poire', 'monoprix', 27.5, 134, 0.2, 1.1, FALSE),
('pomme', 'monoprix', 19.1, 72, 0.2, 0.4, FALSE),
('oeuf', 'carrefour', 0.6, 82, 5.8, 6.9, TRUE),
('lait d\'amande', 'bjorg', 4.5, 59, 3.9, 1.1, TRUE);

INSERT INTO `aliment` (`nom`, `marque`, `sucre`, `calories`, `graisses`, `proteines`, `bio`)
VALUES
('haricots verts', 'monoprix', 25, 3, 0, 1.7, FALSE);

SELECT * FROM utilisateur;

SELECT `nom`, `calories` FROM aliment;

UPDATE `utilisateur` SET `email` = 'quentind@gmail.com' WHERE `id` = '1';

SELECT * FROM `aliment`;

UPDATE `aliment` SET `nom` = 'pomme golden' WHERE `id` = '2';

DELETE FROM `aliment` WHERE `id` = '2';

SELECT * 
FROM aliment 
WHERE (calories < 90)  AND (sucre >10) 
ORDER BY calories DESC;

SELECT COUNT(*) 
FROM utilisateur 
WHERE email LIKE "%gmail.com";

SELECT COUNT(DISTINCT nom) 
FROM aliment 
WHERE nom LIKE "%pomme%";

SELECT COUNT(DISTINCT nom)  AS "produits différents contenant le mot pomme"
FROM aliment 
WHERE nom LIKE "%pomme%";

SELECT AVG(calories) AS "calories moyennes des aliments > 30g"
FROM aliment 
WHERE calories > 30;

CREATE VIEW utilisateurs_gmail_vw AS 
    (   SELECT * 
        FROM utilisateur 
        WHERE email LIKE "%gmail.com"
    );
    
SELECT * FROM utilisateurs_gmail_vw;
    
SELECT * 
FROM utilisateurs_gmail_vw 
WHERE prenom LIKE "%m%";
