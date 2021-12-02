CREATE DATABASE Prescriptions;
USE Prescriptions;

CREATE TABLE Docteur (
  idDocteur int(11) NOT NULL,
  prenom varchar(40) NOT NULL,
  nom varchar(40) NOT NULL,
  specialite1 varchar(40) NOT NULL,
  specialite2 varchar(40) NOT NULL,
  ville varchar(50) NOT NULL,
  PRIMARY KEY (idDocteur)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
INSERT INTO Docteur (idDocteur, prenom, nom, specialite1, specialite2, ville) VALUES
(0, 'Daniel', 'Gauthier', 'Généraliste', '', 'Lyon'),
(1, 'Michel', 'Joly', 'Dermatologue', '', 'Villeurbanne'),
(2, 'Alain', 'Duval', 'Généraliste', 'Oto-rhino-laryngologiste', 'Lyon'),
(3, 'Chantal', 'Lemaire', 'Généraliste', '', 'Vénissieux'),
(4, 'Carole', 'Denis', 'Allergologue', 'Généraliste', 'Bron'),
(5, 'Richard', 'Boyer', 'Rhumatologue', '', 'Lyon'),
(6, 'Ghislaine', 'Sanchez', 'Généraliste', '', 'Villeurbanne'),
(7, 'Serge', 'Nguyen', 'Allergologue', '', 'Vaulx-en-Velin'),
(8, 'Catherine', 'Masson', 'Généraliste', 'Neurologue', 'Lyon'),
(9, 'Gilles', 'Fontaine', 'Généraliste', '', 'Caluire-et-Cuire'),
(10, 'Angélique', 'Lopez', 'Oto-rhino-laryngologiste', '', 'Villeurbanne'),
(11, 'Franck', 'Morin', 'Neurologue', '', 'Lyon'),
(12, 'Édith', 'Perrin', 'Allergologue', '', 'Bron'),
(13, 'Louis', 'Nicolas', 'Rhumatologue', '', 'Vaulx-en-Velin'),
(14, 'Jacques', 'Roussel', 'Généraliste', 'Dermatologue', 'Villeurbanne'),
(15, 'Marcel', 'Muller', 'Allergologue', 'Généraliste', 'Lyon'),
(16, 'Joël', 'Blanc', 'Oto-rhino-laryngologiste', '', 'Lyon'),
(17, 'Sylvie', 'Rousseau', 'Généraliste', 'Allergologue', 'Vénissieux'),
(18, 'François', 'Morin', 'Généraliste', '', 'Caluire-et-Cuire');

CREATE TABLE Medicament (
  idMedicament int(11) NOT NULL,
  nom varchar(40) NOT NULL,
  doseMaximale int(11) NOT NULL,
  PRIMARY KEY (idMedicament)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
INSERT INTO Medicament (idMedicament, nom, doseMaximale) VALUES
(0, 'Cortisone', 2),
(1, 'Amoxicilline', 2),
(2, 'Pénicilline', 3),
(3, 'Desloratadine', 2),
(4, 'Paracétamol', 4),
(5, 'Aspirine', 3),
(6, 'Phloroglucinol', 2),
(7, 'Diosmectite', 6),
(8, 'Ibuprofène', 1);

CREATE TABLE Patient (
  idPatient int(11) NOT NULL,
  prenom varchar(40) NOT NULL,
  nom varchar(40) NOT NULL,
  age int(11) NOT NULL,
  nomMedicament varchar(50) NOT NULL,
  doseMedicament varchar(11) NOT NULL,
  docteurPrescripteur varchar(80) NOT NULL,
  datePrescription varchar(40) NOT NULL,
  dureePrescription int(11) NOT NULL,
  PRIMARY KEY (idPatient)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
INSERT INTO Patient (idPatient, prenom, nom, age, nomMedicament, doseMedicament, docteurPrescripteur, datePrescription, dureePrescription) VALUES
(0, 'André', 'Petit', 23, 'Pénicilline, Paracétamol', '3, 4', 'Dr. C. Masson, Dr. C. Lemaire', '05/12/2019', 6),
(1, 'Anne', 'Barbier', 21, 'Aspirine', '1', 'Dr. D. Gauthier', '15/02/2019', 12),
(2, 'Antoine', 'Faure', 15, 'Aspirine', '1', 'Dr. C. Masson', '4 mai 2019', 8),
(3, 'Arnaud', 'Lefebvre', 17, 'Phloroglucinol', '5', 'Dr. G. Sanchez', '2019-10-14', 12),
(4, 'Bernard', 'Roux', 33, 'Diosmectite, Paracétamol', '1, 3', 'Dr. S. Rousseau, Dr. J. Blanc', '04/10/2019', 5),
(5, 'Catherine', 'Perez', 45, 'Amoxicilline, Paracétamol', '3, 2', 'Dr. A. Lopez, Dr. A. Duval', '10/03/2019', 7),
(6, 'Christian', 'Bonnet', 66, 'Pénicilline', '4', 'Dr. C. Denis', '02/07/2019', 10),
(7, 'Christiane', 'Leclercq', 60, 'Pénicilline', '2', 'Dr. A. Duval', '19/2/19', 12),
(8, 'Christine', 'Bourgeois', 23, 'Cortisone', '3', 'Dr. G. Sanchez', '07062019', 12),
(9, 'Clara', 'Brun', 17, 'Cortisone', '3', 'Dr. C. Denis', '03032019', 8),
(10, 'Claude', 'Lambert', 74, 'Desloratadine', '2', 'Dr. D. Gauthier', '2019-08-04', 8),
(11, 'Daniel', 'Morel', 38, 'Ibuprofène', '2', 'Dr. A. Duval', '11072019', 12),
(12, 'Denise', 'Picard', 74, 'Amoxicilline, Ibuprofène', '3, 2', 'Dr. R. Boyer', '2019-03-12', 5),
(13, 'François', 'Guerin', 42, 'Phloroglucinol, Diosmectite', '5, 4', 'Dr. S. Nguyen, Dr. S. Nguyen', '2019-06-23', 6),
(14, 'Françoise', 'Meyer', 25, 'Cortisone', '2', 'Dr. G. Fontaine', '7 août 2019', 14),
(15, 'Gérard', 'Legrand', 81, 'Diosmectite', '1', 'Dr. G. Sanchez', '01082019', 6),
(16, 'Hélène', 'Giraud', 67, 'Ibuprofène', '4', 'Dr. C. Lemaire', '8 novembre 2019', 8),
(17, 'Dominique', 'Dumont', 41, 'Cortisone', '2', 'Dr. F. Morin', '02032019', 10),
(18, 'Henri', 'Martinez', 60, 'Paracétamol, Cortisone, Amoxicilline', '4, 2, 1', 'Dr. M. Muller, Dr. C. Lemaire', '04032019', 12),
(19, 'Isabelle', 'Dufour', 29, 'Pénicilline', '4', 'Dr. L. Nicolas', '2019-02-24', 6),
(20, 'Jacqueline', 'Blanchard', 52, 'Paracétamol', '3', 'Dr. J. Roussel', '9 septembre 2019', 10),
(21, 'Jacques', 'Garcia', 56, 'Cortisone', '2', 'Dr. M. Joly', '6 mars 2019', 14),
(22, 'Jean', 'Durand', 63, 'Pénicilline, Cortisone, Phloroglucinol', '3, 2, 2', 'Dr. S. Rousseau, Dr. M. Muller', '12 janvier 2019', 12),
(23, 'Jeanne', 'Roy', 45, 'Ibuprofène', '2', 'Dr. R. Boyer', '2019-04-13', 12),
(24, 'Louis', 'Moreau', 21, 'Cortisone', '3', 'Dr. C. Lemaire', '06072019', 8),
(25, 'Louise', 'Gaillard', 66, 'Desloratadine', '5', 'Dr. G. Fontaine', '7 décembre 2019', 7),
(26, 'Madeleine', 'Brunet', 33, 'Cortisone', '2', 'Dr. C. Masson', '17 octobre 2019', 6),
(27, 'Marcel', 'Fournier', 34, 'Pénicilline', '3', 'Dr. G. Fontaine', '09/09/2019', 7),
(28, 'Marguerite', 'Lemoine', 54, 'Pénicilline', '1', 'Dr. M. Joly', '3/3/19', 14),
(29, 'Marie', 'Roche', 23, 'Pénicilline', '3', 'Dr. M. Joly', '11/05/2019', 8),
(30, 'Martine', 'Dumas', 56, 'Phloroglucinol, Cortisone', '2, 2', 'Dr. M. Muller, Dr. J. Blanc', '31/01/2019', 14),
(31, 'Michel', 'Dubois', 45, 'Desloratadine', '2', 'Dr. M. Muller', '2019-12-23', 14),
(32, 'Monique', 'Meunier', 32, 'Pénicilline', '2', 'Dr. A. Duval', '12/04/2019', 5),
(33, 'Nathalie', 'Marchand', 23, 'Desloratadine', '2', 'Dr. J. Blanc', '12042019', 12),
(34, 'Nicolas', 'Rousseau', 45, 'Cortisone', '3', 'Dr. S. Rousseau', '03/06/2019', 14),
(35, 'Nicole', 'Caron', 34, 'Diosmectite', '3', 'Dr. É. Perrin', '2019-01-05', 10),
(36, 'Noëmie', 'Dupuis', 15, 'Paracétamol, Diosmectite', '2, 2', 'Dr. A. Lopez, Dr. L. Nicolas', '04092019', 6),
(37, 'Patrick', 'Garnier', 31, 'Cortisone', '2', 'Dr. C. Lemaire', '15 juillet 2019', 10),
(38, 'Paul', 'Dupont', 54, 'Amoxicilline', '3', 'Dr. J. Roussel', '7 février 2019', 20),
(39, 'Philippe', 'Durand', 29, 'Paracétamol', '3', 'Dr. É. Perrin', '24 avril 2019', 10),
(40, 'Pierre', 'Bernard', 32, 'Amoxicilline', '3', 'Dr. S. Rousseau', '05042019', 8),
(41, 'René', 'Leroy', 52, 'Aspirine, Cortisone', '1, 2', 'Dr. S. Nguyen', '16/11/2019', 6),
(42, 'Robert', 'Mercier', 23, 'Pénicilline', '2', 'Dr. J. Blanc', '30 juin 2019', 14),
(43, 'Roger', 'Girard', 67, 'Cortisone, Diosmectite', '2, 1', 'Dr. A. Lopez', '14/08/2019', 6),
(44, 'Sophie', 'Moulin', 42, 'Cortisone', '2', 'Dr. L. Nicolas', '23 janv. 2019', 20),
(45, 'Suzanne', 'Aubert', 38, 'Pénicilline', '2', 'Dr. S. Rousseau', 'Le mardi sept mai 2019', 6),
(46, 'Valérie', 'Rivière', 45, 'Aspirine', '3', 'Dr. J. Blanc', '2019-11-11', 14);