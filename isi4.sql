-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 03 juin 2020 à 01:06
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `isi4`
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
  `comment` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `name` varchar(100) NOT NULL,
  `imagepath` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `discount` double(6,2) NOT NULL,
  `ratings` double(6,2) NOT NULL,
  `info` varchar(1000) DEFAULT NULL,
  `latitude` int(25) DEFAULT NULL,
  `longitude` int(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `restaurant`
--

INSERT INTO `restaurant` (`id_restaurant`, `name`, `imagepath`, `category`, `discount`, `ratings`, `info`, `latitude`, `longitude`) VALUES
(3, 'addik Restaurant', 'assets/images/addik.png', 'General', 20.00, 88.00, 'best restaurant for tacos...', NULL, NULL),
(4, 'O\'Tacos', 'assets/images/otacos.png', 'Tacos', 25.00, 95.00, NULL, NULL, NULL),
(5, 'Domino\'s Pizza', 'assets/images/dominos.png', 'Pizza', 15.00, 91.00, NULL, NULL, NULL),
(6, 'Escale Restaurant', 'assets/images/escale.jpg', 'General', 10.00, 92.00, NULL, NULL, NULL),
(7, 'Burger King', 'assets/images/burger.png', 'Burger', 12.00, 87.00, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `profile` varchar(50) NOT NULL,
  `reset` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `last_name`, `first_name`, `email`, `password`, `profile`, `reset`) VALUES
(1, 'El ouardani', 'Manal', 'manal@gmail.com', '123', 'User', 0),
(3, 'essadiki', 'rida', 'rida.essadiki@uir.ac.ma', '1234', 'User', 0),
(11, 'Benjaddi', 'Yassine', 'yacine@gmail.com', '123', 'User', 0),
(12, 'Syassi', 'ilyas', 'ilyas@gmail.com', '123', 'User', 0),
(13, 'Belbachir', 'Rania', 'rania@gmail.com', '123', 'User', 0),
(16, 'lwajdi', 'Ayoub', 'ayou@gmail.com', 'ayoub123', 'User', 0),
(17, '', 'amine', 'yas', '123', 'User', 0);

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
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_Reservation`),
  ADD KEY `fk_id` (`id_user`),
  ADD KEY `fk_id2` (`id_restaurant`);

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
  MODIFY `id_avis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_Reservation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `id_restaurant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avis`
--
ALTER TABLE `avis`
  ADD CONSTRAINT `fk_id_restaurant` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurant` (`id_restaurant`),
  ADD CONSTRAINT `fk_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_id` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `fk_id2` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurant` (`id_restaurant`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
