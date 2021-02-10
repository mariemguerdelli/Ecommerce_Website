-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 19 jan. 2021 à 20:11
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `e_chry`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `user_id`, `name`, `firstname`, `lastname`, `company`, `address`, `postal`, `city`, `phone`) VALUES
(1, 1, 'adresse de mariem', 'mariem', 'guerdelli', 'poly', 'rue de l\'environnement', '5011', 'khniss-monastir-Tunisie', '+21622748967');

-- --------------------------------------------------------

--
-- Structure de la table `auction`
--

CREATE TABLE `auction` (
  `id` int(11) NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `auction`
--

INSERT INTO `auction` (`id`, `owner`, `bid`, `date`, `comment`, `product_id`, `slug`, `status`) VALUES
(14, 'mariem.guerdelli@gmail.com', 70, '2021-01-13 20:11:34', 'acheter', 19, 'pull-en-laine', 1),
(17, 'mariem.guerdelli@gmail.com', 90, '2021-01-19 13:48:28', 'j\'achete', 18, 'pull-texture', 1);

-- --------------------------------------------------------

--
-- Structure de la table `carrier`
--

CREATE TABLE `carrier` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'HOMME'),
(3, 'FEMME'),
(4, 'ENFANT'),
(5, 'MAISON'),
(6, 'test');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20201216202403', '2021-01-04 19:06:43', 1186),
('DoctrineMigrations\\Version20201216212331', '2021-01-04 19:06:44', 144),
('DoctrineMigrations\\Version20201219153630', '2021-01-04 19:06:44', 311),
('DoctrineMigrations\\Version20201219203654', '2021-01-04 19:06:45', 2113),
('DoctrineMigrations\\Version20201223221152', '2021-01-04 19:06:47', 1633),
('DoctrineMigrations\\Version20201224151704', '2021-01-04 19:06:48', 1755),
('DoctrineMigrations\\Version20201224155152', '2021-01-04 19:06:50', 4817),
('DoctrineMigrations\\Version20201227193256', '2021-01-04 19:06:55', 126),
('DoctrineMigrations\\Version20210101221303', '2021-01-04 19:06:55', 553),
('DoctrineMigrations\\Version20210105123233', '2021-01-05 13:33:06', 1127),
('DoctrineMigrations\\Version20210105142056', '2021-01-05 15:21:05', 972),
('DoctrineMigrations\\Version20210105143627', '2021-01-05 15:36:33', 376),
('DoctrineMigrations\\Version20210106125058', '2021-01-06 13:51:10', 3089),
('DoctrineMigrations\\Version20210108210615', '2021-01-08 22:06:23', 1059);

-- --------------------------------------------------------

--
-- Structure de la table `header`
--

