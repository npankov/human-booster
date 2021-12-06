B.
2.
INSERT INTO societe(raisonSociale, numTelSupport) 
VALUES ('PCE  Instruments', CONCAT('0', CAST(FLOOR((0.1 + RAND()) * 699999999) AS CHAR(9)))),
('Adcon', CONCAT('0', CAST(FLOOR((0.1 + RAND()) * 699999999) AS CHAR(9)))),
('Pulsonic', CONCAT('0', CAST(FLOOR((0.1 + RAND()) * 699999999) AS CHAR(9)))),
('Ahlborn', CONCAT('0', CAST(FLOOR((0.1 + RAND()) * 699999999) AS CHAR(9)))),
('JRI', CONCAT('0', CAST(FLOOR((0.1 + RAND()) * 699999999) AS CHAR(9)))),
('Promété', CONCAT('0', CAST(FLOOR((0.1 + RAND()) * 699999999) AS CHAR(9)))),
('Campbel  SCI', CONCAT('0', CAST(FLOOR((0.1 + RAND()) * 699999999) AS CHAR(9)))),
('Sterela', CONCAT('0', CAST(FLOOR((0.1 + RAND()) * 699999999) AS CHAR(9))));

3.
INSERT INTO technicien (idSociete, nom, prenom)
VALUES (1, 'Pit', 'Petrov'),
(2, 'Pit', 'Petrov'),
(3, 'Den', 'Dento'),
(4, 'Ben', 'Bidro'),
(5, 'Ron', 'Marlow'),
(6, 'Mona', 'Tara'),
(7, 'Elli', 'Gav'),
(8, 'Emma', 'Tomo'),
(9, 'Nikolai', 'Pankov'),
(1, 'Tete', 'Macron'),
(2, 'Mam', 'Bambam');

4.
Fait
437 relevés ajoutés

5.
Fait
8973 relevés ajoutés

C.
3.
BEGIN
	IF (new.duree < 5 OR new.duree > 240) 
    THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Duree doit etre entre 5 et 240';
	END IF;
END

6.

9.

D.
1.
SELECT *
FROM releve
WHERE releve.dateHeure > '2021-11-28'  

2.
Fait

E.
1.
SELECT * 
FROM typemesure

2.
SELECT CONCAT(nom,' ', prenom) AS `Nom et Prenom`, societe.raisonSociale AS `Raison sociale`
FROM technicien
JOIN societe ON societe.idSociete = technicien.idSociete
ORDER BY societe.raisonSociale DESC

3.
SELECT societe.raisonSociale AS `Societe`, COUNT(*) AS `Nombre de stations`
FROM station
JOIN societe ON societe.idSociete = station.idSociete
GROUP BY societe.raisonSociale
ORDER BY `Nombre de stations` DESC

4.
SELECT *
FROM station
WHERE station.longitude >= 1.7 AND station.latitude >= 46.6

DELETE releve
FROM releve
JOIN station ON station.idStation = releve.idStation
WHERE station.longitude >= -1.7 AND station.latitude >= 46.6;

DELETE station
FROM station
WHERE station.longitude >= -1.7 AND station.latitude >= 46.6;

5.
Fait

6.
SELECT *
FROM explosion
JOIN pays ON explosion.idPays = pays.idPays
WHERE pays.idPays != explosion.idPays;

7.
SELECT *
FROM explosion
JOIN type ON type.idType = explosion.idType
JOIN categorie ON categorie.idCategorie = explosion.idCategorie
JOIN pays ON pays.idPays = explosion.idPays
WHERE type.idType = 4 AND categorie.idCategorie = 1 AND pays.idPays = 3;

8.
SELECT site.designation AS `Désignation du site`,
	CONCAT('[', site.latitude, ' ; ', site.longitude, ']') AS `Coordonnées géographiques`,
    COUNT(*) AS `Nombre d'explotions`
FROM explosion
JOIN site ON site.idSite = explosion.idSite
GROUP BY site.designation, `Coordonnées géographiques`;

9.
SELECT pays.nom AS `Nom du pays`,
	COUNT(*) AS `Nombre d'explotions`,
    MIN(explosion.dateDeclenchement) AS `Date de la première explosion`,
    MAX(explosion.dateDeclenchement) AS `Date de la dernière explosion`
FROM explosion
JOIN pays ON pays.idPays = explosion.idPays
GROUP BY pays.nom;

10.
SELECT pays.nom AS `Nom du pays`,
	COUNT(*) AS `Nombre d'explotions`,
    REPLACE(explosion.estFission, 1, 'Bombe à fission') AS `Technologie de bombe`,
    explosion.puissanceEstimee AS `Puissance estimée`,
    MAX(explosion.dateDeclenchement) AS `Date de fin de retombee`
FROM explosion
JOIN pays ON pays.idPays = explosion.idPays
GROUP BY `Nom du pays`, `Technologie de bombe`, `Puissance estimée`

