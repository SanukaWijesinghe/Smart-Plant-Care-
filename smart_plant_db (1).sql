-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2025 at 04:39 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart_plant_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `alert`
--

CREATE TABLE `alert` (
  `alert_id` int(11) NOT NULL,
  `plant_id` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_resolved` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plant`
--

CREATE TABLE `plant` (
  `plant_id` int(11) NOT NULL,
  `plant_type_id` int(11) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plant`
--

INSERT INTO `plant` (`plant_id`, `plant_type_id`, `nickname`, `date_added`, `location`) VALUES
(1, 1, 'wandos', '2025-08-03', 'kottawa');

-- --------------------------------------------------------

--
-- Table structure for table `sensor_reading`
--

CREATE TABLE `sensor_reading` (
  `reading_id` int(11) NOT NULL,
  `sensor_id` int(11) DEFAULT NULL,
  `plant_id` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `value` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_log`
--

CREATE TABLE `system_log` (
  `log_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`) VALUES
(1, 'Admin', 'admin@example.com', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `watering_schedule`
--

CREATE TABLE `watering_schedule` (
  `schedule_id` int(11) NOT NULL,
  `plant_id` int(11) DEFAULT NULL,
  `start_time` varchar(50) DEFAULT NULL,
  `frequency` varchar(100) DEFAULT NULL,
  `manual_override` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alert`
--
ALTER TABLE `alert`
  ADD PRIMARY KEY (`alert_id`),
  ADD KEY `plant_id` (`plant_id`);

--
-- Indexes for table `plant`
--
ALTER TABLE `plant`
  ADD PRIMARY KEY (`plant_id`);

--
-- Indexes for table `sensor_reading`
--
ALTER TABLE `sensor_reading`
  ADD PRIMARY KEY (`reading_id`),
  ADD KEY `plant_id` (`plant_id`);

--
-- Indexes for table `system_log`
--
ALTER TABLE `system_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `watering_schedule`
--
ALTER TABLE `watering_schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `plant_id` (`plant_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alert`
--
ALTER TABLE `alert`
  MODIFY `alert_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plant`
--
ALTER TABLE `plant`
  MODIFY `plant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sensor_reading`
--
ALTER TABLE `sensor_reading`
  MODIFY `reading_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_log`
--
ALTER TABLE `system_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `watering_schedule`
--
ALTER TABLE `watering_schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alert`
--
ALTER TABLE `alert`
  ADD CONSTRAINT `alert_ibfk_1` FOREIGN KEY (`plant_id`) REFERENCES `plant` (`plant_id`);

--
-- Constraints for table `sensor_reading`
--
ALTER TABLE `sensor_reading`
  ADD CONSTRAINT `sensor_reading_ibfk_1` FOREIGN KEY (`plant_id`) REFERENCES `plant` (`plant_id`);

--
-- Constraints for table `system_log`
--
ALTER TABLE `system_log`
  ADD CONSTRAINT `system_log_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `watering_schedule`
--
ALTER TABLE `watering_schedule`
  ADD CONSTRAINT `watering_schedule_ibfk_1` FOREIGN KEY (`plant_id`) REFERENCES `plant` (`plant_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
