-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 13 jan. 2020 à 15:01
-- Version du serveur :  8.0.18
-- Version de PHP : 7.3.11-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `eventcode`
--

-- --------------------------------------------------------

--
-- Structure de la table `billet`
--

CREATE TABLE `billet` (
  `id` int(10) UNSIGNED NOT NULL,
  `scan_nb` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `date_scan` timestamp NULL DEFAULT NULL,
  `qr_code` blob,
  `id_client` int(10) UNSIGNED DEFAULT NULL,
  `date_ajout_panier` timestamp NULL DEFAULT NULL,
  `date_achat` timestamp NULL DEFAULT NULL,
  `nb_personne` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `id_categorie` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `billet`
--

INSERT INTO `billet` (`id`, `scan_nb`, `date_scan`, `qr_code`, `id_client`, `date_ajout_panier`, `date_achat`, `nb_personne`, `id_categorie`) VALUES
(1, 0, NULL, NULL, NULL, NULL, NULL, 1, 4),
(2, 0, NULL, NULL, NULL, NULL, NULL, 1, 2),
(3, 0, NULL, NULL, NULL, NULL, NULL, 10, 2),
(4, 0, NULL, NULL, NULL, NULL, NULL, 4, 2),
(5, 0, NULL, NULL, NULL, NULL, NULL, 1, 3),
(6, 0, NULL, NULL, NULL, NULL, NULL, 1, 4),
(7, 0, NULL, NULL, NULL, NULL, NULL, 1, 4),
(8, 0, NULL, NULL, NULL, NULL, NULL, 1, 5),
(9, 0, NULL, NULL, NULL, NULL, NULL, 1, 2),
(10, 0, NULL, NULL, 2, NULL, NULL, 1, 1),
(11, 0, NULL, NULL, 2, NULL, NULL, 1, 1),
(12, 0, NULL, NULL, 8, NULL, NULL, 1, 1),
(13, 0, NULL, NULL, 4, NULL, NULL, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) NOT NULL,
  `quantite_billet_depart` int(11) NOT NULL,
  `quantite_disponible` int(11) NOT NULL,
  `prix` decimal(6,2) NOT NULL,
  `id_evenement` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`, `quantite_billet_depart`, `quantite_disponible`, `prix`, `id_evenement`) VALUES
(1, 'Balcon', 200, 100, '10.00', 1),
(2, 'passe 2 jours', 200, 100, '10.00', 6),
(3, 'passe 3 jours', 200, 100, '10.00', 6),
(4, '1 er rang', 200, 100, '10.00', 7),
(5, 'passe or vip', 200, 100, '10.00', 7),
(6, 'pass par là', 200, 100, '10.00', 3);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(10) UNSIGNED NOT NULL,
  `mail` varchar(50) NOT NULL,
  `mot_de_passe` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `mail`, `mot_de_passe`) VALUES
(1, 'roger@gmail.com', 'roger'),
(2, 'fredo@gmail.com', 'fredo'),
(3, 'jackie@gmail.com', 'jackie'),
(4, 'michel@gmail.com', 'michel'),
(5, 'manu@gmail.com', 'manu'),
(6, 'dédé@gmail.com', 'dédé'),
(7, 'bahilestoupatrick@gmail.com', 'bahilestoupatrick'),
(8, 'wannyrelou@gmail.com', 'wannyrelou'),
(9, 'théodule@gmail.com', 'théodule'),
(10, 'mail@gmail.com', 'mdp');

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE `evenement` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_eventcode` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `evenement`
--

INSERT INTO `evenement` (`id`, `id_eventcode`, `nom`, `date_debut`, `date_fin`) VALUES
(1, 1, 'Terre du Ons', '2020-01-01 14:20:18', '2020-01-24 14:20:18'),
(2, 3, 'le gros festival', '2019-11-04 14:20:18', '2019-12-13 14:20:18'),
(3, 2, 'le hellfesse', '2020-01-01 14:22:44', '2020-01-31 14:22:44'),
(4, 2, 'Le slam au chateau', '2017-09-15 07:20:43', '2020-01-15 14:20:43'),
(5, 3, 'Le clarison', '2020-03-06 14:20:43', '2020-03-27 14:20:43'),
(6, 1, 'Stupéslip', '2020-01-01 14:21:06', '2020-01-05 14:21:06'),
(7, 2, 'HoMyGod', '2020-01-13 14:21:06', '2020-01-16 14:21:06'),
(8, 3, 'Avant Les Boeufs', '2020-01-29 14:21:06', '2020-01-31 14:21:06');

-- --------------------------------------------------------

--
-- Structure de la table `eventcode`
--

CREATE TABLE `eventcode` (
  `id` int(10) UNSIGNED NOT NULL,
  `createur` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `mot_de_passe` varchar(50) NOT NULL,
  `rang` enum('Standard','Premium','Platinium') NOT NULL DEFAULT 'Standard',
  `derniere_connexion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `code_parain` varchar(50) DEFAULT NULL,
  `code_parainage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `eventcode`
--

INSERT INTO `eventcode` (`id`, `createur`, `email`, `mot_de_passe`, `rang`, `derniere_connexion`, `code_parain`, `code_parainage`) VALUES
(1, 'TerreDuOns', 'tdo@exemple.com', 'tdo', 'Platinium', '2020-01-13 13:17:32', NULL, 'bibi'),
(2, 'hellfesse', 'hellfesse@exemple.com', 'hell', 'Premium', '2020-01-13 13:18:23', NULL, 'hell'),
(3, 'les-vielles-charettes', 'charettes@exemple.com', 'charrettes', 'Standard', '2020-01-13 13:19:34', NULL, 'charette');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `billet`
--
ALTER TABLE `billet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `FK_billet_categorie_idx` (`id_categorie`),
  ADD KEY `FK_billet_client_idx` (`id_client`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `FK_categorie_evenement_idx` (`id_evenement`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Index pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `FK_evenement_eventcode_idx` (`id_eventcode`);

--
-- Index pour la table `eventcode`
--
ALTER TABLE `eventcode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `billet`
--
ALTER TABLE `billet`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `eventcode`
--
ALTER TABLE `eventcode`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `billet`
--
ALTER TABLE `billet`
  ADD CONSTRAINT `FK_billet_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id`),
  ADD CONSTRAINT `FK_billet_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`);

--
-- Contraintes pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `FK_categorie_evenement` FOREIGN KEY (`id_evenement`) REFERENCES `evenement` (`id`);

--
-- Contraintes pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `FK_evenement_eventcode` FOREIGN KEY (`id_eventcode`) REFERENCES `eventcode` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
