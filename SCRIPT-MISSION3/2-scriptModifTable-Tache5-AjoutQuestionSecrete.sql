--
-- Ajout d'une colonne pour la table `Acteur`
--

ALTER TABLE `acteur`
ADD `questionSecrete` varchar(50);

-- --------------------------------------------------------

--
-- Ajout de donn�es dans la table `Acteur`
--

UPDATE `acteur` SET `questionSecrete` = 'GSB';
