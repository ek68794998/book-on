-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2014 at 05:48 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bookon`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE IF NOT EXISTS `author` (
  `AuthorId` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Birthdate` date DEFAULT NULL,
  `HomeCountry` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`AuthorId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`AuthorId`, `FirstName`, `LastName`, `Birthdate`, `HomeCountry`) VALUES
(1, 'Carlos', 'Coronel', NULL, NULL),
(2, 'Steven', 'Morris', NULL, NULL),
(3, 'Peter', 'Rob', NULL, NULL),
(4, 'Andrew', 'Tanenbaum', NULL, NULL),
(5, 'Herbert', 'Bos', NULL, NULL),
(6, 'Martin', 'Fowler', NULL, NULL),
(7, 'Peter', 'Linz', NULL, NULL),
(8, 'Ira', 'Forman', NULL, NULL),
(9, 'Nate', 'Forman', NULL, NULL),
(10, 'David', 'Wetherall', NULL, NULL),
(11, 'Haruki', 'Murakami', NULL, 'Ja'),
(12, 'Yoshihiro', 'Togashi', NULL, 'ja');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `ISBN` bigint(13) NOT NULL,
  `Title` varchar(511) NOT NULL,
  `SalePrice` float NOT NULL,
  `PageCount` int(6) NOT NULL,
  `Edition` smallint(3) NOT NULL,
  `Language` varchar(2) NOT NULL,
  `Publisher` int(11) DEFAULT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `Publisher` (`Publisher`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ISBN`, `Title`, `SalePrice`, `PageCount`, `Edition`, `Language`, `Publisher`) VALUES
(9780099448792, 'The Wind-Up Bird Chronicle', 165.98, 624, 1, 'ja', 6),
(9780099448822, 'Norwegian Wood', 15.42, 400, 1, 'ja', 6),
(9780099506249, 'After Dark', 29.74, 208, 1, 'ja', 6),
(9780131485211, 'Structured Computer Organization', 70.2, 800, 5, 'en', 2),
(9780132126953, 'Computer Networks', 159.8, 960, 5, 'en', 2),
(9780133591620, 'Modern Operating Systems', 71.99, 1136, 4, 'en', 2),
(9780201433050, 'Putting Metaclasses to Work', 139.11, 320, 1, 'en', 3),
(9780201485677, 'Refactoring: Improving the Design of Existing Code', 42.83, 464, 1, 'en', 3),
(9781285196145, 'Database Systems: Design, Implementation, & Management', 49.99, 784, 11, 'en', 1),
(9781423902010, 'Database Systems: Design, Implementation, and Management', 28.99, 728, 8, 'en', 1),
(9781449615529, 'An Introduction To Formal Languages And Automata', 175.98, 437, 5, 'en', 4),
(9781591167532, 'Hunter x Hunter 1', 9.81, 184, 1, 'ja', 7),
(9781591167853, 'Hunter x Hunter 2', 10.01, 192, 1, 'ja', 7),
(9781591168492, 'Hunter x Hunter 3', 6.8, 192, 1, 'ja', 7),
(9781890774691, 'Murach''s SQL Server 2012 for Developers: Training & Reference', 60.84, 796, 1, 'en', NULL),
(9781932394184, 'Java Reflection in Action', 42.81, 273, 2, 'en', 5);

-- --------------------------------------------------------

--
-- Table structure for table `bookauthor`
--

