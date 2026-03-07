USE Bibliothèque;

INSERT INTO Auteur(Nom, Prenom) 
VALUES ('ADJRA','Eloge'),
('GLEY','Ferdinand'),
('KEGLOH','Marvin'),
('FOLI','Joas'),
('FOWLER','Martin'),
(' GBEDEVI','Yvette');

INSERT INTO Categorie(type_Categorie) 
VALUES ('Roman'),
('Informatique'),
('Base de données'),
('Réseaux'),
('Méthodologie');

INSERT INTO Editeur(nomEditeur, adresseEditeur) 
VALUES('JEFFREY','Atlanta'),
('AMOUSSOUVI','Sito Aeroport'),
('ARMANI','Atlanta'),
('NSOUGAN','Attiegou');

INSERT INTO Livre(num_Livre, ISBN, num_Editeur,num_Categorie) 
VALUES ('Le roman inconnu', 01, 1, 1),
('SQL Avancé', 02, 3, 2),
('MERISE Pratique', 03, 4, 3),
('Théorie relationnelle', 04, 2, 4),
('Patterns entreprise', 05, 2, 5);

INSERT INTO Ecrire(num_Livre, num_Auteur) 
VALUES(5, 1),
(6, 2),
(7, 3),
(8, 4),
(9, 5);

INSERT INTO Exemplaire(Emplacement, Etat, num_Livre) 
VALUES (1,'EMPRUNT', 5),
(2,'DISPONIBLE', 5),
(3,'EMPRUNT', 6),
(4,'DISPONIBLE', 7),
(5,'EMPRUNT', 8),
(6,'EMPRUNT', 9);

INSERT INTO Usager(nomUsager, prenomUsager, typeUsager) 
VALUES ('','Alice','etudiant'),
('JOHNS','Bob','professeur'),
('GUNNA','Chloe','membre'),
('NUSKI','David','etudiant');

INSERT INTO Bibliothécaire(nomBibliothécaire, prenomBibliothécaire, Tel) 
VALUES ('KOMLAN','Koffi' , 90046040),
('DE SOUZA','Nadia', 90004060);

INSERT INTO Emprunt(numUsager, numExemplaire, numBibliothécaire, dateEmprunt, dateRetour)
VALUES(1, 7, 1, '2026-02-01', '2026-02-10'),
(2, 8, 2, '2026-01-20', '2026-02-28'),
(3, 9, 1, '2026-02-10', '2026-02-20'),
(1, 10, 2, '2026-02-11', '2026-02-21');

DELETE FROM Emprunt 
WHERE numEmprunt BETWEEN 6 AND 9;

UPDATE Emprunt SET dateRetour = '2026-02-10' WHERE numEmprunt = 2;
UPDATE Emprunt SET dateRetour = '2026-02-28' WHERE numEmprunt = 3;
UPDATE Emprunt SET dateRetour = '2026-02-20' WHERE numEmprunt = 4;
UPDATE Emprunt SET dateRetour = '2026-02-21' WHERE numEmprunt = 5;

