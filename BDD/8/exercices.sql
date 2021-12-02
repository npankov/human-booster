B.
1.
INSERT INTO categorie (categorie.libelle)
VALUES ('Documentaire'),
('Film'),
('Série'),
('Jeu de société'),
('Jeu vidéo'),
('Gadget technologique');

3.
SELECT * FROM categorie ORDER BY categorie.libelle ASC; 

4.
SELECT COUNT(*)
FROM utilisateur

5.
SELECT CONCAT(utilisateur.prenom, utilisateur.nom), utilisateur.adresseMail
FROM utilisateur
ORDER BY utilisateur.nom DESC

C.
2.
BEGIN
	IF (new.adresseMail NOT LIKE  '%_@%_.__%') 
    THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Wrong email';
	END IF;
END

4.
SELECT CONCAT(utilisateur.prenom, utilisateur.nom), utilisateur.dateNaissance, TIMESTAMPDIFF(YEAR, utilisateur.dateNaissance, CURDATE()) AS Age
FROM utilisateur
ORDER BY Age ASC

D.
1.
BEGIN
SET @age = (SELECT TIMESTAMPDIFF(YEAR, new.dateNaissance, CURDATE()) AS Age);
IF (@age < 16) 
    THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'You so young';
	END IF;
END

E.
2.
SELECT projet.titre, projet.objectifFinancier, CONCAT(utilisateur.prenom, utilisateur.nom), categorie.libelle
FROM projet
JOIN utilisateur ON utilisateur.idUtilisateur = projet.idUtilisateur
JOIN categorie ON categorie.idCategorie = projet.idCategorie
ORDER BY projet.objectifFinancier DESC

3.
SELECT categorie.libelle, COUNT(*)
FROM categorie 
JOIN projet ON projet.idCategorie = categorie.idCategorie
GROUP BY libelle;

4.
SELECT *
FROM projet
WHERE idProjet = ROUND( RAND() * 9 ) + 1

idProjet 	titre 	description 	objectifFinancier 	idUtilisateur 	idCategorie 	
5 	    1VET3RSBPU4W 1B4CV70T1I54   	1783 	            264 	         1

UPDATE utilisateur
SET nom = 'Nikolai', prenom = 'Pankov', adresseMail = 'test@test.com'
WHERE idUtilisateur = 264;

F.
2.
a.
SELECT SUM(projet.objectifFinancier) 
FROM projet

SELECT SUM(don.montant) 
FROM don
JOIN projet ON projet.idProjet = don.idProjet
WHERE projet.idProjet = 5;

b.
SELECT SUM(don.montant), projet.objectifFinancier, IF (SUM(don.montant) > projet.objectifFinancier, 'Atteint', 'Il en manque...')
FROM don
JOIN projet ON projet.idProjet = don.idProjet
WHERE projet.idProjet = 5;

c.
SELECT SUM(don.montant), projet.objectifFinancier, CONCAT(ROUND(SUM(don.montant) / projet.objectifFinancier * 100), '%') AS Purcentage
FROM don
JOIN projet ON projet.idProjet = don.idProjet
WHERE projet.idProjet = 5;

3.
Fait

4.

5.
SELECT projet.titre, projet.description, SUM(don.montant), CONCAT(ROUND(SUM(don.montant) / projet.objectifFinancier * 100), '%') AS Purcentage
FROM don
JOIN projet ON projet.idProjet = don.idProjet
GROUP BY projet.titre, projet.description, projet.objectifFinancier;

6.
Fait

7.
SELECT * 
FROM vuef6
WHERE Purcentage > 90

G.
4.
SELECT titre AS `Titre du projet`,
don.montant AS `Montant du don`,
CONCAT(Uemeteur.prenom, ' ', Uemeteur.nom) AS `Personne émettrice du don`,
CONCAT(Ureceveur.prenom, ' ', Ureceveur.nom) AS `Personne recevant le don`
FROM Projet P
JOIN Don ON P.idProjet = Don.idProjet
JOIN Utilisateur Uemeteur ON Don.idUtilisateur = Uemeteur.idUtilisateur
JOIN Utilisateur Ureceveur ON P.idUtilisateur = Ureceveur.idUtilisateur

6.
BEGIN
    SET @idUserRec = (
        SELECT idUtilisateur
        FROM Projet
        WHERE idProjet = new.idProjet
        );
    IF (new.idUtilisateur = @idUserRec)
    THEN
        SIGNAL SQLSTATE '45000'
         SET MESSAGE_TEXT = 'Il est interdit de se faire un don a soi meme';
    END IF;
END

H.
2.
a.
ALTER TABLE projet ADD COLUMN dureProjet INT NOT NULL DEFAULT 0 AFTER titre;
ALTER TABLE projet ADD COLUMN dateDebutProjet INT NOT NULL DEFAULT 0 AFTER titre;

b.
ALTER TABLE don ADD COLUMN estAnnules INT NOT NULL DEFAULT 0;


3.
UPDATE projet
SET projet.dateDebutProjet = CURDATE()
WHERE projet.dateDebutProjet = 0
