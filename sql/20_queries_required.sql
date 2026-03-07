USE Bibliothèque;

-- A- Sélection --
-- (Socle A1) Lister tous les livres
SELECT * FROM Livre;

-- (Socle A2) Rechercher un livre par ID
SELECT * FROM Livre
WHERE num_Livre = 5;

-- B- Jointure --
-- (Socle A3) Rechercher livres par catégorie
SELECT * FROM Livre
WHERE num_Categorie = 2;

-- (Socle B4) Lister les emprunts d’un usager
SELECT U.nomUsager, L.titre, E.dateEmprunt
FROM Emprunt E
JOIN Usager U ON E.numUsager = U.numUsager
JOIN Exemplaire EX ON E.numExemplaire = EX.numExemplaire
JOIN Livre L ON EX.num_Livre = L.num_Livre;

-- (Socle B5) Informations sur les livres et auteurs
SELECT L.Titre, A.Nom
FROM Livre L
JOIN Ecrire LA ON L.num_Livre = LA.num_Livre
JOIN Auteur A ON LA.num_Auteur = A.num_Auteur;

-- C- Agregations --
-- (Socle B6) Détails d’un emprunt
SELECT *
FROM Emprunt
WHERE numEmprunt = 2;

-- (Socle C7) Nombre d’emprunts par usager
SELECT numUsager, COUNT(*) AS nombre_emprunts
FROM Emprunt
GROUP BY numUsager;

-- (Socle C8) Nombre total d’emprunts
SELECT COUNT(*) AS NombreTotalEmprunts
FROM Emprunt;

-- (Socle C9) Usagers ayant plus d’un emprunt
SELECT numUsager, COUNT(*) AS NombreEmprunts
FROM Emprunt
GROUP BY numUsager
HAVING COUNT(*) > 1;

-- D- Sous Requêtes --
-- (Socle D10) Livre le plus emprunté (VERSION CORRIGÉE)
SELECT TOP 1 L.Titre, COUNT(E.numEmprunt) AS NombreEmprunts
FROM Livre L
JOIN Exemplaire EX ON L.num_Livre = EX.num_Livre
JOIN Emprunt E ON EX.numExemplaire = E.numExemplaire
GROUP BY L.Titre
ORDER BY NombreEmprunts DESC;

-- (Socle D11) Usagers ayant emprunté un livre
SELECT nomUsager
FROM Usager
WHERE numUsager IN (
SELECT numUsager
FROM Emprunt
);


-- (Socle E12) Mise à jour type utilisateur usager
UPDATE Usager
SET typeUsager = 'Etudiant'
WHERE numUsager = 1;

-- (Socle E13) Supprimer un emprunt
DELETE FROM Emprunt
WHERE numEmprunt = 2;