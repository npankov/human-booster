-- B2. Créez une procédure stockée qui ajoute aléatoirement entre 250 et 500 utilisateurs
BEGIN
 SET @maxi = 250 + RAND() * 250; -- Nombre aléatoire compris entre 250 et 500
 SET @i = 0;
 WHILE @i < @maxi DO
  SET @prenomTemp = CONV(FLOOR(RAND() * 99999999999999), 20, 36); -- Générer un prénom aléatoirement
  SET @nomTemp = CONV(FLOOR(RAND() * 99999999999999), 20, 36); -- Générer un nom aléatoirement
  SET @adresseMailTemp = CONV(FLOOR(RAND() * 99999999999999), 20, 36); -- Générer une adresse e-mail aléatoirement
  SET @dateNaissanceTemp = '1920-01-01' + INTERVAL RAND() * 32870 DAY; -- Générer une date aléatoirement comprise entre le 1er janvier 1920 et le 1er janvier 2010
  SET @motDePasseTemp = SHA2(CONV(FLOOR(RAND() * 99999999999999), 20, 36), 256); -- Générer un mot de passe aléatoirement, haché en SHA-256
  INSERT INTO Utilisateur (prenom, nom, adresseMail, dateNaissance, motDePasse)
  VALUES (@prenomTemp, @nomTemp, @adresseMailTemp, @dateNaissanceTemp, @motDePasseTemp);
  SET @i = @i + 1;
 END WHILE;
 SELECT CONCAT(@i, ' Utilisateurs ajoutés') AS Resultat;
END

-- C2. Mettez en place un déclencheur empêchant l'insertion et la mise à jour d'un utilisateur si l'adresse e-mail est invalide.
-- Pour ce premier déclencheur, quelques conseils :
-- Dans votre IF, l'usage du mot-clé LIKE est à prévoir.
-- N'oubliez pas que vous pouvez utiliser des apostrophes dans le message d'erreur en les doublant, ou en les échappant.
-- Néanmoins, si vous éditez votre déclencheur, phpMyAdmin gère mal ça, et il faudra recommander à gérer les apostrophes
-- Dernière chose : pensez bien à créer le déclencheurs lors du BEFORE INSERT et du BEFORE UPDATE sur la table UTILISATEUR

-- C4. La fonction "TIMESTAMPDIFF" permet de faire la différence entre deux date en précisant l'unité (en jour, en mois, en seconde, en année...).
-- Exemple : TIMESTAMPDIFF(MONTH, '2020-01-01', '2020-03-01') retourne "2"
-- Renseignez-vous sur le fonctionnement de cette fonction ici : https://www.w3resource.com/mysql/date-and-time-functions/mysql-timestampdiff-function.php

-- E1. Créez une procédure stockée qui ajoute aléatoirement entre 150 et 300 projets
BEGIN
 SET @maxi = 150 + RAND() * 150; -- Nombre aléatoire compris entre 150 et 300
 SET @i = 0;
  WHILE @i < @maxi DO
   SET @titreTemp = CONV(FLOOR(RAND() * 99999999999999), 20, 36); -- Générer un titre aléatoirement
   SET @descriptionTemp = CONV(FLOOR(RAND() * 99999999999999), 20, 36); -- Générer une description aléatoirement
   SET @objectifFinancierTemp = 1000 + RAND() * 4000; -- Générer un nombre aléatoire entre 1000 et 5000
   SET @idCategorieTemp = (SELECT idCategorie FROM Categorie ORDER BY RAND() LIMIT 1); -- Choisir une catégorie au hasard parmi les catégories
   SET @idUtilisateurTemp = (SELECT idUtilisateur FROM Utilisateur ORDER BY RAND() LIMIT 1); -- Choisir un utilisateur au hasard parmi les utilisateurs
   INSERT INTO Projet (titre, description, objectifFinancier, idCategorie, idUtilisateur)
   VALUES (@titreTemp, @descriptionTemp, @objectifFinancierTemp, @idCategorieTemp, @idUtilisateurTemp);
   SET @i = @i + 1;
  END WHILE;
  SELECT CONCAT(@i, ' Projets ajoutés') AS Resultat;
END

-- F1. Créez une procédure stockée qui ajoute aléatoirement entre 500 et 3000 dons
BEGIN
 SET @maxi = 500 + RAND() * 2500; -- Nombre aléatoire compris entre 500 et 3000
 SET @i = 0;
  WHILE @i < @maxi DO
   SET @dateDonTemp = '2020-07-01' + INTERVAL RAND() * TIMESTAMPDIFF(DAY, '2020-07-01', CURDATE()) DAY; -- Générer un date aléatoirement
   SET @montantTemp = 5 + RAND() * 95; -- Générer un nombre aléatoire entre 5 et 100
   SET @idUtilisateurTemp = (SELECT idUtilisateur FROM Utilisateur ORDER BY RAND() LIMIT 1); -- Choisir un utilisateur au hasard parmi les utilisateurs
   SET @idProjetTemp = (SELECT idProjet FROM Projet ORDER BY RAND() LIMIT 1); -- Choisir un projet au hasard parmi les projets
   INSERT INTO Don (dateDon, montant, idUtilisateur, idProjet)
   VALUES (@dateDonTemp, @montantTemp, @idUtilisateurTemp, @idProjetTemp);
   SET @i = @i + 1;
  END WHILE;
  SELECT CONCAT(@i, ' Dons ajoutés') AS Resultat;
END

-- F2c. La fonction IFNULL permet de retourner une autre valeur en cas de NULL
-- Exemple : IFNULL(champ1, 'Rien')
-- Si champ1 est NULL, alors on obtient 'Rien'. Dans les autres cas, on obtient champ1
-- Ceci peut être utile si vous n'avez pas de don sur un projet !

-- G3. Pour réussir cette question, il faudra joindre plusieurs fois la table utilisateur dans votre requête.
-- Pour ce faire, il est nécessaire de donner des noms d'alias aux tables ainsi jointes

-- G6. Mettez en place un déclencheur empêchant ce type de don d’exister.
-- Pour faire ce déclencheur, une bonne solution conciste à déclarer une variable destinée
-- à contenir un idUtilisateur et l'alimenter avec une sous-requête.

-- G8. Faites-en sorte que deux utilisateurs ne puissent pas avoir la même adresse e-mail.
-- Un déclencheur pourrait répondre à cette problématique, mais il existe + simple et + performant.
-- Quelques clic dans PhpMyAdmin suffisent. Cherchez sur Internet, et si vous ne trouvez pas, demandez-moi.

-- H2. Pas besoin de procédures stockées dans cette question : un UPDATE sans WHERE suffit
-- Voici un exemple de code qui permet d'obtenir une date comprise entre aujourd'hui et la semaine dernière :
-- CURDATE() - INTERVAL RAND() * 7 DAY
-- Adaptez cet exemple à l'énoncé de la question H2
-- Renseignez-vous sur le fonctionnement du mot-clef INTERVAL en parcourant cet article : https://www.mysqltutorial.org/mysql-interval/

-- H10. Mettez en place un déclencheur qui interdit le dépôt d'un don sur un projet expiré.
-- Contrairement aux autres déclencheurs, celui-ci ne doit avoir lieu que lors du BEFORE INSERT *UNIQUEMENT*
-- Comme pour la question G4, une variable alimentée avec une sous-requête est une bonne idée.

-- H12. Une sous-requête dans le SELECT sera nécessaire pour la troisième colonne.
-- Exemple : SELECT champ1, champ2, (SELECT info1 FROM AutreTable Where info2 = T.champ3)
-- FROM Table T