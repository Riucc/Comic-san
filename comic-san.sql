-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Dic 28, 2017 alle 19:11
-- Versione del server: 10.1.29-MariaDB
-- Versione PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `comic-san`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `autore`
--

CREATE TABLE `autore` (
  `codice` int(5) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `nazionalità` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE `cliente` (
  `CF` varchar(16) NOT NULL,
  `CT` int(5) DEFAULT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `numero_telefonico` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Struttura della tabella `fornitore`
--

CREATE TABLE `fornitore` (
  `codice` int(5) NOT NULL,
  `nome` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `numero_telefonico` varchar(13) NOT NULL,
  `indirizzo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti`
--

CREATE TABLE `prodotti` (
  `codice` int(5) NOT NULL,
  `fornitore` int(5) NOT NULL,
  `prezzo` decimal(4,2) NOT NULL,
  `serie` int(5) NOT NULL,
  `tipo` varchar(8) NOT NULL,
  `disponibilità` int(3) NOT NULL DEFAULT '0',
  `condizione` tinyint(1) DEFAULT NULL,
  `saga` varchar(10) DEFAULT NULL,
  `autore` int(5) DEFAULT NULL,
  `edizione` varchar(2) DEFAULT NULL,
  `numero` tinyint(4) DEFAULT NULL,
  `dimensione` float(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Struttura della tabella `serie`
--

CREATE TABLE `serie` (
  `codice` int(5) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `tipo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Struttura della tabella `tessera`
--

CREATE TABLE `tessera` (
  `codice` int(5) NOT NULL,
  `tipo` set('base','intermedia','premium') DEFAULT NULL,
  `CC` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `autore`
--
ALTER TABLE `autore`
  ADD PRIMARY KEY (`codice`);

--
-- Indici per le tabelle `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CF`),
  ADD KEY `FK_tessera` (`CT`);

--
-- Indici per le tabelle `fornitore`
--
ALTER TABLE `fornitore`
  ADD PRIMARY KEY (`codice`);

--
-- Indici per le tabelle `prodotti`
--
ALTER TABLE `prodotti`
  ADD PRIMARY KEY (`codice`),
  ADD KEY `FK_fornitore` (`fornitore`),
  ADD KEY `FK_serie` (`serie`),
  ADD KEY `FK_autore` (`autore`);

--
-- Indici per le tabelle `serie`
--
ALTER TABLE `serie`
  ADD PRIMARY KEY (`codice`);

--
-- Indici per le tabelle `tessera`
--
ALTER TABLE `tessera`
  ADD PRIMARY KEY (`codice`),
  ADD KEY `FK_cliente` (`CC`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `autore`
--
ALTER TABLE `autore`
  MODIFY `codice` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `fornitore`
--
ALTER TABLE `fornitore`
  MODIFY `codice` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  MODIFY `codice` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `serie`
--
ALTER TABLE `serie`
  MODIFY `codice` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tessera`
--
ALTER TABLE `tessera`
  MODIFY `codice` int(5) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK_tessera` FOREIGN KEY (`CT`) REFERENCES `tessera` (`codice`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  ADD CONSTRAINT `FK_autore` FOREIGN KEY (`autore`) REFERENCES `autore` (`codice`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_fornitore` FOREIGN KEY (`fornitore`) REFERENCES `fornitore` (`codice`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_serie` FOREIGN KEY (`serie`) REFERENCES `serie` (`codice`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `tessera`
--
ALTER TABLE `tessera`
  ADD CONSTRAINT `FK_cliente` FOREIGN KEY (`CC`) REFERENCES `cliente` (`CF`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
