BEGIN
 SET @quantiteMax = 1800 + RAND() * 600;
 SET @i = 0;
 
 INSERT INTO Explosion(dateDeclenchement, puissanceEstimee, nomDeCode, estFission, description, idPays, idSite, idCategorie, idType)
 VALUES ('1945-07-16', 19, 'Trinity', 1, 'Premier bombardement de l''histoire', 3, (SELECT idSite FROM Site WHERE designation LIKE '%Alamo%' LIMIT 1), (SELECT idCategorie FROM Categorie WHERE nom LIKE '%ciel%' LIMIT 1), (SELECT idType FROM Type ORDER BY idType LIMIT 1)),
		('1945-08-06', 12, 'Little Boy', 1, 'Bombardement de Hiroshima', 3, (SELECT idSite FROM Site WHERE designation LIKE '%Hiro%' LIMIT 1), (SELECT idCategorie FROM Categorie WHERE nom LIKE '%comba%' LIMIT 1), (SELECT idType FROM Type ORDER BY idType LIMIT 1)),
        ('1945-08-09', 20, 'Fat Man', 1, 'Bombardement de Nagasaki', 3, (SELECT idSite FROM Site WHERE designation LIKE '%Naga%' LIMIT 1), (SELECT idCategorie FROM Categorie WHERE nom LIKE '%comba%' LIMIT 1), (SELECT idType FROM Type ORDER BY idType LIMIT 1));
 
  WHILE @i < @quantiteMax DO
  
   SET @dateDeclenchementTemp = IF(RAND() > 0.005, '1946-06-01' + INTERVAL RAND() * TIMESTAMPDIFF(DAY, '1946-06-01', '1996-01-30') DAY, '2006-10-01' + INTERVAL RAND() * TIMESTAMPDIFF(DAY, '2006-10-01', '2017-09-30') DAY);
   SET @estFissionTemp = IF(RAND() < 0.7, 1, 0);
   SET @puissanceEstimeeTemp = IF(@estFissionTemp, 20 + RAND() * 480, IF(RAND() < 0.98, 1000 + RAND() * 6000, 10000 + RAND() * 40000));
   SET @nomDeCodeTemp = CONV(FLOOR(RAND() * 99999999999999), 20, 36);
   SET @descriptionTemp = CONV(FLOOR(RAND() * 99999999999999), 20, 36);
   SET @idPaysTemp = IF(YEAR(@dateDeclenchementTemp) > 2005, 2, IF(RAND() < 0.5, 3, IF(RAND() < 0.75, 9, IF(RAND() < 0.5, 4, (SELECT idPays FROM Pays WHERE idPays < 10 AND nom != 'Israël' AND nom != 'Corée du Nord' ORDER BY RAND() LIMIT 1)))));
   SET @idSiteTemp = IF(@idPaysTemp = 3,
    (SELECT idSite FROM Site WHERE idPays IN (3, 10, 11, 12) ORDER BY RAND() LIMIT 1),
	 IF(@idPaysTemp = 8,
	  (SELECT idSite FROM Site WHERE idPays IN (3, 11, 18) ORDER BY RAND() LIMIT 1),
	   IF(@idPaysTemp = 4,
	    (SELECT idSite FROM Site WHERE idPays IN (4, 13) ORDER BY RAND() LIMIT 1),
	    (SELECT idSite FROM Site WHERE idPays = @idPaysTemp ORDER BY RAND() LIMIT 1))));
   SET @idCategorieTemp = IF(RAND() < 0.9, (SELECT idCategorie FROM Categorie WHERE nom LIKE '%ciel%' LIMIT 1), (SELECT idCategorie FROM Categorie WHERE nom LIKE '%cieu%' LIMIT 1));
   SET @idTypeTemp = (SELECT idType FROM Type ORDER BY RAND() LIMIT 1);
   
   INSERT INTO Explosion(dateDeclenchement, puissanceEstimee, nomDeCode, estFission, description, idPays, idSite, idCategorie, idType)
   VALUES (@dateDeclenchementTemp, @puissanceEstimeeTemp, @nomDeCodeTemp, @estFissionTemp, @descriptionTemp, @idPaysTemp, @idSiteTemp, @idCategorieTemp, @idTypeTemp);
   
   SET @i = @i + 1;
  END WHILE;
  
  SET @i = @i + 3;
  
  SELECT CONCAT(@i, ' explosions ajoutées') AS Resultat;
  
END