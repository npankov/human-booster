-- B4. Procédure stockée d’ajout des spécialistes
-- Ce code source doit être copié-collé conformément aux étapes listées dans le cours sur les procédures stockées.

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