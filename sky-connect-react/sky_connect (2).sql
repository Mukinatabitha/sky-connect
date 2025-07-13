-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2025 at 10:35 PM
-- Server version: 8.0.40
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sky_connect`
--

-- --------------------------------------------------------

--
-- Table structure for table `airlines`
--

CREATE TABLE `airlines` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `iata_code` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `airlines`
--

INSERT INTO `airlines` (`id`, `name`, `iata_code`, `country`) VALUES
(1, 'Qatar Airways', 'QTR', 'Qatar'),
(2, 'Emirates Airlines', 'UAE', 'United Arab Emirates'),
(3, 'Singapore Airlines', 'SIA', 'Singapore');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int NOT NULL,
  `flight_id` int DEFAULT NULL,
  `booking_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `seat_number` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `passenger_count` int DEFAULT NULL,
  `payment_status` enum('PENDING','CONFIRMED','FAILED') COLLATE utf8mb4_general_ci DEFAULT 'PENDING',
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `flight_id`, `booking_date`, `seat_number`, `passenger_count`, `payment_status`, `user_id`) VALUES
(1, 1, '2025-07-05 14:19:37', '26A', 2, 'FAILED', 1),
(2, 2, '2025-06-28 14:19:37', '14D', 1, 'CONFIRMED', 1),
(3, 3, '2025-07-02 14:19:37', '30D', 2, 'CONFIRMED', 3),
(4, 4, '2025-06-27 14:19:37', '10A', 3, 'PENDING', 1),
(5, 5, '2025-06-29 14:19:37', '20F', 1, 'PENDING', 3),
(6, 6, '2025-06-29 14:19:37', '26C', 1, 'CONFIRMED', 2),
(7, 7, '2025-06-28 14:19:37', '10C', 3, 'PENDING', 1),
(8, 8, '2025-07-07 14:19:37', '24B', 3, 'CONFIRMED', 5),
(9, 9, '2025-06-28 14:19:37', '23C', 1, 'FAILED', 2),
(10, 10, '2025-07-07 14:19:37', '21E', 1, 'CONFIRMED', 4),
(11, 11, '2025-07-07 14:19:37', '15F', 3, 'PENDING', 1),
(12, 12, '2025-07-04 14:19:37', '30E', 2, 'CONFIRMED', 4),
(13, 13, '2025-06-30 14:19:37', '28D', 1, 'FAILED', 4),
(14, 14, '2025-07-06 14:19:37', '5C', 1, 'FAILED', 3),
(15, 15, '2025-06-28 14:19:37', '25E', 3, 'FAILED', 1),
(16, 16, '2025-06-30 14:19:37', '27A', 2, 'CONFIRMED', 5),
(17, 17, '2025-07-06 14:19:37', '26F', 2, 'FAILED', 5),
(18, 18, '2025-06-29 14:19:37', '28A', 2, 'FAILED', 4),
(19, 19, '2025-06-27 14:19:37', '25E', 1, 'CONFIRMED', 5),
(20, 20, '2025-07-02 14:19:37', '18F', 3, 'CONFIRMED', 5),
(21, 21, '2025-06-30 14:19:37', '5F', 1, 'PENDING', 5),
(22, 22, '2025-07-03 14:19:37', '1C', 2, 'PENDING', 3),
(23, 23, '2025-07-06 14:19:37', '18E', 3, 'FAILED', 2),
(24, 24, '2025-06-29 14:19:37', '22E', 1, 'FAILED', 3),
(25, 25, '2025-07-01 14:19:37', '23C', 3, 'CONFIRMED', 1),
(26, 26, '2025-06-29 14:19:37', '8D', 1, 'PENDING', 3),
(27, 27, '2025-06-30 14:19:37', '30B', 3, 'CONFIRMED', 1),
(28, 28, '2025-06-29 14:19:37', '5C', 2, 'CONFIRMED', 5),
(29, 29, '2025-06-29 14:19:37', '6B', 1, 'FAILED', 1),
(30, 30, '2025-07-04 14:19:37', '26F', 1, 'FAILED', 5),
(31, 31, '2025-06-27 14:19:37', '4E', 3, 'CONFIRMED', 2),
(32, 32, '2025-06-27 14:19:37', '23A', 3, 'FAILED', 2),
(33, 33, '2025-07-02 14:19:37', '26E', 1, 'PENDING', 3),
(34, 34, '2025-06-29 14:19:37', '13B', 1, 'PENDING', 2),
(35, 35, '2025-07-03 14:19:37', '8A', 3, 'PENDING', 2),
(36, 36, '2025-07-04 14:19:37', '8C', 3, 'CONFIRMED', 4),
(37, 37, '2025-07-01 14:19:37', '25B', 3, 'FAILED', 5),
(38, 38, '2025-06-27 14:19:37', '3E', 3, 'PENDING', 4),
(39, 39, '2025-06-29 14:19:37', '12F', 1, 'CONFIRMED', 4),
(40, 40, '2025-07-07 14:19:37', '9A', 3, 'FAILED', 1),
(41, 41, '2025-07-01 14:19:37', '21C', 2, 'CONFIRMED', 5),
(42, 42, '2025-07-02 14:19:37', '29F', 3, 'PENDING', 2),
(43, 43, '2025-06-27 14:19:37', '25A', 3, 'PENDING', 1),
(44, 44, '2025-06-30 14:19:37', '29E', 1, 'PENDING', 4),
(45, 45, '2025-06-28 14:19:37', '18D', 3, 'PENDING', 1),
(46, 46, '2025-07-05 14:19:37', '9D', 3, 'CONFIRMED', 3),
(47, 47, '2025-07-07 14:19:37', '18D', 3, 'PENDING', 2),
(48, 48, '2025-06-29 14:19:37', '13A', 1, 'PENDING', 5),
(49, 49, '2025-07-04 14:19:37', '25E', 3, 'CONFIRMED', 5),
(50, 50, '2025-07-03 14:19:37', '22C', 1, 'CONFIRMED', 3),
(51, 51, '2025-07-04 14:19:37', '10B', 1, 'PENDING', 3),
(52, 52, '2025-07-02 14:19:37', '24D', 2, 'CONFIRMED', 2),
(53, 53, '2025-06-28 14:19:37', '27C', 1, 'CONFIRMED', 5),
(54, 54, '2025-07-01 14:19:37', '22D', 3, 'CONFIRMED', 3),
(55, 55, '2025-07-07 14:19:37', '30C', 1, 'CONFIRMED', 5),
(56, 56, '2025-06-30 14:19:37', '13C', 2, 'PENDING', 1),
(57, 57, '2025-07-06 14:19:37', '25E', 3, 'FAILED', 2),
(58, 58, '2025-06-27 14:19:37', '29A', 3, 'CONFIRMED', 3),
(59, 59, '2025-07-01 14:19:37', '10B', 3, 'FAILED', 2),
(60, 60, '2025-07-01 14:19:37', '1C', 2, 'FAILED', 1),
(61, 61, '2025-07-01 14:19:37', '10F', 2, 'CONFIRMED', 5),
(62, 62, '2025-06-29 14:19:37', '5D', 3, 'PENDING', 1),
(63, 63, '2025-06-28 14:19:37', '23B', 2, 'CONFIRMED', 5),
(64, 64, '2025-07-02 14:19:37', '19F', 2, 'FAILED', 1),
(65, 65, '2025-07-02 14:19:37', '16A', 2, 'CONFIRMED', 3),
(66, 66, '2025-07-07 14:19:37', '1A', 3, 'CONFIRMED', 3),
(67, 67, '2025-07-04 14:19:37', '21F', 2, 'FAILED', 4),
(68, 68, '2025-07-01 14:19:37', '7A', 3, 'CONFIRMED', 2),
(69, 69, '2025-06-27 14:19:37', '26C', 3, 'PENDING', 1),
(70, 70, '2025-07-01 14:19:37', '29E', 2, 'FAILED', 4),
(71, 71, '2025-07-05 14:19:37', '30C', 2, 'CONFIRMED', 2),
(72, 72, '2025-06-27 14:19:37', '6F', 3, 'FAILED', 3),
(73, 73, '2025-06-28 14:19:37', '12D', 3, 'CONFIRMED', 4),
(74, 74, '2025-07-04 14:19:37', '5A', 3, 'CONFIRMED', 4),
(75, 75, '2025-07-05 14:19:37', '10C', 2, 'PENDING', 2),
(76, 76, '2025-07-03 14:19:37', '10D', 1, 'CONFIRMED', 1),
(77, 77, '2025-07-01 14:19:37', '26F', 2, 'FAILED', 3),
(78, 78, '2025-07-05 14:19:37', '15C', 3, 'CONFIRMED', 5),
(79, 79, '2025-07-02 14:19:37', '19A', 1, 'PENDING', 3),
(80, 80, '2025-06-30 14:19:37', '4E', 3, 'CONFIRMED', 4);

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `submitted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `message`, `submitted_at`) VALUES
(1, 'Nicole', 'abwoganatalie@gmail.com', 'Hello', '2025-07-08 10:09:03'),
(2, 'Nicole', 'abwoganatalie@gmail.com', 'Test', '2025-07-08 10:30:24'),
(3, 'Nicole', 'abwoganatalie@gmail.com', 'hellooo', '2025-07-08 10:30:40'),
(4, 'John Doe', 'abwoganatalie@gmail.com', 'How often are your prices updated?', '2025-07-08 10:35:14'),
(5, 'Carene', 'abwogacarene5@gmail.com', 'Can I book directly through your site, or do you redirect to third-party sellers?', '2025-07-08 10:38:06'),
(6, 'Phyllis Kuria', 'Kphy23@icloud.com', 'Hello, how fast does a refund take to be processed?', '2025-07-09 05:38:17'),
(7, 'Passwordtest', 'test@gmail.com', 'hi', '2025-07-13 18:18:58');

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `id` int NOT NULL,
  `flight_number` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `origin` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `destination` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `aircraft` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `business_seats` int DEFAULT NULL,
  `economy_seats` int DEFAULT NULL,
  `duration` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `airline` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price_business` decimal(10,2) DEFAULT NULL,
  `price_economy` decimal(10,2) DEFAULT NULL,
  `flight_type` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`id`, `flight_number`, `origin`, `destination`, `departure_time`, `arrival_time`, `aircraft`, `business_seats`, `economy_seats`, `duration`, `airline`, `price_business`, `price_economy`, `flight_type`) VALUES
