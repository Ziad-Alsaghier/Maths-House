-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2024 at 11:11 AM
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
-- Database: `math_house`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_carts`
--

CREATE TABLE `academic_carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chapter_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lesson_id` bigint(20) UNSIGNED DEFAULT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address_line_1` varchar(191) NOT NULL,
  `address_line_2` varchar(191) DEFAULT NULL,
  `city` varchar(191) NOT NULL,
  `postal_code` varchar(191) NOT NULL,
  `state` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_admin_id` bigint(20) UNSIGNED NOT NULL,
  `admin_role` enum('Admin','User Wallet','Users','Payment','Courses','Settings','Live','Packages','ReportIssues','Slider','Affilate','Marketing','Reports') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `user_admin_id`, `admin_role`, `created_at`, `updated_at`) VALUES
(88, 7, 'Admin', '2024-04-20 07:33:30', '2024-04-20 07:33:30'),
(89, 7, 'Users', '2024-04-20 07:33:30', '2024-04-20 07:33:30'),
(100, 6, 'Admin', '2024-05-14 10:21:33', '2024-05-14 10:21:33'),
(101, 6, 'Users', '2024-05-14 10:21:33', '2024-05-14 10:21:33'),
(102, 6, 'Courses', '2024-05-14 10:21:33', '2024-05-14 10:21:33'),
(103, 6, 'Settings', '2024-05-14 10:21:33', '2024-05-14 10:21:33'),
(104, 6, 'Live', '2024-05-14 10:21:33', '2024-05-14 10:21:33'),
(110, 8, 'User Wallet', '2024-05-20 06:49:21', '2024-05-20 06:49:21'),
(111, 8, 'Payment', '2024-05-20 06:49:21', '2024-05-20 06:49:21'),
(113, 9, 'Admin', '2024-05-20 07:19:19', '2024-05-20 07:19:19'),
(114, 9, 'Users', '2024-05-20 07:19:19', '2024-05-20 07:19:19'),
(115, 9, 'Courses', '2024-05-20 07:19:19', '2024-05-20 07:19:19'),
(116, 9, 'Settings', '2024-05-20 07:19:19', '2024-05-20 07:19:19'),
(117, 10, 'Reports', '2024-05-21 09:59:22', '2024-05-21 09:59:22'),
(118, 10, 'User Wallet', '2024-05-21 09:59:22', '2024-05-21 09:59:22');

-- --------------------------------------------------------

--
-- Table structure for table `affilate`
--

CREATE TABLE `affilate` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `wallet` varchar(255) NOT NULL DEFAULT '0',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `affilate`
--

INSERT INTO `affilate` (`id`, `user_id`, `organization`, `wallet`, `created_at`, `updated_at`) VALUES
(1, 5, 'Company', '70.65', '2024-01-08', '2024-05-22'),
(2, 1, 'fd', '405.55', '2024-01-24', '2024-04-26'),
(6, 77, 'wego', '0', '2024-04-23', '2024-04-23');

-- --------------------------------------------------------

--
-- Table structure for table `affilate_requests`
--

CREATE TABLE `affilate_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `affilate_id` bigint(20) UNSIGNED NOT NULL,
  `service` varchar(255) NOT NULL,
  `earned` float NOT NULL,
  `payment_req_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `affilate_requests`
--

INSERT INTO `affilate_requests` (`id`, `affilate_id`, `service`, `earned`, `payment_req_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Course', 0, 164, '2024-05-17 11:31:38', '2024-05-17 11:31:38'),
(2, 1, 'Questions', 5.55, 166, '2024-05-17 11:46:43', '2024-05-17 11:46:43'),
(3, 1, 'Questions', 5.55, 167, '2024-05-17 11:48:05', '2024-05-17 11:48:05'),
(4, 1, 'Exams', 6, 173, '2024-05-17 12:05:34', '2024-05-17 12:05:34'),
(5, 1, 'Exams', 6, 174, '2024-05-17 12:06:26', '2024-05-17 12:06:26'),
(6, 1, 'Exams', 30, 176, '2024-05-17 12:07:33', '2024-05-17 12:07:33'),
(7, 1, 'Chapter', 7.1, 178, '2024-05-17 12:10:18', '2024-05-17 12:10:18'),
(8, 1, 'Chapter', 7.1, 182, '2024-05-17 12:23:04', '2024-05-17 12:23:04');

-- --------------------------------------------------------

--
-- Table structure for table `affilate_services`
--

CREATE TABLE `affilate_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `affilate_id` bigint(20) UNSIGNED NOT NULL,
  `service` enum('Course','Chapter','Exams','Questions','Live Session') NOT NULL,
  `earned` float NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `affilate_services`
--

INSERT INTO `affilate_services` (`id`, `affilate_id`, `service`, `earned`, `created_at`, `updated_at`) VALUES
(1, 1, 'Course', 400, NULL, NULL),
(2, 1, 'Chapter', 200, NULL, NULL),
(3, 2, 'Questions', 5.55, '2024-04-26 14:58:59', '2024-04-26 14:58:59'),
(4, 1, 'Questions', 5.55, '2024-04-26 15:02:03', '2024-04-26 15:02:03'),
(5, 1, 'Course', 0, '2024-04-27 07:45:30', '2024-04-27 07:45:30'),
(6, 1, 'Exams', 6, '2024-05-01 07:45:20', '2024-05-01 07:45:20'),
(7, 1, 'Course', 0, '2024-05-08 11:25:59', '2024-05-08 11:25:59'),
(8, 1, 'Course', 0, '2024-05-08 11:31:11', '2024-05-08 11:31:11'),
(9, 1, 'Course', 0, '2024-05-13 08:55:29', '2024-05-13 08:55:29'),
(10, 1, 'Course', 0, '2024-05-13 08:56:50', '2024-05-13 08:56:50'),
(11, 1, 'Course', 0, '2024-05-13 08:57:06', '2024-05-13 08:57:06'),
(12, 1, 'Course', 0, '2024-05-13 08:57:25', '2024-05-13 08:57:25'),
(13, 1, 'Course', 0, '2024-05-13 08:57:46', '2024-05-13 08:57:46'),
(14, 1, 'Course', 0, '2024-05-13 08:58:20', '2024-05-13 08:58:20'),
(15, 1, 'Course', 0, '2024-05-13 08:58:46', '2024-05-13 08:58:46'),
(16, 1, 'Questions', 5.55, '2024-05-13 09:01:48', '2024-05-13 09:01:48'),
(17, 1, 'Course', 0, '2024-05-17 11:33:39', '2024-05-17 11:33:39'),
(18, 1, 'Course', 0, '2024-05-17 11:35:18', '2024-05-17 11:35:18'),
(19, 1, 'Questions', 5.55, '2024-05-17 11:48:46', '2024-05-17 11:48:46'),
(20, 1, 'Questions', 5.55, '2024-05-17 11:51:15', '2024-05-17 11:51:15'),
(21, 1, 'Questions', 5.55, '2024-05-17 11:54:11', '2024-05-17 11:54:11'),
(22, 1, 'Exams', 6, '2024-05-17 11:57:40', '2024-05-17 11:57:40'),
(23, 1, 'Exams', 6, '2024-05-17 12:06:47', '2024-05-17 12:06:47'),
(24, 1, 'Live Session', 30, '2024-05-17 12:07:55', '2024-05-17 12:07:55'),
(25, 1, 'Chapter', 7.1, '2024-05-17 12:26:28', '2024-05-17 12:26:28'),
(26, 1, 'Chapter', 7.1, '2024-05-17 12:26:40', '2024-05-17 12:26:40'),
(27, 1, 'Chapter', 7.1, '2024-05-17 12:28:11', '2024-05-17 12:28:11'),
(28, 1, 'Chapter', 7.1, '2024-05-17 12:28:21', '2024-05-17 12:28:21'),
(29, 1, 'Exams', 30, '2024-05-17 12:28:32', '2024-05-17 12:28:32'),
(30, 1, 'Exams', 6, '2024-05-17 12:28:42', '2024-05-17 12:28:42'),
(31, 1, 'Exams', 6, '2024-05-17 12:28:53', '2024-05-17 12:28:53'),
(32, 1, 'Course', 0, '2024-05-22 08:07:03', '2024-05-22 08:07:03'),
(33, 1, 'Exams', 0, '2024-05-22 08:07:49', '2024-05-22 08:07:49'),
(34, 1, 'Exams', 6, '2024-05-22 08:35:11', '2024-05-22 08:35:11');

-- --------------------------------------------------------

--
-- Table structure for table `cancel_session`
--

CREATE TABLE `cancel_session` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `statue` enum('Pendding','Approve','Rejected') NOT NULL DEFAULT 'Pendding',
  `date` date NOT NULL,
  `time` time NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cancel_session`
--

INSERT INTO `cancel_session` (`id`, `user_id`, `session_id`, `statue`, `date`, `time`, `created_at`, `updated_at`) VALUES
(2, 5, 8, 'Pendding', '2024-04-10', '19:59:34', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cate_name` varchar(191) NOT NULL,
  `cate_des` text NOT NULL,
  `cate_url` varchar(191) NOT NULL DEFAULT 'Default.jfif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `cate_name`, `cate_des`, `cate_url`, `created_at`, `updated_at`, `teacher_id`) VALUES
(1, 'Category 1', 'Category One', '6362024X03X09X09X44X1532023X11X28X08X45X14pexelsXrevacXfilm\'s&photographyX205337.jpg', NULL, '2024-03-09 07:44:15', 1),
(8, 'category Three', 'category Three', '9202024X03X09X09X44X26622023X12X11X13X53X39pexelsXriccardoXbertoloX4245826.jpg', '2024-02-05 10:52:50', '2024-03-09 07:44:26', 8),
(9, 'American Doploma', 'hello', '7922024X02X19X07X46X04202301101725mvf_dark_logo.png', '2024-02-19 05:46:04', '2024-02-19 05:46:04', 8);

-- --------------------------------------------------------

--
-- Table structure for table `chapters`
--

CREATE TABLE `chapters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chapter_name` varchar(191) NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `ch_des` text NOT NULL,
  `ch_url` varchar(255) NOT NULL DEFAULT 'Default.jfif',
  `pre_requisition` text DEFAULT NULL,
  `gain` text DEFAULT NULL,
  `teacher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chapters`
--

INSERT INTO `chapters` (`id`, `chapter_name`, `course_id`, `ch_des`, `ch_url`, `pre_requisition`, `gain`, `teacher_id`, `created_at`, `updated_at`) VALUES
(4, 'Chapter 1', 1, 'Chapter One', 'Default.jfif', 'to', 'what', 1, NULL, '2024-04-18 14:29:28'),
(6, 'Chapter 26', 1, 'errw', '20230826085456153827_2318787155110616_6392255175880343552_n.jpg', 'jfdgh', 'o', 5, '2024-01-03 00:35:50', '2024-04-30 13:36:52'),
(20, 'Chapter 32', 4, 'arwrwe', 'Default.jfif', 'asE', 'ERRWE', 44, NULL, '2024-05-18 11:47:20'),
(21, 'Chapter Two', 2, '', 'Default.jfif', 'sfer', 'wdfr', 1, NULL, NULL),
(22, 'Chapter One', 2, 'sdas', 'Default.jfif', 'asdasd', 'adsf', NULL, NULL, NULL),
(23, 'sr', 12, 'kjl', '842024X06X02X06X28X557.png', 'hmjhjk', 'jhkjl', 71, '2024-06-02 06:28:55', '2024-06-02 06:28:55'),
(24, 'sr', 12, 'asdfs', '2882024X06X02X06X29X407.png', 'cfvsd', 'dfsed', 71, '2024-06-02 06:29:40', '2024-06-02 11:57:39');

-- --------------------------------------------------------

--
-- Table structure for table `chapter_prices`
--

CREATE TABLE `chapter_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `duration` int(20) NOT NULL,
  `price` float NOT NULL,
  `discount` float NOT NULL,
  `chapter_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `chapter_prices`
--

INSERT INTO `chapter_prices` (`id`, `duration`, `price`, `discount`, `chapter_id`, `created_at`, `updated_at`) VALUES
(27, 50, 225, 22, 4, '2024-04-18', '2024-04-18'),
(28, 35, 9, 32, 4, '2024-04-18', '2024-04-18'),
(29, 13, 43, 12, 4, '2024-04-18', '2024-04-18'),
(30, 22, 25, 11, 6, '2024-04-30', '2024-04-30'),
(35, 1122, 10, 77, 20, '2024-05-18', '2024-05-18'),
(36, 1122, 33, 33, 20, '2024-05-18', '2024-05-18'),
(45, 33, 33, 2, 21, NULL, NULL),
(46, 44, 44, 2, 21, NULL, NULL),
(47, 33, 120, 2, 22, NULL, NULL),
(48, 21, 21, 12, 24, '2024-06-02', '2024-06-02');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_id`, `city`, `created_at`, `updated_at`) VALUES
(2, '5', 'Karachi', NULL, NULL),
(8, '61', 'Alexandria', NULL, NULL),
(9, '61', 'Aswan', NULL, NULL),
(10, '61', 'Asyut', NULL, NULL),
(11, '61', 'Damanhur', NULL, NULL),
(12, '61', 'Marsa Matruh', NULL, NULL),
(13, '10', 'Port Said', NULL, NULL),
(14, '61', 'Luxor', NULL, NULL),
(15, '61', 'Faiyum', NULL, NULL),
(16, '61', 'Giza', NULL, NULL),
(17, '61', 'Cairo', NULL, NULL),
(18, '61', 'Hurghada', NULL, NULL),
(19, '61', 'Sharm El Sheikh', NULL, NULL),
(20, '7', 'Abha', NULL, NULL),
(21, '7', 'Ad-Dilam', NULL, NULL),
(22, '7', 'Al-Abwa', NULL, NULL),
(23, '7', 'Al Artaweeiyah', NULL, NULL),
(25, '7', 'Al Bukayriyah', NULL, NULL),
(26, '7', 'Badr', NULL, NULL),
(27, '7', 'Baljurashi', NULL, NULL),
(28, '7', 'Bisha', NULL, NULL),
(29, '7', 'Bareq', NULL, NULL),
(30, '7', 'Buraydah', NULL, NULL),
(31, '7', 'Buraydah', NULL, NULL),
(32, '7', 'Al Bahah', NULL, NULL),
(33, '7', 'Buqaa', NULL, NULL),
(34, '7', 'Dammam', NULL, NULL),
(35, '7', 'Dhahran', NULL, NULL),
(36, '7', 'Dhurma', NULL, NULL),
(37, '7', 'Dahaban', NULL, NULL),
(38, '7', 'Diriyah', NULL, NULL),
(39, '7', 'Duba', NULL, NULL),
(40, '7', 'Dumat Al-Jandal', NULL, NULL),
(41, '7', 'Dawadmi', NULL, NULL),
(42, '7', 'Farasan', NULL, NULL),
(43, '7', 'Gatgat', NULL, NULL),
(44, '7', 'Gerrha', NULL, NULL),
(45, '7', 'Ghawiyah', NULL, NULL),
(46, '7', 'Al-Gwei\'iyyah', NULL, NULL),
(47, '7', 'Hautat Sudair', NULL, NULL),
(48, '7', 'Habaala', NULL, NULL),
(49, '7', 'Hajrah', NULL, NULL),
(50, '7', 'Haql', NULL, NULL),
(51, '7', 'Al-Hareeq', NULL, NULL),
(52, '7', 'Harmah', NULL, NULL),
(53, '7', 'Ha\'il', NULL, NULL),
(54, '7', 'Hotat Bani Tamim', NULL, NULL),
(55, '7', 'Hofuf', NULL, NULL),
(56, '7', 'Huraymila', NULL, NULL),
(57, '7', 'Hafr Al-Batin', NULL, NULL),
(58, '7', 'Jabal Umm al Ru\'us', NULL, NULL),
(59, '7', 'Jalajil', NULL, NULL),
(60, '7', 'Jeddah', NULL, NULL),
(61, '7', 'Jizan', NULL, NULL),
(62, '7', 'Jizan Economic City', NULL, NULL),
(63, '7', 'Jubail', NULL, NULL),
(64, '7', 'Al Jafr', NULL, NULL),
(65, '7', 'Khafji', NULL, NULL),
(66, '7', 'Khaybar', NULL, NULL),
(67, '7', 'King Abdullah Economic City', NULL, NULL),
(68, '7', 'Khamis Mushait', NULL, NULL),
(69, '7', 'Al-Saih', NULL, NULL),
(70, '7', 'Knowledge Economic City, Medina', NULL, NULL),
(71, '7', 'Khobar', NULL, NULL),
(72, '7', 'Al-Khutt', NULL, NULL),
(73, '7', 'Layla', NULL, NULL),
(74, '7', 'Lihyan', NULL, NULL),
(75, '7', 'Al Lith', NULL, NULL),
(76, '7', 'Al Majma\'ah', NULL, NULL),
(77, '7', 'Mastoorah', NULL, NULL),
(78, '7', 'Al Mikhwah', NULL, NULL),
(79, '7', 'Al-Mubarraz', NULL, NULL),
(80, '7', 'Al Mawain', NULL, NULL),
(81, '7', 'Medina', NULL, NULL),
(82, '7', 'Mecca', NULL, NULL),
(83, '7', 'Muzahmiyya', NULL, NULL),
(84, '7', 'Najran', NULL, NULL),
(85, '7', 'Al-Namas', NULL, NULL),
(86, '7', 'Umluj', NULL, NULL),
(87, '7', 'Al-Omran', NULL, NULL),
(88, '7', 'Al-Oyoon', NULL, NULL),
(89, '7', 'Qadeimah', NULL, NULL),
(90, '7', 'Qatif', NULL, NULL),
(91, '7', 'Qaisumah', NULL, NULL),
(92, '7', 'Al Qunfudhah', NULL, NULL),
(93, '7', 'Qurayyat', NULL, NULL),
(94, '7', 'Rabigh', NULL, NULL),
(96, '7', 'Rafha', NULL, NULL),
(97, '7', 'Ar Rass', NULL, NULL),
(98, '7', 'Ras Tanura', NULL, NULL),
(99, '7', 'Ranyah', NULL, NULL),
(100, '7', 'Riyadh', NULL, NULL),
(101, '7', 'Riyadh Al-Khabra', NULL, NULL),
(102, '7', 'Rumailah', NULL, NULL),
(103, '7', 'Sabt Al Alaya', NULL, NULL),
(104, '7', 'Sarat Abidah', NULL, NULL),
(105, '7', 'Saihat', NULL, NULL),
(106, '7', 'Safwa city', NULL, NULL),
(107, '7', 'Sakakah', NULL, NULL),
(108, '7', 'Sharurah', NULL, NULL),
(109, '7', 'Shaqraa', NULL, NULL),
(110, '7', 'Shaybah', NULL, NULL),
(111, '7', 'As Sulayyil', NULL, NULL),
(112, '7', 'Taif', NULL, NULL),
(113, '7', 'Tabuk', NULL, NULL),
(114, '7', 'Tanomah', NULL, NULL),
(115, '7', 'Tarout', NULL, NULL),
(116, '7', 'Tayma', NULL, NULL),
(117, '7', 'Thadiq', NULL, NULL),
(118, '7', 'Thuwal', NULL, NULL),
(119, '7', 'Thuqbah', NULL, NULL),
(120, '7', 'Turaif', NULL, NULL),
(121, '7', 'Tabarjal', NULL, NULL),
(122, '7', 'Udhailiyah', NULL, NULL),
(123, '7', 'Al-\'Ula', NULL, NULL),
(124, '7', 'Um Al-Sahek', NULL, NULL),
(125, '7', 'Unaizah', NULL, NULL),
(126, '7', 'Uqair', NULL, NULL),
(127, '7', '\'Uyayna', NULL, NULL),
(128, '7', 'Uyun AlJiwa', NULL, NULL),
(129, '7', 'Wadi Al-Dawasir', NULL, NULL),
(130, '7', 'Al Wajh', NULL, NULL),
(131, '7', 'Yanbu', NULL, NULL),
(132, '7', 'Az Zaimah', NULL, NULL),
(133, '7', 'Zulfi', NULL, NULL),
(134, '195', 'Dubai', NULL, NULL),
(135, '195', 'Abu Dhabi', NULL, NULL),
(136, '195', 'Sharjah', NULL, NULL),
(137, '195', 'Al Ain', NULL, NULL),
(138, '195', 'Ajman', NULL, NULL),
(139, '195', 'Ras Al Khaimah', NULL, NULL),
(140, '195', 'Fujairah', NULL, NULL),
(141, '195', 'Umm al-Quwain', NULL, NULL),
(142, '190', 'Istanbul', NULL, NULL),
(143, '190', 'Ankara', NULL, NULL),
(144, '190', 'Izmir', NULL, NULL),
(145, '190', 'Bursa', NULL, NULL),
(146, '103', 'Beirut', NULL, NULL),
(147, '103', 'Tripoli', NULL, NULL),
(148, '103', 'Sidon', NULL, NULL),
(149, '103', 'Tyre', NULL, NULL),
(150, '103', 'Nabatîyé et Tahta', NULL, NULL),
(151, '103', 'Habboûch', NULL, NULL),
(152, '103', 'Jounieh', NULL, NULL),
(153, '103', 'Zahle', NULL, NULL),
(154, '103', 'Ghazieh', NULL, NULL),
(155, '103', 'Baalbek', NULL, NULL),
(156, '103', 'En Nâqoûra', NULL, NULL),
(157, '103', 'Byblos', NULL, NULL),
(158, '151', 'Doha', NULL, NULL),
(159, '151', 'Abu az Zuluf', NULL, NULL),
(160, '151', 'Abu Thaylah', NULL, NULL),
(161, '151', 'Ad Dawhah al Jadidah', NULL, NULL),
(162, '151', 'Al `Arish', NULL, NULL),
(163, '151', 'Al Bida` ash Sharqiyah', NULL, NULL),
(164, '151', 'Al Ghanim', NULL, NULL),
(165, '151', 'Al Ghuwariyah', NULL, NULL),
(166, '151', 'Al Hilal al Gharbiyah', NULL, NULL),
(167, '151', 'Al Hilal ash Sharqiyah', NULL, NULL),
(168, '151', 'Al Hitmi', NULL, NULL),
(169, '151', 'Al Jasrah', NULL, NULL),
(170, '151', 'Al Jumaliyah', NULL, NULL),
(171, '151', 'Al Ka`biyah', NULL, NULL),
(172, '151', 'Al Khalifat', NULL, NULL),
(173, '151', 'Al Khor', NULL, NULL),
(174, '151', 'Al Khawr', NULL, NULL),
(175, '151', 'Al Khuwayr', NULL, NULL),
(176, '151', 'Al Mafjar', NULL, NULL),
(177, '151', 'Al Qa`abiyah', NULL, NULL),
(178, '151', 'Al Wakrah', NULL, NULL),
(179, '151', 'Al `Adhbah', NULL, NULL),
(180, '151', 'An Najmah', NULL, NULL),
(181, '151', 'Ar Rakiyat', NULL, NULL),
(182, '151', 'Al Rayyan', NULL, NULL),
(183, '151', 'Ar Ru\'ays', NULL, NULL),
(184, '151', 'As Salatah', NULL, NULL),
(185, '151', 'As Salatah al Jadidah', NULL, NULL),
(186, '151', 'As Sani`', NULL, NULL),
(187, '151', 'As Sawq', NULL, NULL),
(188, '151', 'Ath Thaqab', NULL, NULL),
(189, '151', 'Blaré', NULL, NULL),
(190, '151', 'Dukhan', NULL, NULL),
(191, '151', 'Ras Laffan Industrial City', NULL, NULL),
(192, '151', 'Umm Bab', NULL, NULL),
(193, '151', 'Umm Sa\'id', NULL, NULL),
(194, '151', 'Umm Salal Ali', NULL, NULL),
(195, '151', 'Umm Salal Mohammed', NULL, NULL),
(196, '22', 'Manama', NULL, NULL),
(197, '22', 'Riffa', NULL, NULL),
(198, '22', 'Muharraq', NULL, NULL),
(199, '22', 'Hamad Town', NULL, NULL),
(200, '22', 'A\'ali', NULL, NULL),
(201, '22', 'Isa Town', NULL, NULL),
(202, '22', 'Sitra', NULL, NULL),
(203, '22', 'Budaiya', NULL, NULL),
(204, '22', 'Jidhafs', NULL, NULL),
(205, '22', 'Al-Malikiyah', NULL, NULL),
(206, '114', 'Malé', NULL, NULL),
(207, '114', 'Fuvahmulah', NULL, NULL),
(208, '114', 'Hithadhoo', NULL, NULL),
(209, '114', 'Kulhudhuffushi', NULL, NULL),
(210, '114', 'Thinadhoo', NULL, NULL),
(211, '114', 'Naifaru', NULL, NULL),
(212, '114', 'Hulhumale', NULL, NULL),
(213, '114', 'Dhihdhoo', NULL, NULL),
(214, '114', 'Maafushi', NULL, NULL),
(215, '114', 'Maafushi', NULL, NULL),
(216, '114', 'Viligili', NULL, NULL),
(217, '114', 'Funadhoo', NULL, NULL),
(218, '114', 'Eydhafushi', NULL, NULL),
(219, '190', 'Adana', NULL, NULL),
(220, '190', 'Gaziantep', NULL, NULL),
(221, '190', 'Konya', NULL, NULL),
(222, '190', 'Konya', NULL, NULL),
(223, '190', 'Kayseri', NULL, NULL),
(224, '190', 'Mersin', NULL, NULL),
(225, '190', 'Eskisehir', NULL, NULL),
(226, '190', 'Diyarbakir', NULL, NULL),
(227, '190', 'Samsun', NULL, NULL),
(228, '190', 'Denizli', NULL, NULL),
(229, '190', 'Sanliurfa', NULL, NULL),
(230, '190', 'Adapazari', NULL, NULL),
(231, '190', 'Malatya', NULL, NULL),
(232, '190', 'Kahramanmaras', NULL, NULL),
(233, '190', 'Erzurum', NULL, NULL),
(234, '190', 'Van', NULL, NULL),
(235, '190', 'Batman', NULL, NULL),
(236, '190', 'Elazig', NULL, NULL),
(237, '190', 'Izmit', NULL, NULL),
(238, '190', 'Manisa', NULL, NULL),
(239, '190', 'Sivas', NULL, NULL),
(240, '190', 'Sivas', NULL, NULL),
(241, '190', 'Sivas', NULL, NULL),
(242, '190', 'Gebze', NULL, NULL),
(243, '190', 'Balikesir', NULL, NULL),
(244, '190', 'Tarsus', NULL, NULL),
(246, '190', 'Kutahya', NULL, NULL),
(247, '190', 'Trabzon', NULL, NULL),
(248, '190', 'Corum', NULL, NULL),
(249, '190', 'Corlu', NULL, NULL),
(250, '190', 'Adiyaman', NULL, NULL),
(252, '190', 'Osmaniye', NULL, NULL),
(253, '190', 'Kirikkale', NULL, NULL),
(254, '190', 'Antakya', NULL, NULL),
(255, '190', 'Aydin', NULL, NULL),
(256, '190', 'Iskenderun', NULL, NULL),
(257, '190', 'Usak', NULL, NULL),
(258, '190', 'Aksaray', NULL, NULL),
(259, '197', 'New York', NULL, NULL),
(260, '197', 'Los Angeles', NULL, NULL),
(261, '197', 'Chicago', NULL, NULL),
(262, '197', 'Houston', NULL, NULL),
(263, '197', 'Phoenix', NULL, NULL),
(264, '197', 'Philadelphia', NULL, NULL),
(265, '197', 'San Antonio', NULL, NULL),
(266, '197', 'San Diego', NULL, NULL),
(267, '197', 'Dallas', NULL, NULL),
(268, '197', 'San Jose', NULL, NULL),
(269, '197', 'Austin', NULL, NULL),
(270, '197', 'Jacksonville', NULL, NULL),
(271, '197', 'Fort Worth', NULL, NULL),
(272, '197', 'Columbus', NULL, NULL),
(273, '197', 'Indianapolis', NULL, NULL),
(274, '197', 'Charlotte', NULL, NULL),
(275, '197', 'San Francisco', NULL, NULL),
(276, '197', 'Seattle', NULL, NULL),
(277, '197', 'Denver', NULL, NULL),
(278, '197', 'Oklahoma City', NULL, NULL),
(279, '197', 'Nashville', NULL, NULL),
(280, '197', 'El Paso', NULL, NULL),
(281, '197', 'Washington', NULL, NULL),
(282, '197', 'Boston', NULL, NULL),
(283, '197', 'Las Vegas', NULL, NULL),
(284, '197', 'Portland', NULL, NULL),
(285, '197', 'Detroit', NULL, NULL),
(286, '197', 'Louisville', NULL, NULL),
(287, '197', 'Memphis', NULL, NULL),
(288, '197', 'Baltimore', NULL, NULL),
(289, '197', 'Milwaukee', NULL, NULL),
(290, '197', 'Albuquerque', NULL, NULL),
(291, '197', 'Sacramento', NULL, NULL),
(292, '197', 'Kansas City', NULL, NULL),
(293, '197', 'Atlanta', NULL, NULL),
(294, '197', 'Georgia', NULL, NULL),
(295, '197', 'California', NULL, NULL),
(296, '197', 'Omaha', NULL, NULL),
(297, '197', 'Raleigh', NULL, NULL),
(298, '197', 'Virginia Beach', NULL, NULL),
(299, '197', 'Virginia', NULL, NULL),
(300, '197', 'Miami', NULL, NULL),
(301, '197', 'Minneapolis', NULL, NULL),
(302, '197', 'Minnesota', NULL, NULL),
(303, '197', 'Wichita', NULL, NULL),
(304, '197', 'New Orleans', NULL, NULL),
(305, '197', 'Florida', NULL, NULL),
(306, '197', 'Hawaii', NULL, NULL),
(307, '197', 'Honolulu', NULL, NULL),
(308, '197', 'Texas', NULL, NULL),
(309, '197', 'Santa Ana', NULL, NULL),
(310, '197', 'New Jersey', NULL, NULL),
(311, '197', 'Newark', NULL, NULL),
(312, '197', 'Saint Paul', NULL, NULL),
(313, '197', 'Saint Paul', NULL, NULL),
(314, '197', 'Saint Paul', NULL, NULL),
(315, '197', 'Lincoln', NULL, NULL),
(316, '197', 'Anchorage', NULL, NULL),
(317, '197', 'Frisco', NULL, NULL),
(318, '197', 'Columbus', NULL, NULL),
(319, '197', 'Little Rock', NULL, NULL),
(320, '197', 'Mississippi', NULL, NULL),
(321, '197', 'Columbia', NULL, NULL),
(322, '197', 'Victorville', NULL, NULL),
(323, '197', 'Elizabeth', NULL, NULL),
(324, '197', 'Cambridge', NULL, NULL),
(325, '197', 'Manchester', NULL, NULL),
(326, '70', 'Paris', NULL, NULL),
(327, '70', 'Marseille', NULL, NULL),
(328, '70', 'Lyon', NULL, NULL),
(330, '70', 'Toulouse', NULL, NULL),
(331, '70', 'Nice', NULL, NULL),
(332, '70', 'Nantes', NULL, NULL),
(333, '70', 'Montpellier', NULL, NULL),
(334, '70', 'Strasbourg', NULL, NULL),
(335, '70', 'Bordeaux', NULL, NULL),
(336, '70', 'Lille', NULL, NULL),
(338, '70', 'Rennes', NULL, NULL),
(339, '70', 'Grenoble', NULL, NULL),
(340, '70', 'Rouen', NULL, NULL),
(341, '70', 'Avignon', NULL, NULL),
(342, '70', 'Saint Etienne', NULL, NULL),
(343, '70', 'Tours', NULL, NULL),
(344, '70', 'Clermont-Ferrand', NULL, NULL),
(345, '70', 'Nancy', NULL, NULL),
(346, '70', 'Orléans', NULL, NULL),
(347, '70', 'Caen', NULL, NULL),
(348, '70', 'Angers', NULL, NULL),
(349, '70', 'Metz', NULL, NULL),
(350, '70', 'Dijon', NULL, NULL),
(351, '70', 'Béthune', NULL, NULL),
(352, '70', 'Valenciennes', NULL, NULL),
(353, '70', 'Le Mans', NULL, NULL),
(354, '70', 'Reims', NULL, NULL),
(355, '70', 'Brest', NULL, NULL),
(356, '70', 'Perpignan', NULL, NULL),
(357, '70', 'Nîmes', NULL, NULL),
(358, '70', 'Nîmes', NULL, NULL),
(359, '70', 'Poitiers', NULL, NULL),
(360, '70', 'Besançon', NULL, NULL),
(361, '70', 'Annecy', NULL, NULL),
(362, '70', 'La Rochelle', NULL, NULL),
(363, '70', 'Chambéry', NULL, NULL),
(364, '70', '(Geneva) Annemasse', NULL, NULL),
(365, '70', 'Saint-Nazaire', NULL, NULL),
(366, '70', 'Valence', NULL, NULL),
(367, '70', 'Angoulême', NULL, NULL),
(368, '70', 'Maubeuge', NULL, NULL),
(369, '70', 'Montbéliard', NULL, NULL),
(370, '92', 'Rome', NULL, NULL),
(371, '92', 'Milan', NULL, NULL),
(372, '92', 'Naples', NULL, NULL),
(373, '92', 'Turin', NULL, NULL),
(374, '92', 'Palermo', NULL, NULL),
(375, '92', 'Genoa', NULL, NULL),
(376, '92', 'Bologna', NULL, NULL),
(377, '92', 'Florence', NULL, NULL),
(378, '92', 'Bari', NULL, NULL),
(379, '92', 'Catania', NULL, NULL),
(380, '92', 'Verona', NULL, NULL),
(381, '92', 'Venice', NULL, NULL),
(382, '92', 'Messina', NULL, NULL),
(383, '92', 'Padua', NULL, NULL),
(384, '92', 'Prato', NULL, NULL),
(385, '92', 'Trieste', NULL, NULL),
(386, '92', 'Brescia', NULL, NULL),
(387, '92', 'Parma', NULL, NULL),
(388, '92', 'Taranto', NULL, NULL),
(389, '92', 'Modena', NULL, NULL),
(390, '92', 'Perugia', NULL, NULL),
(391, '92', 'Ravenna', NULL, NULL),
(392, '92', 'Cagliari', NULL, NULL),
(393, '92', 'Foggia', NULL, NULL),
(394, '92', 'Trento', NULL, NULL),
(395, '92', 'Ancona', NULL, NULL),
(396, '92', 'Catanzaro', NULL, NULL),
(397, '92', 'Treviso', NULL, NULL),
(398, '92', 'L’Aquila', NULL, NULL),
(399, '92', 'Potenza', NULL, NULL),
(400, '92', 'Turin', NULL, NULL),
(401, '92', 'Piedmont', NULL, NULL),
(402, '92', 'Sicily', NULL, NULL),
(403, '92', 'Palermo', NULL, NULL),
(404, '92', 'Genoa', NULL, NULL),
(405, '92', 'Liguria', NULL, NULL),
(406, '92', 'Bologna', NULL, NULL),
(407, '92', 'Emilia-Romagna', NULL, NULL),
(408, '92', 'Florence', NULL, NULL),
(409, '92', 'Tuscany', NULL, NULL),
(410, '92', 'Bari', NULL, NULL),
(411, '92', 'Apulia', NULL, NULL),
(412, '92', 'Catania', NULL, NULL),
(413, '92', 'Verona', NULL, NULL),
(414, '92', 'Veneto', NULL, NULL),
(415, '92', 'Venice', NULL, NULL),
(416, '92', 'Messina', NULL, NULL),
(418, '92', 'Modena', NULL, NULL),
(419, '74', 'Berlin', NULL, NULL),
(420, '74', 'Hamburg', NULL, NULL),
(421, '74', 'Munich', NULL, NULL),
(422, '74', 'Stuttgart', NULL, NULL),
(423, '74', 'Frankfurt am Main', NULL, NULL),
(424, '74', 'Düsseldorf', NULL, NULL),
(425, '74', 'Leipzig', NULL, NULL),
(426, '74', 'Dresden', NULL, NULL),
(427, '74', 'Dortmund', NULL, NULL),
(428, '74', 'Bonn', NULL, NULL),
(429, '74', 'Essen', NULL, NULL),
(430, '74', 'Cologne', NULL, NULL),
(431, '74', 'Nuremberg', NULL, NULL),
(432, '74', 'Chemnitz', NULL, NULL),
(433, '74', 'Mannheim', NULL, NULL),
(434, '74', 'Mainz', NULL, NULL),
(435, '74', 'Braunschweig', NULL, NULL),
(436, '74', 'Osnabrück', NULL, NULL),
(437, '74', 'Frankfurt', NULL, NULL),
(438, '74', 'Kiel', NULL, NULL),
(439, '74', 'Magdeburg', NULL, NULL),
(440, '74', 'Mainz', NULL, NULL),
(441, '74', 'Erfurt', NULL, NULL),
(442, '74', 'Potsdam', NULL, NULL),
(443, '74', 'Saarbrücken', NULL, NULL),
(444, '74', 'Düsseldorf', NULL, NULL),
(445, '74', 'Leipzig', NULL, NULL),
(446, '74', 'Dortmund', NULL, NULL),
(447, '74', 'Bremen', NULL, NULL),
(448, '74', 'Duisburg', NULL, NULL),
(449, '74', 'Nuremberg', NULL, NULL),
(450, '74', 'Hanover', NULL, NULL),
(451, '174', 'Madrid', NULL, NULL),
(452, '174', 'Barcelona', NULL, NULL),
(453, '174', 'Valencia', NULL, NULL),
(454, '174', 'Seville', NULL, NULL),
(455, '174', 'Zaragoza', NULL, NULL),
(456, '174', 'Bilbao', NULL, NULL),
(457, '174', 'Córdoba', NULL, NULL),
(458, '174', 'Granada', NULL, NULL),
(459, '174', 'Málaga', NULL, NULL),
(460, '174', 'Alicante', NULL, NULL),
(461, '174', 'Palma', NULL, NULL),
(462, '174', 'Murcia', NULL, NULL),
(463, '174', 'Toledo', NULL, NULL),
(464, '174', 'Cádiz', NULL, NULL),
(465, '174', 'San Sebastian', NULL, NULL),
(466, '174', 'Salamanca', NULL, NULL),
(467, '174', 'Las Palmas', NULL, NULL),
(468, '174', 'Oviedo', NULL, NULL),
(469, '174', 'Valladolid', NULL, NULL),
(470, '174', 'Pamplona', NULL, NULL),
(471, '174', 'Santiago de Compostela', NULL, NULL),
(472, '174', 'Almería', NULL, NULL),
(473, '174', 'Girona', NULL, NULL),
(474, '174', 'Jerez de la Frontera', NULL, NULL),
(475, '132', 'Rotterdam', NULL, NULL),
(476, '132', 'The Hague', NULL, NULL),
(477, '132', 'Amsterdam', NULL, NULL),
(478, '132', 'Utrecht', NULL, NULL),
(479, '132', 'Eindhoven', NULL, NULL),
(480, '132', 'Groningen', NULL, NULL),
(481, '132', 'Haarlem', NULL, NULL),
(482, '132', 'Arnhem', NULL, NULL),
(483, '132', 'Breda', NULL, NULL),
(484, '132', '\'s-Hertogenbosch', NULL, NULL),
(485, '132', 'Nijmegen', NULL, NULL),
(486, '132', 'Zwolle', NULL, NULL),
(487, '132', 'Apeldoorn', NULL, NULL),
(488, '132', 'Zaanstad', NULL, NULL),
(489, '132', 'Den Helder', NULL, NULL),
(490, '113', 'Kuala Lumpur', NULL, NULL),
(491, '113', 'Ipoh', NULL, NULL),
(492, '113', 'George Town', NULL, NULL),
(493, '113', 'Kuching', NULL, NULL),
(494, '113', 'Malacca City', NULL, NULL),
(495, '113', 'Petaling Jaya', NULL, NULL),
(496, '113', 'Sandakan', NULL, NULL),
(497, '113', 'Kuala Terengganu', NULL, NULL),
(498, '113', 'Kota Bharu', NULL, NULL),
(499, '113', 'Kota Bharu', NULL, NULL),
(500, '113', 'Tawau', NULL, NULL),
(501, '113', 'Johor Bahru', NULL, NULL),
(502, '113', 'Kota Kinabalu', NULL, NULL),
(503, '113', 'Klang', NULL, NULL),
(504, '184', 'Bangkok', NULL, NULL),
(505, '184', 'Nonthaburi', NULL, NULL),
(506, '184', 'Pak Kret', NULL, NULL),
(507, '184', 'Hat Yai', NULL, NULL),
(508, '184', 'Chaophraya Surasak', NULL, NULL),
(509, '184', 'Surat Thani', NULL, NULL),
(510, '184', 'Nakhon Ratchasima', NULL, NULL),
(511, '184', 'Chiang Mai', NULL, NULL),
(512, '184', 'Udon Thani', NULL, NULL),
(513, '184', 'Pattaya', NULL, NULL),
(514, '184', 'Khon Kaen', NULL, NULL),
(515, '184', 'Nakhon Si Thammarat', NULL, NULL),
(516, '184', 'Laem Chabang', NULL, NULL),
(517, '184', 'Rangsit', NULL, NULL),
(518, '184', 'Nakhon Sawan', NULL, NULL),
(519, '184', 'Phuket', NULL, NULL),
(520, '184', 'Chiang Rai', NULL, NULL),
(521, '184', 'Ubon Ratchathani', NULL, NULL),
(522, '184', 'Nakhon Pathom', NULL, NULL),
(523, '184', 'Ko Samui', NULL, NULL),
(524, '184', 'Samut Sakhon', NULL, NULL),
(525, '184', 'Phitsanulok', NULL, NULL),
(526, '184', 'Rayong', NULL, NULL),
(527, '184', 'Songkhla', NULL, NULL),
(528, '184', 'Yala', NULL, NULL),
(529, '184', 'Trang', NULL, NULL),
(530, '184', 'Om Noi', NULL, NULL),
(531, '184', 'Sakon Nakhon', NULL, NULL),
(532, '184', 'Lampang', NULL, NULL),
(533, '184', 'Samut Prakan', NULL, NULL),
(534, '184', 'Phra Nakhon Si Ayutthaya', NULL, NULL),
(535, '184', 'Mae Sot', NULL, NULL),
(536, '61', 'Alexandria', NULL, NULL),
(538, '161', 'madina', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` enum('Course','Chapter','Exams','Questions','Live Session') NOT NULL,
  `precentage` float NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `commissions`
--

INSERT INTO `commissions` (`id`, `user_id`, `name`, `precentage`, `state`, `created_at`, `updated_at`) VALUES
(6, 1, 'Exams', 10, 1, '2024-05-21', '2024-05-21'),
(7, 1, 'Questions', 5, 1, '2024-05-21', '2024-05-21'),
(8, 1, 'Live Session', 5, 1, '2024-05-21', '2024-05-21'),
(9, 2, 'Course', 11, 1, '2024-05-21', '2024-05-21'),
(10, 2, 'Chapter', 1, 1, '2024-05-21', '2024-05-21'),
(11, 6, 'Course', 12, 1, '2024-05-22', '2024-05-22');

-- --------------------------------------------------------

--
-- Table structure for table `confirm_sign`
--

CREATE TABLE `confirm_sign` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `code` varchar(20) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `confirm_sign`
--

INSERT INTO `confirm_sign` (`id`, `email`, `code`, `created_at`, `updated_at`) VALUES
(1, 'ahmedahmadahmid73@gmail.com', '1873', '2023-12-31', '2023-12-31'),
(2, 'ziadm57@yahoo.com', '1756', '2023-12-31', '2023-12-31'),
(3, 'ziadm0176@gmail.com', '5567', '2023-12-31', '2023-12-31'),
(4, 'admin@gmail.com', '6618', '2024-01-03', '2024-01-03'),
(5, 'admin@gmail.com', '3021', '2024-01-03', '2024-01-03'),
(6, 'admin@gmail.com', '6842', '2024-01-03', '2024-01-03'),
(7, 'admin2312@gmail.com', '9858', '2024-01-03', '2024-01-03'),
(8, 'karimelfakey84@gmail.com', '9349', '2024-01-04', '2024-01-04'),
(9, 'karimelfakey84@gmail.com', '5987', '2024-01-04', '2024-01-04'),
(10, 'karimelfakey84@gmail.com', '9299', '2024-01-04', '2024-01-04'),
(11, 'sdfs@gmail.com', '1039', '2024-01-04', '2024-01-04'),
(12, 'sdfs@gmail.com', '3273', '2024-01-04', '2024-01-04'),
(13, 'sdfs@gmail.com', '2720', '2024-01-04', '2024-01-04'),
(14, 'sdfs@gmail.com', '7016', '2024-01-04', '2024-01-04'),
(15, 'student_one@gmail.com', '9301', '2024-04-08', '2024-04-08'),
(16, 'ahmed312@gmail.com', '4351', '2024-04-30', '2024-04-30'),
(17, 'ahmedahmddadaddhmid73@gmail.com', '9676', '2024-05-01', '2024-05-01'),
(18, 'sdffssd@gmail.com', '7694', '2024-05-05', '2024-05-05'),
(19, 'ertgttg@gmail.com', '2599', '2024-05-05', '2024-05-05'),
(20, 'ahmedahmadahmid73@gmail.com', '3125', '2024-05-08', '2024-05-08'),
(21, 'ahmedahmadahmid73@gmail.com', '2501', '2024-05-08', '2024-05-08'),
(22, 'ahmedahmadahmid73@gmail.com', '5300', '2024-05-08', '2024-05-08'),
(23, 'ahmedahmadahmid73@gmail.com', '9578', '2024-05-17', '2024-05-17'),
(24, 'ahmedahmadahmid73@gmail.com', '1193', '2024-05-17', '2024-05-17');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'mohamed yasen', 'admin@gmail.com', 'Hello', 'My Msg', '2024-01-20', '2024-01-20');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `created_at`, `updated_at`) VALUES
(10, 'Afghanistan', '2023-05-02 04:20:41', '2023-05-02 04:20:41'),
(11, 'Albania', '2023-05-02 04:20:54', '2023-05-02 04:20:54'),
(12, 'Algeria', '2023-05-02 04:21:05', '2023-05-02 04:21:05'),
(13, 'Andorra', '2023-05-02 04:21:18', '2023-05-02 04:21:18'),
(14, 'Angola', '2023-05-02 04:21:32', '2023-05-02 04:21:32'),
(15, 'Antigua and Barbuda', '2023-05-02 04:21:47', '2023-05-02 04:21:47'),
(16, 'Argentina', '2023-05-02 04:24:32', '2023-05-02 04:24:32'),
(17, 'Armenia', '2023-05-02 04:24:48', '2023-05-02 04:24:48'),
(18, 'Australia', '2023-05-02 04:24:59', '2023-05-02 04:24:59'),
(19, 'Austria', '2023-05-02 04:25:10', '2023-05-02 04:25:10'),
(20, 'Azerbaijan', '2023-05-02 04:25:21', '2023-05-02 04:25:21'),
(21, 'Bahamas', '2023-05-02 04:25:33', '2023-05-02 04:25:33'),
(22, 'Bahrain', '2023-05-02 04:25:43', '2023-05-02 04:25:43'),
(23, 'Bangladesh', '2023-05-02 04:25:53', '2023-05-02 04:25:53'),
(24, 'Barbados', '2023-05-02 04:27:02', '2023-05-02 04:27:02'),
(25, 'Belarus', '2023-05-02 04:27:27', '2023-05-02 04:27:27'),
(26, 'Belgium', '2023-05-02 04:28:46', '2023-05-02 04:28:46'),
(27, 'Belize', '2023-05-02 04:28:57', '2023-05-02 04:28:57'),
(28, 'Benin', '2023-05-02 04:32:12', '2023-05-02 04:32:12'),
(29, 'Bhutan', '2023-05-02 04:32:45', '2023-05-02 04:32:45'),
(30, 'Bolivia', '2023-05-02 04:32:59', '2023-05-02 04:32:59'),
(31, 'Bosnia and Herzegovina', '2023-05-02 04:33:17', '2023-05-02 04:33:17'),
(32, 'Botswana', '2023-05-02 04:33:31', '2023-05-02 04:33:31'),
(33, 'Brazil', '2023-05-02 04:45:12', '2023-05-02 04:45:12'),
(34, 'Brunei', '2023-05-02 04:45:41', '2023-05-02 04:45:41'),
(35, 'Bulgaria', '2023-05-02 04:52:29', '2023-05-02 04:52:29'),
(36, 'Burkina Faso', '2023-05-02 04:53:34', '2023-05-02 04:53:34'),
(37, 'Burundi', '2023-05-02 04:53:53', '2023-05-02 04:53:53'),
(38, 'Côte d\'Ivoire', '2023-05-02 04:54:04', '2023-05-02 04:54:04'),
(39, 'Cabo Verde', '2023-05-02 04:54:15', '2023-05-02 04:54:15'),
(40, 'Cambodia', '2023-05-02 04:57:48', '2023-05-02 04:57:48'),
(41, 'Cameroon', '2023-05-02 04:57:58', '2023-05-02 04:57:58'),
(42, 'Canada', '2023-05-02 04:58:09', '2023-05-02 04:58:09'),
(43, 'Central African Republic', '2023-05-02 04:58:21', '2023-05-02 04:58:21'),
(44, 'Chad', '2023-05-02 05:00:10', '2023-05-02 05:00:10'),
(45, 'Chile', '2023-05-02 05:00:22', '2023-05-02 05:00:22'),
(46, 'China', '2023-05-02 05:00:34', '2023-05-02 05:00:34'),
(47, 'Colombia', '2023-05-02 05:00:44', '2023-05-02 05:00:44'),
(48, 'Comoros', '2023-05-02 05:01:00', '2023-05-02 05:01:00'),
(49, 'Congo (Congo-Brazzaville)', '2023-05-02 05:01:16', '2023-05-02 05:01:16'),
(50, 'Costa Rica', '2023-05-02 05:01:27', '2023-05-02 05:01:27'),
(51, 'Croatia', '2023-05-02 05:01:39', '2023-05-02 05:01:39'),
(52, 'Cuba', '2023-05-02 05:01:50', '2023-05-02 05:01:50'),
(53, 'Cyprus', '2023-05-02 05:02:01', '2023-05-02 05:02:01'),
(54, 'Czechia (Czech Republic)', '2023-05-02 05:02:21', '2023-05-02 05:02:21'),
(55, 'Democratic Republic of the Congo', '2023-05-02 05:02:38', '2023-05-02 05:02:38'),
(56, 'Denmark', '2023-05-02 05:02:50', '2023-05-02 05:02:50'),
(57, 'Djibouti', '2023-05-02 05:03:06', '2023-05-02 05:03:06'),
(58, 'Dominica', '2023-05-02 05:03:17', '2023-05-02 05:03:17'),
(59, 'Dominican Republic', '2023-05-02 05:03:29', '2023-05-02 05:03:29'),
(60, 'Ecuador', '2023-05-02 05:03:40', '2023-05-02 05:03:40'),
(61, 'Egypt', '2023-05-02 05:03:50', '2023-05-02 05:03:50'),
(62, 'El Salvador', '2023-05-02 05:04:18', '2023-05-02 05:04:18'),
(63, 'Equatorial Guinea', '2023-05-02 05:04:28', '2023-05-02 05:04:28'),
(64, 'Eritrea', '2023-05-02 05:04:39', '2023-05-02 05:04:39'),
(65, 'Estonia', '2023-05-02 05:04:49', '2023-05-02 05:04:49'),
(66, 'Eswatini (fmr. \"Swaziland\")', '2023-05-02 05:05:02', '2023-05-02 05:05:02'),
(67, 'Ethiopia', '2023-05-02 05:05:12', '2023-05-02 05:05:12'),
(68, 'Fiji', '2023-05-02 05:05:23', '2023-05-02 05:05:23'),
(69, 'Finland', '2023-05-02 05:05:32', '2023-05-02 05:05:32'),
(70, 'France', '2023-05-02 05:05:42', '2023-05-02 05:05:42'),
(71, 'Gabon', '2023-05-02 05:05:54', '2023-05-02 05:05:54'),
(72, 'Gambia', '2023-05-02 05:06:08', '2023-05-02 05:06:08'),
(73, 'Georgia', '2023-05-02 05:06:36', '2023-05-02 05:06:36'),
(74, 'Germany', '2023-05-02 05:06:46', '2023-05-02 05:06:46'),
(75, 'Ghana', '2023-05-02 05:06:58', '2023-05-02 05:06:58'),
(76, 'Greece', '2023-05-02 05:07:07', '2023-05-02 05:07:07'),
(77, 'Grenada', '2023-05-02 05:07:21', '2023-05-02 05:07:21'),
(78, 'Guatemala', '2023-05-02 05:07:34', '2023-05-02 05:07:34'),
(79, 'Guinea', '2023-05-02 05:07:43', '2023-05-02 05:07:43'),
(80, 'Guinea-Bissau', '2023-05-02 05:07:53', '2023-05-02 05:07:53'),
(81, 'Guyana', '2023-05-02 05:08:02', '2023-05-02 05:08:02'),
(82, 'Haiti', '2023-05-02 05:08:14', '2023-05-02 05:08:14'),
(83, 'Holy See', '2023-05-02 05:08:25', '2023-05-02 05:08:25'),
(84, 'Honduras', '2023-05-02 05:08:45', '2023-05-02 05:08:45'),
(85, 'Hungary', '2023-05-02 05:08:57', '2023-05-02 05:08:57'),
(86, 'Iceland', '2023-05-02 05:09:09', '2023-05-02 05:09:09'),
(87, 'India', '2023-05-02 05:09:20', '2023-05-02 05:09:20'),
(88, 'Indonesia', '2023-05-02 05:10:10', '2023-05-02 05:10:10'),
(89, 'Iran', '2023-05-02 05:10:23', '2023-05-02 05:10:23'),
(90, 'Iraq', '2023-05-02 05:10:34', '2023-05-02 05:10:34'),
(91, 'Ireland', '2023-05-02 05:10:44', '2023-05-02 05:10:44'),
(92, 'Italy', '2023-05-02 05:11:03', '2023-05-02 05:11:03'),
(93, 'Jamaica', '2023-05-02 05:11:17', '2023-05-02 05:11:17'),
(94, 'Japan', '2023-05-02 05:11:31', '2023-05-02 05:11:31'),
(95, 'Jordan', '2023-05-02 05:11:47', '2023-05-02 05:11:47'),
(96, 'Kazakhstan', '2023-05-02 05:11:59', '2023-05-02 05:11:59'),
(97, 'Kenya', '2023-05-02 05:12:09', '2023-05-02 05:12:09'),
(98, 'Kiribati', '2023-05-02 05:12:19', '2023-05-02 05:12:19'),
(99, 'Kuwait', '2023-05-02 05:12:54', '2023-05-02 05:12:54'),
(100, 'Kyrgyzstan', '2023-05-02 05:13:26', '2023-05-02 05:13:26'),
(101, 'Laos', '2023-05-02 05:13:37', '2023-05-02 05:13:37'),
(102, 'Latvia', '2023-05-02 05:13:46', '2023-05-02 05:13:46'),
(103, 'Lebanon', '2023-05-02 05:14:50', '2023-05-02 05:14:50'),
(104, 'Lesotho', '2023-05-02 05:15:22', '2023-05-02 05:15:22'),
(105, 'Liberia', '2023-05-02 05:15:34', '2023-05-02 05:15:34'),
(106, 'Libya', '2023-05-02 05:15:48', '2023-05-02 05:15:48'),
(107, 'Libya', '2023-05-02 05:15:48', '2023-05-02 05:15:48'),
(108, 'Liechtenstein', '2023-05-02 05:17:24', '2023-05-02 05:17:24'),
(109, 'Lithuania', '2023-05-02 05:17:45', '2023-05-02 05:17:45'),
(110, 'Luxembourg', '2023-05-02 06:31:48', '2023-05-02 06:31:48'),
(111, 'Madagascar', '2023-05-02 06:42:28', '2023-05-02 06:42:28'),
(112, 'Malawi', '2023-05-02 06:42:46', '2023-05-02 06:42:46'),
(113, 'Malaysia', '2023-05-02 06:43:49', '2023-05-02 06:43:49'),
(114, 'Maldives', '2023-05-02 06:44:17', '2023-05-02 06:44:17'),
(115, 'Malta', '2023-05-02 09:41:04', '2023-05-02 09:41:04'),
(116, 'Marshall Islands', '2023-05-02 09:41:15', '2023-05-02 09:41:15'),
(117, 'Mauritania', '2023-05-02 09:41:27', '2023-05-02 09:41:27'),
(118, 'Mauritius', '2023-05-02 09:41:54', '2023-05-02 09:41:54'),
(119, 'Mexico', '2023-05-02 09:42:05', '2023-05-02 09:42:05'),
(120, 'Micronesia', '2023-05-02 09:43:01', '2023-05-02 09:43:01'),
(121, 'Moldova', '2023-05-02 09:43:11', '2023-05-02 09:43:11'),
(122, 'Monaco', '2023-05-02 09:43:23', '2023-05-02 09:43:23'),
(123, 'Mongolia', '2023-05-02 09:43:35', '2023-05-02 09:43:35'),
(124, 'Montenegro', '2023-05-02 09:43:44', '2023-05-02 09:43:44'),
(125, 'Morocco', '2023-05-02 09:43:54', '2023-05-02 09:43:54'),
(126, 'Mozambique', '2023-05-02 09:44:04', '2023-05-02 09:44:04'),
(127, 'Myanmar (formerly Burma)', '2023-05-02 09:44:15', '2023-05-02 09:44:15'),
(128, 'Namibia', '2023-05-02 09:45:21', '2023-05-02 09:45:21'),
(129, 'Nauru', '2023-05-02 09:45:32', '2023-05-02 09:45:32'),
(130, 'Nepal', '2023-05-02 09:47:31', '2023-05-02 09:47:31'),
(131, 'Nepal', '2023-05-02 09:48:06', '2023-05-02 09:48:06'),
(132, 'Netherlands', '2023-05-02 09:48:20', '2023-05-02 09:48:20'),
(133, 'New Zealand', '2023-05-02 09:48:30', '2023-05-02 09:48:30'),
(134, 'Nicaragua', '2023-05-02 09:48:40', '2023-05-02 09:48:40'),
(135, 'Niger', '2023-05-02 09:48:50', '2023-05-02 09:48:50'),
(136, 'Nigeria', '2023-05-02 09:49:01', '2023-05-02 09:49:01'),
(137, 'North Korea', '2023-05-02 09:49:22', '2023-05-02 09:49:22'),
(138, 'North Macedonia', '2023-05-02 09:49:32', '2023-05-02 09:49:32'),
(139, 'Norway', '2023-05-02 09:49:46', '2023-05-02 09:49:46'),
(140, 'Oman', '2023-05-02 09:49:57', '2023-05-02 09:49:57'),
(141, 'Pakistan', '2023-05-02 09:50:07', '2023-05-02 09:50:07'),
(142, 'Palau', '2023-05-02 09:50:21', '2023-05-02 09:50:21'),
(143, 'Palestine State', '2023-05-02 09:51:02', '2023-05-02 09:51:02'),
(144, 'Panama', '2023-05-02 09:51:13', '2023-05-02 09:51:13'),
(145, 'Papua New Guinea', '2023-05-02 09:51:28', '2023-05-02 09:51:28'),
(146, 'Paraguay', '2023-05-02 09:52:02', '2023-05-02 09:52:02'),
(147, 'Peru', '2023-05-02 09:52:14', '2023-05-02 09:52:14'),
(148, 'Philippines', '2023-05-02 09:52:23', '2023-05-02 09:52:23'),
(149, 'Poland', '2023-05-02 09:52:35', '2023-05-02 09:52:35'),
(150, 'Portugal', '2023-05-02 09:52:47', '2023-05-02 09:52:47'),
(151, 'Qatar', '2023-05-02 09:52:58', '2023-05-02 09:52:58'),
(152, 'Romania', '2023-05-02 09:53:07', '2023-05-02 09:53:07'),
(153, 'Russia', '2023-05-02 09:53:17', '2023-05-02 09:53:17'),
(154, 'Rwanda', '2023-05-02 09:53:26', '2023-05-02 09:53:26'),
(155, 'Saint Kitts and Nevis', '2023-05-02 09:53:35', '2023-05-02 09:53:35'),
(156, 'Saint Lucia', '2023-05-02 09:53:43', '2023-05-02 09:53:43'),
(157, 'Saint Vincent and the Grenadines', '2023-05-02 09:53:57', '2023-05-02 09:53:57'),
(158, 'Samoa', '2023-05-02 09:54:06', '2023-05-02 09:54:06'),
(159, 'San Marino', '2023-05-02 09:54:15', '2023-05-02 09:54:15'),
(160, 'Sao Tome and Principe', '2023-05-02 09:54:25', '2023-05-02 09:54:25'),
(161, 'Saudi Arabia', '2023-05-02 09:54:36', '2023-05-02 09:54:36'),
(162, 'Senegal', '2023-05-02 09:54:46', '2023-05-02 09:54:46'),
(163, 'Serbia', '2023-05-02 09:54:56', '2023-05-02 09:54:56'),
(164, 'Seychelles', '2023-05-02 09:55:07', '2023-05-02 09:55:07'),
(165, 'Sierra Leone', '2023-05-02 09:55:17', '2023-05-02 09:55:17'),
(166, 'Singapore', '2023-05-02 09:55:25', '2023-05-02 09:55:25'),
(167, 'Slovakia', '2023-05-02 09:55:50', '2023-05-02 09:55:50'),
(168, 'Slovenia', '2023-05-02 09:56:10', '2023-05-02 09:56:10'),
(169, 'Solomon Islands', '2023-05-02 09:56:28', '2023-05-02 09:56:28'),
(170, 'Somalia', '2023-05-02 09:56:39', '2023-05-02 09:56:39'),
(171, 'South Africa', '2023-05-02 09:56:50', '2023-05-02 09:56:50'),
(172, 'South Korea', '2023-05-02 09:59:19', '2023-05-02 09:59:19'),
(173, 'South Sudan', '2023-05-02 09:59:28', '2023-05-02 09:59:28'),
(174, 'Spain', '2023-05-02 09:59:38', '2023-05-02 09:59:38'),
(175, 'Sri Lanka', '2023-05-02 09:59:49', '2023-05-02 09:59:49'),
(176, 'Sudan', '2023-05-02 09:59:59', '2023-05-02 09:59:59'),
(177, 'Suriname', '2023-05-02 10:00:09', '2023-05-02 10:00:09'),
(178, 'Sweden', '2023-05-02 10:00:19', '2023-05-02 10:00:19'),
(179, 'Switzerland', '2023-05-03 03:38:16', '2023-05-03 03:38:16'),
(180, 'Switzerland', '2023-05-03 03:38:17', '2023-05-03 03:38:17'),
(181, 'Syria', '2023-05-03 03:38:27', '2023-05-03 03:38:27'),
(182, 'Tajikistan', '2023-05-03 03:39:25', '2023-05-03 03:39:25'),
(183, 'Tanzania', '2023-05-03 03:39:36', '2023-05-03 03:39:36'),
(184, 'Thailand', '2023-05-03 03:39:46', '2023-05-03 03:39:46'),
(185, 'Timor-Leste', '2023-05-03 03:39:59', '2023-05-03 03:39:59'),
(186, 'Togo', '2023-05-03 03:40:10', '2023-05-03 03:40:10'),
(187, 'Tonga', '2023-05-03 03:40:21', '2023-05-03 03:40:21'),
(188, 'Trinidad and Tobago', '2023-05-03 03:40:33', '2023-05-03 03:40:33'),
(189, 'Tunisia', '2023-05-03 03:40:45', '2023-05-03 03:40:45'),
(190, 'Turkey', '2023-05-03 03:41:57', '2023-05-03 03:41:57'),
(191, 'Turkmenistan', '2023-05-03 03:42:08', '2023-05-03 03:42:08'),
(192, 'Tuvalu', '2023-05-03 03:42:20', '2023-05-03 03:42:20'),
(193, 'Uganda', '2023-05-03 03:42:30', '2023-05-03 03:42:30'),
(194, 'Ukraine', '2023-05-03 03:42:40', '2023-05-03 03:42:40'),
(195, 'United Arab Emirates', '2023-05-03 03:42:54', '2023-05-03 03:42:54'),
(196, 'United Kingdom', '2023-05-03 03:43:19', '2023-05-03 03:43:19'),
(197, 'United States of America', '2023-05-03 03:43:35', '2023-05-03 03:43:35'),
(198, 'Uruguay', '2023-05-03 03:43:47', '2023-05-03 03:43:47'),
(199, 'Uzbekistan', '2023-05-03 03:45:03', '2023-05-03 03:45:03'),
(200, 'Vanuatu', '2023-05-03 03:45:18', '2023-05-03 03:45:18'),
(201, 'Venezuela', '2023-05-03 03:45:31', '2023-05-03 03:45:31'),
(202, 'Vietnam', '2023-05-03 03:45:39', '2023-05-03 03:45:39'),
(203, 'Yemen', '2023-05-03 03:45:51', '2023-05-03 03:45:51'),
(204, 'Zambia', '2023-05-03 03:46:01', '2023-05-03 03:46:01'),
(205, 'Zimbabwe', '2023-05-03 03:46:17', '2023-05-03 03:46:17');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_name` varchar(191) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `course_des` text NOT NULL,
  `course_url` varchar(191) NOT NULL DEFAULT 'Default.jfif',
  `pre_requisition` text DEFAULT NULL,
  `gain` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `category_id`, `course_des`, `course_url`, `pre_requisition`, `gain`, `created_at`, `updated_at`, `teacher_id`, `user_id`) VALUES
(1, 'Course 1', 1, 'Course One', 'Default.jfif', 'sd', 'sad', NULL, '2024-04-18 12:29:00', 1, 1),
(2, 'Course 2', 1, 'Course Two', 'Default.jfif', 'weq', 'tr', NULL, NULL, 1, 1),
(4, 'SAT', 1, 'hello', '2024X01X01X12X08X23612220231001083656153827_2318787155110616_6392255175880343552_n.jpg', 'Grid 10', 'hello', '2024-01-01 10:08:23', '2024-01-01 10:08:23', 1, NULL),
(6, 'erwe', 1, 'asd', '2024X01X24X11X14X1187535.jpg', 'das', 'asd', '2024-01-24 09:14:11', '2024-01-24 09:14:53', 1, NULL),
(9, 'dddddd', 1, 'ddddd', '2024X01X28X10X16X1464223.png', 'sdsdsd', 'sdsdd', '2024-01-28 08:16:14', '2024-01-28 08:16:14', 1, NULL),
(10, 'Course Eleven', 1, 'Course Eleven', '2024X02X05X12X54X4940013.jpg', 'asd', 'asd', '2024-02-05 10:54:49', '2024-02-05 10:54:49', 1, NULL),
(12, 'IS', 9, 'hello', '2024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'dfg', 'fgg', '2024-02-19 05:47:01', '2024-05-18 07:31:20', 1, NULL),
(13, 'course 21', 1, 'sad', '2024X03X27X12X32X3648672024X02X19X07X46X506890202301101725mvf_dark_logo.png', 'df', 'sd', '2024-03-27 10:32:36', '2024-03-27 10:32:36', 1, NULL),
(14, 'Course 13', 1, 'sxas', 'Default.jfif', 'sad', 'asdsda', '2024-03-27 10:37:06', '2024-05-19 05:40:15', 1, NULL),
(15, 'fdgfd', 9, 'fdgd', '2024X06X02X06X31X0910196.png', 'sdgfd', 'gdfgdf', '2024-06-02 04:31:09', '2024-06-02 05:21:41', 65, NULL),
(16, 'sdfs', 9, 'dfsf', '2024X06X02X08X04X269376.png', 'sdf', 'sdfsd', '2024-06-02 06:04:26', '2024-06-02 06:04:26', 71, NULL),
(17, 'sdfs', 9, 'dfsf', '2024X06X02X08X08X4116776.png', 'sdf', 'sdfsd', '2024-06-02 06:08:41', '2024-06-02 06:08:41', 71, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_prices`
--

CREATE TABLE `course_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `duration` int(11) NOT NULL,
  `price` float NOT NULL,
  `discount` float NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_prices`
--

INSERT INTO `course_prices` (`id`, `course_id`, `duration`, `price`, `discount`, `created_at`, `updated_at`) VALUES
(17, 9, 1, 100, 10, '2024-01-28', '2024-01-28'),
(21, 6, 4, 400, 3, '2024-02-05', '2024-02-05'),
(22, 4, 1, 23, 22, '2024-02-05', '2024-02-05'),
(23, 10, 1, 100, 1, '2024-02-05', '2024-02-05'),
(28, 2, 30, 600, 5, NULL, NULL),
(29, 13, 11, 21, 12, '2024-03-27', '2024-03-27'),
(32, 1, 5, 500, 5, '2024-04-18', '2024-04-18'),
(33, 12, 1, 23, 22, '2024-05-18', '2024-05-18'),
(35, 14, 12, 23, 12, '2024-05-19', '2024-05-19');

-- --------------------------------------------------------

--
-- Table structure for table `dai_exam_mistakes`
--

CREATE TABLE `dai_exam_mistakes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_exam_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dai_exam_mistakes`
--

INSERT INTO `dai_exam_mistakes` (`id`, `student_exam_id`, `question_id`, `created_at`, `updated_at`) VALUES
(2, 2, 18, '2024-03-03', '2024-03-03'),
(3, 2, 18, '2024-03-03', '2024-03-03'),
(4, 2, 18, '2024-03-03', '2024-03-03'),
(5, 2, 18, '2024-03-03', '2024-03-03'),
(6, 2, 18, '2024-03-03', '2024-03-03'),
(7, 2, 18, '2024-03-03', '2024-03-03'),
(8, 2, 18, '2024-03-03', '2024-03-03'),
(9, 2, 19, '2024-03-03', '2024-03-03'),
(10, 2, 19, '2024-03-03', '2024-03-03'),
(11, 2, 19, '2024-03-03', '2024-03-03'),
(12, 2, 19, '2024-03-03', '2024-03-03'),
(13, 2, 19, '2024-03-03', '2024-03-03'),
(14, 2, 19, '2024-03-03', '2024-03-03'),
(15, 2, 19, '2024-03-03', '2024-03-03'),
(16, 3, 18, '2024-03-03', '2024-03-03'),
(17, 3, 18, '2024-03-03', '2024-03-03'),
(18, 3, 18, '2024-03-03', '2024-03-03'),
(19, 3, 18, '2024-03-03', '2024-03-03'),
(20, 3, 18, '2024-03-03', '2024-03-03'),
(21, 3, 18, '2024-03-03', '2024-03-03'),
(22, 3, 18, '2024-03-03', '2024-03-03'),
(23, 3, 19, '2024-03-03', '2024-03-03'),
(24, 3, 19, '2024-03-03', '2024-03-03'),
(25, 3, 19, '2024-03-03', '2024-03-03'),
(26, 3, 19, '2024-03-03', '2024-03-03'),
(27, 3, 19, '2024-03-03', '2024-03-03'),
(28, 3, 19, '2024-03-03', '2024-03-03'),
(29, 3, 19, '2024-03-03', '2024-03-03'),
(30, 4, 18, '2024-03-03', '2024-03-03'),
(31, 4, 18, '2024-03-03', '2024-03-03'),
(32, 4, 18, '2024-03-03', '2024-03-03'),
(33, 4, 18, '2024-03-03', '2024-03-03'),
(34, 4, 18, '2024-03-03', '2024-03-03'),
(35, 4, 18, '2024-03-03', '2024-03-03'),
(36, 4, 18, '2024-03-03', '2024-03-03'),
(37, 4, 19, '2024-03-03', '2024-03-03'),
(38, 4, 19, '2024-03-03', '2024-03-03'),
(39, 4, 19, '2024-03-03', '2024-03-03'),
(40, 4, 19, '2024-03-03', '2024-03-03'),
(41, 4, 19, '2024-03-03', '2024-03-03'),
(42, 4, 19, '2024-03-03', '2024-03-03'),
(43, 4, 19, '2024-03-03', '2024-03-03'),
(44, 5, 18, '2024-03-03', '2024-03-03'),
(45, 5, 18, '2024-03-03', '2024-03-03'),
(46, 5, 18, '2024-03-03', '2024-03-03'),
(47, 5, 18, '2024-03-03', '2024-03-03'),
(48, 5, 18, '2024-03-03', '2024-03-03'),
(49, 5, 18, '2024-03-03', '2024-03-03'),
(50, 5, 18, '2024-03-03', '2024-03-03'),
(51, 5, 19, '2024-03-03', '2024-03-03'),
(52, 5, 19, '2024-03-03', '2024-03-03'),
(53, 5, 19, '2024-03-03', '2024-03-03'),
(54, 5, 19, '2024-03-03', '2024-03-03'),
(55, 5, 19, '2024-03-03', '2024-03-03'),
(56, 5, 19, '2024-03-03', '2024-03-03'),
(57, 5, 19, '2024-03-03', '2024-03-03'),
(58, 6, 18, '2024-03-03', '2024-03-03'),
(59, 6, 18, '2024-03-03', '2024-03-03'),
(60, 6, 18, '2024-03-03', '2024-03-03'),
(61, 6, 18, '2024-03-03', '2024-03-03'),
(62, 6, 18, '2024-03-03', '2024-03-03'),
(63, 6, 18, '2024-03-03', '2024-03-03'),
(64, 6, 18, '2024-03-03', '2024-03-03'),
(65, 6, 19, '2024-03-03', '2024-03-03'),
(66, 6, 19, '2024-03-03', '2024-03-03'),
(67, 6, 19, '2024-03-03', '2024-03-03'),
(68, 6, 19, '2024-03-03', '2024-03-03'),
(69, 6, 19, '2024-03-03', '2024-03-03'),
(70, 6, 19, '2024-03-03', '2024-03-03'),
(71, 6, 19, '2024-03-03', '2024-03-03'),
(72, 7, 18, '2024-03-03', '2024-03-03'),
(73, 7, 18, '2024-03-03', '2024-03-03'),
(74, 7, 18, '2024-03-03', '2024-03-03'),
(75, 7, 18, '2024-03-03', '2024-03-03'),
(76, 7, 18, '2024-03-03', '2024-03-03'),
(77, 7, 18, '2024-03-03', '2024-03-03'),
(78, 7, 18, '2024-03-03', '2024-03-03'),
(79, 7, 19, '2024-03-03', '2024-03-03'),
(80, 7, 19, '2024-03-03', '2024-03-03'),
(81, 7, 19, '2024-03-03', '2024-03-03'),
(82, 7, 19, '2024-03-03', '2024-03-03'),
(83, 7, 19, '2024-03-03', '2024-03-03'),
(84, 7, 19, '2024-03-03', '2024-03-03'),
(85, 7, 19, '2024-03-03', '2024-03-03'),
(86, 8, 18, '2024-03-03', '2024-03-03'),
(87, 8, 18, '2024-03-03', '2024-03-03'),
(88, 8, 18, '2024-03-03', '2024-03-03'),
(89, 8, 18, '2024-03-03', '2024-03-03'),
(90, 8, 18, '2024-03-03', '2024-03-03'),
(91, 8, 18, '2024-03-03', '2024-03-03'),
(92, 8, 18, '2024-03-03', '2024-03-03'),
(93, 8, 19, '2024-03-03', '2024-03-03'),
(94, 8, 19, '2024-03-03', '2024-03-03'),
(95, 8, 19, '2024-03-03', '2024-03-03'),
(96, 8, 19, '2024-03-03', '2024-03-03'),
(97, 8, 19, '2024-03-03', '2024-03-03'),
(98, 8, 19, '2024-03-03', '2024-03-03'),
(99, 8, 19, '2024-03-03', '2024-03-03'),
(100, 9, 18, '2024-03-03', '2024-03-03'),
(101, 9, 18, '2024-03-03', '2024-03-03'),
(102, 9, 18, '2024-03-03', '2024-03-03'),
(103, 9, 18, '2024-03-03', '2024-03-03'),
(104, 9, 18, '2024-03-03', '2024-03-03'),
(105, 9, 18, '2024-03-03', '2024-03-03'),
(106, 9, 18, '2024-03-03', '2024-03-03'),
(107, 9, 19, '2024-03-03', '2024-03-03'),
(108, 9, 19, '2024-03-03', '2024-03-03'),
(109, 9, 19, '2024-03-03', '2024-03-03'),
(110, 9, 19, '2024-03-03', '2024-03-03'),
(111, 9, 19, '2024-03-03', '2024-03-03'),
(112, 9, 19, '2024-03-03', '2024-03-03'),
(113, 9, 19, '2024-03-03', '2024-03-03'),
(114, 10, 18, '2024-03-03', '2024-03-03'),
(115, 10, 18, '2024-03-03', '2024-03-03'),
(116, 10, 18, '2024-03-03', '2024-03-03'),
(117, 10, 18, '2024-03-03', '2024-03-03'),
(118, 10, 18, '2024-03-03', '2024-03-03'),
(119, 10, 18, '2024-03-03', '2024-03-03'),
(120, 10, 18, '2024-03-03', '2024-03-03'),
(121, 10, 19, '2024-03-03', '2024-03-03'),
(122, 10, 19, '2024-03-03', '2024-03-03'),
(123, 10, 19, '2024-03-03', '2024-03-03'),
(124, 10, 19, '2024-03-03', '2024-03-03'),
(125, 10, 19, '2024-03-03', '2024-03-03'),
(126, 10, 19, '2024-03-03', '2024-03-03'),
(127, 10, 19, '2024-03-03', '2024-03-03'),
(128, 11, 18, '2024-03-03', '2024-03-03'),
(129, 11, 18, '2024-03-03', '2024-03-03'),
(130, 11, 18, '2024-03-03', '2024-03-03'),
(131, 11, 18, '2024-03-03', '2024-03-03'),
(132, 11, 18, '2024-03-03', '2024-03-03'),
(133, 11, 18, '2024-03-03', '2024-03-03'),
(134, 11, 18, '2024-03-03', '2024-03-03'),
(135, 11, 19, '2024-03-03', '2024-03-03'),
(136, 11, 19, '2024-03-03', '2024-03-03'),
(137, 11, 19, '2024-03-03', '2024-03-03'),
(138, 11, 19, '2024-03-03', '2024-03-03'),
(139, 11, 19, '2024-03-03', '2024-03-03'),
(140, 11, 19, '2024-03-03', '2024-03-03'),
(141, 11, 19, '2024-03-03', '2024-03-03'),
(142, 12, 18, '2024-03-03', '2024-03-03'),
(143, 12, 18, '2024-03-03', '2024-03-03'),
(144, 12, 18, '2024-03-03', '2024-03-03'),
(145, 12, 18, '2024-03-03', '2024-03-03'),
(146, 12, 18, '2024-03-03', '2024-03-03'),
(147, 12, 18, '2024-03-03', '2024-03-03'),
(148, 12, 18, '2024-03-03', '2024-03-03'),
(149, 12, 19, '2024-03-03', '2024-03-03'),
(150, 12, 19, '2024-03-03', '2024-03-03'),
(151, 12, 19, '2024-03-03', '2024-03-03'),
(152, 12, 19, '2024-03-03', '2024-03-03'),
(153, 12, 19, '2024-03-03', '2024-03-03'),
(154, 12, 19, '2024-03-03', '2024-03-03'),
(155, 12, 19, '2024-03-03', '2024-03-03'),
(156, 13, 18, '2024-03-03', '2024-03-03'),
(157, 13, 18, '2024-03-03', '2024-03-03'),
(158, 13, 18, '2024-03-03', '2024-03-03'),
(159, 13, 18, '2024-03-03', '2024-03-03'),
(160, 13, 18, '2024-03-03', '2024-03-03'),
(161, 13, 18, '2024-03-03', '2024-03-03'),
(162, 13, 18, '2024-03-03', '2024-03-03'),
(163, 13, 19, '2024-03-03', '2024-03-03'),
(164, 13, 19, '2024-03-03', '2024-03-03'),
(165, 13, 19, '2024-03-03', '2024-03-03'),
(166, 13, 19, '2024-03-03', '2024-03-03'),
(167, 13, 19, '2024-03-03', '2024-03-03'),
(168, 13, 19, '2024-03-03', '2024-03-03'),
(169, 13, 19, '2024-03-03', '2024-03-03'),
(170, 14, 18, '2024-03-03', '2024-03-03'),
(171, 14, 18, '2024-03-03', '2024-03-03'),
(172, 14, 18, '2024-03-03', '2024-03-03'),
(173, 14, 18, '2024-03-03', '2024-03-03'),
(174, 14, 18, '2024-03-03', '2024-03-03'),
(175, 14, 18, '2024-03-03', '2024-03-03'),
(176, 14, 18, '2024-03-03', '2024-03-03'),
(177, 14, 19, '2024-03-03', '2024-03-03'),
(178, 14, 19, '2024-03-03', '2024-03-03'),
(179, 14, 19, '2024-03-03', '2024-03-03'),
(180, 14, 19, '2024-03-03', '2024-03-03'),
(181, 14, 19, '2024-03-03', '2024-03-03'),
(182, 14, 19, '2024-03-03', '2024-03-03'),
(183, 14, 19, '2024-03-03', '2024-03-03'),
(184, 15, 18, '2024-03-03', '2024-03-03'),
(185, 15, 18, '2024-03-03', '2024-03-03'),
(186, 15, 18, '2024-03-03', '2024-03-03'),
(187, 15, 18, '2024-03-03', '2024-03-03'),
(188, 15, 18, '2024-03-03', '2024-03-03'),
(189, 15, 18, '2024-03-03', '2024-03-03'),
(190, 15, 18, '2024-03-03', '2024-03-03'),
(191, 15, 19, '2024-03-03', '2024-03-03'),
(192, 15, 19, '2024-03-03', '2024-03-03'),
(193, 15, 19, '2024-03-03', '2024-03-03'),
(194, 15, 19, '2024-03-03', '2024-03-03'),
(195, 15, 19, '2024-03-03', '2024-03-03'),
(196, 15, 19, '2024-03-03', '2024-03-03'),
(197, 15, 19, '2024-03-03', '2024-03-03'),
(198, 16, 18, '2024-03-03', '2024-03-03'),
(199, 16, 18, '2024-03-03', '2024-03-03'),
(200, 16, 18, '2024-03-03', '2024-03-03'),
(201, 16, 18, '2024-03-03', '2024-03-03'),
(202, 16, 18, '2024-03-03', '2024-03-03'),
(203, 16, 18, '2024-03-03', '2024-03-03'),
(204, 16, 18, '2024-03-03', '2024-03-03'),
(205, 16, 19, '2024-03-03', '2024-03-03'),
(206, 16, 19, '2024-03-03', '2024-03-03'),
(207, 16, 19, '2024-03-03', '2024-03-03'),
(208, 16, 19, '2024-03-03', '2024-03-03'),
(209, 16, 19, '2024-03-03', '2024-03-03'),
(210, 16, 19, '2024-03-03', '2024-03-03'),
(211, 16, 19, '2024-03-03', '2024-03-03'),
(212, 17, 18, '2024-03-03', '2024-03-03'),
(213, 17, 18, '2024-03-03', '2024-03-03'),
(214, 17, 18, '2024-03-03', '2024-03-03'),
(215, 17, 18, '2024-03-03', '2024-03-03'),
(216, 17, 18, '2024-03-03', '2024-03-03'),
(217, 17, 18, '2024-03-03', '2024-03-03'),
(218, 17, 18, '2024-03-03', '2024-03-03'),
(219, 17, 19, '2024-03-03', '2024-03-03'),
(220, 17, 19, '2024-03-03', '2024-03-03'),
(221, 17, 19, '2024-03-03', '2024-03-03'),
(222, 17, 19, '2024-03-03', '2024-03-03'),
(223, 17, 19, '2024-03-03', '2024-03-03'),
(224, 17, 19, '2024-03-03', '2024-03-03'),
(225, 17, 19, '2024-03-03', '2024-03-03'),
(226, 18, 19, '2024-03-04', '2024-03-04'),
(227, 18, 19, '2024-03-04', '2024-03-04'),
(228, 18, 19, '2024-03-04', '2024-03-04'),
(229, 18, 19, '2024-03-04', '2024-03-04'),
(230, 18, 19, '2024-03-04', '2024-03-04'),
(231, 18, 19, '2024-03-04', '2024-03-04'),
(232, 18, 19, '2024-03-04', '2024-03-04'),
(233, 18, 19, '2024-03-04', '2024-03-04'),
(234, 18, 20, '2024-03-04', '2024-03-04'),
(235, 18, 20, '2024-03-04', '2024-03-04'),
(236, 18, 20, '2024-03-04', '2024-03-04'),
(237, 18, 20, '2024-03-04', '2024-03-04'),
(238, 18, 20, '2024-03-04', '2024-03-04'),
(239, 19, 19, '2024-03-04', '2024-03-04'),
(240, 19, 19, '2024-03-04', '2024-03-04'),
(241, 19, 19, '2024-03-04', '2024-03-04'),
(242, 19, 19, '2024-03-04', '2024-03-04'),
(243, 19, 19, '2024-03-04', '2024-03-04'),
(244, 19, 19, '2024-03-04', '2024-03-04'),
(245, 19, 19, '2024-03-04', '2024-03-04'),
(246, 19, 19, '2024-03-04', '2024-03-04'),
(247, 19, 20, '2024-03-04', '2024-03-04'),
(248, 19, 20, '2024-03-04', '2024-03-04'),
(249, 19, 20, '2024-03-04', '2024-03-04'),
(250, 19, 20, '2024-03-04', '2024-03-04'),
(251, 19, 20, '2024-03-04', '2024-03-04'),
(252, 20, 19, '2024-03-04', '2024-03-04'),
(253, 20, 19, '2024-03-04', '2024-03-04'),
(254, 20, 19, '2024-03-04', '2024-03-04'),
(255, 20, 19, '2024-03-04', '2024-03-04'),
(256, 20, 19, '2024-03-04', '2024-03-04'),
(257, 20, 19, '2024-03-04', '2024-03-04'),
(258, 20, 19, '2024-03-04', '2024-03-04'),
(259, 20, 19, '2024-03-04', '2024-03-04'),
(260, 20, 20, '2024-03-04', '2024-03-04'),
(261, 20, 20, '2024-03-04', '2024-03-04'),
(262, 20, 20, '2024-03-04', '2024-03-04'),
(263, 20, 20, '2024-03-04', '2024-03-04'),
(264, 20, 20, '2024-03-04', '2024-03-04'),
(265, 21, 19, '2024-03-04', '2024-03-04'),
(266, 21, 19, '2024-03-04', '2024-03-04'),
(267, 21, 19, '2024-03-04', '2024-03-04'),
(268, 21, 19, '2024-03-04', '2024-03-04'),
(269, 21, 19, '2024-03-04', '2024-03-04'),
(270, 21, 19, '2024-03-04', '2024-03-04'),
(271, 21, 19, '2024-03-04', '2024-03-04'),
(272, 21, 19, '2024-03-04', '2024-03-04'),
(273, 21, 20, '2024-03-04', '2024-03-04'),
(274, 21, 20, '2024-03-04', '2024-03-04'),
(275, 21, 20, '2024-03-04', '2024-03-04'),
(276, 21, 20, '2024-03-04', '2024-03-04'),
(277, 21, 20, '2024-03-04', '2024-03-04'),
(278, 22, 19, '2024-03-04', '2024-03-04'),
(279, 22, 19, '2024-03-04', '2024-03-04'),
(280, 22, 19, '2024-03-04', '2024-03-04'),
(281, 22, 19, '2024-03-04', '2024-03-04'),
(282, 22, 19, '2024-03-04', '2024-03-04'),
(283, 22, 19, '2024-03-04', '2024-03-04'),
(284, 22, 19, '2024-03-04', '2024-03-04'),
(285, 22, 19, '2024-03-04', '2024-03-04'),
(286, 22, 20, '2024-03-04', '2024-03-04'),
(287, 22, 20, '2024-03-04', '2024-03-04'),
(288, 22, 20, '2024-03-04', '2024-03-04'),
(289, 22, 20, '2024-03-04', '2024-03-04'),
(290, 22, 20, '2024-03-04', '2024-03-04'),
(291, 23, 18, '2024-03-04', '2024-03-04'),
(292, 23, 18, '2024-03-04', '2024-03-04'),
(293, 23, 18, '2024-03-04', '2024-03-04'),
(294, 23, 18, '2024-03-04', '2024-03-04'),
(295, 23, 18, '2024-03-04', '2024-03-04'),
(296, 23, 1, '2024-03-04', '2024-03-04'),
(297, 23, 1, '2024-03-04', '2024-03-04'),
(298, 23, 1, '2024-03-04', '2024-03-04'),
(299, 23, 1, '2024-03-04', '2024-03-04'),
(300, 23, 1, '2024-03-04', '2024-03-04'),
(301, 24, 18, '2024-03-04', '2024-03-04'),
(302, 24, 18, '2024-03-04', '2024-03-04'),
(303, 24, 18, '2024-03-04', '2024-03-04'),
(304, 24, 18, '2024-03-04', '2024-03-04'),
(305, 24, 18, '2024-03-04', '2024-03-04'),
(306, 24, 1, '2024-03-04', '2024-03-04'),
(307, 24, 1, '2024-03-04', '2024-03-04'),
(308, 24, 1, '2024-03-04', '2024-03-04'),
(309, 24, 1, '2024-03-04', '2024-03-04'),
(310, 24, 1, '2024-03-04', '2024-03-04'),
(311, 25, 19, '2024-03-04', '2024-03-04'),
(312, 25, 19, '2024-03-04', '2024-03-04'),
(313, 25, 19, '2024-03-04', '2024-03-04'),
(314, 25, 19, '2024-03-04', '2024-03-04'),
(315, 25, 19, '2024-03-04', '2024-03-04'),
(316, 25, 18, '2024-03-04', '2024-03-04'),
(317, 25, 18, '2024-03-04', '2024-03-04'),
(318, 25, 18, '2024-03-04', '2024-03-04'),
(319, 25, 18, '2024-03-04', '2024-03-04'),
(320, 25, 20, '2024-03-04', '2024-03-04'),
(321, 25, 20, '2024-03-04', '2024-03-04'),
(322, 26, 19, '2024-03-04', '2024-03-04'),
(323, 26, 19, '2024-03-04', '2024-03-04'),
(324, 26, 19, '2024-03-04', '2024-03-04'),
(325, 26, 19, '2024-03-04', '2024-03-04'),
(326, 26, 19, '2024-03-04', '2024-03-04'),
(327, 26, 18, '2024-03-04', '2024-03-04'),
(328, 26, 18, '2024-03-04', '2024-03-04'),
(329, 26, 18, '2024-03-04', '2024-03-04'),
(330, 26, 18, '2024-03-04', '2024-03-04'),
(331, 26, 20, '2024-03-04', '2024-03-04'),
(332, 26, 20, '2024-03-04', '2024-03-04'),
(333, 27, 19, '2024-03-04', '2024-03-04'),
(334, 27, 19, '2024-03-04', '2024-03-04'),
(335, 27, 19, '2024-03-04', '2024-03-04'),
(336, 27, 19, '2024-03-04', '2024-03-04'),
(337, 27, 19, '2024-03-04', '2024-03-04'),
(338, 27, 18, '2024-03-04', '2024-03-04'),
(339, 27, 18, '2024-03-04', '2024-03-04'),
(340, 27, 18, '2024-03-04', '2024-03-04'),
(341, 27, 18, '2024-03-04', '2024-03-04'),
(342, 27, 20, '2024-03-04', '2024-03-04'),
(343, 27, 20, '2024-03-04', '2024-03-04'),
(344, 28, 19, '2024-03-04', '2024-03-04'),
(345, 28, 19, '2024-03-04', '2024-03-04'),
(346, 28, 19, '2024-03-04', '2024-03-04'),
(347, 28, 19, '2024-03-04', '2024-03-04'),
(348, 28, 19, '2024-03-04', '2024-03-04'),
(349, 28, 18, '2024-03-04', '2024-03-04'),
(350, 28, 18, '2024-03-04', '2024-03-04'),
(351, 28, 18, '2024-03-04', '2024-03-04'),
(352, 28, 18, '2024-03-04', '2024-03-04'),
(353, 28, 20, '2024-03-04', '2024-03-04'),
(354, 28, 20, '2024-03-04', '2024-03-04'),
(355, 29, 19, '2024-03-04', '2024-03-04'),
(356, 29, 19, '2024-03-04', '2024-03-04'),
(357, 29, 19, '2024-03-04', '2024-03-04'),
(358, 29, 19, '2024-03-04', '2024-03-04'),
(359, 29, 19, '2024-03-04', '2024-03-04'),
(360, 29, 19, '2024-03-04', '2024-03-04'),
(361, 29, 19, '2024-03-04', '2024-03-04'),
(362, 29, 19, '2024-03-04', '2024-03-04'),
(363, 29, 20, '2024-03-04', '2024-03-04'),
(364, 29, 20, '2024-03-04', '2024-03-04'),
(365, 29, 20, '2024-03-04', '2024-03-04'),
(366, 29, 20, '2024-03-04', '2024-03-04'),
(367, 30, 19, '2024-03-04', '2024-03-04'),
(368, 30, 19, '2024-03-04', '2024-03-04'),
(369, 30, 19, '2024-03-04', '2024-03-04'),
(370, 30, 19, '2024-03-04', '2024-03-04'),
(371, 30, 19, '2024-03-04', '2024-03-04'),
(372, 30, 19, '2024-03-04', '2024-03-04'),
(373, 30, 19, '2024-03-04', '2024-03-04'),
(374, 30, 19, '2024-03-04', '2024-03-04'),
(375, 30, 20, '2024-03-04', '2024-03-04'),
(376, 30, 20, '2024-03-04', '2024-03-04'),
(377, 30, 20, '2024-03-04', '2024-03-04'),
(378, 30, 20, '2024-03-04', '2024-03-04'),
(379, 31, 19, '2024-03-04', '2024-03-04'),
(380, 31, 19, '2024-03-04', '2024-03-04'),
(381, 31, 19, '2024-03-04', '2024-03-04'),
(382, 31, 19, '2024-03-04', '2024-03-04'),
(383, 31, 19, '2024-03-04', '2024-03-04'),
(384, 31, 19, '2024-03-04', '2024-03-04'),
(385, 31, 19, '2024-03-04', '2024-03-04'),
(386, 31, 19, '2024-03-04', '2024-03-04'),
(387, 31, 20, '2024-03-04', '2024-03-04'),
(388, 31, 20, '2024-03-04', '2024-03-04'),
(389, 31, 20, '2024-03-04', '2024-03-04'),
(390, 31, 20, '2024-03-04', '2024-03-04'),
(391, 32, 19, '2024-03-04', '2024-03-04'),
(392, 32, 19, '2024-03-04', '2024-03-04'),
(393, 32, 19, '2024-03-04', '2024-03-04'),
(394, 32, 19, '2024-03-04', '2024-03-04'),
(395, 32, 19, '2024-03-04', '2024-03-04'),
(396, 32, 19, '2024-03-04', '2024-03-04'),
(397, 32, 19, '2024-03-04', '2024-03-04'),
(398, 32, 19, '2024-03-04', '2024-03-04'),
(399, 32, 20, '2024-03-04', '2024-03-04'),
(400, 32, 20, '2024-03-04', '2024-03-04'),
(401, 32, 20, '2024-03-04', '2024-03-04'),
(402, 32, 20, '2024-03-04', '2024-03-04'),
(403, 33, 19, '2024-03-04', '2024-03-04'),
(404, 33, 19, '2024-03-04', '2024-03-04'),
(405, 33, 19, '2024-03-04', '2024-03-04'),
(406, 33, 19, '2024-03-04', '2024-03-04'),
(407, 33, 19, '2024-03-04', '2024-03-04'),
(408, 33, 19, '2024-03-04', '2024-03-04'),
(409, 33, 19, '2024-03-04', '2024-03-04'),
(410, 33, 19, '2024-03-04', '2024-03-04'),
(411, 33, 20, '2024-03-04', '2024-03-04'),
(412, 33, 20, '2024-03-04', '2024-03-04'),
(413, 33, 20, '2024-03-04', '2024-03-04'),
(414, 33, 20, '2024-03-04', '2024-03-04'),
(415, 34, 20, '2024-03-04', '2024-03-04'),
(416, 35, 20, '2024-03-04', '2024-03-04'),
(417, 36, 20, '2024-03-04', '2024-03-04'),
(418, 37, 20, '2024-03-04', '2024-03-04'),
(419, 38, 20, '2024-03-04', '2024-03-04'),
(420, 39, 20, '2024-03-04', '2024-03-04'),
(421, 40, 20, '2024-03-04', '2024-03-04'),
(422, 41, 20, '2024-03-04', '2024-03-04'),
(423, 42, 20, '2024-03-04', '2024-03-04'),
(424, 43, 20, '2024-03-04', '2024-03-04'),
(425, 44, 20, '2024-03-04', '2024-03-04'),
(426, 45, 20, '2024-03-09', '2024-03-09'),
(427, 46, 19, '2024-03-09', '2024-03-09'),
(428, 50, 1, '2024-04-17', '2024-04-17'),
(429, 54, 19, '2024-05-04', '2024-05-04'),
(430, 10, 19, '2024-05-04', '2024-05-04'),
(431, 10, 20, '2024-05-04', '2024-05-04'),
(432, 10, 21, '2024-05-04', '2024-05-04'),
(433, 12, 19, '2024-05-14', '2024-05-14'),
(434, 12, 19, '2024-05-18', '2024-05-18'),
(435, 12, 19, '2024-05-18', '2024-05-18'),
(436, 63, 20, '2024-05-25', '2024-05-25'),
(437, 65, 19, '2024-05-28', '2024-05-28'),
(438, 66, 19, '2024-05-28', '2024-05-28'),
(439, 67, 19, '2024-05-28', '2024-05-28'),
(440, 68, 19, '2024-05-28', '2024-05-28'),
(441, 69, 19, '2024-05-28', '2024-05-28'),
(442, 70, 19, '2024-05-28', '2024-05-28'),
(443, 71, 19, '2024-05-28', '2024-05-28'),
(444, 72, 19, '2024-05-28', '2024-05-28'),
(445, 73, 19, '2024-05-28', '2024-05-28'),
(446, 74, 20, '2024-05-29', '2024-05-29'),
(447, 75, 20, '2024-05-29', '2024-05-29'),
(448, 76, 18, '2024-06-01', '2024-06-01'),
(449, 77, 18, '2024-06-01', '2024-06-01'),
(450, 78, 18, '2024-06-01', '2024-06-01'),
(451, 79, 18, '2024-06-01', '2024-06-01'),
(452, 80, 18, '2024-06-01', '2024-06-01'),
(453, 81, 18, '2024-06-01', '2024-06-01'),
(454, 82, 18, '2024-06-01', '2024-06-01'),
(455, 83, 18, '2024-06-01', '2024-06-01'),
(456, 84, 18, '2024-06-01', '2024-06-01'),
(457, 85, 18, '2024-06-01', '2024-06-01'),
(458, 86, 18, '2024-06-01', '2024-06-01'),
(459, 87, 18, '2024-06-01', '2024-06-01'),
(460, 88, 18, '2024-06-01', '2024-06-01'),
(461, 89, 18, '2024-06-01', '2024-06-01'),
(462, 90, 18, '2024-06-01', '2024-06-01'),
(463, 91, 18, '2024-06-01', '2024-06-01'),
(464, 92, 20, '2024-06-04', '2024-06-04'),
(465, 93, 18, '2024-06-04', '2024-06-04'),
(466, 94, 19, '2024-06-05', '2024-06-05'),
(467, 95, 19, '2024-06-05', '2024-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `diagnostic_exams`
--

CREATE TABLE `diagnostic_exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `pass_score` float NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `score_id` bigint(20) UNSIGNED DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diagnostic_exams`
--

INSERT INTO `diagnostic_exams` (`id`, `title`, `description`, `time`, `score`, `pass_score`, `course_id`, `score_id`, `state`, `created_at`, `updated_at`) VALUES
(10, 'sad', 'asd', 'Hours  M', 100, 48, 1, 4, 0, '2024-01-24', '2024-03-26'),
(12, 'ggggg', 'ggggg', '1Hours 1 M', 100, 48, 1, 4, 0, '2024-02-03', '2024-02-03'),
(13, 'sasasasasasasa', 'sasasa', '1Hours 1 M', 100, 40, 1, 4, 0, '2024-02-15', '2024-02-15'),
(14, 'asddsa', 'asds', '1Hours 2 M', 100, 21, 1, 4, 0, '2024-03-04', '2024-03-04'),
(15, 'asddsa', 'asds', '1Hours 2 M', 100, 21, 1, 4, 0, '2024-03-04', '2024-03-04'),
(16, 'asddsa', 'asds', '1Hours 2 M', 100, 21, 1, 4, 1, '2024-03-04', '2024-03-04'),
(17, 'scdas', 'asd', '1Hours 1 M', 100, 8, 1, 4, 1, '2024-03-04', '2024-03-04'),
(18, 'adf', 'asd', 'Hours  M', 100, 22, 1, 4, 1, '2024-03-04', '2024-03-04'),
(19, 'ssad', 'ss', '1Hours 1 M', 100, 48, 1, 4, 1, '2024-03-09', '2024-03-09'),
(20, 'nnnnn', 'nnnnn', '1Hours 1 M', 100, 40, 1, 4, 1, '2024-03-31', '2024-03-31'),
(21, 'nnnnnnn', 'nnnnnnnnn', '1Hours 1 M', 100, 48, 1, 4, 1, '2024-03-31', '2024-03-31'),
(23, 'sdf', 'dsf', '1Hours 1 M', 1001, 40, 1, 4, 1, '2024-05-11', '2024-05-11'),
(24, 'dddd', 'dddd', '1Hours 1 M', 100, 40, 1, 2, 0, '2024-05-25', '2024-05-25'),
(25, 'das', 'asd', 'Hours  M', 100, 40, 1, 2, 1, '2024-06-03', '2024-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `diagnostic_exams_history`
--

CREATE TABLE `diagnostic_exams_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `diagnostic_exams_id` bigint(20) UNSIGNED NOT NULL,
  `score` int(11) NOT NULL,
  `time` varchar(255) DEFAULT NULL,
  `r_questions` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diagnostic_exams_history`
--

INSERT INTO `diagnostic_exams_history` (`id`, `user_id`, `diagnostic_exams_id`, `score`, `time`, `r_questions`, `date`, `created_at`, `updated_at`) VALUES
(1, 8, 10, 0, NULL, 0, NULL, '2024-03-03', '2024-03-03'),
(2, 8, 10, 0, NULL, 0, NULL, '2024-03-03', '2024-03-03'),
(3, 8, 10, 0, NULL, 0, NULL, '2024-03-03', '2024-03-03'),
(4, 8, 10, 0, NULL, 0, NULL, '2024-03-03', '2024-03-03'),
(5, 8, 10, 0, NULL, 0, NULL, '2024-03-03', '2024-03-03'),
(6, 8, 10, 0, NULL, 0, NULL, '2024-03-03', '2024-03-03'),
(7, 8, 10, 0, NULL, 0, NULL, '2024-03-03', '2024-03-03'),
(8, 8, 10, 0, NULL, 0, NULL, '2024-03-03', '2024-03-03'),
(9, 8, 10, 0, NULL, 0, NULL, '2024-03-03', '2024-03-03'),
(10, 8, 10, 0, NULL, 0, NULL, '2024-03-03', '2024-03-03'),
(11, 8, 10, 0, NULL, 0, NULL, '2024-03-03', '2024-03-03'),
(12, 8, 10, 0, NULL, 0, NULL, '2024-03-03', '2024-03-03'),
(13, 8, 10, 0, NULL, 0, NULL, '2024-03-03', '2024-03-03'),
(14, 8, 10, 0, NULL, 0, NULL, '2024-03-03', '2024-03-03'),
(15, 8, 10, 0, NULL, 0, NULL, '2024-03-03', '2024-03-03'),
(16, 8, 10, 0, NULL, 0, NULL, '2024-03-03', '2024-03-03'),
(17, 8, 10, 0, NULL, 0, NULL, '2024-03-03', '2024-03-03'),
(18, 8, 12, 3, NULL, 2, NULL, '2024-03-04', '2024-03-04'),
(19, 8, 12, 3, NULL, 2, NULL, '2024-03-04', '2024-03-04'),
(20, 8, 12, 3, NULL, 2, NULL, '2024-03-04', '2024-03-04'),
(21, 8, 12, 3, NULL, 2, NULL, '2024-03-04', '2024-03-04'),
(22, 8, 12, 3, NULL, 2, NULL, '2024-03-04', '2024-03-04'),
(23, 8, 13, 0, NULL, 0, NULL, '2024-03-04', '2024-03-04'),
(24, 8, 13, 0, NULL, 0, NULL, '2024-03-04', '2024-03-04'),
(25, 8, 16, 5, NULL, 4, NULL, '2024-03-04', '2024-03-04'),
(26, 8, 16, 5, NULL, 4, NULL, '2024-03-04', '2024-03-04'),
(27, 8, 16, 5, NULL, 4, NULL, '2024-03-04', '2024-03-04'),
(28, 8, 16, 5, NULL, 4, NULL, '2024-03-04', '2024-03-04'),
(29, 8, 12, 4, NULL, 3, NULL, '2024-03-04', '2024-03-04'),
(30, 8, 12, 4, NULL, 3, NULL, '2024-03-04', '2024-03-04'),
(31, 8, 12, 4, NULL, 3, NULL, '2024-03-04', '2024-03-04'),
(32, 8, 12, 4, NULL, 3, NULL, '2024-03-04', '2024-03-04'),
(33, 8, 12, 4, NULL, 3, NULL, '2024-03-04', '2024-03-04'),
(34, 8, 12, 4, NULL, 3, NULL, '2024-03-04', '2024-03-04'),
(35, 8, 12, 2, NULL, 1, NULL, '2024-03-04', '2024-03-04'),
(36, 8, 12, 2, NULL, 1, NULL, '2024-03-04', '2024-03-04'),
(37, 8, 12, 2, NULL, 1, NULL, '2024-03-04', '2024-03-04'),
(38, 8, 12, 2, NULL, 1, NULL, '2024-03-04', '2024-03-04'),
(39, 8, 12, 2, NULL, 1, NULL, '2024-03-04', '2024-03-04'),
(40, 8, 12, 2, NULL, 1, NULL, '2024-03-04', '2024-03-04'),
(41, 8, 12, 2, NULL, 1, NULL, '2024-03-04', '2024-03-04'),
(42, 8, 12, 2, NULL, 1, NULL, '2024-03-04', '2024-03-04'),
(43, 8, 12, 2, NULL, 1, NULL, '2024-03-04', '2024-03-04'),
(44, 8, 12, 2, NULL, 1, NULL, '2024-03-04', '2024-03-04'),
(45, 8, 12, 2, NULL, 1, '2024-03-09', '2024-03-09', '2024-03-09'),
(46, 8, 10, 2, NULL, 1, '2024-03-09', '2024-03-09', '2024-03-09'),
(47, 8, 14, 2, NULL, 1, '2024-03-20', '2024-03-20', '2024-03-20'),
(48, 8, 14, 2, NULL, 1, '2024-03-20', '2024-03-20', '2024-03-20'),
(49, 8, 18, 2, NULL, 1, '2024-04-17', '2024-04-17', '2024-04-17'),
(50, 8, 15, 0, NULL, 0, '2024-04-17', '2024-04-17', '2024-04-17'),
(51, 8, 10, 5, '22', 5, '2024-04-25', '2024-04-25', '2024-04-25'),
(52, 8, 10, 5, '22', 5, '2024-04-25', '2024-04-25', '2024-04-25'),
(53, 8, 10, 5, '22', 5, '2024-04-25', '2024-04-25', '2024-04-25'),
(54, 8, 20, 0, NULL, 0, '2024-05-04', '2024-05-04', '2024-05-04'),
(55, 8, 10, 5, '5', 5, '2024-05-04', '2024-05-04', '2024-05-04'),
(56, 8, 10, 5, '5', 5, '2024-05-04', '2024-05-04', '2024-05-04'),
(57, 8, 12, 2, '88', 1, '2024-05-14', '2024-05-14', '2024-05-14'),
(58, 8, 19, 5, NULL, 4, '2024-05-17', '2024-05-17', '2024-05-17'),
(59, 8, 12, 2, '88', 1, '2024-05-18', '2024-05-18', '2024-05-18'),
(60, 8, 12, 2, '88', 1, '2024-05-18', '2024-05-18', '2024-05-18'),
(61, 8, 19, 5, NULL, 4, '2024-05-18', '2024-05-18', '2024-05-18'),
(62, 8, 19, 5, NULL, 4, '2024-05-25', '2024-05-25', '2024-05-25'),
(63, 8, 18, 0, NULL, 0, '2024-05-25', '2024-05-25', '2024-05-25'),
(64, 8, 21, 2, NULL, 1, '2024-05-28', '2024-05-28', '2024-05-28'),
(65, 8, 21, 0, NULL, 0, '2024-05-28', '2024-05-28', '2024-05-28'),
(66, 8, 21, 0, NULL, 0, '2024-05-28', '2024-05-28', '2024-05-28'),
(67, 8, 21, 0, NULL, 0, '2024-05-28', '2024-05-28', '2024-05-28'),
(68, 8, 21, 0, NULL, 0, '2024-05-28', '2024-05-28', '2024-05-28'),
(69, 8, 21, 0, NULL, 0, '2024-05-28', '2024-05-28', '2024-05-28'),
(70, 8, 21, 0, NULL, 0, '2024-05-28', '2024-05-28', '2024-05-28'),
(71, 8, 21, 0, NULL, 0, '2024-05-28', '2024-05-28', '2024-05-28'),
(72, 8, 21, 0, NULL, 0, '2024-05-28', '2024-05-28', '2024-05-28'),
(73, 8, 21, 0, NULL, 0, '2024-05-28', '2024-05-28', '2024-05-28'),
(74, 8, 18, 0, NULL, 0, '2024-05-29', '2024-05-29', '2024-05-29'),
(75, 8, 18, 0, NULL, 0, '2024-05-29', '2024-05-29', '2024-05-29'),
(76, 8, 17, 0, NULL, 0, '2024-06-01', '2024-06-01', '2024-06-01'),
(77, 8, 17, 0, NULL, 0, '2024-06-01', '2024-06-01', '2024-06-01'),
(78, 8, 17, 0, NULL, 0, '2024-06-01', '2024-06-01', '2024-06-01'),
(79, 8, 17, 0, NULL, 0, '2024-06-01', '2024-06-01', '2024-06-01'),
(80, 8, 17, 0, NULL, 0, '2024-06-01', '2024-06-01', '2024-06-01'),
(81, 8, 17, 0, NULL, 0, '2024-06-01', '2024-06-01', '2024-06-01'),
(82, 8, 17, 0, NULL, 0, '2024-06-01', '2024-06-01', '2024-06-01'),
(83, 8, 17, 0, NULL, 0, '2024-06-01', '2024-06-01', '2024-06-01'),
(84, 8, 17, 0, NULL, 0, '2024-06-01', '2024-06-01', '2024-06-01'),
(85, 8, 17, 0, NULL, 0, '2024-06-01', '2024-06-01', '2024-06-01'),
(86, 8, 17, 0, NULL, 0, '2024-06-01', '2024-06-01', '2024-06-01'),
(87, 8, 17, 0, NULL, 0, '2024-06-01', '2024-06-01', '2024-06-01'),
(88, 8, 17, 0, NULL, 0, '2024-06-01', '2024-06-01', '2024-06-01'),
(89, 8, 17, 0, NULL, 0, '2024-06-01', '2024-06-01', '2024-06-01'),
(90, 8, 17, 0, NULL, 0, '2024-06-01', '2024-06-01', '2024-06-01'),
(91, 8, 17, 0, NULL, 0, '2024-06-01', '2024-06-01', '2024-06-01'),
(92, 8, 19, 200, NULL, 0, '2024-06-04', '2024-06-04', '2024-06-04'),
(93, 8, 17, 200, NULL, 0, '2024-06-04', '2024-06-04', '2024-06-04'),
(94, 8, 21, 200, NULL, 0, '2024-06-05', '2024-06-05', '2024-06-05'),
(95, 8, 21, 200, NULL, 0, '2024-06-05', '2024-06-05', '2024-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `dia_questions`
--

CREATE TABLE `dia_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `diagnostic_exam_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dia_questions`
--

INSERT INTO `dia_questions` (`id`, `diagnostic_exam_id`, `question_id`, `created_at`, `updated_at`) VALUES
(14, 12, 19, '2024-02-03', '2024-02-03'),
(15, 12, 20, '2024-02-03', '2024-02-03'),
(16, 13, 1, '2024-02-15', '2024-02-15'),
(17, 13, 18, '2024-02-15', '2024-02-15'),
(18, 16, 20, '2024-03-04', '2024-03-04'),
(19, 16, 19, '2024-03-04', '2024-03-04'),
(20, 14, 18, '2024-03-04', '2024-03-04'),
(21, 15, 1, '2024-03-04', '2024-03-04'),
(22, 17, 18, '2024-03-04', '2024-03-04'),
(25, 19, 1, '2024-03-09', '2024-03-09'),
(26, 19, 18, '2024-03-09', '2024-03-09'),
(27, 21, 19, '2024-03-09', '2024-03-09'),
(28, 18, 20, '2024-03-09', '2024-03-09'),
(29, 19, 21, '2024-03-09', '2024-03-09'),
(30, 19, 20, '2024-03-09', '2024-03-09'),
(31, 20, 19, '2024-03-09', '2024-03-09'),
(36, 10, 21, '2024-03-26', '2024-03-26'),
(37, 10, 20, '2024-03-26', '2024-03-26'),
(46, 23, 1, '2024-05-11', '2024-05-11'),
(47, 23, 1, '2024-05-11', '2024-05-11'),
(48, 23, 1, '2024-05-11', '2024-05-11'),
(53, 24, 28, '2024-05-25', '2024-05-25'),
(54, 24, 27, '2024-05-25', '2024-05-25'),
(55, 24, 1, '2024-05-25', '2024-05-25'),
(56, 24, 18, '2024-05-25', '2024-05-25'),
(57, 25, 21, '2024-06-03', '2024-06-03'),
(58, 25, 25, '2024-06-03', '2024-06-03');

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `pass_score` int(11) NOT NULL,
  `year` year(4) DEFAULT NULL,
  `month` int(10) UNSIGNED DEFAULT NULL,
  `code_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `score_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('extra','trail') NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`id`, `title`, `description`, `time`, `score`, `pass_score`, `year`, `month`, `code_id`, `course_id`, `score_id`, `type`, `state`, `created_at`, `updated_at`) VALUES
(2, 'Exam 1', '111', '11:37:22', 111, 11, '2024', 3, 2, 2, 4, 'extra', 1, NULL, '2024-03-26'),
(4, 'dcf', 'fdsf', '1Hours 1 M', 100, 21, '2011', NULL, NULL, 1, 4, 'trail', 1, '2024-03-05', '2024-03-26'),
(5, 'nnnnnn', 'nnnnnn', '1Hours 1 M', 100, 48, NULL, NULL, NULL, 1, 2, 'extra', 1, '2024-03-31', '2024-03-31'),
(6, 'xzvc', 'dxf', '1Hours 1 M', 100, 40, NULL, NULL, NULL, 1, 2, 'extra', 1, '2024-03-31', '2024-03-31'),
(7, 'vvv', 'vv', '1Hours 1 M', 100, 48, NULL, NULL, NULL, 1, 2, 'extra', 1, '2024-03-31', '2024-03-31'),
(8, 'sa', 'asd', '1Hours 1 M', 100, 48, NULL, NULL, NULL, 1, 2, 'extra', 1, '2024-03-31', '2024-03-31'),
(9, 'llll', 'llll', '1Hours 1 M', 100, 48, NULL, NULL, NULL, 1, 2, 'extra', 1, '2024-03-31', '2024-03-31'),
(10, 'wef', 'fwf', '1Hours 1 M', 100, 40, NULL, NULL, NULL, 1, 2, 'trail', 1, '2024-04-24', '2024-04-24'),
(11, 'Exam 1', 'asd', '1Hours 1 M', 100, 48, NULL, NULL, NULL, 1, 2, 'trail', 1, '2024-05-01', '2024-05-01'),
(12, 'Exam 25', 'Exam 25', '1Hours 1 M', 101, 45, NULL, NULL, NULL, 1, 2, 'trail', 1, '2024-05-14', '2024-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `exam_codes`
--

CREATE TABLE `exam_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_code` varchar(255) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `exam_codes`
--

INSERT INTO `exam_codes` (`id`, `exam_code`, `created_at`, `updated_at`) VALUES
(2, '1234', '2024-01-24', '2024-03-02'),
(3, '765', '2024-04-01', '2024-04-01');

-- --------------------------------------------------------

--
-- Table structure for table `exam_history`
--

CREATE TABLE `exam_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `score` int(11) NOT NULL,
  `time` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `r_questions` int(11) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam_history`
--

INSERT INTO `exam_history` (`id`, `user_id`, `exam_id`, `score`, `time`, `date`, `r_questions`, `created_at`, `updated_at`) VALUES
(1, 8, 2, 2, NULL, '2024-03-06', 1, '2024-03-06', '2024-03-06'),
(2, 8, 2, 2, NULL, '2024-03-06', 1, '2024-03-06', '2024-03-06'),
(3, 8, 2, 2, NULL, '2024-03-06', 1, '2024-03-06', '2024-03-06'),
(4, 8, 2, 2, NULL, '2024-03-06', 1, '2024-03-06', '2024-03-06'),
(5, 8, 2, 2, NULL, '2024-03-06', 1, '2024-03-06', '2024-03-06'),
(6, 8, 2, 2, NULL, '2024-03-06', 1, '2024-03-06', '2024-03-06'),
(7, 8, 2, 2, NULL, '2024-03-06', 1, '2024-03-06', '2024-03-06'),
(8, 8, 2, 2, NULL, '2024-03-06', 1, '2024-03-06', '2024-03-06'),
(9, 8, 2, 2, NULL, '2024-03-06', 1, '2024-03-06', '2024-03-06'),
(10, 8, 2, 2, NULL, '2024-03-09', 1, '2024-03-09', '2024-03-09'),
(11, 8, 2, 0, NULL, '2024-04-04', 0, '2024-04-04', '2024-04-04'),
(12, 8, 2, 0, NULL, '2024-04-04', 0, '2024-04-04', '2024-04-04'),
(13, 8, 2, 0, NULL, '2024-04-04', 0, '2024-04-04', '2024-04-04'),
(14, 8, 2, 5, 22, '2024-04-22', 5, '2024-04-22', '2024-04-22'),
(15, 8, 2, 5, 22, '2024-04-22', 5, '2024-04-22', '2024-04-22'),
(16, 8, 2, 5, 22, '2024-04-22', 5, '2024-04-22', '2024-04-22'),
(17, 8, 2, 5, 22, '2024-04-22', 5, '2024-04-22', '2024-04-22'),
(18, 8, 2, 5, 22, '2024-04-22', 5, '2024-04-22', '2024-04-22'),
(19, 8, 2, 5, 12, '2024-04-29', 4, '2024-04-29', '2024-04-29'),
(20, 8, 2, 5, 12, '2024-04-29', 4, '2024-04-29', '2024-04-29'),
(21, 8, 2, 5, 12, '2024-04-29', 4, '2024-04-29', '2024-04-29'),
(22, 8, 2, 5, 12, '2024-04-29', 4, '2024-04-29', '2024-04-29'),
(23, 8, 4, 4, 4, '2024-05-01', 3, '2024-05-01', '2024-05-01'),
(24, 8, 4, 4, 4, '2024-05-01', 3, '2024-05-01', '2024-05-01'),
(25, 8, 4, 4, 4, '2024-05-01', 3, '2024-05-01', '2024-05-01'),
(26, 8, 4, 4, 4, '2024-05-01', 3, '2024-05-01', '2024-05-01'),
(27, 8, 4, 4, 4, '2024-05-01', 3, '2024-05-01', '2024-05-01'),
(28, 8, 4, 4, 4, '2024-05-01', 3, '2024-05-01', '2024-05-01'),
(29, 8, 4, 4, 4, '2024-05-01', 3, '2024-05-01', '2024-05-01'),
(30, 8, 4, 4, 4, '2024-05-18', 3, '2024-05-18', '2024-05-18'),
(31, 8, 4, 4, 4, '2024-05-18', 3, '2024-05-18', '2024-05-18'),
(32, 8, 2, 4, NULL, '2024-05-25', 3, '2024-05-25', '2024-05-25'),
(33, 8, 2, 5, NULL, '2024-05-25', 4, '2024-05-25', '2024-05-25'),
(34, 8, 2, 4, NULL, '2024-05-28', 3, '2024-05-28', '2024-05-28'),
(35, 8, 2, 3, NULL, '2024-05-28', 2, '2024-05-28', '2024-05-28'),
(36, 8, 2, 3, NULL, '2024-05-29', 2, '2024-05-29', '2024-05-29'),
(37, 8, 2, 3, NULL, '2024-05-29', 2, '2024-05-29', '2024-05-29'),
(38, 8, 2, 3, NULL, '2024-05-29', 2, '2024-05-29', '2024-05-29'),
(39, 8, 2, 3, NULL, '2024-05-29', 2, '2024-05-29', '2024-05-29'),
(40, 8, 2, 3, NULL, '2024-05-29', 2, '2024-05-29', '2024-05-29'),
(41, 8, 2, 3, NULL, '2024-05-29', 2, '2024-05-29', '2024-05-29'),
(42, 8, 2, 3, NULL, '2024-05-29', 2, '2024-05-29', '2024-05-29'),
(43, 8, 2, 3, NULL, '2024-05-29', 2, '2024-05-29', '2024-05-29'),
(44, 8, 2, 3, NULL, '2024-05-29', 2, '2024-05-29', '2024-05-29'),
(45, 8, 2, 3, NULL, '2024-05-29', 2, '2024-05-29', '2024-05-29'),
(46, 8, 2, 3, NULL, '2024-05-29', 2, '2024-05-29', '2024-05-29'),
(47, 8, 2, 3, NULL, '2024-05-29', 2, '2024-05-29', '2024-05-29'),
(48, 8, 2, 3, NULL, '2024-05-29', 2, '2024-05-29', '2024-05-29'),
(49, 8, 2, 3, NULL, '2024-05-29', 2, '2024-05-29', '2024-05-29'),
(50, 8, 2, 3, NULL, '2024-05-29', 2, '2024-05-29', '2024-05-29'),
(51, 8, 2, 4, NULL, '2024-05-30', 3, '2024-05-30', '2024-05-30'),
(52, 8, 2, 4, NULL, '2024-05-30', 3, '2024-05-30', '2024-05-30'),
(53, 8, 2, 4, NULL, '2024-05-30', 3, '2024-05-30', '2024-05-30'),
(54, 8, 2, 0, NULL, '2024-06-04', 0, '2024-06-04', '2024-06-04'),
(55, 8, 2, 200, NULL, '2024-06-04', 0, '2024-06-04', '2024-06-04'),
(56, 8, 2, 200, NULL, '2024-06-04', 0, '2024-06-04', '2024-06-04'),
(57, 8, 2, 200, NULL, '2024-06-04', 0, '2024-06-04', '2024-06-04'),
(58, 8, 2, 200, NULL, '2024-06-05', 0, '2024-06-05', '2024-06-05'),
(59, 8, 2, 200, NULL, '2024-06-05', 0, '2024-06-05', '2024-06-05'),
(60, 8, 2, 200, NULL, '2024-06-05', 0, '2024-06-05', '2024-06-05'),
(61, 8, 2, 200, NULL, '2024-06-05', 0, '2024-06-05', '2024-06-05'),
(62, 8, 2, 200, NULL, '2024-06-05', 0, '2024-06-05', '2024-06-05'),
(63, 8, 2, 200, NULL, '2024-06-05', 0, '2024-06-05', '2024-06-05'),
(64, 8, 2, 200, NULL, '2024-06-05', 0, '2024-06-05', '2024-06-05'),
(65, 8, 2, 200, NULL, '2024-06-05', 0, '2024-06-05', '2024-06-05'),
(66, 8, 2, 200, NULL, '2024-06-05', 0, '2024-06-05', '2024-06-05'),
(67, 8, 2, 200, NULL, '2024-06-05', 0, '2024-06-05', '2024-06-05'),
(68, 8, 2, 200, NULL, '2024-06-05', 0, '2024-06-05', '2024-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `exam_mistakes`
--

CREATE TABLE `exam_mistakes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_exam_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam_mistakes`
--

INSERT INTO `exam_mistakes` (`id`, `student_exam_id`, `question_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 2, 1, 8, '2024-03-06', '2024-03-06'),
(3, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(4, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(5, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(6, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(7, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(8, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(9, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(10, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(11, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(12, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(13, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(14, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(15, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(16, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(17, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(18, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(19, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(20, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(21, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(22, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(23, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(24, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(25, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(26, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(27, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(28, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(29, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(30, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(31, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(32, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(33, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(34, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(35, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(36, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(37, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(38, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(39, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(40, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(41, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(42, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(43, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(44, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(45, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(46, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(47, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(48, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(49, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(50, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(51, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(52, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(53, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(54, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(55, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(56, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(57, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(58, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(59, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(60, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(61, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(62, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(63, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(64, 2, 19, NULL, '2024-03-06', '2024-03-06'),
(65, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(66, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(67, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(68, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(69, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(70, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(71, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(72, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(73, 2, 1, NULL, '2024-03-06', '2024-03-06'),
(74, 2, 19, NULL, '2024-03-09', '2024-03-09'),
(75, 2, 19, NULL, '2024-03-09', '2024-03-09'),
(76, 2, 1, NULL, '2024-03-09', '2024-03-09'),
(77, 2, 1, NULL, '2024-03-09', '2024-03-09'),
(78, 2, 20, NULL, '2024-03-09', '2024-03-09'),
(79, 2, 19, NULL, '2024-04-04', '2024-04-04'),
(80, 2, 19, NULL, '2024-04-04', '2024-04-04'),
(81, 2, 19, NULL, '2024-04-04', '2024-04-04'),
(82, 2, 18, NULL, '2024-04-04', '2024-04-04'),
(83, 2, 20, NULL, '2024-04-04', '2024-04-04'),
(84, 2, 20, NULL, '2024-04-04', '2024-04-04'),
(85, 2, 19, NULL, '2024-04-04', '2024-04-04'),
(86, 2, 19, NULL, '2024-04-04', '2024-04-04'),
(87, 2, 19, NULL, '2024-04-04', '2024-04-04'),
(88, 2, 18, NULL, '2024-04-04', '2024-04-04'),
(89, 2, 20, NULL, '2024-04-04', '2024-04-04'),
(90, 2, 20, NULL, '2024-04-04', '2024-04-04'),
(91, 2, 19, NULL, '2024-04-04', '2024-04-04'),
(92, 2, 19, NULL, '2024-04-04', '2024-04-04'),
(93, 2, 19, NULL, '2024-04-04', '2024-04-04'),
(94, 2, 18, NULL, '2024-04-04', '2024-04-04'),
(95, 2, 20, NULL, '2024-04-04', '2024-04-04'),
(96, 2, 20, NULL, '2024-04-04', '2024-04-04'),
(97, 4, 19, NULL, '2024-05-01', '2024-05-01'),
(98, 4, 20, NULL, '2024-05-01', '2024-05-01'),
(99, 4, 21, NULL, '2024-05-01', '2024-05-01'),
(100, 4, 19, 8, '2024-05-18', '2024-05-18'),
(101, 4, 20, 8, '2024-05-18', '2024-05-18'),
(102, 4, 19, 8, '2024-05-18', '2024-05-18'),
(103, 4, 20, 8, '2024-05-18', '2024-05-18'),
(104, 32, 19, NULL, '2024-05-25', '2024-05-25'),
(105, 32, 19, NULL, '2024-05-25', '2024-05-25'),
(106, 32, 19, NULL, '2024-05-25', '2024-05-25'),
(107, 33, 20, NULL, '2024-05-25', '2024-05-25'),
(108, 33, 19, NULL, '2024-05-25', '2024-05-25'),
(109, 34, 19, NULL, '2024-05-28', '2024-05-28'),
(110, 34, 20, NULL, '2024-05-28', '2024-05-28'),
(111, 34, 18, NULL, '2024-05-28', '2024-05-28'),
(112, 35, 19, NULL, '2024-05-28', '2024-05-28'),
(113, 35, 20, NULL, '2024-05-28', '2024-05-28'),
(114, 35, 20, NULL, '2024-05-28', '2024-05-28'),
(115, 35, 19, NULL, '2024-05-28', '2024-05-28'),
(116, 36, 19, NULL, '2024-05-29', '2024-05-29'),
(117, 36, 19, NULL, '2024-05-29', '2024-05-29'),
(118, 36, 20, NULL, '2024-05-29', '2024-05-29'),
(119, 36, 18, NULL, '2024-05-29', '2024-05-29'),
(120, 37, 19, NULL, '2024-05-29', '2024-05-29'),
(121, 37, 19, NULL, '2024-05-29', '2024-05-29'),
(122, 37, 20, NULL, '2024-05-29', '2024-05-29'),
(123, 37, 18, NULL, '2024-05-29', '2024-05-29'),
(124, 38, 19, NULL, '2024-05-29', '2024-05-29'),
(125, 38, 19, NULL, '2024-05-29', '2024-05-29'),
(126, 38, 20, NULL, '2024-05-29', '2024-05-29'),
(127, 38, 18, NULL, '2024-05-29', '2024-05-29'),
(128, 39, 19, NULL, '2024-05-29', '2024-05-29'),
(129, 39, 19, NULL, '2024-05-29', '2024-05-29'),
(130, 39, 20, NULL, '2024-05-29', '2024-05-29'),
(131, 39, 18, NULL, '2024-05-29', '2024-05-29'),
(132, 40, 19, NULL, '2024-05-29', '2024-05-29'),
(133, 40, 19, NULL, '2024-05-29', '2024-05-29'),
(134, 40, 20, NULL, '2024-05-29', '2024-05-29'),
(135, 40, 18, NULL, '2024-05-29', '2024-05-29'),
(136, 41, 19, NULL, '2024-05-29', '2024-05-29'),
(137, 41, 19, NULL, '2024-05-29', '2024-05-29'),
(138, 41, 20, NULL, '2024-05-29', '2024-05-29'),
(139, 41, 18, NULL, '2024-05-29', '2024-05-29'),
(140, 42, 19, NULL, '2024-05-29', '2024-05-29'),
(141, 42, 19, NULL, '2024-05-29', '2024-05-29'),
(142, 42, 20, NULL, '2024-05-29', '2024-05-29'),
(143, 42, 18, NULL, '2024-05-29', '2024-05-29'),
(144, 43, 19, NULL, '2024-05-29', '2024-05-29'),
(145, 43, 19, NULL, '2024-05-29', '2024-05-29'),
(146, 43, 20, NULL, '2024-05-29', '2024-05-29'),
(147, 43, 18, NULL, '2024-05-29', '2024-05-29'),
(148, 44, 19, NULL, '2024-05-29', '2024-05-29'),
(149, 44, 19, NULL, '2024-05-29', '2024-05-29'),
(150, 44, 20, NULL, '2024-05-29', '2024-05-29'),
(151, 44, 18, NULL, '2024-05-29', '2024-05-29'),
(152, 45, 19, NULL, '2024-05-29', '2024-05-29'),
(153, 45, 19, NULL, '2024-05-29', '2024-05-29'),
(154, 45, 20, NULL, '2024-05-29', '2024-05-29'),
(155, 45, 18, NULL, '2024-05-29', '2024-05-29'),
(156, 46, 19, NULL, '2024-05-29', '2024-05-29'),
(157, 46, 19, NULL, '2024-05-29', '2024-05-29'),
(158, 46, 20, NULL, '2024-05-29', '2024-05-29'),
(159, 46, 18, NULL, '2024-05-29', '2024-05-29'),
(160, 47, 19, NULL, '2024-05-29', '2024-05-29'),
(161, 47, 19, NULL, '2024-05-29', '2024-05-29'),
(162, 47, 20, NULL, '2024-05-29', '2024-05-29'),
(163, 47, 18, NULL, '2024-05-29', '2024-05-29'),
(164, 48, 19, NULL, '2024-05-29', '2024-05-29'),
(165, 48, 19, NULL, '2024-05-29', '2024-05-29'),
(166, 48, 20, NULL, '2024-05-29', '2024-05-29'),
(167, 48, 18, NULL, '2024-05-29', '2024-05-29'),
(168, 49, 19, NULL, '2024-05-29', '2024-05-29'),
(169, 49, 19, NULL, '2024-05-29', '2024-05-29'),
(170, 49, 20, NULL, '2024-05-29', '2024-05-29'),
(171, 49, 18, NULL, '2024-05-29', '2024-05-29'),
(172, 50, 19, NULL, '2024-05-29', '2024-05-29'),
(173, 50, 19, NULL, '2024-05-29', '2024-05-29'),
(174, 50, 20, NULL, '2024-05-29', '2024-05-29'),
(175, 50, 18, NULL, '2024-05-29', '2024-05-29'),
(176, 51, 19, NULL, '2024-05-30', '2024-05-30'),
(177, 51, 20, NULL, '2024-05-30', '2024-05-30'),
(178, 51, 18, NULL, '2024-05-30', '2024-05-30'),
(179, 52, 19, NULL, '2024-05-30', '2024-05-30'),
(180, 52, 20, NULL, '2024-05-30', '2024-05-30'),
(181, 52, 18, NULL, '2024-05-30', '2024-05-30'),
(182, 53, 19, NULL, '2024-05-30', '2024-05-30'),
(183, 53, 20, NULL, '2024-05-30', '2024-05-30'),
(184, 53, 18, NULL, '2024-05-30', '2024-05-30'),
(185, 54, 19, NULL, '2024-06-04', '2024-06-04'),
(186, 54, 19, NULL, '2024-06-04', '2024-06-04'),
(187, 54, 20, NULL, '2024-06-04', '2024-06-04'),
(188, 54, 20, NULL, '2024-06-04', '2024-06-04'),
(189, 54, 19, NULL, '2024-06-04', '2024-06-04'),
(190, 54, 18, NULL, '2024-06-04', '2024-06-04'),
(191, 55, 19, NULL, '2024-06-04', '2024-06-04'),
(192, 55, 19, NULL, '2024-06-04', '2024-06-04'),
(193, 55, 20, NULL, '2024-06-04', '2024-06-04'),
(194, 55, 20, NULL, '2024-06-04', '2024-06-04'),
(195, 55, 19, NULL, '2024-06-04', '2024-06-04'),
(196, 55, 18, NULL, '2024-06-04', '2024-06-04'),
(197, 56, 19, NULL, '2024-06-04', '2024-06-04'),
(198, 56, 19, NULL, '2024-06-04', '2024-06-04'),
(199, 56, 20, NULL, '2024-06-04', '2024-06-04'),
(200, 56, 20, NULL, '2024-06-04', '2024-06-04'),
(201, 56, 19, NULL, '2024-06-04', '2024-06-04'),
(202, 56, 18, NULL, '2024-06-04', '2024-06-04'),
(203, 57, 19, NULL, '2024-06-04', '2024-06-04'),
(204, 57, 19, NULL, '2024-06-04', '2024-06-04'),
(205, 57, 20, NULL, '2024-06-04', '2024-06-04'),
(206, 57, 20, NULL, '2024-06-04', '2024-06-04'),
(207, 57, 19, NULL, '2024-06-04', '2024-06-04'),
(208, 57, 18, NULL, '2024-06-04', '2024-06-04'),
(209, 58, 19, NULL, '2024-06-05', '2024-06-05'),
(210, 58, 19, NULL, '2024-06-05', '2024-06-05'),
(211, 58, 20, NULL, '2024-06-05', '2024-06-05'),
(212, 58, 20, NULL, '2024-06-05', '2024-06-05'),
(213, 58, 19, NULL, '2024-06-05', '2024-06-05'),
(214, 58, 18, NULL, '2024-06-05', '2024-06-05'),
(215, 59, 19, NULL, '2024-06-05', '2024-06-05'),
(216, 59, 19, NULL, '2024-06-05', '2024-06-05'),
(217, 59, 20, NULL, '2024-06-05', '2024-06-05'),
(218, 59, 20, NULL, '2024-06-05', '2024-06-05'),
(219, 59, 19, NULL, '2024-06-05', '2024-06-05'),
(220, 59, 18, NULL, '2024-06-05', '2024-06-05'),
(221, 60, 19, NULL, '2024-06-05', '2024-06-05'),
(222, 60, 19, NULL, '2024-06-05', '2024-06-05'),
(223, 60, 20, NULL, '2024-06-05', '2024-06-05'),
(224, 60, 20, NULL, '2024-06-05', '2024-06-05'),
(225, 60, 19, NULL, '2024-06-05', '2024-06-05'),
(226, 60, 18, NULL, '2024-06-05', '2024-06-05'),
(227, 61, 19, NULL, '2024-06-05', '2024-06-05'),
(228, 61, 19, NULL, '2024-06-05', '2024-06-05'),
(229, 61, 20, NULL, '2024-06-05', '2024-06-05'),
(230, 61, 20, NULL, '2024-06-05', '2024-06-05'),
(231, 61, 19, NULL, '2024-06-05', '2024-06-05'),
(232, 61, 18, NULL, '2024-06-05', '2024-06-05'),
(233, 62, 19, NULL, '2024-06-05', '2024-06-05'),
(234, 62, 19, NULL, '2024-06-05', '2024-06-05'),
(235, 62, 20, NULL, '2024-06-05', '2024-06-05'),
(236, 62, 20, NULL, '2024-06-05', '2024-06-05'),
(237, 62, 19, NULL, '2024-06-05', '2024-06-05'),
(238, 62, 18, NULL, '2024-06-05', '2024-06-05'),
(239, 63, 19, NULL, '2024-06-05', '2024-06-05'),
(240, 63, 19, NULL, '2024-06-05', '2024-06-05'),
(241, 63, 20, NULL, '2024-06-05', '2024-06-05'),
(242, 63, 20, NULL, '2024-06-05', '2024-06-05'),
(243, 63, 19, NULL, '2024-06-05', '2024-06-05'),
(244, 63, 18, NULL, '2024-06-05', '2024-06-05'),
(245, 64, 19, NULL, '2024-06-05', '2024-06-05'),
(246, 64, 19, NULL, '2024-06-05', '2024-06-05'),
(247, 64, 20, NULL, '2024-06-05', '2024-06-05'),
(248, 64, 20, NULL, '2024-06-05', '2024-06-05'),
(249, 64, 19, NULL, '2024-06-05', '2024-06-05'),
(250, 64, 18, NULL, '2024-06-05', '2024-06-05'),
(251, 65, 19, NULL, '2024-06-05', '2024-06-05'),
(252, 65, 19, NULL, '2024-06-05', '2024-06-05'),
(253, 65, 20, NULL, '2024-06-05', '2024-06-05'),
(254, 65, 20, NULL, '2024-06-05', '2024-06-05'),
(255, 65, 19, NULL, '2024-06-05', '2024-06-05'),
(256, 65, 18, NULL, '2024-06-05', '2024-06-05'),
(257, 66, 19, NULL, '2024-06-05', '2024-06-05'),
(258, 66, 19, NULL, '2024-06-05', '2024-06-05'),
(259, 66, 20, NULL, '2024-06-05', '2024-06-05'),
(260, 66, 20, NULL, '2024-06-05', '2024-06-05'),
(261, 66, 19, NULL, '2024-06-05', '2024-06-05'),
(262, 66, 18, NULL, '2024-06-05', '2024-06-05'),
(263, 67, 19, NULL, '2024-06-05', '2024-06-05'),
(264, 67, 19, NULL, '2024-06-05', '2024-06-05'),
(265, 67, 20, NULL, '2024-06-05', '2024-06-05'),
(266, 67, 20, NULL, '2024-06-05', '2024-06-05'),
(267, 67, 19, NULL, '2024-06-05', '2024-06-05'),
(268, 67, 18, NULL, '2024-06-05', '2024-06-05'),
(269, 68, 19, NULL, '2024-06-05', '2024-06-05'),
(270, 68, 19, NULL, '2024-06-05', '2024-06-05'),
(271, 68, 20, NULL, '2024-06-05', '2024-06-05'),
(272, 68, 20, NULL, '2024-06-05', '2024-06-05'),
(273, 68, 19, NULL, '2024-06-05', '2024-06-05'),
(274, 68, 18, NULL, '2024-06-05', '2024-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `exam_questions`
--

CREATE TABLE `exam_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam_questions`
--

INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`, `created_at`, `updated_at`) VALUES
(13, 2, 19, '2024-03-26', '2024-03-26'),
(14, 2, 19, '2024-03-26', '2024-03-26'),
(15, 2, 20, '2024-03-26', '2024-03-26'),
(16, 2, 20, '2024-03-26', '2024-03-26'),
(17, 2, 19, '2024-03-26', '2024-03-26'),
(18, 2, 18, '2024-03-26', '2024-03-26'),
(19, 5, 1, NULL, NULL),
(20, 6, 1, NULL, NULL),
(22, 7, 1, '2024-03-31', '2024-03-31'),
(23, 7, 21, '2024-03-31', '2024-03-31'),
(24, 7, 20, '2024-03-31', '2024-03-31'),
(25, 8, 1, NULL, NULL),
(26, 9, 1, '2024-03-31', '2024-03-31'),
(27, 9, 1, '2024-03-31', '2024-03-31'),
(28, 9, 1, '2024-03-31', '2024-03-31'),
(32, 11, 1, '2024-05-01', '2024-05-01'),
(33, 11, 1, '2024-05-01', '2024-05-01'),
(34, 11, 1, '2024-05-01', '2024-05-01'),
(40, 12, 19, '2024-05-14', '2024-05-14'),
(41, 12, 27, '2024-05-14', '2024-05-14'),
(42, 12, 1, '2024-05-14', '2024-05-14');

-- --------------------------------------------------------

--
-- Table structure for table `exam_time`
--

CREATE TABLE `exam_time` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `time` datetime NOT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam_time`
--

INSERT INTO `exam_time` (`id`, `user_id`, `exam_id`, `time`, `updated_at`, `created_at`) VALUES
(2, 8, 2, '2024-02-26 09:32:23', '2024-02-26', '2024-02-26');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forget_passwords`
--

CREATE TABLE `forget_passwords` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `forget_passwords`
--

INSERT INTO `forget_passwords` (`id`, `user_id`, `code`, `created_at`, `updated_at`) VALUES
(1, 92, '877262', '2024-05-28 11:54:23', '2024-05-28 11:54:23'),
(2, 92, '390403', '2024-05-28 11:55:50', '2024-05-28 11:55:50');

-- --------------------------------------------------------

--
-- Table structure for table `grid_ans`
--

CREATE TABLE `grid_ans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `grid_ans` text NOT NULL,
  `q_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `grid_ans`
--

INSERT INTO `grid_ans` (`id`, `grid_ans`, `q_id`, `created_at`, `updated_at`) VALUES
(1, '1', 25, '2023-12-25', '2023-12-25'),
(2, '2', 21, '2023-12-25', '2023-12-25'),
(4, '7', 1, '2024-01-29', '2024-01-29');

-- --------------------------------------------------------

--
-- Table structure for table `group_days`
--

CREATE TABLE `group_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `day` enum('Sat','Sun','Mon','Tues','Wed','Thurs','Fri') NOT NULL,
  `from` time NOT NULL,
  `to` time NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_days`
--

INSERT INTO `group_days` (`id`, `day`, `from`, `to`, `group_id`, `created_at`, `updated_at`) VALUES
(22, 'Sat', '11:59:00', '11:59:00', 5, '2024-01-27', '2024-01-27'),
(23, 'Sat', '00:59:00', '11:59:00', 5, '2024-01-27', '2024-01-27'),
(39, 'Sat', '13:48:00', '13:49:00', 7, '2024-03-31', '2024-03-31'),
(40, 'Sat', '13:48:00', '13:48:00', 7, '2024-03-31', '2024-03-31'),
(51, 'Sat', '10:44:21', '12:45:21', 1, '2024-05-08', '2024-05-08'),
(52, 'Sat', '10:44:21', '12:45:21', 1, '2024-05-08', '2024-05-08'),
(53, 'Sun', '10:44:21', '12:45:21', 1, '2024-05-08', '2024-05-08'),
(59, 'Sat', '11:03:00', '11:03:00', 8, '2024-06-06', '2024-06-06'),
(61, 'Sat', '10:40:00', '10:40:00', 9, '2024-06-06', '2024-06-06');

-- --------------------------------------------------------

--
-- Table structure for table `group_students`
--

CREATE TABLE `group_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `stu_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `group_students`
--

INSERT INTO `group_students` (`id`, `group_id`, `stu_id`, `created_at`, `updated_at`) VALUES
(14, 1, 82, '2024-05-08', '2024-05-08'),
(24, 8, 78, '2024-06-06', '2024-06-06'),
(27, 9, 87, '2024-06-06', '2024-06-06'),
(28, 9, 92, '2024-06-06', '2024-06-06');

-- --------------------------------------------------------

--
-- Table structure for table `idea_lessons`
--

CREATE TABLE `idea_lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idea` varchar(255) DEFAULT NULL,
  `syllabus` varchar(255) DEFAULT NULL,
  `idea_order` int(11) DEFAULT NULL,
  `pdf` varchar(255) DEFAULT NULL,
  `v_link` varchar(255) DEFAULT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `idea_lessons`
--

INSERT INTO `idea_lessons` (`id`, `idea`, `syllabus`, `idea_order`, `pdf`, `v_link`, `lesson_id`, `created_at`, `updated_at`) VALUES
(6, '12', '12', 12, '2024V02V01V12V33V049.jpg', 'https://www.youtube.com/watch?v=v69praWH6cs', 12, '2024-02-01', '2024-02-01'),
(38, 'nm123', 'ljk', 1, '2024V04V18V14V29V50', 'https://www.youtube.com/embed/v69praWH6cs?si=3ntnEewNZm5NcrFp', 4, '2024-04-18', '2024-04-18'),
(39, 'sadsad', 'dasdas', 12, '2024V04V18V14V29V50', 'h', 4, '2024-04-18', '2024-04-18'),
(40, 'nm', 'ljk', 1, '2024V04V18V14V29V50', 'https://www.youtube.com/embed/v69praWH6cs?si=3ntnEewNZm5NcrFp', 4, '2024-04-18', '2024-04-18'),
(42, '2', '12', 12, '2024V04V24V09V34V02', NULL, 22, '2024-04-24', '2024-04-24'),
(44, 'dgsdsf', 'fgyd', 2, '2024V05V14V09V50V30', 'fdgtdgd', 23, '2024-05-14', '2024-05-14'),
(45, 'sdw', 'ede', 12, 'dsfdsf', 'https://www.youtube.com/watch?v=N_J3HCATA1c', 26, NULL, NULL),
(46, 'sadfd', 'dfs', 21, 'https://www.youtube.com/watch?v=N_J3HCATA1c', 'https://www.youtube.com/watch?v=N_J3HCATA1c', 27, NULL, NULL),
(47, '12', '12', 12, '2024V05V30V11V54V237.png', 'https://us06web.zoom.us/j/86444846998?pwd=UkpFVNlkbVAvhRYTwrl0f6qdebaLFX.1', 28, '2024-05-30', '2024-05-30');

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lesson_name` varchar(255) NOT NULL,
  `chapter_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `lesson_des` text NOT NULL,
  `lesson_url` varchar(191) DEFAULT NULL,
  `pre_requisition` text DEFAULT NULL,
  `gain` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `lesson_name`, `chapter_id`, `teacher_id`, `lesson_des`, `lesson_url`, `pre_requisition`, `gain`, `created_at`, `updated_at`) VALUES
(4, 'Lesson 1', 4, 5, 'fg', '5692024X02X01X16X46X574.jpg', 'jhf', 'g', '2024-01-02 07:48:20', '2024-04-18 12:29:50'),
(12, 'Lesson 26', 6, 5, 'fdfhg', NULL, 'jfggj', 'fgjfgh', '2024-01-30 10:15:21', '2024-01-30 10:15:21'),
(18, 'Lesson 22', 4, 5, 'das', '3662024X02X05X12X57X434.png', 'sfd', 'assd', '2024-02-05 10:57:43', '2024-05-19 05:41:23'),
(22, 'Lesson 2uihijbjib', 6, 11, 'dvgdf', '5592024X04X24X09X33X318032024X03X27X12X18X322024X02X19X07X46X506890202301101725mvf_dark_logo.png', 'cxgvf', 'fgdfgh', '2024-04-24 07:33:31', '2024-04-24 07:34:02'),
(23, 'lesson 12', 20, 44, 'tdyfdfghj', 'efwef', 'fdger', 'trgrt', NULL, '2024-05-14 07:50:30'),
(26, 'lesson one', 22, 11, 'fg', 'gfjhtyty', 'fghn', 'nhgng', NULL, NULL),
(27, 'Lesson two', 21, 79, 'dfg', 'fgjh', 'ghf', 'fgbnfh', NULL, NULL),
(28, 'Lesson 321', 21, 65, 'adf sdfsdf', '8102024X05X30X11X54X237.png', 'dfsd', 'fsdfsd', '2024-05-30 09:54:23', '2024-05-30 09:54:23');

-- --------------------------------------------------------

--
-- Table structure for table `live_courses`
--

CREATE TABLE `live_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `live_courses`
--

INSERT INTO `live_courses` (`id`, `user_id`, `course_id`, `state`, `created_at`, `updated_at`) VALUES
(1, 8, 1, 0, '0000-00-00', '0000-00-00'),
(2, 8, 2, 0, '0000-00-00', '0000-00-00'),
(3, 8, 4, 0, '2024-05-03', '2024-05-03'),
(4, 85, 1, 0, '2024-05-27', '2024-05-27'),
(5, 81, 1, 0, '2024-05-28', '2024-05-28'),
(6, 88, 1, 0, '2024-05-28', '2024-05-28'),
(7, 83, 2, 0, '2024-05-30', '2024-05-30');

-- --------------------------------------------------------

--
-- Table structure for table `live_lessons`
--

CREATE TABLE `live_lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `live_lessons`
--

INSERT INTO `live_lessons` (`id`, `user_id`, `lesson_id`, `created_at`, `updated_at`) VALUES
(3, 8, 12, '2024-04-15', '2024-04-15'),
(6, 8, 4, '2024-05-03', '2024-05-03'),
(7, 85, 4, '2024-05-27', '2024-05-27'),
(8, 81, 4, '2024-05-28', '2024-05-28'),
(9, 85, 18, '2024-05-28', '2024-05-28'),
(10, 88, 4, '2024-05-28', '2024-05-28'),
(11, 83, 27, '2024-05-30', '2024-05-30'),
(12, 85, 12, '2024-05-31', '2024-05-31');

-- --------------------------------------------------------

--
-- Table structure for table `marketings`
--

CREATE TABLE `marketings` (
  `id` int(11) NOT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chapter_id` bigint(20) UNSIGNED DEFAULT NULL,
  `affilate_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_popups`
--

CREATE TABLE `marketing_popups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `starts` date NOT NULL,
  `ends` date NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `marketing_popups`
--

INSERT INTO `marketing_popups` (`id`, `name`, `starts`, `ends`, `image`, `created_at`, `updated_at`) VALUES
(2, 'Adversting 1', '2024-04-01', '2024-04-30', '1.png', NULL, '2024-05-11'),
(3, 'asd', '2024-04-01', '2024-04-30', '1.png', '2024-04-06', '2024-04-06'),
(4, 'fdfd123', '2024-04-02', '2024-04-30', '4702024X04X06X14X13X452024X02X22X12X39X331211202304300850download.png', '2024-04-06', '2024-04-06'),
(5, 'popup 321', '2024-05-22', '2024-05-25', '2072024X05X11X12X59X361.png', '2024-05-11', '2024-05-11');

-- --------------------------------------------------------

--
-- Table structure for table `mcq_ans`
--

CREATE TABLE `mcq_ans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mcq_num` varchar(5) DEFAULT NULL,
  `mcq_ans` varchar(255) DEFAULT NULL,
  `mcq_answers` varchar(255) DEFAULT NULL,
  `q_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `mcq_ans`
--

INSERT INTO `mcq_ans` (`id`, `mcq_num`, `mcq_ans`, `mcq_answers`, `q_id`, `created_at`, `updated_at`) VALUES
(1, 'A', 'answer 1', 'A', 18, '2023-12-25', '2023-12-25'),
(2, 'B', 'answer 2', 'A', 18, '2023-12-25', '2023-12-25'),
(3, 'C', 'answer 3', 'A', 18, '2023-12-25', '2023-12-25'),
(4, 'D', 'answer 4', 'A', 18, '2023-12-25', '2023-12-25'),
(8, 'A', '1', 'A', 19, '2023-12-26', '2023-12-26'),
(9, 'B', '2', 'A', 19, '2023-12-26', '2023-12-26'),
(17, 'C', '6', 'A', 19, '2024-01-24', '2024-01-24'),
(18, 'D', '7', 'A', 19, '2024-01-24', '2024-01-24'),
(19, 'A', '8', 'A', 20, '2024-01-24', '2024-01-24'),
(56, 'B', 'fg', 'A', 20, '2024-01-29', '2024-01-29'),
(57, 'C', 'fg', 'A', 20, '2024-01-29', '2024-01-29'),
(58, 'D', 'fg', 'A', 20, '2024-01-29', '2024-01-29'),
(59, 'A', 'fg', 'A', 21, '2024-01-29', '2024-01-29'),
(60, 'B', 'fg', 'A', 21, '2024-01-29', '2024-01-29'),
(61, 'C', 'fg', 'A', 21, '2024-01-29', '2024-01-29'),
(62, 'D', 'fg', 'A', 21, '2024-01-29', '2024-01-29'),
(100, 'A', '1', 'A', 27, '2024-05-07', '2024-05-07'),
(101, 'B', '2', 'A', 27, '2024-05-07', '2024-05-07'),
(102, 'C', '3', 'A', 27, '2024-05-07', '2024-05-07'),
(103, 'D', '4', 'A', 27, '2024-05-07', '2024-05-07'),
(104, 'A', NULL, 'A', 27, '2024-05-07', '2024-05-07'),
(105, 'B', '1', 'A', 28, '2024-05-11', '2024-05-11'),
(106, 'C', '2', 'A', 28, '2024-05-11', '2024-05-11'),
(107, 'D', '3', 'A', 28, '2024-05-11', '2024-05-11'),
(108, 'A', '4', 'A', 28, '2024-05-11', '2024-05-11'),
(109, 'B', NULL, 'A', 28, '2024-05-11', '2024-05-11'),
(119, 'E', '1', 'B', 29, '2024-05-27', '2024-05-27'),
(120, 'F', '2', 'B', 29, '2024-05-27', '2024-05-27'),
(121, 'G', '3', 'B', 29, '2024-05-27', '2024-05-27'),
(122, 'H', '4', 'B', 29, '2024-05-27', '2024-05-27'),
(123, 'A', NULL, 'A', 32, '2024-05-28', '2024-05-28'),
(124, 'B', NULL, 'A', 32, '2024-05-28', '2024-05-28'),
(125, 'C', NULL, 'A', 32, '2024-05-28', '2024-05-28'),
(126, 'D', NULL, 'A', 32, '2024-05-28', '2024-05-28'),
(127, 'F', NULL, 'A', 32, '2024-05-28', '2024-05-28'),
(128, 'f', NULL, 'A', 33, '2024-05-28', '2024-05-28'),
(129, 'f', NULL, 'A', 33, '2024-05-28', '2024-05-28'),
(130, 'f', NULL, 'A', 33, '2024-05-28', '2024-05-28'),
(131, 'f', NULL, 'A', 33, '2024-05-28', '2024-05-28'),
(132, 'F', NULL, 'A', 33, '2024-05-28', '2024-05-28'),
(133, 'A', '2', 'Bc', 35, '2024-05-28', '2024-05-28'),
(149, 'Ax', '23', 'B', 36, '2024-05-28', '2024-05-28'),
(150, 'B', '4', 'B', 36, '2024-05-28', '2024-05-28'),
(151, 'Cx', '6', 'B', 36, '2024-05-28', '2024-05-28'),
(152, 'Dx', '7', 'B', 36, '2024-05-28', '2024-05-28'),
(153, 'F', NULL, 'B', 36, '2024-05-28', '2024-05-28'),
(154, 'A', NULL, 'A', 37, '2024-05-28', '2024-05-28'),
(155, 'B', NULL, 'A', 37, '2024-05-28', '2024-05-28'),
(156, 'C', NULL, 'A', 37, '2024-05-28', '2024-05-28'),
(157, 'D', NULL, 'A', 37, '2024-05-28', '2024-05-28'),
(158, 'F', NULL, 'A', 37, '2024-05-28', '2024-05-28'),
(159, 'A', NULL, 'A', 38, '2024-05-28', '2024-05-28'),
(160, 'B', NULL, 'A', 38, '2024-05-28', '2024-05-28'),
(161, 'C', NULL, 'A', 38, '2024-05-28', '2024-05-28'),
(162, 'D', NULL, 'A', 38, '2024-05-28', '2024-05-28'),
(163, 'F', NULL, 'A', 38, '2024-05-28', '2024-05-28'),
(177, 'A', NULL, 'A', 39, '2024-06-03', '2024-06-03'),
(178, 'B', NULL, 'A', 39, '2024-06-03', '2024-06-03'),
(179, 'C', NULL, 'A', 39, '2024-06-03', '2024-06-03'),
(180, 'D', NULL, 'A', 39, '2024-06-03', '2024-06-03'),
(181, 'F', NULL, 'A', 39, '2024-06-03', '2024-06-03'),
(190, 'A', 'fg', 'A', 1, '2024-06-03', '2024-06-03'),
(191, 'B', 'fg', 'A', 1, '2024-06-03', '2024-06-03'),
(192, 'C', 'fg', 'A', 1, '2024-06-03', '2024-06-03'),
(193, 'D', 'sa', 'A', 1, '2024-06-03', '2024-06-03');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_28_090500_add_login_fields_to_users_table', 1),
(6, '2023_06_11_075700_create_permission_tables', 1),
(7, '2023_06_12_013333_add_profile_photo_path_column_to_users_table', 1),
(8, '2023_10_09_041104_create_addresses_table', 1),
(9, '2023_12_12_111922_create_admin_roles_table', 1),
(10, '2023_12_12_113333_create_categories_table', 1),
(11, '2023_12_12_113743_create_courses_table', 1),
(12, '2023_12_12_113826_create_chapters_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `module` enum('Exam','Question','Live') NOT NULL,
  `number` int(11) NOT NULL,
  `price` float NOT NULL,
  `duration` int(11) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `module`, `number`, `price`, `duration`, `created_at`, `updated_at`) VALUES
(2, 'Package 1', 'Exam', 10, 60, 30, NULL, '2024-02-20'),
(3, 'Package 2', 'Question', 11, 111, 1111, '2024-02-20', '2024-02-20'),
(4, 'Package 3', 'Live', 10, 600, 30, NULL, NULL),
(5, 'Package 4', 'Live', 11, 22, 22, '2024-03-31', '2024-03-31');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `statue` tinyint(1) DEFAULT 0,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`id`, `payment`, `description`, `logo`, `statue`, `created_at`, `updated_at`) VALUES
(2, 'Visa', 'Number 1', '2024X03X31X11X51X582661.png', 1, '2024-01-07', '2024-04-15'),
(4, 'pay 1', 'Number 2', '2024X01X27X09X01X1410931.jpg', 1, '2024-01-27', '2024-01-27'),
(5, 'Visa', NULL, '2024X02X05X13X14X0069575.png', 1, '2024-02-05', '2024-02-05'),
(7, 'pay 1', NULL, '2024X02X12X10X01X511491202301101725mvf_dark_logo.png', 0, '2024-02-12', '2024-04-09'),
(8, 'vodafone cash', 'Number 12', '2024X04X15X12X40X36863download.jfif', 1, '2024-04-15', '2024-04-15');

-- --------------------------------------------------------

--
-- Table structure for table `payment_orders`
--

CREATE TABLE `payment_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_request_id` bigint(20) UNSIGNED NOT NULL,
  `chapter_id` bigint(20) UNSIGNED NOT NULL,
  `duration` int(11) NOT NULL,
  `discount` float DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `date` datetime DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_orders`
--

INSERT INTO `payment_orders` (`id`, `payment_request_id`, `chapter_id`, `duration`, `discount`, `state`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 0, NULL, 0, NULL, NULL, NULL),
(4, 7, 6, 22, NULL, 0, NULL, '2024-02-28', '2024-02-28'),
(6, 62, 4, 4, NULL, 1, NULL, '2024-02-28', '2024-02-28'),
(8, 62, 6, 4, NULL, 0, NULL, '2024-02-28', '2024-02-28'),
(10, 72, 4, 35, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(11, 72, 6, 22, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(13, 73, 4, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(15, 73, 6, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(17, 74, 4, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(19, 74, 6, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(21, 75, 4, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(23, 75, 6, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(25, 76, 4, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(27, 76, 6, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(29, 77, 4, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(31, 77, 6, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(33, 78, 4, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(35, 78, 6, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(37, 79, 4, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(39, 79, 6, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(41, 80, 4, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(43, 80, 6, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(45, 81, 4, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(47, 81, 6, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(49, 82, 4, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(51, 82, 6, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(53, 83, 4, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(55, 83, 6, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(57, 84, 4, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(59, 84, 6, 4, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(62, 85, 6, 22, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(65, 86, 6, 22, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(68, 87, 6, 22, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(71, 88, 6, 22, NULL, 0, NULL, '2024-03-07', '2024-03-07'),
(77, 122, 4, 50, NULL, 0, NULL, '2024-04-17', '2024-04-17'),
(78, 122, 4, 35, NULL, 0, NULL, '2024-04-17', '2024-04-17'),
(79, 122, 4, 13, NULL, 0, NULL, '2024-04-17', '2024-04-17'),
(80, 133, 4, 0, NULL, 0, NULL, '2024-04-27', '2024-04-27'),
(81, 133, 6, 0, NULL, 0, NULL, '2024-04-27', '2024-04-27'),
(84, 135, 4, 0, NULL, 0, NULL, '2024-05-05', '2024-05-05'),
(85, 135, 6, 0, NULL, 0, NULL, '2024-05-05', '2024-05-05'),
(90, 137, 6, 22, NULL, 0, NULL, '2024-05-08', '2024-05-08'),
(93, 140, 20, 0, NULL, 1, NULL, '2024-05-08', '2024-05-08'),
(94, 141, 4, 0, NULL, 0, NULL, '2024-05-09', '2024-05-09'),
(95, 141, 6, 0, NULL, 0, NULL, '2024-05-09', '2024-05-09'),
(98, 142, 6, 22, NULL, 0, NULL, '2024-05-09', '2024-05-09'),
(101, 143, 6, 22, NULL, 1, '2024-05-09 12:33:15', '2024-05-09', '2024-05-09'),
(104, 144, 6, 22, NULL, 1, NULL, '2024-05-09', '2024-05-09'),
(107, 145, 4, 0, NULL, 1, NULL, '2024-05-13', '2024-05-13'),
(108, 145, 6, 0, NULL, 1, NULL, '2024-05-13', '2024-05-13'),
(111, 146, 4, 0, NULL, 1, NULL, '2024-05-13', '2024-05-13'),
(112, 146, 6, 0, NULL, 1, NULL, '2024-05-13', '2024-05-13'),
(115, 147, 4, 0, NULL, 1, NULL, '2024-05-13', '2024-05-13'),
(116, 147, 6, 0, NULL, 1, NULL, '2024-05-13', '2024-05-13'),
(119, 148, 4, 0, NULL, 1, NULL, '2024-05-13', '2024-05-13'),
(120, 148, 6, 0, NULL, 1, NULL, '2024-05-13', '2024-05-13'),
(123, 149, 4, 0, NULL, 1, NULL, '2024-05-13', '2024-05-13'),
(124, 149, 6, 0, NULL, 1, NULL, '2024-05-13', '2024-05-13'),
(127, 150, 4, 0, NULL, 1, NULL, '2024-05-13', '2024-05-13'),
(128, 150, 6, 0, NULL, 1, NULL, '2024-05-13', '2024-05-13'),
(131, 151, 4, 0, NULL, 1, NULL, '2024-05-13', '2024-05-13'),
(132, 151, 6, 0, NULL, 1, NULL, '2024-05-13', '2024-05-13'),
(135, 152, 6, 22, NULL, 1, NULL, '2024-05-13', '2024-05-13'),
(138, 153, 6, 22, NULL, 1, NULL, '2024-05-13', '2024-05-13'),
(141, 157, 4, 7, NULL, 1, '2024-05-13 12:11:28', '2024-05-13', '2024-05-13'),
(142, 157, 6, 7, NULL, 1, '2024-05-13 12:11:28', '2024-05-13', '2024-05-13'),
(143, 158, 4, 7, NULL, 1, '2024-05-13 12:12:18', '2024-05-13', '2024-05-13'),
(144, 158, 6, 7, NULL, 1, '2024-05-13 12:12:18', '2024-05-13', '2024-05-13'),
(147, 162, 4, 0, NULL, 0, NULL, '2024-05-16', '2024-05-16'),
(148, 162, 6, 0, NULL, 0, NULL, '2024-05-16', '2024-05-16'),
(150, 163, 4, 0, NULL, 0, NULL, '2024-05-16', '2024-05-16'),
(151, 163, 6, 0, NULL, 0, NULL, '2024-05-16', '2024-05-16'),
(153, 164, 4, 0, NULL, 1, '2024-05-17 11:35:18', '2024-05-17', '2024-05-17'),
(154, 164, 6, 0, NULL, 1, '2024-05-17 11:35:18', '2024-05-17', '2024-05-17'),
(156, 165, 4, 0, NULL, 1, NULL, '2024-05-17', '2024-05-17'),
(157, 165, 6, 0, NULL, 1, NULL, '2024-05-17', '2024-05-17'),
(159, 178, 6, 22, NULL, 1, '2024-05-17 12:28:21', '2024-05-17', '2024-05-17'),
(161, 179, 6, 22, NULL, 1, NULL, '2024-05-17', '2024-05-17'),
(163, 180, 6, 22, NULL, 1, NULL, '2024-05-17', '2024-05-17'),
(165, 181, 6, 22, NULL, 1, NULL, '2024-05-17', '2024-05-17'),
(167, 182, 6, 22, NULL, 1, '2024-05-17 12:28:11', '2024-05-17', '2024-05-17'),
(169, 183, 6, 22, NULL, 1, NULL, '2024-05-17', '2024-05-17'),
(171, 184, 6, 22, NULL, 1, NULL, '2024-05-17', '2024-05-17'),
(173, 196, 4, 0, NULL, 1, NULL, '2024-05-22', '2024-05-22'),
(174, 196, 6, 0, NULL, 1, NULL, '2024-05-22', '2024-05-22'),
(176, 199, 21, 33, NULL, 1, NULL, '2024-05-25', '2024-05-25'),
(177, 200, 4, 33, NULL, 1, '2024-05-25 11:52:57', '2024-05-25', '2024-05-25'),
(178, 200, 6, 44, NULL, 1, '2024-05-25 11:52:57', '2024-05-25', '2024-05-25');

-- --------------------------------------------------------

--
-- Table structure for table `payment_package_order`
--

CREATE TABLE `payment_package_order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_request_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `discount` float DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `date` date NOT NULL,
  `number` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_package_order`
--

INSERT INTO `payment_package_order` (`id`, `payment_request_id`, `user_id`, `package_id`, `discount`, `state`, `date`, `number`, `created_at`, `updated_at`) VALUES
(1, 66, NULL, 4, NULL, 1, '2024-02-29', 0, '2024-02-29', '2024-03-21'),
(2, 67, NULL, 3, NULL, 1, '2024-02-29', 0, '2024-02-29', '2024-02-29'),
(3, 68, NULL, 3, NULL, 1, '2024-02-29', 0, '2024-02-29', '2024-02-29'),
(4, 69, NULL, 2, NULL, 1, '2024-02-29', 0, '2024-02-29', '2024-02-29'),
(5, 90, NULL, 2, NULL, 0, '2024-03-07', 0, '2024-03-07', '2024-03-07'),
(6, 92, NULL, 2, NULL, 0, '2024-03-07', 0, '2024-03-07', '2024-03-07'),
(7, 93, NULL, 3, NULL, 0, '2024-03-07', 0, '2024-03-07', '2024-03-07'),
(8, 94, NULL, 3, NULL, 0, '2024-03-14', 0, '2024-03-14', '2024-03-14'),
(9, 95, NULL, 3, NULL, 0, '2024-03-14', 0, '2024-03-14', '2024-03-14'),
(10, 96, NULL, 3, NULL, 1, '2024-03-14', 0, '2024-03-14', '2024-03-14'),
(11, 97, NULL, 3, NULL, 1, '2024-03-15', 0, '2024-03-15', '2024-03-15'),
(12, 98, NULL, 2, NULL, 1, '2024-03-15', 0, '2024-03-15', '2024-03-21'),
(13, 99, NULL, 3, NULL, 1, '2024-03-16', 0, '2024-03-16', '2024-03-23'),
(14, 100, NULL, 3, NULL, 1, '2024-03-23', 0, '2024-03-23', '2024-03-26'),
(15, 101, NULL, 3, NULL, 1, '2024-03-26', 0, '2024-03-26', '2024-03-30'),
(16, 102, NULL, 3, NULL, 1, '2024-03-26', 0, '2024-03-26', '2024-04-04'),
(17, 103, NULL, 3, NULL, 1, '2024-03-26', 0, '2024-03-26', '2024-04-04'),
(18, 104, NULL, 3, NULL, 1, '2024-03-26', 0, '2024-03-26', '2024-04-04'),
(19, 105, NULL, 3, NULL, 1, '2024-03-26', 0, '2024-03-26', '2024-04-04'),
(20, 106, NULL, 3, NULL, 1, '2024-03-26', 0, '2024-03-26', '2024-04-04'),
(21, 107, NULL, 2, NULL, 1, '2024-03-27', 5, '2024-03-27', '2024-04-04'),
(22, 109, NULL, 3, NULL, 1, '2024-04-01', 0, '2024-04-01', '2024-04-04'),
(23, 110, NULL, 2, NULL, 1, '2024-04-01', 10, '2024-04-01', '2024-04-01'),
(24, 111, NULL, 3, NULL, 1, '2024-04-08', 0, '2024-04-08', '2024-04-17'),
(25, 112, NULL, 3, NULL, 1, '2024-04-08', 8, '2024-04-08', '2024-04-17'),
(26, 113, NULL, 3, NULL, 1, '2024-04-08', 11, '2024-04-08', '2024-04-08'),
(27, 114, NULL, 3, NULL, 1, '2024-04-08', 11, '2024-04-08', '2024-04-08'),
(28, 115, NULL, 3, NULL, 1, '2024-04-08', 11, '2024-04-08', '2024-04-08'),
(29, 117, NULL, 3, NULL, 1, '2024-04-08', 11, '2024-04-08', '2024-04-08'),
(30, 118, 8, 3, NULL, 1, '2024-04-08', 8, '2024-04-08', '2024-04-16'),
(31, 121, 8, 2, NULL, 1, '2024-04-17', 0, '2024-04-17', '2024-04-21'),
(32, 123, 8, 3, NULL, 1, '2024-04-20', 0, '2024-04-20', '2024-04-21'),
(33, 124, 8, 2, NULL, 1, '2024-04-21', 10, '2024-04-21', '2024-04-21'),
(34, 125, 8, 3, NULL, 1, '2024-04-21', 0, '2024-04-21', '2024-04-22'),
(35, 126, 8, 3, NULL, 1, '2024-04-22', 0, '2024-04-22', '2024-05-01'),
(36, 129, 8, 3, NULL, 1, '2024-04-26', 5, '2024-04-26', '2024-05-01'),
(37, 131, 8, 3, NULL, 1, '2024-04-26', 11, '2024-04-26', '2024-04-26'),
(38, 134, 8, 2, NULL, 1, '2024-05-01', 4, '2024-05-01', '2024-05-04'),
(39, 154, 8, 3, NULL, 1, '2024-05-13', 11, '2024-05-13', '2024-05-13'),
(40, 159, 8, 2, NULL, 1, '2024-05-13', 10, '2024-05-13', '2024-05-13'),
(41, 161, 8, 2, NULL, 1, '2024-05-13', 10, '2024-05-13', '2024-05-13'),
(42, 166, 8, 3, NULL, 0, '2024-05-17', 0, '2024-05-17', '2024-05-17'),
(43, 167, 8, 3, NULL, 1, '2024-05-17', 0, '2024-05-17', '2024-05-17'),
(44, 168, 8, 3, NULL, 1, '2024-05-17', 3, '2024-05-17', '2024-05-25'),
(45, 169, 8, 2, NULL, 1, '2024-05-17', 10, '2024-05-17', '2024-05-17'),
(46, 170, 8, 2, NULL, 0, '2024-05-17', 0, '2024-05-17', '2024-05-17'),
(47, 171, 8, 2, NULL, 1, '2024-05-19', 0, '2024-05-17', '2024-05-19'),
(48, 172, 8, 2, NULL, 1, '2024-05-17', 0, '2024-05-17', '2024-05-17'),
(49, 173, 8, 2, NULL, 1, '2024-05-17', 0, '2024-05-17', '2024-05-17'),
(50, 174, 8, 2, NULL, 1, '2024-05-17', 0, '2024-05-17', '2024-05-17'),
(51, 175, 8, 2, NULL, 1, '2024-05-17', 10, '2024-05-17', '2024-05-17'),
(52, 176, 8, 4, NULL, 1, '2024-05-17', 0, '2024-05-17', '2024-05-17'),
(53, 177, 8, 4, NULL, 1, '2024-05-17', 10, '2024-05-17', '2024-05-17'),
(54, 197, 8, 2, NULL, 1, '2024-05-22', 10, '2024-05-22', '2024-05-22'),
(55, 198, 8, 2, NULL, 1, '2024-05-22', 10, '2024-05-22', '2024-05-22'),
(56, 203, 8, 3, NULL, 1, '2024-05-30', 0, '2024-05-30', '2024-06-05'),
(57, 204, 8, 2, NULL, 1, '2024-06-04', 3, '2024-06-04', '2024-06-05'),
(58, 205, 8, 3, NULL, 1, '2024-06-05', 0, '2024-06-05', '2024-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `payment_requests`
--

CREATE TABLE `payment_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `price` float UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `module` enum('Chapters','Package','Course') NOT NULL DEFAULT 'Chapters',
  `state` enum('Pendding','Approve','Rejected') NOT NULL DEFAULT 'Pendding',
  `rejected_reason` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_requests`
--

INSERT INTO `payment_requests` (`id`, `payment_method_id`, `user_id`, `price`, `image`, `module`, `state`, `rejected_reason`, `created_at`, `updated_at`) VALUES
(1, 7, 8, 800, '2024X01X28X12X04X3729854.png', 'Chapters', 'Approve', NULL, NULL, '2024-03-03'),
(2, 7, 11, 300, '2024X01X28X12X04X3729854.png', 'Chapters', 'Approve', NULL, NULL, '2024-01-28'),
(3, 7, 8, 100, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-28', '2024-01-28'),
(4, 7, 8, 100, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-28', '2024-01-28'),
(5, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-29', '2024-01-29'),
(6, 7, 8, 100, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-29', '2024-01-29'),
(7, 7, 8, 300, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-29', '2024-01-29'),
(8, 7, 8, 300, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-29', '2024-01-29'),
(9, 7, 8, 300, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-29', '2024-01-29'),
(10, 7, 8, 300, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-29', '2024-01-29'),
(11, 7, 8, 300, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-29', '2024-01-29'),
(12, 7, 8, 300, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-29', '2024-01-29'),
(13, 7, 8, 300, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-29', '2024-01-29'),
(14, 7, 8, 300, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-29', '2024-01-29'),
(15, 7, 8, 300, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-29', '2024-01-29'),
(16, 7, 8, 300, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-29', '2024-01-29'),
(17, 7, 8, 300, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-29', '2024-01-29'),
(18, 7, 8, 300, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-29', '2024-01-29'),
(19, 7, 8, 300, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-29', '2024-01-29'),
(20, 7, 8, 300, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-29', '2024-01-29'),
(21, 7, 8, 300, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-29', '2024-01-29'),
(22, 7, 8, 300, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-29', '2024-01-29'),
(23, 7, 8, 300, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-29', '2024-01-29'),
(24, 7, 8, 300, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-29', '2024-01-29'),
(25, 7, 8, 300, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-01-29', '2024-01-29'),
(26, 7, 8, 300, '2024X01X28X12X04X3729854.png', 'Chapters', 'Rejected', NULL, '2024-01-30', '2024-02-05'),
(27, 7, 8, 350, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-12', '2024-02-12'),
(28, 7, 8, 100, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-12', '2024-02-12'),
(29, 7, 8, 100, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-12', '2024-02-12'),
(30, 7, 8, 550, '2024X01X28X12X04X3729854.png', 'Chapters', 'Rejected', NULL, '2024-02-13', '2024-02-13'),
(31, 7, 8, 60, '2024X01X28X12X04X3729854.png', 'Package', 'Pendding', NULL, '2024-02-22', '2024-02-22'),
(32, 7, 8, 60, '2024X01X28X12X04X3729854.png', 'Package', 'Pendding', NULL, '2024-02-22', '2024-02-22'),
(33, 7, 8, 60, '2024X01X28X12X04X3729854.png', 'Package', 'Pendding', NULL, '2024-02-22', '2024-02-22'),
(34, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-22', '2024-02-22'),
(35, 7, 8, 500, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-24', '2024-02-24'),
(36, 7, 8, 500, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-24', '2024-02-24'),
(37, 7, 8, 500, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-24', '2024-02-24'),
(38, 7, 8, 500, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-24', '2024-02-24'),
(39, 7, 8, 500, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-24', '2024-02-24'),
(40, 7, 8, 500, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-24', '2024-02-24'),
(41, 7, 8, 60, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-02-25', '2024-02-27'),
(42, 7, 8, 60, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-02-27', '2024-02-27'),
(43, 7, 8, 68, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-28', '2024-02-28'),
(44, 7, 8, 68, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-28', '2024-02-28'),
(45, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-28', '2024-02-28'),
(46, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-28', '2024-02-28'),
(47, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-28', '2024-02-28'),
(48, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-28', '2024-02-28'),
(49, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-28', '2024-02-28'),
(50, 7, 8, 500, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-28', '2024-02-28'),
(51, 7, 8, 500, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-28', '2024-02-28'),
(52, 7, 8, 500, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-28', '2024-02-28'),
(53, 7, 8, 500, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-28', '2024-02-28'),
(54, 7, 8, 500, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-28', '2024-02-28'),
(55, 7, 8, 500, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-28', '2024-02-28'),
(56, 7, 8, 500, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-28', '2024-02-28'),
(57, 7, 8, 500, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-28', '2024-02-28'),
(58, 7, 8, 500, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-28', '2024-02-28'),
(59, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-28', '2024-02-28'),
(60, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-28', '2024-02-28'),
(61, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-28', '2024-02-28'),
(62, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-02-28', '2024-02-28'),
(63, 7, 8, 60, '2024X01X28X12X04X3729854.png', 'Package', 'Rejected', 'sdfsdfsd', '2024-02-29', '2024-03-13'),
(64, 7, 8, 60, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-02-29', '2024-02-29'),
(65, 7, 8, 60, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-02-29', '2024-02-29'),
(66, 7, 8, 60, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-02-29', '2024-02-29'),
(67, 7, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-02-29', '2024-02-29'),
(68, 7, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-02-29', '2024-02-29'),
(69, 7, 8, 60, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-02-29', '2024-02-29'),
(70, 7, 8, 57, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-03-07', '2024-03-07'),
(71, 7, 8, 57, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-03-07', '2024-03-07'),
(72, 7, 8, 57, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-03-07', '2024-03-07'),
(73, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-03-07', '2024-03-07'),
(74, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-03-07', '2024-03-07'),
(75, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-03-07', '2024-03-07'),
(76, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-03-07', '2024-03-07'),
(77, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-03-07', '2024-03-07'),
(78, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-03-07', '2024-03-07'),
(79, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-03-07', '2024-03-07'),
(80, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-03-07', '2024-03-07'),
(81, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-03-07', '2024-03-07'),
(82, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-03-07', '2024-03-07'),
(83, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-03-07', '2024-03-07'),
(84, 7, 8, 400, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-03-07', '2024-03-07'),
(85, 7, 8, 68, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-03-07', '2024-03-07'),
(86, 7, 8, 68, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-03-07', '2024-03-07'),
(87, 7, 8, 68, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-03-07', '2024-03-07'),
(88, 7, 8, 68, '2024X01X28X12X04X3729854.png', 'Chapters', 'Approve', NULL, '2024-03-07', '2024-03-07'),
(89, 7, 8, 60, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-03-07', '2024-03-07'),
(90, 7, 8, 60, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-03-07', '2024-03-07'),
(91, 7, 8, 60, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-03-07', '2024-03-07'),
(92, 7, 8, 60, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-03-07', '2024-03-07'),
(93, 7, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-03-07', '2024-03-07'),
(94, 7, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-03-14', '2024-03-14'),
(95, 7, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-03-14', '2024-03-14'),
(96, 7, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-03-14', '2024-03-14'),
(97, 7, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-03-15', '2024-03-15'),
(98, 7, 8, 60, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-03-15', '2024-03-15'),
(99, 7, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-03-16', '2024-03-16'),
(100, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-03-23', '2024-03-23'),
(101, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-03-26', '2024-03-26'),
(102, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-03-26', '2024-03-26'),
(103, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-03-26', '2024-03-26'),
(104, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-03-26', '2024-03-26'),
(105, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-03-26', '2024-03-26'),
(106, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-03-26', '2024-03-26'),
(107, NULL, 8, 60, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-03-27', '2024-03-27'),
(108, NULL, 8, 570, '2024X01X28X12X04X3729854.png', 'Chapters', 'Approve', NULL, '2024-03-27', '2024-03-27'),
(109, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-04-01', '2024-04-01'),
(110, NULL, 8, 60, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-04-01', '2024-04-01'),
(111, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-04-08', '2024-04-08'),
(112, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-04-08', '2024-04-08'),
(113, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-04-08', '2024-04-08'),
(114, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-04-08', '2024-04-08'),
(115, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-04-08', '2024-04-08'),
(116, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-04-08', '2024-04-08'),
(117, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-04-08', '2024-04-08'),
(118, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-04-08', '2024-04-08'),
(119, NULL, 8, 570, '2024X01X28X12X04X3729854.png', 'Chapters', 'Approve', NULL, '2024-04-08', '2024-04-08'),
(120, NULL, 8, 17.94, '2024X01X28X12X04X3729854.png', 'Chapters', 'Approve', NULL, '2024-04-08', '2024-04-08'),
(121, NULL, 8, 60, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-04-17', '2024-04-17'),
(122, NULL, 8, 37.84, '2024X01X28X12X04X3729854.png', 'Chapters', 'Approve', NULL, '2024-04-17', '2024-04-17'),
(123, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-04-20', '2024-04-20'),
(124, NULL, 8, 60, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-04-21', '2024-04-21'),
(125, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-04-21', '2024-04-21'),
(126, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-04-22', '2024-04-22'),
(127, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-04-26', '2024-04-26'),
(128, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-04-26', '2024-04-26'),
(129, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-04-26', '2024-04-26'),
(130, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-04-26', '2024-04-26'),
(131, NULL, 8, 111, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-04-26', '2024-04-26'),
(132, NULL, 8, 475, '2024X01X28X12X04X3729854.png', 'Chapters', 'Approve', NULL, '2024-04-27', '2024-04-27'),
(133, NULL, 8, 475, '2024X01X28X12X04X3729854.png', 'Chapters', 'Approve', NULL, '2024-04-27', '2024-04-27'),
(134, NULL, 8, 60, '2024X01X28X12X04X3729854.png', 'Package', 'Approve', NULL, '2024-05-01', '2024-05-01'),
(135, 8, 8, 475, '2024X01X28X12X04X3729854.png', 'Chapters', 'Pendding', NULL, '2024-05-05', '2024-05-05'),
(136, NULL, 8, 46, NULL, 'Chapters', 'Approve', NULL, '2024-05-07', '2024-05-07'),
(137, NULL, 8, 14.89, NULL, 'Chapters', 'Approve', NULL, '2024-05-08', '2024-05-08'),
(138, NULL, 8, 17.94, NULL, 'Chapters', 'Approve', NULL, '2024-05-08', '2024-05-08'),
(139, NULL, 8, 17.94, NULL, 'Chapters', 'Approve', NULL, '2024-05-08', '2024-05-08'),
(140, NULL, 8, 17.94, NULL, 'Chapters', 'Approve', NULL, '2024-05-08', '2024-05-08'),
(141, 8, 8, 475, '2024X05X09X12X10X367306sad.png', 'Chapters', 'Pendding', NULL, '2024-05-09', '2024-05-09'),
(142, 8, 8, 14.89, '2024X05X09X12X13X331836shocked.png', 'Chapters', 'Pendding', NULL, '2024-05-09', '2024-05-09'),
(143, 8, 8, 14.89, '2024X05X09X12X14X3550719.png', 'Chapters', 'Approve', NULL, '2024-05-09', '2024-05-09'),
(144, NULL, 8, 14.89, '2024X05X09X12X14X49942419.png', 'Chapters', 'Approve', NULL, '2024-05-09', '2024-05-09'),
(145, NULL, 8, 475, NULL, 'Chapters', 'Approve', NULL, '2024-05-13', '2024-05-13'),
(146, NULL, 8, 475, NULL, 'Chapters', 'Approve', NULL, '2024-05-13', '2024-05-13'),
(147, NULL, 8, 475, NULL, 'Chapters', 'Approve', NULL, '2024-05-13', '2024-05-13'),
(148, NULL, 8, 475, NULL, 'Chapters', 'Approve', NULL, '2024-05-13', '2024-05-13'),
(149, NULL, 8, 475, NULL, 'Chapters', 'Approve', NULL, '2024-05-13', '2024-05-13'),
(150, NULL, 8, 475, NULL, 'Chapters', 'Approve', NULL, '2024-05-13', '2024-05-13'),
(151, NULL, 8, 475, NULL, 'Chapters', 'Approve', NULL, '2024-05-13', '2024-05-13'),
(152, NULL, 8, 14.89, NULL, 'Chapters', 'Approve', NULL, '2024-05-13', '2024-05-13'),
(153, NULL, 8, 14.89, NULL, 'Chapters', 'Approve', NULL, '2024-05-13', '2024-05-13'),
(154, NULL, 8, 111, NULL, 'Package', 'Approve', NULL, '2024-05-13', '2024-05-13'),
(155, NULL, 8, 50, NULL, 'Chapters', 'Approve', NULL, '2024-05-13', '2024-05-13'),
(156, NULL, 8, 50, NULL, 'Chapters', 'Approve', NULL, '2024-05-13', '2024-05-13'),
(157, NULL, 8, 50, NULL, 'Chapters', 'Approve', NULL, '2024-05-13', '2024-05-13'),
(158, NULL, 8, 50, NULL, 'Chapters', 'Approve', NULL, '2024-05-13', '2024-05-13'),
(159, NULL, 8, 50, NULL, 'Package', 'Approve', NULL, '2024-05-13', '2024-05-13'),
(160, NULL, 8, 50, NULL, 'Chapters', 'Approve', NULL, '2024-05-13', '2024-05-13'),
(161, NULL, 8, 48.75, NULL, 'Package', 'Approve', NULL, '2024-05-13', '2024-05-13'),
(162, 2, 8, 475, '2024X05X16X10X53X2349188.png', 'Chapters', 'Pendding', NULL, '2024-05-16', '2024-05-16'),
(163, 2, 8, 475, '2024X05X16X11X01X4830728.png', 'Chapters', 'Pendding', NULL, '2024-05-16', '2024-05-16'),
(164, 2, 8, 475, '2024X05X17X11X31X3892016.png', 'Chapters', 'Approve', NULL, '2024-05-17', '2024-05-17'),
(165, NULL, 8, 475, NULL, 'Chapters', 'Approve', NULL, '2024-05-17', '2024-05-17'),
(166, 8, 8, 111, '2024X05X17X11X46X4349888.png', 'Package', 'Pendding', NULL, '2024-05-17', '2024-05-17'),
(167, 8, 8, 111, '2024X05X17X11X48X0544758.png', 'Package', 'Approve', NULL, '2024-05-17', '2024-05-17'),
(168, NULL, 8, 111, '2024X05X17X11X48X4644078.png', 'Package', 'Approve', NULL, '2024-05-17', '2024-05-17'),
(169, NULL, 8, 60, NULL, 'Package', 'Approve', NULL, '2024-05-17', '2024-05-17'),
(170, 7, 8, 60, '2024X05X17X11X58X0895907.png', 'Package', 'Pendding', NULL, '2024-05-17', '2024-05-17'),
(171, 8, 8, 60, '2024X05X17X12X03X39208.png', 'Package', 'Approve', NULL, '2024-05-17', '2024-05-19'),
(172, 8, 8, 60, '2024X05X17X12X04X4473468.png', 'Package', 'Approve', NULL, '2024-05-17', '2024-05-17'),
(173, 8, 8, 60, '2024X05X17X12X05X3420348.png', 'Package', 'Approve', NULL, '2024-05-17', '2024-05-17'),
(174, 8, 8, 60, '2024X05X17X12X06X2618077.png', 'Package', 'Approve', NULL, '2024-05-17', '2024-05-17'),
(175, NULL, 8, 60, '2024X05X17X12X06X4727857.png', 'Package', 'Approve', NULL, '2024-05-17', '2024-05-17'),
(176, 2, 8, 600, '2024X05X17X12X07X3367507.png', 'Package', 'Approve', NULL, '2024-05-17', '2024-05-17'),
(177, NULL, 8, 600, '2024X05X17X12X07X5544897.png', 'Package', 'Approve', NULL, '2024-05-17', '2024-05-17'),
(178, 8, 8, 40.65, '2024X05X17X12X10X1876176.png', 'Chapters', 'Approve', NULL, '2024-05-17', '2024-05-17'),
(179, NULL, 8, 40.65, NULL, 'Chapters', 'Approve', NULL, '2024-05-17', '2024-05-17'),
(180, NULL, 8, 40.65, NULL, 'Chapters', 'Approve', NULL, '2024-05-17', '2024-05-17'),
(181, NULL, 8, 40.65, NULL, 'Chapters', 'Approve', NULL, '2024-05-17', '2024-05-17'),
(182, 5, 8, 40.65, '2024X05X17X12X23X0445027.png', 'Chapters', 'Approve', NULL, '2024-05-17', '2024-05-17'),
(183, NULL, 8, 40.65, NULL, 'Chapters', 'Approve', NULL, '2024-05-17', '2024-05-17'),
(184, NULL, 8, 40.65, NULL, 'Chapters', 'Approve', NULL, '2024-05-17', '2024-05-17'),
(185, NULL, 8, 200, NULL, 'Package', 'Approve', NULL, '2024-05-19', '2024-05-19'),
(186, NULL, 8, 2000, NULL, 'Package', 'Approve', NULL, '2024-05-19', '2024-05-19'),
(187, NULL, 8, 200, NULL, 'Package', 'Approve', NULL, '2024-05-19', '2024-05-19'),
(188, NULL, 8, 200, NULL, 'Package', 'Approve', NULL, '2024-05-19', '2024-05-19'),
(189, NULL, 8, 200, NULL, 'Package', 'Approve', NULL, '2024-05-19', '2024-05-19'),
(190, NULL, 8, 200, NULL, 'Package', 'Approve', NULL, '2024-05-19', '2024-05-19'),
(191, NULL, 8, 200, NULL, 'Package', 'Approve', NULL, '2024-05-19', '2024-05-19'),
(192, NULL, 8, 200, NULL, 'Package', 'Approve', NULL, '2024-05-19', '2024-05-19'),
(193, NULL, 8, 200, NULL, 'Package', 'Approve', NULL, '2024-05-19', '2024-05-19'),
(194, NULL, 8, 200, NULL, 'Package', 'Approve', NULL, '2024-05-19', '2024-05-19'),
(195, NULL, 8, 200, NULL, 'Package', 'Approve', NULL, '2024-05-19', '2024-05-19'),
(196, NULL, 8, 475, NULL, 'Chapters', 'Approve', NULL, '2024-05-22', '2024-05-22'),
(197, NULL, 8, 60, NULL, 'Package', 'Approve', NULL, '2024-05-22', '2024-05-22'),
(198, NULL, 8, 60, NULL, 'Package', 'Approve', NULL, '2024-05-22', '2024-05-22'),
(199, NULL, 8, 32.34, NULL, 'Chapters', 'Approve', NULL, '2024-05-25', '2024-05-25'),
(200, NULL, 8, 50, NULL, 'Chapters', 'Approve', NULL, '2024-05-25', '2024-05-25'),
(201, NULL, 8, 300, NULL, 'Course', 'Approve', NULL, '2024-05-27', '2024-05-27'),
(202, NULL, 8, 6.12, NULL, 'Chapters', 'Approve', NULL, '2024-05-28', '2024-05-28'),
(203, NULL, 8, 111, NULL, 'Package', 'Approve', NULL, '2024-05-30', '2024-05-30'),
(204, NULL, 8, 60, NULL, 'Package', 'Approve', NULL, '2024-06-04', '2024-06-04'),
(205, NULL, 8, 111, NULL, 'Package', 'Approve', NULL, '2024-06-05', '2024-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `payouts`
--

CREATE TABLE `payouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `affilate_id` bigint(20) UNSIGNED NOT NULL,
  `amount` float NOT NULL,
  `payment_method` bigint(20) UNSIGNED DEFAULT NULL,
  `statue` enum('pendding','approve','rejected') NOT NULL DEFAULT 'pendding',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `payouts`
--

INSERT INTO `payouts` (`id`, `date`, `affilate_id`, `amount`, `payment_method`, `statue`, `created_at`, `updated_at`) VALUES
(1, '2024-01-16', 1, 200, 2, 'approve', NULL, '2024-01-27'),
(3, '2024-04-25', 1, 200, 2, 'approve', '2024-04-25', '2024-04-25'),
(4, '2024-04-25', 1, 100, 2, 'pendding', '2024-04-25', '2024-04-25'),
(5, '2024-04-25', 1, 100, 2, 'approve', '2024-04-25', '2024-04-25');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'user', 'bbc09c6cd30d9b181974add3cfa31822cb433c24c8ea7a82b7752d867a8272b8', '[\"*\"]', NULL, NULL, '2023-12-26 11:36:12', '2023-12-26 11:36:12'),
(2, 'App\\Models\\User', 3, 'user', '69aea65dde048e556656dae788ffb98455457aa4cd36bda1f32a6acfcd6116d0', '[\"*\"]', NULL, NULL, '2023-12-26 11:38:02', '2023-12-26 11:38:02'),
(3, 'App\\Models\\User', 3, 'user', '228204018da2a9a74f5b9dd7d7ae316fb74f5e1d0b1d09ce4e696e4dedd6ca2c', '[\"*\"]', NULL, NULL, '2023-12-26 11:43:56', '2023-12-26 11:43:56'),
(4, 'App\\Models\\User', 3, 'user', 'd6ce215c2b1c6f5e333a03cce59eeb2a81acf3a1376a6a415976326f54ba45e0', '[\"*\"]', NULL, NULL, '2023-12-26 11:49:12', '2023-12-26 11:49:12'),
(5, 'App\\Models\\User', 3, 'user', 'fbb181f9597e41139789d1d9ca87d57c157ab126a34576e6807eda84abef656c', '[\"*\"]', NULL, NULL, '2023-12-26 11:50:53', '2023-12-26 11:50:53'),
(6, 'App\\Models\\User', 3, 'user', 'bc53e4026a08f1369eca591ff4d8ec20a80c0d1dc9b8130371d1b16ab994d290', '[\"*\"]', NULL, NULL, '2023-12-26 11:59:50', '2023-12-26 11:59:50'),
(7, 'App\\Models\\User', 3, 'user', '6af346ba5cbd724a37c6b8598dd426e2c28497b9c5e6d704efcd7ab3636bcb47', '[\"*\"]', NULL, NULL, '2023-12-26 12:00:14', '2023-12-26 12:00:14'),
(8, 'App\\Models\\User', 3, 'user', '9d5f52e338ec3bb7b1db634da7b8dcc476c8c82cf0aa6577c8896d8ce269fde0', '[\"*\"]', NULL, NULL, '2023-12-26 12:02:00', '2023-12-26 12:02:00'),
(9, 'App\\Models\\User', 3, 'user', '9b7d7ff71c6bfcc838bc999ae5c7a240d4bfbf37dc49d3c779457a53107f519f', '[\"*\"]', NULL, NULL, '2023-12-26 12:09:14', '2023-12-26 12:09:14'),
(10, 'App\\Models\\User', 3, 'user', '4e744b3be548780feb12e555fda87e352741c0b6514be2dc45aef03e7bbc5604', '[\"*\"]', NULL, NULL, '2023-12-26 12:09:33', '2023-12-26 12:09:33'),
(11, 'App\\Models\\User', 3, 'user', '8ae93bef6941dbaabd3994f08fecaa7019ae121c4abf3f4982bf6492cc17c6de', '[\"*\"]', NULL, NULL, '2023-12-26 12:17:52', '2023-12-26 12:17:52'),
(12, 'App\\Models\\User', 3, 'user', '28843eec2cd0f9dd31bd47b3523f114b5ff4cb76ca55039c396a71a5e558e00e', '[\"*\"]', NULL, NULL, '2023-12-26 12:18:44', '2023-12-26 12:18:44'),
(13, 'App\\Models\\User', 3, 'user', '890fed41874187a959ac479d687195e19976a89743e3f4142fbe7e2b480db2d8', '[\"*\"]', NULL, NULL, '2023-12-27 05:18:24', '2023-12-27 05:18:24'),
(14, 'App\\Models\\User', 3, 'user', 'f383a0db3de63c090a03406e6854629dcdc49470e3a37d68fed4530c4101483a', '[\"*\"]', NULL, NULL, '2023-12-27 05:38:04', '2023-12-27 05:38:04'),
(15, 'App\\Models\\User', 3, 'user', 'dc93f83f5bf50d6c88230623f0474e22aaea4ac51e2ae52a92a750466e6348d9', '[\"*\"]', NULL, NULL, '2023-12-27 06:52:42', '2023-12-27 06:52:42'),
(16, 'App\\Models\\User', 3, 'user', '18ac595b32677ff73128d3e8df5462f6dbea3b071b7b8f8f2dfe8f9d3bd49b3c', '[\"*\"]', NULL, NULL, '2023-12-28 05:14:28', '2023-12-28 05:14:28'),
(17, 'App\\Models\\User', 3, 'user', '4e01b781744d8ff3d17f875d8f62f2bb9e59e368d2781cf9dab1ae6e65e5bf6c', '[\"*\"]', NULL, NULL, '2023-12-28 06:04:15', '2023-12-28 06:04:15'),
(18, 'App\\Models\\User', 3, 'user', '014ad88c516a9ab4d47e53d6038c147fcf5dbde2340a9aa75cf3f83d95f597dc', '[\"*\"]', NULL, NULL, '2023-12-28 07:24:10', '2023-12-28 07:24:10'),
(19, 'App\\Models\\User', 3, 'user', '1329f18699b3175a738daa4fcfa844e6de22021a4b45c8533e5e1f544d7fecf1', '[\"*\"]', NULL, NULL, '2023-12-28 07:54:58', '2023-12-28 07:54:58'),
(20, 'App\\Models\\User', 3, 'user', 'c233f9ce3716e2f7bf41c9cd5fee6e5dd628b3a167490b0a1280c75e995a1875', '[\"*\"]', NULL, NULL, '2023-12-28 07:55:29', '2023-12-28 07:55:29'),
(21, 'App\\Models\\User', 3, 'user', 'ef75136f3d7910a2855aa7bedcd40304ac2363c7efc5624c3750b58086360898', '[\"*\"]', NULL, NULL, '2023-12-30 06:04:33', '2023-12-30 06:04:33'),
(22, 'App\\Models\\User', 3, 'user', '84074b2b6bf0eb540f1165b8140df283522b4957f51122e5cbefb4aa66308d42', '[\"*\"]', NULL, NULL, '2023-12-30 09:05:46', '2023-12-30 09:05:46'),
(23, 'App\\Models\\User', 3, 'user', 'cd5d03a7b6680940058985c5ece10cc7dc9a02172e165222607778484fca2cd5', '[\"*\"]', NULL, NULL, '2023-12-30 10:14:35', '2023-12-30 10:14:35'),
(24, 'App\\Models\\User', 19, 'user', '6af3e39d32f2ff2e0c7974a74e93b802c5e7fa4d8d19edd56f352a94d15e44aa', '[\"*\"]', NULL, NULL, '2023-12-30 11:56:55', '2023-12-30 11:56:55'),
(25, 'App\\Models\\User', 20, 'user', '4b4ef02966b59740e721ae15f4e7ab05d7692aa2dec5f1323abc65b48d39f144', '[\"*\"]', NULL, NULL, '2023-12-30 12:04:40', '2023-12-30 12:04:40'),
(26, 'App\\Models\\User', 21, 'user', '60e176dd2ded580d3039ae3aa5839e26ccdd9f8383d45291440c8b714bb0f50a', '[\"*\"]', NULL, NULL, '2023-12-30 12:07:06', '2023-12-30 12:07:06'),
(27, 'App\\Models\\User', 24, 'user', '356e919b05493f79e8b13985193da9522de772973a71469c5a996706da469ce3', '[\"*\"]', NULL, NULL, '2023-12-30 12:10:19', '2023-12-30 12:10:19'),
(28, 'App\\Models\\User', 26, 'user', '3672f9556bed1deb15ec5826be78fff985b52fe72757240de2cefbc0c192dc2c', '[\"*\"]', NULL, NULL, '2023-12-30 12:13:43', '2023-12-30 12:13:43'),
(29, 'App\\Models\\User', 28, 'user', '5463d4727ee521ed574e06531964cef828e5506e664cb0c4f564f835925340c3', '[\"*\"]', NULL, NULL, '2023-12-30 12:15:51', '2023-12-30 12:15:51'),
(30, 'App\\Models\\User', 29, 'user', '3ba63f4bdb1be5f13df54f56e1e162963c6f62fb2a8f73aed2fe637555612988', '[\"*\"]', NULL, NULL, '2023-12-30 12:21:52', '2023-12-30 12:21:52'),
(31, 'App\\Models\\User', 30, 'user', 'd964fcc5bf2c7c2ce7d3368e9e5862806cfefc5c9c5bcac66753a4cc72dc39e1', '[\"*\"]', NULL, NULL, '2023-12-30 12:24:24', '2023-12-30 12:24:24'),
(32, 'App\\Models\\User', 31, 'user', 'f61db1cdbef43720aca234f3ac60b088720549aa34a3215e36c5464604db67b9', '[\"*\"]', NULL, NULL, '2023-12-30 12:27:10', '2023-12-30 12:27:10'),
(33, 'App\\Models\\User', 32, 'user', '02cf0b84bc3402daac9f36a408b4856d0765e1332f178c3fb282d98d7fe4646d', '[\"*\"]', NULL, NULL, '2023-12-30 12:34:03', '2023-12-30 12:34:03'),
(34, 'App\\Models\\User', 33, 'user', '159f37926944efcb8477938b951673b68fe1226f7779564487678c6cccba4af6', '[\"*\"]', NULL, NULL, '2023-12-30 12:34:51', '2023-12-30 12:34:51'),
(35, 'App\\Models\\User', 3, 'user', '599109d078b6db3452e8b8f3579e5d37b9f06e202b0f4fa83189b3d3e1c44fe6', '[\"*\"]', NULL, NULL, '2023-12-30 12:44:37', '2023-12-30 12:44:37'),
(36, 'App\\Models\\User', 3, 'user', '403b97d39ee490f615d5bc6ece0f7a81468b6b38dca380b45e2c9e4c2d5b8aa7', '[\"*\"]', NULL, NULL, '2023-12-30 12:47:45', '2023-12-30 12:47:45'),
(37, 'App\\Models\\User', 34, 'user', 'd222e9e682b1e2741011f079a500965f1fe01c08d049c3f587be5c5517d30c67', '[\"*\"]', NULL, NULL, '2023-12-30 12:50:01', '2023-12-30 12:50:01'),
(38, 'App\\Models\\User', 35, 'user', '2ddb29d82f9c64fcde42803d613c08ef5fa245d4ada9c6c079488fb30fdfbef0', '[\"*\"]', NULL, NULL, '2023-12-30 12:51:40', '2023-12-30 12:51:40'),
(39, 'App\\Models\\User', 39, 'user', '0af2eb8d18c396f4a6b9126682a5df000043c7ac433d0c1853fd36571e735554', '[\"*\"]', NULL, NULL, '2023-12-31 06:08:08', '2023-12-31 06:08:08'),
(40, 'App\\Models\\User', 41, 'user', 'dbb903dfe2e971719f87a2b38a83e1656549c9e30c202fdfc5e5dbf3f430a20c', '[\"*\"]', NULL, NULL, '2023-12-31 06:11:42', '2023-12-31 06:11:42'),
(41, 'App\\Models\\User', 42, 'user', '8c68544f6ea3b955669fd53f5cb38ac4dadc00dc8ee10c6ad9f3d201c28ecb0e', '[\"*\"]', NULL, NULL, '2023-12-31 06:26:03', '2023-12-31 06:26:03'),
(42, 'App\\Models\\User', 43, 'user', '6326b2622c521fc15a909e4c1da7b4e4dcd76eb538b48cc65414b4c359be6044', '[\"*\"]', NULL, NULL, '2023-12-31 06:29:13', '2023-12-31 06:29:13'),
(43, 'App\\Models\\User', 44, 'user', '5b8227c8b00d644def452d432a8cb0521d31f4c1fba20cd76968e6cfc6814e88', '[\"*\"]', NULL, NULL, '2023-12-31 06:31:28', '2023-12-31 06:31:28'),
(44, 'App\\Models\\User', 45, 'user', '6e1fdedd86a89711f93cba3362f1822a67830d2b87547f6414fbe09fa7753474', '[\"*\"]', NULL, NULL, '2023-12-31 06:32:50', '2023-12-31 06:32:50'),
(45, 'App\\Models\\User', 46, 'user', '5d1dd3a709d6e9c3a83cec1e9a2fedb4e0c4207c4a946c1ceb99b4ae3aedf34a', '[\"*\"]', NULL, NULL, '2023-12-31 06:33:52', '2023-12-31 06:33:52'),
(46, 'App\\Models\\User', 47, 'user', '77efc28f9d2907d9cc74e0d946fd49db44449c3e603a55eb6c1c5237c123a252', '[\"*\"]', NULL, NULL, '2023-12-31 06:35:30', '2023-12-31 06:35:30'),
(47, 'App\\Models\\User', 48, 'user', 'caa1fd159fabd0fa9d157b844686e1004bd6cc0ca7e53b94972f77555a948030', '[\"*\"]', NULL, NULL, '2023-12-31 06:46:12', '2023-12-31 06:46:12'),
(48, 'App\\Models\\User', 49, 'user', 'b7728ad57ecdb10aa651d291575cfcea40446e584a8a116041ea12a2357c2205', '[\"*\"]', NULL, NULL, '2023-12-31 07:04:43', '2023-12-31 07:04:43'),
(49, 'App\\Models\\User', 3, 'user', '89008a946afd23384db0954d80abc0d318b2afd2b8364c638466582010a5c795', '[\"*\"]', NULL, NULL, '2023-12-31 07:18:44', '2023-12-31 07:18:44'),
(50, 'App\\Models\\User', 50, 'user', 'dc7596a02265b9ecc76a24b76b61032d26bbe67f23f8f4e7ac051246cc77d4a2', '[\"*\"]', NULL, NULL, '2023-12-31 09:09:09', '2023-12-31 09:09:09'),
(51, 'App\\Models\\User', 51, 'user', '5643ee987d2e55eb4d4d8cbd0258790b6ba6931de38596c0abc95044ff6e2bb0', '[\"*\"]', NULL, NULL, '2023-12-31 09:12:25', '2023-12-31 09:12:25'),
(52, 'App\\Models\\User', 52, 'user', '4e8682e0c63b280fb3814f8ebf8ffa7b71598a7d2a5ea3fd384ce0495fc63a48', '[\"*\"]', NULL, NULL, '2023-12-31 09:22:30', '2023-12-31 09:22:30'),
(53, 'App\\Models\\User', 3, 'user', 'ee8371348039a23df4a967958911e1bd2f115eeff75e85db7b709f8f0585075c', '[\"*\"]', NULL, NULL, '2023-12-31 09:22:46', '2023-12-31 09:22:46'),
(54, 'App\\Models\\User', 53, 'user', 'a199fc812b56df0184f3ee3fdb1f1930f6c7ea4d45bb8b2ff4dd284fdf159b43', '[\"*\"]', NULL, NULL, '2023-12-31 09:25:18', '2023-12-31 09:25:18'),
(55, 'App\\Models\\User', 54, 'user', '8d32833964cf32bc71538821e24e4bfaed9e1bd2b2507d85e60be307088bb474', '[\"*\"]', NULL, NULL, '2023-12-31 09:31:19', '2023-12-31 09:31:19'),
(56, 'App\\Models\\User', 55, 'user', 'b35bace04846a636042bb62f08eb3895636276ef5c5cc5fe32763ba9004ec72a', '[\"*\"]', NULL, NULL, '2023-12-31 09:34:08', '2023-12-31 09:34:08'),
(57, 'App\\Models\\User', 56, 'user', 'aa7d9188071449df07aa88ce84d347750daf644ea522b657356da40307aced12', '[\"*\"]', NULL, NULL, '2023-12-31 09:36:24', '2023-12-31 09:36:24'),
(58, 'App\\Models\\User', 3, 'user', 'bceeb27832292746b6fcb5788a6c31d3ab9e989c4917fbd082e90b0cfc304bb2', '[\"*\"]', NULL, NULL, '2023-12-31 09:43:21', '2023-12-31 09:43:21'),
(59, 'App\\Models\\User', 3, 'user', '0bd09b651d1d6613cee44be4f9c13489e7c96e7c10cd12586ba909ff6c9696a9', '[\"*\"]', NULL, NULL, '2024-01-01 05:05:14', '2024-01-01 05:05:14'),
(60, 'App\\Models\\User', 3, 'user', '092d538704b2747960f6bf43b9aa793d996595145d751cbc8d2838d3541c988a', '[\"*\"]', NULL, NULL, '2024-01-01 05:27:39', '2024-01-01 05:27:39'),
(61, 'App\\Models\\User', 3, 'user', '87dd6099d278905612f80781e09ac46cdc90457a205d3adb4dc5c16b942cfa18', '[\"*\"]', NULL, NULL, '2024-01-01 05:32:21', '2024-01-01 05:32:21'),
(62, 'App\\Models\\User', 3, 'user', '71bded3b51bf2e7efea4e7dbd30c6d69f2f48433ea5a2adfac76e363d385a1a0', '[\"*\"]', NULL, NULL, '2024-01-01 05:34:16', '2024-01-01 05:34:16'),
(63, 'App\\Models\\User', 3, 'user', 'd0869d14caaa063673c332bf1cf663524d2c7acb9de8bb0ca1ff2a099a54ee91', '[\"*\"]', NULL, NULL, '2024-01-01 06:01:13', '2024-01-01 06:01:13'),
(64, 'App\\Models\\User', 3, 'user', 'e58f3937773d4b9580b3ef1b18c8ccdf8758a1be48849963a226894e93d6e242', '[\"*\"]', NULL, NULL, '2024-01-01 09:47:51', '2024-01-01 09:47:51'),
(72, 'App\\Models\\User', 59, 'user', 'ce05c06e8a2b40099b2b733f3018fa7790c0366688631259d9adf4d6bd0caff0', '[\"*\"]', NULL, NULL, '2024-01-03 07:52:53', '2024-01-03 07:52:53'),
(351, 'App\\Models\\User', 68, 'user', 'adacddd5a184cf4ed638bce8408862d2acb2f432b58f3166506ec0d2b8a7cbd9', '[\"*\"]', NULL, NULL, '2024-03-23 07:58:53', '2024-03-23 07:58:53'),
(354, 'App\\Models\\User', 68, 'user', '78c401b3408e38d9c0472367bfe8aab0a3b477e558d5ff46ae553b580c718ec5', '[\"*\"]', NULL, NULL, '2024-03-23 08:46:26', '2024-03-23 08:46:26'),
(356, 'App\\Models\\User', 68, 'user', '53bb0516214740f1cbfe99363070ed0e432db48bea9371732b098652947c4b8a', '[\"*\"]', NULL, NULL, '2024-03-23 08:58:52', '2024-03-23 08:58:52'),
(372, 'App\\Models\\User', 8, 'user', 'd626f35d49791bafa12fbf5b570d3b5b0f6734153cb0d4ef694a7c8f60e8a290', '[\"*\"]', NULL, NULL, '2024-03-26 06:26:44', '2024-03-26 06:26:44'),
(373, 'App\\Models\\User', 8, 'user', '26629136c145bdc83239b177fd060460e049e367190d17810bc3b70503db1dc0', '[\"*\"]', NULL, NULL, '2024-03-26 09:06:12', '2024-03-26 09:06:12'),
(374, 'App\\Models\\User', 8, 'personal access tokens', 'f9431bc6b099488aaad8fa13a3fa0be6e4c30ae7cb0b650c0acdd74d79dceeaf', '[\"*\"]', '2024-03-26 11:04:07', NULL, '2024-03-26 09:27:02', '2024-03-26 11:04:07'),
(375, 'App\\Models\\User', 8, 'personal access tokens', 'f9c26e0713f8adc0a4bde9efaa6de9ce6f3f061f6719299205b34a81f51f4d92', '[\"*\"]', NULL, NULL, '2024-03-26 11:24:17', '2024-03-26 11:24:17'),
(376, 'App\\Models\\User', 8, 'personal access tokens', '89f568370538c39fe942898687c850515cb4ad442d40fcc3fd43dc5ffae1183a', '[\"*\"]', '2024-03-26 11:35:03', NULL, '2024-03-26 11:24:37', '2024-03-26 11:35:03'),
(377, 'App\\Models\\User', 8, 'user', '39eb012ac2efe3126dd8af200a13469bc78030f2c966609695f28b078f4f0913', '[\"*\"]', NULL, NULL, '2024-03-27 06:44:09', '2024-03-27 06:44:09'),
(378, 'App\\Models\\User', 8, 'user', '0f0f519ba783cae1d5b264b2f728ff9ae846919bc683891b0285f2efd6721d63', '[\"*\"]', NULL, NULL, '2024-03-27 06:58:21', '2024-03-27 06:58:21'),
(379, 'App\\Models\\User', 68, 'personal access tokens', 'c79ffdc1c890d57fba46af160360b04fcf85db1765770b3fd6d7830625e22a98', '[\"*\"]', '2024-03-27 09:52:02', NULL, '2024-03-27 09:51:06', '2024-03-27 09:52:02'),
(380, 'App\\Models\\User', 68, 'user', 'cdbf7e7e5aafe6e526b2615a0afd194714a87484cfecad120a62f199c95b8ad8', '[\"*\"]', NULL, NULL, '2024-03-27 10:16:53', '2024-03-27 10:16:53'),
(381, 'App\\Models\\User', 8, 'user', '996be8d25f6c9ba287e54db0ab9fa2a1a8dbc51276d20db74a1c7929dc285e49', '[\"*\"]', NULL, NULL, '2024-03-27 10:25:48', '2024-03-27 10:25:48'),
(382, 'App\\Models\\User', 68, 'user', 'de595f35a791ec943dd6d06ec3eeb11c110167fb6dae8d6794f7200b54cbe168', '[\"*\"]', NULL, NULL, '2024-03-27 10:27:40', '2024-03-27 10:27:40'),
(383, 'App\\Models\\User', 8, 'user', 'bf8ed786df26ecab364521fea49b159930f7ea723f4b6495b5fe9a4434666d81', '[\"*\"]', NULL, NULL, '2024-03-27 10:48:53', '2024-03-27 10:48:53'),
(384, 'App\\Models\\User', 8, 'personal access tokens', 'fc224908e79f2c42b40650851aa4b9a0ca25341b85924c679b5763890f9f99ab', '[\"*\"]', '2024-03-27 12:16:50', NULL, '2024-03-27 11:31:36', '2024-03-27 12:16:50'),
(385, 'App\\Models\\User', 71, 'user', '3e7caca177be4888ac0e2bec1b2faadda0977a171014f6400c29000f4d674d7a', '[\"*\"]', NULL, NULL, '2024-03-27 12:25:37', '2024-03-27 12:25:37'),
(386, 'App\\Models\\User', 71, 'user', 'cb5f0307b0e1d02ab8c3ea6cfd233f911832de69a4c4d364fa33b76deccb4004', '[\"*\"]', NULL, NULL, '2024-03-27 12:25:55', '2024-03-27 12:25:55'),
(387, 'App\\Models\\User', 71, 'user', '8abeb5b46961be6e86a8606a1ed83f7864cb2802db078fb2552155aa9384b9a5', '[\"*\"]', NULL, NULL, '2024-03-28 08:59:54', '2024-03-28 08:59:54'),
(388, 'App\\Models\\User', 71, 'user', '1a5b6b295592292846ec81e26000b9c6aec80f4a9394d9ef8e1490d63ba80307', '[\"*\"]', NULL, NULL, '2024-03-28 09:20:19', '2024-03-28 09:20:19'),
(389, 'App\\Models\\User', 8, 'personal access tokens', 'b817cd55f64549968b1b861015b1d0e9d12ac25f3d134ab9cecfa3613a3c9954', '[\"*\"]', '2024-04-02 08:57:53', NULL, '2024-03-28 09:50:00', '2024-04-02 08:57:53'),
(390, 'App\\Models\\User', 8, 'user', '47302024af6e5942141e408138f8e5d5a4a70c31113fe065e563c3bfb1fb688e', '[\"*\"]', NULL, NULL, '2024-03-28 10:52:34', '2024-03-28 10:52:34'),
(391, 'App\\Models\\User', 8, 'user', '71ba735d2cd1013c4a8abe2e3a5367393c914bcc8f061105726a909d87bcfec1', '[\"*\"]', NULL, NULL, '2024-03-30 06:51:00', '2024-03-30 06:51:00'),
(392, 'App\\Models\\User', 68, 'user', '47a6117e0bdf0bfd37f901040bea73c4ebf7aa1f3b6cba7d84c56b98b56bd038', '[\"*\"]', NULL, NULL, '2024-03-30 07:58:46', '2024-03-30 07:58:46'),
(393, 'App\\Models\\User', 8, 'user', 'b6f9510bede38013523d249affe56554baabb35a1d60385c72de48dc7d455b00', '[\"*\"]', NULL, NULL, '2024-03-30 08:06:41', '2024-03-30 08:06:41'),
(394, 'App\\Models\\User', 68, 'user', 'd55b67fd02967ab34a3d0b773dee2d839e5f9011704abe684753514fbd3a4f05', '[\"*\"]', NULL, NULL, '2024-03-30 08:42:52', '2024-03-30 08:42:52'),
(395, 'App\\Models\\User', 8, 'user', 'a8134c07ea4b1148fd7af25632ea8d60ae0875d7bd67377c605ba41845fbd723', '[\"*\"]', NULL, NULL, '2024-03-30 08:50:51', '2024-03-30 08:50:51'),
(396, 'App\\Models\\User', 68, 'user', '8b96396060a4dc436f328f4b6b6013d7b9a24664f4092ba124d555d3071286a2', '[\"*\"]', NULL, NULL, '2024-03-30 08:54:13', '2024-03-30 08:54:13'),
(397, 'App\\Models\\User', 8, 'user', '3c3bd37def094915480fe2e5b23b5087f65b3d7ff60878652b28fb6ea865f91f', '[\"*\"]', NULL, NULL, '2024-03-30 08:55:12', '2024-03-30 08:55:12'),
(398, 'App\\Models\\User', 68, 'user', '9430217050b9ba7c71fecea8a03e24d1fd7dc198af0fda578bb8a7d9b83d8079', '[\"*\"]', NULL, NULL, '2024-03-30 09:11:56', '2024-03-30 09:11:56'),
(399, 'App\\Models\\User', 8, 'user', 'fd387fd928aa74b15a9952c4d2283a2022b5c81c96d3459785aadf607e136d7e', '[\"*\"]', NULL, NULL, '2024-03-30 09:29:19', '2024-03-30 09:29:19'),
(400, 'App\\Models\\User', 71, 'user', '02d11af5335f20c40abb01fa165164c6f4871bd128a2f495a8cd2c44598f6dc1', '[\"*\"]', NULL, NULL, '2024-03-30 10:43:02', '2024-03-30 10:43:02'),
(401, 'App\\Models\\User', 68, 'user', '40c85ada97b97112681f441bda0aa4cad333d2ae59180288c2f7d96a61898f34', '[\"*\"]', NULL, NULL, '2024-03-30 10:43:25', '2024-03-30 10:43:25'),
(402, 'App\\Models\\User', 68, 'user', '10258eb4a2f5f9b4ac98e687e9f16fc4f4145fb45765d037adcb74520207de44', '[\"*\"]', NULL, NULL, '2024-03-31 06:26:51', '2024-03-31 06:26:51'),
(403, 'App\\Models\\User', 68, 'user', 'b76f5329fdcc889c60773fa603ed22047d45f0a55e0c4c80f12ff0faae4ef617', '[\"*\"]', NULL, NULL, '2024-04-01 06:28:49', '2024-04-01 06:28:49'),
(404, 'App\\Models\\User', 8, 'user', '85dd9794229ffee38382c3322d369c96fa397faa9eb0a4960bb9b341bf05a38e', '[\"*\"]', NULL, NULL, '2024-04-01 06:34:22', '2024-04-01 06:34:22'),
(405, 'App\\Models\\User', 8, 'personal access tokens', 'f9cec1bbd26c1a8d03c0add375e72ccd53d38d063b82b920767cade2d88169e7', '[\"*\"]', '2024-04-27 09:53:28', NULL, '2024-04-01 09:35:50', '2024-04-27 09:53:28'),
(406, 'App\\Models\\User', 68, 'user', 'bcad7950f77a79ede923400ebae35920f75461f9b25d401081ba74d275b631da', '[\"*\"]', NULL, NULL, '2024-04-01 10:39:30', '2024-04-01 10:39:30'),
(407, 'App\\Models\\User', 68, 'user', 'e3ed3916a444b555ae8af050d9212973e56f2d99d38112faebc740cfe7ff2df3', '[\"*\"]', NULL, NULL, '2024-04-02 06:49:26', '2024-04-02 06:49:26'),
(408, 'App\\Models\\User', 71, 'user', '4760fd59c5b047f94b8c2c7e1ad39552775ccdca72626661d57bb27831430d78', '[\"*\"]', NULL, NULL, '2024-04-02 06:50:33', '2024-04-02 06:50:33'),
(409, 'App\\Models\\User', 68, 'user', 'b78d42e4f36f039f55bcd35b8f8834ff001daf79505702c9ee0d258aba7461cd', '[\"*\"]', NULL, NULL, '2024-04-02 06:52:22', '2024-04-02 06:52:22'),
(410, 'App\\Models\\User', 8, 'user', 'e54533e486199942bce76bdfc7981213ddec56a8015c764133178ff32cf4945f', '[\"*\"]', NULL, NULL, '2024-04-02 07:11:51', '2024-04-02 07:11:51'),
(411, 'App\\Models\\User', 68, 'user', '516cf19663dcb5460462c24106264fb63e46099553622b3e858cb7ad0dd6cd89', '[\"*\"]', NULL, NULL, '2024-04-02 07:12:36', '2024-04-02 07:12:36'),
(412, 'App\\Models\\User', 8, 'user', '4dc2587232ea524816069de4d7e1e34480dc29efe16ec2967d5966e33eb8c555', '[\"*\"]', NULL, NULL, '2024-04-02 07:41:51', '2024-04-02 07:41:51'),
(413, 'App\\Models\\User', 71, 'user', 'bb7967497ed56e67de603dd72d2922b62c3701c2839eef4ff77e82403f3ee86c', '[\"*\"]', NULL, NULL, '2024-04-02 07:45:13', '2024-04-02 07:45:13'),
(414, 'App\\Models\\User', 8, 'user', 'fae4663b5e34cc37f40b00b6c270df0d9c7499c5ad94b3127d8cfab574c72002', '[\"*\"]', NULL, NULL, '2024-04-02 07:46:58', '2024-04-02 07:46:58'),
(415, 'App\\Models\\User', 8, 'personal access tokens', '9b46ffb7eab2c557f7c16b974fea06f81773f6663cfa1398e84407dafdee2d99', '[\"*\"]', '2024-04-06 06:45:36', NULL, '2024-04-02 08:56:51', '2024-04-06 06:45:36'),
(416, 'App\\Models\\User', 68, 'user', '35eae64550a9897078ee00a8b3a7e2e0b843dae7fb56ccc05d5b46c4dfc66ccf', '[\"*\"]', NULL, NULL, '2024-04-02 09:15:54', '2024-04-02 09:15:54'),
(417, 'App\\Models\\User', 8, 'user', 'fd414427d498bb7f5af8e8cb4bec074582f391be81dc30482aae6e8fb00e2484', '[\"*\"]', NULL, NULL, '2024-04-02 09:19:36', '2024-04-02 09:19:36'),
(418, 'App\\Models\\User', 68, 'user', '631bd6f1025e101d5bc64933ad36e304a0b6fa3b8e1e79b0d4d65141b335601f', '[\"*\"]', NULL, NULL, '2024-04-02 09:28:15', '2024-04-02 09:28:15'),
(419, 'App\\Models\\User', 8, 'user', 'c2cbc83e18e417f1cfa567eb1d079cdf474e1195fb6dd4926f2bc136e31874ab', '[\"*\"]', NULL, NULL, '2024-04-02 09:58:54', '2024-04-02 09:58:54'),
(420, 'App\\Models\\User', 8, 'personal access tokens', 'd486b65d28dc6eae0bb14e379b44c1df5b82fef1021ddd493ea821244598df08', '[\"*\"]', NULL, NULL, '2024-04-02 10:01:34', '2024-04-02 10:01:34'),
(421, 'App\\Models\\User', 8, 'user', '4b3305374ba8282521a23cc8a530a3c9e264c375a316f08aac37752accb5b7d5', '[\"*\"]', NULL, NULL, '2024-04-02 12:08:07', '2024-04-02 12:08:07'),
(422, 'App\\Models\\User', 8, 'user', '5c208f149de83f3ed13d941acc7cdb135c18e651621a75e81290c3e969a25788', '[\"*\"]', NULL, NULL, '2024-04-03 06:36:28', '2024-04-03 06:36:28'),
(423, 'App\\Models\\User', 8, 'user', '41196f86cf5a637782e187e5642d3e33c7ad56d4b272b88b73009c3d14c50abc', '[\"*\"]', NULL, NULL, '2024-04-03 10:17:13', '2024-04-03 10:17:13'),
(424, 'App\\Models\\User', 68, 'user', '28a2d0fbcd53241dc5201a42052899f16e54972e636b4a8fa3d126ef40ec846a', '[\"*\"]', NULL, NULL, '2024-04-03 11:11:33', '2024-04-03 11:11:33'),
(425, 'App\\Models\\User', 8, 'user', 'c92dfdb06c16e73c5deb15c1725b4da31be58cbac226b190761ed233c42c78d9', '[\"*\"]', NULL, NULL, '2024-04-03 11:26:27', '2024-04-03 11:26:27'),
(426, 'App\\Models\\User', 8, 'user', '66b50be9a978194ddf646630a74815d06a8e16a5fb55e286a0bb6fd2e35ba549', '[\"*\"]', NULL, NULL, '2024-04-04 09:56:05', '2024-04-04 09:56:05'),
(427, 'App\\Models\\User', 68, 'user', 'c77210b2b026bfe5f8c267dee83126b1174037cc6e0299ed8bbb4ed0343eda87', '[\"*\"]', NULL, NULL, '2024-04-04 11:11:11', '2024-04-04 11:11:11'),
(428, 'App\\Models\\User', 68, 'user', '188604f8ac6ff1c6623392b983e913953251e0f3b6bfdaf14006f09fd6c90000', '[\"*\"]', NULL, NULL, '2024-04-05 12:31:59', '2024-04-05 12:31:59'),
(429, 'App\\Models\\User', 68, 'user', '7015cfaca96c4f91d3fe7663faf216a803f673cd65412d9c7bb3ce2e36ade6b6', '[\"*\"]', NULL, NULL, '2024-04-06 05:51:34', '2024-04-06 05:51:34'),
(430, 'App\\Models\\User', 8, 'user', 'bb48078a29fb71274b05de865e1033621da142048cbfe3f6284ec33dada59a7a', '[\"*\"]', NULL, NULL, '2024-04-06 06:03:00', '2024-04-06 06:03:00'),
(431, 'App\\Models\\User', 68, 'user', '6b5a7d8519cbf4f4f2e844237101c97803892a263c8d4569dea9bcc19ff2e259', '[\"*\"]', NULL, NULL, '2024-04-06 06:51:08', '2024-04-06 06:51:08'),
(432, 'App\\Models\\User', 8, 'user', '2b2688b3e323d917df41d936206121b7b491604c3cf481e13de362270ab5d935', '[\"*\"]', NULL, NULL, '2024-04-06 07:57:34', '2024-04-06 07:57:34'),
(433, 'App\\Models\\User', 68, 'user', '344627c9f7cbd4580bfae23847a0249139e1d02f4adf37dadd2d5170dea9557c', '[\"*\"]', NULL, NULL, '2024-04-06 08:43:24', '2024-04-06 08:43:24'),
(434, 'App\\Models\\User', 68, 'user', 'a46f20af1cb7daf2704a524bf2e2718bcbbdf97cf0eba08b702fd10163883fe0', '[\"*\"]', NULL, NULL, '2024-04-06 11:15:02', '2024-04-06 11:15:02'),
(435, 'App\\Models\\User', 5, 'user', 'b7566c8b7183d5ef1e9cc8f78e214f308dc6f96a2546d3aa98b649f6bc9b435f', '[\"*\"]', NULL, NULL, '2024-04-06 11:15:47', '2024-04-06 11:15:47'),
(436, 'App\\Models\\User', 5, 'user', '6a37b70d87874a6ee1a5fe69603bdc8fcf9d2dfd0cd476bff19d4ffe5b905a90', '[\"*\"]', NULL, NULL, '2024-04-06 11:38:12', '2024-04-06 11:38:12'),
(437, 'App\\Models\\User', 68, 'user', '2a5e6e44712bd9c0929d4eaaf8044bce77ce7a6fee2ef34b209931c9069e95a8', '[\"*\"]', NULL, NULL, '2024-04-06 11:59:07', '2024-04-06 11:59:07'),
(438, 'App\\Models\\User', 8, 'personal access tokens', 'd4172193e3e9a5bf59b22cea1060d48737f7d254009ed5412d0a69bf3da486cd', '[\"*\"]', NULL, NULL, '2024-04-07 09:31:28', '2024-04-07 09:31:28'),
(439, 'App\\Models\\User', 8, 'user', '6598f62f18480124f48fc316dc221f5e04b0d8b4967f5fdf0f57dc3eb3d09379', '[\"*\"]', NULL, NULL, '2024-04-07 10:48:20', '2024-04-07 10:48:20'),
(440, 'App\\Models\\User', 8, 'user', '08fe58088f2fc02ccda7164d7e36f0fb538f686a795f231e52eb33e40beb6196', '[\"*\"]', NULL, NULL, '2024-04-07 10:59:31', '2024-04-07 10:59:31'),
(441, 'App\\Models\\User', 68, 'user', '4bc41cfbc6e48fce1050cb22cde9d579940668e34d1c9c98e34d6ad3382afa57', '[\"*\"]', NULL, NULL, '2024-04-08 06:20:06', '2024-04-08 06:20:06'),
(442, 'App\\Models\\User', 8, 'user', '40c1bd57d244eab3e1d97b18f4c7832b878c8e3f97eca5d2647bcb6f65a0acdf', '[\"*\"]', NULL, NULL, '2024-04-08 06:30:36', '2024-04-08 06:30:36'),
(443, 'App\\Models\\User', 68, 'user', '5bb10df8c91b2d8c25a1d72366db881bc125b3c87d8ac6ff3b6c87ed6c7a0783', '[\"*\"]', NULL, NULL, '2024-04-08 07:17:27', '2024-04-08 07:17:27'),
(444, 'App\\Models\\User', 8, 'user', 'ae553ffac9b0ed56cb9e4c4e5007827a57376dc9a11f41c2bb87d216384608e1', '[\"*\"]', NULL, NULL, '2024-04-08 07:35:26', '2024-04-08 07:35:26'),
(445, 'App\\Models\\User', 68, 'user', 'dccf8047f457e8a9eb98a50b75213aed2efa9203c8c5473b43cf94b02421d682', '[\"*\"]', NULL, NULL, '2024-04-08 07:35:42', '2024-04-08 07:35:42'),
(446, 'App\\Models\\User', 8, 'user', 'ea382e0c276021d351c448200b2887f4c1243d171dc98305a5f0e79e071a75ad', '[\"*\"]', NULL, NULL, '2024-04-08 07:40:27', '2024-04-08 07:40:27'),
(447, 'App\\Models\\User', 8, 'user', '8fff92bf91ccd26b46edc7db0f99d9a50e519eef5e87bfa8c320149448498990', '[\"*\"]', NULL, NULL, '2024-04-08 07:42:06', '2024-04-08 07:42:06'),
(448, 'App\\Models\\User', 68, 'user', 'edfdd890dd4b6f1afcfbf004cb832566ae72186e0643d1be0d132ba2890bdf7a', '[\"*\"]', NULL, NULL, '2024-04-08 07:43:24', '2024-04-08 07:43:24'),
(449, 'App\\Models\\User', 68, 'user', 'eb0361cca6acce74804aa28798c5de0e7a9452158908e9b17269ffc078e4fe56', '[\"*\"]', NULL, NULL, '2024-04-08 07:46:25', '2024-04-08 07:46:25'),
(450, 'App\\Models\\User', 8, 'user', '64f96abd393b627529d020419f67c293bda05d52b4e6fe5c5d5ed430301b7740', '[\"*\"]', NULL, NULL, '2024-04-08 07:48:12', '2024-04-08 07:48:12'),
(451, 'App\\Models\\User', 68, 'user', 'd146700855d31b983fdb35abadc180580615465d1b26696bdd5b4c7412b6e609', '[\"*\"]', NULL, NULL, '2024-04-08 07:48:29', '2024-04-08 07:48:29'),
(452, 'App\\Models\\User', 68, 'user', '8f3bf9ddfff2327dfcdcda11b8566815ace6c7dc5651fadf7cd7ef6c0d985a67', '[\"*\"]', NULL, NULL, '2024-04-08 08:01:42', '2024-04-08 08:01:42'),
(453, 'App\\Models\\User', 8, 'user', '4e5170452b35dfcfeabd810afd06500571473c963173b30a2916de332f5ce95d', '[\"*\"]', NULL, NULL, '2024-04-08 08:47:05', '2024-04-08 08:47:05'),
(454, 'App\\Models\\User', 8, 'user', 'ca370ca7ff5480d4b073bea1fc9b317714d3baae6bf92a9c658dcb74946f0da7', '[\"*\"]', NULL, NULL, '2024-04-08 09:09:37', '2024-04-08 09:09:37'),
(455, 'App\\Models\\User', 68, 'user', '577b19b562a13eb22524e01c6d7d3a07d469a99ffe524d58f3a7a2cf469c3eaf', '[\"*\"]', NULL, NULL, '2024-04-08 09:40:46', '2024-04-08 09:40:46'),
(456, 'App\\Models\\User', 72, 'user', 'e5d77a6e19100cc975e100196de1d41e2cf2efd04c44a4859562f8fcba562dac', '[\"*\"]', NULL, NULL, '2024-04-08 09:44:47', '2024-04-08 09:44:47'),
(457, 'App\\Models\\User', 68, 'user', '862e3e68677ad50b430d79b39b02341ce8a5455dad00f03225dc70c168ecda55', '[\"*\"]', NULL, NULL, '2024-04-08 09:47:38', '2024-04-08 09:47:38'),
(458, 'App\\Models\\User', 73, 'user', '6cbeefab7a65d6f6047beca91043ad2d4733288fea0dc273485aeb14f1b42397', '[\"*\"]', NULL, NULL, '2024-04-08 09:49:57', '2024-04-08 09:49:57'),
(459, 'App\\Models\\User', 74, 'user', '0ad9c3169d3f757c58162f530f74ba445efd39d7e5287af6d432a62931757361', '[\"*\"]', NULL, NULL, '2024-04-08 10:02:04', '2024-04-08 10:02:04'),
(460, 'App\\Models\\User', 68, 'user', '739b4a77964c938ed06840916d777c6eeeded1e2e770b51a304799ffcaf769bd', '[\"*\"]', NULL, NULL, '2024-04-08 10:05:02', '2024-04-08 10:05:02'),
(461, 'App\\Models\\User', 8, 'user', '17c07dd81f106f65c8f56528a8d87ad6e8861b3e661ad00b13d827937deb1c58', '[\"*\"]', NULL, NULL, '2024-04-08 10:33:27', '2024-04-08 10:33:27'),
(462, 'App\\Models\\User', 68, 'user', 'e7125ab3d8b848808785514ebbe1731bbae2af8ee980009b7f50f03b59929655', '[\"*\"]', NULL, NULL, '2024-04-08 10:53:46', '2024-04-08 10:53:46'),
(463, 'App\\Models\\User', 68, 'user', '0eaf93dfb4674cab0b5cd2e88b33dbd75874b693468ad59e0da1727980cbf2a2', '[\"*\"]', NULL, NULL, '2024-04-09 06:49:28', '2024-04-09 06:49:28'),
(464, 'App\\Models\\User', 8, 'personal access tokens', '7e49036e4f821741581ca65c540243efab17c1d0135911945bfb95dab1d53637', '[\"*\"]', '2024-04-14 10:46:16', NULL, '2024-04-09 06:56:28', '2024-04-14 10:46:16'),
(465, 'App\\Models\\User', 8, 'user', '90b75e0547f918ca12c494afa88e226022a5d53bea0542a4b17476617bed8569', '[\"*\"]', NULL, NULL, '2024-04-09 09:13:54', '2024-04-09 09:13:54'),
(466, 'App\\Models\\User', 68, 'user', 'ee1a2577fdda0f344733622f93ad366c0ea64bd88f2dcaff6a481d7cbbdb41b8', '[\"*\"]', NULL, NULL, '2024-04-09 09:26:08', '2024-04-09 09:26:08'),
(467, 'App\\Models\\User', 8, 'user', '755e4d803706ae09e40d645fbf0a4250024a7e26ec927a76bc655f8103cb972f', '[\"*\"]', NULL, NULL, '2024-04-09 11:33:07', '2024-04-09 11:33:07'),
(468, 'App\\Models\\User', 68, 'user', 'e9cd9f1b23d6cab4ae47c04f1039cc86fb0aa9c01657df14a3d115192f64b96f', '[\"*\"]', NULL, NULL, '2024-04-09 12:11:09', '2024-04-09 12:11:09'),
(469, 'App\\Models\\User', 8, 'user', 'fc7f704aafa5ff9412d4006ac0187ab8a7dc309417bcd6909b4252a3752646cf', '[\"*\"]', NULL, NULL, '2024-04-09 12:13:23', '2024-04-09 12:13:23'),
(470, 'App\\Models\\User', 8, 'user', '8e3b6af0b711b68dd6acd601765f0ef1cfc07ebb6d07c4aee8529c450ee6c64b', '[\"*\"]', NULL, NULL, '2024-04-09 12:21:30', '2024-04-09 12:21:30'),
(471, 'App\\Models\\User', 68, 'user', '899449d34bf7c68d63709fff021794e15fc6fbd23b2f8f2e2c45885f29b9d8aa', '[\"*\"]', NULL, NULL, '2024-04-09 12:21:51', '2024-04-09 12:21:51'),
(472, 'App\\Models\\User', 68, 'user', '8f874045dc50f037a53d47247d6acb70da4511857a7d6e76fdb4cc9ff7812c1b', '[\"*\"]', NULL, NULL, '2024-04-14 09:04:26', '2024-04-14 09:04:26'),
(473, 'App\\Models\\User', 8, 'user', '0ef9b0febdc5be1dea1e45a4ed3c5a379a1c796ece0cd5faac59d5aa49ce1694', '[\"*\"]', NULL, NULL, '2024-04-15 05:13:45', '2024-04-15 05:13:45'),
(474, 'App\\Models\\User', 8, 'personal access tokens', '4d8843139a29e8bfa82a4bf103ccf0366c537c2ee15719e10ac3b4f78b53d84d', '[\"*\"]', '2024-04-16 06:26:29', NULL, '2024-04-15 06:16:20', '2024-04-16 06:26:29'),
(475, 'App\\Models\\User', 68, 'user', '05b26921104a38b834dd120b6ff6fef3ff99033aaccbe68a10db2706be1fd8e8', '[\"*\"]', NULL, NULL, '2024-04-15 09:57:00', '2024-04-15 09:57:00'),
(476, 'App\\Models\\User', 8, 'user', '4fef9a24ecccd5afa0270573711484a3606b850e62d98c030b0f51bc41c565b7', '[\"*\"]', NULL, NULL, '2024-04-15 09:59:21', '2024-04-15 09:59:21'),
(477, 'App\\Models\\User', 68, 'user', 'efb410f87e50292ad0a331a4c089c2589297d06861040c2a28692d679380f74e', '[\"*\"]', NULL, NULL, '2024-04-15 10:01:24', '2024-04-15 10:01:24'),
(478, 'App\\Models\\User', 8, 'user', '6a32b8e03ed52627db643f790c0d5ae05cd85f4fb31f534468b75e80cda909dd', '[\"*\"]', NULL, NULL, '2024-04-15 10:04:20', '2024-04-15 10:04:20'),
(479, 'App\\Models\\User', 68, 'user', 'b43eac7d517602dfb8efcc52f54804a42507c1ed4658e138ab0c31e74df809c4', '[\"*\"]', NULL, NULL, '2024-04-15 10:04:47', '2024-04-15 10:04:47'),
(480, 'App\\Models\\User', 8, 'user', '5fe697b60d98001b71a4c0200b8af17b68fe4de4405ee5d3b6e6abd96ca86ba7', '[\"*\"]', NULL, NULL, '2024-04-15 10:13:37', '2024-04-15 10:13:37'),
(481, 'App\\Models\\User', 68, 'user', '7487759a819ec7e4f5b46551d356ce9ef62741df79e18805e8cf46c5569f1e44', '[\"*\"]', NULL, NULL, '2024-04-15 10:31:18', '2024-04-15 10:31:18'),
(482, 'App\\Models\\User', 8, 'user', '17344466b721d581bc1ff098a352e56fee184f3a589c4ce16c2118a62e180c2b', '[\"*\"]', NULL, NULL, '2024-04-15 10:41:01', '2024-04-15 10:41:01'),
(483, 'App\\Models\\User', 68, 'user', '76043d1942e5b497987387d892cdf9e3da0335b55f229409e502b0eb42099f44', '[\"*\"]', NULL, NULL, '2024-04-15 10:54:13', '2024-04-15 10:54:13'),
(484, 'App\\Models\\User', 8, 'user', '275ab7ecfc88cc9dfa17ba3f7e5d9366e5aabdc44df75b348808dd2bf30a982b', '[\"*\"]', NULL, NULL, '2024-04-15 10:54:53', '2024-04-15 10:54:53'),
(485, 'App\\Models\\User', 68, 'user', 'c59149107e056d237f336916385961a8599386772116d980275c82cf11415225', '[\"*\"]', NULL, NULL, '2024-04-15 11:08:18', '2024-04-15 11:08:18'),
(486, 'App\\Models\\User', 8, 'user', 'dc4f1b2c46ca32866baa80914b50515b8ab97ffc33830205f59b5c78d027ae51', '[\"*\"]', NULL, NULL, '2024-04-15 11:33:32', '2024-04-15 11:33:32'),
(487, 'App\\Models\\User', 8, 'user', '3ec251f7d9d156de6cf192d193697d7c13512eea8db21cae3b31588baa7ca6ce', '[\"*\"]', NULL, NULL, '2024-04-15 11:34:19', '2024-04-15 11:34:19'),
(488, 'App\\Models\\User', 68, 'user', 'db1e9882675a3e0cbd888661fcd6b3c185bd00af9a3857607cc46574dfe724e2', '[\"*\"]', NULL, NULL, '2024-04-15 11:34:35', '2024-04-15 11:34:35'),
(489, 'App\\Models\\User', 8, 'user', '98cee72f4c14e3c137039d5f6ea672cdeab9e40c35037fe4f39a19921af1dd29', '[\"*\"]', NULL, NULL, '2024-04-16 05:36:30', '2024-04-16 05:36:30'),
(490, 'App\\Models\\User', 68, 'user', 'f35c96c51463ee191a67c2e591a91468ed6720da3401252e4cd023f743e225d9', '[\"*\"]', NULL, NULL, '2024-04-16 07:25:56', '2024-04-16 07:25:56'),
(491, 'App\\Models\\User', 8, 'user', '9af71da39c64a160ff8e0a1df2a4e34f6a230cbd7b099200040f69266e5562fa', '[\"*\"]', NULL, NULL, '2024-04-16 07:35:04', '2024-04-16 07:35:04'),
(492, 'App\\Models\\User', 68, 'user', '4a71bef6bced245927fdee3eba688d8c06f95235e65b4932c6f12207d856bc76', '[\"*\"]', NULL, NULL, '2024-04-16 07:59:33', '2024-04-16 07:59:33'),
(493, 'App\\Models\\User', 8, 'user', '2558236d438f2e38a756245f108c7ab2a68db7146141fc5cb2cc3ad256590413', '[\"*\"]', NULL, NULL, '2024-04-16 11:23:54', '2024-04-16 11:23:54'),
(494, 'App\\Models\\User', 8, 'user', '21dc63cefb08715651a8898278398516dd3e84b8f0f98c23dca7126e6cef9129', '[\"*\"]', NULL, NULL, '2024-04-17 05:38:21', '2024-04-17 05:38:21'),
(495, 'App\\Models\\User', 68, 'user', '20bd2cf71ec6835c881343f6708c653768cbf826ee4cf0fd873b9e8187d96c84', '[\"*\"]', NULL, NULL, '2024-04-17 05:44:53', '2024-04-17 05:44:53'),
(496, 'App\\Models\\User', 8, 'user', '33e449c06d1a5f6bc9986b6912700ce1e666007b41a0cc96a88d1c1fda5cc4af', '[\"*\"]', NULL, NULL, '2024-04-17 06:33:49', '2024-04-17 06:33:49'),
(497, 'App\\Models\\User', 8, 'user', '6a5b8dae23a4955c0091043fe4272665cc79baf312452981e778a89017427745', '[\"*\"]', NULL, NULL, '2024-04-17 06:41:25', '2024-04-17 06:41:25'),
(498, 'App\\Models\\User', 68, 'user', '7b0626c02b9568b037ca7ae82864d3ab377dabd517da1c90d3df620770f8e6f8', '[\"*\"]', NULL, NULL, '2024-04-17 06:43:34', '2024-04-17 06:43:34'),
(499, 'App\\Models\\User', 8, 'user', '63d71317ca064b925798220afbe559c275ae3328a5fc84a037540d61f7b46ec8', '[\"*\"]', NULL, NULL, '2024-04-17 07:37:22', '2024-04-17 07:37:22'),
(500, 'App\\Models\\User', 8, 'user', '05b3b693ae65f3bc0313741d8d43d40f1d13af4dd9ea2aa06a632280cfc53ce1', '[\"*\"]', NULL, NULL, '2024-04-17 09:47:32', '2024-04-17 09:47:32'),
(501, 'App\\Models\\User', 68, 'user', '0af69a8d9bdb5249698b65a7f16f954e5d4cd6f32531701a5048c276a8f0beb0', '[\"*\"]', NULL, NULL, '2024-04-17 09:58:39', '2024-04-17 09:58:39'),
(502, 'App\\Models\\User', 8, 'user', '8bac96732e6384bf51fb037b45b403928be5b973782043b82111a5b2cbd3463c', '[\"*\"]', NULL, NULL, '2024-04-17 10:12:18', '2024-04-17 10:12:18'),
(503, 'App\\Models\\User', 68, 'user', 'f98b425fba86a0dd45c5213c1a4ef6b888b40317b044c98ac97d755107acf5c6', '[\"*\"]', NULL, NULL, '2024-04-17 10:12:40', '2024-04-17 10:12:40'),
(504, 'App\\Models\\User', 8, 'user', '901453f48967ac4de55394dcdbadb7ef96fe4c6a28cfc0af6cf7420355dec4eb', '[\"*\"]', NULL, NULL, '2024-04-17 10:59:25', '2024-04-17 10:59:25'),
(505, 'App\\Models\\User', 68, 'user', '85ef7ddd7827f5f8c7795537ccb04d3f17d733bf49050f07eddc938ba623a995', '[\"*\"]', NULL, NULL, '2024-04-17 11:03:28', '2024-04-17 11:03:28'),
(506, 'App\\Models\\User', 68, 'user', '7373bd2ca1d5f4b5a92d77214cf85a56abd614da90d0025a81e6b28c7d062e59', '[\"*\"]', NULL, NULL, '2024-04-18 09:03:29', '2024-04-18 09:03:29'),
(507, 'App\\Models\\User', 68, 'user', '5d64f93b8ba11b2cf0764dc7ea879fe90711d216d34c06ea8ac5dacaf0f547f8', '[\"*\"]', NULL, NULL, '2024-04-18 15:09:38', '2024-04-18 15:09:38'),
(508, 'App\\Models\\User', 8, 'user', '07c97aebb766a435be833e622d7ef7d463bc63748ace5119405f65ad52384b79', '[\"*\"]', NULL, NULL, '2024-04-18 15:13:45', '2024-04-18 15:13:45'),
(509, 'App\\Models\\User', 68, 'user', '5e2ce7af3dbc7cef5126a97facee455928a0ef52977a812a25488eb0e5f3f5f9', '[\"*\"]', NULL, NULL, '2024-04-20 05:11:26', '2024-04-20 05:11:26'),
(510, 'App\\Models\\User', 68, 'user', 'fecaf0cf29afb10995c1a4f58abab1840afbc67fd3581a37740dc86822311f7b', '[\"*\"]', NULL, NULL, '2024-04-20 05:13:25', '2024-04-20 05:13:25'),
(511, 'App\\Models\\User', 8, 'user', 'dc50239161b97f15b85adb45a3375754655a050127b729641f2f054d98171f51', '[\"*\"]', NULL, NULL, '2024-04-20 05:13:42', '2024-04-20 05:13:42'),
(512, 'App\\Models\\User', 68, 'user', 'd9dd2c162ade09b2581f3400299532f806ffafee05ef901fb29f60475caf5869', '[\"*\"]', NULL, NULL, '2024-04-20 05:24:57', '2024-04-20 05:24:57'),
(513, 'App\\Models\\User', 8, 'user', '3d41e805083ea94d8c8d14013d54bc6e4f0c8c79ddd8e406bbbad4440bff0691', '[\"*\"]', NULL, NULL, '2024-04-20 06:32:00', '2024-04-20 06:32:00'),
(514, 'App\\Models\\User', 68, 'user', '44031a169a195cd83f7fba9b98492d908d143b48661087ac9d4b741a3e611bdf', '[\"*\"]', NULL, NULL, '2024-04-20 06:44:49', '2024-04-20 06:44:49'),
(515, 'App\\Models\\User', 68, 'user', '04fbfd01a8b4492fab44c255245121a8d9e19c36c4b3c86aec0d525d8b20a65c', '[\"*\"]', NULL, NULL, '2024-04-20 11:20:09', '2024-04-20 11:20:09'),
(516, 'App\\Models\\User', 68, 'user', '622b6129db916bd881349840c0d9fa37667850b4a57a00e389f5b8d72bf7cb8d', '[\"*\"]', NULL, NULL, '2024-04-21 05:25:01', '2024-04-21 05:25:01'),
(517, 'App\\Models\\User', 8, 'user', '8c11ce6b76753dfa1b0acda1892691bf5de9f41f37384e1a2e2474d29fc26b59', '[\"*\"]', NULL, NULL, '2024-04-21 05:58:07', '2024-04-21 05:58:07'),
(518, 'App\\Models\\User', 8, 'user', 'b3aceff6831780e756a2bc6ed59c6e8ee069b67b833a2e6875e0723c8330b125', '[\"*\"]', NULL, NULL, '2024-04-21 09:06:12', '2024-04-21 09:06:12'),
(519, 'App\\Models\\User', 68, 'user', '8298b7103c956a7514685f7c27c7efc7a296046059cef79521312b5685ab8498', '[\"*\"]', NULL, NULL, '2024-04-21 11:00:40', '2024-04-21 11:00:40'),
(520, 'App\\Models\\User', 8, 'user', 'ecd3c9e08676647e53720a54d1e4526a11953e1d7c59baaf5dc6a35d3e75cdbc', '[\"*\"]', NULL, NULL, '2024-04-21 11:13:47', '2024-04-21 11:13:47'),
(521, 'App\\Models\\User', 68, 'user', '077e6fab86cfe07ee35ccc7537627d13d2ce058aa0a8cbd1c7c750cb322708c6', '[\"*\"]', NULL, NULL, '2024-04-21 11:14:50', '2024-04-21 11:14:50'),
(522, 'App\\Models\\User', 8, 'user', '273b9a2cbe065cd8ac28004eac288e955d5bae8f153cf9fbfcd0f636e8442cad', '[\"*\"]', NULL, NULL, '2024-04-21 11:17:49', '2024-04-21 11:17:49'),
(523, 'App\\Models\\User', 8, 'user', '407a1d033dd74521b79afb930ff9fbdf717984825ec10459ec4accf137e2ef85', '[\"*\"]', NULL, NULL, '2024-04-21 11:47:52', '2024-04-21 11:47:52'),
(524, 'App\\Models\\User', 8, 'user', '0f9069abdcefec5a308d8fa33d66d484f94babc05909ba73e7914ad31ff66294', '[\"*\"]', NULL, NULL, '2024-04-22 05:20:12', '2024-04-22 05:20:12'),
(525, 'App\\Models\\User', 68, 'user', '90ec11440c152116dc7331bee9ec862056830a9d1ba9bd7285153f5cd0a61d82', '[\"*\"]', NULL, NULL, '2024-04-22 06:27:56', '2024-04-22 06:27:56'),
(526, 'App\\Models\\User', 8, 'user', 'd3eb2c70534ae57af0590d63f7a999a01846ea1f430d27b010bb3cc130c8c67a', '[\"*\"]', NULL, NULL, '2024-04-22 06:30:56', '2024-04-22 06:30:56'),
(527, 'App\\Models\\User', 68, 'user', '1a8e4543e12d42b9640d5f824e74f36adf83f9a5a7cafaba1be7116af3074cce', '[\"*\"]', NULL, NULL, '2024-04-22 06:36:30', '2024-04-22 06:36:30'),
(528, 'App\\Models\\User', 5, 'user', '603960aa9f97b5a979a6435395d7bc96bcc75cbf92da25665b7eb87098e28fcb', '[\"*\"]', NULL, NULL, '2024-04-22 07:25:45', '2024-04-22 07:25:45'),
(529, 'App\\Models\\User', 5, 'user', '0c74d07d13f77103d8f138a9eb143b8e090a79cd4bfb6aa40d3b0719e94e352f', '[\"*\"]', NULL, NULL, '2024-04-22 07:28:27', '2024-04-22 07:28:27'),
(530, 'App\\Models\\User', 8, 'user', '9f2bc1158d905ecfdbc5f343567de0b9c4c6afab72b709e17a9676fe847ac51f', '[\"*\"]', NULL, NULL, '2024-04-22 07:42:16', '2024-04-22 07:42:16'),
(531, 'App\\Models\\User', 8, 'personal access tokens', '0ab8afd4e8ee57a4b2abeb9ccc7dc86741d8a1b66de343c195029f77c978d058', '[\"*\"]', '2024-04-22 09:14:44', NULL, '2024-04-22 08:55:40', '2024-04-22 09:14:44'),
(532, 'App\\Models\\User', 5, 'user', '9c91f79abf32a026e451fe40d3b7cf8c6324619cc5dba1e3030f4d794849a368', '[\"*\"]', NULL, NULL, '2024-04-23 05:23:06', '2024-04-23 05:23:06'),
(533, 'App\\Models\\User', 68, 'user', '9fe55f06a2019cca4b0519783fea394ad211cf5e7d94603e5de0d7ea9e2e4c32', '[\"*\"]', NULL, NULL, '2024-04-23 05:32:39', '2024-04-23 05:32:39'),
(534, 'App\\Models\\User', 8, 'personal access tokens', '95987cc1d959c48e3da25a4b7878df067cae84d698da5c72dc72517cc1a92e10', '[\"*\"]', '2024-04-27 07:57:52', NULL, '2024-04-23 07:40:41', '2024-04-27 07:57:52'),
(535, 'App\\Models\\User', 5, 'user', '922d9e8766395b5fc01e47ef7a8efa2098a237e3f701cfd096232d2a9db6118d', '[\"*\"]', NULL, NULL, '2024-04-23 08:42:12', '2024-04-23 08:42:12'),
(536, 'App\\Models\\User', 68, 'user', '0a9e0075b9386a0524d25563d5ccf36a0df2788f1f833fa61791b17899a0bd56', '[\"*\"]', NULL, NULL, '2024-04-23 09:14:02', '2024-04-23 09:14:02'),
(537, 'App\\Models\\User', 5, 'user', '17138c3b7940208a03c3f06254926cd4e60901f53a2bf1979cfe45978bddebc8', '[\"*\"]', NULL, NULL, '2024-04-23 10:26:01', '2024-04-23 10:26:01'),
(538, 'App\\Models\\User', 8, 'user', '182239ab851fddb57e6d9017c7e6e1d3b02641b86a78fd09a66d5bde1d3ddff7', '[\"*\"]', NULL, NULL, '2024-04-23 10:54:26', '2024-04-23 10:54:26'),
(539, 'App\\Models\\User', 5, 'user', '34a4189884dee58baeacdbf85cfed93622eea8672e2f0f7a945e933d19d1d826', '[\"*\"]', NULL, NULL, '2024-04-24 05:27:05', '2024-04-24 05:27:05'),
(540, 'App\\Models\\User', 8, 'user', '9b44c6e6227e0fd3eba27eda0ee9046bf0b7dafe13ebcde0b5bdb9ba8b207fc1', '[\"*\"]', NULL, NULL, '2024-04-24 08:42:07', '2024-04-24 08:42:07'),
(541, 'App\\Models\\User', 5, 'user', 'f2c5e9dff8e5e919fc09cef43c1672f9c16ccc904dc935e875f95bfaa78ef734', '[\"*\"]', NULL, NULL, '2024-04-24 09:34:32', '2024-04-24 09:34:32'),
(542, 'App\\Models\\User', 5, 'user', 'd104d42d58df77a063ab7c050cf31e0c0fe3060e6f1f9a98097703cc529aeac2', '[\"*\"]', NULL, NULL, '2024-04-25 09:51:54', '2024-04-25 09:51:54'),
(543, 'App\\Models\\User', 68, 'user', '6f7b208a248d59b1b20def7f36a36a1e93700f52826311ce93a0de3099bc0b86', '[\"*\"]', NULL, NULL, '2024-04-25 10:15:04', '2024-04-25 10:15:04'),
(544, 'App\\Models\\User', 68, 'user', 'f413a13fc539b135442b8aad0f1ec06f2a9721fa13c66eb6efb1c065395a8932', '[\"*\"]', NULL, NULL, '2024-04-25 10:39:47', '2024-04-25 10:39:47'),
(545, 'App\\Models\\User', 5, 'user', 'a062e46e77aaa45fe2bb92978278d064750ecef809949b376ac315422875466c', '[\"*\"]', NULL, NULL, '2024-04-25 10:59:43', '2024-04-25 10:59:43'),
(546, 'App\\Models\\User', 68, 'user', 'eb0a3060105312d411f912be59f01c1a833e924a44e2b0d3c3978db6ca8daf9d', '[\"*\"]', NULL, NULL, '2024-04-25 11:04:40', '2024-04-25 11:04:40'),
(547, 'App\\Models\\User', 68, 'user', '385a9d3dc889d7db495c5a0f75f6e30e290e906964f4f2ad2e773deb58025968', '[\"*\"]', NULL, NULL, '2024-04-25 11:04:54', '2024-04-25 11:04:54'),
(548, 'App\\Models\\User', 5, 'user', '5d29b39f58bcebe3057b5561655b87e0609d6de3f508b6de0dfa77842436a2a9', '[\"*\"]', NULL, NULL, '2024-04-25 11:07:48', '2024-04-25 11:07:48'),
(549, 'App\\Models\\User', 68, 'user', 'e514da37094c9cc86102e695fc0f2dacf8e40e535d44ce4ab1b211d201d035d9', '[\"*\"]', NULL, NULL, '2024-04-25 11:08:20', '2024-04-25 11:08:20'),
(550, 'App\\Models\\User', 68, 'user', '141f3dc4045d4e12b9e154681affb7ec8b2ce8c17174fd0f88c44d6a997088ac', '[\"*\"]', NULL, NULL, '2024-04-25 11:13:32', '2024-04-25 11:13:32'),
(551, 'App\\Models\\User', 5, 'user', '1095af4e1720156ff4b7bcb4757ea05cdb6af4c69499ef269daf364f756914b7', '[\"*\"]', NULL, NULL, '2024-04-25 11:14:01', '2024-04-25 11:14:01'),
(552, 'App\\Models\\User', 5, 'user', '8de1097165c20430b74a144bdf03677e822298da769e5bfd2acb19f17664b43f', '[\"*\"]', NULL, NULL, '2024-04-26 09:17:21', '2024-04-26 09:17:21'),
(553, 'App\\Models\\User', 5, 'user', '6d168722601151d336994e1395cfcb7e9f83be5b228fe169a3d6f0223b38294d', '[\"*\"]', NULL, NULL, '2024-04-26 09:56:44', '2024-04-26 09:56:44'),
(554, 'App\\Models\\User', 8, 'user', 'e74f3d99a64671479835c3c4d2f53c0da570287e98d51b34e691498b7800a43e', '[\"*\"]', NULL, NULL, '2024-04-26 09:59:12', '2024-04-26 09:59:12'),
(555, 'App\\Models\\User', 8, 'user', '0b71fa38310788f346895eee1c1bc034448e67d47c7abba7126b6d176bd37e9c', '[\"*\"]', NULL, NULL, '2024-04-26 12:52:46', '2024-04-26 12:52:46'),
(556, 'App\\Models\\User', 5, 'user', '4db5452192908904f348e5f610d0c16095a12f1be2e5f61e4b5f0f0094181a8e', '[\"*\"]', NULL, NULL, '2024-04-27 04:19:42', '2024-04-27 04:19:42'),
(557, 'App\\Models\\User', 5, 'user', '56daf6154c4f25191ab9b2afed8cae68127da91f0eb6ad60895f7d54fdd7818a', '[\"*\"]', NULL, NULL, '2024-04-27 04:46:52', '2024-04-27 04:46:52'),
(558, 'App\\Models\\User', 8, 'user', '050e5113a6f3030f2a033a3865ebd5a21793be2e6332c70184ab68b133d190e0', '[\"*\"]', NULL, NULL, '2024-04-27 04:51:48', '2024-04-27 04:51:48'),
(559, 'App\\Models\\User', 68, 'user', '4b94dee334fe43ea182a86603c329d8ab8545ce7b6d6b006e51ab898aa8b6778', '[\"*\"]', NULL, NULL, '2024-04-27 05:46:04', '2024-04-27 05:46:04'),
(560, 'App\\Models\\User', 68, 'user', '817d60152444ff795f67db2e7d59bd0d4deb595ac35417f8dd30d26a524b86f8', '[\"*\"]', NULL, NULL, '2024-04-27 05:46:05', '2024-04-27 05:46:05'),
(561, 'App\\Models\\User', 5, 'user', '731c1a4e5a462e7c91b60e513907f0f3f868081d59553b6075dd984a02aaa5e9', '[\"*\"]', NULL, NULL, '2024-04-27 05:46:17', '2024-04-27 05:46:17'),
(562, 'App\\Models\\User', 68, 'user', '3c32a38c288469bb38c365a1e3297f3c3fb5e1ff05049ca614b5204276c0c8b2', '[\"*\"]', NULL, NULL, '2024-04-27 05:49:17', '2024-04-27 05:49:17'),
(563, 'App\\Models\\User', 5, 'user', 'effb280beba12fc13a2c0a3d15d50d58f0cbd7bbce1609b02abc0c024030a582', '[\"*\"]', NULL, NULL, '2024-04-27 06:26:58', '2024-04-27 06:26:58'),
(564, 'App\\Models\\User', 8, 'user', '14c9891ffe9c63d0379b173906fbad8fc17a68d8bf69e709c2c873d16a778bcb', '[\"*\"]', NULL, NULL, '2024-04-27 07:01:04', '2024-04-27 07:01:04'),
(565, 'App\\Models\\User', 68, 'user', 'eb8449385f3332c09f8003deffe1cd11ac5e5e79561b73a9a7baa70ce005a0a4', '[\"*\"]', NULL, NULL, '2024-04-27 07:08:28', '2024-04-27 07:08:28'),
(566, 'App\\Models\\User', 8, 'personal access tokens', '5b11d19a8087deefb221fd40495209202b9e4fe6bc1d2f678035a286258f4ab3', '[\"*\"]', '2024-04-27 07:58:17', NULL, '2024-04-27 07:57:59', '2024-04-27 07:58:17'),
(567, 'App\\Models\\User', 8, 'personal access tokens', '53645a5fa6f70fbf675b34d58a9e624077169bd4719901488c8625a66bffc02b', '[\"*\"]', NULL, NULL, '2024-04-27 09:42:18', '2024-04-27 09:42:18'),
(568, 'App\\Models\\User', 8, 'personal access tokens', 'e2d634cc26fc2da072b3f0e1545fc64ff12e0b942293af2b2e71037e795b63b8', '[\"*\"]', '2024-04-30 05:55:08', NULL, '2024-04-27 10:30:15', '2024-04-30 05:55:08'),
(569, 'App\\Models\\User', 68, 'user', '75b9c74b04e4f63da43abafefbafcce17e46d31561b042ce9b7c22e971ae310b', '[\"*\"]', NULL, NULL, '2024-04-27 10:26:21', '2024-04-27 10:26:21'),
(570, 'App\\Models\\User', 68, 'user', '869c469384de45578b2d58a1f552eade12ea943a48486d367880e761ee3b5c2c', '[\"*\"]', NULL, NULL, '2024-04-28 05:34:34', '2024-04-28 05:34:34'),
(571, 'App\\Models\\User', 8, 'personal access tokens', '83123b982a67880eef95890596991b4f5ea8fda7bbd08dc2fea0379bcaac0386', '[\"*\"]', NULL, NULL, '2024-04-28 09:34:30', '2024-04-28 09:34:30'),
(572, 'App\\Models\\User', 68, 'user', '8f4872b88a3cfe0581f387481ad21d188c10a5937b83781a4234d79280db498e', '[\"*\"]', NULL, NULL, '2024-04-29 04:35:33', '2024-04-29 04:35:33'),
(573, 'App\\Models\\User', 8, 'user', '76ea2749a950c03645c19b937200baa837e61fb5e3a58a80a38e3d9d5cfe9352', '[\"*\"]', NULL, NULL, '2024-04-29 05:23:30', '2024-04-29 05:23:30'),
(574, 'App\\Models\\User', 8, 'user', '96b0657568137c67323603d2af3c460a48aad525ab73c65faefc10f5c57d9410', '[\"*\"]', NULL, NULL, '2024-04-29 05:27:05', '2024-04-29 05:27:05'),
(575, 'App\\Models\\User', 8, 'personal access tokens', 'ab22ffed3d26f71c7f96e2df45a4a7817896fce6c5ff03101541715c50f6d3f7', '[\"*\"]', NULL, NULL, '2024-04-29 07:11:38', '2024-04-29 07:11:38'),
(576, 'App\\Models\\User', 8, 'user', '53e46d2202888ccebd783230388e4ad86fbdcc3c6a2a627be945b022b8192070', '[\"*\"]', NULL, NULL, '2024-04-29 10:06:44', '2024-04-29 10:06:44'),
(577, 'App\\Models\\User', 68, 'user', 'a5c175df0d7940ee77a189547ea3d5ac039e25e19f6ed5c2ecddcaad9a13a02e', '[\"*\"]', NULL, NULL, '2024-04-29 10:15:32', '2024-04-29 10:15:32'),
(578, 'App\\Models\\User', 68, 'user', '12431becd659a1db4128d633cc4a2bd7969426bc425654daa0e00f24363f3e06', '[\"*\"]', NULL, NULL, '2024-04-29 10:56:15', '2024-04-29 10:56:15'),
(579, 'App\\Models\\User', 8, 'personal access tokens', '1b8f551e9ef6a4842a4c3aced6334144519b8f81001ea044732f61777a2e1972', '[\"*\"]', NULL, NULL, '2024-04-30 05:55:17', '2024-04-30 05:55:17'),
(580, 'App\\Models\\User', 68, 'user', '84ba51e7faf26543f446b45c509b14a314e8f2db120fb145c47c11d3a27b3f9b', '[\"*\"]', NULL, NULL, '2024-04-30 05:57:04', '2024-04-30 05:57:04'),
(581, 'App\\Models\\User', 8, 'personal access tokens', '78d84f79a57197511fca2f63250f8e60becf2f463b6edc33c0eecc6161587fd3', '[\"*\"]', '2024-04-30 10:15:37', NULL, '2024-04-30 07:46:34', '2024-04-30 10:15:37'),
(582, 'App\\Models\\User', 78, 'user', '02e510b4c41449233c8204e9667f71420022478d203f2a06a9a8f5fcd2f51dc3', '[\"*\"]', NULL, NULL, '2024-04-30 10:42:47', '2024-04-30 10:42:47'),
(583, 'App\\Models\\User', 68, 'user', 'f31607ec7bc89197ab9bfab365216b834a6373abaed47d684dc76c0acd025962', '[\"*\"]', NULL, NULL, '2024-05-01 04:09:26', '2024-05-01 04:09:26'),
(584, 'App\\Models\\User', 8, 'personal access tokens', '87403a97dbbafb98f073710fa4f5c898b498eafb0dd323296091db54a41f089c', '[\"*\"]', '2024-05-01 09:34:19', NULL, '2024-05-01 04:50:18', '2024-05-01 09:34:19'),
(585, 'App\\Models\\User', 68, 'user', 'fb3440e65bf9b2f88f1014e9c13d69142e9fcdb29d8a293528772260a9857c5e', '[\"*\"]', NULL, NULL, '2024-05-01 05:39:10', '2024-05-01 05:39:10');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(586, 'App\\Models\\User', 8, 'user', '4b82c60d7d97ccbcbb0dd5378bb0d1a26990ecb9a536fd3cf83bb20a6ff6361d', '[\"*\"]', NULL, NULL, '2024-05-01 05:44:59', '2024-05-01 05:44:59'),
(587, 'App\\Models\\User', 68, 'user', 'f5d79dbc1f8d28296dcc2b0c9d36b48bc62ca29691e753edf894d92d7b1366ec', '[\"*\"]', NULL, NULL, '2024-05-01 06:35:42', '2024-05-01 06:35:42'),
(588, 'App\\Models\\User', 8, 'user', 'd0fe5c2331310996d7e8fb01669158e6d8bba830dd33360fc68f05862b03ff9c', '[\"*\"]', NULL, NULL, '2024-05-01 07:23:53', '2024-05-01 07:23:53'),
(589, 'App\\Models\\User', 8, 'user', '0bb9ab1f8190d31b6914de246d82fec5607cca77ffdf9784ad33fd93b9dcbaa1', '[\"*\"]', NULL, NULL, '2024-05-01 07:24:52', '2024-05-01 07:24:52'),
(590, 'App\\Models\\User', 68, 'user', 'eed7ff0eb31038b1164a6ee60ed9c730496dbc985e8bbad8911f57bc1dac4f54', '[\"*\"]', NULL, NULL, '2024-05-01 07:40:52', '2024-05-01 07:40:52'),
(591, 'App\\Models\\User', 8, 'user', '00b0cf8b1e8cf124d74d128146f34c2ecad6f3bcb360c5e1a1d690f2ff8efc35', '[\"*\"]', NULL, NULL, '2024-05-01 07:47:35', '2024-05-01 07:47:35'),
(592, 'App\\Models\\User', 68, 'user', '5455429f89419e233286ee0405789d88fe748d3cffdf712ba7b380f75efdc3e7', '[\"*\"]', NULL, NULL, '2024-05-01 07:52:28', '2024-05-01 07:52:28'),
(593, 'App\\Models\\User', 68, 'user', 'e3104faa010e48f7b6890382bad0f7f0a63aefad16817f119bf87cf59652b1bf', '[\"*\"]', NULL, NULL, '2024-05-01 07:52:43', '2024-05-01 07:52:43'),
(594, 'App\\Models\\User', 8, 'user', 'd42ba84f3e225a987cd79d0e308ff67b4e22568a125b0b6df5442d0d534ea6c4', '[\"*\"]', NULL, NULL, '2024-05-01 07:52:57', '2024-05-01 07:52:57'),
(595, 'App\\Models\\User', 68, 'user', '559919533dd34f67e40c09eda3683d9453b69918248a857c8a9b5eee2b34acc8', '[\"*\"]', NULL, NULL, '2024-05-01 07:53:10', '2024-05-01 07:53:10'),
(596, 'App\\Models\\User', 68, 'user', '80949dcae2b881865b424557c659ff9adabba7ecb284ccfaf81db3a9d46e85d5', '[\"*\"]', NULL, NULL, '2024-05-01 07:54:22', '2024-05-01 07:54:22'),
(597, 'App\\Models\\User', 68, 'user', '01a0df92a5ef8325f385f4dabaa988fdba9dc348bfbdf36e51a87df0788945c6', '[\"*\"]', NULL, NULL, '2024-05-01 07:55:06', '2024-05-01 07:55:06'),
(598, 'App\\Models\\User', 8, 'personal access tokens', '868f2cbbd79f046756bb4bda2fbfd60ed5936fe1479e8d93a7424b71aefbb21a', '[\"*\"]', '2024-05-01 11:58:56', NULL, '2024-05-01 10:08:08', '2024-05-01 11:58:56'),
(599, 'App\\Models\\User', 68, 'user', 'b015b6664a615d0ce7f0f4d080c254669a7ad2014a5465be811cc32439ea9040', '[\"*\"]', NULL, NULL, '2024-05-01 10:39:08', '2024-05-01 10:39:08'),
(600, 'App\\Models\\User', 79, 'user', 'b8d8ac67c99bd5d0974f748252f848771cb12e4350c9242e973b0b462aa49c6d', '[\"*\"]', NULL, NULL, '2024-05-01 11:35:18', '2024-05-01 11:35:18'),
(601, 'App\\Models\\User', 68, 'user', 'f4b34f90e8e209335e5000763ad0eb8eeed00ad683c5e0ca9ad0f8aa32fc4313', '[\"*\"]', NULL, NULL, '2024-05-01 11:40:04', '2024-05-01 11:40:04'),
(602, 'App\\Models\\User', 68, 'user', 'fc922e4db17a5d2d928a68c3d3a1dbba8062af78fc0ca749eeeb0e373fafe496', '[\"*\"]', NULL, NULL, '2024-05-02 08:53:54', '2024-05-02 08:53:54'),
(603, 'App\\Models\\User', 8, 'personal access tokens', '7c4f673a61f15b868aca9053627d5ddf7795d3b986a70c8dc830310357716f72', '[\"*\"]', '2024-05-02 09:56:39', NULL, '2024-05-02 09:55:07', '2024-05-02 09:56:39'),
(604, 'App\\Models\\User', 68, 'user', '0c35f1ae0799842c2d49417e6e269805c5c660e0ffcdf71fc4d18e3fa2f10b40', '[\"*\"]', NULL, NULL, '2024-05-02 12:14:34', '2024-05-02 12:14:34'),
(605, 'App\\Models\\User', 68, 'user', 'c97ee81bb69ef1dab69c8c76d09a6ede8c79dd92c8db45c2e80b1122e44701ff', '[\"*\"]', NULL, NULL, '2024-05-03 09:03:15', '2024-05-03 09:03:15'),
(606, 'App\\Models\\User', 5, 'user', 'aad32e134cb72ae859f275d7f5243aa80cb5345dadaa700789a6607571f929b7', '[\"*\"]', NULL, NULL, '2024-05-04 04:18:56', '2024-05-04 04:18:56'),
(607, 'App\\Models\\User', 68, 'user', '4d48d1a5105c0fa87e10e246fbcc7d846009b541a55e182fac4883183e8954c3', '[\"*\"]', NULL, NULL, '2024-05-04 04:43:11', '2024-05-04 04:43:11'),
(608, 'App\\Models\\User', 8, 'personal access tokens', 'e2875dd8196e2abf7ab20a7d9acac217ccd9b552a61647f6f05dc2b38b19eb6c', '[\"*\"]', '2024-05-04 11:02:20', NULL, '2024-05-04 05:15:42', '2024-05-04 11:02:20'),
(609, 'App\\Models\\User', 8, 'user', 'b5f59881b106cd59c5b70a4ff7332d7c3de24fa06e34e8d84cc7284a3249fd6a', '[\"*\"]', NULL, NULL, '2024-05-04 07:12:29', '2024-05-04 07:12:29'),
(610, 'App\\Models\\User', 68, 'user', 'dbfeb9ca9d51c9c1d7e35c6e9c860f235df6f8f8d8a2296b0619596286e2b4eb', '[\"*\"]', NULL, NULL, '2024-05-04 07:31:25', '2024-05-04 07:31:25'),
(611, 'App\\Models\\User', 8, 'user', '14e66f442a901a25ae6554d49ad9bc19a904d42c18da786940f25043e711f122', '[\"*\"]', NULL, NULL, '2024-05-04 10:02:12', '2024-05-04 10:02:12'),
(612, 'App\\Models\\User', 68, 'user', 'dd94eeab7624db2798ee85cd3ae54560fc7e9690884ddc906468fc138ed8fa15', '[\"*\"]', NULL, NULL, '2024-05-04 11:16:12', '2024-05-04 11:16:12'),
(613, 'App\\Models\\User', 68, 'user', 'b6f7cd0aff30f1c9efb7466379e92d2058196f17e1a2bcdb1ccea765dda1c1d9', '[\"*\"]', NULL, NULL, '2024-05-05 04:14:40', '2024-05-05 04:14:40'),
(614, 'App\\Models\\User', 68, 'user', '271c028f56e56ff4f430f00d96510497a03d6c1ff08949644f82bff279ddcea3', '[\"*\"]', NULL, NULL, '2024-05-05 06:35:16', '2024-05-05 06:35:16'),
(615, 'App\\Models\\User', 68, 'user', 'a2c4392531502fe72696faa50a7286081a7d720d2ef9962b1525ccd6b8c18005', '[\"*\"]', NULL, NULL, '2024-05-05 10:13:11', '2024-05-05 10:13:11'),
(616, 'App\\Models\\User', 8, 'user', 'ee43340f8fddd40cfc2cf483ecabe309aa8bf756cfe562b6e686d15801b5b559', '[\"*\"]', NULL, NULL, '2024-05-05 10:13:25', '2024-05-05 10:13:25'),
(617, 'App\\Models\\User', 8, 'user', '11379a4663792d17b5b2d63f51763a063d3c492e48ba7f471324db7a229cf9f2', '[\"*\"]', NULL, NULL, '2024-05-05 10:25:20', '2024-05-05 10:25:20'),
(618, 'App\\Models\\User', 82, 'user', '9c2af9ab8924376ffa5a0cc3c5b24a3cc4f56a5a466719ddc97b145c7c358ec3', '[\"*\"]', NULL, NULL, '2024-05-05 10:33:52', '2024-05-05 10:33:52'),
(619, 'App\\Models\\User', 68, 'user', '4184d2eb1296ad4e784d953ad887056a5067f6b7895e2ace3463312293f4a981', '[\"*\"]', NULL, NULL, '2024-05-05 10:34:59', '2024-05-05 10:34:59'),
(620, 'App\\Models\\User', 8, 'user', '8c8debb10b84124f48144bb6f062b03abfe068f695d2035ba79ea2c28c4bd73d', '[\"*\"]', NULL, NULL, '2024-05-05 10:44:58', '2024-05-05 10:44:58'),
(621, 'App\\Models\\User', 68, 'user', 'b15bb4f4ef9d44ddc04a0dc6ae4be5d533691b24229ffeb3a8c8325b2b8b826e', '[\"*\"]', NULL, NULL, '2024-05-05 11:00:41', '2024-05-05 11:00:41'),
(622, 'App\\Models\\User', 84, 'user', '3c6d2ad4f7748a73134414a4ab4126af2f1ec706136ed44f11d570687fbeea63', '[\"*\"]', NULL, NULL, '2024-05-05 11:24:54', '2024-05-05 11:24:54'),
(623, 'App\\Models\\User', 68, 'user', '426678cee972935140eb677621b20067b38ee68520251e1d9319f3b9bb6215af', '[\"*\"]', NULL, NULL, '2024-05-07 04:20:51', '2024-05-07 04:20:51'),
(624, 'App\\Models\\User', 8, 'user', 'e52e610c3eb4789ff48468a79dc10e6d752975837d3cd5a1ac8242b68b84f60a', '[\"*\"]', NULL, NULL, '2024-05-07 05:14:42', '2024-05-07 05:14:42'),
(625, 'App\\Models\\User', 68, 'user', '50663a2884cfb243fdad4a93f10ec55f0db9a594160c19d883b67c24baffcb7c', '[\"*\"]', NULL, NULL, '2024-05-07 05:17:58', '2024-05-07 05:17:58'),
(626, 'App\\Models\\User', 8, 'user', 'b59c846433f497c2b97fb7946b77662441168ff4b47dceb93798a4627fa3bad7', '[\"*\"]', NULL, NULL, '2024-05-07 05:23:45', '2024-05-07 05:23:45'),
(627, 'App\\Models\\User', 68, 'user', '6d2961172329a362143ce91ba92f6f55622d88b53bca3b9061fc1d13c0acc326', '[\"*\"]', NULL, NULL, '2024-05-07 08:38:30', '2024-05-07 08:38:30'),
(628, 'App\\Models\\User', 8, 'user', 'fda3fe6f5451f28337ee0ec324374ffa0acd12968b94a8c36bbf5b4b1d8b24d4', '[\"*\"]', NULL, NULL, '2024-05-07 09:31:37', '2024-05-07 09:31:37'),
(629, 'App\\Models\\User', 68, 'user', '95f6a1867411025400b19223050f6fb52912294a0252ca4307c946eb0b6130bb', '[\"*\"]', NULL, NULL, '2024-05-07 10:27:25', '2024-05-07 10:27:25'),
(630, 'App\\Models\\User', 68, 'user', '5cc8eb5b0ca1019e0f2c83afa6b509e5f1b47f44dbe0aeaad456602ef1061cde', '[\"*\"]', NULL, NULL, '2024-05-08 04:18:25', '2024-05-08 04:18:25'),
(631, 'App\\Models\\User', 8, 'personal access tokens', '532c299b5b66debecf1141e096be8549f16caf64c21e1dff200dc9023497e486', '[\"*\"]', '2024-05-11 11:07:55', NULL, '2024-05-08 05:00:53', '2024-05-11 11:07:55'),
(632, 'App\\Models\\User', 8, 'user', 'c11ef8f9ba6acdcb242f992e1f6918b0e65fafc5308a428769371183b0f42fa8', '[\"*\"]', NULL, NULL, '2024-05-08 06:51:29', '2024-05-08 06:51:29'),
(633, 'App\\Models\\User', 68, 'user', 'e0bda4c82eb99b28676b2c6849eba2a117cde6d48bc0e1c516c634cf38d51b21', '[\"*\"]', NULL, NULL, '2024-05-08 07:20:59', '2024-05-08 07:20:59'),
(634, 'App\\Models\\User', 8, 'user', '976ef53b034706d284ca11ab3c1cd456a27d4232a65fb26ce6ae94496d6b065b', '[\"*\"]', NULL, NULL, '2024-05-08 07:27:00', '2024-05-08 07:27:00'),
(635, 'App\\Models\\User', 8, 'user', 'c3e7de75e263caabdbe6f04bbdf8bb61f32e5dabd3832dc32c89e250c222b53e', '[\"*\"]', NULL, NULL, '2024-05-08 07:52:15', '2024-05-08 07:52:15'),
(636, 'App\\Models\\User', 68, 'user', '88cbfa19925687b29d65ba428257258ccbf8486c6c1a56a27c0eb19a208c2c05', '[\"*\"]', NULL, NULL, '2024-05-08 07:53:55', '2024-05-08 07:53:55'),
(637, 'App\\Models\\User', 86, 'user', 'f2d268c3052e4db095f9ed08c8040c2866143582008c475cb815f67ed4843863', '[\"*\"]', NULL, NULL, '2024-05-08 08:47:59', '2024-05-08 08:47:59'),
(638, 'App\\Models\\User', 87, 'user', 'bd2be184baf3f339ac84b6960f7cc7e1a70e35e28a42e43afc46056aefe91db0', '[\"*\"]', NULL, NULL, '2024-05-08 08:53:21', '2024-05-08 08:53:21'),
(639, 'App\\Models\\User', 68, 'user', '6400e0b070bec5d6ebbe88c10f0f4f707abea49bfe7c984598a33ddb1e50320b', '[\"*\"]', NULL, NULL, '2024-05-08 09:21:18', '2024-05-08 09:21:18'),
(640, 'App\\Models\\User', 8, 'user', 'f5879f3f9e50808f32bbd1f6fccbb927cf563922d26b820f98a475d563564d15', '[\"*\"]', NULL, NULL, '2024-05-08 09:21:51', '2024-05-08 09:21:51'),
(641, 'App\\Models\\User', 88, 'user', '154ff7cb5ee353b3adb0dae0ea524cbc9c5c2272f5b78c88edca395137200b43', '[\"*\"]', NULL, NULL, '2024-05-08 10:46:17', '2024-05-08 10:46:17'),
(642, 'App\\Models\\User', 8, 'user', 'ab33fcbe78c6a674ac5d99312ece8cb7fe9ec5c45f1bc23416cd77875abf20a2', '[\"*\"]', NULL, NULL, '2024-05-08 10:51:16', '2024-05-08 10:51:16'),
(643, 'App\\Models\\User', 8, 'user', 'e450562829e41be6762dc5a72c27777adb89d30a9a5d5cbca7f83e225573543f', '[\"*\"]', NULL, NULL, '2024-05-08 11:29:02', '2024-05-08 11:29:02'),
(644, 'App\\Models\\User', 68, 'user', '54e6ae6645c298dcfb110cc8f5a27cd6f3f8e2e4ad72148c3c3e3bd62d5fe629', '[\"*\"]', NULL, NULL, '2024-05-08 11:30:44', '2024-05-08 11:30:44'),
(645, 'App\\Models\\User', 68, 'user', 'ee931805be544b0f1771c19df34fa79029e95ffbd9e2117662b33ab8c233e4b6', '[\"*\"]', NULL, NULL, '2024-05-09 04:53:23', '2024-05-09 04:53:23'),
(646, 'App\\Models\\User', 68, 'user', '57c5e2e44452a40ee92025ed46e6ca2b0718b726c5fb572796af4e58d70e88a7', '[\"*\"]', NULL, NULL, '2024-05-09 05:40:49', '2024-05-09 05:40:49'),
(647, 'App\\Models\\User', 8, 'user', '7a43beb8e80eb8397c98e3345e2c32a5dfe4eb2ef409afc7ca86d9e5751c1c4d', '[\"*\"]', NULL, NULL, '2024-05-09 06:03:46', '2024-05-09 06:03:46'),
(648, 'App\\Models\\User', 68, 'user', '5dc36cfb72c1f002d3bafca4a349b447f0561ba57e6cb351bc4feb274fdaa890', '[\"*\"]', NULL, NULL, '2024-05-09 10:17:45', '2024-05-09 10:17:45'),
(649, 'App\\Models\\User', 68, 'user', 'a639e740a3574ce9bf86ecb28ce6cda22fe54fd9ec24b9db786da0612b688807', '[\"*\"]', NULL, NULL, '2024-05-10 09:20:51', '2024-05-10 09:20:51'),
(650, 'App\\Models\\User', 8, 'user', '1a0a60236f5ff598cef8e39563610f17daa3ee3f5da784c4a28b35d07fc15800', '[\"*\"]', NULL, NULL, '2024-05-10 10:11:00', '2024-05-10 10:11:00'),
(651, 'App\\Models\\User', 68, 'user', '5a7bcc6027302e27f20bc2708bf89e5636dc162191c4e265a6afe4227a175ee7', '[\"*\"]', NULL, NULL, '2024-05-10 10:59:57', '2024-05-10 10:59:57'),
(652, 'App\\Models\\User', 5, 'user', '72f8ee034f2bf0d33e18d484d75f8eb3270dc455f436d3d5454cce4d21f3fb0f', '[\"*\"]', NULL, NULL, '2024-05-10 11:00:13', '2024-05-10 11:00:13'),
(653, 'App\\Models\\User', 68, 'user', 'e146487e8603c27988f8780e3075a531f026a0b09fb351d128ea1b4bac6dc399', '[\"*\"]', NULL, NULL, '2024-05-10 11:00:30', '2024-05-10 11:00:30'),
(654, 'App\\Models\\User', 68, 'user', 'f4e8a9ab3f2e4b2eec2212e75147f8df4cdcf4f25c4009fc96724fa8772bfe15', '[\"*\"]', NULL, NULL, '2024-05-10 11:27:17', '2024-05-10 11:27:17'),
(655, 'App\\Models\\User', 68, 'user', 'c7e1d445158fceea687187fc4d9eed1df4468eef6d245e91452aafa5f5ed574c', '[\"*\"]', NULL, NULL, '2024-05-11 04:39:35', '2024-05-11 04:39:35'),
(656, 'App\\Models\\User', 8, 'user', '44a5aa02ca4f58f768b378b7bf36576a2a99beed65f761aa5eae42d02203c96d', '[\"*\"]', NULL, NULL, '2024-05-11 05:12:36', '2024-05-11 05:12:36'),
(657, 'App\\Models\\User', 68, 'user', '88d685452b865b80e497c02edfd6ca9d8f9f48a573c355ca09ddc72e000b7914', '[\"*\"]', NULL, NULL, '2024-05-11 05:13:28', '2024-05-11 05:13:28'),
(658, 'App\\Models\\User', 5, 'user', 'b8b2a08800386de0904d633342ce8bb718e6627f592a120a94af8b08ba9422a5', '[\"*\"]', NULL, NULL, '2024-05-11 06:15:42', '2024-05-11 06:15:42'),
(659, 'App\\Models\\User', 68, 'user', '5658e3e1968ee55d4cca7db914dad24dd7c46e8da82ff073a37086301e061be3', '[\"*\"]', NULL, NULL, '2024-05-11 06:16:08', '2024-05-11 06:16:08'),
(660, 'App\\Models\\User', 8, 'personal access tokens', 'a0905a7ca47400e420852dc2445e376f686abbf13e90943dde4ede11f9ed3129', '[\"*\"]', '2024-05-11 11:08:26', NULL, '2024-05-11 11:07:40', '2024-05-11 11:08:26'),
(661, 'App\\Models\\User', 68, 'user', 'd9841fe2f0bbe9621789c96abbe4d340e17af1bf85972e244068b79c6641f95f', '[\"*\"]', NULL, NULL, '2024-05-12 04:34:26', '2024-05-12 04:34:26'),
(662, 'App\\Models\\User', 8, 'user', '2381ebe4fd8cd4e08c0c25a82858632481a0475997d926999a3235b02bede736', '[\"*\"]', NULL, NULL, '2024-05-12 09:17:47', '2024-05-12 09:17:47'),
(663, 'App\\Models\\User', 8, 'user', '0e74798d89780bf53216db89bfabc35a063891247ee684797b7650cc8ade4e1a', '[\"*\"]', NULL, NULL, '2024-05-12 09:19:56', '2024-05-12 09:19:56'),
(664, 'App\\Models\\User', 68, 'user', '580cba286b67b49d36999a404f67917ca70e94117cdb5b843bbb43baf345e81a', '[\"*\"]', NULL, NULL, '2024-05-12 10:17:03', '2024-05-12 10:17:03'),
(665, 'App\\Models\\User', 8, 'user', '338ed26f8944ec30509f1dcb6d996ab6b2d3f6ce9793cd20ee23d5c215516213', '[\"*\"]', NULL, NULL, '2024-05-13 04:16:01', '2024-05-13 04:16:01'),
(666, 'App\\Models\\User', 68, 'user', 'fbf566f1fbd4a16714389a2947adf7ca974abf2e977c9f637a1ae68a61ca39a3', '[\"*\"]', NULL, NULL, '2024-05-13 06:30:39', '2024-05-13 06:30:39'),
(667, 'App\\Models\\User', 8, 'user', 'ddd94fe56205b2f1f3d7351caf17ecd9252e2db542c3439a29b4dbf9db32279b', '[\"*\"]', NULL, NULL, '2024-05-13 06:32:52', '2024-05-13 06:32:52'),
(668, 'App\\Models\\User', 68, 'user', 'd0c4cba4990e48974420b33adb86167cf41a37f620d7f1a527260dcca177d142', '[\"*\"]', NULL, NULL, '2024-05-13 06:43:29', '2024-05-13 06:43:29'),
(669, 'App\\Models\\User', 8, 'user', '3d9955f7c42b8561a4aeeb9d1e151d12daea8afcf459a43ff4c7a5a94b761537', '[\"*\"]', NULL, NULL, '2024-05-13 06:54:24', '2024-05-13 06:54:24'),
(670, 'App\\Models\\User', 68, 'user', 'b257aedf502284e79b778d234861e1cb206d40f93e99127d1089ddd509981314', '[\"*\"]', NULL, NULL, '2024-05-13 07:05:52', '2024-05-13 07:05:52'),
(671, 'App\\Models\\User', 8, 'personal access tokens', 'b0c399c7df7aeff11fd7a76dff56334110b790e0c21bc5ed47c961698e508f4c', '[\"*\"]', '2024-05-13 10:45:07', NULL, '2024-05-13 10:05:44', '2024-05-13 10:45:07'),
(672, 'App\\Models\\User', 68, 'user', '2435412ba374cff9ef81f35ddda1d1dd260239f3bdc2a3293523126a7c442f9e', '[\"*\"]', NULL, NULL, '2024-05-13 10:56:32', '2024-05-13 10:56:32'),
(673, 'App\\Models\\User', 68, 'user', 'a1bce57bea6b3ac20f467cb99a3b698b56dc6e9ae7e003c86407f52aa6e6ac46', '[\"*\"]', NULL, NULL, '2024-05-14 04:29:12', '2024-05-14 04:29:12'),
(674, 'App\\Models\\User', 8, 'personal access tokens', 'ef33075f56e6e3fb606a5e08f302ea91bb40c94c27840ebd11e7b992feef6afb', '[\"*\"]', '2024-05-14 04:52:38', NULL, '2024-05-14 04:52:20', '2024-05-14 04:52:38'),
(675, 'App\\Models\\User', 8, 'user', 'a189e3c8050daa84bc43f2d82f274e2d4509e2b7529ab0aa30615647d4db66bd', '[\"*\"]', NULL, NULL, '2024-05-14 10:35:28', '2024-05-14 10:35:28'),
(676, 'App\\Models\\User', 68, 'user', 'a1560d7ef02768f157448eea76561acb2b865c1874b243ad4a44c6ca37482210', '[\"*\"]', NULL, NULL, '2024-05-14 10:55:39', '2024-05-14 10:55:39'),
(677, 'App\\Models\\User', 68, 'user', '8e5f3088060284d739e567a531579f47e929b919070e8947e18d3778a28eb4bd', '[\"*\"]', NULL, NULL, '2024-05-15 04:31:42', '2024-05-15 04:31:42'),
(678, 'App\\Models\\User', 8, 'user', 'e3e38155f3e9a394d1b647c54a848994e69792b2c80306f7f275cf3ce114075e', '[\"*\"]', NULL, NULL, '2024-05-15 09:39:40', '2024-05-15 09:39:40'),
(679, 'App\\Models\\User', 68, 'user', 'a47c685f5d4efdb502762edfb74291c4219ae6d4291b07a9db4d7b297e7bd978', '[\"*\"]', NULL, NULL, '2024-05-16 07:39:43', '2024-05-16 07:39:43'),
(680, 'App\\Models\\User', 5, 'user', 'a0dd74cd0d003294069e044fff7d3a7fd436a03e74c41f66a0d540d9b933cc23', '[\"*\"]', NULL, NULL, '2024-05-16 07:59:53', '2024-05-16 07:59:53'),
(681, 'App\\Models\\User', 8, 'user', '7f03d6d1e8fd9256783b5bc7d140ecb22cdeb88ef71ef47e439031ac586f629e', '[\"*\"]', NULL, NULL, '2024-05-16 08:50:50', '2024-05-16 08:50:50'),
(682, 'App\\Models\\User', 5, 'user', '41536b3214b3562703987d132e176075ec150b727b167785649d3f49a3d928ef', '[\"*\"]', NULL, NULL, '2024-05-16 09:02:16', '2024-05-16 09:02:16'),
(683, 'App\\Models\\User', 5, 'user', '3d0ece954db0a510e0314e02e6c119fb7c1306a3ee52e16037a25b643556e20d', '[\"*\"]', NULL, NULL, '2024-05-16 09:11:12', '2024-05-16 09:11:12'),
(684, 'App\\Models\\User', 5, 'user', 'f04106934cf0eb681631f2dc32384241e701f875d1671ced77c85448f9d37651', '[\"*\"]', NULL, NULL, '2024-05-17 09:13:59', '2024-05-17 09:13:59'),
(685, 'App\\Models\\User', 8, 'user', '3b50e880af150e40fbca12d13873f374a9b0e0c47721e95c6e3a772b1d2ff8da', '[\"*\"]', NULL, NULL, '2024-05-17 09:30:35', '2024-05-17 09:30:35'),
(686, 'App\\Models\\User', 68, 'user', '81d97d437c6b84392bf0246ed6783ce4c3fa81705d189c2549501c34c4d4662d', '[\"*\"]', NULL, NULL, '2024-05-17 09:34:22', '2024-05-17 09:34:22'),
(687, 'App\\Models\\User', 8, 'user', '9d066fb5b539971124ad377835b9cc67ed46ddab72c57945a6a732dd22ecef1f', '[\"*\"]', NULL, NULL, '2024-05-17 09:36:05', '2024-05-17 09:36:05'),
(688, 'App\\Models\\User', 68, 'user', '57f8fa4db674eae7bf63e2902e0f19b19487c49cfdff0044e26130e6cf4adc8e', '[\"*\"]', NULL, NULL, '2024-05-17 09:50:17', '2024-05-17 09:50:17'),
(689, 'App\\Models\\User', 8, 'user', 'cf0eae8e11da9f36d5ea1b4152d1d628e030aa086d907236698c3c365320d5e3', '[\"*\"]', NULL, NULL, '2024-05-17 09:56:13', '2024-05-17 09:56:13'),
(690, 'App\\Models\\User', 68, 'user', 'fa61a2f82b0e094977d8beab6fb55ca449a3065d073c926966d53b6a79c1cf6d', '[\"*\"]', NULL, NULL, '2024-05-17 10:27:47', '2024-05-17 10:27:47'),
(691, 'App\\Models\\User', 91, 'user', 'c998d2adf035a432737f787cbd2434c039749cece7353908abb234a64ef6b572', '[\"*\"]', NULL, NULL, '2024-05-17 10:35:31', '2024-05-17 10:35:31'),
(692, 'App\\Models\\User', 92, 'user', '2b16d2f97ecaca47e24ad254eab5d90c33811d830ce255d3c16ac33e0f3d3693', '[\"*\"]', NULL, NULL, '2024-05-17 10:39:32', '2024-05-17 10:39:32'),
(693, 'App\\Models\\User', 8, 'user', 'e136c82cc7659601c2f7ef96b842e6c62b0509ce8f66dcf1f3e78b2f3a5b3817', '[\"*\"]', NULL, NULL, '2024-05-17 10:47:32', '2024-05-17 10:47:32'),
(694, 'App\\Models\\User', 8, 'user', '19493721fe4e00fcfc483c02e95bc0c809b903d4ac1de15c09770962af8b810b', '[\"*\"]', NULL, NULL, '2024-05-18 04:34:28', '2024-05-18 04:34:28'),
(695, 'App\\Models\\User', 8, 'personal access tokens', '72eed98c36027b699c827013f455bcf5cf9e1a4c9a9db46d35418492506c0063', '[\"*\"]', '2024-05-18 06:28:53', NULL, '2024-05-18 04:38:29', '2024-05-18 06:28:53'),
(696, 'App\\Models\\User', 68, 'user', 'e3e0e0d63ebc448169f6ac354c53ecc1b2ced5136041934cfc48647133a8b63b', '[\"*\"]', NULL, NULL, '2024-05-18 07:19:53', '2024-05-18 07:19:53'),
(697, 'App\\Models\\User', 68, 'user', '5cd87b7b3210b23d21568f61b96db2183022977302e6f8ead2abae1753fb285e', '[\"*\"]', NULL, NULL, '2024-05-18 09:45:50', '2024-05-18 09:45:50'),
(698, 'App\\Models\\User', 68, 'user', '07540e68c9d6992f52c178a571f58c9caa25135809b7f38f890326e1b77db89c', '[\"*\"]', NULL, NULL, '2024-05-19 04:21:00', '2024-05-19 04:21:00'),
(699, 'App\\Models\\User', 8, 'personal access tokens', '04abfca2fbfb99302551ced751122b58b3356705f8775b0d682d6d05d1eef179', '[\"*\"]', '2024-05-19 09:19:46', NULL, '2024-05-19 09:09:45', '2024-05-19 09:19:46'),
(700, 'App\\Models\\User', 68, 'user', 'b9a7531627249350eda9edb193317d451b0b904934664da1272a339253e1437a', '[\"*\"]', NULL, NULL, '2024-05-19 09:24:47', '2024-05-19 09:24:47'),
(701, 'App\\Models\\User', 68, 'user', '2a8e68ded6be7efb79ecfe36c0bfc4633df96b2eff8f95fe9151eea702dd5380', '[\"*\"]', NULL, NULL, '2024-05-19 11:12:53', '2024-05-19 11:12:53'),
(702, 'App\\Models\\User', 68, 'user', 'fa808ea082dec08d8d2cafe338fc9a562fc46e567da6f4a11c3ac59cb601b29f', '[\"*\"]', NULL, NULL, '2024-05-20 04:47:41', '2024-05-20 04:47:41'),
(703, 'App\\Models\\User', 68, 'user', '9c0719b2ad1731d0b2492f851a81d8adfb67703313af232e98ab4c05c8b3e3ff', '[\"*\"]', NULL, NULL, '2024-05-20 06:13:06', '2024-05-20 06:13:06'),
(704, 'App\\Models\\User', 68, 'user', 'ca9d1408771a92ad1dff929a2707bca0b661a1c85ec85731b41725773f616486', '[\"*\"]', NULL, NULL, '2024-05-20 09:31:44', '2024-05-20 09:31:44'),
(705, 'App\\Models\\User', 68, 'user', '04b71e8e831029f4154064a0a5c8a94a9960a89f2be1f6f27db0cd65eef0901c', '[\"*\"]', NULL, NULL, '2024-05-21 04:28:13', '2024-05-21 04:28:13'),
(706, 'App\\Models\\User', 8, 'user', 'a6abab480cb9ba9246620203f482de0c952fe081e2627e7aa7c8a389a28dbc01', '[\"*\"]', NULL, NULL, '2024-05-21 06:21:43', '2024-05-21 06:21:43'),
(707, 'App\\Models\\User', 68, 'user', 'db1a32b7f7309e0799fc362fd920cef4d02e442e72ca8c4e0071798573a7296b', '[\"*\"]', NULL, NULL, '2024-05-21 06:24:01', '2024-05-21 06:24:01'),
(708, 'App\\Models\\User', 68, 'user', '4addd66ead31ceb6878f764edc8625e98bc0e3b217da554d7ccf474207da77bf', '[\"*\"]', NULL, NULL, '2024-05-22 04:29:26', '2024-05-22 04:29:26'),
(709, 'App\\Models\\User', 8, 'personal access tokens', 'b3934b80027b931223dca285678406b124b17e88f88ba5df866e0784242ab830', '[\"*\"]', '2024-05-25 09:49:07', NULL, '2024-05-22 04:45:53', '2024-05-25 09:49:07'),
(710, 'App\\Models\\User', 8, 'user', '1dd892695a4353b19deab2d661583be193fafdbeafbe89ecc8dccf3d9c761d2c', '[\"*\"]', NULL, NULL, '2024-05-22 05:21:40', '2024-05-22 05:21:40'),
(711, 'App\\Models\\User', 71, 'user', '3cb53dd48692f248f30639e76ed572cef036de564446fc5605323202dd87d7a4', '[\"*\"]', NULL, NULL, '2024-05-22 05:26:51', '2024-05-22 05:26:51'),
(712, 'App\\Models\\User', 5, 'user', '6a889f7993f087dc0d82cb2cb96c212e8f2cf24e77bd571909f4449d6e6bb2d5', '[\"*\"]', NULL, NULL, '2024-05-22 05:27:34', '2024-05-22 05:27:34'),
(713, 'App\\Models\\User', 68, 'user', '7339effc21235d4d79e51e91055f5c2029b34abfbb7d3f0adb3ae6a0cc506e61', '[\"*\"]', NULL, NULL, '2024-05-22 05:29:17', '2024-05-22 05:29:17'),
(714, 'App\\Models\\User', 5, 'user', 'f5bceca0f8830e9a43279a129d53fa311297fe8cf155331633d68a6bbbfe9042', '[\"*\"]', NULL, NULL, '2024-05-22 05:37:44', '2024-05-22 05:37:44'),
(715, 'App\\Models\\User', 8, 'user', 'e423daf0ae9536d9ab7fd0b7d458c287a821101534d4c27d34bca610da213631', '[\"*\"]', NULL, NULL, '2024-05-22 05:42:23', '2024-05-22 05:42:23'),
(716, 'App\\Models\\User', 5, 'user', 'ff4315128406598537a33f422ebe32852424a3a6014cbee2d123c1a032411dc4', '[\"*\"]', NULL, NULL, '2024-05-22 06:04:15', '2024-05-22 06:04:15'),
(717, 'App\\Models\\User', 5, 'user', '7d341741e02a6ec70b1242b693ed7aa7d01b0b196037005479e1563b8c134294', '[\"*\"]', NULL, NULL, '2024-05-22 06:05:00', '2024-05-22 06:05:00'),
(718, 'App\\Models\\User', 8, 'user', '01bc5c8997ef17111b811d02a65276d4d5b69b3673900f08c37deb5512d45530', '[\"*\"]', NULL, NULL, '2024-05-22 06:06:00', '2024-05-22 06:06:00'),
(719, 'App\\Models\\User', 68, 'user', 'db53c536bb7fafa66dcba22a6151397ae06a4dd374a7e2f50862e7c2560ea219', '[\"*\"]', NULL, NULL, '2024-05-22 06:20:52', '2024-05-22 06:20:52'),
(720, 'App\\Models\\User', 8, 'user', 'ecdfaeaf75341344d77a62d3a9b73a5b5425b3c3c3edfed6844860a5ccbdd900', '[\"*\"]', NULL, NULL, '2024-05-22 06:33:04', '2024-05-22 06:33:04'),
(721, 'App\\Models\\User', 68, 'user', '16fe88a8412a764da6bdba405fb975674e552ac48b1eabcad07c60cef5af103e', '[\"*\"]', NULL, NULL, '2024-05-22 07:12:36', '2024-05-22 07:12:36'),
(722, 'App\\Models\\User', 8, 'user', 'fdb16e4c09b80430dd651878b07ec592cc5fc5e17f6ecb8c92ea63b079cabbce', '[\"*\"]', NULL, NULL, '2024-05-22 11:23:09', '2024-05-22 11:23:09'),
(723, 'App\\Models\\User', 68, 'user', '7942d619f30e8bdcebff653c1056af053ab03873f640ce41f8f243fe2d2120a0', '[\"*\"]', NULL, NULL, '2024-05-23 10:36:22', '2024-05-23 10:36:22'),
(724, 'App\\Models\\User', 68, 'user', '03a7f6a7b82fb599647ae216978b323ad6b7533f9db6492d5b56ebccc89270c1', '[\"*\"]', NULL, NULL, '2024-05-24 09:24:50', '2024-05-24 09:24:50'),
(725, 'App\\Models\\User', 68, 'user', 'd0b71064d857424b678cc40e147a91363eed158e62dadcbf8c8a2c0d8e7f65ab', '[\"*\"]', NULL, NULL, '2024-05-25 04:43:10', '2024-05-25 04:43:10'),
(726, 'App\\Models\\User', 8, 'user', '7f7e857995d162d622252dcf63ff802ad0e5e34dfd1d69df95892fe5c1b62a3a', '[\"*\"]', NULL, NULL, '2024-05-25 04:45:52', '2024-05-25 04:45:52'),
(727, 'App\\Models\\User', 8, 'personal access tokens', '7e477ecd547b7b0f26240d5176f4f4331783792602d6e72a42a82fd7b815f0c1', '[\"*\"]', NULL, NULL, '2024-05-25 06:13:43', '2024-05-25 06:13:43'),
(728, 'App\\Models\\User', 8, 'personal access tokens', '88c4df2dabfc0476fc0d1ba03e537e4af0022686ad587d2c5194ebe3873372a8', '[\"*\"]', '2024-05-28 09:55:50', NULL, '2024-05-25 09:49:14', '2024-05-28 09:55:50'),
(729, 'App\\Models\\User', 68, 'user', 'b69e3e6ccad618dcf2665b22291de70c962761f16006af99f9dc99ae5266a727', '[\"*\"]', NULL, NULL, '2024-05-25 10:17:57', '2024-05-25 10:17:57'),
(730, 'App\\Models\\User', 8, 'user', '99b915935e68edb8730e5d8f762e2652ea87f4e93ac10bea806b86a5cca94b5c', '[\"*\"]', NULL, NULL, '2024-05-25 10:20:18', '2024-05-25 10:20:18'),
(731, 'App\\Models\\User', 68, 'user', 'ee01587c995537a480c275a726071388f2416c6768e554bd65f44c26ce65fe82', '[\"*\"]', NULL, NULL, '2024-05-25 10:22:00', '2024-05-25 10:22:00'),
(732, 'App\\Models\\User', 8, 'user', 'bc80182d25171ea7b0f22114a59c8e75b39f48fce685bc352bb6a0327d942c17', '[\"*\"]', NULL, NULL, '2024-05-25 10:22:38', '2024-05-25 10:22:38'),
(733, 'App\\Models\\User', 68, 'user', '83f1670f19ba35474e217ca8d6344486996ed69677dfd7fd37af69c4956cf476', '[\"*\"]', NULL, NULL, '2024-05-25 10:29:30', '2024-05-25 10:29:30'),
(734, 'App\\Models\\User', 8, 'user', '0986c207a034ffb1427075fe1435c29e9e7d06e4ef65dadaf5ededb0dfabb9bb', '[\"*\"]', NULL, NULL, '2024-05-25 10:50:04', '2024-05-25 10:50:04'),
(735, 'App\\Models\\User', 68, 'user', '3c2f8358ce9d6ba1cb3c8091b6979bc1e151b16c5669da1cc3f489432fb047d6', '[\"*\"]', NULL, NULL, '2024-05-25 11:29:17', '2024-05-25 11:29:17'),
(736, 'App\\Models\\User', 68, 'user', '31977af6cf13fb7bd543b089fe84c85ab3bd8fe2c1f58a13da063e9cf1672ba8', '[\"*\"]', NULL, NULL, '2024-05-27 04:34:00', '2024-05-27 04:34:00'),
(737, 'App\\Models\\User', 8, 'user', 'bf8a2552eea275a152442ae6b6a099af3a5b0e4adb8f801ef0b1f0c98e6152cd', '[\"*\"]', NULL, NULL, '2024-05-27 05:26:01', '2024-05-27 05:26:01'),
(738, 'App\\Models\\User', 68, 'user', 'f744b4196173f48a48d91e195845d6be70717113aa614c6e61cbf1a2929dae32', '[\"*\"]', NULL, NULL, '2024-05-27 05:52:29', '2024-05-27 05:52:29'),
(739, 'App\\Models\\User', 8, 'user', 'ddab4218f2e4319c1af3750c2529aa08ab0159b7bc95916b7ed853848132a826', '[\"*\"]', NULL, NULL, '2024-05-27 06:13:26', '2024-05-27 06:13:26'),
(740, 'App\\Models\\User', 68, 'user', '2eaff2e0e017a99dc3a3f4ef1448ef488cc9b4949214f3613ca62c1c4a5e81c4', '[\"*\"]', NULL, NULL, '2024-05-27 06:14:06', '2024-05-27 06:14:06'),
(741, 'App\\Models\\User', 8, 'user', '37ae3f04aaefcb25e9d6f869a82d8b0e382828646cdc6e0efe9e162ac0d39713', '[\"*\"]', NULL, NULL, '2024-05-27 06:59:47', '2024-05-27 06:59:47'),
(742, 'App\\Models\\User', 68, 'user', 'd08db27235bce813ceb070ed3618863988fd432bd69515c7e4341ff05ec28e73', '[\"*\"]', NULL, NULL, '2024-05-27 09:31:55', '2024-05-27 09:31:55'),
(743, 'App\\Models\\User', 68, 'user', 'd4025756c3759e6cd24852fcecf3288e38604297d7fff606da0bc90296b611ec', '[\"*\"]', NULL, NULL, '2024-05-28 04:14:37', '2024-05-28 04:14:37'),
(744, 'App\\Models\\User', 68, 'user', 'c36c03647e3f63530b5889eef41bcc65a51a3ba19d85cd4f85ccd2cb33217b1e', '[\"*\"]', NULL, NULL, '2024-05-28 04:14:37', '2024-05-28 04:14:37'),
(745, 'App\\Models\\User', 8, 'user', '9c312598cdbae90a922b08ba753654810e8c8dd8c23c3c3d5925b1cf442ed19c', '[\"*\"]', NULL, NULL, '2024-05-28 05:45:26', '2024-05-28 05:45:26'),
(746, 'App\\Models\\User', 68, 'user', 'a7a1289b7705a9ab4f30ec10ec46045c8b3ed9147a8ba5bbcd0164d7befa6b1c', '[\"*\"]', NULL, NULL, '2024-05-28 06:33:59', '2024-05-28 06:33:59'),
(747, 'App\\Models\\User', 68, 'user', 'df54cf73702d4fe2125f6b81e06109f0136135d7b16deaf17d827ce1c682f18c', '[\"*\"]', NULL, NULL, '2024-05-28 07:25:12', '2024-05-28 07:25:12'),
(748, 'App\\Models\\User', 8, 'user', '2af74ca4a8c392fce3b19a810d06348fac1b3d0fc833975600e448259580362c', '[\"*\"]', NULL, NULL, '2024-05-28 10:51:00', '2024-05-28 10:51:00'),
(749, 'App\\Models\\User', 8, 'user', 'f13d0992a04b5d0d7cce11d8947f1a29908b477e2159a812e3729cab2d25953a', '[\"*\"]', NULL, NULL, '2024-05-29 04:11:36', '2024-05-29 04:11:36'),
(750, 'App\\Models\\User', 8, 'user', 'e4c8033d50022427ab774424df370f11aabbb781f03d316736a69ab8a6e7ebb1', '[\"*\"]', NULL, NULL, '2024-05-29 07:09:20', '2024-05-29 07:09:20'),
(751, 'App\\Models\\User', 68, 'user', '7da7dc15bc1d86a6523d0c6f59252d57b2afe15285032310285eb3b5e388d19f', '[\"*\"]', NULL, NULL, '2024-05-29 07:58:44', '2024-05-29 07:58:44'),
(752, 'App\\Models\\User', 8, 'user', 'f0d747c28932eba9b3a68dd32649b58129118e5705ddf8cdc3570af23dff6467', '[\"*\"]', NULL, NULL, '2024-05-29 09:23:12', '2024-05-29 09:23:12'),
(753, 'App\\Models\\User', 8, 'user', '1207db564213f43c81cd2dd91458e9f47239019ed0be7b3ac195dd1935fa3706', '[\"*\"]', NULL, NULL, '2024-05-29 10:50:35', '2024-05-29 10:50:35'),
(754, 'App\\Models\\User', 68, 'user', 'c7e4db4db6d9b0503db0beef8f44495410db1b28ebc05408e1944736dde27c4a', '[\"*\"]', NULL, NULL, '2024-05-29 11:24:17', '2024-05-29 11:24:17'),
(755, 'App\\Models\\User', 68, 'user', 'a576e69322718d1761be19086ecbf83cf85a55def1af489466e548b7db45634e', '[\"*\"]', NULL, NULL, '2024-05-30 08:55:24', '2024-05-30 08:55:24'),
(756, 'App\\Models\\User', 8, 'user', '0e9ae685bc1ef38f92bd735bbc681056c9f790dc3eaa8ace1dbb6b0edd0d1ff8', '[\"*\"]', NULL, NULL, '2024-05-30 10:15:23', '2024-05-30 10:15:23'),
(757, 'App\\Models\\User', 68, 'user', 'cf0a1f64531f32e615189ae517d176f2e7da55dbc0c51805dd83dc59c76b6210', '[\"*\"]', NULL, NULL, '2024-05-31 09:22:50', '2024-05-31 09:22:50'),
(758, 'App\\Models\\User', 8, 'user', '047c77c20cba797ccdbf408d3c459d061c48aa9c378c2f3885226299bd7cc244', '[\"*\"]', NULL, NULL, '2024-05-31 10:07:52', '2024-05-31 10:07:52'),
(759, 'App\\Models\\User', 68, 'user', 'ef07695f7ac76bef083822c88de705c2946c46785db0ccf4092104103063314b', '[\"*\"]', NULL, NULL, '2024-05-31 10:35:55', '2024-05-31 10:35:55'),
(760, 'App\\Models\\User', 68, 'user', '17f9e991bb6b6eeb6c8a96f76920d52398efd1cf590aaa14a7999d032c4bc0a1', '[\"*\"]', NULL, NULL, '2024-06-01 05:50:56', '2024-06-01 05:50:56'),
(761, 'App\\Models\\User', 68, 'user', '0d2e4fc14f3118bb3ff7aa738a1a0c97f98e0dfa156cf0b2e4d6cd034dcbc1dc', '[\"*\"]', NULL, NULL, '2024-06-01 05:54:36', '2024-06-01 05:54:36'),
(762, 'App\\Models\\User', 8, 'user', '1e00dc6ef1c9e5d1a9c8d7751eeabf95cfcfc80bc80f69b4115855c3037ed948', '[\"*\"]', NULL, NULL, '2024-06-01 08:42:52', '2024-06-01 08:42:52'),
(763, 'App\\Models\\User', 68, 'user', '280d7074d4a696494f13e4946053e3e0b43f1fe7e4ce69f89414f2584a30f282', '[\"*\"]', NULL, NULL, '2024-06-01 08:54:03', '2024-06-01 08:54:03'),
(764, 'App\\Models\\User', 8, 'user', '2f8b6d8b54509f212d16f0707ff8a047cbc4d848e893b1f3020b505046df5d19', '[\"*\"]', NULL, NULL, '2024-06-01 09:44:25', '2024-06-01 09:44:25'),
(765, 'App\\Models\\User', 68, 'user', 'd74a7355e941b89ba5e8912a4b9b8b7c67dcf1b36f9a6fdc0959316566ab062f', '[\"*\"]', NULL, NULL, '2024-06-01 09:51:46', '2024-06-01 09:51:46'),
(766, 'App\\Models\\User', 8, 'user', '98c98b27a1ad11ab1841fc290f944b83f58dee192ef1b90561cae03813b1295b', '[\"*\"]', NULL, NULL, '2024-06-01 10:41:27', '2024-06-01 10:41:27'),
(767, 'App\\Models\\User', 68, 'user', 'b0de2700045e5bda9fbcb31aadb416e0b568e747396047ed56f39ee425240bcc', '[\"*\"]', NULL, NULL, '2024-06-02 04:27:47', '2024-06-02 04:27:47'),
(768, 'App\\Models\\User', 8, 'user', '05a44d106f4deaaf6e12edf82f4d51383a0c741f1e32fe6352e1c7b0a0e369c7', '[\"*\"]', NULL, NULL, '2024-06-02 04:36:17', '2024-06-02 04:36:17'),
(769, 'App\\Models\\User', 68, 'user', 'e29a8bb755e2cd5e5beb6698db932cc12da9c0e3f64a7d832bc9c356963ffa10', '[\"*\"]', NULL, NULL, '2024-06-02 05:15:44', '2024-06-02 05:15:44'),
(770, 'App\\Models\\User', 8, 'user', '63006418edd9442571df462a9b1974b0c92ae2645dfb366ae9d57ebc47a5ff5c', '[\"*\"]', NULL, NULL, '2024-06-02 06:39:58', '2024-06-02 06:39:58'),
(771, 'App\\Models\\User', 68, 'user', 'db8fad1716f2a4c1efead26d7000e93b8540577ff03e175f799e48eeed6e2406', '[\"*\"]', NULL, NULL, '2024-06-02 09:52:31', '2024-06-02 09:52:31'),
(772, 'App\\Models\\User', 68, 'user', 'a6a2387315e27ed4b22f4db806237421f527be5f3e87a6071f2cbaa127e7ebe5', '[\"*\"]', NULL, NULL, '2024-06-02 09:52:33', '2024-06-02 09:52:33'),
(773, 'App\\Models\\User', 8, 'personal access tokens', 'c1b0ee4c651e631e5ecbbbc4816231586aaf2e7c1dc44a0fd45c8ad640292a1e', '[\"*\"]', NULL, NULL, '2024-06-02 11:26:19', '2024-06-02 11:26:19'),
(774, 'App\\Models\\User', 8, 'personal access tokens', '7ccb1594a716c94c5ac6d81c14f8d9ba6a028d68a767ea862445cbfc5d621299', '[\"*\"]', '2024-06-03 10:59:40', NULL, '2024-06-03 05:03:29', '2024-06-03 10:59:40'),
(775, 'App\\Models\\User', 68, 'user', 'dd9a5a629e5d7d24e0712a27a64eb5ffb178b23af98af15f36cd218ca70adb3d', '[\"*\"]', NULL, NULL, '2024-06-03 05:38:09', '2024-06-03 05:38:09'),
(776, 'App\\Models\\User', 8, 'user', 'db4f790b403d46503cd02adf5d666216a63cd07e45db8ddc83f8e1e23ec7c728', '[\"*\"]', NULL, NULL, '2024-06-03 07:58:44', '2024-06-03 07:58:44'),
(777, 'App\\Models\\User', 68, 'user', '5892a386578b1573df483511082eb8146a6b15da8c5a92008dfa41d4d329f7c9', '[\"*\"]', NULL, NULL, '2024-06-03 09:02:13', '2024-06-03 09:02:13'),
(778, 'App\\Models\\User', 8, 'user', 'e87a102a4e5c544c319ffce3921ccd92ef9e31c23d4757267fdf44893ea9515a', '[\"*\"]', NULL, NULL, '2024-06-03 09:21:17', '2024-06-03 09:21:17'),
(779, 'App\\Models\\User', 8, 'user', 'cc96beb3f35b9dad5f5be1aa6ab70fc320eeb66a1eba2c61ddd26c7b67a3668e', '[\"*\"]', NULL, NULL, '2024-06-04 04:34:27', '2024-06-04 04:34:27'),
(780, 'App\\Models\\User', 8, 'user', '1d54bd04731c56c701eec57ecb51da8f79a816d6e8584a29fefd64a6e6daed27', '[\"*\"]', NULL, NULL, '2024-06-04 06:59:13', '2024-06-04 06:59:13'),
(781, 'App\\Models\\User', 8, 'user', 'd16be7a862c78cd88ed12756440f25e65fd82803dc1c26dbedc6acb9575dd5fa', '[\"*\"]', NULL, NULL, '2024-06-04 09:48:52', '2024-06-04 09:48:52'),
(782, 'App\\Models\\User', 68, 'user', '4e81a98a7213c1d43c060648848c00ff137b5bb8d4fa0809709527987e275178', '[\"*\"]', NULL, NULL, '2024-06-04 10:02:04', '2024-06-04 10:02:04'),
(783, 'App\\Models\\User', 8, 'user', '11e57da3f933eeef992c1fc7f47aa6321e3c98fb75765bd598967f02e7de3481', '[\"*\"]', NULL, NULL, '2024-06-04 10:16:21', '2024-06-04 10:16:21'),
(784, 'App\\Models\\User', 68, 'user', '76de29142d0cc2fef7d7f1104cb398386a6e51550cf54a7c52d4438c2b73ebe5', '[\"*\"]', NULL, NULL, '2024-06-04 10:49:09', '2024-06-04 10:49:09'),
(785, 'App\\Models\\User', 8, 'user', '91eff8a36b70bbd31645efb719587885705aec38e69058ee9d5647c9953c5ca6', '[\"*\"]', NULL, NULL, '2024-06-05 04:24:46', '2024-06-05 04:24:46'),
(786, 'App\\Models\\User', 8, 'user', 'ea2029303440e94ea1d18fb99c44470d8f0b8634f5615ebdc85782acce351cc6', '[\"*\"]', NULL, NULL, '2024-06-05 07:50:46', '2024-06-05 07:50:46'),
(787, 'App\\Models\\User', 8, 'user', '090d89bc5f0ba0522f469fc477343f4719ba9841deb9fce1471f8d127793fd4b', '[\"*\"]', NULL, NULL, '2024-06-05 07:51:00', '2024-06-05 07:51:00'),
(788, 'App\\Models\\User', 68, 'user', '2448e7a456ed0a74f88cb239baf695830ae1787a9081d8dedfa6a8b05a788a1f', '[\"*\"]', NULL, NULL, '2024-06-05 07:51:21', '2024-06-05 07:51:21'),
(789, 'App\\Models\\User', 8, 'user', 'c922a12aa34fef06a02753f5fb7c7c1aa08530a0a95c01baacdc500f8a0144d9', '[\"*\"]', NULL, NULL, '2024-06-05 09:34:00', '2024-06-05 09:34:00'),
(790, 'App\\Models\\User', 68, 'user', '9235f283bb2adae13ea3fd9ae0c6f8c7d1aecc40c2164d17bd4c48251714b38e', '[\"*\"]', NULL, NULL, '2024-06-05 09:56:01', '2024-06-05 09:56:01'),
(791, 'App\\Models\\User', 68, 'user', 'efc1eceeae57695d66bedf7e86dfc4898eacb1381c168b9840067b77a3f44f0e', '[\"*\"]', NULL, NULL, '2024-06-05 09:56:25', '2024-06-05 09:56:25'),
(792, 'App\\Models\\User', 8, 'user', '09e26368de63c0da2384be68a96acb8848ce8d12a34fafaed3f06ff327e7d3ba', '[\"*\"]', NULL, NULL, '2024-06-05 10:44:32', '2024-06-05 10:44:32'),
(793, 'App\\Models\\User', 68, 'user', '48c52ce48d4d8dd90cf72d8f56c61f8e19250713a250ce2ec3ee7ea4708b21c5', '[\"*\"]', NULL, NULL, '2024-06-05 11:19:00', '2024-06-05 11:19:00'),
(794, 'App\\Models\\User', 68, 'user', 'aadf8b22b48bb93d7a6da7e0c22e0722ed2b116b38a92e0f2be2868d48fe8649', '[\"*\"]', NULL, NULL, '2024-06-06 04:40:15', '2024-06-06 04:40:15');

-- --------------------------------------------------------

--
-- Table structure for table `popup_pages`
--

CREATE TABLE `popup_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `popup_pages`
--

INSERT INTO `popup_pages` (`id`, `page_name`, `created_at`, `updated_at`) VALUES
(1, 'Home', NULL, NULL),
(2, 'Categories', NULL, NULL),
(3, 'Courses', NULL, NULL),
(4, 'Exams', NULL, NULL),
(5, 'Diagnostic Exam', NULL, NULL),
(6, 'Student Dashboard', NULL, NULL),
(7, 'Teacher Dashboard', NULL, NULL),
(8, 'Affilate User Dashboard', NULL, NULL),
(9, 'Question', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `popup_popup_pages`
--

CREATE TABLE `popup_popup_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `marketing_popup_id` bigint(20) UNSIGNED NOT NULL,
  `popup_page_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `popup_popup_pages`
--

INSERT INTO `popup_popup_pages` (`id`, `marketing_popup_id`, `popup_page_id`, `created_at`, `updated_at`) VALUES
(3, 3, 7, NULL, NULL),
(4, 2, 7, '2024-05-11', '2024-05-11'),
(5, 2, 4, '2024-05-11', '2024-05-11'),
(6, 5, 5, '2024-05-11', '2024-05-11'),
(7, 5, 6, '2024-05-11', '2024-05-11');

-- --------------------------------------------------------

--
-- Table structure for table `private_request`
--

CREATE TABLE `private_request` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `from` time NOT NULL,
  `to` time NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Confirm','Pendding','Rejected') NOT NULL DEFAULT 'Pendding',
  `rejected_reason` text DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `private_request`
--

INSERT INTO `private_request` (`id`, `user_id`, `date`, `from`, `to`, `teacher_id`, `status`, `rejected_reason`, `created_at`, `updated_at`) VALUES
(1, 5, '2023-11-08', '10:44:21', '12:45:21', 44, 'Confirm', NULL, NULL, '2024-02-13');

-- --------------------------------------------------------

--
-- Table structure for table `promo_chapters`
--

CREATE TABLE `promo_chapters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `promo_id` bigint(20) UNSIGNED NOT NULL,
  `chapter_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promo_chapters`
--

INSERT INTO `promo_chapters` (`id`, `promo_id`, `chapter_id`, `created_at`, `updated_at`) VALUES
(1, 6, 16, '2024-05-12 09:21:48', '2024-05-12 09:21:48'),
(2, 6, 18, '2024-05-12 09:21:48', '2024-05-12 09:21:48'),
(3, 8, 16, '2024-05-12 09:23:54', '2024-05-12 09:23:54'),
(4, 8, 19, '2024-05-12 09:23:54', '2024-05-12 09:23:54');

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `discount` float NOT NULL DEFAULT 0,
  `starts` date DEFAULT NULL,
  `ends` date DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `num_usage` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promo_codes`
--

INSERT INTO `promo_codes` (`id`, `name`, `discount`, `starts`, `ends`, `code`, `num_usage`, `created_at`, `updated_at`) VALUES
(2, 'Promo 1', 2.5, '2024-01-02', '2024-06-08', '111', 23, NULL, '2024-05-13'),
(5, 'admin@gmail.com', 22, '2024-01-11', '2024-06-05', '22', 22, '2024-01-23', '2024-01-23'),
(6, 'Promo 2', 5, '2024-04-01', '2024-04-16', 'Promo 2', 22, '2024-04-01', '2024-05-12'),
(7, 'sad12', 2, '2024-05-07', '2024-05-17', '312', 22, '2024-05-12', '2024-05-12'),
(8, 'sad12', 2, '2024-05-07', '2024-05-17', '312', 22, '2024-05-12', '2024-05-12'),
(9, 'sda', 3, '2024-05-01', '2024-06-06', 'asd', 21, '2024-05-12', '2024-05-12');

-- --------------------------------------------------------

--
-- Table structure for table `promo_courses`
--

CREATE TABLE `promo_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `promo_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promo_courses`
--

INSERT INTO `promo_courses` (`id`, `promo_id`, `course_id`, `created_at`, `updated_at`) VALUES
(6, 5, 4, '2024-01-23', '2024-01-23'),
(9, 2, 2, '2024-01-23', '2024-01-23'),
(12, 6, 1, '2024-05-12', '2024-05-12'),
(13, 6, 2, '2024-05-12', '2024-05-12'),
(16, 8, 1, '2024-05-12', '2024-05-12'),
(17, 8, 2, '2024-05-12', '2024-05-12'),
(18, 9, 1, '2024-05-12', '2024-05-12');

-- --------------------------------------------------------

--
-- Table structure for table `promo_packages`
--

CREATE TABLE `promo_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `promo_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promo_packages`
--

INSERT INTO `promo_packages` (`id`, `promo_id`, `package_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, NULL, NULL),
(2, 2, 3, NULL, NULL),
(3, 2, 4, NULL, NULL),
(4, 2, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promo_users`
--

CREATE TABLE `promo_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `promo_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `question` text DEFAULT NULL,
  `state` enum('0','1','2') NOT NULL,
  `q_url` varchar(255) DEFAULT NULL,
  `q_code` varchar(255) DEFAULT NULL,
  `q_type` enum('Trail','Parallel','Extra') DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `q_num` varchar(20) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `section` enum('1','2','3','4') DEFAULT NULL,
  `difficulty` enum('A','B','C','D','E') NOT NULL,
  `ans_type` enum('MCQ','Grid_in') DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `lesson_id`, `question`, `state`, `q_url`, `q_code`, `q_type`, `month`, `q_num`, `year`, `section`, `difficulty`, `ans_type`, `updated_at`, `created_at`) VALUES
(1, 4, 'Question 2', '0', NULL, 'sad', 'Parallel', 3, '4', 2022, '1', 'A', 'MCQ', '2024-06-03', '2024-01-29'),
(18, 4, NULL, '1', '2.png', '2', 'Parallel', 3, '21', 2022, '1', 'B', 'MCQ', '2024-02-05', NULL),
(19, 4, 'Question 2', '2', '2.png', 'sad', 'Trail', 3, '4', 2022, '1', 'A', 'MCQ', '2024-01-29', NULL),
(20, 4, 'question 2', '0', NULL, '1234', 'Parallel', 3, '2', 2022, '2', 'A', 'MCQ', '2024-01-29', '2024-01-29'),
(21, 4, 'question 2', '0', NULL, '1234', 'Parallel', 3, '2', 2022, '2', 'A', 'MCQ', '2024-01-29', '2024-01-29'),
(25, 4, '4 + 4 =', '0', NULL, '1233312', 'Trail', 3, '4', 2022, '1', 'A', 'Grid_in', NULL, NULL),
(27, 4, '<p>jhk</p>', '2', '2024X05X07X06X51X4575168.png', '2', 'Trail', 1, '2', 2015, '1', 'A', 'MCQ', '2024-05-07', '2024-05-07'),
(28, 4, '<p>212</p>', '2', '2024X05X11X09X10X278775592024X04X24X09X33X318032024X03X27X12X18X322024X02X19X07X46X506890202301101725mvf_dark_logo.png', '2', 'Trail', 3, '45', 2012, '1', 'A', 'MCQ', '2024-05-11', '2024-05-11'),
(29, 4, '<p>44 + 55</p>', '2', '2024X05X27X08X05X396064.png', '2', 'Trail', 7, '2', 2005, '1', 'A', 'MCQ', '2024-05-27', '2024-05-27'),
(30, 4, '<p>7 + 7</p>', '2', '2024X05X28X08X35X3514527.png', '2', 'Trail', 6, '43', 2023, '1', 'A', 'MCQ', '2024-05-28', '2024-05-28'),
(31, 4, '<p>7 + 7</p>', '2', '2024X05X28X08X36X5635847.png', '2', 'Trail', 6, '43', 2019, '2', 'A', 'MCQ', '2024-05-28', '2024-05-28'),
(32, 27, '<p>8-8</p>', '2', '2024X05X28X08X41X4344678.png', '3', 'Trail', 11, '88', 2007, '3', 'A', 'MCQ', '2024-05-28', '2024-05-28'),
(33, 4, '<p>7</p>', '2', '2024X05X28X08X44X3587717.png', '2', 'Trail', 9, '66', 2020, '1', 'A', 'MCQ', '2024-05-28', '2024-05-28'),
(34, 4, '<p>8 + 5</p>', '2', '2024X05X28X09X45X0357457.png', '2', 'Trail', 10, '44', 2022, '2', 'A', 'MCQ', '2024-05-28', '2024-05-28'),
(35, 4, '<p>6+6</p>', '2', '2024X05X28X09X47X4544926.png', '3', 'Trail', 9, '43', 2015, '2', 'A', 'MCQ', '2024-05-28', '2024-05-28'),
(36, 4, '<p>9-5</p>', '2', '2024X05X28X09X50X5436077.png', '3', 'Trail', 10, '43', 2021, '1', 'A', 'MCQ', '2024-05-28', '2024-05-28'),
(37, 4, '<p>7+9</p>', '2', '2024X05X28X11X09X5643026.png', '2', 'Trail', 6, '43', 2022, '1', 'A', 'MCQ', '2024-05-28', '2024-05-28'),
(38, 4, '<p>question</p>', '2', '2024X05X28X12X42X5335477.png', '2', 'Trail', 10, '43', 2013, NULL, 'A', 'MCQ', '2024-05-28', '2024-05-28'),
(39, 4, '<p>xfsdfd</p>', '2', '2024X05X30X11X55X3274447.png', '2', 'Trail', 11, '43', 2016, '1', 'A', 'MCQ', '2024-06-03', '2024-05-30');

-- --------------------------------------------------------

--
-- Table structure for table `question_history`
--

CREATE TABLE `question_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `answer` tinyint(1) NOT NULL,
  `time` time DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question_history`
--

INSERT INTO `question_history` (`id`, `user_id`, `question_id`, `answer`, `time`, `created_at`, `updated_at`) VALUES
(1, 8, 1, 0, NULL, '2024-03-12 11:50:41', '2024-03-14 11:50:41'),
(2, 8, 1, 0, NULL, '2024-03-14 12:00:38', '2024-03-14 12:00:38'),
(3, 8, 1, 0, NULL, '2024-04-09 14:07:00', '2024-04-09 14:07:00'),
(4, 8, 1, 0, NULL, '2024-04-09 14:08:20', '2024-04-09 14:08:20'),
(5, 8, 1, 1, NULL, '2024-04-17 08:34:04', '2024-04-17 08:34:04'),
(6, 8, 25, 0, NULL, '2024-05-01 09:53:03', '2024-05-01 09:53:03'),
(7, 8, 1, 0, NULL, '2024-05-25 13:14:24', '2024-05-25 13:14:24'),
(8, 8, 1, 1, NULL, '2024-06-04 08:59:35', '2024-06-04 08:59:35'),
(9, 8, 1, 0, NULL, '2024-06-04 08:59:44', '2024-06-04 08:59:44'),
(10, 8, 1, 0, NULL, '2024-06-04 09:00:22', '2024-06-04 09:00:22'),
(11, 8, 1, 0, NULL, '2024-06-04 09:03:20', '2024-06-04 09:03:20'),
(12, 8, 1, 0, NULL, '2024-06-04 09:03:26', '2024-06-04 09:03:26'),
(13, 8, 1, 1, NULL, '2024-06-04 09:03:32', '2024-06-04 09:03:32'),
(14, 8, 1, 1, NULL, '2024-06-04 09:13:15', '2024-06-04 09:13:15'),
(15, 8, 1, 1, NULL, '2024-06-04 09:13:50', '2024-06-04 09:13:50'),
(16, 8, 1, 1, NULL, '2024-06-04 11:49:01', '2024-06-04 11:49:01'),
(17, 8, 1, 1, NULL, '2024-06-04 11:49:26', '2024-06-04 11:49:26'),
(18, 8, 1, 1, NULL, '2024-06-04 11:50:26', '2024-06-04 11:50:26'),
(19, 8, 1, 0, NULL, '2024-06-05 07:40:51', '2024-06-05 07:40:51'),
(20, 8, 1, 0, NULL, '2024-06-05 08:59:42', '2024-06-05 08:59:42'),
(21, 8, 18, 0, NULL, '2024-06-05 08:59:58', '2024-06-05 08:59:58'),
(22, 8, 18, 0, NULL, '2024-06-05 09:02:04', '2024-06-05 09:02:04'),
(23, 8, 1, 0, NULL, '2024-06-05 09:03:30', '2024-06-05 09:03:30'),
(24, 8, 1, 0, NULL, '2024-06-05 09:04:47', '2024-06-05 09:04:47');

-- --------------------------------------------------------

--
-- Table structure for table `question_times`
--

CREATE TABLE `question_times` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `q_id` bigint(20) UNSIGNED NOT NULL,
  `time` datetime NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question_times`
--

INSERT INTO `question_times` (`id`, `user_id`, `q_id`, `time`, `created_at`, `updated_at`) VALUES
(1, 8, 1, '2024-02-26 09:43:38', '2024-02-26', '2024-02-26'),
(2, 8, 1, '2024-02-29 12:15:18', '2024-02-29', '2024-02-29'),
(3, 8, 18, '2024-02-29 12:16:37', '2024-02-29', '2024-02-29');

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `pass_score` float DEFAULT NULL,
  `quizze_order` int(10) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `title`, `description`, `time`, `score`, `pass_score`, `quizze_order`, `lesson_id`, `state`, `created_at`, `updated_at`) VALUES
(11, 'sa', 'ad', '1hours1M', 100, 48, 0, 4, 1, '2024-01-18', '2024-01-18'),
(12, 'sa', 'ad', '1hours1M', 100, 48, 0, 4, 1, '2024-01-18', '2024-01-18'),
(13, 'dfe', 'edfw', '1hours1M', 100, 48, 0, 4, 0, '2024-01-18', '2024-01-18'),
(14, 'da', NULL, '3hours3M', 1, 8, 0, 4, 0, '2024-01-20', '2024-01-20'),
(15, NULL, NULL, 'hoursM', NULL, NULL, 0, 4, 0, '2024-01-24', '2024-01-24'),
(18, 'adfw22', 'asd', '1Hours 1 M', 100, 22, 0, 4, 0, '2024-01-30', '2024-03-04'),
(19, 'sad', 'ds', '1hours1M', 100, 48, 0, 4, 0, '2024-01-30', '2024-01-30'),
(20, 'ffffff', 'ffff', '1hours1M', 100, 48, 0, 4, 0, '2024-01-31', '2024-01-31'),
(21, NULL, NULL, 'hoursM', NULL, NULL, 0, 4, 0, '2024-02-12', '2024-02-12'),
(22, 'lala', 'sfggdf', '1hours1M', 100, 8, 4, 4, 1, '2024-02-14', '2024-02-14'),
(23, 'lala', 'df', '1hours1M', 100, 48, 5, 4, 1, '2024-02-14', '2024-02-14'),
(24, 'lala', 'df', '1hours1M', 100, 48, 5, 4, 1, '2024-02-14', '2024-02-14'),
(25, 'lala', 'df', '1hours1M', 100, 48, 5, 4, 1, '2024-02-14', '2024-02-14'),
(26, 'lala', 'df', '1hours1M', 100, 48, 5, 4, 1, '2024-02-14', '2024-02-14'),
(29, 'nnnnn', 'nnnnn', '1hours1M', 100, 45, 2, 4, 1, '2024-03-31', '2024-03-31'),
(31, 'quiz 1', 'dfsgfdf', '1hours1M', 100, 48, 2, 22, 1, '2024-05-01', '2024-05-01'),
(32, 'quiz 1', 'asdf', '1hours1M', 100, 48, 1, 4, 1, '2024-05-01', '2024-05-01');

-- --------------------------------------------------------

--
-- Table structure for table `quizze_stu_ans`
--

CREATE TABLE `quizze_stu_ans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `quizze_id` bigint(20) UNSIGNED NOT NULL,
  `stu_id` bigint(20) UNSIGNED NOT NULL,
  `answer` varchar(255) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quizze_stu_ans`
--

INSERT INTO `quizze_stu_ans` (`id`, `question_id`, `quizze_id`, `stu_id`, `answer`, `created_at`, `updated_at`) VALUES
(1, 18, 12, 8, 'answer 1', '2024-02-10', '2024-02-10'),
(2, 1, 12, 8, '2', '2024-02-10', '2024-02-10'),
(3, 18, 12, 8, 'answer 1', '2024-02-10', '2024-02-10'),
(4, 1, 12, 8, '2', '2024-02-10', '2024-02-10'),
(5, 18, 12, 8, 'answer 1', '2024-02-10', '2024-02-10'),
(6, 1, 12, 8, '2', '2024-02-10', '2024-02-10');

-- --------------------------------------------------------

--
-- Table structure for table `q_ans`
--

CREATE TABLE `q_ans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ans_pdf` varchar(255) DEFAULT NULL,
  `ans_video` varchar(255) DEFAULT NULL,
  `Q_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `q_ans`
--

INSERT INTO `q_ans` (`id`, `ans_pdf`, `ans_video`, `Q_id`, `created_at`, `updated_at`) VALUES
(3, '2023X12X24X11X56X40202301111020C5631746XA3DDX43F6XA634X158716ABFA8B.jpeg', 'https://www.youtube.com/embed/zoPyeFrnX3k?si=CpLpiNS2wNDvuGH1', 18, '2023-12-24', '2023-12-24'),
(4, '2023X12X24X11X58X17202301101901SnapchatX2011979818.jpg', 'https://www.youtube.com/embed/zoPyeFrnX3k?si=CpLpiNS2wNDvuGH1', 19, '2023-12-24', '2023-12-24'),
(5, '2023X12X24X11X58X17202301100931mvf_light_logo.png', 'https://www.youtube.com/embed/zoPyeFrnX3k?si=CpLpiNS2wNDvuGH1', 19, '2023-12-24', '2023-12-24'),
(6, '2023X12X25X14X16X59202301111020C5631746XA3DDX43F6XA634X158716ABFA8B.jpeg', 'https://www.youtube.com/embed/zoPyeFrnX3k?si=CpLpiNS2wNDvuGH1', 20, '2023-12-25', '2023-12-25'),
(7, '2023X12X25X14X18X43202301111011mvf_light_logo.png', 'https://www.youtube.com/embed/zoPyeFrnX3k?si=CpLpiNS2wNDvuGH1', 21, '2023-12-25', '2023-12-25'),
(8, '2023X12X26X11X07X34202301100934C5631746XA3DDX43F6XA634X158716ABFA8B.jpeg', 'https://www.youtube.com/embed/zoPyeFrnX3k?si=CpLpiNS2wNDvuGH1', 20, '2023-12-26', '2023-12-26'),
(9, '2023X12X26X11X10X38202301100934C5631746XA3DDX43F6XA634X158716ABFA8B.jpeg', 'https://www.youtube.com/embed/zoPyeFrnX3k?si=CpLpiNS2wNDvuGH1', 19, '2023-12-26', '2023-12-26'),
(10, '2024X01X24X09X46X176.jpg', '2024X01X24X09X46X17', 20, '2024-01-24', '2024-01-24'),
(11, '2024X01X24X11X10X516.jpg', '2024X01X24X11X10X516.jpg', 21, '2024-01-24', '2024-01-24'),
(12, '2024X01X29X08X53X504.png', '2024X01X29X08X53X505.png', 18, '2024-01-29', '2024-01-29'),
(13, '2024X02X03X11X43X2412.jpg', '2024X02X03X11X43X2412.jpg', 18, '2024-02-03', '2024-02-03'),
(14, '2024X02X03X11X44X3110.jpg', '2024X02X03X11X44X3110.jpg', 18, '2024-02-03', '2024-02-03'),
(15, '2024X02X03X11X46X449.jpg', '2024X02X03X11X46X449.jpg', 18, '2024-02-03', '2024-02-03'),
(20, 'www.', 'www.', 27, '2024-05-07', '2024-05-07'),
(21, 'www.', 'www.', 27, '2024-05-07', '2024-05-07'),
(22, 'vvv', 'vvv', 27, '2024-05-07', '2024-05-07'),
(25, '2024X05X11X09X10X2787vectorX1.png', 'sadas', 28, '2024-05-11', '2024-05-11'),
(37, '2024X05X27X13X15X1665898.png', 'www.ahmed.com', 29, '2024-05-27', '2024-05-27'),
(38, '2024X05X28X08X41X4353997.png', 'www.ahmed.com', 32, '2024-05-28', '2024-05-28'),
(39, '2024X05X28X08X44X3554818.png', 'www.ahmed.com', 33, '2024-05-28', '2024-05-28'),
(40, '2024X05X28X10X49X245676', 'www.ahmed.com', 36, '2024-05-28', '2024-05-28'),
(41, '2024X05X28X11X09X5671167.png', 'www.ahmed11.com', 37, '2024-05-28', '2024-05-28'),
(42, '2024X05X28X12X42X5366978.png', 'www.ahmed.com', 38, '2024-05-28', '2024-05-28'),
(47, '2024X06X03X09X24X522727', 'https://us06web.zoom.us/j/86444846998?pwd=UkpFVNlkbVAvhRYTwrl0f6qdebaLFX.1', 39, '2024-06-03', '2024-06-03'),
(51, '2024X06X03X09X43X4527067.png', 'https://us06web.zoom.us/j/86444846998?pwd=UkpFVNlkbVAvhRYTwrl0f6qdebaLFX.1', 1, '2024-06-03', '2024-06-03');

-- --------------------------------------------------------

--
-- Table structure for table `q_quizes`
--

CREATE TABLE `q_quizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quizze_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `q_quizes`
--

INSERT INTO `q_quizes` (`id`, `quizze_id`, `question_id`, `created_at`, `updated_at`) VALUES
(7, 12, 18, '2024-01-18', '2024-01-18'),
(8, 12, 18, '2024-01-18', '2024-01-18'),
(11, 12, 18, '2024-01-20', '2024-01-20'),
(49, 18, 18, '2024-01-30', '2024-01-30'),
(51, 19, 18, '2024-01-30', '2024-01-30'),
(52, 19, 19, '2024-01-30', '2024-01-30'),
(55, 20, 18, '2024-01-31', '2024-01-31'),
(56, 12, 19, '2024-01-31', '2024-01-31'),
(57, 12, 20, '2024-01-31', '2024-01-31'),
(60, 12, 1, '2024-01-31', '2024-01-31'),
(62, 14, 21, '2024-01-31', '2024-01-31'),
(63, 14, 19, '2024-01-31', '2024-01-31'),
(64, 14, 18, '2024-01-31', '2024-01-31'),
(115, 32, 1, '2024-05-01', '2024-05-01'),
(116, 32, 18, '2024-05-01', '2024-05-01'),
(117, 32, 19, '2024-05-01', '2024-05-01');

-- --------------------------------------------------------

--
-- Table structure for table `report_questions`
--

CREATE TABLE `report_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `list_id` bigint(20) UNSIGNED NOT NULL,
  `statues` enum('pendding','inprogress','done') NOT NULL DEFAULT 'pendding',
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_question_lists`
--

CREATE TABLE `report_question_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `list` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report_question_lists`
--

INSERT INTO `report_question_lists` (`id`, `list`, `created_at`, `updated_at`) VALUES
(1, 'Error 1', NULL, NULL),
(2, 'Error 2', NULL, '2024-04-16 12:03:57'),
(5, 'Error 3', '2024-04-17 08:29:22', '2024-04-17 09:18:55');

-- --------------------------------------------------------

--
-- Table structure for table `report_videos`
--

CREATE TABLE `report_videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `lesson_video_id` bigint(20) UNSIGNED DEFAULT NULL,
  `q_video_id` bigint(20) UNSIGNED DEFAULT NULL,
  `list_id` bigint(20) UNSIGNED NOT NULL,
  `statues` enum('pendding','inprogress','done') NOT NULL DEFAULT 'pendding',
  `details` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report_videos`
--

INSERT INTO `report_videos` (`id`, `date`, `user_id`, `lesson_video_id`, `q_video_id`, `list_id`, `statues`, `details`, `created_at`, `updated_at`) VALUES
(2, '2024-04-21', 8, 38, NULL, 1, 'pendding', NULL, '2024-04-21 12:59:00', '2024-04-21 12:59:00'),
(3, '2024-04-21', 8, 38, NULL, 2, 'pendding', NULL, '2024-04-21 12:59:16', '2024-04-21 12:59:16'),
(4, '2024-04-21', 8, 38, NULL, 1, 'pendding', NULL, '2024-04-21 13:00:30', '2024-04-21 13:00:30'),
(8, '2024-06-04', 8, 38, NULL, 2, 'pendding', NULL, '2024-06-04 12:58:28', '2024-06-04 12:58:28');

-- --------------------------------------------------------

--
-- Table structure for table `report_video_lists`
--

CREATE TABLE `report_video_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `list` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report_video_lists`
--

INSERT INTO `report_video_lists` (`id`, `list`, `created_at`, `updated_at`) VALUES
(1, 'Error 11', '2024-04-17 10:21:42', '2024-04-17 08:48:06'),
(2, 'Error 22', '2024-04-17 10:21:42', '2024-04-17 10:21:42'),
(4, 'Error 33', '2024-04-17 08:51:49', '2024-04-17 08:51:49');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `score_list`
--

CREATE TABLE `score_list` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `score_id` bigint(20) UNSIGNED NOT NULL,
  `question_num` int(11) NOT NULL,
  `score` float NOT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `score_list`
--

INSERT INTO `score_list` (`id`, `score_id`, `question_num`, `score`, `updated_at`, `created_at`) VALUES
(2, 4, 1, 2, '2024-02-18', '2024-02-18'),
(3, 4, 2, 3, '2024-02-18', '2024-02-18'),
(4, 4, 3, 4, '2024-02-18', '2024-02-18'),
(5, 4, 4, 5, '2024-02-18', '2024-02-18'),
(6, 4, 5, 5, '2024-02-18', '2024-02-18'),
(7, 4, 6, 6, '2024-02-18', '2024-02-18'),
(8, 4, 7, 8, '2024-02-18', '2024-02-18'),
(9, 4, 8, 8, '2024-02-18', '2024-02-18'),
(10, 4, 9, 8, '2024-02-18', '2024-02-18'),
(11, 4, 10, 9, '2024-02-18', '2024-02-18'),
(12, 4, 11, 11, '2024-02-18', '2024-02-18'),
(13, 4, 12, 21, '2024-02-18', '2024-02-18'),
(14, 4, 13, 21, '2024-02-18', '2024-02-18'),
(15, 4, 14, 21, '2024-02-18', '2024-02-18'),
(16, 4, 15, 12, '2024-02-18', '2024-02-18'),
(17, 4, 16, 12, '2024-02-18', '2024-02-18'),
(18, 4, 17, 32, '2024-02-18', '2024-02-18'),
(19, 4, 18, 32, '2024-02-18', '2024-02-18'),
(20, 4, 19, 32, '2024-02-18', '2024-02-18'),
(21, 4, 20, 23, '2024-02-18', '2024-02-18'),
(22, 4, 21, 32, '2024-02-18', '2024-02-18'),
(23, 4, 22, 23, '2024-02-18', '2024-02-18'),
(24, 4, 23, 23, '2024-02-18', '2024-02-18'),
(25, 4, 24, 43, '2024-02-18', '2024-02-18'),
(26, 4, 25, 34, '2024-02-18', '2024-02-18'),
(27, 4, 26, 45, '2024-02-18', '2024-02-18'),
(28, 4, 27, 45, '2024-02-18', '2024-02-18'),
(29, 4, 28, 45, '2024-02-18', '2024-02-18'),
(30, 4, 29, 45, '2024-02-18', '2024-02-18'),
(31, 4, 30, 45, '2024-02-18', '2024-02-18'),
(32, 4, 31, 45, '2024-02-18', '2024-02-18'),
(33, 4, 32, 54, '2024-02-18', '2024-02-18'),
(34, 4, 33, 45, '2024-02-18', '2024-02-18'),
(35, 4, 34, 45, '2024-02-18', '2024-02-18'),
(36, 4, 35, 54, '2024-02-18', '2024-02-18'),
(37, 4, 36, 56, '2024-02-18', '2024-02-18'),
(38, 4, 37, 56, '2024-02-18', '2024-02-18'),
(39, 4, 38, 65, '2024-02-18', '2024-02-18'),
(40, 4, 39, 76, '2024-02-18', '2024-02-18'),
(41, 4, 40, 76, '2024-02-18', '2024-02-18'),
(42, 4, 41, 76, '2024-02-18', '2024-02-18'),
(43, 4, 42, 76, '2024-02-18', '2024-02-18'),
(44, 4, 43, 78, '2024-02-18', '2024-02-18'),
(45, 4, 44, 78, '2024-02-18', '2024-02-18'),
(46, 4, 45, 100, '2024-02-18', '2024-02-18'),
(47, 5, 1, 2, '2024-02-25', '2024-02-25'),
(48, 5, 2, 5, '2024-02-25', '2024-02-25'),
(49, 7, 1, 2, '2024-05-05', '2024-05-05'),
(50, 7, 2, 3, '2024-05-05', '2024-05-05'),
(51, 8, 1, 1, '2024-05-05', '2024-05-05'),
(52, 8, 2, 2, '2024-05-05', '2024-05-05');

-- --------------------------------------------------------

--
-- Table structure for table `score_sheet`
--

CREATE TABLE `score_sheet` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `score` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `score_sheet`
--

INSERT INTO `score_sheet` (`id`, `name`, `course_id`, `score`, `created_at`, `updated_at`) VALUES
(2, 'vd1', 2, 100, '2024-02-18', '2024-02-18'),
(3, 'vd1', 2, 100, '2024-02-18', '2024-02-18'),
(4, 'vd4', 2, 100, '2024-02-18', '2024-02-18'),
(5, 'asdf', 1, 100, '2024-02-25', '2024-02-25'),
(6, 'score', 1, 80, '2024-05-05', '2024-05-05'),
(7, 'score', 1, 80, '2024-05-05', '2024-05-05'),
(8, 'sdf', 1, 111, '2024-05-05', '2024-05-05');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `link` varchar(255) NOT NULL,
  `material_link` varchar(255) DEFAULT NULL,
  `from` time NOT NULL,
  `to` time NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('group','private','session') NOT NULL,
  `price` float DEFAULT NULL,
  `access_dayes` int(11) DEFAULT NULL,
  `repeat` enum('Once','Repeat') DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `name`, `date`, `link`, `material_link`, `from`, `to`, `duration`, `lesson_id`, `teacher_id`, `group_id`, `type`, `price`, `access_dayes`, `repeat`, `created_at`, `updated_at`) VALUES
(4, 'sa', '2024-09-11', 'https://www.link.com', NULL, '11:00:00', '14:12:00', 11, 4, 71, NULL, 'group', 222, 13, 'Repeat', '2024-01-15', '2024-01-24'),
(6, 'session', '2024-09-01', 'https://www.link.com', NULL, '00:51:00', '00:51:00', 0, 4, 71, NULL, 'private', 22, 13, 'Once', '2024-01-24', '2024-01-24'),
(8, 'dfg', '2024-09-05', 'https://www.link.com', NULL, '10:47:00', '10:48:00', 0, 4, 71, NULL, 'session', 200, 13, 'Once', '2024-01-27', '2024-01-27'),
(10, 'ewr', '2024-09-05', 'https://www.link.com', NULL, '10:00:00', '10:01:00', 0, 4, 1, NULL, 'session', 22, 13, 'Once', '2024-01-27', '2024-01-27'),
(11, 'mohamed yasen', '2024-02-01', 'https://www.link.com', 'sdss', '16:06:00', '16:06:00', 0, 4, 1, 1, 'group', NULL, NULL, 'Once', '2024-02-04', '2024-02-04'),
(12, 'admin@gmail.com', '2024-02-06', 'https://www.link.com', 'sdss', '09:31:00', '11:32:00', 0, 4, 1, 1, 'group', NULL, NULL, 'Once', '2024-02-05', '2024-02-05'),
(13, 'vd1', '2024-02-22', 'https://www.link.com', 'sdss', '10:43:00', '10:43:00', 0, 4, 1, 1, 'group', NULL, NULL, 'Once', '2024-02-05', '2024-02-05'),
(14, 'rtr', '2024-02-23', 'https://www.link.com', NULL, '10:53:00', '10:52:00', 0, 4, 1, 1, 'group', NULL, NULL, 'Once', '2024-02-05', '2024-02-05'),
(15, 'rtr', '2024-02-23', 'https://www.link.com', NULL, '10:53:00', '10:52:00', 0, 4, 1, 1, 'group', NULL, NULL, 'Once', '2024-02-05', '2024-02-05'),
(18, 'fdfh', '2024-03-28', 'https//:-www.link.com', 'https//:-www.link.com', '13:45:00', '13:46:00', 2, 4, 1, 1, 'private', NULL, NULL, 'Repeat', '2024-03-31', '2024-03-31'),
(19, 'dddddd1111111', '2024-09-19', 'sdad', 'sdss', '13:48:00', '13:47:00', 1111, 4, 1, 1, 'private', NULL, NULL, 'Once', '2024-03-31', '2024-03-31'),
(20, 'vd1', '2024-06-01', 'tytfhg', 'hfghfgh', '16:31:00', '16:34:00', 2, 4, 1, NULL, 'private', NULL, NULL, 'Once', '2024-04-09', '2024-04-09'),
(21, 'asdfs', '2024-05-21', 'vbfghb', 'gfhfghf', '15:05:00', '15:08:00', NULL, 4, 11, 1, 'group', NULL, NULL, NULL, '2024-05-10', '2024-05-10'),
(22, 'rter', '2024-05-08', 'df', 'sfdr', '21:19:00', '21:16:00', NULL, 4, 71, 8, 'group', NULL, NULL, NULL, '2024-05-23', '2024-05-23'),
(23, 'df', '2024-06-06', 'https://us06web.zoom.us/j/86444846998?pwd=UkpFVNlkbVAvhRYTwrl0f6qdebaLFX.1', 'https://us06web.zoom.us/j/86444846998?pwd=UkpFVNlkbVAvhRYTwrl0f6qdebaLFX.1', '16:31:00', '16:29:00', NULL, 4, 71, 1, 'group', NULL, NULL, NULL, '2024-06-05', '2024-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `session_attendance`
--

CREATE TABLE `session_attendance` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session_attendance`
--

INSERT INTO `session_attendance` (`id`, `user_id`, `session_id`, `created_at`, `updated_at`) VALUES
(4, 8, 4, '2024-05-15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `session_days`
--

CREATE TABLE `session_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `day` varchar(255) NOT NULL,
  `times` int(11) DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session_days`
--

INSERT INTO `session_days` (`id`, `session_id`, `day`, `times`, `created_at`, `updated_at`) VALUES
(1, 3, 'SaturDay', NULL, '2024-01-14', '2024-01-14'),
(2, 3, 'SunDay', NULL, '2024-01-14', '2024-01-14'),
(3, 3, 'MonDay', NULL, '2024-01-14', '2024-01-14'),
(4, 4, 'SaturDay', 6, '2024-01-15', '2024-01-15'),
(5, 4, 'SunDay', 6, '2024-01-15', '2024-01-15'),
(6, 4, 'MonDay', 6, '2024-01-15', '2024-01-15'),
(7, 5, 'SunDay', NULL, '2024-01-15', '2024-01-15'),
(8, 5, 'MonDay', NULL, '2024-01-15', '2024-01-15'),
(9, 5, 'TuesDay', NULL, '2024-01-15', '2024-01-15'),
(10, 9, 'SaturDay', 2, '2024-01-27', '2024-01-27'),
(11, 9, 'SunDay', 2, '2024-01-27', '2024-01-27');

-- --------------------------------------------------------

--
-- Table structure for table `session_groups`
--

CREATE TABLE `session_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `session_groups`
--

INSERT INTO `session_groups` (`id`, `name`, `teacher_id`, `state`, `created_at`, `updated_at`) VALUES
(1, 'group1', 1, 1, NULL, '2024-05-08'),
(5, 'mohamed yasen', 1, 1, '2024-01-27', '2024-01-27'),
(7, 'vd1', 8, 1, '2024-03-31', '2024-03-31'),
(8, 'my group 1', 11, 0, '2024-05-08', '2024-06-06'),
(9, 'asdds', 11, 1, '2024-06-06', '2024-06-06');

-- --------------------------------------------------------

--
-- Table structure for table `session_students`
--

CREATE TABLE `session_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session_students`
--

INSERT INTO `session_students` (`id`, `session_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 20, 8, '2024-05-25', '2024-05-25'),
(2, 19, 8, '2024-05-25', '2024-05-25'),
(3, 6, 8, '2024-05-25', '2024-05-25');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slider_img` varchar(255) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `slider_img`, `created_at`, `updated_at`) VALUES
(1, '2942024X03X25X13X19X182024X02X19X07X47X0129202301101725mvf_dark_logo.png', NULL, '2024-03-25'),
(2, '2.png', NULL, NULL),
(3, '3.png', NULL, NULL),
(4, '4.png', NULL, NULL),
(5, '5.png', NULL, NULL),
(6, '6.png', NULL, NULL),
(7, '7.png', NULL, NULL),
(8, '3182024X03X25X13X30X122024X02X19X07X47X0129202301101725mvf_dark_logo.png', '2024-03-25', '2024-03-25');

-- --------------------------------------------------------

--
-- Table structure for table `small_packages`
--

CREATE TABLE `small_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `module` enum('Exam','Question','Live') NOT NULL,
  `number` int(11) NOT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `small_packages`
--

INSERT INTO `small_packages` (`id`, `user_id`, `admin_id`, `module`, `number`, `updated_at`, `created_at`) VALUES
(1, 8, 1, 'Live', 3, '2024-04-08', '2024-03-21'),
(2, 68, 1, 'Exam', 0, '2024-03-23', '2024-03-23'),
(3, 1, 1, 'Exam', 11, '2024-04-09', '2024-04-09'),
(4, 8, 68, 'Exam', 0, '2024-06-04', '2024-05-04'),
(5, 8, 68, 'Exam', 0, '2024-06-04', '2024-05-12'),
(6, 8, 68, 'Exam', 0, '2024-06-04', '2024-05-12'),
(7, 8, 68, 'Exam', 0, '2024-06-04', '2024-05-12'),
(8, 59, 68, 'Question', 7, '2024-05-12', '2024-05-12'),
(9, 59, 68, 'Question', 7, '2024-05-12', '2024-05-12'),
(10, 72, 68, 'Live', 5, '2024-05-12', '2024-05-12'),
(11, 72, 68, 'Live', 5, '2024-05-12', '2024-05-12'),
(12, 72, 68, 'Live', 5, '2024-05-12', '2024-05-12'),
(13, 73, 68, 'Question', 3, '2024-05-12', '2024-05-12');

-- --------------------------------------------------------

--
-- Table structure for table `student_quizzes`
--

CREATE TABLE `student_quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `quizze_id` bigint(20) UNSIGNED NOT NULL,
  `score` int(11) NOT NULL,
  `time` varchar(255) NOT NULL,
  `r_questions` int(11) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_quizzes`
--

INSERT INTO `student_quizzes` (`id`, `date`, `student_id`, `lesson_id`, `quizze_id`, `score`, `time`, `r_questions`, `created_at`, `updated_at`) VALUES
(1, '2024-02-15', 8, 4, 12, 50, '$req->time', 3, '2024-02-15', '2024-02-15'),
(2, '2024-03-02', 8, 4, 12, 0, '0', 0, '2024-03-02', '2024-03-02'),
(3, '2024-03-23', 8, 4, 12, 83, '$req->timer', 5, '2024-03-23', '2024-03-23'),
(4, '2024-03-23', 8, 4, 12, 83, '$req->timer', 5, '2024-03-23', '2024-03-23'),
(5, '2024-04-01', 8, 4, 12, 83, '$req->timer', 5, '2024-04-01', '2024-04-01'),
(6, '2024-04-04', 8, 4, 12, 17, '$req->timer', 1, '2024-04-04', '2024-04-04'),
(7, '2024-04-04', 8, 4, 12, 17, '$req->timer', 1, '2024-04-04', '2024-04-04'),
(8, '2024-04-04', 8, 4, 12, 17, '$req->timer', 1, '2024-04-04', '2024-04-04'),
(9, '2024-04-04', 8, 4, 12, 17, '$req->timer', 1, '2024-04-04', '2024-04-04'),
(10, '2024-04-04', 8, 4, 12, 17, '$req->timer', 1, '2024-04-04', '2024-04-04'),
(11, '2024-04-04', 8, 4, 12, 17, '$req->timer', 1, '2024-04-04', '2024-04-04'),
(12, '2024-04-04', 8, 4, 12, 0, '$req->timer', 0, '2024-04-04', '2024-04-04'),
(13, '2024-04-04', 8, 4, 12, 0, '$req->timer', 0, '2024-04-04', '2024-04-04'),
(14, '2024-04-04', 8, 4, 12, 0, '$req->timer', 0, '2024-04-04', '2024-04-04'),
(15, '2024-04-04', 8, 4, 12, 0, '$req->timer', 0, '2024-04-04', '2024-04-04'),
(16, '2024-04-27', 8, 4, 12, 100, '$req->timer', 6, '2024-04-27', '2024-04-27'),
(17, '2024-04-27', 8, 4, 11, 55, '22', 7, '2024-04-27', '2024-04-27'),
(18, '2024-05-25', 8, 4, 12, 100, '$req->timer', 6, '2024-05-25', '2024-05-25'),
(19, '2024-05-25', 8, 4, 12, 83, '$req->timer', 5, '2024-05-25', '2024-05-25'),
(20, '2024-05-25', 8, 4, 12, 100, '$req->timer', 6, '2024-05-25', '2024-05-25'),
(21, '2024-06-05', 8, 4, 12, 0, '$req->timer', 0, '2024-06-05', '2024-06-05'),
(22, '2024-06-05', 8, 4, 12, 0, '$req->timer', 0, '2024-06-05', '2024-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `student_quizze_mistakes`
--

CREATE TABLE `student_quizze_mistakes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `student_quizze_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_quizze_mistakes`
--

INSERT INTO `student_quizze_mistakes` (`id`, `question_id`, `student_quizze_id`, `created_at`, `updated_at`) VALUES
(1, 18, 19, '2024-05-25', '2024-05-25'),
(2, 18, 21, '2024-06-05', '2024-06-05'),
(3, 18, 21, '2024-06-05', '2024-06-05'),
(4, 18, 21, '2024-06-05', '2024-06-05'),
(5, 19, 21, '2024-06-05', '2024-06-05'),
(6, 20, 21, '2024-06-05', '2024-06-05'),
(7, 1, 21, '2024-06-05', '2024-06-05'),
(8, 18, 22, '2024-06-05', '2024-06-05'),
(9, 18, 22, '2024-06-05', '2024-06-05'),
(10, 18, 22, '2024-06-05', '2024-06-05'),
(11, 19, 22, '2024-06-05', '2024-06-05'),
(12, 20, 22, '2024-06-05', '2024-06-05'),
(13, 1, 22, '2024-06-05', '2024-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `student_sessions`
--

CREATE TABLE `student_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_sessions`
--

INSERT INTO `student_sessions` (`id`, `course_id`, `student_id`, `created_at`, `updated_at`) VALUES
(23, 1, 8, '2024-04-30', '2024-04-30'),
(24, 1, 8, '2024-04-30', '2024-04-30'),
(25, 1, 8, '2024-05-02', '2024-05-02'),
(26, 1, 8, '2024-05-02', '2024-05-02');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_courses`
--

CREATE TABLE `teacher_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher_courses`
--

INSERT INTO `teacher_courses` (`id`, `user_id`, `course_id`, `created_at`, `updated_at`) VALUES
(3, 71, 1, '2024-05-23 14:42:31', '2024-05-23 14:42:31'),
(6, 95, 2, '2024-05-23 14:43:54', '2024-05-23 14:43:54');

-- --------------------------------------------------------

--
-- Table structure for table `teacher__courses`
--

CREATE TABLE `teacher__courses` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usage_promo`
--

CREATE TABLE `usage_promo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `promo_id` bigint(20) UNSIGNED NOT NULL,
  `promo` varchar(255) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usage_promo`
--

INSERT INTO `usage_promo` (`id`, `user_id`, `promo_id`, `promo`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '', '2024-01-18', '2024-01-18'),
(2, 5, 2, '', '2024-01-27', '2024-01-27'),
(4, 1, 2, '', '2024-01-27', '2024-01-27'),
(5, 5, 2, 'Promo 1', '2024-01-27', '2024-01-27'),
(7, 5, 2, 'Promo 1', '2024-03-12', '2024-03-12'),
(8, 5, 2, 'Promo 1', '2024-03-12', '2024-03-12'),
(9, 1, 2, 'Promo 1', '2024-03-12', '2024-03-12'),
(10, 5, 2, 'Promo 1', '2024-03-12', '2024-03-12'),
(11, 5, 2, 'Promo 1', '2024-03-12', '2024-03-12'),
(12, 5, 2, 'Promo 1', '2024-03-12', '2024-03-12'),
(13, 5, 2, 'Promo 1', '2024-03-12', '2024-03-12'),
(15, 5, 2, 'Promo 1', '2024-03-12', '2024-03-12'),
(16, 5, 2, 'Promo 1', '2024-03-12', '2024-03-12'),
(17, 1, 2, 'Promo 1', '2024-03-12', '2024-03-12'),
(18, 1, 2, 'Promo 1', '2024-03-12', '2024-03-12'),
(19, 1, 2, 'Promo 1', '2024-03-12', '2024-03-12'),
(24, 1, 2, 'Promo 1', '2024-04-01', '2024-04-01'),
(25, 1, 9, 'asd', '2024-05-12', '2024-05-12'),
(26, 1, 2, '111', '2024-05-13', '2024-05-13'),
(27, 1, 2, '111', '2024-05-13', '2024-05-13'),
(28, 1, 2, '111', '2024-05-13', '2024-05-13'),
(29, 8, 2, '111', '2024-05-13', '2024-05-13'),
(30, 8, 2, '111', '2024-05-13', '2024-05-13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(191) NOT NULL,
  `parent_phone` varchar(191) DEFAULT NULL,
  `parent_email` varchar(191) DEFAULT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'default.png',
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `position` enum('user_admin','admin','student','teacher','affilate') NOT NULL,
  `user_admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `grade` varchar(20) DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `state` enum('hidden','Show') NOT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `extra_email` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `last_login_ip` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `f_name`, `l_name`, `name`, `nick_name`, `email`, `profile_photo_path`, `email_verified_at`, `phone`, `parent_phone`, `parent_email`, `image`, `city_id`, `position`, `user_admin_id`, `grade`, `course_id`, `category_id`, `password`, `state`, `avatar`, `remember_token`, `extra_email`, `deleted_at`, `created_at`, `updated_at`, `last_login_at`, `last_login_ip`) VALUES
(1, 'Mohammed', 'Yahia', 'Ahmed', 'Ahmed', 'Ahmed@gmail.com', NULL, NULL, '0113443534', '012345346', 'Ali@gmail.com', '1972024X01X27X10X03X326.jpg', NULL, 'admin', NULL, NULL, 2, 1, '$2y$10$O4pDFFvEQGAkfZ.mcGIhaOb0MQCocleYwEySm4OYgq9./pKT021de', 'Show', NULL, NULL, NULL, NULL, NULL, '2024-01-27 08:03:32', NULL, NULL),
(5, 'Mohammed', 'Yahia', 'affilate', 'Ahmed1', 'affilate@gmail.com', NULL, NULL, '01063546545', NULL, NULL, '9362024X04X26X11X56X262.png', NULL, 'affilate', NULL, NULL, NULL, NULL, '$2y$10$CObD/nCljL5PpIad0fMwpe.jZVBdNwmn9HPt4xDpOnzgG2JjeMXFO', 'Show', NULL, NULL, NULL, NULL, '2023-12-18 09:42:45', '2024-05-13 11:21:18', NULL, NULL),
(8, 'Mohammed', 'Yahia', 'student', 'Ahmed', 'student@gmail.com', NULL, NULL, '123234556', NULL, NULL, '7452024X02X19X09X11X19202301101725mvf_dark_logo.png', NULL, 'student', NULL, NULL, NULL, NULL, '$2y$10$9Z4Y/RglhKwbQI4VD8Zeuu7GYyOVSAHiadvz2yNgWMKwdA62SRhTC', 'Show', NULL, NULL, NULL, NULL, '2023-12-18 09:44:14', '2024-05-08 04:42:06', NULL, NULL),
(11, 'Mohammed', 'Yahia', 'Teacher12', 'Ahmed', 'teacher2@gmail.com', NULL, NULL, '01099475854', NULL, NULL, '2023X12X18X11X52X277966202304090932egyptXflagXwaveXiconX32.png', NULL, 'teacher', NULL, NULL, 1, 1, '$2y$10$Y4fg1B5EpujC8OVSCO6fNOyxdAj2lPJDZWibbtD8j55Jik6fU4Uq6', 'Show', NULL, NULL, NULL, NULL, '2023-12-18 09:52:27', '2024-02-05 10:45:46', NULL, NULL),
(44, 'Mohammed', 'Yahia', 'admin@gmail.com', 'Ahmed', 'sad@gmail.com', NULL, NULL, '123', '123', NULL, 'default.png', NULL, 'user_admin', 9, NULL, NULL, NULL, '$2y$10$RkeDuqhtAqMTRC7gfMFxG.Vl8pLtWGgj1jisi0ZkphX9LDVUQaZpO', 'Show', NULL, NULL, NULL, NULL, '2023-12-31 06:31:28', '2024-02-05 10:15:37', NULL, NULL),
(59, 'Mohammed', 'Yahia', 'as', 'Ahmed', 'admin2312@gmail.com', NULL, NULL, '213', NULL, NULL, 'default.png', NULL, 'student', NULL, '1', NULL, NULL, '$2y$10$UT7CEpaDZ6etgdvQDjN5huCPzvCM/xdiLbT02hZIZh.doXV6/SLRS', 'hidden', NULL, NULL, NULL, NULL, '2024-01-03 07:52:53', '2024-01-03 07:52:53', NULL, NULL),
(65, 'Mohammed', 'Yahia', 'wdwe', 'Ahmed', 'admin1234@gmail.com', NULL, NULL, 'ewfwef', NULL, NULL, 'default.png', NULL, 'teacher', NULL, NULL, 12, 9, '$2y$10$oK/jrMZawz/dg0fgQBAp2OHA8WpEfHIdGbSJnXZgl4QRbZq5zdVT2', 'hidden', NULL, NULL, NULL, NULL, '2024-02-27 10:45:08', '2024-02-27 10:45:08', NULL, NULL),
(66, 'Mohammed', 'Yahia', 'xcas', 'Ahmed', 'admin332@gmail.com', NULL, NULL, '32423243', '011324567611', 'yasen@gmail.com', 'default.png', NULL, 'admin', NULL, NULL, NULL, NULL, '$2y$10$BzpILuoESKJAgcYPg2muY.NLOL0DUrqPpAo7dUBz7c5mZBTJCzCwq', 'hidden', NULL, NULL, NULL, NULL, '2024-02-27 10:57:38', '2024-02-27 10:57:38', NULL, NULL),
(68, 'Mohammed', 'Yahia', 'Ahmed_Yahia', 'Ahmed', 'admin@gmail.com', NULL, NULL, '0123456789', '0123456789', NULL, 'default.png', NULL, 'admin', 9, NULL, NULL, NULL, '$2y$10$o694AWL8QgiCJQCwxbKTh.ny2Uf1bORwKgy5BHbPL8q396p2lU/xK', '', NULL, NULL, NULL, NULL, NULL, '2024-04-18 09:35:56', NULL, NULL),
(71, 'Mohammed', 'Yahia', 'teacher', 'Ahmed', 'teacher@gmail.com', NULL, NULL, '123456789', NULL, NULL, '9062024X03X28X11X19X583882024X03X16X08X07X112024X02X19X07X47X0129202301101725mvf_dark_logo.png', NULL, 'teacher', NULL, NULL, 1, 1, '$2y$10$GVCwnwSesuLeMnG8mDXs7uvPB.8pLdWJnpJ2Qle/j0qgATGLkc/BW', '', NULL, NULL, NULL, NULL, NULL, '2024-05-23 12:42:31', NULL, NULL),
(72, 'Mohammed', 'Yahia', 'student73', 'Ahmed', 'student73@gmail.com', NULL, NULL, '01099475854', NULL, NULL, 'default.png', NULL, 'student', NULL, NULL, NULL, NULL, '$2y$10$9Z4Y/RglhKwbQI4VD8Zeuu7GYyOVSAHiadvz2yNgWMKwdA62SRhTC', 'Show', NULL, NULL, NULL, NULL, '2024-04-08 09:42:18', '2024-04-08 09:42:18', NULL, NULL),
(73, 'Mohammed', 'Yahia', 'student75', 'Ahmed', 'student75@gmail.com', NULL, NULL, '01099475854', NULL, NULL, 'default.png', NULL, 'student', NULL, NULL, NULL, NULL, '$2y$10$yB/widboWULJiBQWEWWmpuj7RJusa6evvLuAZLayMVHYccIm8AW5i', 'Show', NULL, NULL, NULL, NULL, '2024-04-08 09:49:39', '2024-04-08 09:49:39', NULL, NULL),
(74, 'Mohammed', 'Yahia', 'student', 'Ahmed', 'student_one@gmail.com', NULL, NULL, '123456789', NULL, NULL, 'default.png', NULL, 'student', NULL, NULL, NULL, NULL, '$2y$10$BKsTSaAuydPqgotRajVNYea94qRZLLN57roEqf8Sx8KaDbZsX/x72', 'hidden', NULL, NULL, NULL, NULL, '2024-04-08 10:02:04', '2024-04-08 10:02:04', NULL, NULL),
(77, 'Ahmed', 'Said', 'affilate2', 'Ahmed', 'affilate2@gmail.com', NULL, NULL, '123456789', NULL, NULL, 'default.png', NULL, 'affilate', NULL, NULL, NULL, NULL, '$2y$10$SViEJcpV/5jyWZByMXnaZunZGNUP5OIJtp3lhe07PacZhdQUwiNyS', 'hidden', NULL, NULL, NULL, NULL, '2024-04-23 07:30:47', '2024-04-23 07:30:47', NULL, NULL),
(78, 'Ahmed', 'Yahia', 'ahmed yahia', 'Ahmed', 'ahmed312@gmail.com', NULL, NULL, '012343554', NULL, NULL, 'default.png', 2, 'student', NULL, '2', NULL, NULL, '$2y$10$qkS1oFF96EuZCiJXRTType39oBdEocuYyMYZnXejiyg2OphtYsLrO', 'hidden', NULL, NULL, NULL, NULL, '2024-04-30 10:42:47', '2024-04-30 10:42:47', NULL, NULL),
(79, 'Ahmed', 'mohamed', NULL, 'Ahmed', 'ahmedahmddadaddhm@gmail.com', NULL, NULL, '012343554', NULL, NULL, 'default.png', 2, 'student', NULL, '2', NULL, NULL, '$2y$10$TzR/.poBKCgEfLoKzd3HtOFe89kziAdqAdz1fF.STEVLBdQP2wVmO', 'hidden', NULL, NULL, NULL, NULL, '2024-05-01 11:35:18', '2024-05-01 11:35:18', NULL, NULL),
(81, NULL, NULL, 'asdds', NULL, 'admin564@gmail.com', NULL, NULL, '01099475854', NULL, NULL, 'default.png', NULL, 'student', NULL, NULL, NULL, NULL, '$2y$10$OwOtlHPpSib9hKb6MdBM9O240.fqunDVHVO5PeJTBZWYLBH5s3AnK', 'Show', NULL, NULL, NULL, NULL, '2024-05-05 06:37:28', '2024-05-05 06:37:28', NULL, NULL),
(82, 'asd', 'asdas', NULL, 'asdsfd', 'sdffssd@gmail.com', NULL, NULL, '233', NULL, NULL, 'default.png', 17, 'student', NULL, '9', NULL, NULL, '$2y$10$6Bxwf4v.vzbRg1ci/ykKXeqCyOw29gh/IKhDFO9ei354lByfCrB2K', 'hidden', NULL, NULL, NULL, NULL, '2024-05-05 10:33:52', '2024-05-05 10:33:52', NULL, NULL),
(83, NULL, NULL, NULL, 'asd', 'dfsff@gmail.com', NULL, NULL, '01099475854', NULL, NULL, 'default.png', NULL, 'student', NULL, NULL, NULL, NULL, '$2y$10$nBIxbC0nRSBXKIRj9MXy2uqPXysarL.xzAsY5X0W5Dc52dl8xUN3m', 'Show', NULL, NULL, NULL, NULL, '2024-05-05 11:21:15', '2024-05-05 11:21:15', NULL, NULL),
(84, 'karim', 'as', NULL, 'dtge', 'ertgttg@gmail.com', NULL, NULL, '4234345', NULL, NULL, 'default.png', 10, 'student', NULL, '10', NULL, NULL, '$2y$10$Ziob5wIzehAK6fid0k6YmeIxv1dbLKL.cqEOnicww4Q4Hd6cqxQJW', 'hidden', NULL, NULL, NULL, NULL, '2024-05-05 11:24:54', '2024-05-05 11:24:54', NULL, NULL),
(85, 'adel', 'saad', NULL, 'adel', 'adel@gmail.com', NULL, NULL, '14214356', NULL, NULL, 'default.png', NULL, 'student', NULL, NULL, NULL, NULL, '$2y$10$1Xz0N.Bd/v5G5t9mSmIZfu01LUkq9IJDaMJH3NQw34jp56Wglsoci', 'Show', NULL, NULL, NULL, NULL, '2024-05-08 04:35:31', '2024-05-08 04:35:31', NULL, NULL),
(86, 'new', 'user', NULL, 'new user', 'ahmedahmadahm@gmail.com', NULL, NULL, '12423453', NULL, NULL, 'default.png', 536, 'student', NULL, '11', NULL, NULL, '$2y$10$u3ER48Yvx1wsZTfSpeYzgOb8Xq0cNjlSOPdcxFY4zSgoLJ9H/dzT.', 'hidden', NULL, NULL, NULL, NULL, '2024-05-08 08:47:56', '2024-05-08 08:47:56', NULL, NULL),
(87, 'dfsd', 'dfs', NULL, 'fds', 'ahmedahmadahmid@gmail.com', NULL, NULL, '4523', NULL, NULL, 'default.png', 8, 'student', NULL, '11', NULL, NULL, '$2y$10$M5XcoAQpwBkzQvIeHc9nTeqniY/MpN/28YbVHAc5Oo9Ni3vaQabHW', 'hidden', NULL, NULL, NULL, NULL, '2024-05-08 08:53:19', '2024-05-08 08:53:19', NULL, NULL),
(88, 'ahmed', 'ahmed', NULL, 'ahmedahmed', 'ahmedahmadahmid3@gmail.com', NULL, NULL, '123456789', NULL, NULL, 'default.png', 8, 'student', NULL, '10', NULL, NULL, '$2y$10$6xMpkdwL6ld.Qj1yvEajS.Iq2wjCDFfIB6B800noRChEXXnb79dve', 'hidden', NULL, NULL, NULL, NULL, '2024-05-08 10:46:15', '2024-05-11 05:49:03', NULL, NULL),
(90, NULL, NULL, NULL, 'amr', 'amr@gmail.com', NULL, NULL, '01099475854', NULL, NULL, 'default.png', NULL, 'user_admin', 7, NULL, NULL, NULL, '$2y$10$GN68O0v770qa6tlu7/wRwOKqGn3186gZu9ZYpqnCxAk275b6Otcmm', 'Show', NULL, NULL, NULL, NULL, '2024-05-11 10:01:42', '2024-05-19 05:47:57', NULL, NULL),
(92, 'sdf', 'd', NULL, 'sdfw', 'ahmedahmadahmid73@gmail.com', NULL, NULL, '453432', NULL, NULL, 'default.png', 16, 'student', NULL, '10', NULL, NULL, '$2y$10$rjgaMh5Z0W1qeRIiqv/QEekH.k7VENL2WJzyLxTNqBizCHOP5POey', 'hidden', NULL, NULL, NULL, NULL, '2024-05-17 10:39:30', '2024-05-17 10:39:30', NULL, NULL),
(93, NULL, NULL, NULL, 'as', 'asd@gmail.com', NULL, NULL, '12568908', NULL, NULL, 'default.png', NULL, 'user_admin', 6, NULL, NULL, NULL, '$2y$10$jWySOpdWe8wRLuHKjSmMKuTEBGueJrWf5f2Ail75nXg9VHaThtmnu', 'Show', NULL, NULL, NULL, NULL, '2024-05-19 05:48:20', '2024-05-19 05:48:20', NULL, NULL),
(94, 'sda', 'sad', NULL, 'sadASAAd', 'sdsddsf@gmail.com', NULL, NULL, '12568908', NULL, NULL, 'default.png', NULL, 'student', NULL, NULL, NULL, NULL, '$2y$10$.Fq1hWyJ66p1LZK5USIFC.uvv7yZ0ORbldsGBlZ68NE200dIhml.W', 'Show', NULL, NULL, NULL, NULL, '2024-05-19 09:41:25', '2024-05-19 09:41:25', NULL, NULL),
(95, NULL, NULL, NULL, 'ssss', 'ssss@gmail.com', NULL, NULL, '45345', NULL, NULL, 'default.png', NULL, 'teacher', NULL, NULL, NULL, NULL, '$2y$10$2dqCe0SKsW4mrvtegrYmROS10gwot4hwGgILSh5MIFg4r61WYLfB6', 'Show', NULL, NULL, NULL, NULL, '2024-05-23 12:43:37', '2024-05-23 12:43:54', NULL, NULL),
(96, NULL, NULL, NULL, 'asddsa', 'asddsa@gmail.com', NULL, NULL, '2131234', NULL, NULL, 'default.png', NULL, 'student', NULL, NULL, NULL, NULL, '$2y$10$aXoJiB.kenYjLClrnrA9a.71mfX1vozOFKk1UU9rKp3o1lq7JQ3qC', 'Show', NULL, NULL, NULL, NULL, '2024-05-29 11:31:43', '2024-05-29 11:31:43', NULL, NULL),
(97, 'Asad', 'Sayed', NULL, 'sdasad', 'fsdfgs@gmail.com', NULL, NULL, '12431233', NULL, NULL, 'default.png', NULL, 'student', NULL, NULL, NULL, NULL, '$2y$10$KKnl9tB3fm3/rsPYETz5qOdI7q8.0JLMu3YmtKaQQ0nGhw4Uug6Ei', 'Show', NULL, NULL, NULL, NULL, '2024-05-29 11:35:48', '2024-05-29 11:35:48', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_admins`
--

CREATE TABLE `user_admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_admin` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_admins`
--

INSERT INTO `user_admins` (`id`, `user_admin`, `created_at`, `updated_at`) VALUES
(2, 'Affilate', NULL, NULL),
(4, 'Programmer', '2024-04-18 12:51:05', '2024-04-18 12:51:05'),
(5, 'Sasles', '2024-04-18 17:10:59', '2024-04-18 17:10:59'),
(6, 'Super Affilate', '2024-04-20 09:28:21', '2024-04-20 09:28:21'),
(7, 'Programmer', '2024-04-20 09:33:30', '2024-04-20 09:33:30'),
(8, 'Super Sales', '2024-04-20 13:38:29', '2024-04-20 13:38:29'),
(9, 'Developer', '2024-05-14 12:22:08', '2024-05-14 12:22:08'),
(10, 'Back end', '2024-05-20 08:50:25', '2024-05-20 08:50:25');

-- --------------------------------------------------------

--
-- Table structure for table `user_packages`
--

CREATE TABLE `user_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_packages`
--

INSERT INTO `user_packages` (`id`, `user_id`, `package_id`, `created_at`, `updated_at`) VALUES
(1, 8, 3, '2024-01-16', '2024-02-02');

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

CREATE TABLE `user_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `rejected_reason` varchar(255) DEFAULT NULL,
  `wallet` int(11) NOT NULL,
  `date` date NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `state` enum('Pendding','Approve','Rejected') NOT NULL DEFAULT 'Pendding',
  `payment_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `student_id`, `rejected_reason`, `wallet`, `date`, `image`, `state`, `payment_request_id`, `payment_method_id`, `created_at`, `updated_at`) VALUES
(1, 8, NULL, 10000, '2024-01-28', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', NULL, 4, '2024-01-28', '2024-01-28'),
(2, 8, NULL, 4, '2024-01-28', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', NULL, NULL, '2024-01-28', '2024-01-28'),
(3, 8, NULL, 7, '2024-01-28', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, NULL, '2024-01-28', '2024-01-28'),
(4, 8, NULL, 4, '2024-01-28', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, NULL, '2024-01-28', '2024-01-28'),
(5, 8, NULL, 2, '2024-01-28', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, NULL, '2024-01-28', '2024-01-28'),
(6, 59, NULL, 2, '2024-01-28', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, NULL, '2024-01-28', '2024-01-28'),
(7, 8, NULL, 11, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, NULL, '2024-03-07', '2024-03-07'),
(8, 8, NULL, 11, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, NULL, '2024-03-07', '2024-03-07'),
(9, 8, NULL, 5, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, NULL, '2024-03-07', '2024-03-07'),
(10, 8, NULL, -57, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, NULL, '2024-03-07', '2024-03-07'),
(11, 8, NULL, -57, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, NULL, '2024-03-07', '2024-03-07'),
(12, 8, NULL, -57, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, NULL, '2024-03-07', '2024-03-07'),
(13, 8, NULL, -57, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, NULL, '2024-03-07', '2024-03-07'),
(14, 8, NULL, -57, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, NULL, '2024-03-07', '2024-03-07'),
(15, 8, NULL, -57, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, NULL, '2024-03-07', '2024-03-07'),
(16, 8, NULL, -57, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, NULL, '2024-03-07', '2024-03-07'),
(17, 8, NULL, -57, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, NULL, '2024-03-07', '2024-03-07'),
(18, 8, NULL, -57, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, NULL, '2024-03-07', '2024-03-07'),
(19, 8, NULL, -57, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, NULL, '2024-03-07', '2024-03-07'),
(20, 8, NULL, 1400, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', NULL, NULL, '2024-03-07', '2024-03-07'),
(23, 8, NULL, 400, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', 74, NULL, '2024-03-07', '2024-03-07'),
(24, 8, NULL, 400, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 75, NULL, '2024-03-07', '2024-03-07'),
(25, 8, NULL, 1400, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 76, NULL, '2024-03-07', '2024-03-07'),
(26, 8, NULL, 400, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 77, NULL, '2024-03-07', '2024-03-07'),
(27, 8, NULL, 400, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 78, NULL, '2024-03-07', '2024-03-07'),
(28, 8, NULL, -400, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 79, NULL, '2024-03-07', '2024-03-07'),
(29, 8, NULL, -400, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 80, NULL, '2024-03-07', '2024-03-07'),
(30, 8, NULL, -400, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 81, NULL, '2024-03-07', '2024-03-07'),
(31, 8, NULL, 400, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 82, NULL, '2024-03-07', '2024-03-07'),
(32, 8, NULL, 400, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 83, NULL, '2024-03-07', '2024-03-07'),
(33, 8, NULL, 400, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 84, NULL, '2024-03-07', '2024-03-07'),
(34, 8, NULL, -68, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 85, NULL, '2024-03-07', '2024-03-07'),
(35, 8, NULL, -68, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 86, NULL, '2024-03-07', '2024-03-07'),
(36, 8, NULL, -68, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 87, NULL, '2024-03-07', '2024-03-07'),
(37, 8, NULL, -68, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 88, NULL, '2024-03-07', '2024-03-07'),
(38, 8, NULL, -60, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 90, NULL, '2024-03-07', '2024-03-07'),
(39, 8, NULL, -60, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 92, NULL, '2024-03-07', '2024-03-07'),
(40, 8, NULL, -111, '2024-03-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 93, NULL, '2024-03-07', '2024-03-07'),
(41, 8, NULL, 18, '2024-03-13', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, NULL, '2024-03-13', '2024-03-13'),
(42, 8, NULL, -111, '2024-03-14', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 94, NULL, '2024-03-14', '2024-03-14'),
(43, 8, NULL, -111, '2024-03-14', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 95, NULL, '2024-03-14', '2024-03-14'),
(44, 8, NULL, -111, '2024-03-14', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 96, NULL, '2024-03-14', '2024-03-14'),
(45, 8, NULL, -111, '2024-03-15', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 97, NULL, '2024-03-15', '2024-03-15'),
(46, 8, NULL, -60, '2024-03-15', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 98, NULL, '2024-03-15', '2024-03-15'),
(47, 8, NULL, 3, '2024-03-16', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, 7, '2024-03-16', '2024-03-16'),
(48, 8, NULL, 1, '2024-03-16', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, 7, '2024-03-16', '2024-03-16'),
(49, 8, NULL, -111, '2024-03-16', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 99, NULL, '2024-03-16', '2024-03-16'),
(50, 8, NULL, -111, '2024-03-23', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 100, NULL, '2024-03-23', '2024-03-23'),
(51, 8, NULL, -111, '2024-03-26', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 101, NULL, '2024-03-26', '2024-03-26'),
(52, 8, NULL, -111, '2024-03-26', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 102, NULL, '2024-03-26', '2024-03-26'),
(53, 8, NULL, -111, '2024-03-26', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 103, NULL, '2024-03-26', '2024-03-26'),
(54, 8, NULL, -111, '2024-03-26', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 104, NULL, '2024-03-26', '2024-03-26'),
(55, 8, NULL, -111, '2024-03-26', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 105, NULL, '2024-03-26', '2024-03-26'),
(56, 8, NULL, -111, '2024-03-26', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 106, NULL, '2024-03-26', '2024-03-26'),
(57, 8, NULL, -60, '2024-03-27', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 107, NULL, '2024-03-27', '2024-03-27'),
(58, 8, NULL, -570, '2024-03-27', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 108, NULL, '2024-03-27', '2024-03-27'),
(59, 8, NULL, 500, '2024-03-30', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', NULL, NULL, '2024-03-30', '2024-03-30'),
(60, 8, NULL, -111, '2024-04-01', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 109, NULL, '2024-04-01', '2024-04-01'),
(61, 8, NULL, -60, '2024-04-01', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 110, NULL, '2024-04-01', '2024-04-01'),
(62, 8, NULL, 12, '2024-04-02', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', NULL, NULL, '2024-04-02', '2024-04-02'),
(63, 8, NULL, -111, '2024-04-08', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 111, NULL, '2024-04-08', '2024-04-08'),
(64, 8, NULL, -111, '2024-04-08', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 112, NULL, '2024-04-08', '2024-04-08'),
(65, 8, NULL, -111, '2024-04-08', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 113, NULL, '2024-04-08', '2024-04-08'),
(66, 8, NULL, -111, '2024-04-08', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 114, NULL, '2024-04-08', '2024-04-08'),
(67, 8, NULL, -111, '2024-04-08', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 115, NULL, '2024-04-08', '2024-04-08'),
(68, 8, NULL, -111, '2024-04-08', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 117, NULL, '2024-04-08', '2024-04-08'),
(69, 8, NULL, -111, '2024-04-08', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 118, NULL, '2024-04-08', '2024-04-08'),
(70, 8, NULL, -570, '2024-04-08', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 119, NULL, '2024-04-08', '2024-04-08'),
(71, 8, NULL, -18, '2024-04-08', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 120, NULL, '2024-04-08', '2024-04-08'),
(72, 8, NULL, -60, '2024-04-17', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 121, NULL, '2024-04-17', '2024-04-17'),
(73, 8, NULL, -38, '2024-04-17', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 122, NULL, '2024-04-17', '2024-04-17'),
(74, 8, NULL, -111, '2024-04-20', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 123, NULL, '2024-04-20', '2024-04-20'),
(75, 8, NULL, -60, '2024-04-21', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 124, NULL, '2024-04-21', '2024-04-21'),
(76, 8, NULL, -111, '2024-04-21', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 125, NULL, '2024-04-21', '2024-04-21'),
(77, 8, NULL, -111, '2024-04-22', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 126, NULL, '2024-04-22', '2024-04-22'),
(78, 8, NULL, -111, '2024-04-26', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 129, NULL, '2024-04-26', '2024-04-26'),
(79, 8, NULL, -111, '2024-04-26', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 131, NULL, '2024-04-26', '2024-04-26'),
(80, 8, NULL, -475, '2024-04-27', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 133, NULL, '2024-04-27', '2024-04-27'),
(81, 8, NULL, -60, '2024-05-01', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 134, NULL, '2024-05-01', '2024-05-01'),
(82, 8, NULL, -46, '2024-05-07', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 136, NULL, '2024-05-07', '2024-05-07'),
(83, 8, NULL, -15, '2024-05-08', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 137, NULL, '2024-05-08', '2024-05-08'),
(84, 8, NULL, 555, '2024-05-08', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, 8, '2024-05-08', '2024-05-08'),
(85, 8, NULL, 3, '2024-05-08', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Pendding', NULL, 2, '2024-05-08', '2024-05-08'),
(86, 8, NULL, -18, '2024-05-08', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 139, NULL, '2024-05-08', '2024-05-08'),
(87, 8, NULL, -18, '2024-05-08', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Approve', 140, NULL, '2024-05-08', '2024-05-08'),
(88, 8, 'asd', 123, '2024-05-09', '4242024X03X07X09X29X372024X02X19X07X47X0129202301101725mvf_dark_logo.png', 'Rejected', NULL, 8, '2024-05-09', '2024-05-09'),
(89, 8, NULL, 1112, '2024-05-09', '5442024X05X09X09X15X445592024X04X24X09X33X318032024X03X27X12X18X322024X02X19X07X46X506890202301101725mvf_dark_logo.png', 'Pendding', NULL, 2, '2024-05-09', '2024-05-09'),
(90, 8, NULL, 4321, '2024-05-09', '242024X05X09X09X17X09happy.png', 'Approve', NULL, 2, '2024-05-09', '2024-05-09'),
(91, 8, NULL, -15, '2024-05-09', NULL, 'Approve', 144, NULL, '2024-05-09', '2024-05-09'),
(92, 8, NULL, 222, '2024-05-10', '792024X05X10X12X15X555592024X04X24X09X33X318032024X03X27X12X18X322024X02X19X07X46X506890202301101725mvf_dark_logo.png', 'Pendding', NULL, 8, '2024-05-10', '2024-05-10'),
(93, 8, NULL, 55, '2024-05-12', '6892024X05X12X11X20X482.png', 'Pendding', NULL, 2, '2024-05-12', '2024-05-12'),
(94, 8, NULL, 3, '2024-05-13', '02024X05X13X08X39X257.png', 'Approve', NULL, 8, '2024-05-13', '2024-05-19'),
(95, 8, NULL, -475, '2024-05-13', NULL, 'Approve', 145, NULL, '2024-05-13', '2024-05-13'),
(96, 8, NULL, -475, '2024-05-13', NULL, 'Approve', 146, NULL, '2024-05-13', '2024-05-13'),
(97, 8, NULL, -475, '2024-05-13', NULL, 'Approve', 147, NULL, '2024-05-13', '2024-05-13'),
(98, 8, NULL, -475, '2024-05-13', NULL, 'Approve', 148, NULL, '2024-05-13', '2024-05-13'),
(99, 8, NULL, -475, '2024-05-13', NULL, 'Approve', 149, NULL, '2024-05-13', '2024-05-13'),
(100, 8, NULL, -475, '2024-05-13', NULL, 'Approve', 150, NULL, '2024-05-13', '2024-05-13'),
(101, 8, NULL, -475, '2024-05-13', NULL, 'Approve', 151, NULL, '2024-05-13', '2024-05-13'),
(102, 8, NULL, -15, '2024-05-13', NULL, 'Approve', 152, NULL, '2024-05-13', '2024-05-13'),
(103, 8, NULL, -15, '2024-05-13', NULL, 'Approve', 153, NULL, '2024-05-13', '2024-05-13'),
(104, 8, NULL, -111, '2024-05-13', NULL, 'Approve', 154, NULL, '2024-05-13', '2024-05-13'),
(105, 8, NULL, -50, '2024-05-13', NULL, 'Approve', 155, NULL, '2024-05-13', '2024-05-13'),
(106, 8, NULL, -50, '2024-05-13', NULL, 'Approve', 156, NULL, '2024-05-13', '2024-05-13'),
(107, 8, NULL, -50, '2024-05-13', NULL, 'Approve', 157, NULL, '2024-05-13', '2024-05-13'),
(108, 8, NULL, -50, '2024-05-13', NULL, 'Approve', 158, NULL, '2024-05-13', '2024-05-13'),
(109, 8, NULL, -50, '2024-05-13', NULL, 'Approve', 159, NULL, '2024-05-13', '2024-05-13'),
(110, 8, NULL, -50, '2024-05-13', NULL, 'Approve', 160, NULL, '2024-05-13', '2024-05-13'),
(111, 8, NULL, -49, '2024-05-13', NULL, 'Approve', 161, NULL, '2024-05-13', '2024-05-13'),
(112, 8, NULL, -475, '2024-05-17', NULL, 'Approve', 165, NULL, '2024-05-17', '2024-05-17'),
(113, 8, NULL, -111, '2024-05-17', NULL, 'Approve', 168, NULL, '2024-05-17', '2024-05-17'),
(114, 8, NULL, -60, '2024-05-17', NULL, 'Approve', 169, NULL, '2024-05-17', '2024-05-17'),
(115, 8, NULL, -60, '2024-05-17', NULL, 'Approve', 175, NULL, '2024-05-17', '2024-05-17'),
(116, 8, NULL, -600, '2024-05-17', NULL, 'Approve', 177, NULL, '2024-05-17', '2024-05-17'),
(117, 8, NULL, -41, '2024-05-17', NULL, 'Approve', 179, NULL, '2024-05-17', '2024-05-17'),
(118, 8, NULL, -41, '2024-05-17', NULL, 'Approve', 180, NULL, '2024-05-17', '2024-05-17'),
(119, 8, NULL, -41, '2024-05-17', NULL, 'Approve', 181, NULL, '2024-05-17', '2024-05-17'),
(120, 8, NULL, -41, '2024-05-17', NULL, 'Approve', 183, NULL, '2024-05-17', '2024-05-17'),
(121, 8, NULL, -41, '2024-05-17', NULL, 'Approve', 184, NULL, '2024-05-17', '2024-05-17'),
(122, 8, NULL, -200, '2024-05-19', NULL, 'Approve', 185, NULL, '2024-05-19', '2024-05-19'),
(123, 8, NULL, -2000, '2024-05-19', NULL, 'Approve', 186, NULL, '2024-05-19', '2024-05-19'),
(124, 8, NULL, -200, '2024-05-19', NULL, 'Approve', 187, NULL, '2024-05-19', '2024-05-19'),
(125, 8, NULL, -200, '2024-05-19', NULL, 'Approve', 188, NULL, '2024-05-19', '2024-05-19'),
(126, 8, NULL, -200, '2024-05-19', NULL, 'Approve', 189, NULL, '2024-05-19', '2024-05-19'),
(127, 8, NULL, -200, '2024-05-19', NULL, 'Approve', 190, NULL, '2024-05-19', '2024-05-19'),
(128, 8, NULL, -200, '2024-05-19', NULL, 'Approve', 191, NULL, '2024-05-19', '2024-05-19'),
(129, 8, NULL, -200, '2024-05-19', NULL, 'Approve', 192, NULL, '2024-05-19', '2024-05-19'),
(130, 8, NULL, -200, '2024-05-19', NULL, 'Approve', 193, NULL, '2024-05-19', '2024-05-19'),
(131, 8, NULL, -200, '2024-05-19', NULL, 'Approve', 194, NULL, '2024-05-19', '2024-05-19'),
(132, 8, NULL, -200, '2024-05-19', NULL, 'Approve', 195, NULL, '2024-05-19', '2024-05-19'),
(133, 8, NULL, -475, '2024-05-22', NULL, 'Approve', 196, NULL, '2024-05-22', '2024-05-22'),
(134, 8, NULL, -60, '2024-05-22', NULL, 'Approve', 197, NULL, '2024-05-22', '2024-05-22'),
(135, 8, NULL, -60, '2024-05-22', NULL, 'Approve', 198, NULL, '2024-05-22', '2024-05-22'),
(136, 8, NULL, -32, '2024-05-25', NULL, 'Approve', 199, NULL, '2024-05-25', '2024-05-25'),
(137, 8, NULL, -50, '2024-05-25', NULL, 'Approve', 200, NULL, '2024-05-25', '2024-05-25'),
(138, 8, NULL, 111, '2024-05-25', '722024X05X25X12X17X318.png', 'Approve', NULL, 2, '2024-05-25', '2024-05-25'),
(139, 8, NULL, -300, '2024-05-27', NULL, 'Approve', 201, NULL, '2024-05-27', '2024-05-27'),
(140, 8, NULL, -6, '2024-05-28', NULL, 'Approve', 202, NULL, '2024-05-28', '2024-05-28'),
(141, 8, NULL, -111, '2024-05-30', NULL, 'Approve', 203, NULL, '2024-05-30', '2024-05-30'),
(142, 8, NULL, -60, '2024-06-04', NULL, 'Approve', 204, NULL, '2024-06-04', '2024-06-04'),
(143, 8, NULL, -111, '2024-06-05', NULL, 'Approve', 205, NULL, '2024-06-05', '2024-06-05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_carts`
--
ALTER TABLE `academic_carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_roles_user_id_foreign` (`user_admin_id`);

--
-- Indexes for table `affilate`
--
ALTER TABLE `affilate`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `affilate_requests`
--
ALTER TABLE `affilate_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affilate_services`
--
ALTER TABLE `affilate_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Service_Affilate` (`affilate_id`);

--
-- Indexes for table `cancel_session`
--
ALTER TABLE `cancel_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Cancel_Session` (`session_id`),
  ADD KEY `FK_Cancel_Student` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Categories_Teacher` (`teacher_id`);

--
-- Indexes for table `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chapters_course_id_foreign` (`course_id`),
  ADD KEY `FK_Chapters_Teacher` (`teacher_id`);

--
-- Indexes for table `chapter_prices`
--
ALTER TABLE `chapter_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Price_Chapter` (`chapter_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Commision_User` (`user_id`);

--
-- Indexes for table `confirm_sign`
--
ALTER TABLE `confirm_sign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_category_id_foreign` (`category_id`),
  ADD KEY `FK_Course_Teacher` (`teacher_id`);

--
-- Indexes for table `course_prices`
--
ALTER TABLE `course_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Price_Course` (`course_id`);

--
-- Indexes for table `dai_exam_mistakes`
--
ALTER TABLE `dai_exam_mistakes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Mistakes_Question` (`question_id`),
  ADD KEY `FK_Mistakes_Exam` (`student_exam_id`);

--
-- Indexes for table `diagnostic_exams`
--
ALTER TABLE `diagnostic_exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Dia_Course` (`course_id`),
  ADD KEY `FK_Dia_Score` (`score_id`);

--
-- Indexes for table `diagnostic_exams_history`
--
ALTER TABLE `diagnostic_exams_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_DiaHistory_User` (`user_id`),
  ADD KEY `FK_DiaHistory_Dia` (`diagnostic_exams_id`);

--
-- Indexes for table `dia_questions`
--
ALTER TABLE `dia_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_DiaExam` (`diagnostic_exam_id`),
  ADD KEY `FK_Question` (`question_id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Exam_Course` (`course_id`),
  ADD KEY `FK_Exam_Time` (`code_id`),
  ADD KEY `FK_Exam_Score` (`score_id`);

--
-- Indexes for table `exam_codes`
--
ALTER TABLE `exam_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_history`
--
ALTER TABLE `exam_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_EHistory_Exam` (`exam_id`),
  ADD KEY `FK_EHistory_Student` (`user_id`);

--
-- Indexes for table `exam_mistakes`
--
ALTER TABLE `exam_mistakes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_EMistakes_Exam` (`student_exam_id`),
  ADD KEY `FK_EMistakes_Question` (`question_id`),
  ADD KEY `FK_EMistakes_User` (`user_id`);

--
-- Indexes for table `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Exam_Exam` (`exam_id`),
  ADD KEY `FK_Exam_Question` (`question_id`);

--
-- Indexes for table `exam_time`
--
ALTER TABLE `exam_time`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ExamTime_User` (`user_id`),
  ADD KEY `FK_ExamTime_Exam` (`exam_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `forget_passwords`
--
ALTER TABLE `forget_passwords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grid_ans`
--
ALTER TABLE `grid_ans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Grid_Question` (`q_id`);

--
-- Indexes for table `group_days`
--
ALTER TABLE `group_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_GDays_Group` (`group_id`);

--
-- Indexes for table `group_students`
--
ALTER TABLE `group_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_GStu_Group` (`group_id`),
  ADD KEY `FK_GStu_Student` (`stu_id`);

--
-- Indexes for table `idea_lessons`
--
ALTER TABLE `idea_lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Idea_Lesson` (`lesson_id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Lesson_Chapter` (`chapter_id`),
  ADD KEY `FK_Lesson_Teacher` (`teacher_id`);

--
-- Indexes for table `live_courses`
--
ALTER TABLE `live_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Live_Users` (`user_id`),
  ADD KEY `FK_Live_Course` (`course_id`);

--
-- Indexes for table `live_lessons`
--
ALTER TABLE `live_lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_LiveLesson_Users` (`user_id`),
  ADD KEY `FK_LiveLesson_Lesson` (`lesson_id`);

--
-- Indexes for table `marketings`
--
ALTER TABLE `marketings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Maketing_Affilate` (`affilate_id`),
  ADD KEY `FK_Maketing_Chapter` (`chapter_id`),
  ADD KEY `FK_Maketing_Course` (`course_id`),
  ADD KEY `FK_Maketing_Student` (`student_id`);

--
-- Indexes for table `marketing_popups`
--
ALTER TABLE `marketing_popups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mcq_ans`
--
ALTER TABLE `mcq_ans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_MCQ_Q` (`q_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_orders`
--
ALTER TABLE `payment_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Order_Request` (`payment_request_id`),
  ADD KEY `FK_Order_Chapter` (`chapter_id`);

--
-- Indexes for table `payment_package_order`
--
ALTER TABLE `payment_package_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Order_Package` (`package_id`),
  ADD KEY `FK_Order_PRequest` (`payment_request_id`);

--
-- Indexes for table `payment_requests`
--
ALTER TABLE `payment_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Pay_Method` (`payment_method_id`),
  ADD KEY `FK_Pay_User` (`user_id`);

--
-- Indexes for table `payouts`
--
ALTER TABLE `payouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Payout_Affilate` (`affilate_id`),
  ADD KEY `FK_Payment_Method` (`payment_method`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `popup_pages`
--
ALTER TABLE `popup_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `popup_popup_pages`
--
ALTER TABLE `popup_popup_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Popup_Page` (`popup_page_id`),
  ADD KEY `FK_Popup_Popup` (`marketing_popup_id`);

--
-- Indexes for table `private_request`
--
ALTER TABLE `private_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Private_Teacher` (`teacher_id`),
  ADD KEY `FK_Private_User` (`user_id`);

--
-- Indexes for table `promo_chapters`
--
ALTER TABLE `promo_chapters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promo_courses`
--
ALTER TABLE `promo_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Promo` (`promo_id`),
  ADD KEY `FK_Course` (`course_id`);

--
-- Indexes for table `promo_packages`
--
ALTER TABLE `promo_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_PromoPackage_Promo` (`promo_id`),
  ADD KEY `FK_PromoPackage_Package` (`package_id`);

--
-- Indexes for table `promo_users`
--
ALTER TABLE `promo_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Users` (`user_id`),
  ADD KEY `FK_PromoC` (`promo_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Q_Lesson` (`lesson_id`);

--
-- Indexes for table `question_history`
--
ALTER TABLE `question_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_times`
--
ALTER TABLE `question_times`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Quizze_Lesson` (`lesson_id`);

--
-- Indexes for table `quizze_stu_ans`
--
ALTER TABLE `quizze_stu_ans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `q_ans`
--
ALTER TABLE `q_ans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Answer_Question` (`Q_id`);

--
-- Indexes for table `q_quizes`
--
ALTER TABLE `q_quizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_qq_Quizze` (`quizze_id`),
  ADD KEY `FK_qq_Question` (`question_id`);

--
-- Indexes for table `report_questions`
--
ALTER TABLE `report_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ReportQuestion_Student` (`user_id`),
  ADD KEY `FK_ReportQuestion_Question` (`question_id`),
  ADD KEY `FK_ReportQuestion_List` (`list_id`);

--
-- Indexes for table `report_question_lists`
--
ALTER TABLE `report_question_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_videos`
--
ALTER TABLE `report_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ReportVideo_Lists` (`list_id`),
  ADD KEY `FK_ReportVideo_Student` (`user_id`),
  ADD KEY `FK_ReportVideo_Video` (`lesson_video_id`),
  ADD KEY `FK_QReportVideo_Video` (`q_video_id`);

--
-- Indexes for table `report_video_lists`
--
ALTER TABLE `report_video_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `score_list`
--
ALTER TABLE `score_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ScoreList_Score` (`score_id`);

--
-- Indexes for table `score_sheet`
--
ALTER TABLE `score_sheet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Score_Course` (`course_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Session_Lesson` (`lesson_id`),
  ADD KEY `FK_Session_Teacher` (`teacher_id`);

--
-- Indexes for table `session_attendance`
--
ALTER TABLE `session_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Attendance_User` (`user_id`),
  ADD KEY `FK_Attendance_Session` (`session_id`);

--
-- Indexes for table `session_days`
--
ALTER TABLE `session_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `session_groups`
--
ALTER TABLE `session_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_SessionG_Teacher` (`teacher_id`);

--
-- Indexes for table `session_students`
--
ALTER TABLE `session_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Session` (`session_id`),
  ADD KEY `FK_Stu` (`user_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `small_packages`
--
ALTER TABLE `small_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_SmallPackage_User` (`user_id`),
  ADD KEY `FK_SmallPackage_Admin` (`admin_id`);

--
-- Indexes for table `student_quizzes`
--
ALTER TABLE `student_quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Stu_Lesson` (`lesson_id`),
  ADD KEY `FK_Stu_Quizze` (`quizze_id`),
  ADD KEY `FK_Stu_Stu` (`student_id`);

--
-- Indexes for table `student_quizze_mistakes`
--
ALTER TABLE `student_quizze_mistakes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_sessions`
--
ALTER TABLE `student_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_courses`
--
ALTER TABLE `teacher_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_TeacherC_Course` (`course_id`),
  ADD KEY `FK_TeacherC_Teacher` (`user_id`);

--
-- Indexes for table `teacher__courses`
--
ALTER TABLE `teacher__courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tc_category` (`category_id`),
  ADD KEY `FK_tc_course` (`course_id`),
  ADD KEY `FK_tc_user` (`user_id`);

--
-- Indexes for table `usage_promo`
--
ALTER TABLE `usage_promo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Promo_User` (`user_id`),
  ADD KEY `FK_Promo_Promo` (`promo_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `FK_Teacher_Categories` (`category_id`),
  ADD KEY `FK_Teacher_Course` (`course_id`),
  ADD KEY `FK_User_UserAdmin` (`user_admin_id`);

--
-- Indexes for table `user_admins`
--
ALTER TABLE `user_admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_packages`
--
ALTER TABLE `user_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Package_User` (`user_id`),
  ADD KEY `FK_User_Package` (`package_id`);

--
-- Indexes for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Wallet_Student` (`student_id`),
  ADD KEY `FK_Wallet_Method` (`payment_method_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_carts`
--
ALTER TABLE `academic_carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `affilate`
--
ALTER TABLE `affilate`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `affilate_requests`
--
ALTER TABLE `affilate_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `affilate_services`
--
ALTER TABLE `affilate_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `cancel_session`
--
ALTER TABLE `cancel_session`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `chapter_prices`
--
ALTER TABLE `chapter_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=539;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `confirm_sign`
--
ALTER TABLE `confirm_sign`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `course_prices`
--
ALTER TABLE `course_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `dai_exam_mistakes`
--
ALTER TABLE `dai_exam_mistakes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=468;

--
-- AUTO_INCREMENT for table `diagnostic_exams`
--
ALTER TABLE `diagnostic_exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `diagnostic_exams_history`
--
ALTER TABLE `diagnostic_exams_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `dia_questions`
--
ALTER TABLE `dia_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `exam_codes`
--
ALTER TABLE `exam_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exam_history`
--
ALTER TABLE `exam_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `exam_mistakes`
--
ALTER TABLE `exam_mistakes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=275;

--
-- AUTO_INCREMENT for table `exam_questions`
--
ALTER TABLE `exam_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `exam_time`
--
ALTER TABLE `exam_time`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forget_passwords`
--
ALTER TABLE `forget_passwords`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `grid_ans`
--
ALTER TABLE `grid_ans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `group_days`
--
ALTER TABLE `group_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `group_students`
--
ALTER TABLE `group_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `idea_lessons`
--
ALTER TABLE `idea_lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `live_courses`
--
ALTER TABLE `live_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `live_lessons`
--
ALTER TABLE `live_lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `marketings`
--
ALTER TABLE `marketings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `marketing_popups`
--
ALTER TABLE `marketing_popups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mcq_ans`
--
ALTER TABLE `mcq_ans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment_orders`
--
ALTER TABLE `payment_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `payment_package_order`
--
ALTER TABLE `payment_package_order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `payment_requests`
--
ALTER TABLE `payment_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `payouts`
--
ALTER TABLE `payouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=795;

--
-- AUTO_INCREMENT for table `popup_pages`
--
ALTER TABLE `popup_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `popup_popup_pages`
--
ALTER TABLE `popup_popup_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `private_request`
--
ALTER TABLE `private_request`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `promo_chapters`
--
ALTER TABLE `promo_chapters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `promo_courses`
--
ALTER TABLE `promo_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `promo_packages`
--
ALTER TABLE `promo_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `promo_users`
--
ALTER TABLE `promo_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `question_history`
--
ALTER TABLE `question_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `question_times`
--
ALTER TABLE `question_times`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `quizze_stu_ans`
--
ALTER TABLE `quizze_stu_ans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `q_ans`
--
ALTER TABLE `q_ans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `q_quizes`
--
ALTER TABLE `q_quizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `report_questions`
--
ALTER TABLE `report_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `report_question_lists`
--
ALTER TABLE `report_question_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `report_videos`
--
ALTER TABLE `report_videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `report_video_lists`
--
ALTER TABLE `report_video_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `score_list`
--
ALTER TABLE `score_list`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `score_sheet`
--
ALTER TABLE `score_sheet`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `session_attendance`
--
ALTER TABLE `session_attendance`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `session_days`
--
ALTER TABLE `session_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `session_groups`
--
ALTER TABLE `session_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `session_students`
--
ALTER TABLE `session_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `small_packages`
--
ALTER TABLE `small_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `student_quizzes`
--
ALTER TABLE `student_quizzes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `student_quizze_mistakes`
--
ALTER TABLE `student_quizze_mistakes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `student_sessions`
--
ALTER TABLE `student_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `teacher_courses`
--
ALTER TABLE `teacher_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `teacher__courses`
--
ALTER TABLE `teacher__courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usage_promo`
--
ALTER TABLE `usage_promo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `user_admins`
--
ALTER TABLE `user_admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_packages`
--
ALTER TABLE `user_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD CONSTRAINT `FK_AdminRoles_UserAdmin` FOREIGN KEY (`user_admin_id`) REFERENCES `user_admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `affilate`
--
ALTER TABLE `affilate`
  ADD CONSTRAINT `FK_Affilate_User` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `affilate_services`
--
ALTER TABLE `affilate_services`
  ADD CONSTRAINT `FK_Service_Affilate` FOREIGN KEY (`affilate_id`) REFERENCES `affilate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cancel_session`
--
ALTER TABLE `cancel_session`
  ADD CONSTRAINT `FK_Cancel_Session` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Cancel_Student` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `FK_Categories_Teacher` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chapters`
--
ALTER TABLE `chapters`
  ADD CONSTRAINT `FK_Chapters_Teacher` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chapters_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chapter_prices`
--
ALTER TABLE `chapter_prices`
  ADD CONSTRAINT `FK_Price_Chapter` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `commissions`
--
ALTER TABLE `commissions`
  ADD CONSTRAINT `FK_Commision_User` FOREIGN KEY (`user_id`) REFERENCES `affilate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `FK_Course_Teacher` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course_prices`
--
ALTER TABLE `course_prices`
  ADD CONSTRAINT `FK_Price_Course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dai_exam_mistakes`
--
ALTER TABLE `dai_exam_mistakes`
  ADD CONSTRAINT `FK_Mistakes_History` FOREIGN KEY (`student_exam_id`) REFERENCES `diagnostic_exams_history` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Mistakes_Question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diagnostic_exams`
--
ALTER TABLE `diagnostic_exams`
  ADD CONSTRAINT `FK_Dia_Course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Dia_Score` FOREIGN KEY (`score_id`) REFERENCES `score_sheet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diagnostic_exams_history`
--
ALTER TABLE `diagnostic_exams_history`
  ADD CONSTRAINT `FK_DiaHistory_Dia` FOREIGN KEY (`diagnostic_exams_id`) REFERENCES `diagnostic_exams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DiaHistory_User` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dia_questions`
--
ALTER TABLE `dia_questions`
  ADD CONSTRAINT `FK_DiaExam` FOREIGN KEY (`diagnostic_exam_id`) REFERENCES `diagnostic_exams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `FK_Exam_Course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Exam_Score` FOREIGN KEY (`score_id`) REFERENCES `score_sheet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Exam_Time` FOREIGN KEY (`code_id`) REFERENCES `exam_codes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exam_history`
--
ALTER TABLE `exam_history`
  ADD CONSTRAINT `FK_EHistory_Exam` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EHistory_Student` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exam_mistakes`
--
ALTER TABLE `exam_mistakes`
  ADD CONSTRAINT `FK_EMistakes_History` FOREIGN KEY (`student_exam_id`) REFERENCES `exam_history` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EMistakes_Question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EMistakes_User` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD CONSTRAINT `FK_Exam_Exam` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Exam_Question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exam_time`
--
ALTER TABLE `exam_time`
  ADD CONSTRAINT `FK_ExamTime_Exam` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ExamTime_User` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `grid_ans`
--
ALTER TABLE `grid_ans`
  ADD CONSTRAINT `FK_Grid_Question` FOREIGN KEY (`q_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_days`
--
ALTER TABLE `group_days`
  ADD CONSTRAINT `FK_GDays_Group` FOREIGN KEY (`group_id`) REFERENCES `session_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_students`
--
ALTER TABLE `group_students`
  ADD CONSTRAINT `FK_GStu_Group` FOREIGN KEY (`group_id`) REFERENCES `session_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_GStu_Student` FOREIGN KEY (`stu_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `idea_lessons`
--
ALTER TABLE `idea_lessons`
  ADD CONSTRAINT `FK_Idea_Lesson` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `FK_Lesson_Chapter` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Lesson_Teacher` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `live_courses`
--
ALTER TABLE `live_courses`
  ADD CONSTRAINT `FK_Live_Course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Live_Users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `live_lessons`
--
ALTER TABLE `live_lessons`
  ADD CONSTRAINT `FK_LiveLesson_Lesson` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_LiveLesson_Users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `marketings`
--
ALTER TABLE `marketings`
  ADD CONSTRAINT `FK_Maketing_Affilate` FOREIGN KEY (`affilate_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Maketing_Chapter` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Maketing_Course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Maketing_Student` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mcq_ans`
--
ALTER TABLE `mcq_ans`
  ADD CONSTRAINT `FK_MCQ_Q` FOREIGN KEY (`q_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_orders`
--
ALTER TABLE `payment_orders`
  ADD CONSTRAINT `FK_Order_Chapter` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Order_Request` FOREIGN KEY (`payment_request_id`) REFERENCES `payment_requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_package_order`
--
ALTER TABLE `payment_package_order`
  ADD CONSTRAINT `FK_Order_PRequest` FOREIGN KEY (`payment_request_id`) REFERENCES `payment_requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Order_Package` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_requests`
--
ALTER TABLE `payment_requests`
  ADD CONSTRAINT `FK_Pay_Method` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Pay_User` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payouts`
--
ALTER TABLE `payouts`
  ADD CONSTRAINT `FK_Payment_Method` FOREIGN KEY (`payment_method`) REFERENCES `payment_method` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Payout_Affilate` FOREIGN KEY (`affilate_id`) REFERENCES `affilate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `popup_popup_pages`
--
ALTER TABLE `popup_popup_pages`
  ADD CONSTRAINT `FK_Popup_Page` FOREIGN KEY (`popup_page_id`) REFERENCES `popup_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Popup_Popup` FOREIGN KEY (`marketing_popup_id`) REFERENCES `marketing_popups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `private_request`
--
ALTER TABLE `private_request`
  ADD CONSTRAINT `FK_Private_Teacher` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Private_User` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `promo_courses`
--
ALTER TABLE `promo_courses`
  ADD CONSTRAINT `FK_Course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Promo` FOREIGN KEY (`promo_id`) REFERENCES `promo_codes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `promo_packages`
--
ALTER TABLE `promo_packages`
  ADD CONSTRAINT `FK_PromoPackage_Package` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PromoPackage_Promo` FOREIGN KEY (`promo_id`) REFERENCES `promo_codes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `promo_users`
--
ALTER TABLE `promo_users`
  ADD CONSTRAINT `FK_PromoC` FOREIGN KEY (`promo_id`) REFERENCES `promo_codes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `FK_Q_Lesson` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `FK_Quizze_Lesson` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `q_ans`
--
ALTER TABLE `q_ans`
  ADD CONSTRAINT `FK_Answer_Question` FOREIGN KEY (`Q_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `q_quizes`
--
ALTER TABLE `q_quizes`
  ADD CONSTRAINT `FK_qq_Question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_qq_Quizze` FOREIGN KEY (`quizze_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_questions`
--
ALTER TABLE `report_questions`
  ADD CONSTRAINT `FK_ReportQuestion_List` FOREIGN KEY (`list_id`) REFERENCES `report_question_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ReportQuestion_Question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ReportQuestion_Student` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_videos`
--
ALTER TABLE `report_videos`
  ADD CONSTRAINT `FK_QReportVideo_Video` FOREIGN KEY (`q_video_id`) REFERENCES `q_ans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ReportVideo_Lists` FOREIGN KEY (`list_id`) REFERENCES `report_video_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ReportVideo_Student` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ReportVideo_Video` FOREIGN KEY (`lesson_video_id`) REFERENCES `idea_lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `score_list`
--
ALTER TABLE `score_list`
  ADD CONSTRAINT `FK_ScoreList_Score` FOREIGN KEY (`score_id`) REFERENCES `score_sheet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `score_sheet`
--
ALTER TABLE `score_sheet`
  ADD CONSTRAINT `FK_Score_Course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `FK_Session_Lesson` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Session_Teacher` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `session_attendance`
--
ALTER TABLE `session_attendance`
  ADD CONSTRAINT `FK_Attendance_Session` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Attendance_User` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `session_groups`
--
ALTER TABLE `session_groups`
  ADD CONSTRAINT `FK_SessionG_Teacher` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `session_students`
--
ALTER TABLE `session_students`
  ADD CONSTRAINT `FK_Session` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Stu` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `small_packages`
--
ALTER TABLE `small_packages`
  ADD CONSTRAINT `FK_SmallPackage_Admin` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SmallPackage_User` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_quizzes`
--
ALTER TABLE `student_quizzes`
  ADD CONSTRAINT `FK_Stu_Lesson` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Stu_Quizze` FOREIGN KEY (`quizze_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Stu_Stu` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacher_courses`
--
ALTER TABLE `teacher_courses`
  ADD CONSTRAINT `FK_TeacherC_Course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TeacherC_Teacher` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacher__courses`
--
ALTER TABLE `teacher__courses`
  ADD CONSTRAINT `FK_tc_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tc_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tc_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usage_promo`
--
ALTER TABLE `usage_promo`
  ADD CONSTRAINT `FK_Promo_Promo` FOREIGN KEY (`promo_id`) REFERENCES `promo_codes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Promo_User` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_Teacher_Categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Teacher_Course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_User_UserAdmin` FOREIGN KEY (`user_admin_id`) REFERENCES `user_admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_packages`
--
ALTER TABLE `user_packages`
  ADD CONSTRAINT `FK_Package_User` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_User_Package` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `FK_Wallet_Method` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Wallet_Student` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
