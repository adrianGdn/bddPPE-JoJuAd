--
-- Ajout d'une colonne pour la table `Acteur`
--

ALTER TABLE `acteur`
ADD `mail` varchar(50);

-- --------------------------------------------------------

--
-- Ajout de données dans la table `Acteur`
--

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

-- --------------------------------------------------------
