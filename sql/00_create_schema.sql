-- Créer une base de données
CREATE DATABASE Bibliothèque;
use Bibliothèque

-- Créer une table(Auteur)
CREATE TABLE Auteur
(num_Auteur INT PRIMARY KEY IDENTITY,
Nom VARCHAR(50),
Prenom VARCHAR(50));

-- Créer une table(Categorie)
CREATE TABLE Categorie
(num_Categorie INT PRIMARY KEY IDENTITY,
type_Categorie VARCHAR(50));

-- Créer une table(Editeur)
CREATE TABLE Editeur
(num_Editeur INT PRIMARY KEY IDENTITY,
nomEditeur VARCHAR(50),
adresseEditeur VARCHAR(70));

-- Créer une table(Livre)
CREATE TABLE Livre
(num_Livre INT PRIMARY KEY IDENTITY,
num_Categorie INT FOREIGN KEY REFERENCES Categorie(num_Categorie),
num_Editeur INT FOREIGN KEY REFERENCES Editeur(num_Editeur),
ISBN INT,
Titre VARCHAR(50));

-- Créer une table(Ecrire)
CREATE TABLE Ecrire
(num_Livre INT,
num_Auteur INT,
PRIMARY KEY(num_Livre, num_Auteur),
FOREIGN KEY(num_Livre) REFERENCES Livre(num_Livre),
FOREIGN KEY(num_Auteur) REFERENCES Auteur(num_Auteur));

-- Créer une table(Exemplaire)
CREATE TABLE Exemplaire
(numExemplaire INT PRIMARY KEY IDENTITY,
num_Livre INT FOREIGN KEY REFERENCES Livre(num_Livre),
Etat VARCHAR(20) CHECK(Etat IN ('EMPRUNT','DISPONIBLE')),
Emplacement INT)

-- Créer une table(Usager)
CREATE TABLE Usager
(numUsager INT PRIMARY KEY IDENTITY,
nomUsager VARCHAR(50),
prenomUsager VARCHAR(50),
typeUsager VARCHAR(50))

-- Créer une table(Bibliothécaire)
CREATE TABLE Bibliothécaire
(numBibliothécaire INT PRIMARY KEY IDENTITY,
nomBibliothécaire VARCHAR(50),
prenomBibliothécaire VARCHAR(50),
Tel INT);

-- Créer une table(Emprunt)
CREATE TABLE Emprunt
(numEmprunt  INT PRIMARY KEY IDENTITY,
numUsager INT FOREIGN KEY REFERENCES Usager(numUsager),
numExemplaire INT FOREIGN KEY REFERENCES Exemplaire(numExemplaire),
numBibliothécaire INT FOREIGN KEY REFERENCES Bibliothécaire(numBibliothécaire),
dateEmprunt DATE);

ALTER TABLE Emprunt ADD dateRetour DATE;

