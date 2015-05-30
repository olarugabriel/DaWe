-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 30 May 2015 la 16:39
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dawe`
--

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `database`
--

CREATE TABLE IF NOT EXISTS `database` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Salvarea datelor din tabel `database`
--

INSERT INTO `database` (`ID`, `NAME`) VALUES
(1, 'Database1'),
(3, 'Database2'),
(6, 'Database3'),
(7, 'Database4'),
(8, 'Database5'),
(9, 'Database6');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `databasetablejoin`
--

CREATE TABLE IF NOT EXISTS `databasetablejoin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_DATABASE` int(11) NOT NULL,
  `ID_TABLE` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Salvarea datelor din tabel `databasetablejoin`
--

INSERT INTO `databasetablejoin` (`ID`, `ID_DATABASE`, `ID_TABLE`) VALUES
(1, 1, 1),
(2, 3, 2),
(3, 6, 3),
(4, 6, 4),
(5, 7, 5),
(6, 8, 6),
(7, 8, 7),
(8, 3, 8),
(9, 1, 8);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `databaseuserjoin`
--

CREATE TABLE IF NOT EXISTS `databaseuserjoin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_DATABASE` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Salvarea datelor din tabel `databaseuserjoin`
--

INSERT INTO `databaseuserjoin` (`ID`, `ID_DATABASE`, `ID_USER`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 3, 1),
(4, 6, 2),
(5, 7, 3),
(6, 8, 2),
(7, 9, 3),
(8, 9, 3);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `table`
--

CREATE TABLE IF NOT EXISTS `table` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Salvarea datelor din tabel `table`
--

INSERT INTO `table` (`ID`, `NAME`) VALUES
(1, 'Table1'),
(2, 'Table2'),
(3, 'Table3'),
(4, 'Table4'),
(5, 'Table5'),
(6, 'Table6'),
(7, 'Table7'),
(8, 'Table8');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `TYPE` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Salvarea datelor din tabel `user`
--

INSERT INTO `user` (`ID`, `NAME`, `PASSWORD`, `TYPE`) VALUES
(1, 'Gabriel', 'ec0c8fe7ad80dfe93c0de35448b1d581', 2),
(3, 'Mihaela', '827ccb0eea8a706c4c34a16891f84e7b', 1),
(5, 'Madalina', '01cfcd4f6b8770febfb40cb906715822', 1),
(7, 'Vlad', '1c1d5315404c08f542d1abf135b40507', 1),
(8, 'ionel', '827ccb0eea8a706c4c34a16891f84e7b', 0),
(9, 'maria', '81b073de9370ea873f548e31b8adc081', 1);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `userrightsdatabase`
--

CREATE TABLE IF NOT EXISTS `userrightsdatabase` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_DATABASE` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  `RIGHTS` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Salvarea datelor din tabel `userrightsdatabase`
--

INSERT INTO `userrightsdatabase` (`ID`, `ID_DATABASE`, `ID_USER`, `RIGHTS`) VALUES
(1, -1, 1, 1111),
(2, 3, 2, 1001),
(3, 6, 2, 1111),
(4, 7, 3, 1101),
(5, 8, 2, 1111),
(6, 9, 2, 11),
(7, 1, 3, 1111);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `userrightstable`
--

CREATE TABLE IF NOT EXISTS `userrightstable` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_TABLE` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  `RIGHTS` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Salvarea datelor din tabel `userrightstable`
--

INSERT INTO `userrightstable` (`ID`, `ID_TABLE`, `ID_USER`, `RIGHTS`) VALUES
(1, -1, 1, 1111),
(2, 1, 2, 1101),
(3, 2, 2, 1111),
(4, 3, 2, 1111);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
