-- B1. Insérez, en une seule requête, les 11 monuments historiques mentionnés dans l’énoncé
INSERT INTO Monument (nom, budget)
VALUES ('Château de Rochefort', 17500),
	('Château de la Fontaine', 18800),
	('Église Saint-Nicolas de Beaujeu', 13700),
	('Aqueduc du Gier', 8700),
	('Maison forte de Vourles', 9800),
	('Château de Rochebonne', 15900),
	('Ancien prieuré de Tarare', 7900),
	('Palais du Miroir', 22700),
	('Puits Perret', 9400),
	('Château de Montmelas', 15400),
	('Château de la Chaize', 24800);

-- B2. Insérez, en une seule requête, les 12 métiers mentionnés dans l’énoncé
INSERT INTO Metier (intitule)
VALUES ('Couvreur'),
	('Charpentier'),
	('Peintre en décor'),
	('Doreur'),
	('Ferronnier'),
	('Maitre verrier'),
	('Menuisier'),
	('Stucateur'),
	('Marbrier'),
	('Restaurateur de parquets'),
	('Sculpteur'),
	('Tailleur de pierre');

-- B3. Insérez, en une seule requête, les 3 moyens de paiement mentionnés dans l’énoncé 
INSERT INTO MoyenPaiement (designation)
VALUES ('Chèque'),
	('Virement bancaire'),
	('Espèces');

-- B4. Importez la procédure stockée d’ajout des spécialistes fournie sur Moodle,
--     et exécutez-là. Elle insère entre 100 et 150 spécialistes
BEGIN

 SET @maxi = 100 + RAND() * 50; -- Nombre aléatoire compris entre 100 et 150
 SET @i = 0;
 
 WHILE @i < @maxi DO
 
  SET @numeroSiretTemp = CONV(FLOOR(RAND() * 99999999999999), 20, 36); -- Le numéro de Siret doit être une suite de caractères aléatoire
  SET @raisonSocialeTemp = CONV(FLOOR(RAND() * 99999999999999), 20, 36); -- La raison sociale doit être une suite de caractères aléatoire
  SET @anneeTemp = 1900 + RAND() * (2020 - 1900); -- L’année de fondation doit être aléatoire et comprise entre 1900 et 2020
  SET @estAutoentrepreneurTemp = IF(RAND() < 0.35, 1, 0); -- Le spécialiste doit être autoentrepreneur dans 35 % des cas
  SET @idMetierTemp = (SELECT idMetier FROM Metier ORDER BY RAND() LIMIT 1); -- Le métier doit être choisi aléatoirement parmi les métiers existants
  
  INSERT INTO Specialiste (numeroSiret, raisonSociale, anneeFondation, estAutoentrepreneur, idMetier)
  VALUES (@numeroSiretTemp, @raisonSocialeTemp, @anneeTemp, @estAutoentrepreneurTemp, @idMetierTemp);
  
  SET @i = @i + 1;
  
 END WHILE;
 
 SELECT CONCAT(@i, ' spécialistes ajoutés') AS Resultat;
 
END

-- B5. Importez la procédure stockée d’ajout des factures fournie sur Moodle,
--     et exécutez-là. Elle insère entre 450 et 650 factures
BEGIN

 SET @maxi = 450 + RAND() * 200; -- Nombre aléatoire compris entre 450 et 650
 SET @i = 0;
 
 WHILE @i < @maxi DO
 
  SET @dateEmissionTemp = CURDATE() - INTERVAL RAND() * TIMESTAMPDIFF(DAY, '2019-01-01', CURDATE()) DAY; -- La date doit être aléatoire et comprise entre le 1er janvier 2019 et aujourd’hui
  SET @numeroTemp = CONV(FLOOR(RAND() * 99999999999999), 20, 36); -- Le numéro doit être une suite de caractères aléatoire
  SET @montantHtTemp = 100 + RAND() * (1000 - 100); -- Le montant HT doit être aléatoire est compris entre 100 et 1000 €
  SET @parCourrierTemp = IF(RAND() < 0.40, 1, 0); -- La facture est envoyée par courrier dans 40 % des cas
  SET @idMonumentTemp = (SELECT idMonument FROM Monument ORDER BY RAND() LIMIT 1); -- Le monument historique doit être choisi aléatoirement parmi les monuments historiques existants
  SET @idSpecialisteTemp = (SELECT idSpecialiste FROM Specialiste ORDER BY RAND() LIMIT 1); -- Le spécialiste auteur de la facture doit être choisi aléatoirement parmi les spécialistes existants
  SET @idMoyenPaiementTemp = (SELECT idMoyenPaiement FROM MoyenPaiement ORDER BY RAND() LIMIT 1); -- Le moyen de paiement doit être choisi aléatoirement parmi les moyens de paiement existants
  
  INSERT INTO Facture (dateEmission, numero, montantHt, parCourrier, idMonument, idSpecialiste, idMoyenPaiement)
  VALUES (@dateEmissionTemp, @numeroTemp, @montantHtTemp, @parCourrierTemp, @idMonumentTemp, @idSpecialisteTemp, @idMoyenPaiementTemp);
  
  SET @i = @i + 1;
  
 END WHILE;
 
 SELECT CONCAT(@i, ' factures ajoutées') AS Resultat;
 
