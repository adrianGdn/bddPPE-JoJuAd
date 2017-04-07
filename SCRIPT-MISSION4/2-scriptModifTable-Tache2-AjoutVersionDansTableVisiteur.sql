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
