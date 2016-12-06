-- Ajout de la colonne "montant" dans la table lignefraisforfait

ALTER TABLE `lignefraisforfait` ADD `montant` DECIMAL(10) NOT NULL AFTER `quantite`;

-- Ajout du TRIGGER

CREATE TRIGGER `modifMontant` AFTER UPDATE ON `lignefraisforfait` FOR EACH ROW
UPDATE lignefraisforfait
SET lignefraisforfait.montant = fraisforfait.montant * lignefraisforfait.quantite
WHERE fraisforfait.id = lignefraisforfait.idFraisForfait

-- Test du TRIGGER

UPDATE `lignefraisforfait` SET `quantite` = '1'
WHERE `lignefraisforfait`.`idVisiteur` = 'a17' 
AND `lignefraisforfait`.`mois` = '201601' 
AND `lignefraisforfait`.`idFraisForfait` = 'ETP'
