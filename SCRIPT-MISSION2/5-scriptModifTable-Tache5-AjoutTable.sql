--
-- Modification des description pour la table `LigneFraisForfait`
--

UPDATE `lignefraisforfait` SET `description` = 'Description 1';

-- --------------------------------------------------------

--
-- Ajout d'une colonne pour la table `LigneFraisForfait`
--

ALTER TABLE `lignefraisforfait`
ALTER COLUMN `montant` DECIMAL(10,0);

-- --------------------------------------------------------

--
-- On ajoute une colonne temporaire qui va contenir les montants de la colonne `montant`
-- Puis on va supprimer la colonne `montant` pour ensuite la recréer sans sa contrainte initiale
--

-- Ajout colonne
ALTER TABLE `lignefraisforfait`
ADD `montantTemp` DECIMAL(10,0);

-- On met les valeurs de `montant` dans `montantTemp`
UPDATE `lignefraisforfait` SET `montantTemp` = `montant`;

-- On supprime `montant`
ALTER TABLE `lignefraisforfait` DROP COLUMN `montant`;


-- On recréée `montant`
ALTER TABLE `lignefraisforfait`
ADD `montant` DECIMAL(10,0);

-- On met les valeurs de `montantTemp` dans `montant`
UPDATE `lignefraisforfait` SET `montant` = `montantTemp`;

-- On supprime `montantTemp`
ALTER TABLE `lignefraisforfait` DROP COLUMN `montantTemp`;

-- --------------------------------------------------------

--
-- Ajout d'une colonne pour la table `LigneFraisForfait`
--

ALTER TABLE lignefraisforfait
ADD `dateFraisForfait` DATE NOT NULL;

-- --------------------------------------------------------

--
-- Ajout d'une colonne pour la table `LigneFraisForfait`
--

ALTER TABLE `lignefraisforfait`
ADD `description` VARCHAR(255);

-- --------------------------------------------------------