END

-- C1. Listez les spécialistes, avec pour chacun d’eux leur métier,
--     triés par raison sociale
SELECT S.numeroSiret AS `Numéro de SIRET`, S.raisonSociale AS `Raison sociale`, S.estAutoentrepreneur AS `Autoentrepreneur`, M.intitule AS `Libellé du métier`
FROM Specialiste S
JOIN Metier M ON S.idMetier = M.idMetier
ORDER BY S.raisonSociale;

-- C2. Obtenez la moyenne des montants HT des factures.
--     Ce montant sera arrondi à 2 chiffres après la virgule 
SELECT ROUND(AVG(montantHt), 2) AS `Moyenne des montants des factures` -- Pour afficher l'unité €, on peut utilier : CONCAT(ROUND(AVG(montantHt), 2), ' €')
FROM Facture;

-- C3. Listez les factures, avec pour chacune d’elle leur moyen de paiement,
--     triées de la plus chère à la moins chère 
SELECT F.dateEmission AS `Date`, F.montantHt AS `Montant HT`, F.numero AS `Numéro`, MP.designation AS `Désignation du moyen de paiement` -- Pour mettre en forme une date, on peut utiliser : DATE_FORMAT(F.dateEmission, '%d/%m/%Y')
FROM Facture F
JOIN MoyenPaiement MP ON F.idMoyenPaiement = MP.idMoyenPaiement
ORDER BY F.montantHt DESC;

-- C4. Listez les factures, avec pour chacune d’elle leur monument historique et leur spécialiste,
--     triées de la date la plus ancienne à la date la plus récente
SELECT F.dateEmission AS `Date`, F.montantHt AS `Montant HT`,
       F.numero AS `Numéro`, M.nom AS `Nom du monument`,
	   S.raisonSociale AS `Raison sociale du spécialiste`, S.estAutoentrepreneur AS `Spécialiste est autoentrepeneur` -- Pour mettre en forme une date, on peut utiliser : DATE_FORMAT(F.dateEmission, '%d/%m/%Y')
FROM Facture F
JOIN Monument M ON F.idMonument = M.idMonument
JOIN Specialiste S ON F.idSpecialiste = S.idSpecialiste
ORDER BY F.dateEmission;

-- C5. Listez les factures, avec pour chacune d’elle leur spécialiste,
--     en calculant le montant TTC selon les règles fixées par l’énoncé,
--     triées du plus grand montant HT au plus petit
SELECT F.numero, S.raisonSociale, S.estAutoentrepreneur, F.montantHt,
	   IF(S.estAutoentrepreneur, F.montantHt, ROUND(F.montantHt * 1.1, 2)) AS MontantTtc -- Variante du calcul du montant TTC : F.montantHt * IF(S.estAutoentrepreneur, 1, 1.1)
FROM Facture F
JOIN Specialiste S ON F.idSpecialiste = S.idSpecialiste
ORDER BY F.montantHt DESC;

-- C6. Créez une vue « FactVue » à partir de la requête précédente
CREATE VIEW FactVue
AS
SELECT F.numero, S.raisonSociale, S.estAutoentrepreneur, F.montantHt,
	   IF(S.estAutoentrepreneur, F.montantHt, ROUND(F.montantHt * 1.1, 2)) AS MontantTtc
FROM Facture F
JOIN Specialiste S ON F.idSpecialiste = S.idSpecialiste
ORDER BY F.montantHt;

