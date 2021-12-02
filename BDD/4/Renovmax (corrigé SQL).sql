-- B1. Ins�rez, en une seule requ�te, les 11 monuments historiques mentionn�s dans l��nonc�
INSERT INTO Monument (nom, budget)
VALUES ('Ch�teau de Rochefort', 17500),
	('Ch�teau de la Fontaine', 18800),
	('�glise Saint-Nicolas de Beaujeu', 13700),
	('Aqueduc du Gier', 8700),
	('Maison forte de Vourles', 9800),
	('Ch�teau de Rochebonne', 15900),
	('Ancien prieur� de Tarare', 7900),
	('Palais du Miroir', 22700),
	('Puits Perret', 9400),
	('Ch�teau de Montmelas', 15400),
	('Ch�teau de la Chaize', 24800);

-- B2. Ins�rez, en une seule requ�te, les 12 m�tiers mentionn�s dans l��nonc�
INSERT INTO Metier (intitule)
VALUES ('Couvreur'),
	('Charpentier'),
	('Peintre en d�cor'),
	('Doreur'),
	('Ferronnier'),
	('Maitre verrier'),
	('Menuisier'),
	('Stucateur'),
	('Marbrier'),
	('Restaurateur de parquets'),
	('Sculpteur'),
	('Tailleur de pierre');

-- B3. Ins�rez, en une seule requ�te, les 3 moyens de paiement mentionn�s dans l��nonc� 
INSERT INTO MoyenPaiement (designation)
VALUES ('Ch�que'),
	('Virement bancaire'),
	('Esp�ces');

-- B4. Importez la proc�dure stock�e d�ajout des sp�cialistes fournie sur Moodle,
--     et ex�cutez-l�. Elle ins�re entre 100 et 150 sp�cialistes
BEGIN

 SET @maxi = 100 + RAND() * 50; -- Nombre al�atoire compris entre 100 et 150
 SET @i = 0;
 
 WHILE @i < @maxi DO
 
  SET @numeroSiretTemp = CONV(FLOOR(RAND() * 99999999999999), 20, 36); -- Le num�ro de Siret doit �tre une suite de caract�res al�atoire
  SET @raisonSocialeTemp = CONV(FLOOR(RAND() * 99999999999999), 20, 36); -- La raison sociale doit �tre une suite de caract�res al�atoire
  SET @anneeTemp = 1900 + RAND() * (2020 - 1900); -- L�ann�e de fondation doit �tre al�atoire et comprise entre 1900 et 2020
  SET @estAutoentrepreneurTemp = IF(RAND() < 0.35, 1, 0); -- Le sp�cialiste doit �tre autoentrepreneur dans 35 % des cas
  SET @idMetierTemp = (SELECT idMetier FROM Metier ORDER BY RAND() LIMIT 1); -- Le m�tier doit �tre choisi al�atoirement parmi les m�tiers existants
  
  INSERT INTO Specialiste (numeroSiret, raisonSociale, anneeFondation, estAutoentrepreneur, idMetier)
  VALUES (@numeroSiretTemp, @raisonSocialeTemp, @anneeTemp, @estAutoentrepreneurTemp, @idMetierTemp);
  
  SET @i = @i + 1;
  
 END WHILE;
 
 SELECT CONCAT(@i, ' sp�cialistes ajout�s') AS Resultat;
 
END

-- B5. Importez la proc�dure stock�e d�ajout des factures fournie sur Moodle,
--     et ex�cutez-l�. Elle ins�re entre 450 et 650 factures
BEGIN

 SET @maxi = 450 + RAND() * 200; -- Nombre al�atoire compris entre 450 et 650
 SET @i = 0;
 
 WHILE @i < @maxi DO
 
  SET @dateEmissionTemp = CURDATE() - INTERVAL RAND() * TIMESTAMPDIFF(DAY, '2019-01-01', CURDATE()) DAY; -- La date doit �tre al�atoire et comprise entre le 1er janvier 2019 et aujourd�hui
  SET @numeroTemp = CONV(FLOOR(RAND() * 99999999999999), 20, 36); -- Le num�ro doit �tre une suite de caract�res al�atoire
  SET @montantHtTemp = 100 + RAND() * (1000 - 100); -- Le montant HT doit �tre al�atoire est compris entre 100 et 1000 �
  SET @parCourrierTemp = IF(RAND() < 0.40, 1, 0); -- La facture est envoy�e par courrier dans 40 % des cas
  SET @idMonumentTemp = (SELECT idMonument FROM Monument ORDER BY RAND() LIMIT 1); -- Le monument historique doit �tre choisi al�atoirement parmi les monuments historiques existants
  SET @idSpecialisteTemp = (SELECT idSpecialiste FROM Specialiste ORDER BY RAND() LIMIT 1); -- Le sp�cialiste auteur de la facture doit �tre choisi al�atoirement parmi les sp�cialistes existants
  SET @idMoyenPaiementTemp = (SELECT idMoyenPaiement FROM MoyenPaiement ORDER BY RAND() LIMIT 1); -- Le moyen de paiement doit �tre choisi al�atoirement parmi les moyens de paiement existants
  
  INSERT INTO Facture (dateEmission, numero, montantHt, parCourrier, idMonument, idSpecialiste, idMoyenPaiement)
  VALUES (@dateEmissionTemp, @numeroTemp, @montantHtTemp, @parCourrierTemp, @idMonumentTemp, @idSpecialisteTemp, @idMoyenPaiementTemp);
  
  SET @i = @i + 1;
  
 END WHILE;
 
 SELECT CONCAT(@i, ' factures ajout�es') AS Resultat;
 