(1, 'QTR1007', 'Dubai Int\'l', 'Hamad Int\'l', '11:56:00', '11:48:00', 'A359', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(2, 'QTR102', 'Geneva Cointrin Int\'l', 'Hamad Int\'l', '09:34:00', '16:16:00', 'A359', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(3, 'QTR1039', 'Sharjah Int\'l', 'Hamad Int\'l', '11:28:00', '11:12:00', 'A320', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(4, 'QTR109', 'Hamad Int\'l', 'London Heathrow', '09:28:00', '13:33:00', 'B77W', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(5, 'QTR1103', 'Bahrain Int\'l', 'Hamad Int\'l', '11:03:00', '11:45:00', 'A320', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(6, 'QTR1151', 'King Fahd Int\'l', 'Hamad Int\'l', '10:53:00', '11:27:00', 'A320', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(7, 'QTR116', 'Leonardo da Vinci Int\'l', 'Hamad Int\'l', '09:49:00', '15:49:00', 'A359', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(8, 'QTR1176', 'Hamad Int\'l', 'Prince Mohammad Bin Abdulaziz', '10:29:00', '12:30:00', 'A320', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(9, 'QTR1179', 'Prince Mohammad Bin Abdulaziz', 'Hamad Int\'l', '10:42:00', '12:45:00', 'A359', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(10, 'QTR1207', 'Ta\'if Regional', 'Hamad Int\'l', '10:51:00', '13:05:00', 'A320', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(11, 'QTR124', 'Malpensa Int\'l', 'Hamad Int\'l', '09:40:00', '16:11:00', 'A359', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(12, 'QTR125', 'Hamad Int\'l', 'Marco Polo Int\'l', '09:42:00', '13:35:00', 'B788', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(13, 'QTR127', 'Hamad Int\'l', 'Malpensa Int\'l', '09:38:00', '13:51:00', 'A359', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(14, 'QTR1303', 'Hamad Int\'l', 'Cairo Int\'l', '09:05:00', '12:03:00', 'B787', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(15, 'QTR131', 'Hamad Int\'l', 'Leonardo da Vinci Int\'l', '09:38:00', '14:03:00', 'A359', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(16, 'QTR1369', 'Hamad Int\'l', 'Cape Town Int\'l', '02:32:00', '10:56:00', 'A359', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(17, 'QTR1375', 'Maputo Int\'l', 'King Shaka Int\'l', '09:57:00', '10:44:00', 'A359', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(18, 'QTR1377', 'Hamad Int\'l', 'OR Tambo Int\'l', '08:59:00', '16:00:00', 'B789', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(19, 'QTR1379', 'Hamad Int\'l', 'Houari Boumedienne', '09:19:00', '13:07:00', 'A333', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(20, 'QTR138', 'Barcelona Int\'l', 'Hamad Int\'l', '09:23:00', '16:18:00', 'B738', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(21, 'QTR1383', 'Hamad Int\'l', 'Entebbe Int\'l', '10:16:00', '15:12:00', 'B788', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(22, 'QTR1395', 'Hamad Int\'l', 'Mohammed V Int\'l', '09:08:00', '13:50:00', 'A359', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(23, 'QTR1399', 'Hamad Int\'l', 'Tunis-Carthage Int\'l', '09:36:00', '12:58:00', 'B788', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(24, 'UAE1', 'Dubai Int\'l', 'London Heathrow', '08:14:00', '12:21:00', 'A388', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(25, 'UAE111', 'Dubai Int\'l', 'Budapest Ferenc Liszt International Airport', '10:49:00', '13:35:00', 'B77W', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(26, 'UAE123', 'Dubai Int\'l', 'Istanbul Airport', '11:10:00', '14:19:00', 'A388', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(27, 'UAE127', 'Dubai Int\'l', 'Vienna Int\'l', '09:27:00', '12:55:00', 'A388', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(28, 'UAE130', 'Domodedovo Int\'l', 'Dubai Int\'l', '08:46:00', '14:45:00', 'B773', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(29, 'UAE133', 'Dubai Int\'l', 'Domodedovo Int\'l', '09:59:00', '13:52:00', 'A388', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(30, 'UAE135', 'Dubai Int\'l', 'Marco Polo Int\'l', '09:22:00', '12:58:00', 'B77W', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(31, 'UAE139', 'Dubai Int\'l', 'Václav Havel Airport', '09:12:00', '12:42:00', 'A388', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(32, 'UAE141', 'Dubai Int\'l', 'Madrid-Barajas', '08:10:00', '13:27:00', 'A388', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(33, 'UAE147', 'Dubai Int\'l', 'Amsterdam Schiphol', '08:36:00', '13:14:00', 'A388', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(34, 'UAE15', 'Dubai Int\'l', 'London Gatwick', '08:37:00', '12:13:00', 'A388', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(35, 'UAE151', 'Dubai Int\'l', 'Copenhagen', '08:54:00', '12:53:00', 'B77W', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(36, 'UAE157', 'Dubai Int\'l', 'Stockholm-Arlanda', '09:07:00', '13:21:00', 'B77W', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(37, 'UAE159', 'Dubai Int\'l', 'Oslo', '07:52:00', '12:30:00', 'B77W', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(38, 'UAE161', 'Dubai Int\'l', 'Dublin Int\'l', '07:50:00', '12:03:00', 'B77W', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(39, 'UAE179', 'Dubai Int\'l', 'Warsaw Frederic Chopin', '08:42:00', '11:38:00', 'B77W', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(40, 'UAE183', 'Dubai Int\'l', 'Brussels', '08:34:00', '12:50:00', 'B77W', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(41, 'UAE185', 'Dubai Int\'l', 'Barcelona Int\'l', '08:43:00', '13:17:00', 'A388', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(42, 'UAE191', 'Dubai Int\'l', 'Lisbon', '07:45:00', '11:58:00', 'B77W', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(43, 'UAE201', 'Dubai Int\'l', 'John F Kennedy Intl', '08:54:00', '14:16:00', 'A388', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(44, 'UAE202', 'John F Kennedy Intl', 'Dubai Int\'l', '23:19:00', '19:26:00', 'A388', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(45, 'UAE203', 'Dubai Int\'l', 'John F Kennedy Intl', '03:08:00', '08:15:00', 'A388', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(46, 'UAE205', 'Dubai Int\'l', 'Malpensa Int\'l', '10:08:00', '13:40:00', 'A388', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(47, 'UAE206', 'John F Kennedy Intl', 'Malpensa Int\'l', '22:44:00', '11:44:00', 'A388', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(48, 'UAE209', 'Dubai Int\'l', 'Athens Int\'l', '11:09:00', '14:13:00', 'B77W', NULL, NULL, NULL, 'Emirates Airlines', NULL, NULL, NULL),
(49, 'SIA135', 'Penang Int\'l', 'Singapore Changi', '15:32:00', '16:35:00', 'B738', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(50, 'SIA147', 'Brunei Int\'l', 'Singapore Changi', '15:56:00', '17:54:00', 'B38M', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(51, 'SIA155', 'Phnom Penh Int\'l', 'Singapore Changi', '14:13:00', '17:09:00', 'B38M', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(52, 'SIA174', 'Singapore Changi', 'Da Nang Int\'l', '14:40:00', '15:50:00', 'B38M', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(53, 'SIA191', 'Noi Bai Int\'l', 'Singapore Changi', '12:51:00', '16:39:00', 'A359', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(54, 'SIA194', 'Singapore Changi', 'Noi Bai Int\'l', '15:36:00', '17:42:00', 'B38M', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(55, 'SIA204', 'Cairns Int\'l', 'Singapore Changi', '18:23:00', '22:30:00', 'A359', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(56, 'SIA21', 'Newark Liberty Int\'l', 'Singapore Changi', '10:28:00', '18:08:00', 'A359', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(57, 'SIA211', 'Singapore Changi', 'Sydney', '09:52:00', '18:29:00', 'B77W', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(58, 'SIA217', 'Singapore Changi', 'Melbourne Tullamarine', '11:21:00', '19:55:00', 'A359', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(59, 'SIA22', 'Singapore Changi', 'Newark Liberty Int\'l', '00:09:00', '06:06:00', 'A359', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(60, 'SIA222', 'Sydney', 'Singapore Changi', '15:11:00', '20:51:00', 'A388', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(61, 'SIA226', 'Perth Int\'l', 'Singapore Changi', '14:27:00', '18:59:00', 'A359', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(62, 'SIA228', 'Melbourne Tullamarine', 'Singapore Changi', '15:57:00', '20:36:00', 'B77W', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(63, 'SIA23', 'John F Kennedy Int\'l', 'Singapore Changi', '23:00:00', '05:16:00', 'A359', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(64, 'SIA232', 'Sydney', 'Singapore Changi', '11:13:00', '16:49:00', 'B77W', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(65, 'SIA236', 'Brisbane', 'Singapore Changi', '14:52:00', '20:31:00', 'A359', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(66, 'SIA24', 'Singapore Changi', 'John F Kennedy Int\'l', '12:29:00', '18:26:00', 'A359', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(67, 'SIA242', 'Sydney', 'Singapore Changi', '18:11:00', '23:55:00', 'A359', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(68, 'SIA245', 'Singapore Changi', 'Brisbane', '10:18:00', '18:40:00', 'A359', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(69, 'SIA25', 'John F Kennedy Intl', 'Frankfurt Int\'l', '21:42:00', '10:34:00', 'B77W', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(70, 'SIA26', 'Frankfurt Int\'l', 'John F Kennedy Intl', '08:52:00', '10:00:00', 'B77W', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(71, 'SIA27', 'Seattle-Tacoma Intl', 'Singapore Changi', '10:54:00', '17:42:00', 'A359', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(72, 'SIA286', 'Auckland', 'Singapore Changi', '14:21:00', '20:28:00', 'A359', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(73, 'SIA298', 'Christchurch Int\'l', 'Singapore Changi', '10:59:00', '17:13:00', 'A359', NULL, NULL, NULL, 'Singapore Airlines', NULL, NULL, NULL),
(74, 'QTR1405', 'Hamad Int\'l', 'Murtala Mohammed Int\'l', '07:58:00', '13:17:00', 'B788', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(75, 'QTR159', 'Hamad Int\'l', 'Copenhagen', '09:04:00', '13:59:00', 'B788', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(76, 'QTR17', 'Hamad Int\'l', 'Dublin Int\'l', '08:06:00', '12:38:00', 'B789', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(77, 'QTR29', 'Hamad Int\'l', 'Edinburgh', '09:15:00', '13:40:00', 'B788', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(78, 'QTR57', 'Hamad Int\'l', 'Munich Int\'l', '09:24:00', '13:27:00', 'B789', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(79, 'QTR67', 'Hamad Int\'l', 'Frankfurt Int\'l', '09:28:00', '13:49:00', 'B789', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(80, 'QTR1335', 'Hamad Int\'l', 'Jomo Kenyatta Int\'l', '08:55:00', '13:30:00', 'B788', NULL, NULL, NULL, 'Qatar Airways', NULL, NULL, NULL),
(81, 'KQ101', 'Nairobi', 'New York', '08:00:00', '18:00:00', 'Boeing 787', 10, 150, '16h 0m', 'Kenya Airways', 1400.00, 750.00, 'direct'),
(82, 'DL202', 'Nairobi', 'New York', '09:30:00', '23:50:00', 'Airbus A350', 12, 160, '18h 20m', 'Delta Airlines', 1600.00, 800.00, 'layover'),
(83, 'EM303', 'Nairobi', 'New York', '07:00:00', '21:00:00', 'Boeing 777', 15, 180, '20h 0m', 'Emirates', 1800.00, 850.00, 'layover'),
(84, 'QR404', 'Nairobi', 'New York', '02:00:00', '16:30:00', 'Airbus A350', 10, 140, '18h 30m', 'Qatar Airways', 1700.00, 820.00, 'layover'),
(85, 'BA505', 'Nairobi', 'New York', '13:45:00', '03:00:00', 'Boeing 777', 8, 130, '19h 15m', 'British Airways', 1500.00, 780.00, 'layover'),
(86, 'AF606', 'Nairobi', 'New York', '10:20:00', '23:10:00', 'Boeing 787', 12, 160, '18h 50m', 'Air France', 1650.00, 810.00, 'layover'),
(87, 'LH707', 'Nairobi', 'New York', '11:15:00', '22:40:00', 'Airbus A340', 10, 145, '17h 25m', 'Lufthansa', 1550.00, 770.00, 'layover'),
(88, 'TK808', 'Nairobi', 'New York', '00:30:00', '15:10:00', 'Airbus A330', 14, 155, '20h 40m', 'Turkish Airlines', 1750.00, 790.00, 'layover'),
(89, 'ET909', 'Nairobi', 'New York', '06:45:00', '20:30:00', 'Boeing 787', 11, 170, '19h 45m', 'Ethiopian Airlines', 1450.00, 740.00, 'layover'),
(90, 'SN010', 'Nairobi', 'New York', '03:15:00', '19:10:00', 'Airbus A330', 9, 135, '19h 55m', 'Brussels Airlines', 1480.00, 730.00, 'layover'),
(91, 'KL111', 'Nairobi', 'New York', '12:00:00', '23:00:00', 'Boeing 777', 10, 150, '17h 0m', 'KLM', 1580.00, 790.00, 'layover'),
(92, 'SA212', 'Nairobi', 'New York', '05:50:00', '20:20:00', 'Airbus A350', 11, 140, '20h 30m', 'South African Airways', 1520.00, 770.00, 'layover'),
(93, 'AA313', 'Nairobi', 'New York', '09:00:00', '22:10:00', 'Boeing 777', 12, 160, '17h 10m', 'American Airlines', 1590.00, 800.00, 'layover'),
(94, 'UA414', 'Nairobi', 'New York', '15:00:00', '04:00:00', 'Boeing 787', 14, 170, '19h 0m', 'United Airlines', 1620.00, 780.00, 'layover'),
(95, 'IB515', 'Nairobi', 'New York', '01:30:00', '16:20:00', 'Airbus A330', 10, 150, '20h 50m', 'Iberia', 1500.00, 720.00, 'layover');

-- --------------------------------------------------------

--
-- Table structure for table `layovers`
--

CREATE TABLE `layovers` (
  `id` int NOT NULL,
  `flight_id` int DEFAULT NULL,
  `layover_airport` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `layover_duration` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `connects_to_flight` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `layovers`
--

INSERT INTO `layovers` (`id`, `flight_id`, `layover_airport`, `layover_duration`, `connects_to_flight`) VALUES
(1, 8, 'Prince Mohammad Bin Abdulaziz', '15m', 'QTR1179'),
(2, 9, 'Hamad Int\'l', '3h 15m', 'QTR1377'),
(3, 74, 'Murtala Mohammed Int\'l', '2h', 'QTR1408'),
(4, 75, 'Copenhagen', '1h 19m', 'QTR162'),
(5, 76, 'Dublin', '2h', 'QTR20'),
(6, 77, 'Edinburgh', '45m', 'QTR32'),
(7, 78, 'Munich Int\'l', '3h', 'QTR60'),
(8, 79, 'Frankfurt Int\'l', '2.5h', 'QTR70'),
(9, 8, 'MED / OEMA', '15m', 'QTR1179'),
(10, 80, 'Jomo Kenyatta Int\'l', '1.5h', 'QTR1336'),
(11, 56, 'Singapore Changi', '2h', 'SIA211'),
(12, 57, 'Sydney (SYD)', '1h 30m', 'SIA222'),
(13, 59, 'Newark Liberty', '1h 45m', 'SIA23'),
(14, 61, 'Singapore Changi', '2h 15m', 'SIA245'),
(15, 68, 'Brisbane', '3h', 'SIA236'),
(16, 58, 'Melbourne', '1h 10m', 'SIA228'),
(17, 69, 'Frankfurt Int\'l', '1h 30m', 'SIA26'),
(18, 72, 'Singapore Changi', '1h 45m', 'SIA298'),
(19, 73, 'Christchurch Int\'l', '2h', 'SIA204'),
(20, 55, 'Singapore Changi', '2h 20m', 'SIA194');

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `id` int NOT NULL,
  `booking_id` int DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `passport_number` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`id`, `booking_id`, `name`, `email`, `passport_number`) VALUES
(1, 1, 'David Njeri', 'david.njeri@mail.com', 'KZ333479'),
(2, 1, 'Ivy Omondi', 'ivy.omondi@test.org', 'KZ850944'),
(3, 2, 'David Otieno', 'david.otieno@mail.com', 'KZ598902'),
(4, 2, 'Frank Kiptoo', 'frank.kiptoo@example.com', 'KZ345843'),
(5, 3, 'Alice Kamau', 'alice.kamau@test.org', 'KZ693572'),
(6, 3, 'Henry Mutua', 'henry.mutua@example.com', 'KZ956174'),
(7, 3, 'Brian Njeri', 'brian.njeri@test.org', 'KZ793487'),
(8, 4, 'Grace Mutua', 'grace.mutua@example.com', 'KZ257279'),
(9, 4, 'Alice Otieno', 'alice.otieno@test.org', 'KZ540520'),
(10, 4, 'Cynthia Njeri', 'cynthia.njeri@test.org', 'KZ363413'),
(11, 5, 'Henry Omondi', 'henry.omondi@example.com', 'KZ204398'),
(12, 6, 'Henry Mutua', 'henry.mutua@example.com', 'KZ165163'),
(13, 7, 'Grace Kariuki', 'grace.kariuki@test.org', 'KZ785380'),
(14, 7, 'Frank Kiptoo', 'frank.kiptoo@mail.com', 'KZ908196'),
(15, 8, 'Frank Chebet', 'frank.chebet@example.com', 'KZ793759'),
(16, 9, 'Grace Chebet', 'grace.chebet@example.com', 'KZ228099'),
(17, 9, 'Alice Mwangi', 'alice.mwangi@test.org', 'KZ788153'),
(18, 9, 'Ivy Njeri', 'ivy.njeri@mail.com', 'KZ368202'),
(19, 10, 'Esther Otieno', 'esther.otieno@test.org', 'KZ698560'),
(20, 10, 'David Otieno', 'david.otieno@example.com', 'KZ991600'),
(21, 11, 'Esther Chebet', 'esther.chebet@example.com', 'KZ355464'),
(22, 11, 'Henry Omondi', 'henry.omondi@example.com', 'KZ428772'),
(23, 11, 'Frank Omondi', 'frank.omondi@mail.com', 'KZ318934'),
(24, 12, 'Frank Mwangi', 'frank.mwangi@mail.com', 'KZ466081'),
(25, 13, 'Henry Chebet', 'henry.chebet@example.com', 'KZ138717'),
(26, 14, 'Grace Kiptoo', 'grace.kiptoo@example.com', 'KZ810801'),
(27, 14, 'James Otieno', 'james.otieno@test.org', 'KZ240206'),
(28, 15, 'Frank Njeri', 'frank.njeri@example.com', 'KZ843767'),
(29, 15, 'Ivy Kamau', 'ivy.kamau@example.com', 'KZ154382'),
(30, 16, 'Esther Kiptoo', 'esther.kiptoo@example.com', 'KZ580936'),
(31, 16, 'James Otieno', 'james.otieno@mail.com', 'KZ301804'),
(32, 17, 'Cynthia Kamau', 'cynthia.kamau@test.org', 'KZ904169'),
(33, 17, 'Alice Otieno', 'alice.otieno@test.org', 'KZ803367'),
(34, 18, 'Brian Kariuki', 'brian.kariuki@example.com', 'KZ486794'),
(35, 19, 'James Otieno', 'james.otieno@test.org', 'KZ771653'),
(36, 19, 'Cynthia Kamau', 'cynthia.kamau@example.com', 'KZ593832'),
(37, 19, 'Alice Kiptoo', 'alice.kiptoo@example.com', 'KZ834682'),
(38, 20, 'Grace Wambua', 'grace.wambua@mail.com', 'KZ778825'),
(39, 21, 'David Chebet', 'david.chebet@example.com', 'KZ872373'),
(40, 22, 'Brian Otieno', 'brian.otieno@mail.com', 'KZ761943'),
(41, 23, 'David Mutua', 'david.mutua@example.com', 'KZ789143'),
(42, 23, 'Ivy Njeri', 'ivy.njeri@test.org', 'KZ585238'),
(43, 23, 'Cynthia Wambua', 'cynthia.wambua@test.org', 'KZ103430'),
(44, 24, 'Frank Kamau', 'frank.kamau@example.com', 'KZ765477'),
(45, 24, 'David Mwangi', 'david.mwangi@test.org', 'KZ630293'),
(46, 25, 'Brian Kamau', 'brian.kamau@test.org', 'KZ564514'),
(47, 26, 'Brian Otieno', 'brian.otieno@mail.com', 'KZ897614'),
(48, 26, 'Frank Wambua', 'frank.wambua@mail.com', 'KZ933586'),
(49, 27, 'Ivy Omondi', 'ivy.omondi@test.org', 'KZ496809'),
(50, 27, 'Frank Mutua', 'frank.mutua@test.org', 'KZ201392'),
(51, 28, 'Brian Kiptoo', 'brian.kiptoo@test.org', 'KZ802564'),
(52, 28, 'Grace Otieno', 'grace.otieno@mail.com', 'KZ992010'),
(53, 28, 'James Otieno', 'james.otieno@test.org', 'KZ589187'),
(54, 29, 'Frank Njeri', 'frank.njeri@mail.com', 'KZ984821'),
(55, 29, 'Frank Otieno', 'frank.otieno@test.org', 'KZ626262'),
(56, 30, 'James Wambua', 'james.wambua@mail.com', 'KZ757753'),
(57, 30, 'Cynthia Otieno', 'cynthia.otieno@test.org', 'KZ285819'),
(58, 30, 'Cynthia Chebet', 'cynthia.chebet@test.org', 'KZ705512'),
(59, 31, 'Ivy Omondi', 'ivy.omondi@example.com', 'KZ626454'),
(60, 31, 'David Otieno', 'david.otieno@test.org', 'KZ294753'),
(61, 32, 'James Mwangi', 'james.mwangi@example.com', 'KZ524139'),
(62, 33, 'Frank Otieno', 'frank.otieno@mail.com', 'KZ960802'),
(63, 34, 'Esther Kamau', 'esther.kamau@test.org', 'KZ423583'),
(64, 35, 'James Kiptoo', 'james.kiptoo@test.org', 'KZ450038'),
(65, 36, 'Cynthia Mwangi', 'cynthia.mwangi@test.org', 'KZ397538'),
(66, 36, 'Cynthia Chebet', 'cynthia.chebet@mail.com', 'KZ821366'),
(67, 37, 'Grace Chebet', 'grace.chebet@example.com', 'KZ993426'),
(68, 38, 'Henry Kiptoo', 'henry.kiptoo@mail.com', 'KZ449410'),
(69, 39, 'Ivy Otieno', 'ivy.otieno@example.com', 'KZ840045'),
(70, 40, 'Esther Chebet', 'esther.chebet@example.com', 'KZ614698'),
(71, 40, 'Frank Omondi', 'frank.omondi@mail.com', 'KZ807455'),
(72, 41, 'Brian Kiptoo', 'brian.kiptoo@test.org', 'KZ937733'),
(73, 41, 'David Wambua', 'david.wambua@example.com', 'KZ857149'),
(74, 41, 'Frank Chebet', 'frank.chebet@test.org', 'KZ896308'),
(75, 42, 'Brian Kamau', 'brian.kamau@mail.com', 'KZ119451'),
(76, 42, 'Cynthia Kariuki', 'cynthia.kariuki@test.org', 'KZ323377'),
(77, 43, 'Frank Omondi', 'frank.omondi@mail.com', 'KZ288968'),
(78, 43, 'Henry Kiptoo', 'henry.kiptoo@test.org', 'KZ793393'),
(79, 43, 'Henry Chebet', 'henry.chebet@example.com', 'KZ582831'),
(80, 44, 'James Kamau', 'james.kamau@test.org', 'KZ489203'),
(81, 45, 'Cynthia Mutua', 'cynthia.mutua@mail.com', 'KZ928348'),
(82, 45, 'Ivy Kamau', 'ivy.kamau@mail.com', 'KZ183604'),
(83, 45, 'Henry Njeri', 'henry.njeri@mail.com', 'KZ428150'),
(84, 46, 'Alice Mwangi', 'alice.mwangi@test.org', 'KZ817164'),
(85, 47, 'Ivy Otieno', 'ivy.otieno@example.com', 'KZ238864'),
(86, 48, 'James Kamau', 'james.kamau@test.org', 'KZ577843'),
(87, 48, 'Frank Kiptoo', 'frank.kiptoo@mail.com', 'KZ894492'),
(88, 49, 'Brian Mwangi', 'brian.mwangi@example.com', 'KZ403264'),
(89, 49, 'Henry Mwangi', 'henry.mwangi@test.org', 'KZ955264'),
(90, 50, 'Brian Kiptoo', 'brian.kiptoo@mail.com', 'KZ919108'),
(91, 50, 'Ivy Kariuki', 'ivy.kariuki@example.com', 'KZ169479'),
(92, 51, 'Ivy Mwangi', 'ivy.mwangi@example.com', 'KZ125191'),
(93, 51, 'Grace Mwangi', 'grace.mwangi@mail.com', 'KZ514002'),
(94, 51, 'Alice Otieno', 'alice.otieno@example.com', 'KZ215299'),
(95, 52, 'Alice Kiptoo', 'alice.kiptoo@mail.com', 'KZ454014'),
(96, 53, 'Frank Mwangi', 'frank.mwangi@mail.com', 'KZ999215'),
(97, 53, 'Alice Otieno', 'alice.otieno@example.com', 'KZ531328'),
(98, 53, 'Frank Kiptoo', 'frank.kiptoo@example.com', 'KZ673513'),
(99, 54, 'James Kamau', 'james.kamau@test.org', 'KZ472724'),
(100, 55, 'Brian Wambua', 'brian.wambua@example.com', 'KZ808903'),
(101, 55, 'James Wambua', 'james.wambua@mail.com', 'KZ814591'),
(102, 56, 'Alice Otieno', 'alice.otieno@mail.com', 'KZ722432'),
(103, 56, 'James Kariuki', 'james.kariuki@test.org', 'KZ661227'),
(104, 56, 'James Kamau', 'james.kamau@mail.com', 'KZ552478'),
(105, 57, 'Ivy Omondi', 'ivy.omondi@example.com', 'KZ114844'),
(106, 57, 'Brian Mutua', 'brian.mutua@example.com', 'KZ906511'),
(107, 57, 'Alice Kariuki', 'alice.kariuki@mail.com', 'KZ194572'),
(108, 58, 'Frank Chebet', 'frank.chebet@example.com', 'KZ572407'),
(109, 58, 'Grace Kiptoo', 'grace.kiptoo@mail.com', 'KZ984930'),
(110, 58, 'Ivy Njeri', 'ivy.njeri@example.com', 'KZ430309'),
(111, 59, 'Alice Mwangi', 'alice.mwangi@test.org', 'KZ734301'),
(112, 59, 'Ivy Kariuki', 'ivy.kariuki@example.com', 'KZ956138'),
(113, 59, 'Esther Omondi', 'esther.omondi@test.org', 'KZ886891'),
(114, 60, 'Alice Chebet', 'alice.chebet@example.com', 'KZ434389'),
(115, 61, 'Grace Otieno', 'grace.otieno@mail.com', 'KZ534061'),
(116, 61, 'Brian Mutua', 'brian.mutua@mail.com', 'KZ803046'),
(117, 61, 'Brian Omondi', 'brian.omondi@mail.com', 'KZ310844'),
(118, 62, 'Ivy Wambua', 'ivy.wambua@example.com', 'KZ978920'),
(119, 63, 'Alice Omondi', 'alice.omondi@example.com', 'KZ653308'),
(120, 63, 'Grace Mwangi', 'grace.mwangi@test.org', 'KZ834469'),
(121, 63, 'Frank Otieno', 'frank.otieno@test.org', 'KZ555507'),
(122, 64, 'Henry Otieno', 'henry.otieno@test.org', 'KZ685658'),
(123, 65, 'Alice Mutua', 'alice.mutua@mail.com', 'KZ153432'),
(124, 66, 'Henry Chebet', 'henry.chebet@mail.com', 'KZ777663'),
(125, 66, 'Henry Kiptoo', 'henry.kiptoo@example.com', 'KZ295711'),
(126, 66, 'James Kamau', 'james.kamau@example.com', 'KZ385833'),
(127, 67, 'Esther Omondi', 'esther.omondi@mail.com', 'KZ725998'),
(128, 67, 'Alice Otieno', 'alice.otieno@mail.com', 'KZ390772'),
(129, 68, 'David Otieno', 'david.otieno@test.org', 'KZ982464'),
(130, 69, 'Esther Otieno', 'esther.otieno@test.org', 'KZ705106'),
(131, 70, 'David Njeri', 'david.njeri@example.com', 'KZ787101'),
(132, 70, 'Henry Omondi', 'henry.omondi@test.org', 'KZ486401'),
(133, 71, 'Frank Mutua', 'frank.mutua@mail.com', 'KZ721534'),
(134, 71, 'Henry Chebet', 'henry.chebet@mail.com', 'KZ382967'),
(135, 72, 'Brian Mwangi', 'brian.mwangi@mail.com', 'KZ979338'),
(136, 72, 'Esther Chebet', 'esther.chebet@mail.com', 'KZ935031'),
(137, 73, 'Ivy Chebet', 'ivy.chebet@mail.com', 'KZ446228'),
(138, 73, 'Alice Njeri', 'alice.njeri@example.com', 'KZ624711'),
(139, 74, 'Henry Kariuki', 'henry.kariuki@test.org', 'KZ682865'),
(140, 74, 'Grace Kiptoo', 'grace.kiptoo@example.com', 'KZ212191'),
(141, 75, 'Cynthia Kariuki', 'cynthia.kariuki@mail.com', 'KZ174534'),
(142, 75, 'Cynthia Omondi', 'cynthia.omondi@test.org', 'KZ543515'),
(143, 76, 'Esther Njeri', 'esther.njeri@example.com', 'KZ488242'),
(144, 77, 'James Mwangi', 'james.mwangi@mail.com', 'KZ951796'),
(145, 77, 'Esther Mutua', 'esther.mutua@mail.com', 'KZ370055'),
(146, 78, 'Ivy Omondi', 'ivy.omondi@test.org', 'KZ704126'),
(147, 78, 'Esther Njeri', 'esther.njeri@example.com', 'KZ485624'),
(148, 79, 'James Mutua', 'james.mutua@mail.com', 'KZ770165'),
(149, 79, 'Ivy Wambua', 'ivy.wambua@test.org', 'KZ529288'),
(150, 80, 'Ivy Mwangi', 'ivy.mwangi@mail.com', 'KZ373584');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int NOT NULL,
  `booking_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transaction_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('SUCCESS','FAILED','REFUNDED') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `booking_id`, `amount`, `payment_method`, `transaction_id`, `status`, `timestamp`) VALUES
(1, 1, 210.02, 'Mastercard', 'TXN5336', 'SUCCESS', '2025-07-07 18:01:16'),
(2, 2, 194.49, 'Visa', 'TXN9992', 'REFUNDED', '2025-07-07 18:01:16'),
(3, 3, 477.12, 'Visa', 'TXN8841', 'FAILED', '2025-07-07 18:01:16'),
(4, 4, 384.10, 'Mastercard', 'TXN9356', 'FAILED', '2025-07-07 18:01:16'),
(5, 5, 466.59, 'Mastercard', 'TXN6575', 'FAILED', '2025-07-07 18:01:16'),
(6, 6, 395.49, 'Mastercard', 'TXN4688', 'SUCCESS', '2025-07-07 18:01:16'),
(7, 7, 469.61, 'Mastercard', 'TXN8219', 'SUCCESS', '2025-07-07 18:01:16'),
(8, 8, 326.45, 'Visa', 'TXN6632', 'FAILED', '2025-07-07 18:01:16'),
(9, 9, 257.55, 'Visa', 'TXN4766', 'SUCCESS', '2025-07-07 18:01:16'),
(10, 10, 281.40, 'Visa', 'TXN6058', 'REFUNDED', '2025-07-07 18:01:16'),
(11, 11, 484.72, 'Mastercard', 'TXN3312', 'FAILED', '2025-07-07 18:01:16'),
(12, 12, 462.47, 'Mobile Money', 'TXN9882', 'SUCCESS', '2025-07-07 18:01:16'),
(13, 13, 422.89, 'Visa', 'TXN4035', 'REFUNDED', '2025-07-07 18:01:16'),
(14, 14, 360.78, 'Mobile Money', 'TXN7696', 'REFUNDED', '2025-07-07 18:01:16'),
(15, 15, 378.85, 'Visa', 'TXN2379', 'REFUNDED', '2025-07-07 18:01:16'),
(16, 16, 249.75, 'Mobile Money', 'TXN1749', 'FAILED', '2025-07-07 18:01:16'),
(17, 17, 185.98, 'Visa', 'TXN1884', 'REFUNDED', '2025-07-07 18:01:16'),
(18, 18, 121.63, 'Mobile Money', 'TXN9847', 'SUCCESS', '2025-07-07 18:01:16'),
(19, 19, 458.74, 'Mastercard', 'TXN2562', 'FAILED', '2025-07-07 18:01:16'),
(20, 20, 465.03, 'Mastercard', 'TXN3740', 'SUCCESS', '2025-07-07 18:01:16'),
(21, 21, 244.11, 'Visa', 'TXN4312', 'FAILED', '2025-07-07 18:01:16'),
(22, 22, 221.30, 'Mobile Money', 'TXN8397', 'FAILED', '2025-07-07 18:01:16'),
(23, 23, 468.21, 'Mobile Money', 'TXN9448', 'SUCCESS', '2025-07-07 18:01:16'),
(24, 24, 282.44, 'Visa', 'TXN9449', 'SUCCESS', '2025-07-07 18:01:16'),
(25, 25, 229.04, 'Visa', 'TXN8472', 'SUCCESS', '2025-07-07 18:01:16'),
(26, 26, 288.77, 'Visa', 'TXN8952', 'FAILED', '2025-07-07 18:01:16'),
(27, 27, 191.82, 'Mastercard', 'TXN9355', 'FAILED', '2025-07-07 18:01:16'),
(28, 28, 392.94, 'Mobile Money', 'TXN4689', 'SUCCESS', '2025-07-07 18:01:16'),
(29, 29, 136.22, 'Mastercard', 'TXN6717', 'FAILED', '2025-07-07 18:01:16'),
(30, 30, 172.59, 'Mobile Money', 'TXN4424', 'FAILED', '2025-07-07 18:01:16'),
(31, 31, 242.48, 'Mobile Money', 'TXN5806', 'SUCCESS', '2025-07-07 18:01:16'),
(32, 32, 113.27, 'Mastercard', 'TXN6928', 'FAILED', '2025-07-07 18:01:16'),
(33, 33, 388.90, 'Visa', 'TXN2238', 'SUCCESS', '2025-07-07 18:01:16'),
(34, 34, 444.13, 'Mastercard', 'TXN9857', 'SUCCESS', '2025-07-07 18:01:16'),
(35, 35, 127.18, 'Mastercard', 'TXN4253', 'SUCCESS', '2025-07-07 18:01:16'),
(36, 36, 120.80, 'Visa', 'TXN2497', 'FAILED', '2025-07-07 18:01:16'),
(37, 37, 360.31, 'Mastercard', 'TXN3598', 'FAILED', '2025-07-07 18:01:16'),
(38, 38, 460.64, 'Mobile Money', 'TXN1346', 'FAILED', '2025-07-07 18:01:16'),
(39, 39, 271.48, 'Mobile Money', 'TXN6289', 'SUCCESS', '2025-07-07 18:01:16'),
(40, 40, 476.46, 'Visa', 'TXN7185', 'SUCCESS', '2025-07-07 18:01:16'),
(41, 41, 154.25, 'Mastercard', 'TXN5038', 'SUCCESS', '2025-07-07 18:01:16'),
(42, 42, 145.42, 'Mastercard', 'TXN8345', 'SUCCESS', '2025-07-07 18:01:16'),
(43, 43, 285.83, 'Mobile Money', 'TXN4714', 'SUCCESS', '2025-07-07 18:01:16'),
(44, 44, 324.65, 'Mastercard', 'TXN7565', 'REFUNDED', '2025-07-07 18:01:16'),
(45, 45, 370.51, 'Mobile Money', 'TXN3789', 'REFUNDED', '2025-07-07 18:01:16'),
(46, 46, 332.84, 'Mastercard', 'TXN4302', 'SUCCESS', '2025-07-07 18:01:16'),
(47, 47, 374.61, 'Mobile Money', 'TXN9401', 'SUCCESS', '2025-07-07 18:01:16'),
(48, 48, 303.25, 'Visa', 'TXN3324', 'FAILED', '2025-07-07 18:01:16'),
(49, 49, 123.55, 'Mobile Money', 'TXN7310', 'SUCCESS', '2025-07-07 18:01:16'),
(50, 50, 368.48, 'Mastercard', 'TXN9721', 'SUCCESS', '2025-07-07 18:01:16'),
(51, 51, 445.97, 'Mobile Money', 'TXN4457', 'REFUNDED', '2025-07-07 18:01:16'),
(52, 52, 454.35, 'Mobile Money', 'TXN9455', 'FAILED', '2025-07-07 18:01:16'),
(53, 53, 471.32, 'Visa', 'TXN9225', 'FAILED', '2025-07-07 18:01:16'),
(54, 54, 398.30, 'Mobile Money', 'TXN8174', 'FAILED', '2025-07-07 18:01:16'),
(55, 55, 408.28, 'Mobile Money', 'TXN8603', 'SUCCESS', '2025-07-07 18:01:16'),
(56, 56, 243.38, 'Mastercard', 'TXN9543', 'SUCCESS', '2025-07-07 18:01:16'),
(57, 57, 244.69, 'Visa', 'TXN9410', 'SUCCESS', '2025-07-07 18:01:16'),
(58, 58, 333.66, 'Mastercard', 'TXN8424', 'FAILED', '2025-07-07 18:01:16'),
(59, 59, 352.08, 'Visa', 'TXN6338', 'FAILED', '2025-07-07 18:01:16'),
(60, 60, 325.96, 'Mastercard', 'TXN5310', 'SUCCESS', '2025-07-07 18:01:16'),
(61, 61, 229.26, 'Mastercard', 'TXN2697', 'REFUNDED', '2025-07-07 18:01:16'),
(62, 62, 138.00, 'Mobile Money', 'TXN2518', 'REFUNDED', '2025-07-07 18:01:16'),
(63, 63, 306.03, 'Mastercard', 'TXN2075', 'SUCCESS', '2025-07-07 18:01:16'),
(64, 64, 203.34, 'Mastercard', 'TXN6877', 'SUCCESS', '2025-07-07 18:01:16'),
(65, 65, 413.97, 'Visa', 'TXN7165', 'FAILED', '2025-07-07 18:01:16'),
(66, 66, 218.88, 'Mastercard', 'TXN2319', 'FAILED', '2025-07-07 18:01:16'),
(67, 67, 288.13, 'Mastercard', 'TXN2261', 'REFUNDED', '2025-07-07 18:01:16'),
(68, 68, 389.36, 'Visa', 'TXN8598', 'REFUNDED', '2025-07-07 18:01:16'),
(69, 69, 452.27, 'Mastercard', 'TXN3133', 'SUCCESS', '2025-07-07 18:01:16'),
(70, 70, 240.48, 'Visa', 'TXN4476', 'FAILED', '2025-07-07 18:01:16'),
(71, 71, 247.77, 'Visa', 'TXN5048', 'FAILED', '2025-07-07 18:01:16'),
(72, 72, 321.52, 'Visa', 'TXN8430', 'SUCCESS', '2025-07-07 18:01:16'),
(73, 73, 485.70, 'Visa', 'TXN8535', 'REFUNDED', '2025-07-07 18:01:16'),
(74, 74, 234.03, 'Visa', 'TXN6012', 'SUCCESS', '2025-07-07 18:01:16'),
(75, 75, 331.42, 'Mobile Money', 'TXN1126', 'REFUNDED', '2025-07-07 18:01:16'),
(76, 76, 394.93, 'Mastercard', 'TXN5772', 'REFUNDED', '2025-07-07 18:01:16'),
(77, 77, 155.07, 'Visa', 'TXN3301', 'SUCCESS', '2025-07-07 18:01:16'),
(78, 78, 120.50, 'Mobile Money', 'TXN6465', 'FAILED', '2025-07-07 18:01:16'),
(79, 79, 358.83, 'Mobile Money', 'TXN4470', 'REFUNDED', '2025-07-07 18:01:16'),
(80, 80, 367.80, 'Mobile Money', 'TXN8615', 'REFUNDED', '2025-07-07 18:01:16');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `id` int NOT NULL,
  `flight_id` int DEFAULT NULL,
  `seat_number` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `class` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` enum('user','admin') COLLATE utf8mb4_general_ci DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password_hash`, `role`) VALUES
(1, 'Admin User', 'admin@airline.com', '0b14d501a594442a01c6859541bcb3e8164d183d32937b851835442f69d5c94e', 'admin'),
(2, 'John Doe', 'john@example.com', '6cf615d5bcaac778352a8f1f3360d23f02f34ec182e259897fd6ce485d7870d4', 'user'),
(3, 'Jane Smith', 'jane@example.com', '5906ac361a137e2d286465cd6588ebb5ac3f5ae955001100bc41577c3d751764', 'user'),
(4, 'Grace Njeri', 'grace@example.com', 'b97873a40f73abedd8d685a7cd5e5f85e4a9cfb83eac26886640a0813850122b', 'user'),
(5, 'Brian Kiptoo', 'brian@example.com', '8b2c86ea9cf2ea4eb517fd1e06b74f399e7fec0fef92e3b482a6cf2e2b092023', 'user'),
(6, 'Emmanuel Kimathi', 'EmmanuelKimathi254@gmail.com', '$2y$10$ECiGBQQ2u8Dc5wV.UqiE9u4Ps1SI8pU1LT5ZXMELRwCJmhi7lvOaa', 'user'),
(7, 'Justus Kamau', 'Kamau.J@gmail.com', '$2y$10$XPq3ISe8XdSCKFWxT5OJ7.nK.3KsjwuNlFxNtKcrim0yqG08UOkKO', 'user'),
(8, 'David Kinyua', 'david.kinyua@gmail.com', '$2y$10$VMvcE/XnGVGeF210irlC8eT5Mp988qucWRhWoo00KcYVvDpvGHmtq', 'user'),
(9, 'Tabby', 'mukinatabitha@gmail.com', '$2y$10$.r7VO.9q48Y6d18b9fZ1Y.dUEsqtbm8RNuGEqXm9ATPdrkPLui3Wy', 'user'),
(10, 'User Test', 'test@gmail.com', '$2y$10$QQiJFqp3oKVwLlF0tpp3MuzGYN9VfDotQP1MNgoNYEUfPshM57COS', 'user'),
(11, 'SignOuttest', 'outtest@gmail.com', '$2y$10$eqFsoBbRzxrEnmViQhavOuS6hDkNdD0cgms6Za91cJwSvXLjby6w6', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airlines`
--
ALTER TABLE `airlines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flight_id` (`flight_id`),
  ADD KEY `fk_user_booking` (`user_id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layovers`
--
ALTER TABLE `layovers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flight_id` (`flight_id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flight_id` (`flight_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airlines`
--
ALTER TABLE `airlines`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `flights`
--
ALTER TABLE `flights`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `layovers`
--
ALTER TABLE `layovers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `passengers`
--
ALTER TABLE `passengers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`id`),
  ADD CONSTRAINT `fk_user_booking` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `layovers`
--
ALTER TABLE `layovers`
  ADD CONSTRAINT `layovers_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`id`);

--
-- Constraints for table `passengers`
--
ALTER TABLE `passengers`
  ADD CONSTRAINT `passengers_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`);

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