-- C7. Obtenez le nombre de spécialistes pour chaque métier,
--     triés du plus grand nombre au plus petit 
SELECT M.intitule, COUNT(*) AS `Nombre de spécialistes`
FROM Specialiste S
JOIN Metier M ON S.idMetier = M.idMetier
GROUP BY M.intitule
ORDER BY COUNT(*) DESC;

-- C8. Listez les factures d’un montant de plus de 500 €
--     dont le règlement est en espèces
-- Solution avec IN :
SELECT *
FROM Facture
WHERE montantHt > 500
AND idMoyenPaiement IN
(
 SELECT idMoyenPaiement
 FROM MoyenPaiement
 WHERE designation = 'Espèces'
);

-- Solution avec JOIN :
SELECT *
FROM Facture F
JOIN MoyenPaiement MP ON F.idMoyenPaiement = MP.idMoyenPaiement
WHERE F.montantHt > 500
AND MP.designation = 'Espèces';

-- C9. Supprimez ces factures
-- Solution avec IN :
DELETE
FROM Facture
WHERE montantHt > 500
AND idMoyenPaiement IN
(
 SELECT idMoyenPaiement
 FROM MoyenPaiement
 WHERE designation = 'Espèces'
);

-- Solution avec JOIN :
DELETE Facture
FROM Facture
JOIN MoyenPaiement MP ON Facture.idMoyenPaiement = MP.idMoyenPaiement
WHERE montantHt > 500
AND MP.designation = 'Espèces';

-- C10. Choisissez un spécialiste et un monument historique au hasard dans votre base de données :
SELECT idSpecialiste
FROM Specialiste
ORDER BY RAND()
LIMIT 1; -- Retourne 42

SELECT idMonument
FROM Monument
ORDER BY RAND()
LIMIT 1; -- Retourne 7

-- C10a. Mettez-le à jour en y indiquant les informations données en exemple dans l’énoncé
UPDATE Specialiste
SET numeroSiret = '56450254000037',
    raisonSociale = 'Beaufils SAS',
    anneeFondation = 1956,
    estAutoentrepreneur = 0
WHERE idSpecialiste = 42;

-- C10b. Obtenez le montant total des factures émises en 2020 par ce spécialiste
SELECT SUM(montantHt)
FROM Facture
WHERE idSpecialiste = 42
AND YEAR(dateEmission) = 2020; -- Possible de faire « dateEmission LIKE '2020%' » ou « dateEmission BETWEEN '2020-01-01' AND '2020-12-31' »

-- C10c. Obtenez le montant total des factures sur l’année 2020 concernant ce monument historique
SELECT SUM(montantHt)
FROM Facture
WHERE idMonument = 7
AND YEAR(dateEmission) = 2020;

-- C10d. Obtenez le pourcentage de consommation du budget 2021 pour ce monument historique
SELECT SUM(F.montantHt) / M.budget * 100 AS `Consommation du budget` -- Possibilité d'arrondir avec ROUND. Possibilité de spécifier l'unité avec % avec CONCAT
FROM Facture F
JOIN Monument M ON F.idMonument = M.idMonument
WHERE M.idMonument = 7
AND YEAR(F.dateEmission) = 2021;

-- C11. Listez les 5 monuments historiques ayant le pourcentage de consommation de budget sur 2020 le plus élevé
SELECT M.idMonument, M.nom, SUM(F.montantHt) / M.budget * 100 AS `Consommation du budget`
FROM Facture F
JOIN Monument M ON F.idMonument = M.idMonument
WHERE YEAR(dateEmission) = 2020
GROUP BY M.idMonument, M.nom
ORDER BY SUM(F.montantHt) / M.budget * 100 DESC
LIMIT 5;

-- Bonus : obtenir le même bilan qu'en C10d mais avec toutes les années, années par années
SELECT Monument.nom,
CONCAT(SUM(montantHt), ' €') AS sommeDesFactures,
CONCAT(Monument.budget, ' €') As budgetMonument,
YEAR(dateEmission) AS annee,
CONCAT(ROUND(SUM(montantHt) / Monument.budget * 100, 1), ' %') AS pourcentage
FROM Facture
JOIN Monument ON Facture.idMonument = Monument.idMonument
GROUP BY Monument.nom, Monument.budget, YEAR(dateEmission)
