USE Bibliothèque;
GO

-- Insertion des auteurs
INSERT INTO Auteur(Nom, Prenom) 
VALUES 
('ADJRA', 'Eloge'),
('GLEY', 'Ferdinand'),
('KEGLOH', 'Marvin'),
('FOLI', 'Joas'),
('FOWLER', 'Martin'),
('GBEDEVI', 'Yvette');
GO

-- Insertion des catégories
INSERT INTO Categorie(type_Categorie) 
VALUES 
('Roman'),
('Informatique'),
('Base de données'),
('Réseaux'),
('Méthodologie');
GO

-- Insertion des éditeurs
INSERT INTO Editeur(nomEditeur, adresseEditeur) 
VALUES
('JEFFREY', 'Atlanta'),
('AMOUSSOUVI', 'Sito Aeroport'),
('ARMANI', 'Atlanta'),
('NSOUGAN', 'Attiegou');
GO

-- Insertion des livres (CORRECTION IMPORTANTE)
INSERT INTO Livre(Titre, ISBN, num_Editeur, num_Categorie) 
VALUES 
('Le roman inconnu', '01', 1, 1),
('SQL Avancé', '02', 3, 2),
('MERISE Pratique', '03', 4, 3),
('Théorie relationnelle', '04', 2, 4),
('Patterns entreprise', '05', 2, 5);
GO

-- Insertion des relations livre-auteur
INSERT INTO Ecrire(num_Livre, num_Auteur) 
VALUES
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4),  
(5, 5);  
GO

-- Insertion des exemplaires
INSERT INTO Exemplaire(Emplacement, Etat, num_Livre) 
VALUES 
('A1', 'EMPRUNT', 1),
('A2', 'DISPONIBLE', 1),
('B1', 'EMPRUNT', 2),
('C1', 'DISPONIBLE', 3),
('D1', 'EMPRUNT', 4),
('E1', 'EMPRUNT', 5);
GO

-- Insertion des usagers (CORRECTION)
INSERT INTO Usager(nomUsager, prenomUsager, typeUsager) 
VALUES 
('BANKS', 'Alice', 'etudiant'),
('JOHNS', 'Bob', 'professeur'),
('GUNNA', 'Chloe', 'membre'),
('NUSKI', 'David', 'etudiant');
GO

-- Insertion des bibliothécaires
INSERT INTO Bibliothécaire(nomBibliothécaire, prenomBibliothécaire, Tel) 
VALUES 
('KOMLAN', 'Koffi', '90046040'),
('DE SOUZA', 'Nadia', '90004060');
GO

-- Insertion des emprunts
INSERT INTO Emprunt(numUsager, numExemplaire, numBibliothécaire, dateEmprunt, dateRetour)
VALUES
(1, 1, 1, '2026-02-01', '2026-02-10'),
(2, 3, 1, '2026-01-20', '2026-02-28'),
(3, 5, 2, '2026-02-10', '2026-02-20'),
(4, 4, 2, '2026-02-11', '2026-02-21');
GO

PRINT;
GO