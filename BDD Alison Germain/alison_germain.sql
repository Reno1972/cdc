-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 21 jan. 2022 à 12:26
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `alison_germain`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresses_livraisons`
--

CREATE TABLE `adresses_livraisons` (
  `id_adresse_livraison` int(11) NOT NULL,
  `nom_ville` varchar(100) NOT NULL,
  `societe` varchar(150) NOT NULL,
  `adresse` varchar(250) NOT NULL,
  `code_postal` int(11) NOT NULL,
  `ville_livraison` varchar(100) NOT NULL,
  `pays` varchar(50) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `id_utilisateur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `agendas`
--

CREATE TABLE `agendas` (
  `id_agenda` int(11) NOT NULL,
  `nom_agenda` varchar(100) NOT NULL,
  `date_heure_agenda` datetime NOT NULL,
  `id_evennement` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id_commande` int(11) NOT NULL,
  `date_heure_commande` datetime NOT NULL,
  `adresse_livraison_commande` varchar(250) NOT NULL,
  `transporteur_commande` varchar(50) NOT NULL,
  `prix_transport_commande` decimal(15,2) NOT NULL,
  `payee` tinyint(1) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `evennements`
--

CREATE TABLE `evennements` (
  `id_evennement` int(11) NOT NULL,
  `nom_evennement` varchar(100) NOT NULL,
  `date_heure_evennement` datetime NOT NULL,
  `detail_evennement` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `lignes_commande`
--

CREATE TABLE `lignes_commande` (
  `produit_ligne` varchar(150) DEFAULT NULL,
  `quantite_ligne` int(11) DEFAULT NULL,
  `prix_ligne` decimal(15,2) DEFAULT NULL,
  `id_commande` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id_role` int(11) NOT NULL,
  `nom_role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `transporteurs`
--

CREATE TABLE `transporteurs` (
  `id_transporteur` int(11) NOT NULL,
  `nom_transporteur` varchar(100) NOT NULL,
  `information_transporteur` varchar(150) NOT NULL,
  `prix_transporteur` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id_utilisateur` int(11) NOT NULL,
  `nom_utilisateur` varchar(100) NOT NULL,
  `prenom_vendeur` varchar(100) NOT NULL,
  `ville_utilisateur` varchar(100) NOT NULL,
  `mail_utilisateur` varchar(100) NOT NULL,
  `password_utilisateur` varchar(120) NOT NULL,
  `id_role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresses_livraisons`
--
ALTER TABLE `adresses_livraisons`
  ADD PRIMARY KEY (`id_adresse_livraison`),
  ADD KEY `fk_utilisateurs_livraisons` (`id_utilisateur`);

--
-- Index pour la table `agendas`
--
ALTER TABLE `agendas`
  ADD PRIMARY KEY (`id_agenda`),
  ADD KEY `fk_evennements_agendas` (`id_evennement`),
  ADD KEY `fk_utilisateurs_agendas` (`id_utilisateur`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `fk_utilisateurs_commandes` (`id_utilisateur`);

--
-- Index pour la table `evennements`
--
ALTER TABLE `evennements`
  ADD PRIMARY KEY (`id_evennement`);

--
-- Index pour la table `lignes_commande`
--
ALTER TABLE `lignes_commande`
  ADD KEY `fk_commandes_lignes_commande` (`id_commande`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_role`);

--
-- Index pour la table `transporteurs`
--
ALTER TABLE `transporteurs`
  ADD PRIMARY KEY (`id_transporteur`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD KEY `fk_roles_utilisateurs` (`id_role`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adresses_livraisons`
--
ALTER TABLE `adresses_livraisons`
  MODIFY `id_adresse_livraison` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `agendas`
--
ALTER TABLE `agendas`
  MODIFY `id_agenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `evennements`
--
ALTER TABLE `evennements`
  MODIFY `id_evennement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `transporteurs`
--
ALTER TABLE `transporteurs`
  MODIFY `id_transporteur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresses_livraisons`
--
ALTER TABLE `adresses_livraisons`
  ADD CONSTRAINT `fk_utilisateurs_livraisons` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id_utilisateur`);

--
-- Contraintes pour la table `agendas`
--
ALTER TABLE `agendas`
  ADD CONSTRAINT `fk_evennements_agendas` FOREIGN KEY (`id_evennement`) REFERENCES `evennements` (`id_evennement`),
  ADD CONSTRAINT `fk_utilisateurs_agendas` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id_utilisateur`);

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `fk_utilisateurs_commandes` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id_utilisateur`);

--
-- Contraintes pour la table `lignes_commande`
--
ALTER TABLE `lignes_commande`
  ADD CONSTRAINT `fk_commandes_lignes_commande` FOREIGN KEY (`id_commande`) REFERENCES `commandes` (`id_commande`);

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `fk_roles_utilisateurs` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
