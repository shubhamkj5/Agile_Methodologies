-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: sql2.freemysqlhosting.net
-- Generation Time: Feb 11, 2019 at 04:25 PM
-- Server version: 5.5.54-0ubuntu0.12.04.1
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sql2278445`
--

-- --------------------------------------------------------

--
-- Table structure for table `DelArea`
--

CREATE TABLE `DelArea` (
  `idDelArea` int(11) NOT NULL,
  `DelAreaName` varchar(45) DEFAULT NULL,
  `DelAreaPerson` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Delivery`
--

CREATE TABLE `Delivery` (
  `idDelivery` int(11) NOT NULL,
  `idOrder` int(11) DEFAULT NULL,
  `DeliveryDate` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `idProduct` int(11) DEFAULT NULL,
  `idDelArea` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Invoice`
--

CREATE TABLE `Invoice` (
  `idInvoice` int(11) NOT NULL,
  `InvoiceUserId` int(11) DEFAULT NULL,
  `InvoiceOrder` int(11) DEFAULT NULL,
  `InvoiceDate` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Order`
--

CREATE TABLE `Order` (
  `idOrder` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `OrderStart` varchar(45) NOT NULL,
  `OrderSuspend` varchar(45) DEFAULT NULL,
  `OrderFrequency` varchar(45) NOT NULL,
  `idProduct` varchar(200) NOT NULL,
  `PaidStatus` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `idProduct` int(11) NOT NULL,
  `ProductName` varchar(45) NOT NULL,
  `ProductPrice` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `idUser` int(11) NOT NULL,
  `UserName` varchar(45) NOT NULL,
  `UserEmail` varchar(45) NOT NULL,
  `UserMobile` int(11) NOT NULL,
  `UserPass` varchar(45) DEFAULT NULL,
  `UserType` varchar(45) NOT NULL,
  `UserAddress` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `DelArea`
--
ALTER TABLE `DelArea`
  ADD PRIMARY KEY (`idDelArea`),
  ADD KEY `idUser_idx` (`DelAreaPerson`);

--
-- Indexes for table `Delivery`
--
ALTER TABLE `Delivery`
  ADD PRIMARY KEY (`idDelivery`),
  ADD KEY `idOrder_idx` (`idOrder`),
  ADD KEY `idProduct_idx` (`idProduct`),
  ADD KEY `idDelArea_idx` (`idDelArea`);

--
-- Indexes for table `Invoice`
--
ALTER TABLE `Invoice`
  ADD PRIMARY KEY (`idInvoice`),
  ADD KEY `idUser_idx` (`InvoiceUserId`);

--
-- Indexes for table `Order`
--
ALTER TABLE `Order`
  ADD PRIMARY KEY (`idOrder`),
  ADD KEY `Customer_fk_idx` (`idUser`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`idProduct`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `DelArea`
--
ALTER TABLE `DelArea`
  MODIFY `idDelArea` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Delivery`
--
ALTER TABLE `Delivery`
  MODIFY `idDelivery` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Invoice`
--
ALTER TABLE `Invoice`
  MODIFY `idInvoice` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Order`
--
ALTER TABLE `Order`
  MODIFY `idOrder` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Product`
--
ALTER TABLE `Product`
  MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `DelArea`
--
ALTER TABLE `DelArea`
  ADD CONSTRAINT `idUser_fk` FOREIGN KEY (`DelAreaPerson`) REFERENCES `User` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Delivery`
--
ALTER TABLE `Delivery`
  ADD CONSTRAINT `idDelArea` FOREIGN KEY (`idDelArea`) REFERENCES `DelArea` (`idDelArea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idOrder` FOREIGN KEY (`idOrder`) REFERENCES `Order` (`idOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idProduct` FOREIGN KEY (`idProduct`) REFERENCES `Product` (`idProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Invoice`
--
ALTER TABLE `Invoice`
  ADD CONSTRAINT `Customer` FOREIGN KEY (`InvoiceUserId`) REFERENCES `User` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Order` FOREIGN KEY (`idInvoice`) REFERENCES `Order` (`idOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Order`
--
ALTER TABLE `Order`
  ADD CONSTRAINT `Customer_fk` FOREIGN KEY (`idUser`) REFERENCES `User` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
