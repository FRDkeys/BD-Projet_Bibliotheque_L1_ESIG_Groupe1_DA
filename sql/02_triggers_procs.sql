USE Bibliothèque;
GO
-- Trigger : mise à jour de l'état de l'exemplaire après un emprunt

CREATE TRIGGER trg_Emprunt_Insert
ON Emprunt
AFTER INSERT
AS
BEGIN

UPDATE Exemplaire
SET Etat = 'EMPRUNT'
WHERE numExemplaire IN
(
SELECT numExemplaire
FROM inserted
);

END;
GO
-- Trigger : mise à jour de l'état après retour du livre

CREATE TRIGGER trg_Retour_Livre
ON Emprunt
AFTER UPDATE
AS
BEGIN

IF UPDATE(dateRetour)

UPDATE Exemplaire
SET Etat = 'DISPONIBLE'
WHERE numExemplaire IN
(
SELECT numExemplaire
FROM inserted
WHERE dateRetour IS NOT NULL
);

END;
GO
-- Procédure : enregistrer un emprunt

CREATE PROCEDURE EmprunterLivre

@numUsager INT,
@numExemplaire INT,
@numBibliothecaire INT

AS
BEGIN

INSERT INTO Emprunt
(numUsager, numExemplaire, numBibliothécaire, dateEmprunt)

VALUES
(@numUsager, @numExemplaire, @numBibliothecaire, GETDATE());

END;
GO
-- Procédure : retourner un livre

CREATE PROCEDURE RetournerLivre

@numEmprunt INT

AS
BEGIN

UPDATE Emprunt
SET dateRetour = GETDATE()
WHERE numEmprunt = @numEmprunt;

END;
GO

EXEC EmprunterLivre
@numUsager = 1,
@numExemplaire = 7,
@numBibliothecaire = 1;
EXEC RetournerLivre
@numEmprunt = 2;