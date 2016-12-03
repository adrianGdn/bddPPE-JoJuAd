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
-- Ajout de données
--

INSERT INTO `typeacteur` (`leTypeActeur`) VALUES
("Visiteur"),
("Comptable"),
("Administrateur");

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
ADD `leTypeActeur` varchar(20) NOT NULL;

ALTER TABLE acteur 
ADD CONSTRAINT FK_Acteur_TypeActeur 
FOREIGN KEY (leTypeActeur) 
REFERENCES typeacteur(leTypeActeur);