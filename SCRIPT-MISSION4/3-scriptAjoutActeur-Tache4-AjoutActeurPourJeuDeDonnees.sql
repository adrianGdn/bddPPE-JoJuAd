--
-- Ajout d'acteur pour la table `acteur`
--

INSERT INTO `acteur`(`id`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `cp`, `ville`, `dateEmbauche`, `idTypeActeur`, `oldMdp`, `mail`, `version`) VALUES 
('e32', 'Mouttier', 'Robert', 'rmout', '12e9293ec6b30c7fa8a0926af42807e929c1684f', '32 rue des Trois Boudins', '10000', 'Valtordu', '1500-03-02', 2, 'robert', 'robert.mouttier@gsb.com', 0),
('a23', 'Cavrois', 'Benoît', 'bcavrois', 'ada67ac5f4f919afa4024d1d760165aba9b2aff0', '101 rue Nationale', '59000', 'Lille', '2017-02-21', 3, 'pamplemousse', 'benoit.cavrois@gsb.com', 0),
('d42', 'Dubus', 'Alexis', 'adubus', '175d5773e1877cbf47d25d1cc8e91b22e342638e', '42 rue du Trou Paumé', '59126', 'Lincelle', '2016-12-31', 1, 'saucissons', 'alexis.dubus@gsb.com', 0);

-- ----------------------------------------------------------