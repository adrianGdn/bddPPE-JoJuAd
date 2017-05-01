--
-- Ajout de la colonne "montant" dans la table `LigneFraisForfait`
--

ALTER TABLE `lignefraisforfait` ADD `montant` DECIMAL(10) NOT NULL AFTER `quantite`;

-- --------------------------------------------------------

--
-- Ajout du TRIGGER modifmontant en UPDATE
--

CREATE TRIGGER `modifMontant` BEFORE UPDATE ON `lignefraisforfait` 
FOR EACH ROW SET NEW.montant = (SELECT fraisforfait.montant * NEW.quantite FROM fraisforfait 
WHERE fraisforfait.id = NEW.idFraisForfait);

-- --------------------------------------------------------

--
-- Ajout du TRIGGER modifmontant en INSERT
--
CREATE TRIGGER `modifMontantINSERT` BEFORE INSERT ON `lignefraisforfait` 
FOR EACH ROW SET NEW.montant = (SELECT fraisforfait.montant * NEW.quantite FROM fraisforfait 
WHERE fraisforfait.id = NEW.idFraisForfait);


-- --------------------------------------------------------

--
-- Test du TRIGGER
--

-- UPDATE `lignefraisforfait` SET `quantite` = '1'
-- WHERE `lignefraisforfait`.`idVisiteur` = 'a17' 
-- AND `lignefraisforfait`.`mois` = '201601' 
-- AND `lignefraisforfait`.`idFraisForfait` = 'ETP'

-- --------------------------------------------------------
