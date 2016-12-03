--
-- Création de la table `TypeActeur`
--

CREATE TABLE IF NOT EXISTS `typeacteur` (
  `id` int(11) NOT NULL auto_increment,
  `leTypeActeur` varchar(20) NOT NULL DEFAULT `Visiteur`,
  PRIMARY KEY (id),
) ENGINE=InnoDB;

-- --------------------------------------------------------


CREATE TABLE IF NOT EXISTS `fraisforfait` (
  `id` char(3) NOT NULL,
  `libelle` char(20) DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;FOREIGN KEY (`idFraisForfait`) REFERENCES fraisforfait(`id`)