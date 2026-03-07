USE Bibliothèque;

GO
IF OBJECT_ID('Vue_Livres_Empruntes', 'V') IS NOT NULL
    DROP VIEW Vue_Livres_Empruntes;
GO

CREATE VIEW Vue_Livres_Empruntes AS
SELECT L.Titre, U.nomUsager, E.dateEmprunt
FROM Emprunt E
JOIN Usager U ON E.numUsager = U.numUsager
JOIN Exemplaire EX ON E.numExemplaire = EX.numExemplaire
JOIN Livre L ON EX.num_Livre = L.num_Livre;

GO
