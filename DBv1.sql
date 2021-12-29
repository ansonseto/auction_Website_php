-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 10, 2021 at 01:18 PM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DBv1`
--

-- --------------------------------------------------------

--
-- Table structure for table `AuctionStatus`
--

CREATE TABLE `AuctionStatus` (
  `AuctionStatusId` int(10) UNSIGNED NOT NULL,
  `ItemId` int(10) UNSIGNED NOT NULL,
  `AuctionStatus` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BidRecord`
--

CREATE TABLE `BidRecord` (
  `BidRecordId` int(10) UNSIGNED NOT NULL,
  `ItemId` int(10) UNSIGNED NOT NULL,
  `UserId` int(10) UNSIGNED NOT NULL,
  `BidAmount` int(10) UNSIGNED NOT NULL,
  `BidDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `BidRecord`
--

INSERT INTO `BidRecord` (`BidRecordId`, `ItemId`, `UserId`, `BidAmount`, `BidDateTime`) VALUES
(1, 3, 1, 400, '2021-11-05 16:10:02'),
(2, 3, 4, 410, '2021-11-05 16:20:12'),
(3, 3, 5, 420, '2021-11-05 16:20:12'),
(4, 3, 3, 425, '2021-11-05 16:20:12'),
(5, 1, 4, 150, '2021-11-05 16:20:12'),
(6, 1, 5, 155, '2021-11-05 16:20:12'),
(7, 1, 6, 160, '2021-11-05 16:20:12'),
(8, 1, 5, 162, '2021-11-05 16:20:12'),
(9, 8, 5, 20, '2021-11-05 16:20:12'),
(10, 9, 6, 10, '2021-11-05 16:20:12'),
(11, 10, 1, 50, '2021-11-05 16:20:12'),
(12, 10, 2, 51, '2021-11-05 16:20:12'),
(13, 10, 4, 52, '2021-11-05 16:20:12'),
(14, 10, 5, 53, '2021-11-05 16:20:12'),
(15, 10, 6, 54, '2021-11-05 16:20:12'),
(16, 10, 5, 55, '2021-11-09 22:17:46');

-- --------------------------------------------------------

--
-- Stand-in structure for view `browse`
-- (See below for the actual view)
--
CREATE TABLE `browse` (
`ItemId` int(10) unsigned
,`ItemName` varchar(50)
,`Description` text
,`Cond_` enum('Very Good','Good','Fair','Poor','Very Poor')
,`Category` enum('Living Room','Kitchen','Bathroom','Study','Bedroom')
,`Price` decimal(12,2)
,`AuctionEndDateTime` date
,`BidsCount` bigint(21)
,`ImageLocation` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `Image`
--

CREATE TABLE `Image` (
  `ImageId` int(10) UNSIGNED NOT NULL,
  `ItemId` int(10) UNSIGNED NOT NULL,
  `ImageLocation` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Image`
--

INSERT INTO `Image` (`ImageId`, `ItemId`, `ImageLocation`) VALUES
(1, 1, 'Sofa_1.jpeg'),
(2, 1, 'Sofa_2.jpeg'),
(3, 1, 'Sofa_3.jpeg'),
(4, 1, 'Sofa_4.jpeg'),
(5, 2, 'SideTable_1.jpeg'),
(6, 2, 'SideTable_2.jpeg'),
(7, 2, 'SideTable_3.jpeg'),
(8, 2, 'SideTable_4.jpeg'),
(9, 3, 'Table_1.jpeg'),
(10, 3, 'Table_2.jpeg'),
(11, 3, 'Table_3.jpeg'),
(12, 3, 'Table_4.jpeg'),
(13, 4, 'HighTable_1.jpeg'),
(14, 4, 'HighTable_2.jpeg'),
(15, 4, 'HighTable_3.jpeg'),
(16, 4, 'HighTable_4.jpeg'),
(17, 5, 'BedFrame_1.jpeg'),
(18, 5, 'BedFrame_2.jpeg'),
(19, 6, 'Armchair_1.jpeg'),
(20, 6, 'Armchair_2.jpeg'),
(21, 6, 'Armchair_3.jpeg'),
(22, 7, 'TowelRack_1.jpeg'),
(23, 7, 'TowelRack_2.jpeg'),
(24, 7, 'TowelRack_3.jpeg'),
(25, 7, 'TowelRack_4.jpeg'),
(26, 7, 'TowelRack_5.jpeg'),
(27, 8, 'BathStand_1.jpeg'),
(28, 8, 'BathStand_2.jpeg'),
(29, 9, 'Monitor_1.jpeg'),
(30, 8, 'Monitor_2.jpeg'),
(31, 8, 'Monitor_3.jpeg'),
(32, 10, 'Chair_1.jpeg'),
(33, 10, 'Chair_2.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `Item`
--

CREATE TABLE `Item` (
  `ItemId` int(10) UNSIGNED NOT NULL,
  `UserId` int(10) UNSIGNED NOT NULL,
  `ItemName` varchar(50) NOT NULL,
  `Description` text NOT NULL,
  `Cond_` enum('Very Good','Good','Fair','Poor','Very Poor') NOT NULL,
  `itemCreateDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Category` enum('Living Room','Kitchen','Bathroom','Study','Bedroom') NOT NULL,
  `StartingBid` decimal(5,2) UNSIGNED NOT NULL,
  `ReservePrice` decimal(5,2) UNSIGNED NOT NULL,
  `AuctionEndDateTime` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Item`
--

INSERT INTO `Item` (`ItemId`, `UserId`, `ItemName`, `Description`, `Cond_`, `itemCreateDateTime`, `Category`, `StartingBid`, `ReservePrice`, `AuctionEndDateTime`) VALUES
(1, 1, 'Grey Corner Sofa with Sofa Bed', 'Lovely dark grey, corner, fabric sofa with built in sofa bed. ', 'Very Good', '2021-11-05 15:26:14', 'Living Room', '150.00', '160.00', '2021-11-06'),
(2, 1, '3-edge Side Table', 'Dwell walnut side table with glass top. Still in good condition with minor scratches, wear and tear but hardly visible. Pick up only.', 'Fair', '2021-11-05 16:04:44', 'Living Room', '80.00', '85.00', '2021-11-10'),
(3, 2, 'Walnut dining table and chairs', 'Extending walnut dining table with 6 chairs  Turkish Brand Dogtas.  Great condition.  Brown faux leather seats.  Sold as set only.   Pick up only. ', 'Good', '2021-11-05 16:04:44', 'Kitchen', '400.00', '440.00', '2021-11-15'),
(4, 2, 'High Breakfast Table in industrial style', 'Brand new Bar Table / High Breakfast Table in industrial style (walnut finish).  I purchased this table last week and unfortunately its the wrong size for our space so I need to return/ sell.  The finish is fantastic, its a very high quality product.', 'Very Good', '2021-11-05 16:04:44', 'Kitchen', '150.00', '150.00', '2021-11-16'),
(5, 2, 'Double bed frame', 'Wooden double bed frame', 'Good', '2021-11-05 16:04:44', 'Bedroom', '25.00', '25.00', '2021-11-17'),
(6, 2, 'Red Jonas Single Armchair', 'Red Jonas Single seater armchair from MADE. In good condition.', 'Good', '2021-11-05 16:04:44', 'Bedroom', '50.00', '50.00', '2021-11-18'),
(7, 2, 'Towel Rack', 'Black towel rack', 'Very Good', '2021-11-05 16:04:44', 'Bathroom', '20.00', '20.00', '2021-11-25'),
(8, 3, 'Bath Stand', 'Beautiful bath stand perfect for holding a glass of wine or a book. ', 'Very Good', '2021-11-05 16:04:44', 'Bathroom', '20.00', '25.00', '2021-11-26'),
(9, 3, 'Samsung MONITOR 20” ', 'Samsung monitor\r\nBlack 20”', 'Good', '2021-11-05 16:04:44', 'Study', '10.00', '12.00', '2021-11-27'),
(10, 3, 'ERGO Chair', 'ERGO Luxury Mesh Back Executive Chair - Black', 'Good', '2021-11-05 16:04:44', 'Study', '50.00', '55.00', '2021-11-28');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `UserId` int(10) UNSIGNED NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `JoinDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`UserId`, `FirstName`, `LastName`, `Email`, `JoinDate`, `Password`) VALUES
(1, 'Neave', 'Barclay', 'neavebarclay21@random.ac.uk', '2021-11-05 15:24:19', 'juuPf9'),
(2, 'Mikayla', 'Potter', 'mikaylapotter21@random.ac.uk', '2021-11-05 15:55:36', 'WGGLwp'),
(3, 'Findlay', 'Melia', 'findlaymelia21@random.ac.uk', '2021-11-05 15:55:36', 'S2PNHQ'),
(4, 'Tori', 'Sanderson', 'torisanderson21@random.ac.uk', '2021-11-05 15:55:36', 'SFVvaN'),
(5, 'Ruby', 'Prentice', 'rubyprentice21@random.ac.uk', '2021-11-05 15:55:36', 'zm8aTA'),
(6, 'Odin', 'Cook', 'odincook21@random.ac.uk', '2021-11-05 15:55:36', 'f7DrP2');

-- --------------------------------------------------------

--
-- Table structure for table `ViewRecord`
--

CREATE TABLE `ViewRecord` (
  `ViewRecordId` int(10) UNSIGNED NOT NULL,
  `ItemId` int(10) UNSIGNED NOT NULL,
  `UserId` int(10) UNSIGNED NOT NULL,
  `ViewDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `WatchList`
--

CREATE TABLE `WatchList` (
  `WatchListId` int(10) NOT NULL,
  `UserId` int(10) UNSIGNED NOT NULL,
  `ItemId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure for view `browse`
--
DROP TABLE IF EXISTS `browse`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `browse`  AS SELECT `i`.`ItemId` AS `ItemId`, `i`.`ItemName` AS `ItemName`, `i`.`Description` AS `Description`, `i`.`Cond_` AS `Cond_`, `i`.`Category` AS `Category`, greatest(`i`.`StartingBid`,coalesce(`b`.`HighestBid`,0)) AS `Price`, `i`.`AuctionEndDateTime` AS `AuctionEndDateTime`, coalesce(`b`.`BidsCount`,0) AS `BidsCount`, `f`.`ImageLocation` AS `ImageLocation` FROM ((`dbv1`.`item` `i` left join (select `dbv1`.`bidrecord`.`ItemId` AS `ItemId`,max(`dbv1`.`bidrecord`.`BidAmount`) AS `HighestBid`,count(`dbv1`.`bidrecord`.`BidAmount`) AS `BidsCount` from `dbv1`.`bidrecord` group by `dbv1`.`bidrecord`.`ItemId`) `b` on((`i`.`ItemId` = `b`.`ItemId`))) join (select `dbv1`.`image`.`ItemId` AS `ItemId`,`dbv1`.`image`.`ImageLocation` AS `ImageLocation` from `dbv1`.`image` where `dbv1`.`image`.`ImageId` in (select min(`dbv1`.`image`.`ImageId`) from `dbv1`.`image` group by `dbv1`.`image`.`ItemId`)) `f` on((`i`.`ItemId` = `f`.`ItemId`))) WHERE (`i`.`AuctionEndDateTime` >= now()) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AuctionStatus`
--
ALTER TABLE `AuctionStatus`
  ADD PRIMARY KEY (`AuctionStatusId`),
  ADD KEY `ItemId` (`ItemId`);

--
-- Indexes for table `BidRecord`
--
ALTER TABLE `BidRecord`
  ADD PRIMARY KEY (`BidRecordId`),
  ADD KEY `ItemId` (`ItemId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `Image`
--
ALTER TABLE `Image`
  ADD PRIMARY KEY (`ImageId`),
  ADD KEY `ItemId` (`ItemId`);

--
-- Indexes for table `Item`
--
ALTER TABLE `Item`
  ADD PRIMARY KEY (`ItemId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `ViewRecord`
--
ALTER TABLE `ViewRecord`
  ADD PRIMARY KEY (`ViewRecordId`),
  ADD KEY `ItemId` (`ItemId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `WatchList`
--
ALTER TABLE `WatchList`
  ADD PRIMARY KEY (`WatchListId`),
  ADD UNIQUE KEY `UserId_2` (`UserId`,`ItemId`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `ItemId` (`ItemId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AuctionStatus`
--
ALTER TABLE `AuctionStatus`
  MODIFY `AuctionStatusId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `BidRecord`
--
ALTER TABLE `BidRecord`
  MODIFY `BidRecordId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `Image`
--
ALTER TABLE `Image`
  MODIFY `ImageId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `Item`
--
ALTER TABLE `Item`
  MODIFY `ItemId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `UserId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ViewRecord`
--
ALTER TABLE `ViewRecord`
  MODIFY `ViewRecordId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `WatchList`
--
ALTER TABLE `WatchList`
  MODIFY `WatchListId` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AuctionStatus`
--
ALTER TABLE `AuctionStatus`
  ADD CONSTRAINT `auctionstatus_ibfk_1` FOREIGN KEY (`AuctionStatusId`) REFERENCES `Item` (`ItemId`);

--
-- Constraints for table `BidRecord`
--
ALTER TABLE `BidRecord`
  ADD CONSTRAINT `bidrecord_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`),
  ADD CONSTRAINT `bidrecord_ibfk_2` FOREIGN KEY (`ItemId`) REFERENCES `Item` (`ItemId`);

--
-- Constraints for table `Image`
--
ALTER TABLE `Image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`ItemId`) REFERENCES `Item` (`ItemId`);

--
-- Constraints for table `Item`
--
ALTER TABLE `Item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`);

--
-- Constraints for table `ViewRecord`
--
ALTER TABLE `ViewRecord`
  ADD CONSTRAINT `viewrecord_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`),
  ADD CONSTRAINT `viewrecord_ibfk_2` FOREIGN KEY (`ItemId`) REFERENCES `Item` (`ItemId`);

--
-- Constraints for table `WatchList`
--
ALTER TABLE `WatchList`
  ADD CONSTRAINT `watchlist_ibfk_2` FOREIGN KEY (`ItemId`) REFERENCES `Item` (`ItemId`),
  ADD CONSTRAINT `watchlist_ibfk_3` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
