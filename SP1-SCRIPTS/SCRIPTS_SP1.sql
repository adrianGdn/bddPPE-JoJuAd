-- --------------------------------------------------------
-- phpMyAdmin SQL
-- http://www.phpmyadmin.net
-- --------------------------------------------------------

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données : `gsbapplifrais`
--

-- --------------------------------------------------------

--
-- Structure de la table `FraisForfait`
--

CREATE TABLE IF NOT EXISTS `fraisforfait` (
  `id` char(3) NOT NULL,
  `libelle` char(20) DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Structure de la table `Etat`
--

CREATE TABLE IF NOT EXISTS `etat` (
  `id` char(2) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Structure de la table `Visiteur`
--

CREATE TABLE IF NOT EXISTS `visiteur` (
  `id` char(4) NOT NULL,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30)  DEFAULT NULL, 
  `login` char(20) DEFAULT NULL,
  `mdp` char(20) DEFAULT NULL,
  `adresse` char(30) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` char(30) DEFAULT NULL,
  `dateEmbauche` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Structure de la table `FicheFrais`
--

CREATE TABLE IF NOT EXISTS `fichefrais` (
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `nbJustificatifs` int(11) DEFAULT NULL,
  `montantValide` decimal(10,2) DEFAULT NULL,
  `dateModif` date DEFAULT NULL,
  `idEtat` char(2) DEFAULT 'CR',
  PRIMARY KEY (`idVisiteur`,`mois`),
  FOREIGN KEY (`idEtat`) REFERENCES etat(`id`),
  FOREIGN KEY (`idVisiteur`) REFERENCES visiteur(`id`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Structure de la table `LigneFraisForfait`
--

CREATE TABLE IF NOT EXISTS `lignefraisforfait` (
  `id` int(11) NOT NULL auto_increment,
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `idFraisForfait` char(3) NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`idVisiteur`, `mois`) REFERENCES fichefrais(`idVisiteur`, `mois`),
  FOREIGN KEY (`idFraisForfait`) REFERENCES fraisforfait(`id`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Structure de la table `LigneFraisHorsForfait`
--

CREATE TABLE IF NOT EXISTS `lignefraishorsforfait` (
  `id` int(11) NOT NULL auto_increment,
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (`idVisiteur`, `mois`) REFERENCES fichefrais(`idVisiteur`, `mois`)
) ENGINE=InnoDB;

-- --------------------------------------------------------
-- --------------------------------------------------------

--
-- Contenu de la table `FraisForfait`
--

INSERT INTO `fraisforfait` (`id`, `libelle`, `montant`) VALUES
('ETP', 'Forfait Etape', 110.00),
('KM', 'Frais Kilométrique', 0.62),
('NUI', 'Nuitée Hôtel', 80.00),
('REP', 'Repas Restaurant', 25.00);
--
-- Contenu de la table `LigneFraisForfait`
--

--
-- Contenu de la table `Etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
('RB', 'Remboursée'),
('CL', 'Saisie clôturée'),
('CR', 'Fiche créée, saisie en cours'),
('VA', 'Validée et mise en paiement');

-- --------------------------------------------------------

--
-- Contenu de la table `Visiteur`
--

INSERT INTO `visiteur` (`id`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `cp`, `ville`, `dateEmbauche`) VALUES
('a131', 'Villechalane', 'Louis', 'lvillachane', 'jux7g', '8 rue des Charmes', '46000', 'Cahors', '2005-12-21'),
('a17', 'Andre', 'David', 'dandre', 'oppg5', '1 rue Petit', '46200', 'Lalbenque', '1998-11-23'),
('a55', 'Bedos', 'Christian', 'cbedos', 'gmhxd', '1 rue Peranud', '46250', 'Montcuq', '1995-01-12'),
('a93', 'Tusseau', 'Louis', 'ltusseau', 'ktp3s', '22 rue des Ternes', '46123', 'Gramat', '2000-05-01'),
('b13', 'Bentot', 'Pascal', 'pbentot', 'doyw1', '11 allée des Cerises', '46512', 'Bessines', '1992-07-09'),
('b16', 'Bioret', 'Luc', 'lbioret', 'hrjfs', '1 Avenue gambetta', '46000', 'Cahors', '1998-05-11'),
('b19', 'Bunisset', 'Francis', 'fbunisset', '4vbnd', '10 rue des Perles', '93100', 'Montreuil', '1987-10-21'),
('b25', 'Bunisset', 'Denise', 'dbunisset', 's1y1r', '23 rue Manin', '75019', 'Paris', '2010-12-05'),
('b28', 'Cacheux', 'Bernard', 'bcacheux', 'uf7r3', '114 rue Blanche', '75017', 'Paris', '2009-11-12'),
('b34', 'Cadic', 'Eric', 'ecadic', '6u8dc', '123 avenue de la République', '75011', 'Paris', '2008-09-23'),
('b4', 'Charoze', 'Catherine', 'ccharoze', 'u817o', '100 rue Petit', '75019', 'Paris', '2005-11-12'),
('b50', 'Clepkens', 'Christophe', 'cclepkens', 'bw1us', '12 allée des Anges', '93230', 'Romainville', '2003-08-11'),
('b59', 'Cottin', 'Vincenne', 'vcottin', '2hoh9', '36 rue Des Roches', '93100', 'Monteuil', '2001-11-18'),
('c14', 'Daburon', 'François', 'fdaburon', '7oqpv', '13 rue de Chanzy', '94000', 'Créteil', '2002-02-11'),
('c3', 'De', 'Philippe', 'pde', 'gk9kx', '13 rue Barthes', '94000', 'Créteil', '2010-12-14'),
('c54', 'Debelle', 'Michel', 'mdebelle', 'od5rt', '181 avenue Barbusse', '93210', 'Rosny', '2006-11-23'),
('d13', 'Debelle', 'Jeanne', 'jdebelle', 'nvwqq', '134 allée des Joncs', '44000', 'Nantes', '2000-05-11'),
('d51', 'Debroise', 'Michel', 'mdebroise', 'sghkb', '2 Bld Jourdain', '44000', 'Nantes', '2001-04-17'),
('e22', 'Desmarquest', 'Nathalie', 'ndesmarquest', 'f1fob', '14 Place d Arc', '45000', 'Orléans', '2005-11-12'),
('e24', 'Desnost', 'Pierre', 'pdesnost', '4k2o5', '16 avenue des Cèdres', '23200', 'Guéret', '2001-02-05'),
('e39', 'Dudouit', 'Frédéric', 'fdudouit', '44im8', '18 rue de l église', '23120', 'GrandBourg', '2000-08-01'),
('e49', 'Duncombe', 'Claude', 'cduncombe', 'qf77j', '19 rue de la tour', '23100', 'La souteraine', '1987-10-10'),
('e5', 'Enault-Pascreau', 'Céline', 'cenault', 'y2qdu', '25 place de la gare', '23200', 'Gueret', '1995-09-01'),
('e52', 'Eynde', 'Valérie', 'veynde', 'i7sn3', '3 Grand Place', '13015', 'Marseille', '1999-11-01'),
('f21', 'Finck', 'Jacques', 'jfinck', 'mpb3t', '10 avenue du Prado', '13002', 'Marseille', '2001-11-10'),
('f39', 'Frémont', 'Fernande', 'ffremont', 'xs5tq', '4 route de la mer', '13012', 'Allauh', '1998-10-01'),
('f4', 'Gest', 'Alain', 'agest', 'dywvt', '30 avenue de la mer', '13025', 'Berre', '1985-11-01');
-- --------------------------------------------------------

-- --------------------------------------------------------
-- --------------------------------------------------------

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

--
-- DROP de la foreign key sur ligneFraisForfait
--

ALTER TABLE lignefraisforfait DROP FOREIGN KEY lignefraisforfait_ibfk_2;

-- --------------------------------------------------------

-- --------------------------------------------------------
-- --------------------------------------------------------

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

-- --------------------------------------------------------
-- --------------------------------------------------------

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

-- --------------------------------------------------------
-- --------------------------------------------------------

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

-- --------------------------------------------------------
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

--
-- Modification des description pour la table `LigneFraisForfait`
--

UPDATE `lignefraisforfait` SET `description` = 'Description 1';

-- --------------------------------------------------------

-- --------------------------------------------------------
-- --------------------------------------------------------

--
-- Ajout d'une colonne pour la table `Acteur`
--

ALTER TABLE `acteur`
ADD `mail` varchar(50);

-- --------------------------------------------------------

--
-- Ajout de données dans la table `Acteur`
--

-- a refaire via procédure stockée

UPDATE `acteur` SET `mail` = 'louis.villechalane@gsb.com' WHERE `id` = 'a131';
UPDATE `acteur` SET `mail` = 'david.andre@gsb.com' WHERE `id` = 'a17';
UPDATE `acteur` SET `mail` = 'christian.bedos@gsb.com' WHERE `id` = 'a55';
UPDATE `acteur` SET `mail` = 'louis.tusseau@gsb.com' WHERE `id` = 'a93';
UPDATE `acteur` SET `mail` = 'pascal.bentot@gsb.com' WHERE `id` = 'b13';
UPDATE `acteur` SET `mail` = 'luc.bioret@gsb.com' WHERE `id` = 'b16';
UPDATE `acteur` SET `mail` = 'francis.bunisset@gsb.com' WHERE `id` = 'b19';
UPDATE `acteur` SET `mail` = 'denise.bunisset@gsb.com' WHERE `id` = 'b25';
UPDATE `acteur` SET `mail` = 'bernard.cacheux@gsb.com' WHERE `id` = 'b28';
UPDATE `acteur` SET `mail` = 'eric.cadic@gsb.com' WHERE `id` = 'b34';
UPDATE `acteur` SET `mail` = 'catherine.charoze@gsb.com' WHERE `id` = 'b4';
UPDATE `acteur` SET `mail` = 'christophe.clepkens@gsb.com' WHERE `id` = 'b50';
UPDATE `acteur` SET `mail` = 'vincenne.cottin@gsb.com' WHERE `id` = 'b59';
UPDATE `acteur` SET `mail` = 'francois.daburon@gsb.com' WHERE `id` = 'c14';
UPDATE `acteur` SET `mail` = 'philippe.de@gsb.com' WHERE `id` = 'c3';
UPDATE `acteur` SET `mail` = 'michel.debelle@gsb.com' WHERE `id` = 'c54';
UPDATE `acteur` SET `mail` = 'jeanne.debelle@gsb.com' WHERE `id` = 'd13';
UPDATE `acteur` SET `mail` = 'michel.debroise@gsb.com' WHERE `id` = 'd51';
UPDATE `acteur` SET `mail` = 'nathalie.desmarquest@gsb.com' WHERE `id` = 'e22';
UPDATE `acteur` SET `mail` = 'pierre.desnost@gsb.com' WHERE `id` = 'e24';
UPDATE `acteur` SET `mail` = 'frederic.dudouit@gsb.com' WHERE `id` = 'e39';
UPDATE `acteur` SET `mail` = 'claude.duncombe@gsb.com' WHERE `id` = 'e49';
UPDATE `acteur` SET `mail` = 'celine.enault-pascreau@gsb.com' WHERE `id` = 'e5';
UPDATE `acteur` SET `mail` = 'valerie.eynde@gsb.com' WHERE `id` = 'e52';
UPDATE `acteur` SET `mail` = 'jacques.finck@gsb.com' WHERE `id` = 'f21';
UPDATE `acteur` SET `mail` = 'fremont.fernande@gsb.com' WHERE `id` = 'f39';
UPDATE `acteur` SET `mail` = 'alain.gest@gsb.com' WHERE `id` = 'f4';
UPDATE `acteur` SET `mail` = 'administrateur@gsb.com' WHERE `id` = 'admi';

-- CREATE PROCEDURE ajouteMail
-- DECLARE leMail varchar(50);
-- DECLARE lePrenom char(30);
-- DECLARE leNom char(30);

-- SET @leMail = 'SELECT `prenom` FROM `acteur`;' + '.' + 'SELECT `nom` FROM `acteur`;' + '@gsb.com'
-- PRINT @leMail;
-- Exec(@leMail)

-- EXEC ajouteMail;

-- --------------------------------------------------------

-- --------------------------------------------------------
-- --------------------------------------------------------

--
-- Ajout d'une colonne pour la table `Acteur`
--

ALTER TABLE `acteur`
ADD `questionSecrete` varchar(50);

-- --------------------------------------------------------

--
-- Ajout de données dans la table `Acteur`
--

UPDATE `acteur` SET `questionSecrete` = 'GSB';

-- --------------------------------------------------------
-- --------------------------------------------------------
-- --------------------------------------------------------
