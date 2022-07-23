-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 23 juil. 2022 à 10:03
-- Version du serveur : 8.0.21
-- Version de PHP : 8.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestioncac2`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `indice_tarif` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `created_at`, `updated_at`, `designation`, `indice_tarif`) VALUES
(1, NULL, NULL, 'TPE', '1.00'),
(2, NULL, NULL, 'PME', '1.75'),
(3, NULL, NULL, 'GE', '2.00');

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

DROP TABLE IF EXISTS `commentaires`;
CREATE TABLE IF NOT EXISTS `commentaires` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_commentaire` date NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `tache_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `commentaires_user_id_foreign` (`user_id`),
  KEY `commentaires_tache_id_foreign` (`tache_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commentaires`
--

INSERT INTO `commentaires` (`id`, `description`, `date_commentaire`, `user_id`, `tache_id`, `created_at`, `updated_at`) VALUES
(1, 'manque des factures d\'achat N°T002', '2021-11-14', 4, 1, '2021-11-14 08:21:36', '2021-12-15 08:32:20'),
(2, 'absence de la facture N°003 ,004 ,005 ainsi que la d10 de l\'importation numéro e5469', '2021-11-14', 4, 1, '2021-11-14 08:41:27', '2021-11-14 08:41:27'),
(5, 'teste commentaire', '2021-11-27', 4, 10, '2021-11-27 08:58:19', '2021-11-27 08:58:42'),
(6, 'd\'autres commentaires', '2021-11-27', 4, 10, '2021-11-27 08:58:58', '2021-11-27 08:58:58'),
(7, 'testa', '2021-11-28', 6, 1, '2021-11-28 09:56:35', '2021-11-28 10:28:00'),
(8, 'teste middleware', '2021-11-28', 3, 10, '2021-11-28 10:11:20', '2021-11-28 10:11:20'),
(9, 'teste admin', '2021-11-28', 4, 10, '2021-11-28 10:12:47', '2021-11-28 10:12:47'),
(10, 'random', '2021-11-28', 3, 1, '2021-11-28 10:27:45', '2021-11-28 10:27:45'),
(11, 'test', '2021-12-21', 4, 15, '2021-12-21 12:24:10', '2021-12-21 12:24:10'),
(12, 'fdghdfgdvcbcvbc', '2021-12-25', 4, 1, '2021-12-25 10:31:15', '2021-12-25 10:31:22'),
(13, 'fcgfgdfg', '2021-12-25', 7, 13, '2021-12-25 10:33:45', '2021-12-25 10:33:45'),
(14, 'absence de la facture 007 années 2020', '2022-01-07', 4, 17, '2022-01-07 20:56:06', '2022-01-07 20:56:06'),
(15, 'erreur au niveau du rapprochement bancaire', '2022-01-07', 4, 17, '2022-01-07 20:56:21', '2022-01-07 20:56:21'),
(16, 'teste', '2022-01-07', 3, 4, '2022-01-07 21:22:59', '2022-01-07 21:22:59');

-- --------------------------------------------------------

--
-- Structure de la table `conventions`
--

DROP TABLE IF EXISTS `conventions`;
CREATE TABLE IF NOT EXISTS `conventions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `mission_id` bigint UNSIGNED DEFAULT NULL,
  `date_convention` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `num_convention` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `conventions_mission_id_foreign` (`mission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `conventions`
--

INSERT INTO `conventions` (`id`, `mission_id`, `date_convention`, `created_at`, `updated_at`, `num_convention`) VALUES
(1, 1, '2021-11-08', '2021-11-08 22:29:00', '2021-11-08 22:29:00', 'CV21-001'),
(2, 2, '2021-11-09', '2021-11-09 15:49:17', '2021-11-09 15:49:17', 'CV21-002');

-- --------------------------------------------------------

--
-- Structure de la table `devis`
--

DROP TABLE IF EXISTS `devis`;
CREATE TABLE IF NOT EXISTS `devis` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `num_devis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_devis` date NOT NULL,
  `exercice_id` bigint UNSIGNED NOT NULL,
  `entreprise_id` bigint UNSIGNED NOT NULL,
  `prestation_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `devis_exercice_id_foreign` (`exercice_id`),
  KEY `devis_entreprise_id_foreign` (`entreprise_id`),
  KEY `devis_prestation_id_foreign` (`prestation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `devis`
--

INSERT INTO `devis` (`id`, `num_devis`, `date_devis`, `exercice_id`, `entreprise_id`, `prestation_id`, `created_at`, `updated_at`, `total`) VALUES
(1, 'DV21-001', '2021-10-01', 2021, 38, 1, '2021-11-04 14:32:05', '2021-12-24 09:08:28', '200000.00'),
(2, 'DV21-002', '2021-11-05', 2021, 54, 1, '2021-11-04 16:56:35', '2021-11-06 13:16:44', '300000.00'),
(3, 'DV21-003', '2021-11-06', 2021, 36, 2, '2021-11-04 16:57:15', '2021-11-04 16:57:15', '315000.00'),
(4, 'DV21-004', '2021-11-07', 2021, 12, 2, '2021-11-04 18:45:26', '2021-11-04 23:02:28', '360000.00'),
(5, 'DV21-005', '2021-11-04', 2021, 7, 3, '2021-11-04 18:57:07', '2021-11-04 18:57:07', '90000.00'),
(7, 'DV21-006', '2021-11-08', 2021, 20, 2, '2021-11-06 13:27:47', '2021-11-06 13:27:47', '240000.00'),
(8, 'DV21-007', '2021-11-07', 2021, 16, 1, '2021-11-07 10:26:23', '2021-11-07 10:26:23', '600000.00'),
(9, 'DV21-008', '2021-11-07', 2021, 21, 1, '2021-11-07 11:41:57', '2021-11-07 11:41:57', '300000.00'),
(11, 'DV21-009', '2021-12-09', 2021, 20, 5, '2021-12-10 18:00:20', '2021-12-24 17:48:22', '220000.00'),
(12, 'DV21-010', '2021-12-22', 2021, 23, 5, '2021-12-21 11:56:57', '2021-12-21 11:56:57', '192500.00'),
(15, 'DV21-011', '2021-12-24', 2021, 42, 2, '2021-12-24 17:49:07', '2021-12-24 17:49:07', '240000.00'),
(16, 'DV21-012', '1995-02-15', 2021, 42, 2, '2021-12-25 10:29:18', '2021-12-25 10:29:18', '240000.00'),
(17, 'DV22-001', '2022-01-01', 2022, 54, 2, '2022-01-07 20:44:29', '2022-01-07 20:44:29', '180000.00'),
(19, 'DV22-002', '2022-01-07', 2022, 20, 3, '2022-01-07 20:45:10', '2022-01-07 20:45:10', '160000.00'),
(20, 'DV22-003', '2022-01-20', 2022, 9, 2, '2022-01-07 20:45:40', '2022-01-07 20:45:40', '360000.00'),
(21, 'DV22-004', '2022-07-13', 2022, 16, 4, '2022-07-22 16:16:39', '2022-07-22 16:16:39', '300000.00'),
(22, 'DV22-005', '2022-07-30', 2022, 7, 2, '2022-07-22 16:17:46', '2022-07-22 16:17:46', '180000.00'),
(23, 'DV22-006', '2022-07-30', 2022, 8, 1, '2022-07-22 16:22:18', '2022-07-22 16:22:18', '450000.00');

-- --------------------------------------------------------

--
-- Structure de la table `entreprises`
--

DROP TABLE IF EXISTS `entreprises`;
CREATE TABLE IF NOT EXISTS `entreprises` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `raison_social` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_registre_commerce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_art_imposition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_id_fiscale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fiscal_id` bigint UNSIGNED NOT NULL,
  `activite_id` bigint UNSIGNED NOT NULL,
  `categorie_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entreprises_fiscal_id_foreign` (`fiscal_id`),
  KEY `entreprises_activite_id_foreign` (`activite_id`),
  KEY `entreprises_categorie_id_foreign` (`categorie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `entreprises`
--

INSERT INTO `entreprises` (`id`, `raison_social`, `num_registre_commerce`, `num_art_imposition`, `num_id_fiscale`, `adresse`, `num_tel`, `email`, `fiscal_id`, `activite_id`, `categorie_id`, `created_at`, `updated_at`) VALUES
(7, 'Alene Fadel', 'Et fugiat.', 'Aut.', 'Fugiat.', '6128 Brock Viaduct Apt. 410North Myriamborough, AL 28311', '025262256', 'zz@hotmail.fr', 2, 4, 1, '2021-10-31 19:05:30', '2021-11-13 10:31:25'),
(8, 'Albin Okuneva', 'Dolores.', 'Molestiae.', 'Expedita.', '833 Armstrong Ports Apt. 033New Joanastad, KS 58527-3101', '024565958', 'schmitt.albina@yahoo.com', 2, 3, 1, '2021-10-31 19:05:30', '2022-01-07 20:42:20'),
(9, 'Prof. Dashawn Armstrong', 'Quae.', 'Porro.', 'Magnam.', '16838 Kreiger Brooks Apt. 587\nDamienton, IL 65073', '(630) 912-8304', 'mprosacco@hotmail.com', 2, 4, 3, '2021-10-31 19:05:30', '2021-10-31 19:05:30'),
(10, 'Mandy Kris', 'Sint.', 'Quis.', 'Voluptate.', '9484 Fadel Island\nWest Nicholasside, LA 20247', '1-757-720-1468', 'emery.batz@yahoo.com', 1, 3, 3, '2021-10-31 19:05:30', '2021-10-31 19:05:30'),
(12, 'Aiden Hammes', 'Assumenda.', 'Magni.', 'Nostrum.', '239 Cole Mountains\nPfannerstillview, CA 04017', '1-626-858-0819', 'ppfeffer@yahoo.com', 2, 2, 3, '2021-10-31 19:06:27', '2021-10-31 19:06:27'),
(15, 'Miss Aniya Ondricka II', 'Id.', 'Quia sunt.', 'Omnis.', '37155 Michale Square\nSouth Sydniport, MN 37731', '+1 (534) 319-8680', 'bayer.dominique@hotmail.com', 1, 1, 2, '2021-10-31 19:06:27', '2021-10-31 19:06:27'),
(16, 'Lucile Hermiston', 'Dolor.', 'Vel iste.', 'Sed rerum.', '216 Taylor Avenue\nHughshire, UT 35921-1193', '1-678-608-0414', 'gus.hayes@hotmail.com', 2, 5, 3, '2021-10-31 19:06:27', '2021-10-31 19:06:27'),
(17, 'Ari Haag', 'Nulla.', 'Molestiae.', 'Omnis est.', '1361 Nora Corners\nNorth Krystelhaven, IL 57199-2187', '1-409-847-8050', 'ncrooks@fahey.com', 2, 2, 2, '2021-10-31 19:06:27', '2021-10-31 19:06:27'),
(19, 'Gino Schamberger', 'Aut.', 'Accusamus.', 'Hic eos.', '7817 Bogan Harbors Apt. 516\nSouth Sheilaton, PA 62716', '503.352.6900', 'chaya.rosenbaum@gmail.com', 1, 2, 1, '2021-10-31 19:06:27', '2021-10-31 19:06:27'),
(20, 'Emmanuel Kovacek', 'Maiores.', 'Provident.', 'Dolor.', '376 Emerson Villages Suite 927\nElisaborough, SC 78067-4245', '+16202360976', 'chaim.mayer@hotmail.com', 1, 2, 3, '2021-10-31 19:06:27', '2021-10-31 19:06:27'),
(21, 'Willow Waelchi', 'Ea ipsa.', 'Est velit.', 'Non natus.', '58784 Roman Mill Apt. 790\nJaquelineton, NC 16597-2481', '1-740-801-2038', 'rebeka.nicolas@feil.com', 2, 4, 1, '2021-10-31 19:06:27', '2021-10-31 19:06:27'),
(22, 'Brett Zboncak', 'Quia unde.', 'Nisi quas.', 'Pariatur.', '71274 Adams Mission Apt. 782\nDouglasmouth, VA 79331-8686', '+1-934-951-0746', 'mathias90@olson.com', 2, 1, 2, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(23, 'Dr. Caitlyn Ortiz', 'Eaque.', 'Omnis et.', 'Ratione.', '6807 Evangeline Groves\nEast Leoramouth, ME 69647', '+14237835663', 'audie.vonrueden@gmail.com', 1, 1, 2, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(24, 'Porter Kerluke', 'Qui in.', 'Ullam.', 'Sit nihil.', '48254 Cale Orchard Suite 718\nPort Kirkhaven, SD 15107-3340', '1-410-655-8630', 'victor.mertz@yahoo.com', 1, 3, 3, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(25, 'Ms. Yadira Price', 'Quas.', 'Facilis.', 'Id.', '938 Hills Coves Apt. 669\nToyview, LA 67472-0130', '985.885.1831', 'alf.parker@auer.com', 2, 3, 3, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(26, 'Kelvin Schumm', 'Dolorum.', 'Nostrum.', 'Natus ut.', '255 Walker Flat Apt. 579\nEast Gino, AR 99586-6227', '+1-347-324-5940', 'nicole03@bins.biz', 1, 4, 2, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(27, 'Ebba Wisoky', 'Vel rerum.', 'Dolore.', 'Molestiae.', '837 Van Streets\nSouth Linnieport, DC 24960-2237', '+1 (559) 817-9882', 'walker.odessa@gmail.com', 2, 5, 2, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(28, 'Meggie Williamson', 'Porro in.', 'Non.', 'Omnis.', '8586 Dedrick Alley Apt. 076\nZeldahaven, NJ 50116', '+1-689-547-5228', 'cdenesik@yahoo.com', 1, 1, 2, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(32, 'Francisca Kling', 'Fugit.', 'Aut.', 'Molestiae.', '133 Sammy Forges Suite 710\nPort Nico, NC 18379-4702', '(838) 913-2232', 'catherine93@corwin.info', 2, 5, 2, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(33, 'Prof. Mittie Trantow Jr.', 'Nam eius.', 'Amet.', 'Quas.', '31027 Marquardt Court\nRutherfordberg, WI 46174-6063', '231-366-6436', 'ervin39@bode.com', 1, 4, 3, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(34, 'Brandi Kshlerin MD', 'Fuga.', 'Aut dicta.', 'Omnis.', '944 Lowe Isle Suite 511\nSchmittmouth, AR 25412-2864', '760.427.0020', 'uglover@yahoo.com', 2, 5, 2, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(35, 'Jewell Donnelly', 'Harum.', 'Ut quo.', 'Sunt.', '49012 Trantow Crossing Apt. 140\nWunschview, VA 72692-6176', '559.502.1413', 'preichert@gislason.com', 2, 1, 2, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(36, 'Maria Upton', 'Officiis.', 'Iste quis.', 'Quidem.', '6473 Hodkiewicz Highway\nEast Mablefort, MN 47656-9375', '+1-534-402-5997', 'armstrong.trudie@hotmail.com', 2, 1, 2, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(37, 'Lauryn Terry', 'Dicta.', 'Deleniti.', 'Officiis.', '596 Schultz Mountains Suite 412\nGayleburgh, AL 39530-9585', '+14345654055', 'ephraim69@dibbert.com', 1, 4, 2, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(38, 'Billy Carroll', 'Nobis.', 'Quisquam.', 'Ut atque.', '29167 Quigley Common Apt. 624\nWest Crystel, NM 33206', '(484) 579-9644', 'adah50@gmail.com', 1, 2, 1, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(39, 'Myrl Bailey', 'Tempora.', 'Illo in a.', 'Et itaque.', '5148 Kathryn Trail\nTrantowburgh, IN 84916', '603.588.1689', 'lconsidine@yahoo.com', 1, 2, 1, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(40, 'Davion Borer', 'Et.', 'Eum.', 'Debitis.', '6363 Leilani Vista Suite 389\nNorth Luisa, KY 07823-1423', '763-215-6722', 'stokes.melvina@yahoo.com', 1, 1, 2, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(41, 'Prof. Hilton Smith Jr.', 'Ab quidem.', 'Illo.', 'Sunt.', '316 O\'Keefe Junction Apt. 756\nSchneiderland, MO 46505-5361', '+13304410897', 'block.amie@hotmail.com', 2, 4, 1, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(42, 'Georgianna Witting', 'Eos.', 'Molestias.', 'Tempora.', '8730 Ignacio Land\nWest Ethelynburgh, KY 77597-4370', '804-301-0054', 'weissnat.jodie@yahoo.com', 1, 2, 3, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(43, 'Nora Hirthe', 'Veniam.', 'Soluta.', 'Illo ut.', '7795 Hilpert Grove\nTerryhaven, IN 81089-6027', '+1 (364) 814-1386', 'rosetta28@frami.info', 1, 2, 2, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(44, 'Eriberto Armstrong', 'Rem eum.', 'Minus.', 'Rerum.', '67599 Hoeger Mill Apt. 250\nEast Deangeloside, NE 38655', '680.440.1478', 'davis.kobe@gmail.com', 1, 1, 1, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(45, 'Lyric Carter', 'Et ut.', 'Dolorem.', 'Delectus.', '14305 Aryanna Islands\nMagdalenstad, WI 68324-4057', '716-252-2026', 'elinore.stehr@hotmail.com', 2, 4, 3, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(46, 'Mrs. Amy Balistreri', 'Iste.', 'Dolor nam.', 'Omnis.', '4450 Rempel Knolls\nKarifurt, WI 43136-9556', '1-712-321-7356', 'jairo.bartoletti@gmail.com', 1, 5, 1, '2021-10-31 19:06:28', '2021-10-31 19:06:28'),
(47, 'Prof. Heidi Sawayn MD', 'Aut.', 'Atque.', 'Ipsum.', '65210 Brianne Groves\nKristopherfort, WV 44712-6094', '1-806-287-3538', 'xschultz@stark.info', 2, 5, 1, '2021-10-31 19:06:29', '2021-10-31 19:06:29'),
(48, 'Miss Marcia Pfannerstill', 'Officia.', 'Est iure.', 'Libero.', '57942 Jordi Locks\nWiegandton, CO 92082', '+1 (279) 428-8366', 'benedict00@sauer.com', 2, 3, 3, '2021-10-31 19:06:29', '2021-10-31 19:06:29'),
(49, 'Mr. Marty Jones', 'Id omnis.', 'Suscipit.', 'Nihil aut.', '72216 Murphy Drive Suite 443\nLebsackmouth, LA 12164', '+1-351-323-5544', 'qgerhold@walker.net', 2, 5, 3, '2021-10-31 19:06:29', '2021-10-31 19:06:29'),
(50, 'Miss Lera Metz Sr.', 'Quas iste.', 'Tenetur.', 'Sunt.', '316 Vada Meadow\nStokesshire, LA 45161-0573', '+1-317-310-4671', 'mabelle.tromp@yahoo.com', 2, 3, 2, '2021-10-31 19:06:29', '2021-10-31 19:06:29'),
(51, 'Elliot Sipes', 'Quaerat.', 'Possimus.', 'Id autem.', '7649 Connelly Prairie Apt. 655\nGottliebside, MO 83550', '934-905-2321', 'mhirthe@waelchi.com', 1, 1, 3, '2021-10-31 19:06:29', '2021-10-31 19:06:29'),
(52, 'Kendall Dicki II', 'Non.', 'Voluptas.', 'Cumque.', '91228 Jacklyn Brooks\nColetown, WY 88274-7746', '+1-281-752-8631', 'santiago.parker@waters.com', 1, 3, 2, '2021-10-31 19:06:29', '2021-10-31 19:06:29'),
(53, 'fleen', '16r15141312', '0019226500', '19910314', 'bachdjarrah 3 bt53 , bourrouba', '0797969593', 'fleen@gmail.com', 2, 5, 2, '2021-11-02 16:34:15', '2021-11-02 22:47:57'),
(54, 'Sarl TLA', '1920859565', '022529515', '1616203255s', 'Les sources Coop el wissam', '021262349', 'sarltla@hotmail.com', 2, 2, 1, '2021-11-02 19:52:27', '2022-01-07 20:42:45'),
(55, 'Quidem aut hic totam', 'Voluptas aliquip aut', 'Consequatur Facilis', 'Quasi libero ipsam v', 'Irure quos voluptate', 'kyrizinef', 'lejew@jew.com', 2, 4, 2, '2021-11-04 16:48:24', '2021-11-04 16:48:24'),
(56, 'césar', 'Aut numquam exercita', 'Fugit eiusmod ea se', 'Dolorem magnam molli', 'Harum veniam odit r', '021262349', 'waxuvep@gmail.com', 2, 2, 1, '2021-11-08 11:43:14', '2021-11-08 11:43:14'),
(57, 'new client', 'Occaecat laboris con', 'Quaerat vel quos a s', 'Pariatur Exercitati', 'Est nobis ex pariatu', '021242649', 'dojifal@gmail.com', 2, 2, 3, '2021-11-09 17:20:04', '2021-11-09 17:20:04'),
(58, 'random client', 'Et minima consequatu', 'Sint culpa neque sa', 'Quis magnam in ut ei', 'Inventore veniam ad', '0569006582', 'vogyfac@gmail.com', 2, 1, 1, '2021-11-09 17:22:09', '2021-11-09 17:22:09'),
(59, 'random cl', 'Esse velit quia qu', 'Repudiandae est temp', 'Quis reprehenderit', 'Sed et soluta omnis', '0662623499', 'qopusu@gmail.com', 1, 2, 3, '2021-11-09 17:23:45', '2021-11-09 17:23:45'),
(60, 'Voluptatem sint ali', 'Quos et sed perspici', 'Atque quia labore in', 'Animi omnis vel ven', 'Et do in velit duis', '0665207612', 'dynylij@gmail.com', 1, 3, 3, '2021-11-09 17:25:33', '2021-11-09 17:25:33'),
(63, 'hicew', 'Elit in unde mollit', 'Voluptatibus in nemo', 'Quis esse eos odio', 'Vero enim excepteur', '021262349', 'hicew@hicew.fr', 2, 5, 3, '2021-12-24 17:29:22', '2021-12-24 17:29:36'),
(64, 'Harum laboriosam au', 'Rerum maxime similiq', 'Est sed voluptas qui', 'Deserunt enim nesciu', 'Cillum occaecat prov', '021262349', 'vewekyb@zz.fr', 1, 4, 1, '2021-12-25 09:10:15', '2021-12-25 09:10:15'),
(67, 'Quis earum est volup', 'Laboriosam in alias', 'Veniam lorem ex non', 'Enim deserunt ut qui', 'Et in debitis facili', '021262349', 'dyvuqix@gmail.fr', 1, 1, 1, '2022-07-17 07:30:27', '2022-07-17 07:30:27');

-- --------------------------------------------------------

--
-- Structure de la table `exercices`
--

DROP TABLE IF EXISTS `exercices`;
CREATE TABLE IF NOT EXISTS `exercices` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2025 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `exercices`
--

INSERT INTO `exercices` (`id`, `created_at`, `updated_at`) VALUES
(2020, NULL, NULL),
(2021, NULL, NULL),
(2022, NULL, NULL),
(2023, NULL, NULL),
(2024, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `factures`
--

DROP TABLE IF EXISTS `factures`;
CREATE TABLE IF NOT EXISTS `factures` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `num_fact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_facturation` date NOT NULL,
  `montant` decimal(16,2) NOT NULL,
  `mission_id` bigint UNSIGNED DEFAULT NULL,
  `exercice_id` bigint UNSIGNED DEFAULT NULL,
  `type_facture_id` bigint UNSIGNED DEFAULT NULL,
  `fact_avoir_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `factures_mission_id_foreign` (`mission_id`),
  KEY `factures_exercice_id_foreign` (`exercice_id`),
  KEY `factures_type_facture_id_foreign` (`type_facture_id`),
  KEY `factures_fact_avoir_id_foreign` (`fact_avoir_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `factures`
--

INSERT INTO `factures` (`id`, `num_fact`, `date_facturation`, `montant`, `mission_id`, `exercice_id`, `type_facture_id`, `fact_avoir_id`, `created_at`, `updated_at`) VALUES
(1, 'FF21-001', '2021-06-14', '90000.00', 1, 2021, 1, NULL, '2021-11-15 13:40:06', '2021-11-21 18:10:38'),
(2, 'FF21-002', '2021-06-15', '90000.00', 1, 2021, 1, NULL, '2021-11-15 13:49:50', '2021-11-21 18:10:52'),
(3, 'FF21-003', '2021-07-15', '120000.00', 1, 2021, 1, NULL, '2021-11-15 13:50:09', '2021-11-21 18:11:09'),
(4, 'FF21-004', '2021-09-17', '54000.00', 3, 2021, 1, NULL, '2021-11-15 13:50:24', '2021-11-21 18:11:22'),
(5, 'FF21-005', '2021-10-18', '60000.00', 5, 2021, 1, NULL, '2021-11-15 14:52:51', '2021-11-21 18:11:36'),
(6, 'FA21-001', '2021-09-08', '60000.00', 5, 2021, 2, 5, '2021-11-16 12:53:23', '2021-12-22 11:58:15'),
(7, 'FF21-006', '2021-11-16', '27000.00', 9, 2021, 1, NULL, '2021-11-16 12:55:25', '2021-11-16 12:55:25'),
(8, 'FA21-002', '2021-11-19', '120000.00', 1, 2021, 2, 3, '2021-11-16 12:56:39', '2021-11-16 15:46:40'),
(10, 'FF21-007', '2021-11-02', '54000.00', 10, 2021, 1, NULL, '2021-11-29 10:52:07', '2021-11-29 10:52:07'),
(21, 'FF21-009', '2021-11-10', '60000.00', 5, 2021, 1, NULL, '2021-12-22 15:12:35', '2021-12-22 15:12:35'),
(22, 'FF21-010', '2021-12-21', '80000.00', 5, 2021, 1, NULL, '2021-12-22 15:12:55', '2021-12-22 15:12:55'),
(24, 'FF21-011', '2021-12-21', '236250.00', 30, 2021, 1, NULL, '2021-12-22 17:15:25', '2021-12-22 17:15:25'),
(25, 'FF21-012', '2021-12-01', '60000.00', 5, 2021, 1, NULL, '2021-12-22 17:37:56', '2021-12-22 17:37:56'),
(26, 'FF21-013', '2021-12-15', '27000.00', 9, 2021, 1, NULL, '2021-12-23 19:06:18', '2021-12-23 19:06:18'),
(27, 'FF21-014', '2021-12-23', '36000.00', 9, 2021, 1, NULL, '2021-12-23 19:07:09', '2021-12-23 19:07:09'),
(28, 'FA21-003', '2021-12-23', '36000.00', 9, 2021, 2, 27, '2021-12-23 19:10:24', '2021-12-23 19:10:24'),
(29, 'FF21-015', '2021-12-23', '36000.00', 9, 2021, 1, NULL, '2021-12-23 19:11:11', '2021-12-23 19:11:11'),
(30, 'FF21-016', '2021-11-30', '54000.00', 3, 2021, 1, NULL, '2021-12-24 17:51:20', '2021-12-24 17:51:20'),
(31, 'FF22-001', '2022-01-01', '54000.00', 10, 2022, 1, NULL, '2022-01-07 20:18:06', '2022-01-07 20:18:06'),
(32, 'FF22-002', '2022-02-02', '72000.00', 8, 2022, 1, NULL, '2022-01-07 21:05:54', '2022-01-07 21:05:54'),
(33, 'FF22-003', '2022-02-04', '36000.00', 7, 2022, 1, NULL, '2022-01-07 21:06:09', '2022-01-07 21:06:09'),
(34, 'FF22-004', '2021-03-11', '72000.00', 15, 2022, 1, NULL, '2022-01-07 21:06:44', '2022-01-07 21:06:44'),
(35, 'FF22-005', '2022-04-08', '54000.00', 4, 2022, 1, NULL, '2022-01-07 21:07:15', '2022-01-07 21:07:15'),
(36, 'FF22-006', '2022-04-15', '72000.00', 10, 2022, 1, NULL, '2022-01-07 21:07:37', '2022-01-07 21:07:37'),
(37, 'FF22-007', '2022-06-23', '90000.00', 2, 2022, 1, NULL, '2022-01-07 21:08:06', '2022-01-07 21:09:13'),
(38, 'FF22-008', '2022-07-29', '90000.00', 2, 2022, 1, NULL, '2022-01-07 21:08:21', '2022-01-07 21:08:21'),
(39, 'FF22-009', '2022-07-29', '180000.00', 6, 2022, 1, NULL, '2022-01-07 21:08:42', '2022-01-07 21:08:42'),
(40, 'FF20-001', '2020-01-05', '90000.00', 20, 2020, 1, NULL, '2022-01-07 21:09:49', '2022-01-07 21:10:26'),
(41, 'FF20-002', '2020-06-11', '105000.00', 12, 2020, 1, NULL, '2022-01-07 21:10:08', '2022-01-07 21:10:08'),
(44, 'FF22-010', '2022-07-29', '105000.00', 12, 2022, 1, NULL, '2022-01-07 21:14:17', '2022-01-07 21:14:17'),
(45, 'FF22-011', '2022-07-22', '135000.00', 27, 2022, 1, NULL, '2022-07-22 16:28:04', '2022-07-22 16:28:04');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `mandats`
--

DROP TABLE IF EXISTS `mandats`;
CREATE TABLE IF NOT EXISTS `mandats` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `mission_id` bigint UNSIGNED DEFAULT NULL,
  `date_mandat` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `num_mandat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mandats_mission_id_foreign` (`mission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `mandats`
--

INSERT INTO `mandats` (`id`, `mission_id`, `date_mandat`, `created_at`, `updated_at`, `num_mandat`) VALUES
(1, 3, '2021-11-07', '2021-11-08 15:36:17', '2021-11-08 15:36:17', 'MD21-001'),
(2, 2, '2021-11-08', '2021-11-08 16:45:05', '2021-11-08 16:45:05', 'MD21-002'),
(3, 1, '2021-11-08', '2021-11-08 22:29:21', '2021-11-08 22:29:21', 'MD21-003'),
(5, 10, '2021-12-25', '2021-12-25 10:30:10', '2021-12-25 10:30:10', 'MD21-004');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_10_17_230958_create_regime_fiscals_table', 1),
(6, '2021_10_17_231021_create_categories_table', 1),
(7, '2021_10_17_231100_create_type_activites_table', 1),
(8, '2021_10_17_231134_create_exercices_table', 1),
(9, '2021_10_17_231157_create_type_factures_table', 1),
(10, '2021_10_17_231211_create_type_paiements_table', 1),
(11, '2021_10_17_231245_create_prestations_table', 1),
(12, '2021_10_17_231309_create_roles_table', 1),
(13, '2021_10_28_194349_create_entreprises_table', 1),
(14, '2021_10_28_224316_create_devis_table', 1),
(15, '2021_10_28_234559_create_missions_table', 1),
(16, '2021_10_28_235209_create_mandats_table', 1),
(17, '2021_10_28_235227_create_conventions_table', 1),
(18, '2021_10_30_130714_create_factures_table', 1),
(19, '2021_10_30_130715_create_paiements_table', 1),
(20, '2021_10_30_132410_create_taches_table', 1),
(21, '2021_10_30_133635_create_commentaires_table', 1),
(22, '2021_11_04_143906_add_total_to_devis_table', 1),
(23, '2021_11_06_182853_modification_missions_table', 2),
(24, '2021_11_07_110850_add_total_to_missions_table', 3),
(25, '2021_11_08_162315_add_numm_mandat_to_mandats_table', 4),
(26, '2021_11_08_163229_add_num_mandat_to_mandats_table', 5),
(27, '2021_11_08_195354_add_num_convention_to_conventions_table', 6),
(28, '2021_11_11_192513_add_num_tache_to_taches_table', 7);

-- --------------------------------------------------------

--
-- Structure de la table `missions`
--

DROP TABLE IF EXISTS `missions`;
CREATE TABLE IF NOT EXISTS `missions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `allDay` int NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `textColor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `devis_id` bigint UNSIGNED DEFAULT NULL,
  `prestation_id` bigint UNSIGNED DEFAULT NULL,
  `entreprise_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int NOT NULL,
  `num_missions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `missions_devis_id_foreign` (`devis_id`),
  KEY `missions_prestation_id_foreign` (`prestation_id`),
  KEY `missions_entreprise_id_foreign` (`entreprise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `missions`
--

INSERT INTO `missions` (`id`, `title`, `start`, `end`, `allDay`, `color`, `textColor`, `devis_id`, `prestation_id`, `entreprise_id`, `created_at`, `updated_at`, `status`, `num_missions`, `total`) VALUES
(1, 'M21-001-Sarl TLA-CAC', '2021-12-16 00:00:00', '2024-12-31 00:00:00', 1, '#0000a0', '#ffffff', NULL, 1, 54, NULL, '2021-12-24 17:50:10', 1, 'M21-001', '300000.00'),
(2, 'M21-002-Sarl TLA-CAC', '2021-11-07 00:00:00', '2024-11-06 00:00:00', 1, '#ff0080', '#000000', 2, 1, 54, '2021-11-06 22:17:08', '2021-11-29 10:06:04', 1, 'M21-002', '300000.00'),
(3, 'M21-003-Alene Fadel-ACMPT', '2021-11-01 00:00:00', '2022-10-31 00:00:00', 1, '#00ff40', '#000000', NULL, 2, 7, '2021-11-06 22:26:33', '2021-11-29 10:06:26', 0, 'M21-003', '180000.00'),
(4, 'M21-004-Albin Okuneva-ACMPT', '2020-11-04 00:00:00', '2021-11-09 00:00:00', 1, '#000000', '#ffff00', NULL, 2, 8, '2021-11-06 22:28:35', '2021-12-09 13:15:40', 0, 'M21-004', '180000.00'),
(5, 'M21-005-Billy Carroll-CAC', '2018-11-11 00:00:00', '2021-11-12 00:00:00', 1, '#8000ff', '#000000', 1, 1, 38, '2021-11-07 10:52:01', '2021-11-29 10:10:47', 0, 'M21-005', '200000.00'),
(6, 'M21-006-Lucile Hermiston-CAC', '2017-08-01 00:00:00', '2020-07-31 00:00:00', 1, '#8080c0', '#000000', 8, 1, 16, '2021-11-07 11:39:21', '2021-11-29 13:24:34', 1, 'M21-006', '600000.00'),
(7, 'M21-007-Gino Schamberger-ACMPT', '2019-10-01 00:00:00', '2020-09-30 00:00:00', 1, '#408080', '#000000', NULL, 2, 19, '2021-11-07 11:42:29', '2021-11-29 13:25:27', 0, 'M21-007', '120000.00'),
(8, 'M21-008-Mandy Kris-ACMPT', '2021-11-05 00:00:00', '2021-11-17 00:00:00', 1, '#004000', '#80ffff', NULL, 2, 10, '2021-11-07 12:14:52', '2022-01-07 20:50:05', 0, 'M21-008', '240000.00'),
(9, 'M21-009-Alene Fadel-AENT', '2021-11-04 00:00:00', '2021-11-18 00:00:00', 1, '#ff8080', '#000000', 5, 3, 7, '2021-11-07 12:15:19', '2021-11-11 16:10:13', 0, 'M21-009', '90000.00'),
(10, 'M21-010-Prof. Dashawn Armstrong-AENT', '1981-04-25 00:00:00', '2021-09-08 00:00:00', 1, '#8c5aa3', '#000000', NULL, 3, 9, '2021-11-07 12:15:58', '2021-11-07 22:31:26', 0, 'M21-010', '180000.00'),
(11, 'M21-011-Maria Upton-ACMPT', '2021-10-02 00:00:00', '2021-11-06 00:00:00', 1, '#ff0080', '#000000', 3, 2, 36, '2021-11-07 15:08:07', '2021-11-08 13:56:00', 0, 'M21-011', '315000.00'),
(12, 'M21-012-Miss Aniya Ondricka II-CAC', '2021-10-25 00:00:00', '2021-10-31 00:00:00', 1, '#8080ff', '#000000', NULL, 1, 15, '2021-11-07 17:47:12', '2021-11-11 14:11:46', 0, 'M21-012', '350000.00'),
(14, 'M21-013-new client-ACMPT', '2021-12-04 00:00:00', '2021-12-17 00:00:00', 1, '#808000', '#000000', NULL, 2, 57, '2021-11-11 12:19:34', '2021-11-11 15:56:57', 0, 'M21-013', '360000.00'),
(15, 'M21-014-Mandy Kris-ACMPT', '2021-11-01 00:00:00', '2021-11-04 00:00:00', 1, '#808000', '#000000', NULL, 2, 10, '2021-11-11 12:22:52', '2021-11-11 14:07:08', 0, 'M21-014', '240000.00'),
(16, 'M21-015-Alene Fadel-CAC', '2021-11-01 00:00:00', '2021-11-03 00:00:00', 1, '#0000ff', '#ffffff', NULL, 1, 7, '2021-11-11 12:26:18', '2021-11-27 10:01:45', 0, 'M21-015', '300000.00'),
(18, 'M21-016-Brett Zboncak-ACMPT', '2021-11-25 00:00:00', '2021-11-28 00:00:00', 1, '#808080', '#000000', NULL, 2, 22, '2021-11-11 17:31:00', '2021-11-11 17:31:00', 0, 'M21-016', '315000.00'),
(19, 'M21-017-Mandy Kris-ACMPT', '2021-12-01 00:00:00', '2021-12-15 00:00:00', 1, '#400000', '#ffff80', NULL, 2, 10, '2021-11-12 22:39:24', '2021-12-25 09:10:33', 0, 'M21-017', '240000.00'),
(20, 'M21-018-Willow Waelchi-CAC', '2021-05-28 00:00:00', '2021-09-22 00:00:00', 1, '#ff00ff', '#000000', NULL, 1, 21, '2021-11-12 22:42:33', '2022-01-07 20:49:42', 1, 'M21-018', '300000.00'),
(21, 'M21-019-Dr. Caitlyn Ortiz-ACMPT', '2021-07-01 00:00:00', '2022-06-30 00:00:00', 1, '#c0c0c0', '#000000', NULL, 2, 23, '2021-11-12 22:50:11', '2021-11-27 14:03:18', 0, 'M21-019', '210000.00'),
(27, 'M21-020-Willow Waelchi-CAC', '2021-12-30 00:00:00', '2024-12-31 00:00:00', 1, '#800000', '#ffff00', NULL, 1, 21, '2021-11-13 18:58:17', '2022-01-07 20:52:16', 0, 'M21-020', '450000.00'),
(30, 'M21-021-Brett Zboncak-CAC', '2021-12-06 00:00:00', '2021-12-31 00:00:00', 1, '#400080', '#ffffff', NULL, 1, 22, '2021-12-10 18:28:33', '2022-01-07 20:50:17', 1, 'M21-021', '787500.00');

-- --------------------------------------------------------

--
-- Structure de la table `paiements`
--

DROP TABLE IF EXISTS `paiements`;
CREATE TABLE IF NOT EXISTS `paiements` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `montant` decimal(16,2) NOT NULL,
  `num_piece_c` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_paiement` date NOT NULL,
  `type_paiement_id` bigint UNSIGNED DEFAULT NULL,
  `facture_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paiements_type_paiement_id_foreign` (`type_paiement_id`),
  KEY `paiements_facture_id_foreign` (`facture_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `paiements`
--

INSERT INTO `paiements` (`id`, `montant`, `num_piece_c`, `date_paiement`, `type_paiement_id`, `facture_id`, `created_at`, `updated_at`) VALUES
(1, '90000.00', '-', '2021-11-15', 3, 1, '2021-11-17 17:28:00', '2021-11-17 17:28:00'),
(2, '90000.00', '91880009', '2021-11-21', 1, 2, '2021-11-17 17:31:38', '2021-11-17 18:18:04'),
(3, '120000.00', '555d6879', '2021-11-18', 2, 3, '2021-11-17 17:33:11', '2021-11-17 17:33:11'),
(6, '54000.00', '19524486', '2021-12-21', 1, 4, '2021-12-21 13:04:32', '2021-12-21 13:04:32'),
(7, '60000.00', '123456', '2021-12-22', 1, 7, '2021-12-22 11:56:15', '2021-12-22 11:56:51'),
(8, '90000.00', '-', '2022-01-05', 3, 40, '2022-01-07 21:15:43', '2022-01-07 21:15:43'),
(9, '105000.00', '-', '2022-01-05', 2, 41, '2022-01-07 21:15:59', '2022-01-07 21:15:59'),
(10, '72000.00', '-', '2022-01-06', 3, 34, '2022-01-07 21:17:22', '2022-01-07 21:17:22'),
(11, '54000.00', '14953258', '2022-01-06', 1, 35, '2022-01-07 21:17:39', '2022-01-07 21:17:39'),
(12, '72000.00', 'az32145', '2021-12-29', 2, 36, '2022-01-07 21:17:56', '2022-01-07 21:17:56'),
(13, '36000.00', '-', '2021-12-30', 3, 33, '2022-01-07 21:19:02', '2022-01-07 21:19:02'),
(14, '90000.00', '-', '2022-01-05', 3, 37, '2022-01-07 21:19:29', '2022-01-07 21:19:29'),
(15, '90000.00', '-', '2022-01-06', 3, 38, '2022-01-07 21:19:47', '2022-01-07 21:19:47'),
(16, '180000.00', '-', '2022-01-03', 3, 39, '2022-01-07 21:19:58', '2022-01-07 21:19:58'),
(17, '105000.00', '45613324564', '2022-01-07', 2, 44, '2022-01-07 21:20:14', '2022-01-07 21:20:14');

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('amine-cheraitia@hotmail.com', '$2y$10$X/xEq0mQ2j2/wQYg2S9VSO1PUP9uMH5tQcXFCaY5Ftvv/qzpwxflS', '2021-12-08 15:36:44');

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `prestations`
--

DROP TABLE IF EXISTS `prestations`;
CREATE TABLE IF NOT EXISTS `prestations` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tarif_initial` decimal(10,2) NOT NULL,
  `durée` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code_prestation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `prestations`
--

INSERT INTO `prestations` (`id`, `designation`, `tarif_initial`, `durée`, `created_at`, `updated_at`, `code_prestation`) VALUES
(1, 'Audit Legal', '300000.00', 36, NULL, NULL, 'CAC'),
(2, 'Assistance Comptable', '120000.00', 12, NULL, NULL, 'ACMPT'),
(3, 'Acompagnement de entreprise', '80000.00', 12, NULL, NULL, 'AENT'),
(4, 'Assainissement de la comptabilité', '100000.00', 12, NULL, NULL, 'ASSC'),
(5, 'Audit et conseil', '110000.00', 12, NULL, NULL, 'A&C');

-- --------------------------------------------------------

--
-- Structure de la table `regime_fiscals`
--

DROP TABLE IF EXISTS `regime_fiscals`;
CREATE TABLE IF NOT EXISTS `regime_fiscals` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `indice_tarif` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `regime_fiscals`
--

INSERT INTO `regime_fiscals` (`id`, `created_at`, `updated_at`, `designation`, `indice_tarif`) VALUES
(1, NULL, NULL, 'Forfait', '1.00'),
(2, NULL, NULL, 'Réel', '1.50');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `role`, `created_at`, `updated_at`) VALUES
(1, '-', '2021-11-12 10:48:41', NULL),
(2, 'Secrétaire', '2021-11-12 11:41:48', NULL),
(3, 'Comptable', '2021-11-12 12:28:53', NULL),
(4, 'Auditeur', '2021-11-12 12:28:53', NULL),
(5, 'Admin', '2021-11-12 12:28:54', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `taches`
--

DROP TABLE IF EXISTS `taches`;
CREATE TABLE IF NOT EXISTS `taches` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `allDay` int NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `textColor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `mission_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `num_tache` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taches_mission_id_foreign` (`mission_id`),
  KEY `taches_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `taches`
--

INSERT INTO `taches` (`id`, `designation`, `title`, `start`, `end`, `allDay`, `color`, `textColor`, `status`, `mission_id`, `user_id`, `created_at`, `updated_at`, `num_tache`) VALUES
(1, 'Comptabilisé la banque recette BEA et CPA', 'T21-001-lachmot-Sarl TLA-CAC', '2021-09-01 22:02:37', '2021-09-14 22:02:41', 0, '#80ffff', '#000000', 1, 1, 6, '2021-11-12 12:38:15', '2021-12-24 09:43:37', 'T21-001'),
(2, 'Vérification de la conformité des livret légaux', 'T21-002-Olivier Le Lebon-Albin Okuneva-ACMPT', '2021-10-28 14:39:58', '2021-11-17 14:40:00', 0, '#ff8080', '#000000', 0, 4, 4, '2021-11-12 12:40:12', '2021-11-28 10:46:14', 'T21-002'),
(3, 'Audit du stock physique', 'T21-003-omar-Billy Carroll-CAC', '2021-11-01 00:34:18', '2021-11-13 00:34:21', 0, '#00ff40', '#000000', 1, 5, 3, '2021-11-12 22:36:13', '2022-01-07 20:59:54', 'T21-003'),
(4, 'Rapprochement bancaire', 'T21-004-Constance Le Guillon-Albin Okuneva-ACMPT', '2021-11-26 00:37:23', '2021-11-29 00:37:25', 0, '#000000', '#ff0000', 0, 4, 3, '2021-11-12 22:37:38', '2022-01-07 21:23:14', 'T21-004'),
(5, 'Comptabilisé la caisse recette et depense', 'T21-005-lachmot-Mandy Kris-ACMPT', '2021-12-01 00:46:31', '2021-12-23 00:46:36', 0, '#800080', '#ffff00', 0, 15, 6, '2021-11-12 22:47:48', '2022-01-07 21:24:20', 'T21-005'),
(6, 'van disk', 'T21-006-omar-Mandy Kris-ACMPT', '2021-11-01 01:05:25', '2021-12-01 01:05:27', 0, '#80ffff', '#000000', 1, 19, 3, '2021-11-12 23:05:48', '2022-01-07 21:00:29', 'T21-006'),
(7, 'Comptabilisé le journal de vente pour decembre', 'T21-007-lachmot-new client-ACMPT', '2021-12-01 11:48:31', '2021-12-10 11:48:35', 0, '#000000', '#00ff00', 0, 14, 6, '2021-11-13 09:48:46', '2021-11-28 12:39:16', 'T21-007'),
(10, 'teste gris', 'T21-008-Olivier Le Lebon-Albin Okuneva-ACMPT', '2021-12-01 04:00:00', '2021-12-03 00:00:00', 0, '#c0c0c0', '#000000', 1, 4, 4, '2021-11-13 12:06:08', '2021-11-13 12:11:34', 'T21-008'),
(13, 'vérification papier avant depot', 'T21-009-Merouan-Prof. Dashawn Armstrong-AENT', '2021-11-02 15:04:48', '2021-11-09 15:04:50', 0, '#c0c0c0', '#8000ff', 1, 10, 7, '2021-11-28 13:05:07', '2021-12-24 17:35:18', 'T21-009'),
(15, 'comptabilisation des charges interne', 'T21-010-lachmot-Mandy Kris-ACMPT', '2021-12-08 14:23:02', '2021-12-11 14:23:04', 0, '#ff00ff', '#000000', 0, 8, 6, '2021-12-21 12:23:11', '2021-12-21 12:23:11', 'T21-010'),
(17, 'exercice 2023', 'T21-011-Mohamed-Alene Fadel-ACMPT', '2021-12-01 11:39:50', '2021-12-31 11:39:52', 0, '#ff0080', '#000000', 0, 3, 7, '2021-12-24 09:39:58', '2021-12-24 09:39:58', 'T21-011'),
(18, 'rédiger les livret légaux pour le mois de janvier', 'T22-001-Mohamed-Alene Fadel-AENT', '2022-01-07 22:57:38', '2022-01-12 22:57:40', 0, '#dff951', '#000000', 0, 9, 7, '2022-01-07 20:57:48', '2022-01-07 20:57:48', 'T22-001');

-- --------------------------------------------------------

--
-- Structure de la table `type_activites`
--

DROP TABLE IF EXISTS `type_activites`;
CREATE TABLE IF NOT EXISTS `type_activites` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type_activites`
--

INSERT INTO `type_activites` (`id`, `designation`, `created_at`, `updated_at`) VALUES
(1, 'Production', NULL, NULL),
(2, 'Revente en etat', NULL, NULL),
(3, 'Import/export', NULL, NULL),
(4, 'BTPH', NULL, NULL),
(5, 'Service', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `type_factures`
--

DROP TABLE IF EXISTS `type_factures`;
CREATE TABLE IF NOT EXISTS `type_factures` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type_factures`
--

INSERT INTO `type_factures` (`id`, `code`, `designation`) VALUES
(1, 'FF', 'Facture'),
(2, 'FA', 'Facture d\'avoir');

-- --------------------------------------------------------

--
-- Structure de la table `type_paiements`
--

DROP TABLE IF EXISTS `type_paiements`;
CREATE TABLE IF NOT EXISTS `type_paiements` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type_paiements`
--

INSERT INTO `type_paiements` (`id`, `designation`, `created_at`, `updated_at`) VALUES
(1, 'Chèque', '2021-11-17 11:23:28', NULL),
(2, 'Virement', '2021-11-17 11:23:29', NULL),
(3, 'Espèce', '2021-11-17 11:23:30', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `prenom`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`) VALUES
(3, 'omar', 'slimi', 'omar@cabinetmeddahi.com', '2021-11-12 10:42:56', '$2y$10$imWvhRU/n0UC3pNr3LyRMOxsoEzgagKlEo0w.607He.lcum5F1cm.', 'DXWPQmhKuVL7i33smCKBVaGQKZaoURxMkGta2GkGn8hpR5xcWpw1OmFfxYD2', '2021-11-12 10:42:56', '2022-01-07 20:28:26', 4),
(4, 'Cheraitia', 'Mohamed Amine', 'amine-cheraitia@hotmail.com', '2021-11-12 10:42:56', '$2y$10$Y526a1ihkzqNRa0OElOEb.VF2dnO/Kb4nYLOibWB6.NweNQ/6WIX6', 'cRVvDFkxlz2L7NEasnuSv44B5szZbWNPRMTPj3ZBLuR6L5QiZKDEN8VRr48Z', '2021-11-12 10:42:57', '2021-11-27 08:57:11', 5),
(6, 'lachmot', 'salah', 'cmp@cabinetmeddahi.com', NULL, '$2y$10$/qx8x6YNL6mvkQqx9S0FC.ABngXADp35KJ6JE78cOe2mSrrwD7.HW', NULL, '2021-11-28 09:45:14', '2021-11-28 09:46:15', 3),
(7, 'Mohamed', 'Ougouag', 'adt@cabinetmeddahi.com', NULL, '$2y$10$2EiNPkVmSTk7faJOZb/rYec.jFGqTsIceHWwHYTB6lxqO5xnVVO3y', NULL, '2021-11-28 12:59:54', '2021-11-28 13:06:17', 4),
(10, 'yakoub', 'nassima', 'nassima@cabinetmeddahi.com', NULL, '$2y$10$k3gZLNEKE/AHvVxcEC4X0udrasAeQeosVGJgipAjbQemI84ccN9IC', NULL, '2021-12-21 13:29:13', '2022-01-07 20:40:38', 2),
(11, 'felah', 'abdelhadi', 'abdelhadi@cabinetmeddahi.com', NULL, '$2y$10$bO7Ppml0bjh0t/zcdjTSlumddr3iWhjpVQUEqW.f35Gv6YZHtnDpm', NULL, '2021-12-24 13:00:01', '2022-01-07 20:41:56', 3),
(12, 'Kay Solis', 'Eum quia deleniti qu', 'gaxahovyci@mailinator.com', NULL, '$2y$10$J8fPeT6yj0.76hNdaJvWb.pLbqU4Zr.nEdJFfH9o.frhC2tEhTPKG', NULL, '2021-12-25 10:26:51', '2022-01-07 20:43:47', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `devis`
--
ALTER TABLE `devis`
  ADD CONSTRAINT `devis_entreprise_id_foreign` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprises` (`id`),
  ADD CONSTRAINT `devis_exercice_id_foreign` FOREIGN KEY (`exercice_id`) REFERENCES `exercices` (`id`),
  ADD CONSTRAINT `devis_prestation_id_foreign` FOREIGN KEY (`prestation_id`) REFERENCES `prestations` (`id`);

--
-- Contraintes pour la table `entreprises`
--
ALTER TABLE `entreprises`
  ADD CONSTRAINT `entreprises_activite_id_foreign` FOREIGN KEY (`activite_id`) REFERENCES `type_activites` (`id`),
  ADD CONSTRAINT `entreprises_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `entreprises_fiscal_id_foreign` FOREIGN KEY (`fiscal_id`) REFERENCES `regime_fiscals` (`id`);

--
-- Contraintes pour la table `missions`
--
ALTER TABLE `missions`
  ADD CONSTRAINT `missions_devis_id_foreign` FOREIGN KEY (`devis_id`) REFERENCES `devis` (`id`),
  ADD CONSTRAINT `missions_entreprise_id_foreign` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprises` (`id`),
  ADD CONSTRAINT `missions_prestation_id_foreign` FOREIGN KEY (`prestation_id`) REFERENCES `prestations` (`id`);

--
-- Contraintes pour la table `taches`
--
ALTER TABLE `taches`
  ADD CONSTRAINT `taches_mission_id_foreign` FOREIGN KEY (`mission_id`) REFERENCES `missions` (`id`),
  ADD CONSTRAINT `taches_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
