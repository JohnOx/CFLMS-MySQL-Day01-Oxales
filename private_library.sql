-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Jul 2020 um 11:09
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `private library`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `books`
--

CREATE TABLE `books` (
  `userID` int(11) DEFAULT NULL,
  `libID` int(11) DEFAULT NULL,
  `bookID` int(11) NOT NULL,
  `title` varchar(55) DEFAULT NULL,
  `author_firstName` varchar(55) DEFAULT NULL,
  `author_lastName` varchar(55) DEFAULT NULL,
  `published` date DEFAULT NULL,
  `edition` tinyint(4) DEFAULT NULL,
  `price` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `library`
--

CREATE TABLE `library` (
  `LibID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `BookID` int(11) DEFAULT NULL,
  `Name` varchar(55) DEFAULT NULL,
  `Description` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `FirstName` varchar(55) DEFAULT NULL,
  `LastName` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `libID` (`libID`);

--
-- Indizes für die Tabelle `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`LibID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `BookID` (`BookID`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`libID`) REFERENCES `library` (`LibID`);

--
-- Constraints der Tabelle `library`
--
ALTER TABLE `library`
  ADD CONSTRAINT `library_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `library_ibfk_2` FOREIGN KEY (`LibID`) REFERENCES `books` (`bookID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
