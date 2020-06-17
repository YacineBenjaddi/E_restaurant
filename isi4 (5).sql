-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mer. 17 juin 2020 à 03:56
-- Version du serveur :  10.4.8-MariaDB
-- Version de PHP :  7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `isi4`
--

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

CREATE TABLE `avis` (
  `id_avis` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_restaurant` int(11) NOT NULL,
  `note` int(11) NOT NULL,
  `avis` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `title` varchar(25) DEFAULT NULL,
  `texto` varchar(25) DEFAULT NULL,
  `name` varchar(25) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `id_restaurant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `title`, `texto`, `name`, `rating`, `id_restaurant`) VALUES
(1, 'sad', 'im upset of the service', 'reda', 2, 1),
(2, 'happy', 'i love the restaurants ', 'natalie', 4, 2),
(4, 'happy', 'nice restaurant', 'jalal', 3, 3),
(5, 'joy', 'i love the service', 'rida.essadiki@uir.ac.ma', 5, 2),
(6, 'happy', 'nice service!!', 'rida.essadiki@uir.ac.ma', 5, 1),
(7, 'upset', 'the food is cold', 'rida.essadiki@uir.ac.ma', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id_Reservation` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_restaurant` int(11) NOT NULL,
  `heure` varchar(10) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `restaurant`
--

CREATE TABLE `restaurant` (
  `id_restaurant` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `imagepath` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `discount` double(6,2) DEFAULT NULL,
  `ratings` double(6,2) DEFAULT NULL,
  `info` varchar(1000) DEFAULT NULL,
  `latitude` double(16,6) DEFAULT NULL,
  `longitude` double(16,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `restaurant`
--

INSERT INTO `restaurant` (`id_restaurant`, `name`, `imagepath`, `category`, `discount`, `ratings`, `info`, `latitude`, `longitude`) VALUES
(1, 'Addik restaurant', 'assets/images/coffee-cup.png', 'fast food', 20.00, 88.00, 'CUISINES:Française, Européenne, Méditerranéenne.                           RÉGIMES SPÉCIAUX:Végétariens bienvenus.REPAS:Déjeuner, Dîner, Ouvert tard.                                                          FONCTIONNALITÉS:                              Réservations, Terrasse, Places assises, Accès personnes handicapées, Sert de lalcool.', 34.000000, -6.000000),
(2, 'Burger King', 'assets/images/cheeseburger.png', 'Burger', 12.00, 87.00, NULL, 0.000000, 0.000000),
(3, 'Dominos Pizza', 'assets/images/dominos.png', 'Pizza', 15.00, 91.00, '', 0.000000, 0.000000),
(4, 'Escale', 'assets/images/escale.jpg', 'General', 10.00, 92.00, '', 0.000000, 0.000000),
(5, 'OTacos', 'assets/images/otacos.png', 'Tacos', 25.00, 95.00, '', 0.000000, 0.000000),
(6, 'test', 'assets/images/cupcake.png', 'kkk', 67.00, 9.00, 'null', 67.000000, 98.000000);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `profile` varchar(50) NOT NULL,
  `reset` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `email`, `last_name`, `first_name`, `password`, `profile`, `reset`) VALUES
(1, 'ilias.siassi@uir.ac.ma', 'siassi', 'ilias', '123456', 'User', 0),
(2, 'manal.elouardani@uir.ac.ma', 'El ouardani', 'Manal', '123456', 'User', 0),
(3, 'rania.belbachir@uir.ac.ma', 'belbachir', 'rania', '123456', 'User', 0),
(4, 'rida.essadiki@uir.ac.ma', 'essadiki', 'rida', '123456', 'User', 0),
(5, 'yassin.benjeddi@uir.ac.ma', 'benjeddi', 'yassin', '123456', 'User', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `avis`
--
ALTER TABLE `avis`
  ADD PRIMARY KEY (`id_avis`),
  ADD KEY `fk_id_user` (`id_user`),
  ADD KEY `fk_id_restaurant` (`id_restaurant`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_restaurant` (`id_restaurant`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_Reservation`);

--
-- Index pour la table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`id_restaurant`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `avis`
--
ALTER TABLE `avis`
  MODIFY `id_avis` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_Reservation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `id_restaurant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurant` (`id_restaurant`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
