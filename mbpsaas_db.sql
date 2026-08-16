-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2026 at 01:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mbpsaas_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `motion_events`
--

CREATE TABLE `motion_events` (
  `id` int(11) NOT NULL,
  `zone` varchar(20) NOT NULL DEFAULT 'COOP1',
  `detected_at` datetime NOT NULL,
  `buzzer_triggered` tinyint(1) NOT NULL DEFAULT 1,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `motion_events`
--

INSERT INTO `motion_events` (`id`, `zone`, `detected_at`, `buzzer_triggered`, `note`, `created_at`) VALUES
(1, 'COOP1', '2026-07-15 17:29:43', 1, 'test', '2026-07-15 09:29:43'),
(2, 'COOP1', '2026-08-05 19:48:06', 0, 'Coop 1 - PIR Sensor Disabled', '2026-08-05 11:48:06'),
(3, 'COOP2', '2026-08-05 19:48:13', 0, 'Coop 2 - PIR Sensor Disabled', '2026-08-05 11:48:13'),
(4, 'COOP2', '2026-08-05 19:48:15', 0, 'Coop 2 - PIR Sensor Enabled', '2026-08-05 11:48:15'),
(5, 'COOP1', '2026-08-16 18:21:57', 0, 'Coop 1 - PIR Sensor Enabled', '2026-08-16 10:21:57');

-- --------------------------------------------------------

--
-- Table structure for table `sensor_zones`
--

CREATE TABLE `sensor_zones` (
  `id` int(11) NOT NULL,
  `sensor_code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sensor_zones`
--

INSERT INTO `sensor_zones` (`id`, `sensor_code`, `name`, `is_enabled`, `updated_at`) VALUES
(1, 'COOP1', 'Coop 1 - PIR Sensor', 1, '2026-08-16 10:21:57'),
(2, 'COOP2', 'Coop 2 - PIR Sensor', 1, '2026-08-05 11:48:15'),
(3, 'PERIMETER', 'Perimeter - PIR Sensor', 1, '2026-08-05 11:11:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `security_question` varchar(255) NOT NULL,
  `security_answer_hash` varchar(255) NOT NULL,
  `reset_token` varchar(64) DEFAULT NULL,
  `reset_token_expires` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `security_question`, `security_answer_hash`, `reset_token`, `reset_token_expires`, `created_at`) VALUES
(1, 'admin', 'admin@mbpsaas.local', '$2y$10$cC/hgLqbQ9JsD62OxNvgkuMpKec2skDkaKGLxoHRKTanwfle7GNYO', 'What is your favorite animal?', '$2y$10$Chxlhlhe5oATWGky5IkY4OHCiBTQfCvDfb1qyT8D4cDzm88ah1XIm', NULL, NULL, '2026-07-08 15:11:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `motion_events`
--
ALTER TABLE `motion_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sensor_zones`
--
ALTER TABLE `sensor_zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sensor_code` (`sensor_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `motion_events`
--
ALTER TABLE `motion_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sensor_zones`
--
ALTER TABLE `sensor_zones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