CREATE TABLE `header` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `illustration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `header`
--

INSERT INTO `header` (`id`, `title`, `content`, `btn_title`, `btn_url`, `illustration`) VALUES
(1, 'nouvelle collection', 'Découvrir notre collection hiver 2020 crée par nos artisans et nos couteriers', 'Decouvrir', '/nos-produits', '457fe34afc242134afa10e95e7349651933293f2.jpg'),
(2, 'promotion', 'Découvrir toutes les offres promo de la rentrée sur E_chry', 'Decouvrir', '/nos-produits', 'a57ee1ff050ac89328576c6a9d9667ada8c84c81.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `carrier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_price` double NOT NULL,
  `delivery` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_paid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `my_order_id` int(11) NOT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `illustration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_best` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `slug`, `illustration`, `subtitle`, `description`, `price`, `owner`, `is_best`) VALUES
(9, 3, 'Robe imprimée', 'robe-imprimee', '928fbadd56f715784d3b88a81ef6c3057d84db2c.png', 'Robe imprimée  avec ceinture', 'Robe mi-longue à col rond et manches longues. Ceinture.', 13000, 'admin', 1),
(10, 3, 'Manteau', 'manteau', '948a39a72ebb3a9978c421e4ff0eb574097d366f.png', 'manteau avec ceinture', 'Manteau confectionné dans un tissu en mélange de laine. Col à revers et manches longues avec patte réglable par boutons. Poches avant. Bas avec fente à l\'arrière. Ceinture à nouer de même tissu. Fermeture à boutonnage croisé.', 20000, 'mariem.guerdelli@gmail.com', 1),
(11, 3, 'Veste en cuire', 'veste-en-cuire', '0610515ced9265a61f10227f136aa5f1f60daca1.png', 'veste rembourrée en cuir synthétique', 'Veste courte à col montant. Manches longues avec poignets élastiques. Poches latérales passepoilées. Ourlet réglable par cordons élastiques. Fermeture à l\'avant par zip et rabat à boutons-pression.', 15000, 'mariem.guerdelli@gmail.com', 1),
(12, 1, 'bottes en cuir', 'bottes-en-cuir', 'b79d72a5fe80c1241d1267f7fff920c90024f36c.png', 'bottes en cuir à semelles épaisses', 'Bottes en cuir à lacets noires. Laçage à sept passants et tirant à l\'arrière pour un chaussage facile. Semelle épaisse avec dessous cranté.', 15000, 'mariem.guerdelli@gmail.com', 1),
(13, 3, 'Tennis', 'tennis', '90ee7d9b6e5c00d6a93e3f471ff32902f0903464.png', 'Tennis avec empiècements et imprime animalier', 'Tennis multicolores. Tige bimatière avec empiècements à imprimé animalier sur les côtés et détails métallisés. Pièce effet gommé à l\'arrière. Semelles épaisses. Fermeture par lacets avec points en contraste de couleur.\r\nHauteur de la semelle 3,5 cm', 10000, 'mariem.guerdelli@gmail.com', 1),
(14, 3, 'Sweat a capuche', 'sweat-a-capuche', '15e998f39931a12a3bc8ba2d5e05323efa8d8439.png', 'Sweat a capuche en maille', 'Sweat à col montant avec capuche réglable par cordon et manches longues bouffantes.', 5000, 'aya.benothmenn@gmail.com', 0),
(15, 3, 'Sac bandoulière', 'sac-bandouliere', '471d03b712427fbebefddf594856031d0841371b.png', 'Sac bandoulière a chaine', 'Sac bandoulière disponible en plusieurs couleurs. Partie principale avec imprimé animalier. Détail maxi chaîne sur le rabat. Poignée. Bandoulière avec chaîne. Doublure avec emplacement pour les cartes. Fermeture aimantée.\r\nHauteur x Largeur x Profondeur', 10000, 'aya.benothmenn@gmail.com', 0),
(16, 1, 'blouson effet mouton', 'blouson-effet-mouton', '232ed081cb2c9962be73f9ea7b6919b15dbc33e4.png', 'blouson  en matières variées effet mouton', 'Manteau avec col à revers et manches longues. Poches avant passepoilées. Doublure et col en tissu effet mouton en contraste. Bas réglable par cordon. Fermeture avant par bouton-pression.', 10000, 'aya.benothmenn@gmail.com', 1),
(17, 1, 'Blouson bomber', 'blouson-bomber', 'e0ce2dd27a325718f8a6b1496b776d6cc499e7c0.png', 'Blouson bomber  à col amovible', 'Blouson avec col à revers amovible, manches longues et manchettes côtelées. Poches passepoilées sur les hanches et poche intérieure. Bas élastique. Fermeture par zip sur le devant.', 12000, 'aya.benothmenn@gmail.com', 1),
(18, 1, 'Pull texturé', 'pull-texture', 'ab68e7dcf1f5e85619fff26f73ba9bfd95ed229f.png', 'Pull texturé  en fausse fourrure', 'Pull à col rond et manches longues. Finitions côtelées.', 8000, 'aya.benothmenn@gmail.com', 0),
(19, 1, 'Pull en laine', 'pull-en-laine', '66e94dee8c79a55cbae363be8d8586f877b64a76.png', 'Pull en laine mérinos', 'Pull large en fil de laine. Col rond et manches longues. Finitions côtelées.', 6000, 'aya.benothmenn@gmail.com', 1);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password`
--

