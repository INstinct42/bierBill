-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 14. Januar 2011 um 23:29
-- Server Version: 5.1.37
-- PHP-Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `bierbill`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bills`
--

DROP TABLE IF EXISTS `bills`;
CREATE TABLE `bills` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `date` int(30) NOT NULL,
  `payer_id` mediumint(8) NOT NULL,
  `desc` text NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `bills`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bills_users`
--

DROP TABLE IF EXISTS `bills_users`;
CREATE TABLE `bills_users` (
  `id` int(16) NOT NULL,
  `bill_id` mediumint(8) NOT NULL,
  `user_id` mediumint(8) NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `bills_users`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `confirm_hashes`
--

DROP TABLE IF EXISTS `confirm_hashes`;
CREATE TABLE `confirm_hashes` (
  `hash` varchar(40) NOT NULL,
  `for_user_id` mediumint(8) NOT NULL,
  `type` set('payment','bill','new','change') NOT NULL,
  `type_id` int(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `confirm_hashes`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `date` int(30) NOT NULL,
  `payer_id` mediumint(8) NOT NULL,
  `payee_id` mediumint(8) NOT NULL,
  `amount` float NOT NULL,
  `desc` text NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `payments`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `users`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_info`
--

DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` mediumint(8) NOT NULL,
  `real_name` varchar(255) NOT NULL,
  `bank_account` text NOT NULL,
  `accept_per_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `user_info`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
