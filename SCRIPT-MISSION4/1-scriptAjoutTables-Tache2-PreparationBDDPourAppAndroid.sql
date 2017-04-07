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
