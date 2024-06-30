-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 30, 2024 at 03:58 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `daftar`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_del_peserta` (IN `p_id` INT(3))   delete from peserta where id_peserta = p_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_fakultas` ()  READS SQL DATA SELECT * FROM fakultas$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_peserta` ()  READS SQL DATA SELECT * FROM peserta$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_prodi` ()  READS SQL DATA SELECT * FROM prodi$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `id_fakultas` int NOT NULL,
  `fakultas` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fakultas`
--

INSERT INTO `fakultas` (`id_fakultas`, `fakultas`) VALUES
(1, 'Fakultas Olahraga'),
(2, 'Fakultas Ekonomi Bisnis'),
(3, 'Fakultas Teknik'),
(4, 'Fakultas Pedidikan'),
(5, 'Fakultas Kesehatan'),
(6, 'Fakultas Pertanian'),
(7, 'Fakultas Kedokteran');

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `id_peserta` int NOT NULL,
  `id_fakultas` int NOT NULL,
  `id_prodi` int NOT NULL,
  `nama` varchar(25) NOT NULL,
  `kota` varchar(25) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `peserta`
--

INSERT INTO `peserta` (`id_peserta`, `id_fakultas`, `id_prodi`, `nama`, `kota`, `tgl_lahir`, `alamat`) VALUES
(1, 1, 7, 'kiki', 'semarang', '2024-06-12', 'jeruk');

--
-- Triggers `peserta`
--
DELIMITER $$
CREATE TRIGGER `t_del_peserta` BEFORE DELETE ON `peserta` FOR EACH ROW insert into peserta_cadangan values(
old.id_peserta, old.id_fakultas, old.id_prodi, old.nama, old.kota, old.tgl_lahir, old.alamat)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `peserta_cadangan`
--

CREATE TABLE `peserta_cadangan` (
  `id_peserta` int NOT NULL,
  `id_fakultas` int NOT NULL,
  `id_prodi` int NOT NULL,
  `nama` varchar(35) NOT NULL,
  `kota` varchar(25) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `peserta_cadangan`
--

INSERT INTO `peserta_cadangan` (`id_peserta`, `id_fakultas`, `id_prodi`, `nama`, `kota`, `tgl_lahir`, `alamat`) VALUES
(2, 1, 7, 'roni', 'semarang', '2024-06-10', 'jeruk');

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `id_prodi` int NOT NULL,
  `prodi` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`id_prodi`, `prodi`) VALUES
(6, 'Fakultas Ekonomi Bisnis'),
(7, 'Fakultas Pendidikan'),
(8, 'Fakultas Agraria'),
(9, 'Fakultas Sastra'),
(10, 'Fakultas Teknik');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_detil_peserta`
-- (See below for the actual view)
--
CREATE TABLE `v_detil_peserta` (
`alamat` varchar(20)
,`fakultas` varchar(35)
,`id_peserta` int
,`kota` varchar(25)
,`nama` varchar(25)
,`prodi` varchar(25)
,`tgl_lahir` date
);

-- --------------------------------------------------------

--
-- Structure for view `v_detil_peserta`
--
DROP TABLE IF EXISTS `v_detil_peserta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_detil_peserta`  AS SELECT `peserta`.`id_peserta` AS `id_peserta`, `peserta`.`nama` AS `nama`, `peserta`.`kota` AS `kota`, `peserta`.`tgl_lahir` AS `tgl_lahir`, `peserta`.`alamat` AS `alamat`, `fakultas`.`fakultas` AS `fakultas`, `prodi`.`prodi` AS `prodi` FROM ((`peserta` join `prodi` on((`peserta`.`id_prodi` = `prodi`.`id_prodi`))) join `fakultas` on((`peserta`.`id_fakultas` = `fakultas`.`id_fakultas`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id_fakultas`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`id_peserta`),
  ADD KEY `id_fakultas` (`id_fakultas`),
  ADD KEY `id_prodi` (`id_prodi`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id_prodi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `id_fakultas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `peserta`
--
ALTER TABLE `peserta`
  MODIFY `id_peserta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id_prodi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `peserta`
--
ALTER TABLE `peserta`
  ADD CONSTRAINT `peserta_ibfk_1` FOREIGN KEY (`id_prodi`) REFERENCES `prodi` (`id_prodi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `peserta_ibfk_2` FOREIGN KEY (`id_fakultas`) REFERENCES `fakultas` (`id_fakultas`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
