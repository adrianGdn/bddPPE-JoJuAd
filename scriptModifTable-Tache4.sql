--
-- Ajout d'une nouvelle colonne qui contiendra les mdp non crypté la table `Acteur`
--

ALTER TABLE `acteur`
ADD `oldMdp` char(20);

-- --------------------------------------------------------

--
-- On met les mdp des acteurs dans la colonne oldMdp de la table `Acteur`
--

UPDATE `acteur` SET `oldMdp` = `mdp`;

-- --------------------------------------------------------

--
-- On augmente la taille de la colonne mdp de la table `Acteur`
--

ALTER TABLE `acteur`
MODIFY `mdp` CHAR(100);

-- --------------------------------------------------------

--
-- On crypte les mdp de la table `Acteur`
-- Attention la base de donnée doit être en "utf8mb4_unicode_ci" au niveau de l'interclassement
--

UPDATE `acteur` SET `mdp` = sha1(`oldMdp`);

-- --------------------------------------------------------
