C.
1.
INSERT INTO type (libelle)
VALUES ('Atmosphériques'),
('Souterraine'),
('Extra-atmosphériques'),
('Sous-marines');

2.
INSERT INTO categorie (nom)
VALUES ('Essai officiel'),
('Essai officieux'),
('Tir de combat');

3.
Fait

4.
Resultat
2108 explosions ajoutées

D.
5.
BEGIN
	IF (new.latitude < -90 OR new.latitude > 90) 
    THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Latitude doit etre entre -90 et 90';
	END IF;
END

BEGIN
	IF (new.longitude < -180 OR new.longitude > 180) 
    THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Longitude doit etre entre -180 et 180';
	END IF;
END

6.
BEGIN
IF (LENGTH(new.nomDeCode) < 3)
THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Nom WRONG';
END IF;
END

7.


E.
1.
SELECT *
FROM explosion
WHERE explosion.nomDeCode = 'Trinity';

2.
Fait

3.
Fait

4.
Fait

F.
1.
SELECT * 
FROM explosion
WHERE explosion.dateDeclenchement < '1955-01-01'
ORDER BY explosion.dateDeclenchement DESC;

2.
SELECT nomDeCode, 
	dateDeclenchement AS dateExplotion,
    puissanceEstimee AS puissance,
    type.libelle AS libelleType,
    categorie.nom AS nomCateg,
    site.designation AS nomSite,
    pays.nom AS paysSite
FROM explosion
JOIN type ON type.idType = explosion.idType
JOIN categorie ON categorie.idCategorie = explosion.idCategorie
JOIN site ON site.idSite = explosion.idSite
JOIN pays ON pays.idPays = explosion.idPays
ORDER BY puissanceEstimee ASC;

3.
Fait

4.
SELECT *
FROM explosion
WHERE explosion.idExplosion = ROUND( RAND() * 2107 ) + 1

idExplosion = 400

5.
