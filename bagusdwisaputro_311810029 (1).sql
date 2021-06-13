-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2021 at 04:20 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bagusdwisaputro_311810029`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(20) DEFAULT NULL,
  `harga` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga`) VALUES
('1A', 'Ban', 500000),
('1B', 'Velg', 1000000),
('2A', 'Lampu utama', 200000),
('2B', 'Lampu sein', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `faktur`
--

CREATE TABLE `faktur` (
  `no_faktur` varchar(10) NOT NULL,
  `no_polisi` varchar(10) DEFAULT NULL,
  `id_barang` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faktur`
--

INSERT INTO `faktur` (`no_faktur`, `no_polisi`, `id_barang`) VALUES
('1122', 'AB 7323 FJ', '1A'),
('1222', 'AD 2351 FG', '2B');

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `no_polisi` varchar(10) NOT NULL,
  `merk` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`no_polisi`, `merk`) VALUES
('AB 7323 FJ', 'APV'),
('AD 2351 FG', 'Avanza'),
('B 1234 ZX', 'Jazz');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `no_faktur` varchar(10) NOT NULL,
  `kepada` tinytext NOT NULL,
  `tanggal` varchar(20) NOT NULL,
  `qnty` int(10) NOT NULL,
  `discount` int(5) NOT NULL,
  `total` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`no_faktur`, `kepada`, `tanggal`, `qnty`, `discount`, `total`) VALUES
('1122', 'Bagus', '06 mei 2021', 1, 1, 500000),
('1222', 'Farid', '05 April 2021', 2, 0, 100000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `faktur`
--
ALTER TABLE `faktur`
  ADD PRIMARY KEY (`no_faktur`),
  ADD UNIQUE KEY `no_faktur` (`no_faktur`),
  ADD KEY `faktur_ibfk_3` (`id_barang`),
  ADD KEY `faktur_ibfk_4` (`no_polisi`);

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`no_polisi`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`no_faktur`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `faktur`
--
ALTER TABLE `faktur`
  ADD CONSTRAINT `faktur_ibfk_1` FOREIGN KEY (`no_faktur`) REFERENCES `transaksi` (`no_faktur`),
  ADD CONSTRAINT `faktur_ibfk_3` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `faktur_ibfk_4` FOREIGN KEY (`no_polisi`) REFERENCES `kendaraan` (`no_polisi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
