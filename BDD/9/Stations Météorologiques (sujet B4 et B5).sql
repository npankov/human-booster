-- B4
BEGIN

 SET @maxi = 400 + RAND() * 100; -- Nombre aléatoire entre 400 et 500
 SET @i = 0;
 
 WHILE @i < @maxi DO
  SET @nomTemp = CONV(FLOOR(RAND() * 99999999999999), 20, 36); -- Chaine aléatoire
  SET @latitudeTemp = 42.5 + RAND() * 8; -- Nombre aléatoire entre 42,5 et 50,5 (50.5 - 42.5 = 8)
  SET @longitudeTemp = -3.5 + RAND() * 10; -- Nombre aléatoire entre -3,5 et 6,5 (6.5 - (-3.5) = 10)
  SET @altitudeTemp = RAND() * 1500; -- Nombre aléatoire entre 0 et 1500
  SET @estZoneUrbaineTemp = IF(RAND() < 0.25, 1, 0); -- Est urbaine dans 25% des cas
  SET @idSocieteTemp = (SELECT idSociete FROM Societe ORDER BY RAND() LIMIT 1); -- ID aléatoire dans la table Societe
  
  INSERT INTO Station(nom, latitude, longitude, altitude, estZoneUrbaine, idSociete)
  VALUES(@nomTemp, @latitudeTemp, @longitudeTemp, @altitudeTemp, @estZoneUrbaineTemp, @idSocieteTemp);
  
  SET @i = @i + 1;
 END WHILE;
 
 SELECT CONCAT(@i, ' stations ajoutées') AS Resultat;
  
END


-- B5
BEGIN

 SET @maxi = 8000 + RAND() * 4000;
 SET @i = 0;
 
 WHILE @i < @maxi DO
  SET @idStationTemp = (SELECT idStation FROM Station ORDER BY RAND() LIMIT 1);
  SET @idTypeMesureTemp = (SELECT idTypeMesure FROM TypeMesure ORDER BY RAND() LIMIT 1);
  SET @valeurMinTemp = (SELECT valeurMin FROM TypeMesure WHERE idTypeMesure = @idTypeMesureTemp);
  SET @valeurMaxTemp = (SELECT valeurMax FROM TypeMesure WHERE idTypeMesure = @idTypeMesureTemp);
  SET @valeurTemp = @valeurMinTemp + RAND() * (@valeurMaxTemp - @valeurMinTemp);
  SET @dateHeureTemp = '2021-06-01' + INTERVAL RAND() * 264960 MINUTE;
  
  INSERT INTO Releve(dateHeure, valeur, idTypeMesure, idStation)
  VALUES(@dateHeureTemp, @valeurTemp, @idTypeMesureTemp, @idStationTemp);
  
  SET @i = @i + 1;
 END WHILE;
 
 SELECT CONCAT(@i, ' relevés ajoutés') AS Resultat;
  
END