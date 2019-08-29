-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2019. Aug 29. 23:20
-- Kiszolgáló verziója: 10.1.38-MariaDB
-- PHP verzió: 7.3.2

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `mvc`
--
CREATE DATABASE IF NOT EXISTS `mvc` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `mvc`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `lname` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `email` varchar(175) COLLATE utf8_hungarian_ci NOT NULL,
  `phone1` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `phone2` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `phone3` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `address2` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `state` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `zip_code` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `country` varchar(155) COLLATE utf8_hungarian_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `contacts`
--

INSERT INTO `contacts` (`id`, `fname`, `lname`, `email`, `phone1`, `phone2`, `phone3`, `address`, `address2`, `city`, `state`, `zip_code`, `country`, `user_id`) VALUES
(1, 'Istvan', 'Dracz', 'istvan.dracz@gmail.com', '06203407165', '', '', 'Megyeri út 226', '', 'Budapest', '', '1048', 'Magyarorszag', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `password` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `fname` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `lname` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `acl` text COLLATE utf8_hungarian_ci,
  `deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `fname`, `lname`, `acl`, `deleted`) VALUES
(1, 'draczi', 'istvan.dracz@gmail.com', '$2y$10$cLwJqj/naZ2oFb5px.EwLuh0JHhWPbTRo.eFERgZg/GLGS/5Z6o4O', 'Istvan', 'Dracz', '', 0),
(3, 'kovacsb', 'kovacs@gmail.com', '$2y$10$YFBPqsY6zkieuNHQ6UiMT.BWa0j0erWmjmP1odGGtJZfsEyFsl/YC', 'B&eacute;la', 'Kov&aacute;cs', NULL, NULL),
(4, 'nagygabor', 'asdsa@asfsaf.hu', '$2y$10$dZhc5dShTzAvtP05HmrrnO5vOpnj8FLMmvQhbIJqIzLZSwQkV56tS', 'G&eacute;bor', 'Nagy', NULL, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users_sessions`
--

DROP TABLE IF EXISTS `users_sessions`;
CREATE TABLE IF NOT EXISTS `users_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `session` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