END

-- C1. Listez les sp�cialistes, avec pour chacun d�eux leur m�tier,
--     tri�s par raison sociale
SELECT S.numeroSiret AS `Num�ro de SIRET`, S.raisonSociale AS `Raison sociale`, S.estAutoentrepreneur AS `Autoentrepreneur`, M.intitule AS `Libell� du m�tier`
FROM Specialiste S
JOIN Metier M ON S.idMetier = M.idMetier
ORDER BY S.raisonSociale;

-- C2. Obtenez la moyenne des montants HT des factures.
--     Ce montant sera arrondi � 2 chiffres apr�s la virgule 
SELECT ROUND(AVG(montantHt), 2) AS `Moyenne des montants des factures` -- Pour afficher l'unit� �, on peut utilier : CONCAT(ROUND(AVG(montantHt), 2), ' �')
FROM Facture;

-- C3. Listez les factures, avec pour chacune d�elle leur moyen de paiement,
--     tri�es de la plus ch�re � la moins ch�re 
SELECT F.dateEmission AS `Date`, F.montantHt AS `Montant HT`, F.numero AS `Num�ro`, MP.designation AS `D�signation du moyen de paiement` -- Pour mettre en forme une date, on peut utiliser : DATE_FORMAT(F.dateEmission, '%d/%m/%Y')
FROM Facture F
JOIN MoyenPaiement MP ON F.idMoyenPaiement = MP.idMoyenPaiement
ORDER BY F.montantHt DESC;

-- C4. Listez les factures, avec pour chacune d�elle leur monument historique et leur sp�cialiste,
--     tri�es de la date la plus ancienne � la date la plus r�cente
SELECT F.dateEmission AS `Date`, F.montantHt AS `Montant HT`,
       F.numero AS `Num�ro`, M.nom AS `Nom du monument`,
	   S.raisonSociale AS `Raison sociale du sp�cialiste`, S.estAutoentrepreneur AS `Sp�cialiste est autoentrepeneur` -- Pour mettre en forme une date, on peut utiliser : DATE_FORMAT(F.dateEmission, '%d/%m/%Y')
FROM Facture F
JOIN Monument M ON F.idMonument = M.idMonument
JOIN Specialiste S ON F.idSpecialiste = S.idSpecialiste
ORDER BY F.dateEmission;

-- C5. Listez les factures, avec pour chacune d�elle leur sp�cialiste,
--     en calculant le montant TTC selon les r�gles fix�es par l��nonc�,
--     tri�es du plus grand montant HT au plus petit
SELECT F.numero, S.raisonSociale, S.estAutoentrepreneur, F.montantHt,
	   IF(S.estAutoentrepreneur, F.montantHt, ROUND(F.montantHt * 1.1, 2)) AS MontantTtc -- Variante du calcul du montant TTC : F.montantHt * IF(S.estAutoentrepreneur, 1, 1.1)
FROM Facture F
JOIN Specialiste S ON F.idSpecialiste = S.idSpecialiste
ORDER BY F.montantHt DESC;

-- C6. Cr�ez une vue � FactVue � � partir de la requ�te pr�c�dente
CREATE VIEW FactVue
AS
SELECT F.numero, S.raisonSociale, S.estAutoentrepreneur, F.montantHt,
	   IF(S.estAutoentrepreneur, F.montantHt, ROUND(F.montantHt * 1.1, 2)) AS MontantTtc
