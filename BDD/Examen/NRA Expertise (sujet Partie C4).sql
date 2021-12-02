-- C4
BEGIN
 SET @maxi = 400 + RAND() * 200; -- Nombre aléatoire compris entre 400 et 600
 SET @i = 0;
 WHILE @i < @maxi DO
  SET @numeroDeSerieTemp = CONV(FLOOR(RAND() * 99999999999999), 20, 36); -- Le numéro de série doit être une suite de caractères aléatoire
  SET @anneeDeMiseEnServiceTemp = 1990 + RAND() * (2021 - 1990); -- L’année de mise en service doit être aléatoire et comprise entre 1990 et 2021
  SET @latitudeTemp = 42.5 + RAND() * 8; -- La latitude doit être aléatoire et comprise entre 42,5 et 50,5 (pertinente pour la France)
  SET @longitudeTemp = -3.5 + RAND() * 10; -- La longitude doit être aléatoire et comprise entre -3,5 et 6,5 (pertinente pour la France)
  SET @idFournisseurTemp = (SELECT idFournisseur FROM Fournisseur ORDER BY RAND() LIMIT 1); -- Le fournisseur doit être choisi aléatoirement parmi les fournisseurs existants
  SET @idCategorieTemp = (SELECT idCategorie FROM Categorie ORDER BY RAND() LIMIT 1); -- La catégorie doit être choisi aléatoirement parmi les catégories existantes
  INSERT INTO Equipement (numeroDeSerie, anneeDeMiseEnService, latitude, longitude, idFournisseur, idCategorie)
  VALUES (@numeroDeSerieTemp, @anneeDeMiseEnServiceTemp, @latitudeTemp, @longitudeTemp, @idFournisseurTemp, @idCategorieTemp);
  SET @i = @i + 1;
 END WHILE;
 SELECT CONCAT(@i, ' équipements ajoutés') AS Resultat;
END