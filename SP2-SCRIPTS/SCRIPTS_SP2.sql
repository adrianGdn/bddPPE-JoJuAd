--
-- Ajout de de la table `Cabinet`
--

CREATE TABLE IF NOT EXISTS `cabinet` (
  `id` int(11) NOT NULL auto_increment,
  `longitudeGPS` varchar(100) NOT NULL,
  `latitudeGPS` varchar(100) NOT NULL,
  `cp` varchar(10) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `rue` varchar(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

-- ----------------------------------------------------------

--
-- Ajout de de la table `Medecin`
--

CREATE TABLE IF NOT EXISTS `medecin` (
  `id` int(11) NOT NULL auto_increment,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `idCabinet` int(11) NOT NULL,
  `idActeur` char(4),
  PRIMARY KEY (id),
  FOREIGN KEY (`idCabinet`) REFERENCES cabinet(`id`),
  FOREIGN KEY (`idActeur`) REFERENCES acteur(`id`)
) ENGINE=InnoDB;


-- ----------------------------------------------------------

--
-- Ajout de de la table `Visite`
--

CREATE TABLE IF NOT EXISTS `visite` (
  `id` int(11) NOT NULL auto_increment,
  `dateVisite` date NOT NULL,
  `estVisiteProgramme` tinyint(1) NOT NULL DEFAULT '1',
  `heureArriveeCabinet` varchar(50),
  `heureDebutEntretien` varchar(50),
  `heureDepartCabinet` varchar(50),
  `idMedecin` int(11) NOT NULL,
  `idActeur` char(4) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (`idMedecin`) REFERENCES medecin(`id`),
  FOREIGN KEY (`idActeur`) REFERENCES acteur(`id`)
) ENGINE=InnoDB;

-- ----------------------------------------------------------

-- ----------------------------------------------------------
-- ----------------------------------------------------------

--
-- Ajout d'une colonne pour la table `Acteur`
--

ALTER TABLE `acteur`
ADD `version` int(5);

-- --------------------------------------------------------

--
-- Ajout de données dans la table `Acteur`
--

UPDATE `acteur` SET `version` = 0;

-- --------------------------------------------------------

-- ----------------------------------------------------------
-- ----------------------------------------------------------

--
-- Ajout d'acteur pour la table `Acteur`
--

INSERT INTO `acteur`(`id`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `cp`, `ville`, `dateEmbauche`, `idTypeActeur`, `oldMdp`, `mail`, `questionSecrete`, `version`) VALUES 
('e32', 'Mouttier', 'Robert', 'rmout', '12e9293ec6b30c7fa8a0926af42807e929c1684f', '32 rue des Trois Boudins', '10000', 'Valtordu', '1500-03-02', 2, 'robert', 'robert.mouttier@gsb.com', 'GSB', 0),
('a23', 'Cavrois', 'Benoît', 'bcavrois', 'ada67ac5f4f919afa4024d1d760165aba9b2aff0', '101 rue Nationale', '59000', 'Lille', '2017-02-21', 3, 'pamplemousse', 'benoit.cavrois@gsb.com', 'GSB', 0),
('d42', 'Dubus', 'Alexis', 'adubus', '175d5773e1877cbf47d25d1cc8e91b22e342638e', '42 rue du Trou Paumé', '59126', 'Lincelle', '2016-12-31', 1, 'saucissons', 'alexis.dubus@gsb.com', 'GSB', 0);

-- ----------------------------------------------------------

-- ----------------------------------------------------------
-- ----------------------------------------------------------

--
-- Ajout de cabinets pour la table `Cabinet`
--

INSERT INTO `cabinet`(`longitudeGPS`, `latitudeGPS`, `cp`, `ville`, `rue`) VALUES 
('2,2891506', '48,8618687', '75016', 'Paris', '1 Avenue Gustave V de Suède'),
('3,0566481', '50,6302592', '59800', 'Lille', '127 Rue Solférino'),
('3,8749271', '43,6110374', '34000', 'Montpellier', '17 Rue Foch'),
('-1,6736931', '48,1181043', '35700', 'Rennes', '127 23 Rue de Vincennes'),
('0,0991065', '49,4931952', '76600', 'Le Havre', '32 Avenue Foch'),
('4,8353320', '45,7639021', '69002', 'Lyon', '27 Rue Henri Germain');

-- ----------------------------------------------------------

--
-- Ajout de médecins pour la table `Medecin`
--

INSERT INTO `medecin`(`nom`, `prenom`, `idCabinet`, `idActeur`) VALUES 
('Zieglet', 'Angela', 1, 'b34'),
('Kozak', 'Gérôme', 2, 'a17'),
('Reynolds', 'Ryan', 4, 'a17'),
('Ranou', 'Monique', 5, 'a23'),
('Paracétamol', 'Marie', 2, 'a131'),
('Homeoplasmine', 'Jules', 2, 'a23'),
('Rollerball', 'David', 1, 'a17'),
('Wilwarin', 'Isil', 2, 'e32');

-- ----------------------------------------------------------

--
-- Ajout de médecins sans acteur pour la table `Medecin`
--
INSERT INTO `medecin`(`nom`, `prenom`, `idCabinet`) VALUES 
('Howlett', 'James', 3),
('Smecta', 'Henri', 1);

-- ----------------------------------------------------------

--
-- Ajout de visites pour la table `Visite`
--

INSERT INTO `visite`(`dateVisite`, `estVisiteProgramme`, `heureArriveeCabinet`, `heureDebutEntretien`, `heureDepartCabinet`, `idMedecin`, `idActeur`) VALUES 
('2017-02-02' , 1, '08h00', '08h30', '18h00', 8, 'e32'),
('2016-02-02' , 0, '08h01', '08h31', '18h01', 8, 'e32'),
('2018-04-27' , 1, '', '', '', 8, 'e32'),
('2017-03-17' , 0, '03h00', '18h30', '23h59', 3, 'd42'),
('2015-12-31' , 1, '23h58', '23h59', '23h59', 3, 'a17'),
('1500-01-01' , 1, '01h01', '03h23', '23h59', 3, 'a17'),
('2016-05-23' , 1, '03h23', '23h23', '23h32', 3, 'a23'),
('2016-06-21' , 1, '08h00', '08h30', '9h00', 1, 'b34'),
('2017-03-31' , 1, '13h59', '14h00', '17h00', 1, 'b34'),
('2016-02-02' , 0, '08h00', '08h30', '18h00', 2, 'a17'),
('2017-02-02' , 0, '08h30', '08h30', '08h31', 2, 'a17'),
('2017-02-02' , 1, '08h00', '08h30', '18h00', 4, 'a23'),
('2017-01-25' , 1, '15h13', '15h15', '20h00', 4, 'a23'),
('2016-11-13' , 0, '03h00', '05h13', '07h44', 4, 'a23'),
('2017-07-01' , 1, '', '', '', 5, 'a131'),
('2015-06-17' , 1, '15h00', '16h00', '17h00', 5, 'a131'),
('2016-06-06' , 1, '06h00', '16h00', '16h16', 5, 'a131'),
('2017-02-02' , 1, '08h00', '08h30', '18h00', 6, 'a23'),
('2016-03-23' , 1, '08h00', '08h30', '17h00', 6, 'a23'),
('2016-04-23' , 1, '05h00', '07h30', '14h00', 6, 'a23'),
('2017-02-02' , 0, '08h00', '08h30', '09h00', 7, 'a17'),
('2017-02-02' , 0, '13h59', '14h00', '18h00', 7, 'a17');

-- ----------------------------------------------------------
