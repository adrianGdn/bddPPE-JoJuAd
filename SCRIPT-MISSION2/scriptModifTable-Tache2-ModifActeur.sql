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
-- Ajout d'une colonne pour la table `Acteur`
--

ALTER TABLE `acteur`
ADD `idTypeActeur` int(11);

-- --------------------------------------------------------

--
-- Ajout de données dans la table `TypeActeur`
--

INSERT INTO `typeacteur` (`leTypeActeur`) VALUES
("Administrateur"),
("Visiteur"),
("Comptable");

-- --------------------------------------------------------

--
-- Ajout du type d'acteur dans la table `Acteur`
--

UPDATE `acteur` SET `idTypeActeur` = 2;

-- --------------------------------------------------------

--
-- On augmente la taille de la colonne mdp de la table `Acteur`
--

ALTER TABLE `acteur`
MODIFY `idTypeActeur` int(11) NOT NULL;

-- --------------------------------------------------------

--
-- Ajout d'une clé étrangère pour la table `Acteur`
--

ALTER TABLE `acteur`
ADD CONSTRAINT `FK_Acteur_TypeActeur` FOREIGN KEY (`idTypeActeur`) REFERENCES `typeacteur` (`id`);

-- --------------------------------------------------------