FROM Facture F
JOIN Specialiste S ON F.idSpecialiste = S.idSpecialiste
ORDER BY F.montantHt;

-- C7. Obtenez le nombre de sp�cialistes pour chaque m�tier,
--     tri�s du plus grand nombre au plus petit 
SELECT M.intitule, COUNT(*) AS `Nombre de sp�cialistes`
FROM Specialiste S
JOIN Metier M ON S.idMetier = M.idMetier
GROUP BY M.intitule
ORDER BY COUNT(*) DESC;

-- C8. Listez les factures d�un montant de plus de 500 �
--     dont le r�glement est en esp�ces
-- Solution avec IN :
SELECT *
FROM Facture
WHERE montantHt > 500
AND idMoyenPaiement IN
(
 SELECT idMoyenPaiement
 FROM MoyenPaiement
 WHERE designation = 'Esp�ces'
);

-- Solution avec JOIN :
SELECT *
FROM Facture F
JOIN MoyenPaiement MP ON F.idMoyenPaiement = MP.idMoyenPaiement
WHERE F.montantHt > 500
AND MP.designation = 'Esp�ces';

-- C9. Supprimez ces factures
-- Solution avec IN :
DELETE
FROM Facture
WHERE montantHt > 500
AND idMoyenPaiement IN
(
 SELECT idMoyenPaiement
 FROM MoyenPaiement
 WHERE designation = 'Esp�ces'
);

-- Solution avec JOIN :
DELETE Facture
FROM Facture
JOIN MoyenPaiement MP ON Facture.idMoyenPaiement = MP.idMoyenPaiement
WHERE montantHt > 500
AND MP.designation = 'Esp�ces';

-- C10. Choisissez un sp�cialiste et un monument historique au hasard dans votre base de donn�es :
SELECT idSpecialiste
FROM Specialiste
ORDER BY RAND()
LIMIT 1; -- Retourne 42

SELECT idMonument
FROM Monument
ORDER BY RAND()
LIMIT 1; -- Retourne 7

-- C10a. Mettez-le � jour en y indiquant les informations donn�es en exemple dans l��nonc�
UPDATE Specialiste
SET numeroSiret = '56450254000037',
    raisonSociale = 'Beaufils SAS',
    anneeFondation = 1956,
    estAutoentrepreneur = 0
WHERE idSpecialiste = 42;

-- C10b. Obtenez le montant total des factures �mises en 2020 par ce sp�cialiste
SELECT SUM(montantHt)
FROM Facture
WHERE idSpecialiste = 42
AND YEAR(dateEmission) = 2020; -- Possible de faire � dateEmission LIKE '2020%' � ou � dateEmission BETWEEN '2020-01-01' AND '2020-12-31' �

-- C10c. Obtenez le montant total des factures sur l�ann�e 2020 concernant ce monument historique
SELECT SUM(montantHt)
FROM Facture
WHERE idMonument = 7
AND YEAR(dateEmission) = 2020;

-- C10d. Obtenez le pourcentage de consommation du budget 2021 pour ce monument historique
SELECT SUM(F.montantHt) / M.budget * 100 AS `Consommation du budget` -- Possibilit� d'arrondir avec ROUND. Possibilit� de sp�cifier l'unit� avec % avec CONCAT
FROM Facture F
JOIN Monument M ON F.idMonument = M.idMonument
WHERE M.idMonument = 7
AND YEAR(F.dateEmission) = 2021;

-- C11. Listez les 5 monuments historiques ayant le pourcentage de consommation de budget sur 2020 le plus �lev�
SELECT M.idMonument, M.nom, SUM(F.montantHt) / M.budget * 100 AS `Consommation du budget`
FROM Facture F
JOIN Monument M ON F.idMonument = M.idMonument
WHERE YEAR(dateEmission) = 2020
GROUP BY M.idMonument, M.nom
ORDER BY SUM(F.montantHt) / M.budget * 100 DESC
LIMIT 5;

-- Bonus : obtenir le m�me bilan qu'en C10d mais avec toutes les ann�es, ann�es par ann�es
SELECT Monument.nom,
CONCAT(SUM(montantHt), ' �') AS sommeDesFactures,
CONCAT(Monument.budget, ' �') As budgetMonument,
YEAR(dateEmission) AS annee,
CONCAT(ROUND(SUM(montantHt) / Monument.budget * 100, 1), ' %') AS pourcentage
FROM Facture
JOIN Monument ON Facture.idMonument = Monument.idMonument
GROUP BY Monument.nom, Monument.budget, YEAR(dateEmission)
