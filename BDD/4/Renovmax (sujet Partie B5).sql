-- B5. Procédure stockée d’ajout des factures fournie
-- Ce code source doit être copié-collé conformément aux étapes listées dans le cours sur les procédures stockées.

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