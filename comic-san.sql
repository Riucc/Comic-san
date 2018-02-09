-- phpMyAdmin SQL Dump
-- version 4.7.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 09, 2018 at 10:40 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Comic-san`
--

-- --------------------------------------------------------

--
-- Table structure for table `acquisto`
--

CREATE TABLE `acquisto` (
  `codice` int(5) NOT NULL,
  `cod_c` varchar(16) CHARACTER SET ascii NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acquisto`
--

INSERT INTO `acquisto` (`codice`, `cod_c`, `data`) VALUES
(1, 'KHHCGH29L53G339N', '2018-02-01'),
(2, 'DQXTZP31S41B054P', '2017-09-13'),
(3, 'KHHCGH29L53G339N', '2017-12-23');

-- --------------------------------------------------------

--
-- Table structure for table `autore`
--

CREATE TABLE `autore` (
  `codice` int(5) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `nazionalità` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Dumping data for table `autore`
--

INSERT INTO `autore` (`codice`, `nome`, `cognome`, `nazionalità`) VALUES
(215, 'Vera', 'Brosgol', 'Russia'),
(1245, 'Akira', 'Toriyama', 'Giappone'),
(11111, 'Eiichiro', 'Oda', 'Giappone'),
(11112, 'Marco', 'Rossi', 'Italia'),
(11113, 'Masashi', 'Kishimoto', 'Giappone'),
(11115, 'Lee', 'Wein', 'Stati Uniti'),
(11117, 'Herb', 'Trimpe', 'Stati Uniti'),
(11199, 'Stan', 'Lee', 'Stati Uniti'),
(11200, 'Tsugumi', 'Oba', 'Giappone'),
(15002, 'Yoshihiro', 'Togashi', 'Giappone');

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `CF` varchar(16) NOT NULL,
  `CT` int(5) DEFAULT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `numero_telefonico` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`CF`, `CT`, `nome`, `cognome`, `email`, `numero_telefonico`) VALUES
('DQXTZP31S41B054P', 3, 'Maco', 'Rotta', 'mac.rot@gmail.it', '3254125557'),
('JRWDPV44L13G994B', 4, 'Tia', 'Matta', 'tia.mat@gmail.it', '3254125558'),
('KHHCGH29L53G339N', 1, 'Mario', 'Rossi', 'mar.ros@gmail.it', '3254125555'),
('TBWDQH34M70H511H', 2, 'Marco', 'Ros', 'marros@gmail.it', '3254125556');

-- --------------------------------------------------------

--
-- Table structure for table `fornitore`
--

