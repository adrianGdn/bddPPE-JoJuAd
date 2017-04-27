--
-- Modification des types d'acteur pour la table `Acteur`
--

UPDATE `acteur` SET `idTypeActeur` = 1 WHERE `id` = 'b34';
UPDATE `acteur` SET `idTypeActeur` = 1 WHERE `id` = 'f4';
UPDATE `acteur` SET `idTypeActeur` = 3 WHERE `id` = 'a131';
UPDATE `acteur` SET `idTypeActeur` = 3 WHERE `id` = 'f39';

-- --------------------------------------------------------

--
-- Ajout d'un administrateur dans la table `Acteur`
--

INSERT INTO `acteur` (`id`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `cp`, `ville`, `dateEmbauche`, `idTypeActeur`) VALUES
('admi', 'Administrateur', 'Administrateur', 'admin', 'AzertY!59000', '101 rue National', '59000', 'Lille', '2017-01-03', 1);

-- --------------------------------------------------------
