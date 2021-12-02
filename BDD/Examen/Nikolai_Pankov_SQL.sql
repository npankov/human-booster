C
1.
INSERT INTO fournisseur (nom)
VALUES ('free'),
('orange'),
('sfr'),
('bouygues'),
('ovh');

2.
INSERT INTO categorie (nomComplet, sigle)
VALUES ('Digital Subscriber Line Access Multiplexer', 'DSLAM'),
('Nœud de Raccordement d’Abonné', 'NRA'),
('Commutateur à Autonomie d''Acheminement', 'CAA'),
('Sous-Répartiteur Haut Débit', 'SRHD'),
('Sous-Répartiteur Très Haut Débit', 'SRTHD');

3.
INSERT INTO motif (libelle, estBloquant)
VALUES ('Maintenance périodique', 0),
('Maintenance ponctuelle', 0),
('Chutes de débit', 0),
('Chutes de débit', 1),
('Pics de latence', 1),
('Pics de latence', 1),
('Pertes de contact', 1);

4.
fait

5.
fait

D
1.
SELECT *
FROM equipement
WHERE equipement.anneeDeMiseEnService <= 2008;

2.
SELECT equipement.numeroDeSerie AS `Numéro de série`,
	equipement.anneeDeMiseEnService AS `Année de mise en service`,
    equipement.latitude AS `Latitude`,
    equipement.longitude AS `Longitude`,
    fournisseur.nom AS `Nom du fournisseur`
FROM equipement
JOIN fournisseur ON fournisseur.idFournisseur = equipement.idFournisseur
ORDER BY equipement.anneeDeMiseEnService DESC;

3.
SELECT equipement.numeroDeSerie AS `Numéro de série`,
	equipement.anneeDeMiseEnService AS `Année de mise en service`,
    equipement.latitude AS `Latitude`,
    equipement.longitude AS `Longitude`,
    fournisseur.nom AS `Nom du fournisseur`,
    categorie.sigle AS `categ`
FROM equipement
JOIN fournisseur ON fournisseur.idFournisseur = equipement.idFournisseur
JOIN categorie ON categorie.idCategorie = equipement.idCategorie
ORDER BY categorie.sigle, fournisseur.nom, equipement.anneeDeMiseEnService DESC;

4.
fait

5.
SELECT *
FROM intervention
JOIN motif ON motif.idMotif = intervention.idMotif
WHERE intervention.duree > 2 AND (motif.libelle = 'Pertes de contact' OR motif.libelle = 'Chutes de débit' OR motif.libelle = 'Pics de latence');

6.
UPDATE motif
SET libelle = 'Ligne indisponible'
WHERE libelle = 'Pertes de contact';

7.
SELECT *
FROM intervention
WHERE montantPieces = 0;

8.
SELECT fournisseur.nom as Fournisseur, COUNT(*) AS `Nombre d’équipements`
FROM equipement
JOIN fournisseur ON fournisseur.idFournisseur = equipement.idFournisseur
GROUP BY `Fournisseur` 
ORDER BY `Nombre d’équipements` DESC;

9.
SELECT motif.libelle AS Motif, ROUND(AVG(intervention.duree))
FROM intervention
JOIN motif ON motif.idMotif = intervention.idMotif
GROUP BY Motif;

10.
SELECT MAX(intervention.duree), intervention.idEquipement AS IdEquipement
FROM intervention
GROUP BY idEquipement
ORDER BY MAX(intervention.duree) DESC
LIMIT 1