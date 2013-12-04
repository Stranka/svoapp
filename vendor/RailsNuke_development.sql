-- phpMyAdmin SQL Dump
-- version 3.3.7deb5build0.10.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 20. Juni 2011 um 15:12
-- Server Version: 5.1.49
-- PHP-Version: 5.3.3-1ubuntu9.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `RailsNuke_development`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `addresses`
--

CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `telnr` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=79 ;

--
-- Daten für Tabelle `addresses`
--

INSERT INTO `addresses` (`id`, `street`, `city`, `zipcode`, `country`, `telnr`, `mobile`, `address_type`, `created_at`, `updated_at`, `user_id`) VALUES
(71, 'Herzblumenweg 2 Haus 31', 'Wien', '1220', 'Österreich', '', '0664 123 456 7', 'Rechnungsadresse', '2011-06-12 12:02:22', '2011-06-12 12:53:30', 5),
(76, '999', '999', '999', '999', '999', '999', 'Rechnungsadresse', '2011-06-12 13:41:04', '2011-06-12 13:43:11', 63),
(77, '12', '12', '12', '12', '', '', 'Rechnungsadresse', '2011-06-17 16:11:51', '2011-06-17 16:11:51', 1),
(78, '12', '12', '12', '12', '', '', 'Rechnungsadresse', '2011-06-17 16:12:21', '2011-06-17 16:12:21', 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `format` varchar(255) DEFAULT NULL,
  `auth_level` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `auth_level_edit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Daten für Tabelle `articles`
--

INSERT INTO `articles` (`id`, `name`, `content`, `format`, `auth_level`, `created_at`, `updated_at`, `auth_level_edit`) VALUES
(1, 'Konzeptstudie', '<p>Dies ist eine Konzeptstudie f&uuml;r ein neues <strong>CMS</strong>, wobei dies der erste Artikel f&uuml;r diese neue Seite darstellt.</p>\r\n<p><a href="http://www.mittenin.at" target="_blank">dies wird ein link</a></p>', 'textile', 0, '2011-05-07 13:34:20', '2011-06-19 07:11:41', 0),
(6, 'Impressum', '<h1>Impressum</h1>\r\n<h2><em>Inhalt und Gestaltung</em></h2>\r\n<h4>Michael Stranka</h4>\r\n<p>Herzblumenweg 2<br /> 1220 Wien</p>\r\n<h4>Informatom <span class="caps">EDV</span>-Dienstleistungen e.U.</h4>\r\n<p>Mag. Stefan Haslinger<br /> Vorgartenstra&szlig;e 145/2/3<br /> 1020 Wien<br /> FN: 357693w</p>\r\n<h3><em>Haftung</em></h3>\r\n<p>Die auf http://www.mittenin.at ver&ouml;ffentlichten Inhalte sind mit gr&ouml;&szlig;ter Sorgfalt recherchiert, die technischen Services bestm&ouml;glich programmiert. Dennoch k&ouml;nnen wir keine Gew&auml;hr f&uuml;r die vollst&auml;ndige Richtigkeit &uuml;bernehmen. Alle Angaben erfolgen ohne Gew&auml;hr.<br /> Eine Haftung f&uuml;r Sch&auml;den, die sich aus der Verwendung der in http://www.mittenin.at ver&ouml;ffentlichten Inhalte oder Services ergeben, ist ausgeschlossen.</p>\r\n<h3><em>Verweise und Links</em></h3>\r\n<p>Auf den Inhalt von Webseiten hinter externen Links haben wir keinen Einfluss. Zum Zeitpunkt des Setzens waren weder illegale, fehlerhafte oder unvollst&auml;ndige Inhalte feststellbar. Die Haftung f&uuml;r die verlinkten Webseiten schlie&szlig;en wir dediziert aus, da wir keinen Einfluss auf die aktuelle und zuk&uuml;nftige Gestaltung haben.</p>\r\n<p>F&uuml;r illegale, fehlerhafte oder unvollst&auml;ndige Inhalte und insbesondere f&uuml;r Sch&auml;den, die aus der Nutzung oder Nichtnutzung solcherart dargebotener Informationen entstehen, haftet allein der Anbieter der Seite, auf welche verwiesen wurde, nicht derjenige, der &uuml;ber Links auf die jeweilige Ver&ouml;ffentlichung lediglich verweist.</p>', 'textile', 0, '2011-05-07 15:54:21', '2011-06-19 07:06:26', 0),
(7, 'Appliaktionen', '<h2>CMS@mittenin.at</h2>\r\n<p>Ein minimalistisches, aber dennoch m&auml;chtiges Content Management System, mit dem auch dieser Webauftritt realisiert wird.</p>\r\n<h2>SHOP@mittenin.at</h2>\r\n<p>Sie bekommen genau den Webshop den Sie brauchen: So einfach wie m&ouml;glich, aber so m&auml;chtig wie n&ouml;tig.</p>', 'textile', 0, '2011-05-07 15:54:46', '2011-06-19 07:01:52', 0),
(8, 'Services', '<h1>Services</h1>\r\n<p>Wir bieten Ihnen die Entwicklung von Webanwendungen insbesondere mit <span class="caps">SAP</span>-Schnittstellen und damit verbundener <span class="caps">SAP</span>-Anwendungsentwicklung. Dabei unterst&uuml;tzen wir Sie im gesamten Produktlebenszyklus:</p>\r\n<ul>\r\n<li>Projektierung\r\n<ul>\r\n<li>Prozessanalyse</li>\r\n<li>Prozessabbildung</li>\r\n<li>Schnittstellendefinition</li>\r\n<li>Machbarkeitsanalyse</li>\r\n<li>Auswahl der Software-Architektur</li>\r\n<li>Hardware Sizing</li>\r\n<li>Prototyping</li>\r\n<li>professionelle, effiziente und nachvollziehbare Abwicklung und Dokumentation von Projekten in unserem Kundenportal.</li>\r\n</ul>\r\n</li>\r\n<li>Implementierung\r\n<ul>\r\n<li>Entwicklung eines Testsystems</li>\r\n<li>Implementierung des endg&uuml;ltigen Systems</li>\r\n<li>technische Dokumentation</li>\r\n<li>Userdokumentation und Inhouse Training</li>\r\n<li>Rollout-Plan</li>\r\n<li>Deployment</li>\r\n</ul>\r\n</li>\r\n<li>Betrieb\r\n<ul>\r\n<li>Hosting</li>\r\n<li>Wartung</li>\r\n<li>Backupstrategie, -implementierung, und -ablage</li>\r\n<li>Performance Analyse und Optimierung</li>\r\n<li>Monitoring</li>\r\n</ul>\r\n</li>\r\n<li>Weiterentwicklung\r\n<ul>\r\n<li>Evaluierung und Weiterentwicklung</li>\r\n</ul>\r\n</li>\r\n</ul>\r\n<h2>Unsere Methode</h2>\r\n<ul>\r\n<li>Rapid Application Development mit <a href="http://rubyonrails.org" target="_blank">Ruby on Rails</a></li>\r\n<li>kompletter Open Source Anwendungsstack: Linux + Apache + MySQL + Ruby + Rails</li>\r\n</ul>\r\n<h2>Ihre Vorteile</h2>\r\n<p>Entwicklung in Ruby on Rails bedeutet:</p>\r\n<ul>\r\n<li>kurze Entwicklungszeiten</li>\r\n<li>geringer Entwicklungsaufwand</li>\r\n<li>kosteng&uuml;nstige Neu- und Weiterentwicklung</li>\r\n<li>qualitativ hochwertiger, strukturierter, kompakter, gut lesbarer Code</li>\r\n<li>zukunftssichere Technologie</li>\r\n<li>langfristige Wartbarkeit</li>\r\n<li>keine Lizenzkosten</li>\r\n<li>st&auml;ndige wachsende Entwicklerbasis</li>\r\n</ul>', 'textile', 0, '2011-05-07 16:00:37', '2011-06-19 07:16:03', 50),
(9, 'Herzlich Willkommen', '<h2>Was ist mittenin.at ?</h2>\r\n<h3>Michael Stranka und Stefan Haslinger betreiben Rapid Application Development mit Ruby on Rails.</h3>\r\n<p><strong><br /></strong></p>\r\n<table border="0">\r\n<tbody>\r\n<tr>\r\n<td><strong>R</strong></td>\r\n<td>apid</td>\r\n<td>Wir bieten rasche und effiziente</td>\r\n</tr>\r\n<tr>\r\n<td><strong>A</strong></td>\r\n<td>pplication</td>\r\n<td>...Webanwendungs</td>\r\n</tr>\r\n<tr>\r\n<td><strong>D</strong></td>\r\n<td>evelopment</td>\r\n<td>...Entwicklung</td>\r\n</tr>\r\n<tr>\r\n<td><strong>R</strong></td>\r\n<td>uby</td>\r\n<td>...in der Programmiersprache Ruby</td>\r\n</tr>\r\n<tr>\r\n<td><strong>R</strong></td>\r\n<td>ails</td>\r\n<td>...auf Basis des Rails Frameworks</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', 'textile', 0, '2011-05-07 16:04:47', '2011-06-19 07:20:28', 0),
(10, 'Referenzen', '<p>Bogner Edelstahl</p>\r\n<p>Motorola Solutions</p>\r\n<p>KM-S&auml;gen</p>', 'textile', 0, '2011-05-12 18:49:47', '2011-06-18 20:34:29', 50),
(11, 'Kundenmeinungen', '<p>"...die entwickelte Rails-Plattform l&auml;uft stabil, das Backend ist einfach zu bedienen! Unsere Erwartungen wurden zur G&auml;nze erf&uuml;llt. Vielen Dank!"</p>\r\n<p>"Wir sind von unserem neuen und gelungenen Internetauftritt begeistert, welcher unsere Erwartungen voll erf&uuml;llt. M&ouml;glich wurde dies durch die sehr gute Zusammenarbeit mit dem Team von mittenin.at. Die Kreativit&auml;t und das sehr engagierte Handeln haben uns beeindruckt."</p>\r\n<p>"Kompetenz und Professionalit&auml;t, freundliche Beratung und schnelle Abwicklung unter einem Dach - besser geht''s nicht!"</p>', 'textile', 0, '2011-05-12 19:12:21', '2011-06-18 20:34:57', 50),
(12, 'test', '<p><strong>test</strong></p>\r\n<ul>\r\n<li><strong>1</strong></li>\r\n<li><strong>2</strong></li>\r\n<li><strong>3</strong></li>\r\n<li><strong>4</strong></li>\r\n<li><strong>5</strong></li>\r\n<li>6</li>\r\n<li>7</li>\r\n<li>8</li>\r\n<li>9</li>\r\n</ul>\r\n<h1 style="text-align: center;"><span style="background-color: #00ff00;">re</span><img title="Kiss" src="../../tinymce/jscripts/tiny_mce/plugins/emotions/img/smiley-kiss.gif" alt="Kiss" border="0" />test</h1>\r\n<p><span style="font-size: large;"><strong>test</strong></span></p>\r\n<ul>\r\n<li><span style="font-size: large;"><strong>1</strong></span>\r\n<ul>\r\n<li><span style="font-size: large;"><strong>11</strong></span>\r\n<ul>\r\n<li><span style="font-size: large;"><strong>111</strong></span>\r\n<ul>\r\n<li><span style="font-size: large;"><strong>1111</strong></span>\r\n<ul>\r\n<li><span style="font-size: large;"><strong>11111</strong></span></li>\r\n</ul>\r\n</li>\r\n</ul>\r\n</li>\r\n</ul>\r\n</li>\r\n</ul>\r\n</li>\r\n<li><span style="font-size: large;"><strong>2</strong></span></li>\r\n<li><span style="font-size: large;"><strong>3</strong></span></li>\r\n<li><span style="font-size: large;"><strong>4</strong></span></li>\r\n<li><span style="font-size: large;"><strong>5</strong></span></li>\r\n<li><span style="font-size: large;">6</span></li>\r\n<li><span style="font-size: large;">7</span></li>\r\n<li><span style="font-size: large;">8</span></li>\r\n<li><span style="font-size: large;">9</span></li>\r\n</ul>', 'textile', 0, '2011-06-18 20:21:16', '2011-06-19 15:05:48', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `basketlines`
--

CREATE TABLE IF NOT EXISTS `basketlines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basket_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax_percentage` int(11) NOT NULL DEFAULT '0',
  `producer_number` varchar(255) DEFAULT NULL,
  `weight` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Daten für Tabelle `basketlines`
--

INSERT INTO `basketlines` (`id`, `basket_id`, `product_id`, `quantity`, `value`, `price`, `tax_percentage`, `producer_number`, `weight`, `created_at`, `updated_at`) VALUES
(15, 6, 1, 1, '19.00', '19.00', 10, NULL, '0.00', '2011-06-20 12:56:00', '2011-06-20 12:56:00'),
(16, 6, 6, 1, '29.90', '29.90', 10, NULL, '0.00', '2011-06-20 12:58:19', '2011-06-20 12:58:19'),
(17, 6, 2, 1, '19.99', '19.99', 10, NULL, '0.00', '2011-06-20 13:11:05', '2011-06-20 13:11:05');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `baskets`
--

CREATE TABLE IF NOT EXISTS `baskets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `shipmentterms` varchar(255) DEFAULT NULL,
  `paymentterms` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `store` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `auth_level` int(11) NOT NULL DEFAULT '0',
  `auth_level_edit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Daten für Tabelle `baskets`
--

INSERT INTO `baskets` (`id`, `session_id`, `customer_id`, `status`, `shipmentterms`, `paymentterms`, `order_number`, `store`, `created_at`, `updated_at`, `auth_level`, `auth_level_edit`) VALUES
(6, '88ec55052be4faaace6d0a2322012594', 5, 'offen', NULL, NULL, NULL, NULL, '2011-06-20 12:56:00', '2011-06-20 12:56:00', 100, 100);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `blocks`
--

CREATE TABLE IF NOT EXISTS `blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `headerline` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `fieldorder` int(11) DEFAULT NULL,
  `blockid` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `auth_level` int(11) NOT NULL DEFAULT '0',
  `auth_level_edit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64810950 ;

--
-- Daten für Tabelle `blocks`
--

INSERT INTO `blocks` (`id`, `name`, `headerline`, `position`, `fieldorder`, `blockid`, `active`, `created_at`, `updated_at`, `auth_level`, `auth_level_edit`) VALUES
(64810938, 'Login', 'Anmeldeinformationen', 'rechts', 10, 'login', 1, '2011-05-07 10:04:03', '2011-06-20 07:04:01', 0, 50),
(64810942, 'Menü', 'Seitennavigation', 'links', 15, 'menue', 1, '2011-05-07 17:15:54', '2011-05-16 08:06:02', 0, 50),
(64810944, 'News', 'Was sich bei uns tut', 'links', 999, 'news', 1, '2011-05-11 20:09:30', '2011-05-15 15:41:49', 0, 0),
(64810945, 'Kundenmeinungen', 'Was unsere Kunden sagen', 'rechts', 9999, 'kundenmeinungen', 1, '2011-05-12 18:48:31', '2011-05-18 06:15:51', 0, 50),
(64810946, 'Referenzen', 'Einige unserer Kunden', 'rechts', 50, 'referenzen', 1, '2011-05-12 18:48:50', '2011-06-20 07:05:15', 0, 50),
(64810947, 'Produktkatalog', 'Unser Angebot', 'links', 100, 'productclass', 1, '2011-05-16 13:08:27', '2011-05-16 13:08:27', 0, 50),
(64810948, 'test', 'kopfzeile', 'links', 99, 'userblock1', 0, '2011-06-18 14:03:15', '2011-06-18 14:15:54', 0, 0),
(64810949, 'Warenkorb', 'Informationen', 'rechts', 8, 'basket', 1, '2011-06-20 07:04:53', '2011-06-20 07:04:53', 0, 50);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `configurations`
--

CREATE TABLE IF NOT EXISTS `configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block_left` tinyint(1) DEFAULT NULL,
  `block_left_width` int(11) DEFAULT NULL,
  `block_right` tinyint(1) DEFAULT NULL,
  `block_right_width` int(11) DEFAULT NULL,
  `pagewidth` int(11) DEFAULT NULL,
  `block_headerline` tinyint(1) DEFAULT NULL,
  `position_logo` varchar(255) DEFAULT NULL,
  `topimage` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `articles_name` varchar(255) DEFAULT NULL,
  `manage_tree` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64810938 ;

--
-- Daten für Tabelle `configurations`
--

INSERT INTO `configurations` (`id`, `block_left`, `block_left_width`, `block_right`, `block_right_width`, `pagewidth`, `block_headerline`, `position_logo`, `topimage`, `created_at`, `updated_at`, `articles_name`, `manage_tree`) VALUES
(64810937, 1, 15, 1, 15, 95, 1, 'left', 1, '2011-05-06 17:04:17', '2011-06-20 11:28:46', '9', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `menues`
--

CREATE TABLE IF NOT EXISTS `menues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `the_url` varchar(255) DEFAULT NULL,
  `the_controller` varchar(255) DEFAULT NULL,
  `the_action` varchar(255) DEFAULT NULL,
  `auth_level` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  `ontop` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `the_id` int(11) DEFAULT NULL,
  `auth_level_edit` int(11) NOT NULL DEFAULT '0',
  `ancestry` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=768773826 ;

--
-- Daten für Tabelle `menues`
--

INSERT INTO `menues` (`id`, `name`, `position`, `the_url`, `the_controller`, `the_action`, `auth_level`, `parent_id`, `ontop`, `active`, `created_at`, `updated_at`, `the_id`, `auth_level_edit`, `ancestry`) VALUES
(768773798, 'Home', 90, '', 'articles', 'showme', 0, 0, 1, 1, '2011-05-07 13:56:14', '2011-05-20 08:44:12', 10, 50, NULL),
(768773799, 'Impressum', 91, '', 'articles', 'show_content', 0, 0, 1, 1, '2011-05-07 15:07:51', '2011-05-20 08:44:14', 6, 50, NULL),
(768773800, 'Applikationen', 92, '', 'articles', 'show_content', 0, 0, 1, 1, '2011-05-07 15:44:10', '2011-05-20 08:44:24', 7, 50, NULL),
(768773801, 'Services', 102, '', 'articles', 'show_content', 0, 0, 1, 1, '2011-05-07 16:01:25', '2011-05-20 08:44:27', 8, 50, NULL),
(768773807, 'Administration', 104, '', '', '', 50, 0, 0, 1, '2011-05-11 07:46:26', '2011-05-20 08:44:30', 6, 50, 'open'),
(768773808, 'Konfiguration', 3, '', 'configurations', 'index', 50, 768773807, 0, 1, '2011-05-11 07:49:37', '2011-06-20 11:28:33', NULL, 50, NULL),
(768773809, 'Menü', 2, '', 'menues', 'index', 0, 768773807, 0, 1, '2011-05-11 07:56:08', '2011-06-20 11:28:35', NULL, 0, NULL),
(768773810, 'Blöcke', 1, '', 'blocks', 'index', 50, 768773807, 0, 1, '2011-05-11 07:56:30', '2011-06-08 18:03:32', NULL, 50, NULL),
(768773811, 'Artikel', 5, '', 'articles', 'index', 0, 768773807, 0, 1, '2011-05-11 07:56:51', '2011-06-20 11:28:31', NULL, 0, NULL),
(768773812, 'Benutzer', 4, '', 'users', 'index', 0, 768773807, 0, 1, '2011-05-11 07:57:16', '2011-06-20 11:28:32', NULL, 0, NULL),
(768773813, 'Produktkatalog', 5, '', 'productclasses', 'index', 0, 768773823, 0, 1, '2011-05-11 07:57:45', '2011-05-20 08:43:26', NULL, 50, NULL),
(768773814, 'Produkte', 6, '', 'products', 'index', 0, 768773823, 0, 1, '2011-05-11 07:57:59', '2011-05-20 08:43:26', NULL, 50, NULL),
(768773819, 'Mittenin', 103, 'http://www.mittenin.at', '', '', 0, 0, 1, 1, '2011-05-11 15:25:51', '2011-05-20 08:44:30', NULL, 0, NULL),
(768773822, 'News', 8, '', 'news', 'index', 50, 768773807, 0, 1, '2011-05-11 20:00:06', '2011-06-20 11:28:29', NULL, 50, NULL),
(768773823, 'Shop Administration', 9, '', '', '', 0, 768773807, 0, 1, '2011-05-16 13:03:21', '2011-06-20 11:28:26', NULL, 50, 'open'),
(768773824, 'Versandart', 7, '', 'shipments', 'index', 50, 768773823, 0, 1, '2011-06-04 16:14:32', '2011-06-04 16:14:32', NULL, 50, NULL),
(768773825, 'Basket', 1, '', 'baskets', 'index', 0, 768773807, 0, 1, '2011-06-20 11:28:10', '2011-06-20 11:28:35', NULL, 50, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `notice` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `auth_level` int(11) NOT NULL DEFAULT '0',
  `auth_level_edit` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Daten für Tabelle `news`
--

INSERT INTO `news` (`id`, `title`, `date`, `notice`, `format`, `auth_level`, `auth_level_edit`, `created_at`, `updated_at`) VALUES
(3, 'Webshop Online', '2011-05-02', 'Testversion Webshop online gestellt: Wir freuen uns, dass unser Webshop nun für den Vertrieb von Kommunikationslösungen bei einem großen Anbieter für Funkgeräte unter die Lupe genommen wird.', 'raw', 0, 0, '2011-05-12 20:23:07', '2011-06-19 07:49:44'),
(4, 'Neues Design', '2011-05-03', 'Ab sofort präsentiert sich mittenin.at in einem neuen Gewand', 'textile', 0, 0, '2011-05-12 20:23:53', '2011-05-12 20:23:53');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `productclasses`
--

CREATE TABLE IF NOT EXISTS `productclasses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `picture` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ancestry` varchar(255) DEFAULT NULL,
  `auth_level` int(11) NOT NULL DEFAULT '0',
  `auth_level_edit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_productclasses_on_ancestry` (`ancestry`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=450215446 ;

--
-- Daten für Tabelle `productclasses`
--

INSERT INTO `productclasses` (`id`, `name`, `url`, `parent_id`, `picture`, `position`, `created_at`, `updated_at`, `ancestry`, `auth_level`, `auth_level_edit`) VALUES
(64810937, 'Bücher', 'x', 0, 'logo.jpg', 1, '2011-05-08 16:49:20', '2011-06-03 11:09:46', 'open', 0, 0),
(450215437, 'DVDs', 'x', 0, '', 2, '2011-05-08 16:49:20', '2011-06-03 11:09:46', 'open', 0, 0),
(450215438, 'Krimis', 'x', 64810937, '', 3, '2011-05-08 17:14:45', '2011-06-03 11:09:36', 'open', 0, 0),
(450215439, 'Sachbücher', 'x', 64810937, '', 4, '2011-05-08 17:22:32', '2011-06-03 11:09:36', 'close', 0, 0),
(450215440, 'Action', 'x', 450215437, '', 5, '2011-05-08 17:22:54', '2011-05-10 20:48:06', 'open', 0, 0),
(450215441, 'Horror', 'x', 450215437, '', 6, '2011-05-08 17:23:08', '2011-05-10 20:48:14', 'close', 0, 0),
(450215443, 'Inland', NULL, 450215438, '', 7, '2011-05-08 20:10:12', '2011-06-03 11:09:16', 'close', 0, 0),
(450215444, 'Ausland', NULL, 450215438, '', 8, '2011-05-09 11:56:49', '2011-06-20 06:46:57', 'close', 0, 0),
(450215445, 'VHS', NULL, 0, '', 3, '2011-05-10 16:16:42', '2011-06-03 11:09:44', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shorttext` varchar(255) DEFAULT NULL,
  `description` text,
  `producer` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `special_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `product_features` varchar(255) DEFAULT NULL,
  `weight` decimal(10,0) NOT NULL DEFAULT '0',
  `unit_of_weight` varchar(255) DEFAULT NULL,
  `unit_of_quantity` varchar(255) DEFAULT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT '0',
  `image_url` varchar(255) DEFAULT NULL,
  `specification_sheet` varchar(255) DEFAULT NULL,
  `auth_level` int(11) NOT NULL DEFAULT '0',
  `auth_level_edit` int(11) NOT NULL DEFAULT '0',
  `productclass_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Daten für Tabelle `products`
--

INSERT INTO `products` (`id`, `shorttext`, `description`, `producer`, `price`, `special_price`, `product_features`, `weight`, `unit_of_weight`, `unit_of_quantity`, `tax_percentage`, `image_url`, `specification_sheet`, `auth_level`, `auth_level_edit`, `productclass_id`, `created_at`, `updated_at`) VALUES
(1, 'Harry Potter 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur urna tortor, eleifend euismod elementum eu, consequat placerat ipsum. Phasellus laoreet nisi sed nisl gravida elementum. Etiam vitae mauris nulla. Aenean iaculis elit a augue tincidunt non fermentum tortor mattis. Donec id enim tortor, sit amet dictum felis. Integer sit amet dolor at risus varius ornare. Ut volutpat volutpat mi, nec porta sapien ultricies a. Nulla justo magna, fringilla non commodo adipiscing, adipiscing ut nisi. Aenean erat libero, eleifend eu porta in, volutpat vitae justo. Pellentesque ut leo in metus commodo condimentum.\r\n\r\nNunc sollicitudin interdum elit, sit amet ullamcorper velit tincidunt non. Aenean et eros odio, in ullamcorper ipsum. Proin tristique bibendum imperdiet. Vestibulum eget ligula ligula. Fusce quis nulla non massa scelerisque venenatis id at dolor. Nulla diam ipsum, facilisis non lobortis ac, vulputate vel orci. Suspendisse imperdiet, nisl vitae aliquet viverra, felis metus tristique libero, cursus ornare risus odio et eros. Sed nec mauris hendrerit lectus ultricies eleifend vel nec risus. Donec mi ante, rhoncus nec commodo eget, gravida eu mi. Maecenas at nunc orci, a aliquam lectus. Suspendisse potenti. Morbi imperdiet elementum tortor, sit amet bibendum est adipiscing quis. Nam lectus ipsum, pulvinar nec tincidunt vel, volutpat et risus. Cras hendrerit blandit purus ac dapibus. Vestibulum sed dui risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse sem orci, suscipit nec tempus eu, mattis ultrices enim.\r\n\r\nAliquam erat volutpat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Proin at eros ac ligula porttitor dapibus. Quisque vulputate aliquet nunc, consequat sollicitudin ante consectetur ac. Nullam faucibus lacus at erat elementum mollis. In hac habitasse platea dictumst. Mauris vehicula, neque non cursus interdum, lectus tortor ultricies diam, scelerisque dapibus est ante eget mi. Nunc rutrum mattis turpis id fermentum. Aenean rhoncus arcu in tellus aliquam posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed sit amet condimentum tellus. Praesent posuere, diam in semper porttitor, odio nisl commodo odio, eget luctus lorem dui vitae erat. Donec semper scelerisque ipsum, condimentum blandit nulla elementum quis. Nulla facilisi. Morbi nec turpis commodo risus tempor fringilla quis ut nunc. Donec id velit nec ligula rutrum laoreet. Morbi ac elit non metus vestibulum ultricies. Donec suscipit porta massa, id pulvinar quam pharetra mollis.\r\n\r\nUt vel tincidunt dolor. Nullam varius elementum dui, id sollicitudin felis sagittis porta. Donec tristique dui gravida orci faucibus pellentesque. Pellentesque imperdiet mollis lorem et hendrerit. Nam blandit odio ut mauris euismod pulvinar. Maecenas mattis rutrum porta. Aenean vel enim mi, at tincidunt purus. Aliquam laoreet, libero in fringilla dignissim, mi dolor malesuada massa, vitae hendrerit diam orci sed erat. Integer dui diam, condimentum at ornare ut, aliquet vitae sem. Nunc porta massa eu tellus mattis gravida. Nam elit lacus, consequat et fringilla ac, porttitor ut elit.\r\n\r\nVestibulum lobortis vestibulum imperdiet. Quisque commodo ultricies dolor, tristique tincidunt nibh dapibus id. Donec scelerisque, arcu ac lacinia suscipit, nisi lacus viverra odio, non imperdiet massa quam at justo. In molestie vulputate nisi, vel venenatis lectus vestibulum et. Vestibulum ultrices lobortis nisl, sed sollicitudin sem feugiat vel. Etiam ac ligula id odio faucibus pharetra quis ac quam. Nam nec eros lorem. Proin scelerisque, lectus nec pharetra imperdiet, nulla mi consectetur nibh, ut dapibus tortor ante et massa. Sed sollicitudin nisl eget velit porttitor tempor. Donec imperdiet libero a enim congue sed lobortis nisi condimentum. Nullam a justo id nisi porttitor faucibus. Nam mollis ultrices enim, id sagittis tortor interdum in. Nulla posuere, justo a placerat feugiat, nisl mi volutpat mi, non facilisis lacus diam euismod nibh. In sit amet sem id tellus faucibus sodales eu a urna. Praesent mattis lobortis lacus ac auctor. Vivamus at venenatis turpis. Donec egestas molestie nulla sagittis aliquet. Maecenas urna augue, adipiscing non porttitor a, euismod vitae lectus. Nulla facilisi. ', 'producer', '19.00', '0.00', '', '1', 'kg', 'Stk', 10, 'dasduelldermagier.jpeg', 'RE_42628.pdf', 0, 0, 450215444, '2011-05-09 13:51:00', '2011-05-09 20:04:34'),
(2, 'Krimi', 'bla', 'bla', '19.99', '15.00', '', '1', 'kg', 'Stk', 10, 'images.jpeg', 'test.pdf', 0, 0, 450215443, '2011-05-09 19:13:09', '2011-06-19 15:03:45'),
(3, '1', '1', '1', '0.00', '0.00', '', '0', '', '', 0, NULL, NULL, 0, 0, NULL, '2011-06-04 17:41:30', '2011-06-04 17:41:30'),
(4, '1', '1', '1', '0.00', '0.00', '', '0', '', '', 0, 'logo2.jpg', NULL, 0, 0, NULL, '2011-06-04 17:41:49', '2011-06-04 17:41:49'),
(5, '1', '1', '1', '0.00', '0.00', '', '0', '', '', 0, NULL, NULL, 0, 0, 64810937, '2011-06-04 17:41:59', '2011-06-04 17:41:59'),
(6, 'Krimi 2', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaa\r\n', '', '29.90', '0.00', '', '1', 'kg', 'Stk', 10, 'HE_HRT_SET_01.jpg', NULL, 0, 0, 450215444, '2011-06-20 08:34:32', '2011-06-20 08:35:46');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

--
-- Daten für Tabelle `sessions`
--

INSERT INTO `sessions` (`id`, `session_id`, `data`, `created_at`, `updated_at`) VALUES
(24, '216de726a34469951aa9a1fa8b60dd75', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFLbmtiRW9FaXJ6YXdvdUlTd29D\nOUY3WjNYZkt2RDRzcVQ0Zmo4dlgyTVRJPQY7AEZJIgpmbGFzaAY7AEZJQzol\nQWN0aW9uRGlzcGF0Y2g6OkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlSSIX\nTG9nb3V0IHN1Y2Nlc3NmdWwhBjsARgY6CkB1c2VkbzoIU2V0BjoKQGhhc2h7\nBjsHVA==\n', '2011-05-21 14:37:13', '2011-05-21 14:59:51'),
(25, '18aff008800684cd1cf002ec4d93b49b', 'BAh7CEkiEF9jc3JmX3Rva2VuBjoGRUZJIjFDNlBKS21oejdjb2dpM0JqSjJL\nSzM4d29DUGx1WFZmeTVnRWRLSHlnblY4PQY7AEZJIhV1c2VyX2NyZWRlbnRp\nYWxzBjsARkkiAYAyZDllMTJkZDMzYTA3YmFkOWJiODYyZTc4OWJkZjY1NGYx\nMWE0MTUzZDA2NmNmZDJkY2U2MDkyYWE4NjJiZTdlODk4NGZhNzQ1Yjc2NWU1\nZTNkNzNmNzc5ZWFjYjVkNGE0MzdlZjEwYTBkYTIzYjU2YjU3YTYzOTllNzBi\nNWFmYQY7AFRJIhh1c2VyX2NyZWRlbnRpYWxzX2lkBjsARmkK\n', '2011-06-03 11:00:23', '2011-06-03 11:00:35'),
(26, '1b1612229d9fa10b10fde385613ac12e', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFKRWZXUnVoaVJkRFhuN3J1NFh6\nYWcrb2thSyt3bllnL0Zma2IzZzNqblZrPQY7AEZJIgpmbGFzaAY7AEZJQzol\nQWN0aW9uRGlzcGF0Y2g6OkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlSSIX\nTG9nb3V0IHN1Y2Nlc3NmdWwhBjsARgY6CkB1c2VkbzoIU2V0BjoKQGhhc2h7\nBjsHVA==\n', '2011-06-03 11:06:00', '2011-06-03 13:23:12'),
(27, 'a50f5b35f2fc34dea59daba21a2a70cc', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF1QTNQV2xxRVprOXpOR2dBUGYy\nb1ZIZ3VueVQ2WlA2Qzc5TWdGb2lvZjc4PQY7AEZJIgpmbGFzaAY7AEZJQzol\nQWN0aW9uRGlzcGF0Y2g6OkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlSSIX\nTG9nb3V0IHN1Y2Nlc3NmdWwhBjsARgY6CkB1c2VkbzoIU2V0BjoKQGhhc2h7\nBjsHVA==\n', '2011-06-03 17:43:55', '2011-06-03 20:40:38'),
(28, 'e5aba28a6d276a1048f9674010b8c266', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjErcU1lbUtCVTFHbXJUcEY1VmpQ\nTG43NWkrNUpKc1NKUFRXRTl0NE81UUd3PQY7AEY=\n', '2011-06-04 09:13:16', '2011-06-04 09:13:16'),
(29, '842c0b16c7f708a56df8a69bc8593770', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFkNm9yN1VGZGdTc250VXdpY05U\nZVFSbFlVUzZYOGtrU3NEV0lPMHJLNkFJPQY7AEY=\n', '2011-06-04 09:30:14', '2011-06-04 09:30:14'),
(30, '7094c81506969a80d66d0542a7afd4e7', 'BAh7CEkiEF9jc3JmX3Rva2VuBjoGRUZJIjF6aEhFeW1Oc2plNDI1M2swSnVX\nbWtJQXlQOThVMXNPQitFQ0JyeDJOUE9RPQY7AEZJIhV1c2VyX2NyZWRlbnRp\nYWxzBjsARkkiAYAyZDllMTJkZDMzYTA3YmFkOWJiODYyZTc4OWJkZjY1NGYx\nMWE0MTUzZDA2NmNmZDJkY2U2MDkyYWE4NjJiZTdlODk4NGZhNzQ1Yjc2NWU1\nZTNkNzNmNzc5ZWFjYjVkNGE0MzdlZjEwYTBkYTIzYjU2YjU3YTYzOTllNzBi\nNWFmYQY7AFRJIhh1c2VyX2NyZWRlbnRpYWxzX2lkBjsARmkK\n', '2011-06-04 11:59:47', '2011-06-04 11:59:52'),
(31, 'c95d8ab50c9817e512d376916db4e43a', 'BAh7CEkiEF9jc3JmX3Rva2VuBjoGRUZJIjE4TG5SSm12eWtFUUxtSlNQbW5j\nRVI4Q2VKa3pIYUxjZUNPUnN6L09CanB3PQY7AEZJIhV1c2VyX2NyZWRlbnRp\nYWxzBjsARkkiAYAyZDllMTJkZDMzYTA3YmFkOWJiODYyZTc4OWJkZjY1NGYx\nMWE0MTUzZDA2NmNmZDJkY2U2MDkyYWE4NjJiZTdlODk4NGZhNzQ1Yjc2NWU1\nZTNkNzNmNzc5ZWFjYjVkNGE0MzdlZjEwYTBkYTIzYjU2YjU3YTYzOTllNzBi\nNWFmYQY7AFRJIhh1c2VyX2NyZWRlbnRpYWxzX2lkBjsARmkK\n', '2011-06-04 14:40:20', '2011-06-04 14:45:57'),
(32, 'd0b591b339dc836662fe7b8829d1d9a2', 'BAh7CEkiEF9jc3JmX3Rva2VuBjoGRUZJIjErUCtORUppVUs5WHB3SE1WR01P\nVnlUcmNlSWo1d25hMzcwMjRISjFhWmhJPQY7AEZJIhV1c2VyX2NyZWRlbnRp\nYWxzBjsARkkiAYAyZDllMTJkZDMzYTA3YmFkOWJiODYyZTc4OWJkZjY1NGYx\nMWE0MTUzZDA2NmNmZDJkY2U2MDkyYWE4NjJiZTdlODk4NGZhNzQ1Yjc2NWU1\nZTNkNzNmNzc5ZWFjYjVkNGE0MzdlZjEwYTBkYTIzYjU2YjU3YTYzOTllNzBi\nNWFmYQY7AFRJIhh1c2VyX2NyZWRlbnRpYWxzX2lkBjsARmkK\n', '2011-06-04 16:09:14', '2011-06-04 17:42:06'),
(33, 'a2a49a604d949d63193b5ee686665436', 'BAh7CUkiEF9jc3JmX3Rva2VuBjoGRUZJIjFFdEVrUUs2TU5vdFo3Ym11T0Ew\nbWE3ZWJ4SWFWMmNYSjFJcVBmRHJKdTlrPQY7AEZJIg5yZXR1cm5fdG8GOwBG\nSSIPL3VzZXJzL25ldwY7AEZJIhV1c2VyX2NyZWRlbnRpYWxzBjsARkkiAYAy\nZDllMTJkZDMzYTA3YmFkOWJiODYyZTc4OWJkZjY1NGYxMWE0MTUzZDA2NmNm\nZDJkY2U2MDkyYWE4NjJiZTdlODk4NGZhNzQ1Yjc2NWU1ZTNkNzNmNzc5ZWFj\nYjVkNGE0MzdlZjEwYTBkYTIzYjU2YjU3YTYzOTllNzBiNWFmYQY7AFRJIhh1\nc2VyX2NyZWRlbnRpYWxzX2lkBjsARmkK\n', '2011-06-05 09:57:34', '2011-06-05 20:36:34'),
(34, 'd51adbdfcdc94109382b443ccd6b18d6', 'BAh7CEkiEF9jc3JmX3Rva2VuBjoGRUZJIjExUDNKQlpRSFJUVjhLTVVEblM2\nNnVFbUwySWZZVTczZWVRazlGQW1kQzlNPQY7AEZJIhV1c2VyX2NyZWRlbnRp\nYWxzBjsARkkiAYAyZDllMTJkZDMzYTA3YmFkOWJiODYyZTc4OWJkZjY1NGYx\nMWE0MTUzZDA2NmNmZDJkY2U2MDkyYWE4NjJiZTdlODk4NGZhNzQ1Yjc2NWU1\nZTNkNzNmNzc5ZWFjYjVkNGE0MzdlZjEwYTBkYTIzYjU2YjU3YTYzOTllNzBi\nNWFmYQY7AFRJIhh1c2VyX2NyZWRlbnRpYWxzX2lkBjsARmkK\n', '2011-06-06 06:14:26', '2011-06-06 19:03:45'),
(35, '57f6e390b22eb8e4afa52bcf82f50b1e', 'BAh7CEkiEF9jc3JmX3Rva2VuBjoGRUZJIjFGalcrTzlPOWpOSzBTcGV4RFd5\nOVlCaTIwRlRaN2hGSTZhUmR0T2JsUmVZPQY7AEZJIhV1c2VyX2NyZWRlbnRp\nYWxzBjsARkkiAYAyZDllMTJkZDMzYTA3YmFkOWJiODYyZTc4OWJkZjY1NGYx\nMWE0MTUzZDA2NmNmZDJkY2U2MDkyYWE4NjJiZTdlODk4NGZhNzQ1Yjc2NWU1\nZTNkNzNmNzc5ZWFjYjVkNGE0MzdlZjEwYTBkYTIzYjU2YjU3YTYzOTllNzBi\nNWFmYQY7AFRJIhh1c2VyX2NyZWRlbnRpYWxzX2lkBjsARmkK\n', '2011-06-07 15:38:25', '2011-06-07 18:55:14'),
(36, '08e988533757246fc793938fb56f1b50', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFmZTNtSWlnQVQ3ZENJbk40VkUr\nNHEzRDJsOFQwRk5VWktNQVRVUHNIaTk0PQY7AEY=\n', '2011-06-08 13:59:35', '2011-06-08 13:59:35'),
(37, 'dcaef4befd5038d0bc714982c1e018d3', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE3dFhKUzExL2lacmh3RFdkMmVG\nSGVTRXNHWU1JaUpFWWNpeXdnL0tORVRBPQY7AEZJIgpmbGFzaAY7AEZJQzol\nQWN0aW9uRGlzcGF0Y2g6OkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlSSIX\nTG9nb3V0IHN1Y2Nlc3NmdWwhBjsARgY6CkB1c2VkbzoIU2V0BjoKQGhhc2h7\nBjsHVA==\n', '2011-06-08 17:44:05', '2011-06-08 18:49:31'),
(38, '2919864b7b5c82a4f816ad830f93a73d', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFobE1Lb0M3Y2VZaUJNbEQrcXhn\nNzQ2V0l1bXNNZ0NoTlNpMVFmNUlnU3pVPQY7AEZJIgpmbGFzaAY7AEZJQzol\nQWN0aW9uRGlzcGF0Y2g6OkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlSSIX\nTG9nb3V0IHN1Y2Nlc3NmdWwhBjsARgY6CkB1c2VkbzoIU2V0BjoKQGhhc2h7\nBjsHVA==\n', '2011-06-08 18:45:24', '2011-06-08 18:47:08'),
(39, '394b6838be08529918bd5a95cf2362ee', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFuTzd3MGhtZklNSzc4Y0ZWZVc5\nMDgvak1rYnk0dmo0TFFGTlVFeWxZdnM4PQY7AEY=\n', '2011-06-09 18:22:56', '2011-06-09 18:26:41'),
(40, '55536f8c0d0d232b90e73c7b210a57dc', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFYR3dmNkI0ZzFwYWFySVlzRnd5\ncFdEeUZVd3ZSR0ZhcStuTXNnOEJrdE8wPQY7AEY=\n', '2011-06-11 08:00:42', '2011-06-11 08:08:21'),
(41, '0e02e0c20b4ae2e413a640d7dd1c26da', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEwZkRSY3QxU09Oc3pGZWVRUVRV\nTWFpYTdzcVpTZnpGVGRlSnpvcWdRVDNvPQY7AEZJIgpmbGFzaAY7AEZJQzol\nQWN0aW9uRGlzcGF0Y2g6OkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlSSIX\nTG9nb3V0IHN1Y2Nlc3NmdWwhBjsARgY6CkB1c2VkbzoIU2V0BjoKQGhhc2h7\nBjsHVA==\n', '2011-06-11 15:11:54', '2011-06-11 17:24:18'),
(42, 'ffd5019ce4a96cc173f2bec385f85190', 'BAh7CUkiEF9jc3JmX3Rva2VuBjoGRUZJIjFFWUR5MGJBaUExVHRJSVJtcDQy\nNXdSRC9QMUFYc0Ztc1dObStZMDRmRXEwPQY7AEZJIg5yZXR1cm5fdG8GOwBG\nSSILL3VzZXJzBjsARkkiFXVzZXJfY3JlZGVudGlhbHMGOwBGSSIBgGEyZTUx\nN2I1NGYwNWM3YzMyZmVhNzY5ZTk1ZTlkMmNkNjQ3NjQzNDVlYzY2ODViYWUz\nNDIzYjI4MDZhYTEzZTVhZGMxZjZlMDRlMjkwOTNhZWUxYzk0NmE1YWU3ZWEy\nNzM2NTE4ZDdkMGU3YjIzYmEwYjA4M2ZmMTA4ZTIyMDA4BjsAVEkiGHVzZXJf\nY3JlZGVudGlhbHNfaWQGOwBGaTU=\n', '2011-06-11 17:24:25', '2011-06-11 18:44:29'),
(43, 'fe81070282cc9d97d9d7dd44e6b7a9f5', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFyMThJNGtwMEpjb3REOTZYWXJP\nK0ZyejBmMkhvUW1vU21tMEtlVEhMaVBFPQY7AEZJIg5yZXR1cm5fdG8GOwBG\nSSIPL2N1c3RvbWVycwY7AEY=\n', '2011-06-12 07:42:00', '2011-06-12 08:01:28'),
(44, 'd732c92764831ca88059747a27d82935', 'BAh7CUkiEF9jc3JmX3Rva2VuBjoGRUZJIjFvUlJyckdjTTRDVVE1WWFubjBh\nSWVJeHhYdWI4VzdXWXY2UnNQSEsybVBZPQY7AEZJIg5yZXR1cm5fdG8GOwBG\nSSIPL2N1c3RvbWVycwY7AEZJIhV1c2VyX2NyZWRlbnRpYWxzBjsARkkiAYAy\nZDllMTJkZDMzYTA3YmFkOWJiODYyZTc4OWJkZjY1NGYxMWE0MTUzZDA2NmNm\nZDJkY2U2MDkyYWE4NjJiZTdlODk4NGZhNzQ1Yjc2NWU1ZTNkNzNmNzc5ZWFj\nYjVkNGE0MzdlZjEwYTBkYTIzYjU2YjU3YTYzOTllNzBiNWFmYQY7AFRJIhh1\nc2VyX2NyZWRlbnRpYWxzX2lkBjsARmkK\n', '2011-06-12 08:03:44', '2011-06-12 14:01:38'),
(45, 'b2abd57ac8b7afcae06dcf4b3a3678dc', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFUZTlJbk14RHZzMWdBM242TmFk\nSDhtMjFvTkRYVkRtWEp0MnUxSmRzQjNrPQY7AEY=\n', '2011-06-13 13:55:27', '2011-06-13 13:55:50'),
(46, '8cd710e1c385381ad81cabcf59b7f15a', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE5V1JqU2R3aHo2Vkg4SDI3TW1F\nalA3R3pWQklnTDBZYzhGQVMxN0pRSzNRPQY7AEZJIgpmbGFzaAY7AEZJQzol\nQWN0aW9uRGlzcGF0Y2g6OkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlSSIX\nTG9nb3V0IHN1Y2Nlc3NmdWwhBjsARgY6CkB1c2VkbzoIU2V0BjoKQGhhc2h7\nBjsHVA==\n', '2011-06-17 16:10:49', '2011-06-17 16:34:34'),
(47, 'fe0d2d116ba9fcac0a5aa5efe5d72f76', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjF3ZnFYWTNPNkZOUFdIblpnbVl4\ncDJ1REo4VkU0b01tZkY5UDNJeURyU2kwPQY7AEY=\n', '2011-06-18 11:29:23', '2011-06-18 11:29:23'),
(48, '1010dbe97134d2e7f1161186bb5986de', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF3RTBGRUxYK2hzZDIrQyswcy9y\nNDZ1SkMxYnE1cWQyMy8zOGFCdHA5dWQ4PQY7AEZJIgpmbGFzaAY7AEZJQzol\nQWN0aW9uRGlzcGF0Y2g6OkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlSSIX\nTG9nb3V0IHN1Y2Nlc3NmdWwhBjsARgY6CkB1c2VkbzoIU2V0BjoKQGhhc2h7\nBjsHVA==\n', '2011-06-18 13:58:04', '2011-06-18 14:18:14'),
(49, 'f1e039af0e4dc56aa14f44a75f315e26', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFtbUpjUkI5VmlxUmNVTEZERU1j\nUkwvZmhKOGpWYmVRaE1SMHhnemN3eDQ4PQY7AEZJIgpmbGFzaAY7AEZJQzol\nQWN0aW9uRGlzcGF0Y2g6OkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlSSIX\nTG9nb3V0IHN1Y2Nlc3NmdWwhBjsARgY6CkB1c2VkbzoIU2V0BjoKQGhhc2h7\nBjsHVA==\n', '2011-06-18 20:06:39', '2011-06-18 21:03:34'),
(50, 'c5b94d3bd65d39cf2082a495a648078d', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFUak5ZenRqMVUvZ3B5N3ZpSDd0\nSWppQ0pwTXFMSzc3QjFsTkd5RkcwS3RzPQY7AEZJIgpmbGFzaAY7AEZJQzol\nQWN0aW9uRGlzcGF0Y2g6OkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlSSIX\nTG9nb3V0IHN1Y2Nlc3NmdWwhBjsARgY6CkB1c2VkbzoIU2V0BjoKQGhhc2h7\nBjsHVA==\n', '2011-06-19 06:51:27', '2011-06-19 07:32:37'),
(51, 'b95c0bb47bf75b1a07700800b0a5391d', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFnNmpXQkp1end3aU9ONHFMb240\nNWcxdkw1M1BTTTBYWGM2NEpYOU02ckNNPQY7AEZJIgpmbGFzaAY7AEZJQzol\nQWN0aW9uRGlzcGF0Y2g6OkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlSSIX\nTG9nb3V0IHN1Y2Nlc3NmdWwhBjsARgY6CkB1c2VkbzoIU2V0BjoKQGhhc2h7\nBjsHVA==\n', '2011-06-19 07:32:42', '2011-06-19 07:52:55'),
(52, '71fb88373401f3796eb1af2d9760a9cd', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF2cUZoYzhXSlBLcW9neVpDZlk1\nYWtnQmUzK2NXYklxM3ZVWnFiRytRbW5zPQY7AEZJIgpmbGFzaAY7AEZJQzol\nQWN0aW9uRGlzcGF0Y2g6OkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlSSIX\nTG9nb3V0IHN1Y2Nlc3NmdWwhBjsARgY6CkB1c2VkbzoIU2V0BjoKQGhhc2h7\nBjsHVA==\n', '2011-06-19 11:52:00', '2011-06-19 12:01:51'),
(53, '217c982660ddd0f99ca5041c91604195', 'BAh7CUkiEF9jc3JmX3Rva2VuBjoGRUZJIjFRZ3FKZnJpMjNoOWdBS0pBS0t1\nWEI1djRMK0pHRVB6SXdjcnZha0VTTlFRPQY7AEZJIhV1c2VyX2NyZWRlbnRp\nYWxzBjsARkkiAYAyZDllMTJkZDMzYTA3YmFkOWJiODYyZTc4OWJkZjY1NGYx\nMWE0MTUzZDA2NmNmZDJkY2U2MDkyYWE4NjJiZTdlODk4NGZhNzQ1Yjc2NWU1\nZTNkNzNmNzc5ZWFjYjVkNGE0MzdlZjEwYTBkYTIzYjU2YjU3YTYzOTllNzBi\nNWFmYQY7AFRJIhh1c2VyX2NyZWRlbnRpYWxzX2lkBjsARmkKSSIKZmxhc2gG\nOwBGSUM6JUFjdGlvbkRpc3BhdGNoOjpGbGFzaDo6Rmxhc2hIYXNoewY6C25v\ndGljZUkiIkFydGlrZWwgZXJmb2xncmVpY2ggZ2XDpG5kZXJ0BjsAVAY6CkB1\nc2VkbzoIU2V0BjoKQGhhc2h7BjsHVA==\n', '2011-06-19 12:01:54', '2011-06-19 15:05:48'),
(54, '31041d4570257b0b84889bece0de3474', 'BAh7CEkiEF9jc3JmX3Rva2VuBjoGRUZJIjFkZGZ1UjA5U1FBVS9KMGRnZ0Nr\naVlNMmRSc2hmNWJSajEwUVp0bFJJZ3pnPQY7AEZJIhV1c2VyX2NyZWRlbnRp\nYWxzBjsARkkiAYAyZDllMTJkZDMzYTA3YmFkOWJiODYyZTc4OWJkZjY1NGYx\nMWE0MTUzZDA2NmNmZDJkY2U2MDkyYWE4NjJiZTdlODk4NGZhNzQ1Yjc2NWU1\nZTNkNzNmNzc5ZWFjYjVkNGE0MzdlZjEwYTBkYTIzYjU2YjU3YTYzOTllNzBi\nNWFmYQY7AFRJIhh1c2VyX2NyZWRlbnRpYWxzX2lkBjsARmkK\n', '2011-06-19 17:07:44', '2011-06-19 17:07:58'),
(55, 'f3bd5cb43734a8906123cc84c08ce297', 'BAh7CEkiEF9jc3JmX3Rva2VuBjoGRUZJIjE1VDFyT3JiYXRlR24yd3dCQnhV\nWTNVTkNmSnlFVVpJNjJYdUFiSXV3dkFVPQY7AEZJIhV1c2VyX2NyZWRlbnRp\nYWxzBjsARkkiAYAyZDllMTJkZDMzYTA3YmFkOWJiODYyZTc4OWJkZjY1NGYx\nMWE0MTUzZDA2NmNmZDJkY2U2MDkyYWE4NjJiZTdlODk4NGZhNzQ1Yjc2NWU1\nZTNkNzNmNzc5ZWFjYjVkNGE0MzdlZjEwYTBkYTIzYjU2YjU3YTYzOTllNzBi\nNWFmYQY7AFRJIhh1c2VyX2NyZWRlbnRpYWxzX2lkBjsARmkK\n', '2011-06-20 06:09:52', '2011-06-20 11:28:49'),
(56, '88ec55052be4faaace6d0a2322012594', 'BAh7CUkiEF9jc3JmX3Rva2VuBjoGRUZJIjFlQ1drNUJQZVpUbGxtZ1o2MnNl\nSjFOK29hSlB6ZS9LbFNERGZ4aXpPYlM4PQY7AEZJIg5yZXR1cm5fdG8GOwBG\nSSIeL3Byb2R1Y3RzLzEvYWRkX3RvX2Jhc2tldAY7AEZJIhV1c2VyX2NyZWRl\nbnRpYWxzBjsARkkiAYAyZDllMTJkZDMzYTA3YmFkOWJiODYyZTc4OWJkZjY1\nNGYxMWE0MTUzZDA2NmNmZDJkY2U2MDkyYWE4NjJiZTdlODk4NGZhNzQ1Yjc2\nNWU1ZTNkNzNmNzc5ZWFjYjVkNGE0MzdlZjEwYTBkYTIzYjU2YjU3YTYzOTll\nNzBiNWFmYQY7AFRJIhh1c2VyX2NyZWRlbnRpYWxzX2lkBjsARmkK\n', '2011-06-20 12:49:38', '2011-06-20 12:55:41');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shipments`
--

CREATE TABLE IF NOT EXISTS `shipments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `weight_max` int(11) DEFAULT NULL,
  `lenght_max` int(11) DEFAULT NULL,
  `scale_id` int(11) DEFAULT NULL,
  `auth_level` int(11) DEFAULT NULL,
  `auth_level_edit` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `shipments`
--

INSERT INTO `shipments` (`id`, `name`, `weight_max`, `lenght_max`, `scale_id`, `auth_level`, `auth_level_edit`, `created_at`, `updated_at`) VALUES
(1, 'Abholung', 999999, 999999, NULL, 50, 50, '2011-06-04 16:34:46', '2011-06-04 16:34:46');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `auth_level` int(11) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `crypted_password` varchar(255) NOT NULL,
  `password_salt` varchar(255) NOT NULL,
  `persistence_token` varchar(255) NOT NULL,
  `single_access_token` varchar(255) NOT NULL,
  `perishable_token` varchar(255) NOT NULL,
  `login_count` int(11) NOT NULL DEFAULT '0',
  `failed_login_count` int(11) NOT NULL DEFAULT '0',
  `last_request_at` datetime DEFAULT NULL,
  `current_login_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `current_login_ip` varchar(255) DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `auth_level_edit` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `wwwadress` varchar(255) DEFAULT NULL,
  `taxnumber` varchar(255) DEFAULT NULL,
  `customernumber` varchar(255) DEFAULT NULL,
  `customergroup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_login` (`login`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_persistence_token` (`persistence_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `login`, `firstname`, `lastname`, `auth_level`, `email`, `crypted_password`, `password_salt`, `persistence_token`, `single_access_token`, `perishable_token`, `login_count`, `failed_login_count`, `last_request_at`, `current_login_at`, `last_login_at`, `current_login_ip`, `last_login_ip`, `created_at`, `updated_at`, `auth_level_edit`, `title`, `wwwadress`, `taxnumber`, `customernumber`, `customergroup_id`) VALUES
(1, 'test', '12', '12', 0, 'test@tester.com', 'ccf5454d87929b1a582add844c9e97f0d81fe250cc6dd5d208e6c2273c8b49236dc6be3048e5237984ab6373cb0aa9d01494782891a01f8a3b591d922ef925cd', '7YY49iXqbcO93vnazZu', 'f876486756559b8e0ed27abb64a734e39b2c829acfca88962f6f4e5dee8bba2f1fd182802f307d9ab4b9c7d95381757ad233ba3d91f394aac5b332b6e025268e', 'GHpCjgAmn7u7UlDNyaSr', 'vER9mLVBRo67WGstHsFm', 38, 0, '2011-05-10 21:38:47', '2011-05-10 21:38:03', '2011-05-10 21:36:43', '127.0.0.1', '127.0.0.1', '2011-05-07 09:24:10', '2011-06-17 16:11:51', 0, '', '', '', '', NULL),
(5, 'michael', 'Michael', 'Stranka', 100, 'mail@michael-stranka.at', 'df1aa9c108cd517b4bf898dc8060dc39f38dde8535d23261120cd09f1d1132db27b6b3b7dc97354cc195661bd98d8b6401e0d79dbbba92a10640419d37ca6b7d', 'bg9ujd4YlRXOpYmtX246', '2d9e12dd33a07bad9bb862e789bdf654f11a4153d066cfd2dce6092aa862be7e8984fa745b765e5e3d73f779eacb5d4a437ef10a0da23b56b57a6399e70b5afa', 'rCUfeAgetkeGjge9AH9', 'd7kxarzZkldxXoISh2dN', 197, 0, '2011-06-20 13:11:05', '2011-06-20 12:55:35', '2011-06-20 12:50:32', '127.0.0.1', '127.0.0.1', '2011-05-07 16:10:45', '2011-06-20 13:11:05', 100, 'Herr', 'http://www.michael-stranka.at', '', NULL, NULL),
(7, 'normal', '12', '12', 0, 'x@x.at', '663e574668724d5f1b70ee45789c66b460e5006aa62df5982191dbf49139e58018fb1ffef15bbb89e339b701eb3e2eab3561ecb5b975143a152f81918e91eadf', 'vPIE2QpfMSK3l0YPlfLe', 'e375237f7d7395afcdf419cc9bcfdbfca4f181149dfabfc87c3b06b64207d9fef0c7e657da2e54692ae76198a30baab8c04800b088aad4098e4373386dc7d299', 't8smdsmutQC23T2hjg0m', 'jxYoC04Q10SZhTfryqVX', 21, 0, '2011-05-11 19:53:30', '2011-05-11 19:53:20', '2011-05-11 17:28:37', '127.0.0.1', '127.0.0.1', '2011-05-09 06:42:39', '2011-06-17 16:12:21', 0, '', '', '', '', NULL),
(63, '999', '999', '999', 0, '99@xx.at', '253cc85aca2a92644e2001349a9dc36955f5bb3bd06d961d13d71e68233a4446dca3435831139af503c7f923058e1da70fd4322b25d38d68d64989abc3f324d4', 'gNzBgSpGy3cduSDp5sU', '9758b4d58605a858e58562e37c56ccf5ec9f6f0b7212a9fab08f3cf201c9b4263565406f62ba6367bd85e52cc8c7da8ab6bc433c75dc6519ce1b3f3708d3f898', 'vH7eEiPsOY4fm3OziuM', 'RHz97V1Za7lkLqXvkd9Q', 1, 0, '2011-06-12 14:01:19', '2011-06-12 13:41:04', NULL, '127.0.0.1', NULL, '2011-06-12 13:41:04', '2011-06-12 14:01:19', 0, '', '', '', NULL, NULL);
