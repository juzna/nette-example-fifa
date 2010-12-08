-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 07, 2010 at 10:20 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.2-1ubuntu4.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fifa`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `pass`) VALUES
(1, 'john', 'password'),
(2, 'mario', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE IF NOT EXISTS `matches` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `stadium` varchar(50) NOT NULL,
  `datetime` datetime NOT NULL,
  `team1` int(11) NOT NULL,
  `team2` int(11) NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`mid`, `stadium`, `datetime`, `team1`, `team2`) VALUES
(1, 'Portsmouth FC', '2010-12-09 19:08:22', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `tid` int(11) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`pid`, `pname`, `dob`, `tid`) VALUES
(1, 'Mario', '2010-12-07', 1),
(2, 'Jorge', '2010-12-07', 1),
(3, 'Martin', '2000-01-01', 2),
(4, 'Waqar', '2000-01-01', 2);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE IF NOT EXISTS `teams` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`tid`, `tname`, `city`) VALUES
(1, 'Pompey', 'Portsmouth'),
(2, 'Forest', 'Nottingham');




create table openid (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  userid int(11) not null,
  openid varchar(255) not null
);
INSERT INTO openid VALUES(1,1,'https://www.google.com/accounts/o8/id?id=AItOawm9yAsRv_8dhZCduE56SHbDv4D0Ugee1QM');
