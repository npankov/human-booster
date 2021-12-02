-- C5
BEGIN
 SET @maxi = 200 + RAND() * 100; -- Nombre aléatoire compris entre 200 et 300
 SET @i = 0;
 WHILE @i < @maxi DO
  SET @dateDeDemarrageTemp = CURDATE() - INTERVAL RAND() * 360 DAY; -- La date de démarrage doit être aléatoirement choisie parmi ces 360 derniers jours
  SET @dureeTemp = 30 + RAND() * 210; -- La durée de l'intervention doit être comprise entre 30 minutes et 4 heures.
  SET @montantPiecesTemp = IF(RAND() < 0.3, 0, 100 + RAND() * (2000 - 100)); -- Le montant doit être égal à 0 € dans 30 % des cas ou compris entre 100 et 2000 € dans 70 % des cas
  SET @idMotifTemp = (SELECT idMotif FROM Motif ORDER BY RAND() LIMIT 1); -- Le motif doit être choisi aléatoirement parmi les motifs existants
  SET @idEquipementTemp = (SELECT idEquipement FROM Equipement ORDER BY RAND() LIMIT 1); -- L'équipement doit être choisi aléatoirement parmi les équipements existants
  INSERT INTO Intervention (dateDeDemarrage, duree, montantPieces, idMotif, idEquipement)
  VALUES (@dateDeDemarrageTemp, @dureeTemp, @montantPiecesTemp, @idMotifTemp, @idEquipementTemp);
  SET @i = @i + 1;
 END WHILE;
 SELECT CONCAT(@i, ' interventions ajoutées') AS Resultat;
END