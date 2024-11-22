-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 20 nov. 2024 à 10:23
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `enchere_art`
--

-- --------------------------------------------------------

--
-- Structure de la table `administritateur`
--

CREATE TABLE `administritateur` (
  `mailAdmin` varchar(255) NOT NULL,
  `nom_Administrateur` varchar(255) NOT NULL,
  `prenom_Administrateur` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `artiste`
--

CREATE TABLE `artiste` (
  `mailArtiste` varchar(255) NOT NULL,
  `nom_Artiste` varchar(255) NOT NULL,
  `adresse_Artiste` varchar(255) NOT NULL,
  `photo_artiste` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `nom_categorie` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `mailClient` varchar(255) NOT NULL,
  `adresse_Client` varchar(255) NOT NULL,
  `nom_Client` varchar(255) NOT NULL,
  `prenom_Client` varchar(255) NOT NULL,
  `telephone_Client` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `IDcommentaire` varchar(255) NOT NULL,
  `texte` varchar(255) NOT NULL,
  `mailClient` varchar(255) NOT NULL,
  `IDoeuvre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contenu`
--

CREATE TABLE `contenu` (
  `IDcontenu` varchar(255) NOT NULL,
  `IDoeuvre` varchar(255) NOT NULL,
  `IDphoto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `enchere`
--

CREATE TABLE `enchere` (
  `IDenchere` varchar(255) NOT NULL,
  `date_debut` varchar(255) NOT NULL,
  `date_fin` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `expert`
--

CREATE TABLE `expert` (
  `mailExpert` varchar(255) NOT NULL,
  `nom_expert` varchar(255) NOT NULL,
  `prenom_expert` varchar(255) NOT NULL,
  `specialite` varchar(255) NOT NULL,
  `photo_expert` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `exposition`
--

CREATE TABLE `exposition` (
  `IDExposition` varchar(255) NOT NULL,
  `Nom_Exposition` varchar(255) NOT NULL,
  `date_fin` date NOT NULL,
  `date_debut` date NOT NULL,
  `mailAdmin` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oeuvre`
--

CREATE TABLE `oeuvre` (
  `IDoeuvre` varchar(255) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `annee_de_creation` varchar(255) NOT NULL,
  `type_art` varchar(255) NOT NULL,
  `classement` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `IDCategorie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `IDpaiement` varchar(255) NOT NULL,
  `quantite_argent` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

CREATE TABLE `participer` (
  `IDparticipation` varchar(255) NOT NULL,
  `date_participation` date NOT NULL,
  `heure_participation` varchar(255) NOT NULL,
  `prix_proposer` varchar(255) NOT NULL,
  `mailClient` varchar(255) NOT NULL,
  `IDenchere` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `photos`
--

CREATE TABLE `photos` (
  `IDphoto` varchar(255) NOT NULL,
  `photo` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rapport_expertise`
--

CREATE TABLE `rapport_expertise` (
  `IDexpertise` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `observation` varchar(255) NOT NULL,
  `mailExpert` varchar(255) NOT NULL,
  `mailAdmin` varchar(255) NOT NULL,
  `IDoeuvre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `administritateur`
--
ALTER TABLE `administritateur`
  ADD PRIMARY KEY (`mailAdmin`);

--
-- Index pour la table `artiste`
--
ALTER TABLE `artiste`
  ADD PRIMARY KEY (`mailArtiste`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`nom_categorie`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`mailClient`) USING BTREE;

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`IDcommentaire`),
  ADD KEY `mailClient` (`mailClient`);

--
-- Index pour la table `contenu`
--
ALTER TABLE `contenu`
  ADD PRIMARY KEY (`IDcontenu`),
  ADD KEY `IDoeuvre` (`IDoeuvre`),
  ADD KEY `IDphotos` (`IDphoto`);

--
-- Index pour la table `enchere`
--
ALTER TABLE `enchere`
  ADD PRIMARY KEY (`IDenchere`);

--
-- Index pour la table `expert`
--
ALTER TABLE `expert`
  ADD PRIMARY KEY (`mailExpert`);

--
-- Index pour la table `exposition`
--
ALTER TABLE `exposition`
  ADD PRIMARY KEY (`IDExposition`),
  ADD KEY `mailAdmin` (`mailAdmin`);

--
-- Index pour la table `oeuvre`
--
ALTER TABLE `oeuvre`
  ADD PRIMARY KEY (`IDoeuvre`),
  ADD KEY `Nom_Categorie` (`IDCategorie`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`IDpaiement`);

--
-- Index pour la table `participer`
--
ALTER TABLE `participer`
  ADD PRIMARY KEY (`IDparticipation`),
  ADD KEY `IDenchere` (`IDenchere`),
  ADD KEY `Mailclient` (`mailClient`);

--
-- Index pour la table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`IDphoto`);

--
-- Index pour la table `rapport_expertise`
--
ALTER TABLE `rapport_expertise`
  ADD PRIMARY KEY (`IDexpertise`),
  ADD KEY `mailAdmin` (`mailAdmin`),
  ADD KEY `mailExpert` (`mailExpert`),
  ADD KEY `IDoeuvre` (`IDoeuvre`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `commentaire_ibfk_1` FOREIGN KEY (`IDcommentaire`) REFERENCES `oeuvre` (`IDoeuvre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mailClient` FOREIGN KEY (`mailClient`) REFERENCES `client` (`mailClient`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `contenu`
--
ALTER TABLE `contenu`
  ADD CONSTRAINT `IDoeuvre` FOREIGN KEY (`IDoeuvre`) REFERENCES `oeuvre` (`IDoeuvre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `IDphotos` FOREIGN KEY (`IDphoto`) REFERENCES `photos` (`IDphoto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `exposition`
--
ALTER TABLE `exposition`
  ADD CONSTRAINT `exposition_ibfk_1` FOREIGN KEY (`IDExposition`) REFERENCES `administritateur` (`mailAdmin`);

--
-- Contraintes pour la table `oeuvre`
--
ALTER TABLE `oeuvre`
  ADD CONSTRAINT `Nom_Categorie` FOREIGN KEY (`IDCategorie`) REFERENCES `categorie` (`nom_categorie`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `participer`
--
ALTER TABLE `participer`
  ADD CONSTRAINT `IDenchere` FOREIGN KEY (`IDenchere`) REFERENCES `enchere` (`IDenchere`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participer_ibfk_1` FOREIGN KEY (`mailClient`) REFERENCES `client` (`mailClient`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `rapport_expertise`
--
ALTER TABLE `rapport_expertise`
  ADD CONSTRAINT `mailAdmin` FOREIGN KEY (`mailAdmin`) REFERENCES `administritateur` (`mailAdmin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mailExpert` FOREIGN KEY (`mailExpert`) REFERENCES `expert` (`mailExpert`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