CREATE TABLE `fornitore` (
  `codice` int(5) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `numero_telefonico` varchar(13) NOT NULL,
  `indirizzo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Dumping data for table `fornitore`
--

INSERT INTO `fornitore` (`codice`, `nome`, `email`, `numero_telefonico`, `indirizzo`) VALUES
(45231, 'Marvel comics', 'marvel.comic@gmail.com', '1234567890', 'Via Ciro 11 Boston'),
(56421, 'Weekly Shonen', 'weekly.Jump@gmail.Jum', '1232458560', 'Via Lillll Jump 12 Kyoto'),
(64561, 'Star comic', 'star.comic@gmail.com', '4578126359', 'Via Ciao 777 Trapani'),
(68451, 'Editoriale Como', 'editoriale.Como@gmail.Com', '5412351245', 'Via Lion 1343 Milano'),
(98554, 'Panini Comics', 'panini.Comics@gmail.Com', '1145783028', 'Via Laiiiiiiii 23 Mantova'),
(98555, 'Bandai', 'bandai@gmail.com', '3434343434', 'Via Astolfo 7 Padova');

-- --------------------------------------------------------

--
-- Table structure for table `partecipazione`
--

CREATE TABLE `partecipazione` (
  `cod_p` int(5) NOT NULL,
  `cod_a` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `partecipazione`
--

INSERT INTO `partecipazione` (`cod_p`, `cod_a`) VALUES
(1, 11111),
(4, 11115),
(4, 11199),
(5, 11111),
(6, 11200);

-- --------------------------------------------------------

--
-- Table structure for table `prenotazione`
--

CREATE TABLE `prenotazione` (
  `codice` int(5) NOT NULL,
  `cod_t` int(5) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prenotazione`
--

INSERT INTO `prenotazione` (`codice`, `cod_t`, `data`) VALUES
(1, 3, '2017-12-22');

-- --------------------------------------------------------

--
-- Table structure for table `prodotti`
--

CREATE TABLE `prodotti` (
  `codice` int(5) NOT NULL,
  `Nome-Titolo` varchar(100) NOT NULL,
  `fornitore` int(5) NOT NULL,
  `prezzo` decimal(6,2) NOT NULL,
  `serie` int(5) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `disponibilità` int(3) NOT NULL DEFAULT '0',
  `saga` varchar(50) DEFAULT NULL,
  `autore` int(5) DEFAULT NULL,
  `edizione` varchar(2) DEFAULT NULL,
  `numero` tinyint(4) DEFAULT NULL,
  `dimensione` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Dumping data for table `prodotti`
--

INSERT INTO `prodotti` (`codice`, `Nome-Titolo`, `fornitore`, `prezzo`, `serie`, `tipo`, `disponibilità`, `saga`, `autore`, `edizione`, `numero`, `dimensione`) VALUES
(1, 'Gundam ultrasuperop spaccatutto', 98555, '249.99', 87562, 'Manga', 1, NULL, NULL, NULL, NULL, '50.00'),
(2, 'Wolwerine vs Hulk', 45231, '79.00', 14523, 'Fumetto', 0, 'Civil War', 11115, '1', 10, NULL),
(3, 'La morte di Ace', 56421, '4.00', 14287, 'Manga', 22, 'MarineFord', 11111, '4', 90, NULL),
(4, 'Another World', 98554, '18.00', 87563, 'Altro', 0, NULL, NULL, NULL, NULL, NULL),
(5, '	Iceberg	', 56421, '4.00', 14287, '	Manga	', 0, '	Water Seven	', 11111, '5', 1, NULL),
(6, '	Pauly	', 56421, '4.00', 14287, '	Manga	', 2, '	Water Seven	', 11111, '5', 2, NULL),
(7, '	Peepley Lulu	', 56421, '4.00', 14287, '	Manga	', 5, '	Water Seven	', 11111, '5', 3, NULL),
(8, '	Tilestone	', 56421, '4.00', 14287, '	Manga	', 3, '	Water Seven	', 11111, '5', 4, NULL),
(9, '	Zanbai	', 56421, '4.00', 14287, '	Manga	', 4, '	Water Seven	', 11111, '5', 5, NULL),
(10, '	Tamagon	', 56421, '4.00', 14287, '	Manga	', 6, '	Water Seven	', 11111, '5', 6, NULL),
(11, '	Kiev	', 56421, '4.00', 14287, '	Manga	', 2, '	Water Seven	', 11111, '5', 7, NULL),
(12, '	Schollzo	', 56421, '4.00', 14287, '	Manga	', 2, '	Water Seven	', 11111, '5', 8, NULL),
(13, '	Kop	', 56421, '4.00', 14287, '	Manga	', 2, '	Water Seven	', 11111, '5', 9, NULL),
(14, '	Destroyers	', 56421, '4.00', 14287, '	Manga	', 2, '	Water Seven	', 11111, '5', 10, NULL),
(15, '	Sodoma	', 56421, '4.00', 14287, '	Manga	', 0, '	Water Seven	', 11111, '5', 11, NULL),
(16, '	Gomorra	', 56421, '4.00', 14287, '	Manga	', 2, '	Water Seven	', 11111, '5', 12, NULL),
(17, '	Kokoro	', 56421, '4.00', 14287, '	Manga	', 8, '	Water Seven	', 11111, '5', 13, NULL),
(18, '	Chimney	', 56421, '4.00', 14287, '	Manga	', 2, '	Water Seven	', 11111, '5', 14, NULL),
(19, '	Yokozuna	', 56421, '4.00', 14287, '	Manga	', 7, '	Water Seven	', 11111, '5', 15, NULL),
(20, '	Garp	', 56421, '4.00', 14287, '	Manga	', 2, '	Water Seven	', 11111, '5', 16, NULL),
(21, '	Dragon	', 56421, '4.00', 14287, '	Manga	', 20, '	Water Seven	', 11111, '5', 17, NULL),
(22, '	Barbabianca	', 56421, '4.00', 14287, '	Manga	', 12, '	Water Seven	', 11111, '5', 18, NULL),
(23, '	Sengoku	', 56421, '4.00', 14287, '	Manga	', 2, '	Water Seven	', 11111, '5', 19, NULL),
(24, '	Akainu	', 56421, '4.00', 14287, '	Manga	', 2, '	Water Seven	', 11111, '5', 20, NULL),
(25, '	Aokiji	', 56421, '4.00', 14287, '	Manga	', 0, '	Marineford	', 11111, '4', 1, NULL),
(26, '	Kizaru	', 56421, '4.00', 14287, '	Manga	', 0, '	Marineford	', 11111, '4', 2, NULL),
(27, '	Fujitora	', 56421, '4.00', 14287, '	Manga	', 0, '	Marineford	', 11111, '4', 3, NULL),
(28, '	Smoker	', 56421, '4.00', 14287, '	Manga	', 0, '	Marineford	', 11111, '4', 4, NULL),
(29, '	Tsuru	', 56421, '4.00', 14287, '	Manga	', 0, '	Marineford	', 11111, '4', 5, NULL),
(30, '	Momonga	', 56421, '4.00', 14287, '	Manga	', 0, '	Marineford	', 11111, '4', 6, NULL),
(31, '	Onigumo	', 56421, '4.00', 14287, '	Manga	', 0, '	Marineford	', 11111, '4', 7, NULL),
(32, '	Strawberry	', 56421, '4.00', 14287, '	Manga	', 0, '	Marineford	', 11111, '4', 8, NULL),
(33, '	Yamakaji	', 56421, '4.00', 14287, '	Manga	', 0, '	Marineford	', 11111, '4', 9, NULL),
(34, '	John Giant	', 56421, '4.00', 14287, '	Manga	', 0, '	Marineford	', 11111, '4', 10, NULL),
(35, '	Hagwor D.Sauro	', 56421, '4.00', 14287, '	Manga	', 0, '	Marineford	', 11111, '4', 11, NULL),
(36, '	Bastile	', 56421, '4.00', 14287, '	Manga	', 0, '	Marineford	', 11111, '4', 12, NULL),
(37, '	Dalmata	', 56421, '4.00', 14287, '	Manga	', 0, '	Marineford	', 11111, '4', 13, NULL),
(38, '	Vergo	', 56421, '4.00', 14287, '	Manga	', 0, '	Marineford	', 11111, '4', 14, NULL),
(39, '	Maynard	', 56421, '4.00', 14287, '	Manga	', 0, '	Marineford	', 11111, '4', 15, NULL),
(40, '	Hina	', 56421, '4.00', 14287, '	Manga	', 1, '	Marineford	', 11111, '4', 16, NULL),
(41, '	Brandnew	', 56421, '4.00', 14287, '	Manga	', 0, '	Marineford	', 11111, '4', 17, NULL),
(42, '	Yarisugi	', 56421, '4.00', 14287, '	Manga	', 2, '	Marineford	', 11111, '4', 18, NULL),
(43, '	Kobi	', 56421, '4.00', 14287, '	Manga	', 0, '	Marineford	', 11111, '4', 19, NULL),
(44, '	Morgan	', 56421, '4.00', 14287, '	Manga	', 2, '	Marineford	', 11111, '4', 20, NULL),
(45, '	Nezumi	', 56421, '4.00', 14287, '	Manga	', 1, '	Marineford	', 11111, '4', 21, NULL),
(46, '	Tashigi	', 56421, '4.00', 14287, '	Manga	', 3, '	Marineford	', 11111, '4', 22, NULL),
(47, '	T-Bone	', 56421, '4.00', 14287, '	Manga	', 1, '	Marineford	', 11111, '4', 23, NULL),
(48, '	Sentomaru	', 56421, '4.00', 14287, '	Manga	', 3, '	Marineford	', 11111, '4', 24, NULL),
(49, '	Hermeppo	', 56421, '4.00', 14287, '	Manga	', 2, '	Marineford	', 11111, '4', 25, NULL),
(50, '	Fullbody	', 56421, '4.00', 14287, '	Manga	', 4, '	Marineford	', 11111, '4', 26, NULL),
(51, '	Ace	', 56421, '4.00', 14287, '	Manga	', 2, '	Marineford	', 11111, '4', 27, NULL),
(52, '	Rubber	', 56421, '4.00', 14287, '	Manga	', 4, '	Marineford	', 11111, '4', 28, NULL),
(53, 'Naruto contro la volpe', 98554, '4.00', 56987, '	Manga	', 3, 'Saga del risveglio della volpe', 11113, '4', 30, NULL),
(54, '	Ace	', 98555, '22.00', 14287, '	Modellino	', 2, '	Dessrosa	', NULL, NULL, NULL, '20.00'),
(55, '	Sabo	', 98555, '24.00', 14287, '	Modellino	', 2, '	Dessrosa	', NULL, NULL, NULL, '20.00'),
(56, '	Rubber	', 98555, '29.00', 14287, '	Modellino	', 2, '	Dessrosa	', NULL, NULL, NULL, '20.00'),
(57, '	Zoro	', 98555, '22.00', 14287, '	Modellino	', 2, '	Dessrosa	', NULL, NULL, NULL, '20.00'),
(58, '	Nami	', 98555, '24.00', 14287, '	Modellino	', 6, '	Dessrosa	', NULL, NULL, NULL, '20.00'),
(59, '	Robin	', 98555, '26.00', 14287, '	Modellino	', 2, '	Dessrosa	', NULL, NULL, NULL, '20.00'),
(60, '	Chopper	', 98555, '24.00', 14287, '	Modellino	', 15, '	Dessrosa	', NULL, NULL, NULL, '20.00'),
(61, '	Franky	', 98555, '21.00', 14287, '	Modellino	', 2, '	Dessrosa	', NULL, NULL, NULL, '20.00'),
(62, '	Jinbei	', 98555, '24.00', 14287, '	Modellino	', 3, '	Dessrosa	', NULL, NULL, NULL, '20.00'),
(63, '	Rosso	', 98555, '27.00', 14287, '	Modellino	', 2, '	Dessrosa	', NULL, NULL, NULL, '20.00'),
(64, '	Fenix	', 98555, '29.00', 14287, '	Modellino	', 17, '	Dessrosa	', NULL, NULL, NULL, '20.00'),
(65, '	Garp	', 98555, '24.00', 14287, '	Modellino	', 9, '	Dessrosa	', NULL, NULL, NULL, '20.00'),
(66, '	Dragon	', 98555, '19.00', 14287, '	Modellino	', 0, '	Dessrosa	', NULL, NULL, NULL, '20.00'),
(67, '	Aokiji	', 98555, '26.00', 14287, '	Modellino	', 0, '	Dessrosa	', NULL, NULL, NULL, '20.00'),
(68, 'Shikamaru', 98555, '18.00', 56987, '	Modellino	', 0, '', NULL, NULL, NULL, '15.00'),
(69, '	Rubber gear 1	', 98555, '14.00', 14287, '	Modellino	', 0, '	Dessrosa	', NULL, NULL, NULL, '20.00'),
(70, 'Hulk ', 98555, '500.00', 87561, '	Modellino	', 0, '', NULL, NULL, NULL, '200.00'),
(71, 'Wolwerine', 98555, '44.00', 14523, '	Modellino	', 0, '', NULL, NULL, NULL, '30.00'),
(72, 'Light', 98555, '45.00', 87563, '	Modellino	', 0, '', NULL, NULL, NULL, '25.00'),
(73, 'Gundam grosso', 98555, '64.00', 87562, '	Modellino	', 0, '', NULL, NULL, NULL, '80.00'),
(74, 'Ryuk', 98555, '74.00', 87563, '	Modellino	', 0, '	', NULL, NULL, NULL, '70.00');

-- --------------------------------------------------------

--
-- Table structure for table `riga_acquisto`
--

CREATE TABLE `riga_acquisto` (
  `cod_a` int(5) NOT NULL,
  `quantità` int(5) NOT NULL,
  `cod_p` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `riga_acquisto`
--

INSERT INTO `riga_acquisto` (`cod_a`, `quantità`, `cod_p`) VALUES
(1, 1, 2),
(1, 2, 4),
(2, 3, 1),
(3, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `riga_prenotazione`
--

CREATE TABLE `riga_prenotazione` (
  `cod_pre` int(5) NOT NULL,
  `quantità` int(5) NOT NULL,
  `cod_p` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `riga_prenotazione`
--

INSERT INTO `riga_prenotazione` (`cod_pre`, `quantità`, `cod_p`) VALUES
(1, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `serie`
--

CREATE TABLE `serie` (
  `codice` int(5) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `tipo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Dumping data for table `serie`
--

INSERT INTO `serie` (`codice`, `nome`, `tipo`) VALUES
(14287, 'One piece', 'Manga'),
(14523, 'Wolverine', 'Fummetto'),
(56987, 'Naruto', 'Manga'),
(87561, 'Hulk', 'Fummetto'),
(87562, 'Gundam', 'Manga'),
(87563, 'Death Note', 'Manga');

-- --------------------------------------------------------

--
-- Table structure for table `tessera`
--

CREATE TABLE `tessera` (
  `codice` int(5) NOT NULL,
  `tipo` set('base','intermedia','premium') DEFAULT NULL,
  `CC` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Dumping data for table `tessera`
--

INSERT INTO `tessera` (`codice`, `tipo`, `CC`) VALUES
(1, 'base', 'KHHCGH29L53G339N'),
(2, 'base', 'TBWDQH34M70H511H'),
(3, 'intermedia', 'DQXTZP31S41B054P'),
(4, 'premium', 'JRWDPV44L13G994B');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acquisto`
--
ALTER TABLE `acquisto`
  ADD PRIMARY KEY (`codice`),
  ADD KEY `cod_c` (`cod_c`);

--
-- Indexes for table `autore`
--
ALTER TABLE `autore`
  ADD PRIMARY KEY (`codice`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CF`),
  ADD KEY `FK_tessera` (`CT`);

--
-- Indexes for table `fornitore`
--
ALTER TABLE `fornitore`
  ADD PRIMARY KEY (`codice`);

--
-- Indexes for table `partecipazione`
--
ALTER TABLE `partecipazione`
  ADD PRIMARY KEY (`cod_p`,`cod_a`),
  ADD KEY `cod_a` (`cod_a`);

--
-- Indexes for table `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD PRIMARY KEY (`codice`),
  ADD KEY `cod_c` (`cod_t`);

--
-- Indexes for table `prodotti`
--
ALTER TABLE `prodotti`
  ADD PRIMARY KEY (`codice`),
  ADD KEY `FK_fornitore` (`fornitore`),
  ADD KEY `FK_serie` (`serie`),
  ADD KEY `FK_autore` (`autore`);

--
-- Indexes for table `riga_acquisto`
--
ALTER TABLE `riga_acquisto`
  ADD PRIMARY KEY (`cod_a`,`cod_p`),
  ADD KEY `cod_a` (`cod_a`),
  ADD KEY `cod_p` (`cod_p`);

--
-- Indexes for table `riga_prenotazione`
--
ALTER TABLE `riga_prenotazione`
  ADD PRIMARY KEY (`cod_pre`,`cod_p`),
  ADD KEY `cod_pre` (`cod_pre`),
  ADD KEY `cod_p` (`cod_p`);

--
-- Indexes for table `serie`
--
ALTER TABLE `serie`
  ADD PRIMARY KEY (`codice`);

--
-- Indexes for table `tessera`
--
ALTER TABLE `tessera`
  ADD PRIMARY KEY (`codice`),
  ADD KEY `FK_cliente` (`CC`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acquisto`
--
ALTER TABLE `acquisto`
  MODIFY `codice` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `autore`
--
ALTER TABLE `autore`
  MODIFY `codice` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15003;

--
-- AUTO_INCREMENT for table `fornitore`
--
ALTER TABLE `fornitore`
  MODIFY `codice` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98556;

--
-- AUTO_INCREMENT for table `prenotazione`
--
ALTER TABLE `prenotazione`
  MODIFY `codice` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prodotti`
--
ALTER TABLE `prodotti`
  MODIFY `codice` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `serie`
--
ALTER TABLE `serie`
  MODIFY `codice` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87564;

--
-- AUTO_INCREMENT for table `tessera`
--
ALTER TABLE `tessera`
  MODIFY `codice` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acquisto`
--
ALTER TABLE `acquisto`
  ADD CONSTRAINT `acquisto_ibfk_1` FOREIGN KEY (`cod_c`) REFERENCES `cliente` (`CF`);

--
-- Constraints for table `partecipazione`
--
ALTER TABLE `partecipazione`
  ADD CONSTRAINT `partecipazione_ibfk_1` FOREIGN KEY (`cod_a`) REFERENCES `autore` (`codice`),
  ADD CONSTRAINT `partecipazione_ibfk_2` FOREIGN KEY (`cod_p`) REFERENCES `prodotti` (`codice`);

--
-- Constraints for table `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD CONSTRAINT `prenotazione_ibfk_1` FOREIGN KEY (`cod_t`) REFERENCES `cliente` (`CT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prodotti`
--
ALTER TABLE `prodotti`
  ADD CONSTRAINT `FK_fornitore` FOREIGN KEY (`fornitore`) REFERENCES `fornitore` (`codice`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_serie` FOREIGN KEY (`serie`) REFERENCES `serie` (`codice`) ON UPDATE CASCADE,
  ADD CONSTRAINT `prodotti_ibfk_1` FOREIGN KEY (`autore`) REFERENCES `autore` (`codice`);

--
-- Constraints for table `riga_acquisto`
--
ALTER TABLE `riga_acquisto`
  ADD CONSTRAINT `riga_acquisto_ibfk_1` FOREIGN KEY (`cod_a`) REFERENCES `acquisto` (`codice`),
  ADD CONSTRAINT `riga_acquisto_ibfk_2` FOREIGN KEY (`cod_p`) REFERENCES `prodotti` (`codice`);

--
-- Constraints for table `riga_prenotazione`
--
ALTER TABLE `riga_prenotazione`
  ADD CONSTRAINT `riga_prenotazione_ibfk_1` FOREIGN KEY (`cod_pre`) REFERENCES `prenotazione` (`codice`),
  ADD CONSTRAINT `riga_prenotazione_ibfk_2` FOREIGN KEY (`cod_p`) REFERENCES `prodotti` (`codice`);

--
-- Constraints for table `tessera`
--
ALTER TABLE `tessera`
  ADD CONSTRAINT `FK_cliente` FOREIGN KEY (`CC`) REFERENCES `cliente` (`CF`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
