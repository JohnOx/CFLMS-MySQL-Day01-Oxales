-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Jul 2020 um 14:10
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
-- Datenbank: `health center records`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `careunit`
--

CREATE TABLE `careunit` (
  `fk_patient_ID` int(11) DEFAULT NULL,
  `fk_history_ID` int(11) DEFAULT NULL,
  `fk_doctor_ID` int(11) DEFAULT NULL,
  `CareUnit_ID` int(11) NOT NULL,
  `Unit_Name` varchar(55) DEFAULT NULL,
  `Unit_Location` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `contact`
--

CREATE TABLE `contact` (
  `fk_patient_ID` int(11) DEFAULT NULL,
  `contact_ID` int(11) NOT NULL,
  `Street` varchar(55) DEFAULT NULL,
  `ZipCode` smallint(6) DEFAULT NULL,
  `TelNo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctor`
--

CREATE TABLE `doctor` (
  `fk_patient_ID` int(11) DEFAULT NULL,
  `fk_history_ID` int(11) DEFAULT NULL,
  `fk_CareUnit_ID` int(11) DEFAULT NULL,
  `doctor_ID` int(11) NOT NULL,
  `First_Name` varchar(55) DEFAULT NULL,
  `Last_Name` varchar(55) DEFAULT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Specialty` varchar(55) DEFAULT NULL,
  `doctors_code` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `history`
--

CREATE TABLE `history` (
  `fk_patient_ID` int(11) DEFAULT NULL,
  `fk_doctor_ID` int(11) DEFAULT NULL,
  `history_ID` int(11) NOT NULL,
  `diseases` varchar(55) DEFAULT NULL,
  `allergies` varchar(55) DEFAULT NULL,
  `treatments` varchar(55) DEFAULT NULL,
  `medications` char(1) DEFAULT NULL,
  `symptoms` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `patient`
--

CREATE TABLE `patient` (
  `fk_contact_ID` int(11) DEFAULT NULL,
  `fk_history_ID` int(11) DEFAULT NULL,
  `fk_doctor_ID` int(11) DEFAULT NULL,
  `fk_CareUnit_ID` int(11) DEFAULT NULL,
  `patient_ID` int(11) NOT NULL,
  `First_Name` varchar(55) DEFAULT NULL,
  `Last_Name` varchar(55) DEFAULT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Date_of_Admission` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `careunit`
--
ALTER TABLE `careunit`
  ADD PRIMARY KEY (`CareUnit_ID`),
  ADD KEY `fk_patient_ID` (`fk_patient_ID`),
  ADD KEY `fk_history_ID` (`fk_history_ID`),
  ADD KEY `fk_doctor_ID` (`fk_doctor_ID`);

--
-- Indizes für die Tabelle `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_ID`),
  ADD KEY `fk_patient_ID` (`fk_patient_ID`);

--
-- Indizes für die Tabelle `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_ID`),
  ADD KEY `fk_patient_ID` (`fk_patient_ID`),
  ADD KEY `fk_history_ID` (`fk_history_ID`),
  ADD KEY `fk_CareUnit_ID` (`fk_CareUnit_ID`);

--
-- Indizes für die Tabelle `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`history_ID`),
  ADD KEY `fk_patient_ID` (`fk_patient_ID`),
  ADD KEY `fk_doctor_ID` (`fk_doctor_ID`);

--
-- Indizes für die Tabelle `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_ID`),
  ADD KEY `fk_contact_ID` (`fk_contact_ID`),
  ADD KEY `fk_doctor_ID` (`fk_doctor_ID`),
  ADD KEY `fk_history_ID` (`fk_history_ID`),
  ADD KEY `fk_CareUnit_ID` (`fk_CareUnit_ID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `careunit`
--
ALTER TABLE `careunit`
  ADD CONSTRAINT `careunit_ibfk_1` FOREIGN KEY (`fk_patient_ID`) REFERENCES `patient` (`patient_ID`),
  ADD CONSTRAINT `careunit_ibfk_2` FOREIGN KEY (`fk_history_ID`) REFERENCES `history` (`history_ID`),
  ADD CONSTRAINT `careunit_ibfk_3` FOREIGN KEY (`fk_doctor_ID`) REFERENCES `doctor` (`doctor_ID`);

--
-- Constraints der Tabelle `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`fk_patient_ID`) REFERENCES `patient` (`patient_ID`);

--
-- Constraints der Tabelle `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`fk_patient_ID`) REFERENCES `patient` (`patient_ID`),
  ADD CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`fk_history_ID`) REFERENCES `history` (`history_ID`),
  ADD CONSTRAINT `doctor_ibfk_3` FOREIGN KEY (`fk_CareUnit_ID`) REFERENCES `careunit` (`CareUnit_ID`);

--
-- Constraints der Tabelle `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`fk_patient_ID`) REFERENCES `patient` (`patient_ID`),
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`fk_doctor_ID`) REFERENCES `doctor` (`doctor_ID`);

--
-- Constraints der Tabelle `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`fk_contact_ID`) REFERENCES `contact` (`contact_ID`),
  ADD CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`fk_doctor_ID`) REFERENCES `doctor` (`doctor_ID`),
  ADD CONSTRAINT `patient_ibfk_3` FOREIGN KEY (`fk_history_ID`) REFERENCES `history` (`history_ID`),
  ADD CONSTRAINT `patient_ibfk_4` FOREIGN KEY (`fk_CareUnit_ID`) REFERENCES `careunit` (`CareUnit_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