CREATE TABLE `reset_password` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reset_password`
--

INSERT INTO `reset_password` (`id`, `user_id`, `token`, `created_at`) VALUES
(1, 1, '5ff5b3d6c776b', '2021-01-06 13:57:58'),
(2, 1, '5ff5b447eb333', '2021-01-06 13:59:51'),
(3, 1, '5ff5b81e32d5a', '2021-01-06 14:16:14'),
(4, 1, '5ff5b84e3cc32', '2021-01-06 14:17:02'),
(5, 1, '5ff5b9039691b', '2021-01-06 14:20:03'),
(6, 1, '5ff5be8241b9f', '2021-01-06 14:43:30'),
(7, 1, '5ff5be9694ca2', '2021-01-06 14:43:50'),
(8, 1, '5ff5bee949d3d', '2021-01-06 14:45:13'),
(9, 1, '5ff5bf4e2597b', '2021-01-06 14:46:54'),
(10, 1, '5ff5bfad2f5a4', '2021-01-06 14:48:29'),
(11, 1, '5ff5c05438504', '2021-01-06 14:51:16'),
(12, 1, '5ff5c0a9e1db0', '2021-01-06 14:52:41'),
(13, 1, '5ff5c4e0efb0f', '2021-01-06 15:10:40'),
(14, 1, '5ff5cad434aef', '2021-01-06 15:36:04'),
(15, 1, '5ff8c859da34b', '2021-01-08 22:02:17'),
(16, 1, '5ffdba40d1a72', '2021-01-12 16:03:28'),
(17, 1, '5ffdc86726a96', '2021-01-12 17:03:51'),
(18, 1, '6006b72ee8587', '2021-01-19 11:40:46'),
(19, 1, '6006d31ada48c', '2021-01-19 13:39:54');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES
(1, 'mariem.guerdelli@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$VUtZQWRqcFQxMHE0SHRtUg$E8w5B6r2pAs9D51d+sSGiazhAL/N50ZcX3AjBIR9CqA', 'mariem', 'guerdelli'),
(2, 'aya.benothmenn@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$N2djWjFWR29jcGU5dW8yMw$641wKVAkJsu4vKDSSTO6F63pjRQS7Lv+qR4h9YXiRP4', 'aya', 'benothmen'),
(3, 'amelie.duval@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$cHFnTEZkQ095VkhabTJIOA$zcoaMvCL81nxMOTkBU+dAXKeiRNKAQ0zAiK8mjHTsOQ', 'amelie', 'duval'),
(4, 'imed.boudriga@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$eW04dVVPUEJkMXRkLlJYYQ$Dx/lIukkXe7xD2LnXgDkvOm/appSwHOgob9a182LU9s', 'imed', 'boudriga');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D4E6F81A76ED395` (`user_id`);

--
-- Index pour la table `auction`
--
ALTER TABLE `auction`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `carrier`
--
ALTER TABLE `carrier`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `header`
--
ALTER TABLE `header`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398A76ED395` (`user_id`);

--
-- Index pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_845CA2C1BFCDF877` (`my_order_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Index pour la table `reset_password`
--
ALTER TABLE `reset_password`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B9983CE5A76ED395` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `auction`
--
ALTER TABLE `auction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `carrier`
--
ALTER TABLE `carrier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `header`
--
ALTER TABLE `header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `reset_password`
--
ALTER TABLE `reset_password`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_D4E6F81A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_845CA2C1BFCDF877` FOREIGN KEY (`my_order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `reset_password`
--
ALTER TABLE `reset_password`
  ADD CONSTRAINT `FK_B9983CE5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