CREATE TABLE IF NOT EXISTS `bookauthor` (
  `ISBN` bigint(13) NOT NULL,
  `AuthorId` int(11) NOT NULL,
  KEY `ISBN` (`ISBN`),
  KEY `AuthorId` (`AuthorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookauthor`
--

INSERT INTO `bookauthor` (`ISBN`, `AuthorId`) VALUES
(9781423902010, 1),
(9781423902010, 3),
(9781285196145, 1),
(9781285196145, 2),
(9780133591620, 4),
(9780133591620, 5),
(9780131485211, 4),
(9780201485677, 6),
(9781449615529, 7),
(9781932394184, 8),
(9781932394184, 9),
(9780201433050, 8),
(9780132126953, 10),
(9780099448822, 11),
(9780099448792, 11),
(9780099506249, 11),
(9781591167532, 12),
(9781591167853, 12),
(9781591168492, 12);

-- --------------------------------------------------------

--
-- Table structure for table `bookcollected`
--

CREATE TABLE IF NOT EXISTS `bookcollected` (
  `CollectionId` int(11) NOT NULL,
  `ISBN` bigint(13) NOT NULL,
  KEY `CollectionId` (`CollectionId`),
  KEY `ISBN` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookcollected`
--

INSERT INTO `bookcollected` (`CollectionId`, `ISBN`) VALUES
(2, 9781285196145),
(3, 9781449615529),
(3, 9780132126953),
(3, 9780201433050),
(1, 9781449615529),
(1, 9780133591620),
(2, 9780133591620),
(3, 9781285196145);

-- --------------------------------------------------------

--
-- Table structure for table `bookcopy`
--

CREATE TABLE IF NOT EXISTS `bookcopy` (
  `BookCopyId` bigint(20) NOT NULL AUTO_INCREMENT,
  `IsForSale` tinyint(1) NOT NULL,
  `HeldBy` int(11) DEFAULT NULL,
  `ISBN` bigint(13) NOT NULL,
  PRIMARY KEY (`BookCopyId`),
  KEY `ISBN` (`ISBN`),
  KEY `HeldBy` (`HeldBy`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=48 ;

--
-- Dumping data for table `bookcopy`
--

INSERT INTO `bookcopy` (`BookCopyId`, `IsForSale`, `HeldBy`, `ISBN`) VALUES
(1, 0, NULL, 9781285196145),
(2, 0, NULL, 9781285196145),
(3, 1, NULL, 9781285196145),
(4, 1, NULL, 9780133591620),
(5, 1, NULL, 9780133591620),
(6, 0, NULL, 9780131485211),
(7, 1, NULL, 9780131485211),
(8, 1, NULL, 9780131485211),
(9, 0, NULL, 9780201485677),
(10, 0, NULL, 9780201485677),
(11, 1, NULL, 9780201485677),
(12, 1, NULL, 9781449615529),
(13, 0, NULL, 9781449615529),
(14, 0, NULL, 9781449615529),
(15, 0, NULL, 9781932394184),
(16, 1, NULL, 9781932394184),
(17, 1, NULL, 9781932394184),
(18, 1, NULL, 9780201433050),
(19, 1, NULL, 9780201433050),
(20, 0, NULL, 9780201433050),
(21, 0, NULL, 9780201433050),
(22, 0, NULL, 9780132126953),
(23, 0, NULL, 9780132126953),
(24, 0, NULL, 9780099506249),
(25, 1, NULL, 9780099506249),
(26, 1, NULL, 9780099506249),
(27, 1, NULL, 9780099506249),
(28, 0, NULL, 9780099448822),
(29, 1, NULL, 9780099448822),
(30, 1, NULL, 9780099448822),
(31, 0, NULL, 9780099448792),
(32, 0, NULL, 9780099448792),
(33, 1, NULL, 9780099448792),
(34, 1, NULL, 9780099448792),
(35, 0, NULL, 9781591167532),
(36, 0, NULL, 9781591167532),
(37, 0, NULL, 9781591167532),
(38, 1, NULL, 9781591167532),
(39, 1, NULL, 9781591167532),
(40, 0, NULL, 9781591167853),
(41, 1, NULL, 9781591167853),
(42, 1, NULL, 9781591167853),
(43, 1, NULL, 9781591167853),
(44, 1, NULL, 9781591167853),
(45, 0, NULL, 9781591168492),
(46, 1, NULL, 9781591168492),
(47, 1, NULL, 9781591168492);

-- --------------------------------------------------------

--
-- Table structure for table `bookrated`
--

CREATE TABLE IF NOT EXISTS `bookrated` (
  `RatingId` int(11) NOT NULL AUTO_INCREMENT,
  `CardNumber` int(11) NOT NULL,
  `ISBN` bigint(13) NOT NULL,
  `Rating` tinyint(1) NOT NULL,
  `Review` text NOT NULL,
  `Date` datetime NOT NULL,
  PRIMARY KEY (`RatingId`),
  KEY `CardNumber` (`CardNumber`),
  KEY `ISBN` (`ISBN`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `bookrated`
--

INSERT INTO `bookrated` (`RatingId`, `CardNumber`, `ISBN`, `Rating`, `Review`, `Date`) VALUES
(4, 412100003, 9780201433050, 3, '', '2014-12-17 21:44:03'),
(5, 412100001, 9780201433050, 4, '', '2014-12-17 21:44:36'),
(6, 412100004, 9781285196145, 3, '', '2014-12-17 23:02:38'),
(7, 412100004, 9780132126953, 3, '', '2014-12-17 23:15:20'),
(8, 412100004, 9781449615529, 3, '', '2014-12-17 23:16:18');

-- --------------------------------------------------------

--
-- Table structure for table `booktransaction`
--

CREATE TABLE IF NOT EXISTS `booktransaction` (
  `BookTransactionId` bigint(20) NOT NULL AUTO_INCREMENT,
  `BookCopyId` bigint(20) NOT NULL,
  `Time` datetime NOT NULL,
  `ExpectedReturn` datetime DEFAULT NULL,
  `ActualReturn` datetime DEFAULT NULL,
  `CardNumber` int(11) NOT NULL,
  PRIMARY KEY (`BookTransactionId`),
  KEY `BookCopyId` (`BookCopyId`),
  KEY `CardNumber` (`CardNumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `booktransaction`
--

INSERT INTO `booktransaction` (`BookTransactionId`, `BookCopyId`, `Time`, `ExpectedReturn`, `ActualReturn`, `CardNumber`) VALUES
(1, 13, '2014-12-15 11:30:00', '2014-12-17 04:00:00', NULL, 412100003),
(2, 21, '2014-12-15 05:30:00', '2014-12-07 05:30:00', NULL, 412100002),
(3, 6, '2014-12-15 13:20:00', '2014-12-18 07:20:00', NULL, 412100002),
(4, 22, '2014-12-16 09:20:00', '2014-12-18 16:20:00', NULL, 412100001),
(5, 2, '2014-12-16 15:20:00', '2014-12-20 18:30:00', NULL, 412100001);

-- --------------------------------------------------------

--
-- Table structure for table `collection`
--

CREATE TABLE IF NOT EXISTS `collection` (
  `CollectionId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `CardNumber` int(11) NOT NULL,
  PRIMARY KEY (`CollectionId`),
  KEY `CardNumber` (`CardNumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `collection`
--

INSERT INTO `collection` (`CollectionId`, `Name`, `CardNumber`) VALUES
(1, 'Favorites', 412100001),
(2, 'Textbooks', 412100001),
(3, 'Expensive Books', 412100003),
(4, 'Favorites', 412100004);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE IF NOT EXISTS `publisher` (
  `PublisherId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Address` varchar(511) NOT NULL,
  `Phone` bigint(11) NOT NULL,
  PRIMARY KEY (`PublisherId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`PublisherId`, `Name`, `Address`, `Phone`) VALUES
(1, 'Cengage Learning', '10650 Toebben Drive, Independence, KY 41051', 18003549706),
(2, 'Prentice Hall', 'Upper Saddle River, NJ 07458', 18008489500),
(3, 'Addison Wesley', '26 Prince Andrew Place Don Mills, ON M3C 2T8', 18002639965),
(4, 'Jones & Bartlett Learning', '5 Wall Street Burlington, MA 01803', 18008320034),
(5, 'Manning Publications', '20 Baldwin Road,Shelter Island, NY 11963', 2036261510),
(6, 'Vintage Publishing', '20 Vauxhall Bridge Road, London SW1V 2SA', 4402078408400),
(7, 'Viz Media', '1355 Market Street, Suite #200, San Francisco, CA 94103', 5552034578);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `CardNumber` int(11) NOT NULL,
  `IsEmployee` tinyint(1) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Password` varchar(72) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `AccountStatus` tinyint(1) NOT NULL,
  PRIMARY KEY (`CardNumber`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`CardNumber`, `IsEmployee`, `Name`, `Password`, `Email`, `AccountStatus`) VALUES
(412100001, 1, 'Alice Appleseed', '$2y$10$9pPv.7ymnYg9eFc1LBK1tOZKBgB1UoOEzxDpF7MYZBYw99Uk/3Q2q', 'Alice.Appleseed.9999@gmail.com', 0),
(412100002, 2, 'Bob Burns', '$2y$10$Ye0QxeXNC2OphK7cklHOzudZDCgYbNKVEPC0WlJ13OmKv4Ta9osQi', 'Bob.Burns.9999@gmail.com', 0),
(412100003, 2, 'Charlie Chaplin', '$2y$10$kf0cU6g5Sr14PkNmp7cm2.DFF5lQu2la1BgQKlmHkJfaXOEpu6QhW', 'Charlie.Chaplin.9999@gmail.com', 0),
(412100004, 0, 'Duck Dodgers', '$2y$10$h/YjxovnjZ79Ao9OORJ62OCesSlKKfTmBIfmsyxCra3ThXfH35/tK', 'Duck.Dodgers.9999@gmail.com', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `Book_ibfk_1` FOREIGN KEY (`Publisher`) REFERENCES `publisher` (`PublisherId`);

--
-- Constraints for table `bookauthor`
--
ALTER TABLE `bookauthor`
  ADD CONSTRAINT `BookAuthor_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `BookAuthor_ibfk_2` FOREIGN KEY (`AuthorId`) REFERENCES `author` (`AuthorId`);

--
-- Constraints for table `bookcollected`
--
ALTER TABLE `bookcollected`
  ADD CONSTRAINT `BookFave_ibfk_1` FOREIGN KEY (`CollectionId`) REFERENCES `collection` (`CollectionId`),
  ADD CONSTRAINT `BookFave_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`);

--
-- Constraints for table `bookcopy`
--
ALTER TABLE `bookcopy`
  ADD CONSTRAINT `BookCopy_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `BookCopy_ibfk_2` FOREIGN KEY (`HeldBy`) REFERENCES `user` (`CardNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `booktransaction`
--
ALTER TABLE `booktransaction`
  ADD CONSTRAINT `BookTransaction_ibfk_1` FOREIGN KEY (`BookCopyId`) REFERENCES `bookcopy` (`BookCopyId`),
  ADD CONSTRAINT `BookTransaction_ibfk_2` FOREIGN KEY (`CardNumber`) REFERENCES `user` (`CardNumber`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;