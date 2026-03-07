

-- Création de la base de données
CREATE DATABASE Bibliothèque;
GO

USE Bibliothèque;
GO

-- Table AUTEUR
CREATE TABLE Auteur (
    num_Auteur INT PRIMARY KEY IDENTITY(1,1),
    Nom VARCHAR(50) NOT NULL,
    Prenom VARCHAR(50) NOT NULL
);
GO

-- Table CATEGORIE
CREATE TABLE Categorie (
    num_Categorie INT PRIMARY KEY IDENTITY(1,1),
    type_Categorie VARCHAR(50) NOT NULL UNIQUE
);
GO

-- Table EDITEUR
CREATE TABLE Editeur (
    num_Editeur INT PRIMARY KEY IDENTITY(1,1),
    nomEditeur VARCHAR(50) NOT NULL,
    adresseEditeur VARCHAR(100)
);
GO

-- Table LIVRE
CREATE TABLE Livre (
    num_Livre INT PRIMARY KEY IDENTITY(1,1),
    num_Categorie INT NOT NULL,
    num_Editeur INT NOT NULL,
    ISBN VARCHAR(20) UNIQUE,
    Titre VARCHAR(100) NOT NULL,
    FOREIGN KEY (num_Categorie) REFERENCES Categorie(num_Categorie),
    FOREIGN KEY (num_Editeur) REFERENCES Editeur(num_Editeur)
);
GO

-- Table ECRIRE (relation livre-auteur)
CREATE TABLE Ecrire (
    num_Livre INT,
    num_Auteur INT,
    PRIMARY KEY (num_Livre, num_Auteur),
    FOREIGN KEY (num_Livre) REFERENCES Livre(num_Livre),
    FOREIGN KEY (num_Auteur) REFERENCES Auteur(num_Auteur)
);
GO

-- Table EXEMPLAIRE
CREATE TABLE Exemplaire (
    numExemplaire INT PRIMARY KEY IDENTITY(1,1),
    num_Livre INT NOT NULL,
    Etat VARCHAR(20) CHECK(Etat IN ('EMPRUNT', 'DISPONIBLE', 'EN_RETARD')) DEFAULT 'DISPONIBLE',
    Emplacement VARCHAR(50),
    FOREIGN KEY (num_Livre) REFERENCES Livre(num_Livre)
);
GO

-- Table USAGER
CREATE TABLE Usager (
    numUsager INT PRIMARY KEY IDENTITY(1,1),
    nomUsager VARCHAR(50) NOT NULL,
    prenomUsager VARCHAR(50) NOT NULL,
    typeUsager VARCHAR(20) CHECK(typeUsager IN ('etudiant', 'professeur', 'membre')) NOT NULL
);
GO

-- Table BIBLIOTHECAIRE
CREATE TABLE Bibliothécaire (
    numBibliothécaire INT PRIMARY KEY IDENTITY(1,1),
    nomBibliothécaire VARCHAR(50) NOT NULL,
    prenomBibliothécaire VARCHAR(50) NOT NULL,
    Tel VARCHAR(20)
);
GO

-- Table EMPRUNT
CREATE TABLE Emprunt (
    numEmprunt INT PRIMARY KEY IDENTITY(1,1),
    numUsager INT NOT NULL,
    numExemplaire INT NOT NULL,
    numBibliothécaire INT NOT NULL,
    dateEmprunt DATE NOT NULL,
    dateRetour DATE,
    FOREIGN KEY (numUsager) REFERENCES Usager(numUsager),
    FOREIGN KEY (numExemplaire) REFERENCES Exemplaire(numExemplaire),
    FOREIGN KEY (numBibliothécaire) REFERENCES Bibliothécaire(numBibliothécaire)
);
GO

PRINT;
GO