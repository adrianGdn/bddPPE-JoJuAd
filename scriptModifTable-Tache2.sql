--
-- Création de la table `TypeActeur`
--

CREATE TABLE IF NOT EXISTS `typeacteur` (
  `id` int(11) NOT NULL auto_increment,
  `leTypeActeur` varchar(20),
  PRIMARY KEY (id)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Changement du nom de la table
--

ALTER TABLE `visiteur`
RENAME TO `acteur`;

-- --------------------------------------------------------

--
-- Ajout d'une clé étrangère pour la table `acteur`
--

ALTER TABLE `acteur`
ADD `idTypeActeur` int(11);

ALTER TABLE `acteur`
ADD CONSTRAINT `FK_Acteur_TypeActeur` FOREIGN KEY (`idTypeActeur`) REFERENCES `typeacteur` (`id`);

-- --------------------------------------------------------

--
-- Ajout de données dans la table `TypeActeur`
--

INSERT INTO `typeacteur` (`leTypeActeur`) VALUES
("Visiteur"),
("Comptable"),
("Administrateur");

-- --------------------------------------------------------

--
-- Ajout du type d'acteur dans la table `Acteur`
--

UPDATE `acteur` SET `idTypeActeur` = 1;

-- --------------------------------------------------------
