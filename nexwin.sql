-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 24, 2026 at 08:16 PM
-- Server version: 10.11.6-MariaDB-log
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nexwin`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_details`
--

CREATE TABLE `account_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `branch` varchar(40) DEFAULT NULL,
  `bank_name` varchar(64) DEFAULT NULL,
  `ifsc_code` varchar(25) NOT NULL,
  `upi_id` varchar(64) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `active_game_sessions`
--

CREATE TABLE `active_game_sessions` (
  `id` int(11) NOT NULL,
  `game_uid` varchar(255) DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `game_name` varchar(255) DEFAULT NULL,
  `user_mobile` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `active_game_sessions`
--

INSERT INTO `active_game_sessions` (`id`, `game_uid`, `game_id`, `game_name`, `user_mobile`, `created_at`) VALUES
(1, '49', 49, 'LuckyWheel', '1234567890', '2026-02-24 16:59:07'),
(2, '49', 49, 'LuckyWheel', '1234567890', '2026-02-24 17:07:14'),
(3, '49', 49, 'LuckyWheel', '1234567890', '2026-02-24 17:10:04'),
(7, '110', 110, 'TeenPatti 20-20', '1234567890', '2026-02-24 17:19:14'),
(15, '113', 113, 'Devil Fire', '1234567890', '2026-02-24 17:27:03'),
(16, '142', 142, 'God Of Martial', '1234567890', '2026-02-24 17:27:54');

-- --------------------------------------------------------

--
-- Table structure for table `activity_rewards`
--

CREATE TABLE `activity_rewards` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `range_amount` int(11) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `activity_rewards`
--

INSERT INTO `activity_rewards` (`id`, `name`, `range_amount`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 'daily mission', 500, 5, 1, '2024-04-27 08:18:17', '2024-04-27 08:18:17'),
(2, 'daily mission', 5000, 40, 1, '2024-04-27 08:18:17', '2024-04-27 08:18:17'),
(3, 'daily mission', 50000, 500, 1, '2024-04-27 08:18:44', '2024-04-27 08:18:44'),
(4, 'daily mission', 100000, 1000, 1, '2024-04-27 08:18:44', '2024-04-27 08:18:44'),
(5, 'weekly mission', 50000, 100, 1, '2024-04-27 08:18:44', '2024-04-27 08:18:44');

-- --------------------------------------------------------

--
-- Table structure for table `activity_rewards_claim`
--

CREATE TABLE `activity_rewards_claim` (
  `id` int(11) NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `acyivity_reward_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` int(11) NOT NULL,
  `type` varchar(128) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL COMMENT 'payin id',
  `status` tinyint(4) DEFAULT 0 COMMENT '0 = unread, 1 = read',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_settings`
--

CREATE TABLE `admin_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `longtext` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `admin_settings`
--

INSERT INTO `admin_settings` (`id`, `title`, `longtext`) VALUES
(1, 'url', 'https://root.nexwin.vip/'),
(2, 'Api_url', 'https://root.nexwin.vip/api/'),
(3, 'title', 'Nex Win'),
(4, 'logo', 'Nex Win'),
(5, 'Site_description', ''),
(6, 'Api_db_name', 'winbhai_root'),
(7, 'Api_db_password', 'winbhai_root'),
(8, 'Api_username', 'winbhai_root'),
(9, 'Apk_url', 'https://root.nexwin.vip/'),
(10, 'Betting Commission', '0.00'),
(11, 'Refferrel Text', ''),
(12, 'Payment Key', 'INDIANPAY00INDIANPAY00157'),
(13, 'merchant_token', 'JbmrWhThEjqzmip48rlTX4KZdzZ6IJkP'),
(14, 'orderid', 'ORD'),
(15, 'minimum_withdraw', '100'),
(16, 'maximum_withdraw', '2500'),
(17, 'whatsapp_deposit', 'tel:919876543210'),
(18, 'minimum_deposit', '100'),
(19, 'maximum_deposit', '1000'),
(20, 'crypto_min_deposit', '10'),
(21, 'crypto_mxn_deposit', '1000'),
(22, 'crypto_min_withdraw', '10'),
(23, 'crypto_max_withdraw', '100'),
(24, 'chat_on_whatsapp', 'https://wa.me/+66 84 295 0161'),
(25, 'affilation_withdraw_min', '100'),
(26, 'affilation_withdraw_max', '5000'),
(27, 'sign_up_contact_support', 'https://wa.me/+66 84 295 0161');

-- --------------------------------------------------------

--
-- Table structure for table `admin_winner_results`
--

CREATE TABLE `admin_winner_results` (
  `id` int(11) NOT NULL,
  `gamesno` varchar(100) DEFAULT NULL,
  `gameId` int(11) NOT NULL,
  `number` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_winner_results`
--

INSERT INTO `admin_winner_results` (`id`, `gamesno`, `gameId`, `number`, `status`, `created_at`, `updated_at`) VALUES
(1, '20250822497311', 1, '3', '1', '2026-02-24 11:30:11', '2026-02-24 11:30:11'),
(2, '20250822497312', 1, '3', '1', '2026-02-24 11:30:43', '2026-02-24 11:30:43'),
(3, '20250822497313', 1, '3', '1', '2026-02-24 11:31:13', '2026-02-24 11:31:13');

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `commission` double(11,2) NOT NULL,
  `permissions` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `all_images`
--

CREATE TABLE `all_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `all_images`
--

INSERT INTO `all_images` (`id`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'https://root.winbhai.in/uploads/profileimage/1.png', 0, '2024-04-23 05:45:47', '2024-04-23 05:45:47'),
(2, 'https://root.winbhai.in/uploads/profileimage/2.png', 0, '2024-04-23 05:45:47', '2024-04-23 05:45:47'),
(3, 'https://root.winbhai.in/uploads/profileimage/3.png', 0, '2024-04-23 05:45:47', '2024-04-23 05:45:47'),
(4, 'https://root.winbhai.in/uploads/profileimage/4.png', 0, '2024-04-23 05:45:47', '2024-04-23 05:45:47'),
(5, 'https://root.winbhai.in/uploads/profileimage/5.png', 0, '2024-04-23 05:45:47', '2024-04-23 05:45:47'),
(6, 'https://root.winbhai.in/uploads/profileimage/6.png', 0, '2024-04-23 05:45:47', '2024-04-23 05:45:47'),
(7, 'https://root.winbhai.in/uploads/profileimage/7.png', 0, '2024-04-23 05:45:47', '2024-04-23 05:45:47'),
(8, 'https://root.winbhai.in/uploads/profileimage/8.png', 0, '2024-04-23 05:45:47', '2024-04-23 05:45:47'),
(9, 'https://root.winbhai.in/uploads/profileimage/9.png', 0, '2024-04-23 05:45:47', '2024-04-23 05:45:47'),
(10, 'https://root.winbhai.in/uploads/profileimage/10.png', 0, '2024-04-23 05:45:47', '2024-04-23 05:45:47'),
(11, 'https://root.winbhai.in/uploads/profileimage/11.png', 0, '2024-04-23 05:45:47', '2024-04-23 05:45:47'),
(12, 'https://root.winbhai.in/uploads/profileimage/12.png', 0, '2024-04-23 05:45:47', '2024-04-23 05:45:47'),
(13, 'https://root.winbhai.in/uploads/profileimage/13.png', 0, '2024-04-23 05:45:47', '2024-04-23 05:45:47'),
(14, 'https://root.winbhai.in/uploads/profileimage/14.png', 0, '2024-04-23 05:45:47', '2024-04-23 05:45:47'),
(15, 'https://root.winbhai.in/uploads/profileimage/15.png', 0, '2024-04-23 05:45:47', '2024-04-23 05:45:47'),
(16, 'https://root.winbhai.in/uploads/profileimage/16.png', 0, '2024-04-23 05:45:47', '2024-04-23 05:45:47'),
(17, 'https://root.winbhai.in/uploads/profileimage/17.png', 0, '2024-04-23 05:45:47', '2024-04-23 05:45:47'),
(18, 'https://root.winbhai.in/uploads/profileimage/18.png', 0, '2024-04-23 05:45:47', '2024-04-23 05:45:47'),
(19, 'https://root.winbhai.in/uploads/profileimage/19.png', 0, '2024-04-23 05:45:47', '2024-04-23 05:45:47'),
(20, 'https://root.winbhai.in/uploads/profileimage/20.png', 0, '2024-04-23 05:45:47', '2024-04-23 05:45:47');

-- --------------------------------------------------------

--
-- Table structure for table `amount_lists`
--

CREATE TABLE `amount_lists` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `cash` decimal(10,2) NOT NULL,
  `extra_cash` decimal(10,2) DEFAULT NULL,
  `bonus` varchar(20) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `accumulated_amount` decimal(10,2) NOT NULL,
  `attendance_bonus` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT 'expired = 0, Continue = 1, success=2 ',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `accumulated_amount`, `attendance_bonus`, `status`, `created_at`, `updated_at`) VALUES
(1, 200.00, 6.00, 1, '2025-01-18 00:01:58', '2025-07-15 08:38:04'),
(2, 1000.00, 21.00, 1, '2025-01-18 00:02:12', '2025-01-19 06:23:44'),
(3, 3000.00, 101.00, 1, '2025-01-18 00:02:43', '2025-01-19 06:23:47'),
(4, 8000.00, 201.00, 1, '2025-01-18 00:03:16', '2025-01-19 06:23:50'),
(5, 20000.00, 451.00, 1, '2025-01-18 00:03:59', '2025-01-19 06:23:54'),
(6, 80000.00, 2500.00, 1, '2025-01-18 00:04:27', '2025-01-19 06:23:59'),
(7, 2000000.00, 2000000.00, 1, '2025-01-18 00:05:07', '2025-07-03 11:37:28');

-- --------------------------------------------------------

--
-- Table structure for table `at_claim`
--

CREATE TABLE `at_claim` (
  `id` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL,
  `attendance_id` int(10) UNSIGNED DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aviator_admin_result`
--

CREATE TABLE `aviator_admin_result` (
  `id` int(11) NOT NULL,
  `game_sr_num` varchar(100) DEFAULT NULL,
  `game_id` int(11) NOT NULL DEFAULT 3,
  `number` float DEFAULT NULL,
  `multiplier` double(10,2) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `aviator_admin_result`
--

INSERT INTO `aviator_admin_result` (`id`, `game_sr_num`, `game_id`, `number`, `multiplier`, `status`, `datetime`) VALUES
(1, '0001', 5, 5, 5.00, 1, '2026-02-23 10:10:20'),
(2, '27587', 5, 200, 200.00, 1, '2026-02-24 07:13:01'),
(3, '27588', 5, 200, 200.00, 1, '2026-02-24 07:15:19'),
(4, '27588', 5, 21, 21.00, 1, '2026-02-24 07:16:05'),
(5, '27589', 5, 1.2, 1.20, 1, '2026-02-24 07:21:32');

-- --------------------------------------------------------

--
-- Table structure for table `aviator_bet`
--

CREATE TABLE `aviator_bet` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `stop_multiplier` float NOT NULL DEFAULT 0 COMMENT 'for aviator(auto bet case)',
  `game_id` int(11) NOT NULL DEFAULT 5,
  `totalamount` double NOT NULL DEFAULT 0 COMMENT 'amount-bettingfee = trade amount',
  `number` int(11) DEFAULT 0,
  `sub_number` int(11) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `game_sr_num` varchar(250) DEFAULT NULL,
  `commission` double NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0-pending\r\n1 - win \r\n2- loss',
  `result_status` int(11) NOT NULL DEFAULT 0 COMMENT '0 - waiting for result\r\n1 - result declared',
  `win` double NOT NULL DEFAULT 0,
  `multiplier` double NOT NULL DEFAULT 0 COMMENT 'random cashout multiplier',
  `datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `aviator_bet`
--

INSERT INTO `aviator_bet` (`id`, `uid`, `amount`, `stop_multiplier`, `game_id`, `totalamount`, `number`, `sub_number`, `color`, `game_sr_num`, `commission`, `status`, `result_status`, `win`, `multiplier`, `datetime`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 5, 1, 1, NULL, 'Aviator', '28576', 0, 2, 1, 0, 0, '2026-02-24 16:54:31', '2026-02-24 16:54:31', '2026-02-24 11:24:31');

-- --------------------------------------------------------

--
-- Table structure for table `aviator_result`
--

CREATE TABLE `aviator_result` (
  `id` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `game_sr_num` bigint(20) DEFAULT 0,
  `game_id` int(11) DEFAULT NULL COMMENT 'not use',
  `price` double NOT NULL DEFAULT 0,
  `status` int(11) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `aviator_result`
--

INSERT INTO `aviator_result` (`id`, `number`, `color`, `game_sr_num`, `game_id`, `price`, `status`, `datetime`) VALUES
(1, NULL, 'Aviator', 28718, 5, 2.24, 1, '2026-02-24 17:45:14'),
(2, NULL, 'Aviator', 28719, 5, 1.33, 1, '2026-02-24 17:45:32'),
(3, NULL, 'Aviator', 28720, 5, 1.04, 1, '2026-02-24 17:45:47'),
(4, NULL, 'Aviator', 28721, 5, 2.38, 1, '2026-02-24 17:46:15'),
(5, NULL, 'Aviator', 28722, 5, 1.19, 1, '2026-02-24 17:46:31');

-- --------------------------------------------------------

--
-- Table structure for table `aviator_setting`
--

CREATE TABLE `aviator_setting` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `loss_per` int(11) NOT NULL COMMENT 'if amount is less then given amount then max winning on this amount will be amount + amount*%',
  `win_per` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aviator_setting`
--

INSERT INTO `aviator_setting` (`id`, `amount`, `loss_per`, `win_per`) VALUES
(1, 1000, 20, 70);

-- --------------------------------------------------------

--
-- Table structure for table `betlogs`
--

CREATE TABLE `betlogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `games_no` bigint(20) NOT NULL DEFAULT 0,
  `game_id` int(11) NOT NULL DEFAULT 0,
  `number` int(11) NOT NULL,
  `amount` double DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `betlogs`
--

INSERT INTO `betlogs` (`id`, `games_no`, `game_id`, `number`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 20250822497403, 1, 0, 0, 0, '2024-04-25 12:10:49', '2026-02-24 07:10:06'),
(2, 20250822497403, 1, 1, 0, 0, '2024-04-25 12:10:49', '2026-02-24 16:15:12'),
(3, 20250822497403, 1, 2, 0, 0, '2024-04-25 12:10:49', '2026-02-24 07:10:06'),
(4, 20250822497403, 1, 3, 0, 0, '2024-04-25 12:10:49', '2026-02-24 17:01:20'),
(5, 20250822497403, 1, 4, 0, 0, '2024-04-25 12:10:49', '2026-02-24 07:10:06'),
(6, 20250822497403, 1, 5, 0, 0, '2024-04-25 12:10:49', '2026-02-16 13:12:51'),
(7, 20250822497403, 1, 6, 0, 0, '2024-04-25 12:10:49', '2026-02-16 13:12:51'),
(8, 20250822497403, 1, 7, 0, 0, '2024-04-25 12:10:49', '2026-02-16 13:12:51'),
(9, 20250822497403, 1, 8, 0, 0, '2024-04-25 12:10:49', '2026-02-24 07:08:56'),
(10, 20250822497403, 1, 9, 0, 0, '2024-04-25 12:10:49', '2026-02-16 13:12:51'),
(11, 20250822268694, 2, 0, 0, 0, '2024-04-25 12:10:49', '2026-02-16 13:19:17'),
(12, 20250822268694, 2, 1, 0, 0, '2024-04-25 12:10:49', '2026-02-16 13:17:08'),
(13, 20250822268694, 2, 2, 0, 0, '2024-04-25 12:10:49', '2026-02-16 13:19:17'),
(14, 20250822268694, 2, 3, 0, 0, '2024-04-25 12:10:49', '2026-02-16 13:17:42'),
(15, 20250822268694, 2, 4, 0, 0, '2024-04-25 12:10:49', '2026-02-16 13:19:17'),
(16, 20250822268694, 2, 5, 0, 0, '2024-04-25 12:10:49', '2025-11-26 10:18:06'),
(17, 20250822268694, 2, 6, 0, 0, '2024-04-25 12:10:49', '2026-02-16 13:19:17'),
(18, 20250822268694, 2, 7, 0, 0, '2024-04-25 12:10:49', '2025-11-26 10:18:06'),
(19, 20250822268694, 2, 8, 0, 0, '2024-04-25 12:10:49', '2026-02-16 13:19:17'),
(20, 20250822268694, 2, 9, 0, 0, '2024-04-25 12:10:49', '2025-11-26 10:18:06'),
(21, 20250822113636, 3, 0, 0, 0, '2024-04-25 12:10:49', '2025-06-21 06:51:56'),
(22, 20250822113636, 3, 1, 0, 0, '2024-04-25 12:10:49', '2025-06-21 06:50:52'),
(23, 20250822113636, 3, 2, 0, 0, '2024-04-25 12:10:49', '2025-06-21 08:41:28'),
(24, 20250822113636, 3, 3, 0, 0, '2024-04-25 12:10:49', '2025-06-21 06:50:52'),
(25, 20250822113636, 3, 4, 0, 0, '2024-04-25 12:10:49', '2025-06-21 06:51:56'),
(26, 20250822113636, 3, 5, 0, 0, '2024-04-25 12:10:49', '2025-06-21 06:50:52'),
(27, 20250822113636, 3, 6, 0, 0, '2024-04-25 12:10:49', '2025-06-21 06:51:56'),
(28, 20250822113636, 3, 7, 0, 0, '2024-04-25 12:10:49', '2025-06-21 06:50:52'),
(29, 20250822113636, 3, 8, 0, 0, '2024-04-25 12:10:49', '2025-06-21 06:51:56'),
(30, 20250822113636, 3, 9, 0, 0, '2024-04-25 12:10:49', '2025-06-21 06:50:52'),
(31, 20250822089958, 4, 0, 0, 0, '2024-04-25 12:10:49', '2026-01-28 15:30:04'),
(32, 20250822089958, 4, 1, 0, 0, '2024-04-25 12:10:49', '2025-06-21 08:35:51'),
(33, 20250822089958, 4, 2, 0, 0, '2024-04-25 12:10:49', '2026-01-28 15:30:04'),
(34, 20250822089958, 4, 3, 0, 0, '2024-04-25 12:10:49', '2025-06-21 08:35:51'),
(35, 20250822089958, 4, 4, 0, 0, '2024-04-25 12:10:49', '2026-01-28 15:30:04'),
(36, 20250822089958, 4, 5, 0, 0, '2024-04-25 12:10:49', '2025-06-21 08:35:51'),
(37, 20250822089958, 4, 6, 0, 0, '2024-04-25 12:10:49', '2026-01-28 15:30:04'),
(38, 20250822089958, 4, 7, 0, 0, '2024-04-25 12:10:49', '2025-06-24 12:35:01'),
(39, 20250822089958, 4, 8, 0, 0, '2024-04-25 12:10:49', '2026-01-28 15:30:04'),
(40, 20250822089958, 4, 9, 0, 0, '2024-04-25 12:10:49', '2025-06-21 08:35:51'),
(41, 20250822095670, 6, 0, 0, 0, '2024-04-25 12:10:49', '2025-09-11 17:30:45'),
(42, 20250822095670, 6, 1, 0, 0, '2024-04-25 12:10:49', '2025-09-11 17:30:49'),
(43, 20250822095670, 6, 2, 0, 0, '2024-04-25 12:10:49', '2025-09-11 17:30:45'),
(44, 20250822095670, 6, 3, 0, 0, '2024-04-25 12:10:49', '2025-09-11 17:30:49'),
(45, 20250822095670, 6, 4, 0, 0, '2024-04-25 12:10:49', '2025-09-11 17:30:46'),
(46, 20250822095670, 6, 5, 0, 0, '2024-04-25 12:10:49', '2025-09-11 17:30:49'),
(47, 20250822095670, 6, 6, 0, 0, '2024-04-25 12:10:49', '2025-09-11 17:30:46'),
(48, 20250822095670, 6, 7, 0, 0, '2024-04-25 12:10:49', '2025-09-11 17:30:49'),
(49, 20250822095670, 6, 8, 0, 0, '2024-04-25 12:10:49', '2025-09-11 17:30:46'),
(50, 20250822095670, 6, 9, 0, 0, '2024-04-25 12:10:49', '2025-09-11 17:30:49'),
(51, 20250822081992, 7, 0, 0, 0, '2024-04-25 12:10:49', '2025-06-21 07:17:59'),
(52, 20250822081992, 7, 1, 0, 0, '2024-04-25 12:10:49', '2025-06-21 07:17:59'),
(53, 20250822081992, 7, 2, 0, 0, '2024-04-25 12:10:49', '2025-06-21 07:17:59'),
(54, 20250822081992, 7, 3, 0, 0, '2024-04-25 12:10:49', '2025-06-21 07:17:59'),
(55, 20250822081992, 7, 4, 0, 0, '2024-04-25 12:10:49', '2025-06-21 07:17:59'),
(56, 20250822081992, 7, 5, 0, 0, '2024-04-25 12:10:49', '2025-06-21 07:17:59'),
(57, 20250822081992, 7, 6, 0, 0, '2024-04-25 12:10:49', '2025-06-21 07:17:59'),
(58, 20250822081992, 7, 7, 0, 0, '2024-04-25 12:10:49', '2025-06-21 07:17:59'),
(59, 20250822081992, 7, 8, 0, 0, '2024-04-25 12:10:49', '2025-06-21 07:17:59'),
(60, 20250822081992, 7, 9, 0, 0, '2024-04-25 12:10:49', '2025-06-21 07:17:59'),
(61, 20250822087136, 8, 0, 0, 0, '2024-04-25 12:10:49', '2025-06-21 07:27:17'),
(62, 20250822087136, 8, 1, 0, 0, '2024-04-25 12:10:49', '2025-06-21 07:27:53'),
(63, 20250822087136, 8, 2, 0, 0, '2024-04-25 12:10:49', '2025-06-21 07:27:17'),
(64, 20250822087136, 8, 3, 0, 0, '2024-04-25 12:10:49', '2025-06-21 07:27:53'),
(65, 20250822087136, 8, 4, 0, 0, '2024-04-25 12:10:49', '2025-06-21 07:27:17'),
(66, 20250822087136, 8, 5, 0, 0, '2024-04-25 12:10:49', '2025-06-21 07:27:53'),
(67, 20250822087136, 8, 6, 0, 0, '2024-04-25 12:10:49', '2025-06-21 07:27:17'),
(68, 20250822087136, 8, 7, 0, 0, '2024-04-25 12:10:49', '2025-06-21 07:27:53'),
(69, 20250822087136, 8, 8, 0, 0, '2024-04-25 12:10:49', '2025-06-21 07:27:17'),
(70, 20250822087136, 8, 9, 0, 0, '2024-04-25 12:10:49', '2025-06-21 07:27:53'),
(71, 20250822093249, 9, 0, 0, 0, '2024-04-25 12:10:49', '2025-03-20 13:20:16'),
(72, 20250822093249, 9, 1, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(73, 20250822093249, 9, 2, 0, 0, '2024-04-25 12:10:49', '2025-03-20 13:20:16'),
(74, 20250822093249, 9, 3, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(75, 20250822093249, 9, 4, 0, 0, '2024-04-25 12:10:49', '2025-03-20 13:20:16'),
(76, 20250822093249, 9, 5, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(77, 20250822093249, 9, 6, 0, 0, '2024-04-25 12:10:49', '2025-03-20 15:23:36'),
(78, 20250822093249, 9, 7, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(79, 20250822093249, 9, 8, 0, 0, '2024-04-25 12:10:49', '2025-03-20 13:20:16'),
(80, 20250822093249, 9, 9, 0, 0, '2024-04-25 12:10:49', '2025-05-07 06:45:13'),
(81, 20250822165773, 10, 1, 0, 0, '2024-04-25 12:10:49', '2025-03-22 15:56:56'),
(82, 20250822165773, 10, 2, 0, 0, '2024-04-25 12:10:49', '2025-03-22 15:56:56'),
(83, 20250822165773, 10, 3, 0, 0, '2024-04-25 12:10:49', '2025-03-22 15:56:56'),
(84, 20250822254470, 13, 1, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(85, 20250822254470, 13, 2, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(86, 20250822205637, 14, 1, 0, 0, '2024-04-25 12:10:49', '2025-09-11 17:38:50'),
(87, 20250822205637, 14, 2, 0, 0, '2024-04-25 12:10:49', '2025-09-11 17:38:23'),
(88, 20250822236628, 17, 1, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(89, 20250822215110, 15, 1, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(90, 20250822215110, 15, 2, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(91, 20250822215110, 15, 3, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(92, 20250822225610, 16, 1, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(93, 20250822225610, 16, 2, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(94, 20250822225610, 16, 3, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(95, 20250822225610, 16, 4, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(96, 20250822225610, 16, 5, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(97, 20250822225610, 16, 6, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(98, 20250822243314, 20, 1, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(99, 20250822243314, 20, 2, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(100, 20250822243314, 20, 3, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(101, 20250822243314, 20, 4, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(102, 20250822243314, 20, 5, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(103, 20250822243314, 20, 6, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(104, 20250822215110, 15, 2, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(105, 20250822215110, 15, 3, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(106, 20250822215110, 15, 4, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(107, 20250822215110, 15, 5, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(108, 20250822215110, 15, 6, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(109, 20250822215110, 15, 8, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(110, 20250822215110, 15, 9, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(111, 20250822215110, 15, 10, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(112, 20250822215110, 15, 11, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(113, 20250822215110, 15, 12, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(115, 20250822285349, 22, 1, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(116, 20250822285349, 22, 2, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(117, 20250822285349, 22, 3, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(118, 20250822285349, 22, 4, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(119, 20250822285349, 22, 5, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(120, 20250822285349, 22, 6, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(121, 20250822305194, 24, 1, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(122, 20250822305194, 24, 2, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(123, 20250822315366, 25, 1, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(124, 20250822315366, 25, 2, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(125, 20250822315366, 25, 3, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(126, 20250822315366, 25, 4, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(127, 20250822315366, 25, 5, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(128, 20250822315366, 25, 6, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(130, 20250822325506, 26, 1, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(131, 20250822325506, 26, 2, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(132, 20250822246001, 21, 1, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(133, 20250822246001, 21, 2, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(134, 20250822246001, 21, 3, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(135, 20250822246001, 21, 4, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(136, 20250822246001, 21, 5, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(137, 20250822246001, 21, 6, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(138, 20250822246001, 21, 7, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(139, 20250822246001, 21, 8, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(140, 20250822246001, 21, 9, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(141, 20250822246001, 21, 10, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(142, 20250822246001, 21, 11, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(143, 20250822246001, 21, 12, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(144, 20250822241480, 18, 1, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(145, 20250822241480, 18, 2, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(146, 20250822325506, 26, 3, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(147, 20250822325506, 26, 4, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(148, 20250822325506, 26, 5, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(149, 20250822325506, 26, 6, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(150, 20250822325506, 26, 7, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(151, 20250822325506, 26, 8, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(152, 20250822325506, 26, 9, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(153, 20250822325506, 26, 10, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(154, 20250822325506, 26, 11, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49'),
(155, 20250822325506, 26, 12, 0, 0, '2024-04-25 12:10:49', '2024-04-25 12:10:49');

-- --------------------------------------------------------

--
-- Table structure for table `bets`
--

CREATE TABLE `bets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bets` text DEFAULT NULL,
  `amount` double(20,2) NOT NULL DEFAULT 0.00,
  `commission` double(20,2) NOT NULL DEFAULT 0.00,
  `trade_amount` double(20,2) NOT NULL DEFAULT 0.00,
  `win_amount` double(20,2) NOT NULL DEFAULT 0.00,
  `number` varchar(200) NOT NULL,
  `win_number` int(11) DEFAULT NULL,
  `games_no` varchar(64) NOT NULL,
  `game_id` int(11) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `order_id` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=pending,1=win,2=lose',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bets`
--

INSERT INTO `bets` (`id`, `bets`, `amount`, `commission`, `trade_amount`, `win_amount`, `number`, `win_number`, `games_no`, `game_id`, `userid`, `order_id`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 1.00, 0.00, 1.00, 0.00, '0', NULL, '20250822494894', 1, 1, '2026022317205998242', 0, '2026-02-23 17:20:59', '2026-02-23 17:20:59'),
(2, NULL, 1000.00, 0.00, 1000.00, 0.00, '8', NULL, '20250822496550', 1, 1, '2026022407085561302', 0, '2026-02-24 07:08:55', '2026-02-24 07:08:55'),
(3, NULL, 5000.00, 0.00, 5000.00, 0.00, '50', NULL, '20250822496550', 1, 1, '2026022407100647918', 0, '2026-02-24 07:10:06', '2026-02-24 07:10:06'),
(4, NULL, 1.00, 0.00, 1.00, 0.00, '1', 8, '20250822497221', 1, 1, '2026022416150520721', 2, '2026-02-24 16:15:05', '2026-02-24 16:15:17'),
(5, NULL, 1.00, 0.00, 1.00, 0.00, '1', 8, '20250822497221', 1, 1, '2026022416151260381', 2, '2026-02-24 16:15:12', '2026-02-24 16:15:17'),
(6, NULL, 1.00, 0.00, 1.00, 9.00, '3', 3, '20250822497311', 1, 1, '2026022417001745716', 1, '2026-02-24 17:00:17', '2026-02-24 17:00:30'),
(7, NULL, 10.00, 0.00, 10.00, 0.00, '3', NULL, '20250822497301', 1, 1, '2026022417005090067', 0, '2026-02-24 17:00:50', '2026-02-24 17:00:50'),
(8, NULL, 10.00, 0.00, 10.00, 0.00, '3', NULL, '20250822497303', 1, 1, '2026022417012021074', 0, '2026-02-24 17:01:20', '2026-02-24 17:01:20');

-- --------------------------------------------------------

--
-- Table structure for table `bet_results`
--

CREATE TABLE `bet_results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `number` int(11) DEFAULT NULL,
  `win_number` varchar(255) DEFAULT NULL,
  `games_no` varchar(255) DEFAULT NULL,
  `game_id` double NOT NULL DEFAULT 0,
  `json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `card_name` text NOT NULL DEFAULT '0',
  `image` text DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL,
  `multiplier` double DEFAULT NULL,
  `random_card` varchar(255) NOT NULL DEFAULT '0',
  `token` varchar(255) DEFAULT NULL,
  `block` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bet_results`
--

INSERT INTO `bet_results` (`id`, `number`, `win_number`, `games_no`, `game_id`, `json`, `card_name`, `image`, `card_id`, `multiplier`, `random_card`, `token`, `block`, `status`, `created_at`, `updated_at`) VALUES
(1, 6, NULL, '20250822497400', 1, '[\"6\",\"Big\",\"Red\"]', '0', NULL, NULL, NULL, '6', NULL, NULL, 1, '2026-02-24 17:45:12', '2026-02-24 17:45:12'),
(2, 8, NULL, '20250822268692', 2, '[\"8\",\"Big\",\"Red\"]', '0', NULL, NULL, NULL, '8', NULL, NULL, 1, '2026-02-24 17:45:12', '2026-02-24 17:45:12'),
(3, 5, NULL, '20250822497401', 1, '[\"5\",\"Big\",\"Voilet\"]', '0', NULL, NULL, NULL, '5', NULL, NULL, 1, '2026-02-24 17:45:42', '2026-02-24 17:45:42'),
(4, 2, NULL, '20250822497402', 1, '[\"2\",\"Small\",\"Red\"]', '0', NULL, NULL, NULL, '2', NULL, NULL, 1, '2026-02-24 17:46:12', '2026-02-24 17:46:12'),
(5, 7, NULL, '20250822268693', 2, '[\"7\",\"Big\",\"Green\"]', '0', NULL, NULL, NULL, '7', NULL, NULL, 1, '2026-02-24 17:46:12', '2026-02-24 17:46:12');

-- --------------------------------------------------------

--
-- Table structure for table `bet_values`
--

CREATE TABLE `bet_values` (
  `id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT 1 COMMENT '1 = Active, 0 = Inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bet_values`
--

INSERT INTO `bet_values` (`id`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-06-26 06:44:23', '2025-08-20 15:35:18'),
(2, 210, 1, '2025-06-26 06:44:23', '2025-07-12 15:17:46'),
(3, 500, 1, '2025-06-26 06:44:23', '2025-06-26 14:38:46'),
(4, 16400, 1, '2025-06-26 06:44:23', '2025-08-20 15:34:56');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `campaign_name` varchar(55) NOT NULL,
  `unique_code` varchar(55) NOT NULL,
  `referral_link` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `registration_count` int(11) DEFAULT 0,
  `click_count` int(11) DEFAULT 0,
  `fake_revenue` varchar(55) DEFAULT NULL,
  `real_revenue` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `card` varchar(2) NOT NULL,
  `colour` varchar(2) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`id`, `card`, `colour`, `image`, `created_at`, `updated_at`) VALUES
(1, '2', 'c', 'https://root.winbhai.in/public/uploads/patton_ke_naam/1.png', NULL, NULL),
(2, '2', 'e', 'https://root.winbhai.in/public/uploads/patton_ke_naam/2.png', NULL, NULL),
(3, '2', 'k', 'https://root.winbhai.in/public/uploads/patton_ke_naam/3.png', NULL, NULL),
(4, '2', 'd', 'https://root.winbhai.in/public/uploads/patton_ke_naam/4.png', NULL, NULL),
(5, '3', 'c', 'https://root.winbhai.in/public/uploads/patton_ke_naam/5.png', NULL, NULL),
(6, '3', 'e', 'https://root.winbhai.in/public/uploads/patton_ke_naam/6.png', NULL, NULL),
(7, '3', 'k', 'https://root.winbhai.in/public/uploads/patton_ke_naam/7.png', NULL, NULL),
(8, '3', 'd', 'https://root.winbhai.in/public/uploads/patton_ke_naam/8.png', NULL, NULL),
(9, '4', 'c', 'https://root.winbhai.in/public/uploads/patton_ke_naam/9.png', NULL, NULL),
(10, '4', 'e', 'https://root.winbhai.in/public/uploads/patton_ke_naam/10.png', NULL, NULL),
(11, '4', 'k', 'https://root.winbhai.in/public/uploads/patton_ke_naam/11.png', NULL, NULL),
(12, '4', 'd', 'https://root.winbhai.in/public/uploads/patton_ke_naam/12.png', NULL, NULL),
(13, '5', 'c', 'https://root.winbhai.in/public/uploads/patton_ke_naam/13.png', NULL, NULL),
(14, '5', 'e', 'https://root.winbhai.in/public/uploads/patton_ke_naam/14.png', NULL, NULL),
(15, '5', 'k', 'https://root.winbhai.in/public/uploads/patton_ke_naam/15.png', NULL, NULL),
(16, '5', 'd', 'https://root.winbhai.in/public/uploads/patton_ke_naam/16.png', NULL, NULL),
(17, '6', 'c', 'https://root.winbhai.in/public/uploads/patton_ke_naam/17.png', NULL, NULL),
(18, '6', 'e', 'https://root.winbhai.in/public/uploads/patton_ke_naam/18.png', NULL, NULL),
(19, '6', 'k', 'https://root.winbhai.in/public/uploads/patton_ke_naam/19.png', NULL, NULL),
(20, '6', 'd', 'https://root.winbhai.in/public/uploads/patton_ke_naam/20.png', NULL, NULL),
(21, '7', 'c', 'https://root.winbhai.in/public/uploads/patton_ke_naam/21.png', NULL, NULL),
(22, '7', 'e', 'https://root.winbhai.in/public/uploads/patton_ke_naam/22.png', NULL, NULL),
(23, '7', 'k', 'https://root.winbhai.in/public/uploads/patton_ke_naam/23.png', NULL, NULL),
(24, '7', 'd', 'https://root.winbhai.in/public/uploads/patton_ke_naam/24.png', NULL, NULL),
(25, '8', 'c', 'https://root.winbhai.in/public/uploads/patton_ke_naam/25.png', NULL, NULL),
(26, '8', 'e', 'https://root.winbhai.in/public/uploads/patton_ke_naam/26.png', NULL, NULL),
(27, '8', 'k', 'https://root.winbhai.in/public/uploads/patton_ke_naam/27.png', NULL, NULL),
(28, '8', 'd', 'https://root.winbhai.in/public/uploads/patton_ke_naam/28.png', NULL, NULL),
(29, '9', 'c', 'https://root.winbhai.in/public/uploads/patton_ke_naam/29.png', NULL, NULL),
(30, '9', 'e', 'https://root.winbhai.in/public/uploads/patton_ke_naam/30.png', NULL, NULL),
(31, '9', 'k', 'https://root.winbhai.in/public/uploads/patton_ke_naam/31.png', NULL, NULL),
(32, '9', 'd', 'https://root.winbhai.in/public/uploads/patton_ke_naam/32.png', NULL, NULL),
(33, '10', 'c', 'https://root.winbhai.in/public/uploads/patton_ke_naam/33.png', NULL, NULL),
(34, '10', 'e', 'https://root.winbhai.in/public/uploads/patton_ke_naam/34.png', NULL, NULL),
(35, '10', 'k', 'https://root.winbhai.in/public/uploads/patton_ke_naam/35.png', NULL, NULL),
(36, '10', 'd', 'https://root.winbhai.in/public/uploads/patton_ke_naam/36.png', NULL, NULL),
(37, '11', 'c', 'https://root.winbhai.in/public/uploads/patton_ke_naam/37.png', NULL, NULL),
(38, '11', 'e', 'https://root.winbhai.in/public/uploads/patton_ke_naam/38.png', NULL, NULL),
(39, '11', 'k', 'https://root.winbhai.in/public/uploads/patton_ke_naam/39.png', NULL, NULL),
(40, '11', 'd', 'https://root.winbhai.in/public/uploads/patton_ke_naam/40.png', NULL, NULL),
(41, '12', 'c', 'https://root.winbhai.in/public/uploads/patton_ke_naam/41.png', NULL, NULL),
(42, '12', 'e', 'https://root.winbhai.in/public/uploads/patton_ke_naam/42.png', NULL, NULL),
(43, '12', 'k', 'https://root.winbhai.in/public/uploads/patton_ke_naam/43.png', NULL, NULL),
(44, '12', 'd', 'https://root.winbhai.in/public/uploads/patton_ke_naam/44.png', NULL, NULL),
(45, '13', 'c', 'https://root.winbhai.in/public/uploads/patton_ke_naam/45.png', NULL, NULL),
(46, '13', 'e', 'https://root.winbhai.in/public/uploads/patton_ke_naam/46.png', NULL, NULL),
(47, '13', 'k', 'https://root.winbhai.in/public/uploads/patton_ke_naam/47.png', NULL, NULL),
(48, '13', 'd', 'https://root.winbhai.in/public/uploads/patton_ke_naam/48.png', NULL, NULL),
(49, '14', 'c', 'https://root.winbhai.in/public/uploads/patton_ke_naam/49.png', NULL, NULL),
(50, '14', 'e', 'https://root.winbhai.in/public/uploads/patton_ke_naam/50.png', NULL, NULL),
(51, '14', 'k', 'https://root.winbhai.in/public/uploads/patton_ke_naam/51.png', NULL, NULL),
(52, '14', 'd', 'https://root.winbhai.in/public/uploads/patton_ke_naam/52.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `casino_lobby`
--

CREATE TABLE `casino_lobby` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(55) NOT NULL,
  `image` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `casino_lobby`
--

INSERT INTO `casino_lobby` (`id`, `cat_id`, `cat_name`, `image`, `created_at`, `updated_at`) VALUES
(1, 13, 'ezugi', 'https://root.winbhai.in/public/casino_lobby/ezugi.png', '2025-11-19 06:37:01', '2025-11-19 06:37:01'),
(2, 2, 'mac88', 'https://root.winbhai.in/public/casino_lobby/mac88.png', '2025-11-19 06:37:01', '2025-11-19 06:37:01'),
(3, 18, 'evolution electronic', 'https://root.winbhai.in/public/casino_lobby/evolution_electronic.png', '2025-11-19 06:37:01', '2025-11-19 06:37:01'),
(4, 20, 'jdb', 'https://root.winbhai.in/public/casino_lobby/jdb.png', '2025-11-19 06:37:01', '2025-11-19 06:37:01'),
(5, 21, 'pgs', 'https://root.winbhai.in/public/casino_lobby/pgs.png', '2025-11-19 06:37:01', '2025-11-19 06:37:01'),
(6, 10, 'evolution', 'https://root.winbhai.in/public/casino_lobby/evolution.png', '2025-11-19 06:37:01', '2025-11-19 06:37:01'),
(7, 9, 'spribe', 'https://root.winbhai.in/public/casino_lobby/spribe.png', '2025-11-19 06:37:01', '2025-11-19 06:37:01'),
(8, 24, 'smart soft', 'https://root.winbhai.in/public/casino_lobby/smartsoft.png', '2025-11-19 06:37:01', '2025-11-19 06:37:01'),
(9, 22, 'mini', 'https://root.winbhai.in/public/casino_lobby/mini.png', '2025-11-19 06:37:01', '2025-11-19 06:37:01'),
(10, 10, 'gaming bet', 'https://root.winbhai.in/public/casino_lobby/sa_gamingbet.png', '2025-11-19 06:37:01', '2025-11-19 06:37:01'),
(11, 11, 'the start', 'https://root.winbhai.in/public/casino_lobby/the star.png', '2025-11-19 06:37:01', '2025-11-19 06:37:01'),
(12, 25, 'play tech', 'https://root.winbhai.in/public/casino_lobby/playtech.png', '2025-11-19 06:37:01', '2025-11-19 06:37:01'),
(13, 23, 'saba sports', 'https://root.winbhai.in/public/casino_lobby/saba_sport.png', '2025-11-19 06:37:01', '2025-11-19 06:37:01'),
(14, 8, 'live88', 'https://root.winbhai.in/public/casino_lobby/live88.png', '2025-11-19 06:37:01', '2025-11-19 06:37:01'),
(15, 18, 'turbo game', 'https://root.winbhai.in/public/casino_lobby/turbo_game.png', '2025-11-19 06:37:01', '2025-11-19 06:37:01'),
(16, 12, 'inout', 'https://root.winbhai.in/public/casino_lobby/inout1.png', '2025-11-19 06:37:01', '2025-11-19 06:37:01'),
(17, 15, 'jili ', 'https://root.winbhai.in/public/casino_lobby/jili.png', '2025-11-19 06:37:01', '2025-11-19 06:37:01'),
(18, 19, 'cq9', 'https://root.winbhai.in/public/casino_lobby/cq9.png', '2025-11-19 06:37:01', '2025-11-19 06:37:01'),
(19, 33, 'Pragmatic Play', 'https://root.winbhai.in/public/casino_lobby/Pragmatic_Play.png', '2025-11-19 06:37:01', '2025-11-19 06:37:01'),
(20, 34, 'T1', 'https://root.winbhai.in/public/casino_lobby/T1.png', '2025-11-19 06:37:01', '2025-11-19 06:37:01'),
(21, 35, 'Tada', 'https://root.winbhai.in/public/casino_lobby/Tada.png', '2025-11-19 06:37:01', '2025-11-19 06:37:01');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Casino'),
(2, 'Sports');

-- --------------------------------------------------------

--
-- Table structure for table `category_language`
--

CREATE TABLE `category_language` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `image_url` text DEFAULT NULL,
  `video_url` text DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `category_language`
--

INSERT INTO `category_language` (`id`, `category_id`, `language_id`, `image_url`, `video_url`, `title`, `description`) VALUES
(1, 1, 1, 'https://root.winbhai.in/public/learn/1.png', 'https://root.winbhai.in/public/learn_video/WA1.mp4', 'Best Casino Games play no...', 'Best Casino Games play now, use referral code to get h..'),
(2, 1, 2, 'https://root.winbhai.in/public/learn/1.png', 'https://root.winbhai.in/public/learn_video/WA2.mp4', 'Best Casino Games play no...', 'Best Casino Games play now, use referral code to get h..'),
(3, 2, 1, 'https://root.winbhai.in/public/learn/2.png', 'https://cdn.pixabay.com/video/2015/10/27/1192-143842659_large.mp4', 'Best Casino Games play no...', 'Best Casino Games play now, use referral code to get h..'),
(4, 2, 1, 'https://root.winbhai.in/public/learn/2.png', 'https://cdn.pixabay.com/video/2015/10/27/1192-143842659_large.mp4', 'Best Casino Games play no...', 'Best Casino Games play now, use referral code to get h..'),
(5, 2, 1, 'https://root.winbhai.in/public/learn/2.png', 'https://cdn.pixabay.com/video/2015/10/27/1192-143842659_large.mp4', 'Best Casino Games play no...', 'Best Casino Games play now, use referral code to get h..'),
(7, 2, 1, 'https://root.winbhai.in/public/learn/2.png', 'https://cdn.pixabay.com/video/2015/10/27/1192-143842659_large.mp4', 'Best Casino Games play no...', 'Best Casino Games play now, use referral code to get h..');

-- --------------------------------------------------------

--
-- Table structure for table `checkin_redeems`
--

CREATE TABLE `checkin_redeems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `table_id` bigint(20) UNSIGNED NOT NULL,
  `day` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `check_ins`
--

CREATE TABLE `check_ins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `day` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chicken_bets`
--

CREATE TABLE `chicken_bets` (
  `id` int(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `status` int(1) DEFAULT 1 COMMENT '0=pending,1=success,2=loss',
  `win_amount` double(8,2) DEFAULT 0.00,
  `period_no` bigint(20) DEFAULT NULL,
  `game_id` int(2) DEFAULT NULL,
  `win_number` int(1) DEFAULT NULL,
  `multiplier` decimal(20,2) DEFAULT 0.00,
  `account_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'type 0=real,1=demo',
  `cashout_status` int(5) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chicken_bets`
--

INSERT INTO `chicken_bets` (`id`, `user_id`, `amount`, `status`, `win_amount`, `period_no`, `game_id`, `win_number`, `multiplier`, `account_type`, `cashout_status`, `created_at`, `updated_at`) VALUES
(1, 1, 10.00, 1, 12.30, NULL, 19, NULL, 1.23, 0, 1, '2026-02-23 16:34:24', '2026-02-23 16:34:33');

-- --------------------------------------------------------

--
-- Table structure for table `commission_logs`
--

CREATE TABLE `commission_logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(55) DEFAULT NULL,
  `campaign_id` varchar(55) NOT NULL,
  `amount` varchar(155) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `contact` varchar(55) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_At` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `contact`, `created_at`, `updated_At`) VALUES
(1, 'https://wa.me/+66 84 295 0161', '2025-12-01 05:19:44', '2025-12-01 05:19:44');

-- --------------------------------------------------------

--
-- Table structure for table `contact_with_us`
--

CREATE TABLE `contact_with_us` (
  `id` int(11) NOT NULL,
  `instagram_link` varchar(255) DEFAULT NULL,
  `telegram_link` varchar(255) DEFAULT NULL,
  `whatsapp_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `contact_with_us`
--

INSERT INTO `contact_with_us` (`id`, `instagram_link`, `telegram_link`, `whatsapp_link`, `created_at`, `updated_at`) VALUES
(1, 'https://www.instagram.com/nexwin', 'https://t.me/NexWin_Official', 'https://wa.me/+66 84 295 0161', '2025-12-01 05:23:19', '2026-02-24 02:04:56');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `sortname` varchar(3) NOT NULL,
  `name` varchar(55) NOT NULL,
  `phone_code` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `sortname`, `name`, `phone_code`) VALUES
(1, 'IN', 'India', '+91'),
(2, 'AL', 'Albania', '+355'),
(3, 'DZ', 'Algeria', '+213'),
(4, 'AS', 'American Samoa', '+1684'),
(5, 'AD', 'Andorra', '+376'),
(6, 'AO', 'Angola', '+244'),
(7, 'AI', 'Anguilla', '+1264'),
(8, 'AQ', 'Antarctica', '+0'),
(9, 'AG', 'Antigua And Barbuda', '+1268'),
(10, 'AR', 'Argentina', '+54'),
(11, 'AM', 'Armenia', '+374'),
(12, 'AW', 'Aruba', '+297'),
(13, 'AU', 'Australia', '+61'),
(14, 'AT', 'Austria', '+43'),
(15, 'AZ', 'Azerbaijan', '+994'),
(16, 'BS', 'Bahamas The', '+1242'),
(17, 'BH', 'Bahrain', '+973'),
(18, 'BD', 'Bangladesh', '+880'),
(19, 'BB', 'Barbados', '+1246'),
(20, 'BY', 'Belarus', '+375'),
(21, 'BE', 'Belgium', '+32'),
(22, 'BZ', 'Belize', '+501'),
(23, 'BJ', 'Benin', '+229'),
(24, 'BM', 'Bermuda', '+1441'),
(25, 'BT', 'Bhutan', '+975'),
(26, 'BO', 'Bolivia', '+591'),
(27, 'BA', 'Bosnia and Herzegovina', '+387'),
(28, 'BW', 'Botswana', '+267'),
(29, 'BV', 'Bouvet Island', '+0'),
(30, 'BR', 'Brazil', '+55'),
(31, 'IO', 'British Indian Ocean Territory', '+246'),
(32, 'BN', 'Brunei', '+673'),
(33, 'BG', 'Bulgaria', '+359'),
(34, 'BF', 'Burkina Faso', '+226'),
(35, 'BI', 'Burundi', '+257'),
(36, 'KH', 'Cambodia', '+855'),
(37, 'CM', 'Cameroon', '+237'),
(38, 'CA', 'Canada', '+1'),
(39, 'CV', 'Cape Verde', '+238'),
(40, 'KY', 'Cayman Islands', '+1345'),
(41, 'CF', 'Central African Republic', '+236'),
(42, 'TD', 'Chad', '+235'),
(43, 'CL', 'Chile', '+56'),
(44, 'CN', 'China', '+86'),
(45, 'CX', 'Christmas Island', '+61'),
(46, 'CC', 'Cocos (Keeling) Islands', '+672'),
(47, 'CO', 'Colombia', '+57'),
(48, 'KM', 'Comoros', '+269'),
(49, 'CG', 'Republic Of The Congo', '+242'),
(50, 'CD', 'Democratic Republic Of The Congo', '+242'),
(51, 'CK', 'Cook Islands', '+682'),
(52, 'CR', 'Costa Rica', '+506'),
(53, 'CI', 'Cote D\'Ivoire (Ivory Coast)', '+225'),
(54, 'HR', 'Croatia (Hrvatska)', '+385'),
(55, 'CU', 'Cuba', '+53'),
(56, 'CY', 'Cyprus', '+357'),
(57, 'CZ', 'Czech Republic', '+420'),
(58, 'DK', 'Denmark', '+45'),
(59, 'DJ', 'Djibouti', '+253'),
(60, 'DM', 'Dominica', '+1767'),
(61, 'DO', 'Dominican Republic', '+1809'),
(62, 'TP', 'East Timor', '+670'),
(63, 'EC', 'Ecuador', '+593'),
(64, 'EG', 'Egypt', '+20'),
(65, 'SV', 'El Salvador', '+503'),
(66, 'GQ', 'Equatorial Guinea', '+240'),
(67, 'ER', 'Eritrea', '+291'),
(68, 'EE', 'Estonia', '+372'),
(69, 'ET', 'Ethiopia', '+251'),
(70, 'XA', 'External Territories of Australia', '+61'),
(71, 'FK', 'Falkland Islands', '+500'),
(72, 'FO', 'Faroe Islands', '+298'),
(73, 'FJ', 'Fiji Islands', '+679'),
(74, 'FI', 'Finland', '+358'),
(75, 'FR', 'France', '+33'),
(76, 'GF', 'French Guiana', '+594'),
(77, 'PF', 'French Polynesia', '+689'),
(78, 'TF', 'French Southern Territories', '+0'),
(79, 'GA', 'Gabon', '+241'),
(80, 'GM', 'Gambia The', '+220'),
(81, 'GE', 'Georgia', '+995'),
(82, 'DE', 'Germany', '+49'),
(83, 'GH', 'Ghana', '+233'),
(84, 'GI', 'Gibraltar', '+350'),
(85, 'GR', 'Greece', '+30'),
(86, 'GL', 'Greenland', '+299'),
(87, 'GD', 'Grenada', '+1473'),
(88, 'GP', 'Guadeloupe', '+590'),
(89, 'GU', 'Guam', '+1671'),
(90, 'GT', 'Guatemala', '+502'),
(91, 'XU', 'Guernsey and Alderney', '+44'),
(92, 'GN', 'Guinea', '+224'),
(93, 'GW', 'Guinea-Bissau', '+245'),
(94, 'GY', 'Guyana', '+592'),
(95, 'HT', 'Haiti', '+509'),
(96, 'HM', 'Heard and McDonald Islands', '+0'),
(97, 'HN', 'Honduras', '+504'),
(98, 'HK', 'Hong Kong S.A.R.', '+852'),
(99, 'HU', 'Hungary', '+36'),
(100, 'IS', 'Iceland', '+354'),
(101, 'AF', 'Afghanistan', '+93'),
(102, 'ID', 'Indonesia', '+62'),
(103, 'IR', 'Iran', '+98'),
(104, 'IQ', 'Iraq', '+964'),
(105, 'IE', 'Ireland', '+353'),
(106, 'IL', 'Israel', '+972'),
(107, 'IT', 'Italy', '+39'),
(108, 'JM', 'Jamaica', '+1876'),
(109, 'JP', 'Japan', '+81'),
(110, 'XJ', 'Jersey', '+44'),
(111, 'JO', 'Jordan', '+962'),
(112, 'KZ', 'Kazakhstan', '+7'),
(113, 'KE', 'Kenya', '+254'),
(114, 'KI', 'Kiribati', '+686'),
(115, 'KP', 'Korea North', '+850'),
(116, 'KR', 'Korea South', '+82'),
(117, 'KW', 'Kuwait', '+965'),
(118, 'KG', 'Kyrgyzstan', '+996'),
(119, 'LA', 'Laos', '+856'),
(120, 'LV', 'Latvia', '+371'),
(121, 'LB', 'Lebanon', '+961'),
(122, 'LS', 'Lesotho', '+266'),
(123, 'LR', 'Liberia', '+231'),
(124, 'LY', 'Libya', '+218'),
(125, 'LI', 'Liechtenstein', '+423'),
(126, 'LT', 'Lithuania', '+370'),
(127, 'LU', 'Luxembourg', '+352'),
(128, 'MO', 'Macau S.A.R.', '+853'),
(129, 'MK', 'Macedonia', '+389'),
(130, 'MG', 'Madagascar', '+261'),
(131, 'MW', 'Malawi', '+265'),
(132, 'MY', 'Malaysia', '+60'),
(133, 'MV', 'Maldives', '+960'),
(134, 'ML', 'Mali', '+223'),
(135, 'MT', 'Malta', '+356'),
(136, 'XM', 'Man (Isle of)', '+44'),
(137, 'MH', 'Marshall Islands', '+692'),
(138, 'MQ', 'Martinique', '+596'),
(139, 'MR', 'Mauritania', '+222'),
(140, 'MU', 'Mauritius', '+230'),
(141, 'YT', 'Mayotte', '+269'),
(142, 'MX', 'Mexico', '+52'),
(143, 'FM', 'Micronesia', '+691'),
(144, 'MD', 'Moldova', '+373'),
(145, 'MC', 'Monaco', '+377'),
(146, 'MN', 'Mongolia', '+976'),
(147, 'MS', 'Montserrat', '+1664'),
(148, 'MA', 'Morocco', '+212'),
(149, 'MZ', 'Mozambique', '+258'),
(150, 'MM', 'Myanmar', '+95'),
(151, 'NA', 'Namibia', '+264'),
(152, 'NR', 'Nauru', '+674'),
(153, 'NP', 'Nepal', '+977'),
(154, 'AN', 'Netherlands Antilles', '+599'),
(155, 'NL', 'Netherlands The', '+31'),
(156, 'NC', 'New Caledonia', '+687'),
(157, 'NZ', 'New Zealand', '+64'),
(158, 'NI', 'Nicaragua', '+505'),
(159, 'NE', 'Niger', '+227'),
(160, 'NG', 'Nigeria', '+234'),
(161, 'NU', 'Niue', '+683'),
(162, 'NF', 'Norfolk Island', '+672'),
(163, 'MP', 'Northern Mariana Islands', '+1670'),
(164, 'NO', 'Norway', '+47'),
(165, 'OM', 'Oman', '+968'),
(166, 'PK', 'Pakistan', '+92'),
(167, 'PW', 'Palau', '+680'),
(168, 'PS', 'Palestinian Territory Occupied', '+970'),
(169, 'PA', 'Panama', '+507'),
(170, 'PG', 'Papua new Guinea', '+675'),
(171, 'PY', 'Paraguay', '+595'),
(172, 'PE', 'Peru', '+51'),
(173, 'PH', 'Philippines', '+63'),
(174, 'PN', 'Pitcairn Island', '+0'),
(175, 'PL', 'Poland', '+48'),
(176, 'PT', 'Portugal', '+351'),
(177, 'PR', 'Puerto Rico', '+1787'),
(178, 'QA', 'Qatar', '+974'),
(179, 'RE', 'Reunion', '+262'),
(180, 'RO', 'Romania', '+40'),
(181, 'RU', 'Russia', '+70'),
(182, 'RW', 'Rwanda', '+250'),
(183, 'SH', 'Saint Helena', '+290'),
(184, 'KN', 'Saint Kitts And Nevis', '+1869'),
(185, 'LC', 'Saint Lucia', '+1758'),
(186, 'PM', 'Saint Pierre and Miquelon', '+508'),
(187, 'VC', 'Saint Vincent And The Grenadines', '+1784'),
(188, 'WS', 'Samoa', '+684'),
(189, 'SM', 'San Marino', '+378'),
(190, 'ST', 'Sao Tome and Principe', '+239'),
(191, 'SA', 'Saudi Arabia', '+966'),
(192, 'SN', 'Senegal', '+221'),
(193, 'RS', 'Serbia', '+381'),
(194, 'SC', 'Seychelles', '+248'),
(195, 'SL', 'Sierra Leone', '+232'),
(196, 'SG', 'Singapore', '+65'),
(197, 'SK', 'Slovakia', '+421'),
(198, 'SI', 'Slovenia', '+386'),
(199, 'XG', 'Smaller Territories of the UK', '+44'),
(200, 'SB', 'Solomon Islands', '+677'),
(201, 'SO', 'Somalia', '+252'),
(202, 'ZA', 'South Africa', '+27'),
(203, 'GS', 'South Georgia', '+0'),
(204, 'SS', 'South Sudan', '+211'),
(205, 'ES', 'Spain', '+34'),
(206, 'LK', 'Sri Lanka', '+94'),
(207, 'SD', 'Sudan', '+249'),
(208, 'SR', 'Suriname', '+597'),
(209, 'SJ', 'Svalbard And Jan Mayen Islands', '+47'),
(210, 'SZ', 'Swaziland', '+268'),
(211, 'SE', 'Sweden', '+46'),
(212, 'CH', 'Switzerland', '+41'),
(213, 'SY', 'Syria', '+963'),
(214, 'TW', 'Taiwan', '+886'),
(215, 'TJ', 'Tajikistan', '+992'),
(216, 'TZ', 'Tanzania', '+255'),
(217, 'TH', 'Thailand', '+66'),
(218, 'TG', 'Togo', '+228'),
(219, 'TK', 'Tokelau', '+690'),
(220, 'TO', 'Tonga', '+676'),
(221, 'TT', 'Trinidad And Tobago', '+1868'),
(222, 'TN', 'Tunisia', '+216'),
(223, 'TR', 'Turkey', '+90'),
(224, 'TM', 'Turkmenistan', '+7370'),
(225, 'TC', 'Turks And Caicos Islands', '+1649'),
(226, 'TV', 'Tuvalu', '+688'),
(227, 'UG', 'Uganda', '+256'),
(228, 'UA', 'Ukraine', '+380'),
(229, 'AE', 'United Arab Emirates', '+971'),
(230, 'GB', 'United Kingdom', '+44'),
(231, 'US', 'United States', '+1'),
(232, 'UM', 'United States Minor Outlying Islands', '+1'),
(233, 'UY', 'Uruguay', '+598'),
(234, 'UZ', 'Uzbekistan', '+998'),
(235, 'VU', 'Vanuatu', '+678'),
(236, 'VA', 'Vatican City State (Holy See)', '+39'),
(237, 'VE', 'Venezuela', '+58'),
(238, 'VN', 'Vietnam', '+84'),
(239, 'VG', 'Virgin Islands (British)', '+1284'),
(240, 'VI', 'Virgin Islands (US)', '+1340'),
(241, 'WF', 'Wallis And Futuna Islands', '+681'),
(242, 'EH', 'Western Sahara', '+212'),
(243, 'YE', 'Yemen', '+967'),
(244, 'YU', 'Yugoslavia', '+38'),
(245, 'ZM', 'Zambia', '+260'),
(246, 'ZW', 'Zimbabwe', '+263');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `percentage` decimal(5,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1 COMMENT '1 = active, 0 = inactive',
  `use_limit_per_user` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `title`, `coupon_code`, `percentage`, `description`, `status`, `use_limit_per_user`, `created_at`, `updated_at`) VALUES
(1, 'FIRST 5', 'FIRST5', 5.00, 'Get 5% bonus on first deposit', 1, 1, '2025-11-14 05:27:52', '2025-11-14 05:27:52'),
(2, 'FIRST 10', 'FIRST10', 10.00, 'Get 10% bonus on first deposit', 1, 1, '2025-11-14 05:27:52', '2025-11-14 05:27:52'),
(3, 'WIN 10', 'WIN10', 7.00, 'Get 7% bonus on first deposit', 1, 1, '2025-11-14 05:27:52', '2025-11-14 05:27:52'),
(4, 'WELCOME 5', 'WELCOME5', 5.00, 'Get 5% bonus on first deposits', 1, 1, '2025-11-14 05:27:52', '2025-11-27 16:57:18');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_history`
--

CREATE TABLE `coupon_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `used_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_services`
--

CREATE TABLE `customer_services` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `phone` varchar(55) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `customer_services`
--

INSERT INTO `customer_services` (`id`, `name`, `image`, `link`, `phone`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Chat On Telegram', 'https://root.nexwin.vip/public/support_icon/teligram.jpeg', 'https://t.me/NexWin_Official', '', 'Connect with us instantly on Telegram for quick responses', 1, '2024-04-25 06:18:35', '2024-04-25 06:18:35'),
(2, 'Chat On Whatsapp', 'https://root.nexwin.vip/public/support_icon/whatsapp.jpeg', 'https://wa.me/919876543210\n', '', 'Reach out to us on WhatsApp for personalized support', 1, '2024-04-25 06:18:35', '2024-04-25 06:18:35'),
(3, 'Email Support', 'https://root.nexwin.vip/public/support_icon/email.jpeg', 'mailto:nexwin@gmail.com', '', '', 1, '2024-04-25 06:18:35', '2024-04-25 06:18:35'),
(4, 'Phone Support', 'https://root.nexwin.vip/public/support_icon/phone.jpeg', 'tel:919876543210\n', '1234567890', '', 1, '2024-04-25 06:18:35', '2024-04-25 06:18:35');

-- --------------------------------------------------------

--
-- Table structure for table `deposit_category`
--

CREATE TABLE `deposit_category` (
  `id` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `bonus` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extra_first_deposit_bonus`
--

CREATE TABLE `extra_first_deposit_bonus` (
  `id` int(11) NOT NULL,
  `first_deposit_ammount` double NOT NULL,
  `bonus` double NOT NULL,
  `max_amount` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `extra_first_deposit_bonus`
--

INSERT INTO `extra_first_deposit_bonus` (`id`, `first_deposit_ammount`, `bonus`, `max_amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 200, 10, 999, 1, '2024-04-29 08:22:29', '2024-04-29 08:22:29'),
(2, 1000, 100, 9999, 1, '2024-04-29 08:22:29', '2024-04-29 08:22:29'),
(3, 10000, 500, 49999, 1, '2024-04-29 08:23:20', '2024-04-29 08:23:20'),
(4, 50000, 5000, 99999, 1, '2024-04-29 08:23:20', '2024-04-29 08:23:20'),
(5, 100000, 10000, 0, 1, '2024-04-29 08:23:20', '2024-04-29 08:23:20');

-- --------------------------------------------------------

--
-- Table structure for table `extra_first_deposit_bonus_claim`
--

CREATE TABLE `extra_first_deposit_bonus_claim` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `extra_fdb_id` int(11) NOT NULL,
  `amount` double DEFAULT NULL,
  `bonus` double NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `extra_first_deposit_bonus_claim`
--

INSERT INTO `extra_first_deposit_bonus_claim` (`id`, `userid`, `extra_fdb_id`, `amount`, `bonus`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 2, 1000, 100, 0, '2026-01-27 10:21:06', '2026-01-27 10:21:06');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fundtransfer_subtype`
--

CREATE TABLE `fundtransfer_subtype` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` int(5) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fundtransfer_subtype`
--

INSERT INTO `fundtransfer_subtype` (`id`, `name`, `status`, `description`, `created_at`, `updated_at`) VALUES
(1, 'DAILY SALARY', 1, NULL, '2025-07-28 16:40:41', '2025-07-28 16:40:41'),
(2, 'MONTHLY SALARY', 1, NULL, '2025-07-28 16:40:41', '2025-07-28 16:40:41'),
(3, 'FIRST RECHARGE SELF BONUS', 1, NULL, '2025-07-28 16:40:41', '2025-07-28 16:40:41'),
(4, 'SECOND RECHARGE SELF BONUS', 1, NULL, '2025-07-28 16:40:41', '2025-07-28 16:40:41'),
(5, 'FIRST RECHARGE AGENT BONUS', 1, NULL, '2025-07-28 16:40:41', '2025-07-28 16:40:41'),
(6, 'ADVERTISEMENT SUPPORT', 1, NULL, '2025-07-28 16:40:41', '2025-07-28 16:40:41'),
(7, 'ADVANCE SALARY', 1, NULL, '2025-07-28 16:40:41', '2025-07-28 16:40:41'),
(8, 'ADD FUND WITH REMARK', 0, NULL, '2025-07-28 16:40:41', '2025-07-28 17:38:59'),
(9, 'DEDUCT FUND WITH REMARK', 0, NULL, '2025-07-28 16:40:41', '2025-07-28 17:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `fund_user_details`
--

CREATE TABLE `fund_user_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fund_user_details`
--

INSERT INTO `fund_user_details` (`id`, `user_id`, `amount`, `remark`, `type`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 200.00, 'Testing', 36, 'ADD FUND', '2026-02-23 11:03:05', '2026-02-23 11:03:05');

-- --------------------------------------------------------

--
-- Table structure for table `game_history`
--

CREATE TABLE `game_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `game_uid` varchar(255) NOT NULL,
  `game_round` varchar(255) NOT NULL,
  `bet_amount` decimal(10,2) NOT NULL,
  `win_amount` decimal(10,2) NOT NULL,
  `wallet_before` decimal(10,2) NOT NULL,
  `wallet_after` decimal(10,2) NOT NULL,
  `callback_time` datetime DEFAULT current_timestamp(),
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `game_id` int(11) DEFAULT 0,
  `game_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `game_history`
--

INSERT INTO `game_history` (`id`, `user_id`, `mobile`, `game_uid`, `game_round`, `bet_amount`, `win_amount`, `wallet_before`, `wallet_after`, `callback_time`, `created_at`, `updated_at`, `game_id`, `game_name`) VALUES
(1, 1, '1234567890', '76', '14382025502266244489', 0.20, 0.00, 987.00, 986.80, '2026-02-24 17:25:50', '2026-02-24 17:25:50', '2026-02-24 17:25:50', 76, 'Dragon Fortune'),
(3, 1, '1234567890', '468', '3369727448715638874', 1.00, 0.00, 986.80, 985.80, NULL, '2026-02-24 17:29:47', '2026-02-24 17:29:47', 468, 'Crazy Hunter'),
(4, 1, '1234567890', '468', '17448099472093099888', 1.00, 0.00, 985.80, 984.80, NULL, '2026-02-24 17:29:49', '2026-02-24 17:29:49', 468, 'Crazy Hunter'),
(5, 1, '1234567890', '468', '16569736965754076054', 2.00, 0.00, 984.80, 982.80, NULL, '2026-02-24 17:29:51', '2026-02-24 17:29:51', 468, 'Crazy Hunter'),
(6, 1, '1234567890', '468', '11463528554653498731', 4.00, 0.00, 982.80, 978.80, NULL, '2026-02-24 17:29:52', '2026-02-24 17:29:52', 468, 'Crazy Hunter'),
(7, 1, '1234567890', '468', '13738451486074024232', 3.00, 3.00, 978.80, 978.80, NULL, '2026-02-24 17:29:54', '2026-02-24 17:29:54', 468, 'Crazy Hunter'),
(8, 1, '1234567890', '468', '14208711604595536566', 3.00, 6.00, 978.80, 981.80, NULL, '2026-02-24 17:29:56', '2026-02-24 17:29:56', 468, 'Crazy Hunter'),
(9, 1, '1234567890', '468', '10244285786088881164', 1.00, 0.00, 981.80, 980.80, NULL, '2026-02-24 17:29:58', '2026-02-24 17:29:58', 468, 'Crazy Hunter'),
(10, 1, '1234567890', '468', '15681217425592369002', 2.00, 4.00, 980.80, 982.80, NULL, '2026-02-24 17:30:01', '2026-02-24 17:30:01', 468, 'Crazy Hunter'),
(11, 1, '1234567890', '468', '7023420032255671340', 2.00, 0.00, 982.80, 980.80, NULL, '2026-02-24 17:30:03', '2026-02-24 17:30:03', 468, 'Crazy Hunter'),
(12, 1, '1234567890', '468', '1271246888539076872', 3.00, 0.00, 980.80, 977.80, NULL, '2026-02-24 17:30:05', '2026-02-24 17:30:05', 468, 'Crazy Hunter'),
(13, 1, '1234567890', '468', '6096670623403292893', 1.00, 2.00, 977.80, 978.80, NULL, '2026-02-24 17:30:07', '2026-02-24 17:30:07', 468, 'Crazy Hunter'),
(14, 1, '1234567890', '468', '6032571044698667731', 1.00, 0.00, 978.80, 977.80, NULL, '2026-02-24 17:30:09', '2026-02-24 17:30:09', 468, 'Crazy Hunter'),
(15, 1, '1234567890', '468', '8207958912828322242', 5.00, 0.00, 977.80, 972.80, NULL, '2026-02-24 17:30:12', '2026-02-24 17:30:12', 468, 'Crazy Hunter'),
(16, 1, '1234567890', '468', '16400320013886567924', 4.00, 6.00, 972.80, 974.80, NULL, '2026-02-24 17:30:15', '2026-02-24 17:30:15', 468, 'Crazy Hunter'),
(17, 1, '1234567890', '468', '6365057168979213126', 5.00, 0.00, 974.80, 969.80, NULL, '2026-02-24 17:30:17', '2026-02-24 17:30:17', 468, 'Crazy Hunter'),
(18, 1, '1234567890', '468', '5321797209509410068', 2.00, 24.00, 969.80, 991.80, NULL, '2026-02-24 17:30:19', '2026-02-24 17:30:19', 468, 'Crazy Hunter'),
(19, 1, '1234567890', '3', '2814390760520432017', 4.00, 0.00, 991.80, 987.80, NULL, '2026-02-24 17:40:46', '2026-02-24 17:40:46', 3, 'Crazy Pusher'),
(20, 1, '1234567890', '3', '16354379080900359806', 8.00, 0.20, 987.80, 980.00, NULL, '2026-02-24 17:40:47', '2026-02-24 17:40:47', 3, 'Crazy Pusher'),
(21, 1, '1234567890', '3', '11785085532942382281', 6.00, 1.40, 980.00, 975.40, NULL, '2026-02-24 17:40:50', '2026-02-24 17:40:50', 3, 'Crazy Pusher'),
(22, 1, '1234567890', '3', '3533069592505237261', 10.00, 0.00, 975.40, 965.40, NULL, '2026-02-24 17:40:53', '2026-02-24 17:40:53', 3, 'Crazy Pusher'),
(23, 1, '1234567890', '3', '6839987966415417981', 10.00, 4.16, 965.40, 959.56, NULL, '2026-02-24 17:40:56', '2026-02-24 17:40:56', 3, 'Crazy Pusher'),
(24, 1, '1234567890', '3', '15510993621624372680', 8.00, 2.40, 959.56, 953.96, NULL, '2026-02-24 17:40:58', '2026-02-24 17:40:58', 3, 'Crazy Pusher'),
(25, 1, '1234567890', '3', '17564709223827062113', 2.00, 1.44, 953.96, 953.40, NULL, '2026-02-24 17:41:00', '2026-02-24 17:41:00', 3, 'Crazy Pusher'),
(26, 1, '1234567890', '3', '15837476757539142395', 0.00, 5.76, 953.40, 959.16, NULL, '2026-02-24 17:41:03', '2026-02-24 17:41:03', 3, 'Crazy Pusher'),
(27, 1, '1234567890', '3', '13351913406735531579', 6.00, 0.00, 959.16, 953.16, NULL, '2026-02-24 17:41:05', '2026-02-24 17:41:05', 3, 'Crazy Pusher'),
(28, 1, '1234567890', '42', '8254866166504633731', 2.00, 595.84, 953.16, 1547.00, NULL, '2026-02-24 17:41:51', '2026-02-24 17:41:51', 42, 'Fengshen');

-- --------------------------------------------------------

--
-- Table structure for table `game_rules`
--

CREATE TABLE `game_rules` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `game_rules`
--

INSERT INTO `game_rules` (`id`, `name`, `value`, `created_at`, `updated_at`, `status`) VALUES
(2, 'min_bet_amount', '1', '2025-06-13 07:28:46', '2025-08-20 09:38:05', 0),
(3, 'max_bet_amount', '16400', '2025-06-13 07:28:46', '2025-08-20 10:03:08', 0),
(6, 'min_recharge', '1500', '2025-06-13 07:28:46', '2025-08-20 10:03:41', 1),
(16, 'min_win', '100', '2025-06-13 07:28:46', '2025-08-20 10:03:44', 1),
(17, 'max_win', '5000', '2025-06-13 07:28:46', '2025-08-20 10:03:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `game_settings`
--

CREATE TABLE `game_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `betting_fees` decimal(10,2) NOT NULL,
  `rules` text NOT NULL,
  `winning_percentage` decimal(5,2) NOT NULL,
  `time` time NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `game_settings`
--

INSERT INTO `game_settings` (`id`, `name`, `image`, `betting_fees`, `rules`, `winning_percentage`, `time`, `status`, `created_at`, `updated_at`) VALUES
(1, 'wingo 30 Second', '', 10.00, '', 10.00, '00:00:30', 0, NULL, NULL),
(2, 'wingo 1 Minute', '', 10.00, '', 20.00, '00:00:30', 0, NULL, NULL),
(3, 'wingo 3 Minute', '', 10.00, '', 20.00, '00:00:30', 0, NULL, NULL),
(4, 'wingo 5 Minute', '', 10.00, '', 20.00, '00:00:30', 0, NULL, NULL),
(5, 'Aviator', '', 10.00, '', 20.00, '00:00:30', 0, NULL, NULL),
(6, 'Trx 1 Minute', '', 10.00, '', 30.00, '00:00:30', 0, NULL, NULL),
(7, 'Trx 3 Minute', '', 10.00, '', 30.00, '00:00:30', 0, NULL, NULL),
(8, 'Trx 5 Minute', '', 10.00, '', 30.00, '00:00:30', 0, NULL, NULL),
(9, 'Trx 10 minute', '', 10.00, '', 30.00, '00:00:30', 0, NULL, NULL),
(10, 'Dragon Tiger', '', 10.00, '', 20.00, '00:00:30', 0, NULL, NULL),
(11, 'Plinko ', '', 10.00, '', 30.00, '00:00:30', 0, NULL, NULL),
(12, 'Mine Game', '', 10.00, '', 30.00, '00:00:30', 0, NULL, NULL),
(13, 'Andar Bahar', '', 10.00, '', 50.00, '00:00:30', 0, NULL, NULL),
(14, 'Head Tail', '', 10.00, '', 20.00, '00:00:30', 0, NULL, NULL),
(15, '7 Up Down', '', 10.00, '', 20.00, '00:00:30', 0, NULL, NULL),
(16, 'Red & Black', '', 10.00, '', 20.00, '00:00:30', 0, NULL, NULL),
(17, 'Keno', '', 10.00, '', 20.00, '00:00:30', 0, NULL, NULL),
(18, 'Teen Patti', '', 10.00, '', 20.00, '00:00:30', 0, NULL, NULL),
(20, 'Dice', '', 10.00, '', 20.00, '00:00:30', 0, NULL, NULL),
(21, 'Titli kabootar', '', 10.00, '', 20.00, '00:00:30', 0, NULL, NULL),
(22, 'jhandimunda', '', 10.00, '', 20.00, '00:00:30', 0, NULL, NULL),
(23, 'Hot Air Baloon', '', 10.00, '', 20.00, '00:00:30', 0, NULL, NULL),
(24, 'High Low', '', 10.00, '', 20.00, '00:00:30', 0, NULL, NULL),
(25, 'Jackpot', '', 10.00, '', 20.00, '00:00:30', 0, NULL, NULL),
(26, 'Mini Roullete', '', 10.00, '', 20.00, '00:00:30', 0, NULL, NULL),
(27, 'Blockchain Lottery 1Hrs', '', 10.00, '', 20.00, '00:00:30', 1, NULL, NULL),
(28, 'Blockchain Lottery 3Hrs', '', 10.00, '', 20.00, '00:00:30', 1, NULL, NULL),
(29, 'Blockchain Lottery 24Hrs', '', 10.00, '', 20.00, '00:00:30', 1, NULL, NULL),
(30, 'K3 1 min', '', 10.00, '', 20.00, '00:00:30', 1, NULL, NULL),
(31, 'K3 3 min', '', 10.00, '', 20.00, '00:00:30', 1, NULL, NULL),
(32, 'K3 5 min', '', 10.00, '', 20.00, '00:00:30', 1, NULL, NULL),
(33, 'K3 10 min', '', 10.00, '', 20.00, '00:00:30', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `game_subcat_sliders`
--

CREATE TABLE `game_subcat_sliders` (
  `id` int(11) NOT NULL,
  `image` varchar(555) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `game_subcat_sliders`
--

INSERT INTO `game_subcat_sliders` (`id`, `image`, `created_at`, `updated_at`) VALUES
(1, 'https://root.nexwin.vip/public/game_subcat_sliders/1.jpg', '2025-11-24 06:27:28', '2025-11-24 06:27:28');

-- --------------------------------------------------------

--
-- Table structure for table `gift_cart`
--

CREATE TABLE `gift_cart` (
  `id` int(11) NOT NULL,
  `code` varchar(111) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `percentage` varchar(55) DEFAULT NULL,
  `description` varchar(555) DEFAULT NULL,
  `title` varchar(155) DEFAULT NULL,
  `subtitle` varchar(155) DEFAULT NULL,
  `number_people` int(11) DEFAULT NULL,
  `availed_num` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `datetime` datetime DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '1-loss, 2-win'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `gift_cart`
--

INSERT INTO `gift_cart` (`id`, `code`, `amount`, `percentage`, `description`, `title`, `subtitle`, `number_people`, `availed_num`, `status`, `datetime`, `expire_date`, `type`) VALUES
(1, 'FIRST20', 350, NULL, '350 rs bonus to everyone', 'first user bonus', NULL, 100, 4, 1, '2025-12-29 18:02:43', '2025-12-31', 2),
(2, 'LOSS5', 500, '5', '5% on your total loss', '5% loss back bonus', NULL, 20, 1, 1, '2025-12-29 18:06:10', '2025-12-31', 1),
(3, 'Loss10', NULL, '10', '10% loss back bonus', 'Loss back bonus', NULL, 20, 0, 1, '2025-12-29 20:10:06', '2025-12-31', 1),
(4, 'LOSS10', NULL, '10%', '10% Loss Back', 'Loss Back Bonus', NULL, 2, 0, 1, '2025-12-29 20:12:26', '2025-12-31', 1),
(5, 'Losss5', NULL, '5%', '5% Loss Back Bonus', 'Loss Back Bonus', NULL, 2, 0, 1, '2025-12-29 20:14:14', '2025-12-31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gift_claim`
--

CREATE TABLE `gift_claim` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `gift_code` varchar(250) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invite_bonus`
--

CREATE TABLE `invite_bonus` (
  `id` int(11) NOT NULL,
  `no_of_user` int(11) NOT NULL,
  `amount` double NOT NULL,
  `claim_amount` double NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1=pending,0=expire',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `invite_bonus`
--

INSERT INTO `invite_bonus` (`id`, `no_of_user`, `amount`, `claim_amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 500, 55, 1, '2024-12-24 11:50:44', '2024-12-24 11:50:44'),
(2, 3, 500, 155, 1, '2024-12-24 11:50:44', '2024-12-24 11:50:44'),
(3, 10, 500, 600, 1, '2024-12-24 11:50:44', '2024-12-24 11:50:44'),
(4, 30, 500, 1800, 1, '2024-12-24 11:50:44', '2024-12-24 11:50:44'),
(5, 50, 500, 3000, 1, '2024-12-24 11:50:44', '2024-12-24 11:50:44'),
(6, 100, 500, 6000, 1, '2024-12-24 11:50:44', '2024-12-24 11:50:44'),
(7, 200, 500, 12000, 1, '2024-12-24 11:50:44', '2024-12-24 11:50:44'),
(8, 500, 500, 30000, 1, '2024-12-24 11:50:44', '2024-12-24 11:50:44'),
(9, 1000, 500, 75000, 1, '2024-12-24 11:50:44', '2024-12-24 11:50:44'),
(10, 5000, 500, 400000, 1, '2024-12-24 11:50:44', '2024-12-24 11:50:44'),
(11, 10000, 500, 1000000, 1, '2024-12-24 11:50:44', '2024-12-24 11:50:44'),
(12, 20000, 500, 2000000, 1, '2024-12-24 11:50:44', '2024-12-24 11:50:44'),
(13, 50000, 500, 5000000, 1, '2024-12-24 11:50:44', '2024-12-24 11:50:44'),
(14, 100000, 500, 10000000, 1, '2024-12-24 11:50:44', '2024-12-24 11:50:44');

-- --------------------------------------------------------

--
-- Table structure for table `invite_bonus_claim`
--

CREATE TABLE `invite_bonus_claim` (
  `id` bigint(20) NOT NULL,
  `userid` smallint(6) NOT NULL,
  `invite_id` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ip_address`
--

CREATE TABLE `ip_address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `login_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ip_address`
--

INSERT INTO `ip_address` (`id`, `user_id`, `ip_address`, `login_time`, `created_at`, `updated_at`) VALUES
(1, 1, '49.43.117.171', '2026-02-23 13:40:56', '2026-02-23 13:40:56', '2026-02-23 13:40:56'),
(2, 1, '49.43.117.171', '2026-02-23 13:41:34', '2026-02-23 13:41:34', '2026-02-23 13:41:34'),
(3, 1, '49.43.117.171', '2026-02-23 13:42:53', '2026-02-23 13:42:53', '2026-02-23 13:42:53'),
(4, 1, '49.43.117.171', '2026-02-23 13:46:20', '2026-02-23 13:46:20', '2026-02-23 13:46:20'),
(5, 1, '49.43.117.171', '2026-02-23 13:48:47', '2026-02-23 13:48:47', '2026-02-23 13:48:47'),
(6, 1, '49.43.117.171', '2026-02-23 13:49:32', '2026-02-23 13:49:32', '2026-02-23 13:49:32'),
(7, 1, '49.43.117.171', '2026-02-23 13:49:49', '2026-02-23 13:49:49', '2026-02-23 13:49:49'),
(8, 1, '49.43.117.171', '2026-02-23 13:50:31', '2026-02-23 13:50:31', '2026-02-23 13:50:31'),
(9, 1, '49.43.117.171', '2026-02-23 13:50:57', '2026-02-23 13:50:57', '2026-02-23 13:50:57'),
(10, 1, '112.79.8.158', '2026-02-23 14:04:07', '2026-02-23 14:04:07', '2026-02-23 14:04:07'),
(11, 1, '49.43.117.171', '2026-02-23 14:43:31', '2026-02-23 14:43:31', '2026-02-23 14:43:31'),
(12, 1, '49.43.117.171', '2026-02-23 14:46:41', '2026-02-23 14:46:41', '2026-02-23 14:46:41'),
(13, 1, '49.43.117.171', '2026-02-23 16:32:44', '2026-02-23 16:32:44', '2026-02-23 16:32:44'),
(14, 4, '152.56.178.74', '2026-02-23 16:57:00', '2026-02-23 16:57:00', '2026-02-23 16:57:00'),
(15, 1, '49.43.117.171', '2026-02-23 17:18:42', '2026-02-23 17:18:42', '2026-02-23 17:18:42'),
(16, 4, '152.56.178.74', '2026-02-23 17:20:53', '2026-02-23 17:20:53', '2026-02-23 17:20:53'),
(17, 1, '152.56.178.74', '2026-02-23 23:56:29', '2026-02-23 23:56:29', '2026-02-23 23:56:29'),
(18, 1, '152.56.178.74', '2026-02-24 07:04:02', '2026-02-24 07:04:02', '2026-02-24 07:04:02'),
(19, 1, '110.227.60.245', '2026-02-24 07:46:56', '2026-02-24 07:46:56', '2026-02-24 07:46:56'),
(20, 1, '14.139.237.221', '2026-02-24 09:14:28', '2026-02-24 09:14:28', '2026-02-24 09:14:28'),
(21, 1, '49.43.117.83', '2026-02-24 11:02:23', '2026-02-24 11:02:23', '2026-02-24 11:02:23'),
(22, 1, '49.43.117.83', '2026-02-24 11:26:21', '2026-02-24 11:26:21', '2026-02-24 11:26:21'),
(23, 1, '49.43.117.83', '2026-02-24 13:01:59', '2026-02-24 13:01:59', '2026-02-24 13:01:59'),
(24, 2, '49.43.117.83', '2026-02-24 15:38:20', '2026-02-24 15:38:20', '2026-02-24 15:38:20'),
(25, 1, '49.43.117.83', '2026-02-24 15:52:45', '2026-02-24 15:52:45', '2026-02-24 15:52:45'),
(26, 1, '49.43.117.83', '2026-02-24 16:14:18', '2026-02-24 16:14:18', '2026-02-24 16:14:18'),
(27, 1, '152.56.178.74', '2026-02-24 16:40:28', '2026-02-24 16:40:28', '2026-02-24 16:40:28'),
(28, 2, '152.58.128.161', '2026-02-24 16:41:24', '2026-02-24 16:41:24', '2026-02-24 16:41:24'),
(29, 1, '110.227.61.16', '2026-02-24 16:48:34', '2026-02-24 16:48:34', '2026-02-24 16:48:34'),
(30, 1, '152.56.178.74', '2026-02-24 16:49:50', '2026-02-24 16:49:50', '2026-02-24 16:49:50'),
(31, 1, '152.56.178.74', '2026-02-24 16:53:26', '2026-02-24 16:53:26', '2026-02-24 16:53:26'),
(32, 1, '49.43.117.83', '2026-02-24 17:16:08', '2026-02-24 17:16:08', '2026-02-24 17:16:08'),
(33, 1, '49.43.117.83', '2026-02-24 17:24:29', '2026-02-24 17:24:29', '2026-02-24 17:24:29'),
(34, 1, '49.43.117.83', '2026-02-24 17:39:49', '2026-02-24 17:39:49', '2026-02-24 17:39:49');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`) VALUES
(1, 'English'),
(2, 'Hindi');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_04_17_095804_create_bets_table', 2),
(6, '2024_04_17_102816_create_account_details_table', 3),
(7, '2024_04_17_195608_create_payins_table', 4),
(8, '2024_04_17_201514_create_withdraw_histories_table', 5),
(9, '2024_04_18_044926_create_bet_results_table', 6),
(10, '2024_04_18_050653_create_transaction_histories_table', 7),
(11, '2024_04_18_051239_create_bet_logs_table', 8),
(12, '2024_04_18_051737_create_all_images_table', 9),
(13, '2024_04_18_053627_create_amount_lists_table', 10),
(14, '2024_04_18_054957_create_cards_table', 11),
(15, '2024_04_18_055803_create_check_ins_table', 12),
(16, '2024_04_18_060320_create_coupons_table', 13),
(20, '2024_04_18_061442_create_game_settings_table', 14),
(21, '2024_04_18_063107_create_mlm_levels_table', 14),
(22, '2024_04_18_070052_create_rules_table', 15),
(23, '2024_04_18_071435_create_settings_table', 16),
(24, '2024_04_18_072406_create_sliders_table', 17),
(25, '2024_04_18_073202_create_types_table', 18),
(26, '2024_04_18_073813_create_virtual_games_table', 19),
(27, '2024_04_18_074637_create_withdraw_amoumts_table', 20),
(28, '2024_04_18_081307_create_admin_settings_table', 21),
(29, '2024_04_18_081937_create_checkin_redeems_table', 22),
(30, '2026_01_14_145946_create_sessions_table', 23),
(31, '2026_01_14_150313_add_password_changed_at_to_users', 24);

-- --------------------------------------------------------

--
-- Table structure for table `minegame_bet`
--

CREATE TABLE `minegame_bet` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `multipler` varchar(155) DEFAULT NULL,
  `win_amount` double DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `tax` varchar(155) DEFAULT NULL,
  `after_tax` varchar(155) DEFAULT NULL,
  `orderid` varchar(155) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mine_multipliers`
--

CREATE TABLE `mine_multipliers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `multiplier` double(5,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `mine_multipliers`
--

INSERT INTO `mine_multipliers` (`id`, `name`, `multiplier`, `created_at`, `updated_at`) VALUES
(1, 'Mines: 1', 1.01, '2024-10-18 11:30:43', '2024-10-18 11:30:43'),
(2, 'Mines: 2', 1.05, '2024-10-18 11:31:34', '2024-10-18 11:31:34'),
(3, 'Mines: 3', 1.10, '2024-10-18 11:32:13', '2024-10-18 11:32:13'),
(4, 'Mines: 4', 1.15, '2024-10-18 11:32:42', '2024-10-18 11:32:42'),
(5, 'Mines: 5', 1.20, '2024-10-18 11:33:14', '2024-10-18 11:33:14'),
(6, 'Mines: 6', 1.25, '2024-10-18 11:34:34', '2024-10-18 11:34:34'),
(7, 'Mines: 7', 1.30, '2024-10-18 11:34:34', '2024-10-18 11:34:34'),
(8, 'Mines: 8', 1.40, '2024-10-18 11:30:43', '2024-10-18 11:30:43'),
(9, 'Mines: 9', 1.45, '2024-10-18 11:31:34', '2024-10-18 11:31:34'),
(10, 'Mines: 10', 1.55, '2024-10-18 11:32:13', '2024-10-18 11:32:13'),
(11, 'Mines: 11', 1.60, '2024-10-18 11:32:42', '2024-10-18 11:32:42'),
(12, 'Mines: 12', 1.65, '2024-10-18 11:33:14', '2024-10-18 11:33:14'),
(13, 'Mines: 13', 1.70, '2024-10-18 11:34:34', '2024-10-18 11:34:34'),
(14, 'Mines: 14', 1.75, '2024-10-18 11:34:34', '2024-10-18 11:34:34'),
(15, 'Mines: 15', 1.80, '2024-10-18 11:32:13', '2024-10-18 11:32:13'),
(16, 'Mines: 16', 1.85, '2024-10-18 11:32:42', '2024-10-18 11:32:42'),
(17, 'Mines: 17', 1.90, '2024-10-18 11:33:14', '2024-10-18 11:33:14'),
(18, 'Mines: 18', 1.95, '2024-10-18 11:34:34', '2024-10-18 11:34:34'),
(19, 'Mines: 19', 2.00, '2024-10-18 11:34:34', '2024-10-18 11:34:34'),
(20, 'Mines: 20', 2.10, '2024-10-18 11:34:34', '2024-10-18 11:34:34'),
(21, 'Mines: 21', 2.00, '2024-10-18 11:34:34', '2024-10-18 11:34:34'),
(22, 'Mines: 22', 2.15, '2024-10-18 11:34:34', '2024-10-18 11:34:34'),
(23, 'Mines: 23', 2.30, '2024-10-18 11:34:34', '2024-10-18 11:34:34'),
(24, 'Mines: 24', 2.50, '2024-10-18 11:34:34', '2024-10-18 11:34:34'),
(25, 'Mines: 25', 3.00, '2024-10-18 11:34:34', '2024-10-18 11:34:34');

-- --------------------------------------------------------

--
-- Table structure for table `mlm_levels`
--

CREATE TABLE `mlm_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `commission` float NOT NULL,
  `cashback` decimal(10,2) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mlm_levels`
--

INSERT INTO `mlm_levels` (`id`, `name`, `count`, `commission`, `cashback`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Level1', 1, 1.2, NULL, 0, '2024-12-10 07:59:52', '2024-12-10 07:59:52'),
(2, 'Level2', 2, 3, NULL, 0, '2024-12-10 07:59:52', '2024-12-10 07:59:52'),
(3, 'Level3', 3, 0.2, NULL, 0, '2024-12-10 08:00:15', '2024-12-10 08:00:15'),
(4, 'Level4', 4, 1, NULL, 0, '2024-12-16 10:44:43', '2024-12-16 10:44:43'),
(5, 'Level5', 5, 0.5, NULL, 0, '2024-12-16 10:45:03', '2024-12-16 10:45:03'),
(6, 'Level6', 6, 0.25, NULL, 0, '2024-12-16 10:45:24', '2024-12-16 10:45:24'),
(7, 'Level7', 7, 0.15, NULL, 0, '2024-12-16 10:46:35', '2024-12-16 10:46:35'),
(19, 'level8', 8, 1, NULL, 0, '2025-07-03 12:24:01', '2025-07-03 12:24:01');

-- --------------------------------------------------------

--
-- Table structure for table `multiplier`
--

CREATE TABLE `multiplier` (
  `id` int(11) NOT NULL,
  `multiplier` decimal(20,2) DEFAULT NULL,
  `frequency` varchar(30) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1-easy,2-medium,3-hard,4-hardcore',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `multiplier`
--

INSERT INTO `multiplier` (`id`, `multiplier`, `frequency`, `type`, `created_at`, `updated`) VALUES
(3, 1.13, '1', 1, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(4, 1.17, '1', 1, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(5, 1.23, '1', 1, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(6, 1.29, '1', 1, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(7, 1.36, '1', 1, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(8, 1.43, '1', 1, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(9, 1.53, '1', 1, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(12, 1.88, '1', 1, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(13, 2.04, '1', 1, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(14, 2.22, '1', 1, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(15, 2.45, '1', 1, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(16, 2.72, '1', 1, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(17, 3.06, '1', 1, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(18, 3.50, '1', 1, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(19, 4.08, '1', 1, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(20, 4.90, '1', 1, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(21, 6.13, '1', 1, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(22, 6.61, '1', 1, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(23, 9.81, '1', 1, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(24, 19.44, '1', 1, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(25, 1.12, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(26, 1.28, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(27, 1.47, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(28, 1.70, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(29, 1.98, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(30, 2.33, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(31, 2.76, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(32, 3.32, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(33, 4.03, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(34, 4.96, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(35, 6.20, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(36, 6.91, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(37, 8.90, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(38, 11.74, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(39, 15.99, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(40, 22.61, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(41, 33.58, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(42, 53.20, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(43, 92.17, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(44, 180.51, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(45, 451.71, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(46, 1788.80, '1', 2, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(47, 1.23, '2', 3, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(48, 1.55, '2', 3, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(49, 1.98, '2', 3, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(50, 2.56, '2', 3, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(51, 3.36, '2', 3, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(52, 4.49, '2', 3, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(53, 5.49, '2', 3, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(54, 7.53, '2', 3, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(55, 10.56, '2', 3, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(56, 15.21, '2', 3, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(57, 22.59, '2', 3, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(58, 34.79, '2', 3, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(59, 55.97, '2', 3, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(60, 94.99, '2', 3, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(61, 172.42, '2', 3, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(62, 341.40, '2', 3, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(63, 760.46, '2', 3, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(64, 2007.63, '2', 3, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(65, 6956.47, '2', 3, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(66, 41321.43, '2', 3, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(67, 1.63, '3', 4, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(68, 2.80, '3', 4, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(69, 4.95, '3', 4, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(70, 9.08, '3', 4, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(71, 15.21, '3', 4, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(72, 30.12, '3', 4, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(73, 62.96, '3', 4, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(74, 140.24, '3', 4, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(75, 337.19, '3', 4, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(76, 890.19, '3', 4, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(77, 2643.89, '3', 4, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(78, 9161.05, '3', 4, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(79, 39301.05, '3', 4, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(80, 233448.29, '3', 4, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(81, 2542251.93, '3', 4, '2025-06-20 04:42:43', '2025-06-20 04:42:43'),
(82, 11.03, NULL, 1, '2025-06-20 16:32:31', '2025-06-20 16:32:31'),
(83, 11111.03, '2', 4, '2025-06-20 16:39:03', '2025-06-20 16:39:03'),
(84, 1.03, '1', 1, '2025-06-26 06:08:27', '2025-06-26 06:08:27'),
(85, 500.00, '500', 4, '2025-07-12 13:13:33', '2025-07-12 13:13:33');

-- --------------------------------------------------------

--
-- Table structure for table `multipliers`
--

CREATE TABLE `multipliers` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `multiplier` int(11) NOT NULL,
  `image` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `multipliers`
--

INSERT INTO `multipliers` (`id`, `name`, `multiplier`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Umbrella', 11, 'https://root.winbhai.in/public/images/Amrela.png', '2025-02-12 11:06:32', '2025-02-12 11:06:32'),
(2, 'Ball', 11, 'https://root.winbhai.in/public/images/Ball.png', '2025-02-12 11:06:32', '2025-02-12 11:06:32'),
(3, 'Sun', 11, 'https://root.winbhai.in/public/images/sun.png', '2025-02-12 11:07:05', '2025-02-12 11:07:05'),
(4, 'Lamp', 11, 'https://root.winbhai.in/public/images/Lamp.png', '2025-02-12 11:07:05', '2025-02-12 11:07:05'),
(5, 'Cow', 11, 'https://root.winbhai.in/public/images/Cow.png', '2025-02-12 11:14:06', '2025-02-12 11:14:06'),
(6, 'Bucket', 11, 'https://root.winbhai.in/public/images/WatterDoll.png', '2025-02-12 11:14:06', '2025-02-12 11:14:06'),
(7, 'Kite', 11, 'https://root.winbhai.in/public/images/Kite.png', '2025-02-12 11:14:06', '2025-02-12 11:14:06'),
(8, 'Gariyo', 11, 'https://root.winbhai.in/public/images/Gariyo.png', '2025-02-12 11:14:06', '2025-02-12 11:14:06'),
(9, 'Rose', 11, 'https://root.winbhai.in/public/images/Rose.png', '2025-02-12 11:22:34', '2025-02-12 11:22:34'),
(10, 'Butterfly', 11, 'https://root.winbhai.in/public/images/Butterfly.png', '2025-02-12 11:22:34', '2025-02-12 11:22:34'),
(11, 'Egle', 11, 'https://root.winbhai.in/public/images/Egle.png', '2025-02-12 11:22:34', '2025-02-12 11:22:34'),
(12, 'Rabit', 11, 'https://root.winbhai.in/public/images/Rebit.png', '2025-02-12 11:22:34', '2025-02-12 11:22:34');

-- --------------------------------------------------------

--
-- Table structure for table `Notice`
--

CREATE TABLE `Notice` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `content` varchar(555) NOT NULL,
  `image` varchar(256) NOT NULL,
  `status` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Notice`
--

INSERT INTO `Notice` (`id`, `title`, `content`, `image`, `status`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Welcome', 'Welcome to the Game', 'https://root.nexwin.vip/notice/winbhai.png', 1, 1, '2025-02-22 11:34:31', '2025-02-22 11:34:31');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `disc` longtext DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `name`, `disc`, `status`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Notification', '<p>Welcome to NexWIn</p>', 1, 'https://root.nexwin.vip/admin/uploads/icons/icon1.png', '2024-12-10 08:22:28', '2024-12-10 08:22:28'),
(9, NULL, 'More Play More Win!', 1, NULL, '2024-12-10 08:22:28', '2024-12-10 08:22:28'),
(14, 'SIGN UP', 'Congratulations User\r\n\r\nWelcome to the ultimate gaming experience! You\'ve just unlocked a new level by joining WinBhai, and we are glad to see you on our amazing gaming platform.\r\n\r\nGet ready to dive into epic gameplay, compete with players from around the world, and discover tons of exclusive content and rewards.\r\n\r\n Your adventure starts now!  Here’s to countless victories, unforgettable moments, and enjoy level achievement every day!\r\n\r\nLet the games begin! \r\n\r\nThe WinBhaiTeam\r\n       .....', 1, NULL, '2024-12-10 08:22:28', '2024-12-10 08:22:28'),
(15, 'Deposit', 'Dear users,\r\n\r\nPlease wait for some time after recharge, do not back or refresh the page until the payment is successful.\r\nThanks.', 1, NULL, '2025-01-16 14:19:48', '2025-01-16 14:19:48');

-- --------------------------------------------------------

--
-- Table structure for table `notifications_login`
--

CREATE TABLE `notifications_login` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `disc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notifications_login`
--

INSERT INTO `notifications_login` (`id`, `user_id`, `name`, `disc`, `status`, `image`, `created_at`, `updated_at`) VALUES
(1, 3, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-23 11:29:52 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-23 11:29:52', '2026-02-23 11:29:52'),
(2, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-23 13:30:22 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-23 13:30:22', '2026-02-23 13:30:22'),
(3, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-23 13:40:56 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-23 13:40:56', '2026-02-23 13:40:56'),
(4, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-23 13:41:34 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-23 13:41:34', '2026-02-23 13:41:34'),
(5, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-23 13:42:53 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-23 13:42:53', '2026-02-23 13:42:53'),
(6, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-23 13:46:20 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-23 13:46:20', '2026-02-23 13:46:20'),
(7, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-23 13:48:47 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-23 13:48:47', '2026-02-23 13:48:47'),
(8, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-23 13:49:32 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-23 13:49:32', '2026-02-23 13:49:32'),
(9, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-23 13:49:49 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-23 13:49:49', '2026-02-23 13:49:49'),
(10, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-23 13:50:31 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-23 13:50:31', '2026-02-23 13:50:31'),
(11, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-23 13:50:57 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-23 13:50:57', '2026-02-23 13:50:57'),
(12, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-23 14:04:07 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-23 14:04:07', '2026-02-23 14:04:07'),
(13, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-23 14:43:31 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-23 14:43:31', '2026-02-23 14:43:31'),
(14, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-23 14:46:41 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-23 14:46:41', '2026-02-23 14:46:41'),
(15, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-23 16:32:44 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-23 16:32:44', '2026-02-23 16:32:44'),
(16, 4, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-23 16:57:00 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-23 16:57:00', '2026-02-23 16:57:00'),
(17, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-23 17:18:42 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-23 17:18:42', '2026-02-23 17:18:42'),
(18, 4, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-23 17:20:53 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-23 17:20:53', '2026-02-23 17:20:53'),
(19, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-23 23:56:29 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-23 23:56:29', '2026-02-23 23:56:29'),
(20, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-24 07:04:02 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-24 07:04:02', '2026-02-24 07:04:02'),
(21, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-24 07:46:56 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-24 07:46:56', '2026-02-24 07:46:56'),
(22, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-24 09:14:28 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-24 09:14:28', '2026-02-24 09:14:28'),
(23, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-24 11:02:23 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-24 11:02:23', '2026-02-24 11:02:23'),
(24, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-24 11:26:21 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-24 11:26:21', '2026-02-24 11:26:21'),
(25, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-24 13:01:59 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-24 13:01:59', '2026-02-24 13:01:59'),
(26, 2, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-24 15:38:20 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-24 15:38:20', '2026-02-24 15:38:20'),
(27, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-24 15:52:45 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-24 15:52:45', '2026-02-24 15:52:45'),
(28, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-24 16:14:18 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-24 16:14:18', '2026-02-24 16:14:18'),
(29, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-24 16:40:28 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-24 16:40:28', '2026-02-24 16:40:28'),
(30, 2, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-24 16:41:24 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-24 16:41:24', '2026-02-24 16:41:24'),
(31, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-24 16:48:34 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-24 16:48:34', '2026-02-24 16:48:34'),
(32, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-24 16:49:50 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-24 16:49:50', '2026-02-24 16:49:50'),
(33, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-24 16:53:26 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-24 16:53:26', '2026-02-24 16:53:26'),
(34, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-24 17:16:08 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-24 17:16:08', '2026-02-24 17:16:08'),
(35, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-24 17:24:29 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-24 17:24:29', '2026-02-24 17:24:29'),
(36, 1, 'LOGIN JANKAARI', 'Aapka khaata 2026-02-24 17:39:49 par login kiya gaya hai. \nYadi yeh aap nahi hain, turant support se sampark karein.', NULL, NULL, '2026-02-24 17:39:49', '2026-02-24 17:39:49');

-- --------------------------------------------------------

--
-- Table structure for table `notification_admin`
--

CREATE TABLE `notification_admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purpose` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `send_to` enum('single','all') DEFAULT 'single',
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otp_pack_history`
--

CREATE TABLE `otp_pack_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `otp_pack_id` bigint(20) UNSIGNED NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `used_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `otp_pack_history`
--

INSERT INTO `otp_pack_history` (`id`, `otp_pack_id`, `mobile`, `used_at`) VALUES
(1, 1, '1234512345', '2026-02-23 16:14:37'),
(2, 1, '1234567890', '2026-02-23 16:25:27'),
(3, 1, '1234567890', '2026-02-23 16:25:39'),
(4, 1, '7800302707', '2026-02-23 16:26:29'),
(5, 1, '8889424663', '2026-02-24 07:42:34');

-- --------------------------------------------------------

--
-- Table structure for table `otp_sms`
--

CREATE TABLE `otp_sms` (
  `id` int(11) NOT NULL,
  `opt_pack` int(11) NOT NULL,
  `remaining_otp` int(11) NOT NULL,
  `status` varchar(155) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `otp_sms`
--

INSERT INTO `otp_sms` (`id`, `opt_pack`, `remaining_otp`, `status`, `datetime`) VALUES
(1, 5000, 4995, '1', '2026-01-07 11:54:05');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payins`
--

CREATE TABLE `payins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `cash` decimal(10,2) NOT NULL,
  `usdt_amount` float DEFAULT NULL,
  `extra_cash` decimal(10,2) DEFAULT NULL,
  `bonus` varchar(20) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `redirect_url` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '0- crypto, 1-bappa, 2- Manual, 3- whatsapp',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=pending,2=success,3=reject',
  `typeimage` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(555) DEFAULT NULL COMMENT 'Hash id of ethereum',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `mid` varchar(100) DEFAULT NULL,
  `txn_id` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `raw_response` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_limits`
--

CREATE TABLE `payment_limits` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` float(10,2) NOT NULL,
  `status` int(2) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `payment_limits`
--

INSERT INTO `payment_limits` (`id`, `name`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 'INR_minimum_deposit', 111.00, 1, '2025-01-31 05:26:56', '2026-02-23 11:11:21'),
(2, 'INR_maximum_deposit', 100000.00, 1, '2025-01-31 05:28:13', '2025-02-06 11:33:26'),
(3, 'INR_minimum_withdraw', 300.00, 1, '2025-01-31 05:28:58', '2025-02-06 11:32:58'),
(4, 'INR_maximum_withdraw', 100000.00, 1, '2025-01-31 05:28:58', '2025-12-20 22:58:21'),
(9, 'USDT_minimum_deposit', 10.00, 1, '2025-01-31 05:28:58', '2025-11-11 15:36:50'),
(10, 'USDT_maximum_deposit', 5000.00, 1, '2025-01-31 05:28:58', '2025-01-31 10:21:16'),
(11, 'USDT_minimum_withdraw', 10.00, 1, '2025-01-31 05:28:58', '2025-01-31 09:25:31'),
(12, 'USDT_maximum_withdraw', 5000.00, 1, '2025-01-31 05:28:58', '2025-01-31 09:25:41'),
(13, 'deposit_conversion_rate USDT', 96.00, 1, '2025-01-31 05:28:58', '2025-11-12 10:19:56'),
(14, 'Withdraw Conversion Rate USDT', 94.00, 1, '2025-01-31 05:28:58', '2026-02-24 12:19:35');

-- --------------------------------------------------------

--
-- Table structure for table `payzaar_callback`
--

CREATE TABLE `payzaar_callback` (
  `id` int(11) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pay_modes`
--

CREATE TABLE `pay_modes` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pay_modes`
--

INSERT INTO `pay_modes` (`id`, `name`, `image`, `status`, `type`) VALUES
(1, 'Manual', 'https://root.nexwin.vip/uploads/manual_winbhai.jpeg', 1, '2'),
(2, 'Crypto', 'https://root.nexwin.vip/uploads/crypto_winbhai.png', 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 1, NULL, NULL),
(2, 'Game List', 1, NULL, NULL),
(3, 'Attendance', 1, NULL, NULL),
(4, 'Players', 1, NULL, NULL),
(5, 'MLM Levels', 1, NULL, NULL),
(6, 'Color Prediction', 1, NULL, NULL),
(7, 'Aviator Game', 1, NULL, NULL),
(8, 'Bet History', 1, NULL, NULL),
(9, 'Chicken Road Game', 1, NULL, NULL),
(12, 'Assign Role', 0, NULL, NULL),
(13, 'role_permission', 0, NULL, NULL),
(14, 'gift', 1, NULL, NULL),
(15, 'Gift redeemed history', 1, NULL, NULL),
(16, 'Activity And Banner', 1, NULL, NULL),
(17, 'Agent', 0, NULL, NULL),
(18, 'Deposit', 1, NULL, NULL),
(20, 'Withdrawal', 1, NULL, NULL),
(21, 'Usdt Qr code', 1, NULL, NULL),
(22, 'Usdt Deposit', 1, NULL, NULL),
(23, 'Usdt Withdrawal', 1, NULL, NULL),
(24, 'Notice', 1, NULL, NULL),
(25, 'Settings', 1, NULL, NULL),
(26, 'Support Settings', 1, NULL, NULL),
(27, 'Change password', 1, NULL, NULL),
(28, 'Logout', 1, NULL, NULL),
(29, 'Ajent', 0, NULL, NULL),
(35, 'Manual Deposit', 1, NULL, NULL),
(36, 'Manual Withdrawal', 1, NULL, NULL),
(37, 'Manual_qr', 1, NULL, NULL),
(38, 'usdt_conversion', 1, NULL, NULL),
(39, 'Demo User', 0, NULL, NULL),
(40, 'campaign', 1, NULL, NULL),
(41, 'Conversion', 1, NULL, NULL),
(42, 'feedback', 1, NULL, NULL),
(43, 'sponser', 1, NULL, NULL),
(44, 'paymode_show', 1, NULL, NULL),
(45, 'offer', 1, NULL, NULL),
(47, 'revenue', 1, NULL, NULL),
(48, 'game_slider_img', 1, NULL, NULL),
(49, 'agent_players', 0, NULL, NULL),
(50, 'category_language', 1, NULL, NULL),
(51, 'notification_admin', 1, NULL, NULL),
(52, 'fund_transfer', 1, NULL, NULL),
(53, 'illegalUsers', 1, NULL, NULL),
(54, 'System_User', 1, NULL, NULL),
(55, 'ip_address', 1, NULL, NULL),
(56, 'ip_logs_today', 1, NULL, NULL),
(57, 'otp_history', 1, NULL, NULL),
(58, 'notification_admin', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions_users`
--

CREATE TABLE `permissions_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permissions_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`permissions_id`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions_users`
--

INSERT INTO `permissions_users` (`id`, `role_id`, `permissions_id`, `created_at`, `updated_at`) VALUES
(1, 1, '{\"Admin\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\"],\"Agents\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"39\"]}', '2025-09-30 07:20:49', '2025-09-30 13:29:17'),
(2, 2, '[\"1\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\"]', '2025-09-30 07:21:08', '2025-09-30 07:21:14');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
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
(1, 'App\\Models\\User', 1, 'UserApp', '703b7088e4ca4a3373bb4b672becf825099e9356e8e877e6bb30019f87189204', '[\"*\"]', NULL, NULL, '2026-01-23 10:35:21', '2026-01-23 10:35:21'),
(2, 'App\\Models\\User', 1, 'UserApp', '50363bb2cabc77df06d440d301b795b85454ccd55279d84dedce1037a25d6783', '[\"*\"]', NULL, NULL, '2026-01-23 14:47:01', '2026-01-23 14:47:01'),
(3, 'App\\Models\\User', 2, 'UserApp', 'f737027e13adc743756de99e6f5e9382d23f0da672dad9d031f2f2b1dcc68e7c', '[\"*\"]', NULL, NULL, '2026-01-24 12:40:02', '2026-01-24 12:40:02'),
(4, 'App\\Models\\User', 3, 'UserApp', '02049aa64495fce7ff9bbf49d8e5cfdd16ddf9f5e3373a474e13fc64a1d4b454', '[\"*\"]', NULL, NULL, '2026-01-24 14:16:06', '2026-01-24 14:16:06'),
(5, 'App\\Models\\User', 1, 'UserApp', '10397ae45be7edb59e7c782b20fd35dd41e2313c9cc90f1e84bdaf6e1368b750', '[\"*\"]', NULL, NULL, '2026-01-24 20:07:55', '2026-01-24 20:07:55'),
(6, 'App\\Models\\User', 1, 'UserApp', '9c829466a03f130bc19814d3666c73a971475432a3ee8a4abb2a1e7a06652dcc', '[\"*\"]', NULL, NULL, '2026-01-24 21:12:28', '2026-01-24 21:12:28'),
(7, 'App\\Models\\User', 4, 'UserApp', '7732c8ada0f1db13f2db519d56e2d81a477c903e29492b4ced4e5b0623f62c03', '[\"*\"]', NULL, NULL, '2026-01-25 20:13:53', '2026-01-25 20:13:53'),
(8, 'App\\Models\\User', 2, 'UserApp', '6c7f227705f3d3a3966e47a561b9b74b6f42fbc171f56aafe923441a60b55282', '[\"*\"]', NULL, NULL, '2026-01-25 21:19:48', '2026-01-25 21:19:48'),
(9, 'App\\Models\\User', 1, 'UserApp', '72266045606bc9ec82d4db80f78b120f97785b4b414bac57b21e002d1bc52f8b', '[\"*\"]', NULL, NULL, '2026-01-26 16:06:31', '2026-01-26 16:06:31'),
(10, 'App\\Models\\User', 5, 'UserApp', '3b56a87f39483e1e5be66bbb9364f806c9dbd38611220803c276768a455999af', '[\"*\"]', NULL, NULL, '2026-01-26 16:22:22', '2026-01-26 16:22:22'),
(11, 'App\\Models\\User', 6, 'UserApp', 'd26111ab5359a3027b7fa36746d872b2357120d2a3d2fcc0926d67f54fc73d3e', '[\"*\"]', NULL, NULL, '2026-01-26 17:31:02', '2026-01-26 17:31:02'),
(12, 'App\\Models\\User', 2, 'UserApp', 'ef295a1327c184e6c9cd201e878cba7069aac525b9a719d6efbff4406cef28c9', '[\"*\"]', NULL, NULL, '2026-01-27 07:52:01', '2026-01-27 07:52:01'),
(13, 'App\\Models\\User', 5, 'UserApp', 'c2af42f42ce2dfb66be6bf4fea9a48f6f008178496410a78ec095df50dfc662f', '[\"*\"]', NULL, NULL, '2026-01-27 10:19:40', '2026-01-27 10:19:40'),
(14, 'App\\Models\\User', 2, 'UserApp', 'cd03afd26c45ddee5beac019cda81bba2ea62d495f81eee80f2f06cdf00fd825', '[\"*\"]', NULL, NULL, '2026-01-27 21:15:45', '2026-01-27 21:15:45'),
(15, 'App\\Models\\User', 2, 'UserApp', 'dc4c2f00318207a69696c31695365f2df98ecec24f7766b473a91fa7e09ee0bc', '[\"*\"]', NULL, NULL, '2026-01-27 21:21:57', '2026-01-27 21:21:57'),
(16, 'App\\Models\\User', 1, 'UserApp', '6a01de38073cdb5e254b58b1a6dd475e436d9ab2542ae3c9c5b21bca58805745', '[\"*\"]', NULL, NULL, '2026-01-28 10:47:39', '2026-01-28 10:47:39'),
(17, 'App\\Models\\User', 2, 'UserApp', 'c8d038dd4b460d8d1acd6a86c1a953e04efde103245f5a71992fa7bdf75c4420', '[\"*\"]', NULL, NULL, '2026-01-28 13:14:43', '2026-01-28 13:14:43'),
(18, 'App\\Models\\User', 1, 'UserApp', '5404c788a2f2cf41b7ae739c519359c17467e963c7e03105201c1611d976468f', '[\"*\"]', NULL, NULL, '2026-01-28 15:26:27', '2026-01-28 15:26:27'),
(19, 'App\\Models\\User', 2, 'UserApp', 'f84b5b47c30a057db0cd8e3dadf713283d0f8bff19ae086c9146ae0461d9e113', '[\"*\"]', NULL, NULL, '2026-01-28 15:31:44', '2026-01-28 15:31:44'),
(20, 'App\\Models\\User', 2, 'UserApp', '8737a2ec6c6f4ffd0822ae327e0098f8d13e21eb91f01638245634c57b25d2f3', '[\"*\"]', NULL, NULL, '2026-01-28 18:42:28', '2026-01-28 18:42:28'),
(21, 'App\\Models\\User', 2, 'UserApp', '4de428d8ec1f5e354e9aa9caec60df4be5d662323618db561164c30924b5bbdb', '[\"*\"]', NULL, NULL, '2026-01-28 19:43:59', '2026-01-28 19:43:59'),
(22, 'App\\Models\\User', 2, 'UserApp', '33ce03ddc247bbcf7869a4249e55d704077c7b8d2283af64464a440f927b8ca0', '[\"*\"]', NULL, NULL, '2026-01-28 22:26:12', '2026-01-28 22:26:12'),
(23, 'App\\Models\\User', 7, 'UserApp', '4519cb42637f28926c1d816f8eaf515eebbead8f4da22a5cfb024aa19951d2df', '[\"*\"]', NULL, NULL, '2026-01-29 00:13:37', '2026-01-29 00:13:37'),
(24, 'App\\Models\\User', 8, 'UserApp', '1d5622b17138193ce87c646875f45a55273146e49dc5cb1f6f941f13a71f1fde', '[\"*\"]', NULL, NULL, '2026-01-29 06:13:46', '2026-01-29 06:13:46'),
(25, 'App\\Models\\User', 2, 'UserApp', '0d9bbdec03346e36b1533c758bf3e2dcc514e5afb215e17742f8c1c6864f9b61', '[\"*\"]', NULL, NULL, '2026-01-31 11:41:47', '2026-01-31 11:41:47'),
(26, 'App\\Models\\User', 2, 'UserApp', '9eb7de68ede46aa587f472dafb67f1103ac1ab787e4e335d556551934b275ac9', '[\"*\"]', NULL, NULL, '2026-01-31 11:44:10', '2026-01-31 11:44:10'),
(27, 'App\\Models\\User', 2, 'UserApp', '5181d77ddd9d32bbda358481a902e9ce19ddc7ff6ed978b39fec30af781039c3', '[\"*\"]', NULL, NULL, '2026-01-31 12:04:52', '2026-01-31 12:04:52'),
(28, 'App\\Models\\User', 2, 'UserApp', 'a5ef0f4821470ef57ea9e5c12f6caa235fc232f480989d748221570930fd50b2', '[\"*\"]', NULL, NULL, '2026-01-31 19:41:53', '2026-01-31 19:41:53'),
(29, 'App\\Models\\User', 2, 'UserApp', '59c2303c02fb77d6fda66a23eb6b112371fa2a471948b1ae346cd05d4af00e49', '[\"*\"]', NULL, NULL, '2026-02-01 03:00:43', '2026-02-01 03:00:43'),
(30, 'App\\Models\\User', 9, 'UserApp', 'bfdd73ad7a71355dbdf64a2c219eb44f17bcbc107b68ae99ccb6d189f0fadf2b', '[\"*\"]', NULL, NULL, '2026-02-01 09:20:08', '2026-02-01 09:20:08'),
(31, 'App\\Models\\User', 2, 'UserApp', 'eb23932fc5e0ae41fb790214c7638e67e7f07f6b930e85863e2282878fda479b', '[\"*\"]', NULL, NULL, '2026-02-03 18:44:33', '2026-02-03 18:44:33'),
(32, 'App\\Models\\User', 2, 'UserApp', 'cd5351b348ef56393d7fc5fe4521498bf90ef363ed840c35c7df070eb3591779', '[\"*\"]', NULL, NULL, '2026-02-03 19:09:52', '2026-02-03 19:09:52'),
(33, 'App\\Models\\User', 2, 'UserApp', '40b0384b9ca584943da3c6468b0bf89c3da0a1f4087908972c125e68305987e1', '[\"*\"]', NULL, NULL, '2026-02-03 19:59:15', '2026-02-03 19:59:15'),
(34, 'App\\Models\\User', 1, 'UserApp', 'f4dae479ceb39e422c049c029e402c6281abab1613d3ee167d7a01f9fb3622ac', '[\"*\"]', NULL, NULL, '2026-02-04 10:14:24', '2026-02-04 10:14:24'),
(35, 'App\\Models\\User', 1, 'UserApp', '1b9fad93b49d458b9d14f5beba15d6fd866a2239fa6126c3e404b3ae515bbd7c', '[\"*\"]', NULL, NULL, '2026-02-04 10:29:45', '2026-02-04 10:29:45'),
(36, 'App\\Models\\User', 1, 'UserApp', 'ae7373fe552d30a1c8bad252aa44ec0bf23a0e2a78a2347d6e7bfcce288761d7', '[\"*\"]', NULL, NULL, '2026-02-04 10:47:19', '2026-02-04 10:47:19'),
(37, 'App\\Models\\User', 10, 'UserApp', 'a8a13e780e8a62f6257860c08b38825d59ea1794db2c46ae631895b0487837fa', '[\"*\"]', NULL, NULL, '2026-02-04 12:04:04', '2026-02-04 12:04:04'),
(38, 'App\\Models\\User', 1, 'UserApp', 'e31f4be1587d6acfa35a2ed19baa303f08daf77cb6f2e02fb26d2187ae7622d8', '[\"*\"]', NULL, NULL, '2026-02-06 09:52:09', '2026-02-06 09:52:09'),
(39, 'App\\Models\\User', 2, 'UserApp', '0a36a125ee23858a63ab6859444565b11e7db9506ee1e365bcb73c87cfda33c0', '[\"*\"]', NULL, NULL, '2026-02-06 09:56:44', '2026-02-06 09:56:44'),
(40, 'App\\Models\\User', 1, 'UserApp', 'db38a7f72cde466ab22f341404683abd4f64ebb2091f3bdad634a8191e600b35', '[\"*\"]', NULL, NULL, '2026-02-06 11:34:22', '2026-02-06 11:34:22'),
(41, 'App\\Models\\User', 1, 'UserApp', '2e9fe3cf4881f99c805bcbcf141ae6a97273324480b29ede79e75fcfcce4599e', '[\"*\"]', NULL, NULL, '2026-02-07 17:17:57', '2026-02-07 17:17:57'),
(42, 'App\\Models\\User', 1, 'UserApp', 'e89690711a67382effba496b199647bf7815bd9c70c613664f01caf9bd394356', '[\"*\"]', NULL, NULL, '2026-02-07 17:29:54', '2026-02-07 17:29:54'),
(43, 'App\\Models\\User', 3, 'UserApp', '1a0245205f1d13c85133de4d5dbc47b937b156a250ab70317cbaff1c1c2419de', '[\"*\"]', NULL, NULL, '2026-02-08 10:35:39', '2026-02-08 10:35:39'),
(44, 'App\\Models\\User', 2, 'UserApp', 'ff313f08043a4b19525e1f55f5999ba86292762395552a53957573b9411df15d', '[\"*\"]', NULL, NULL, '2026-02-08 17:06:58', '2026-02-08 17:06:58'),
(45, 'App\\Models\\User', 1, 'UserApp', 'e8059a5de4694742e2fd221df17c8339bbaa5661d37341c91474d16291f255dc', '[\"*\"]', NULL, NULL, '2026-02-10 10:00:01', '2026-02-10 10:00:01'),
(46, 'App\\Models\\User', 1, 'UserApp', '91399f9f3f92b30225410b62c804e37a87bbad0c07cc9c68ce562fee69dc2e44', '[\"*\"]', NULL, NULL, '2026-02-11 19:38:02', '2026-02-11 19:38:02'),
(47, 'App\\Models\\User', 2, 'UserApp', '6c6b9b1671844a61ff04c566abc566dc826784740344b81c9a5c3e9a48d68427', '[\"*\"]', NULL, NULL, '2026-02-11 20:27:35', '2026-02-11 20:27:35'),
(48, 'App\\Models\\User', 2, 'UserApp', '6fa6c38d78aadba08d6286d8d730eea8f7ecad5fa29274bb007eec73e8e894f1', '[\"*\"]', NULL, NULL, '2026-02-12 13:45:05', '2026-02-12 13:45:05'),
(49, 'App\\Models\\User', 1, 'UserApp', '1c1e2aaf0598c63d54790be0289ee7f3204c5b1e67c2a09263927a3907ca6292', '[\"*\"]', NULL, NULL, '2026-02-12 19:11:55', '2026-02-12 19:11:55'),
(50, 'App\\Models\\User', 2, 'UserApp', '247114435f2c0e4c50f923cac57ea28c9c60b1e5c949ba0c47981c72207494b8', '[\"*\"]', NULL, NULL, '2026-02-14 13:48:02', '2026-02-14 13:48:02'),
(51, 'App\\Models\\User', 1, 'UserApp', '77339d74af5d47a318dfe8fd1e9043accfe681d4d061930307cc039e942ebdbd', '[\"*\"]', NULL, NULL, '2026-02-14 18:02:52', '2026-02-14 18:02:52'),
(52, 'App\\Models\\User', 1, 'UserApp', '103ef20b2bad64122cbbd7542a81c84a6505374f0924682e6b6d02ed1e880a08', '[\"*\"]', NULL, NULL, '2026-02-15 04:04:13', '2026-02-15 04:04:13'),
(53, 'App\\Models\\User', 1, 'UserApp', 'f0498ef92218789b8698a3bd220f5013d6e7bcc5295b29e8c26eb40e27d36009', '[\"*\"]', NULL, NULL, '2026-02-15 10:19:07', '2026-02-15 10:19:07'),
(54, 'App\\Models\\User', 1, 'UserApp', 'e313786ad801a3408f0bbb8dfd600e7768aeaa7a3857c062fce8a4f4d2c44c3f', '[\"*\"]', NULL, NULL, '2026-02-16 00:03:16', '2026-02-16 00:03:16'),
(55, 'App\\Models\\User', 1, 'UserApp', '06f4d97cbfca4ee65c38e1806e635189da67b773d2b04c8730323b47d775d2ac', '[\"*\"]', NULL, NULL, '2026-02-16 10:25:28', '2026-02-16 10:25:28'),
(56, 'App\\Models\\User', 1, 'UserApp', '6050bcc40c11a368e4d50be50a2602026126b1602527168cb19f4d58c5a4cf36', '[\"*\"]', NULL, NULL, '2026-02-16 12:01:01', '2026-02-16 12:01:01'),
(57, 'App\\Models\\User', 1, 'UserApp', '03489a5c292472ea8ea46f052e6232d49ca37662eeeebf9167a9de6108130183', '[\"*\"]', NULL, NULL, '2026-02-16 12:35:21', '2026-02-16 12:35:21'),
(58, 'App\\Models\\User', 1, 'UserApp', '3fe02b536d6b0a32c9a3e3e5fb7bd233ad4c07ed5b1966f0b4b3624cc4b1fd14', '[\"*\"]', NULL, NULL, '2026-02-16 13:11:34', '2026-02-16 13:11:34'),
(59, 'App\\Models\\User', 2, 'UserApp', '08a25f4dbc666a8de9cdc81ec41a984fd7caa4523250c38c3a191669a2b40531', '[\"*\"]', NULL, NULL, '2026-02-17 12:02:32', '2026-02-17 12:02:32'),
(60, 'App\\Models\\User', 1, 'UserApp', 'e00ee10dd24aba5c164316082c0c3b5e3ece2bcf8461e74084a29d254a74b591', '[\"*\"]', NULL, NULL, '2026-02-17 18:19:46', '2026-02-17 18:19:46'),
(61, 'App\\Models\\User', 1, 'UserApp', 'ec06ca071f3a37d4a8e3a6c539390acfee8836434fbe3eecd60e5396954cbb5c', '[\"*\"]', NULL, NULL, '2026-02-17 18:20:59', '2026-02-17 18:20:59'),
(62, 'App\\Models\\User', 1, 'UserApp', '56069bedc227bb0f339a36d1a964255d84e65819065a4b045237cbe3db236d13', '[\"*\"]', NULL, NULL, '2026-02-19 15:26:37', '2026-02-19 15:26:37'),
(63, 'App\\Models\\User', 2, 'UserApp', '3446fb06bde97f47f88fd8522a61d8f790d1c8fd83bef126078f773d11b48cbf', '[\"*\"]', NULL, NULL, '2026-02-19 15:38:17', '2026-02-19 15:38:17'),
(64, 'App\\Models\\User', 11, 'UserApp', '4a5f773dff92cd66e2b92b67e3a691b7c544898c5b001467d920590dd04face5', '[\"*\"]', NULL, NULL, '2026-02-19 15:51:54', '2026-02-19 15:51:54'),
(65, 'App\\Models\\User', 3, 'UserApp', '742b25290515954cb03418b267d6d860536169c546662d40ccc52caf97cc4c0b', '[\"*\"]', NULL, NULL, '2026-02-21 13:32:34', '2026-02-21 13:32:34'),
(66, 'App\\Models\\User', 4, 'UserApp', 'a9c3a45de3bc3e95bd9cbc792d109886a7e3d6dfa1f07ffbb469ffed4ba33dcd', '[\"*\"]', NULL, NULL, '2026-02-21 13:34:04', '2026-02-21 13:34:04'),
(67, 'App\\Models\\User', 4, 'UserApp', '84829e21e5f65ea16329b875b62d441881268493e0b3d354b795f7c71be77aa6', '[\"*\"]', NULL, NULL, '2026-02-21 13:34:52', '2026-02-21 13:34:52'),
(68, 'App\\Models\\User', 3, 'UserApp', '8599e6c9a25cb7f4442aa4c5c3e28fbd01253132eb6247775fac4944d25a60f7', '[\"*\"]', NULL, NULL, '2026-02-21 13:35:22', '2026-02-21 13:35:22'),
(69, 'App\\Models\\User', 1, 'UserApp', '7baafea2973e3a46285f51aa3b8d013e99ebc5561d85edccfc7610e6a7b851ed', '[\"*\"]', NULL, NULL, '2026-02-21 16:44:45', '2026-02-21 16:44:45'),
(70, 'App\\Models\\User', 4, 'UserApp', 'c716d6e65169023a3095341d3ded1b54950edbd2d646d2e47f0df64fa45d553b', '[\"*\"]', NULL, NULL, '2026-02-21 21:11:25', '2026-02-21 21:11:25'),
(71, 'App\\Models\\User', 1, 'UserApp', '1e84636a1873c85d1fdd5fc044e3e4923dfdc2c9a16298f05beb9f1c46d1c218', '[\"*\"]', NULL, NULL, '2026-02-23 09:36:23', '2026-02-23 09:36:23'),
(72, 'App\\Models\\User', 3, 'UserApp', '2bd1fb2ae10e3fb24f61984dd3786f9ce2a777a4e8f9bbfa378f919bd8bd2309', '[\"*\"]', NULL, NULL, '2026-02-23 11:25:08', '2026-02-23 11:25:08'),
(73, 'App\\Models\\User', 3, 'UserApp', 'f71eb78794dc6c801a545e5937b43483ee9c7f06bbe0fb1bbe2aeb496c20c1bb', '[\"*\"]', NULL, NULL, '2026-02-23 11:25:20', '2026-02-23 11:25:20'),
(74, 'App\\Models\\User', 3, 'UserApp', '67dd5b8f4a767409b9ae432b4369ce5f9a05f16f911e388090ea383953acdb8f', '[\"*\"]', NULL, NULL, '2026-02-23 11:29:52', '2026-02-23 11:29:52'),
(75, 'App\\Models\\User', 6, 'UserApp', 'f404a96f1e1539a624f41f38ff8b011594e623f6c017b1918f0f4d6f422e828e', '[\"*\"]', NULL, NULL, '2026-02-23 13:29:10', '2026-02-23 13:29:10'),
(76, 'App\\Models\\User', 1, 'UserApp', '5e6c5aa5d446cc0de0b33fefe1d6460eb605cb1655db1352508fd17c86f68afc', '[\"*\"]', NULL, NULL, '2026-02-23 13:30:22', '2026-02-23 13:30:22'),
(77, 'App\\Models\\User', 1, 'UserApp', 'b0a68df35a262d531012126b8fc7280203a4e8adc11495b8659b37b1dff4643f', '[\"*\"]', NULL, NULL, '2026-02-23 13:40:56', '2026-02-23 13:40:56'),
(78, 'App\\Models\\User', 1, 'UserApp', 'e94d4691ea0edde95b0f15260559ccfff583e639e9626b2c0f40736cfe71bf10', '[\"*\"]', NULL, NULL, '2026-02-23 13:41:34', '2026-02-23 13:41:34'),
(79, 'App\\Models\\User', 1, 'UserApp', '40f8994a1fbc3e021fe2cc1f5f56cad7f3f668db3aa048fc853ac1d34eaad298', '[\"*\"]', NULL, NULL, '2026-02-23 13:42:53', '2026-02-23 13:42:53'),
(80, 'App\\Models\\User', 1, 'UserApp', '464df59fa01c35b2d671630671b8af959671eb637af408c99ce7c32fd9fc4680', '[\"*\"]', NULL, NULL, '2026-02-23 13:46:20', '2026-02-23 13:46:20'),
(81, 'App\\Models\\User', 1, 'UserApp', '1d3b39e1955fc3e87196dccc2192579cb24628f1224d6721ae62661d2c86da68', '[\"*\"]', NULL, NULL, '2026-02-23 13:48:47', '2026-02-23 13:48:47'),
(82, 'App\\Models\\User', 1, 'UserApp', '071a2b42b0165135134223fbeb3118e0fb6732dd8b0cf6f93a89fc3d0e18b8ab', '[\"*\"]', NULL, NULL, '2026-02-23 13:49:32', '2026-02-23 13:49:32'),
(83, 'App\\Models\\User', 1, 'UserApp', 'f3e5f80e4d6e66f989818bb587ac9f051af250408f2080258400029f1bd4e2fa', '[\"*\"]', NULL, NULL, '2026-02-23 13:49:49', '2026-02-23 13:49:49'),
(84, 'App\\Models\\User', 1, 'UserApp', '15041f4e999915594538269b0f447874555a175a822d4dee5e2d37d5bd17c9d4', '[\"*\"]', NULL, NULL, '2026-02-23 13:50:31', '2026-02-23 13:50:31'),
(85, 'App\\Models\\User', 1, 'UserApp', '76179179b76aeaedbf0b8ce4e729f5fa56f9021bc7738fe300de372bfce61458', '[\"*\"]', NULL, NULL, '2026-02-23 13:50:57', '2026-02-23 13:50:57'),
(86, 'App\\Models\\User', 1, 'UserApp', '1b7e5623e5756d42ed863b4dcabd0368e18ec989901923115bc5e551f047a534', '[\"*\"]', NULL, NULL, '2026-02-23 14:04:07', '2026-02-23 14:04:07'),
(87, 'App\\Models\\User', 1, 'UserApp', '15dbd6ce2460a7e6d0df42966d88dd93c9a83a7a1bf3eb8424538b75ff20ad65', '[\"*\"]', NULL, NULL, '2026-02-23 14:43:31', '2026-02-23 14:43:31'),
(88, 'App\\Models\\User', 1, 'UserApp', '8084f10209b46b4768fab5c4e9fd140e396763f09dcb0a70a0447c75f96f0b83', '[\"*\"]', NULL, NULL, '2026-02-23 14:46:41', '2026-02-23 14:46:41'),
(89, 'App\\Models\\User', 1, 'UserApp', 'd3c206eb2b20ae399a57670cb050ec69ca9443dd2ab69aa39ad83fc949ffc502', '[\"*\"]', NULL, NULL, '2026-02-23 16:32:44', '2026-02-23 16:32:44'),
(90, 'App\\Models\\User', 4, 'UserApp', '63ea7891de65fec5dcddfefe727b785617a1a7e1e75a2e392c8d241684fc04d5', '[\"*\"]', NULL, NULL, '2026-02-23 16:57:00', '2026-02-23 16:57:00'),
(91, 'App\\Models\\User', 1, 'UserApp', '8f86f723911bbc1279ad37b3ee7af784fb959a0543ba510688f3f2ccb13ee1af', '[\"*\"]', NULL, NULL, '2026-02-23 17:18:42', '2026-02-23 17:18:42'),
(92, 'App\\Models\\User', 4, 'UserApp', '303598556d329dd8ac44b8df7295dc566641c136e63e75a3557189671bed7c5e', '[\"*\"]', NULL, NULL, '2026-02-23 17:20:53', '2026-02-23 17:20:53'),
(93, 'App\\Models\\User', 1, 'UserApp', 'dd9fff617ffba7429faef1f14c435d8107eb3ab6f746eb2087b5328518284f9a', '[\"*\"]', NULL, NULL, '2026-02-23 23:56:29', '2026-02-23 23:56:29'),
(94, 'App\\Models\\User', 1, 'UserApp', '4fbd02b40b35b82f42df4a1ed58795ea80b0f433a504ca6a40ad653f77a2083f', '[\"*\"]', NULL, NULL, '2026-02-24 07:04:02', '2026-02-24 07:04:02'),
(95, 'App\\Models\\User', 7, 'UserApp', '87dbc74dc37dda8890263b5ac78c2422d321919050237c9f712444de9d7780cd', '[\"*\"]', NULL, NULL, '2026-02-24 07:43:23', '2026-02-24 07:43:23'),
(96, 'App\\Models\\User', 1, 'UserApp', '83c128d4ee60719da9f993dd8b309497da9c1ac6cb2b673024c552f4c152947d', '[\"*\"]', NULL, NULL, '2026-02-24 07:46:56', '2026-02-24 07:46:56'),
(97, 'App\\Models\\User', 1, 'UserApp', 'de4dc1968c6998787dbd91fbab2390fbee7ab0384cd5196ddf5ac0761d26df95', '[\"*\"]', NULL, NULL, '2026-02-24 09:14:28', '2026-02-24 09:14:28'),
(98, 'App\\Models\\User', 1, 'UserApp', '90c69829b3218638a94207d980176a684eae231c0107688ccd33c4cf5c9ab659', '[\"*\"]', NULL, NULL, '2026-02-24 11:02:23', '2026-02-24 11:02:23'),
(99, 'App\\Models\\User', 1, 'UserApp', '5e9474298bf245590e07607e9da673ee7191526182f01020fbef3183789b21fc', '[\"*\"]', NULL, NULL, '2026-02-24 11:26:21', '2026-02-24 11:26:21'),
(100, 'App\\Models\\User', 1, 'UserApp', '7cc077b9a0d9e14a25331a3e2c940bda26f837eb2cd4c0ed32f994aa19346f25', '[\"*\"]', NULL, NULL, '2026-02-24 13:01:59', '2026-02-24 13:01:59'),
(101, 'App\\Models\\User', 2, 'UserApp', '0e47d3ed77ecb0003e51e11d23cbc8479e61ed3681719e1eb51da027a9ddb2e4', '[\"*\"]', NULL, NULL, '2026-02-24 15:38:20', '2026-02-24 15:38:20'),
(102, 'App\\Models\\User', 1, 'UserApp', '065ca05777f0f80008f0452b9f931c3e720d0901e88034cc2203f371233bb474', '[\"*\"]', NULL, NULL, '2026-02-24 15:52:45', '2026-02-24 15:52:45'),
(103, 'App\\Models\\User', 1, 'UserApp', '497b443736cbbd1cac2ca5555a608e9e363afb82b56ce45a513a1c9e58798dec', '[\"*\"]', NULL, NULL, '2026-02-24 16:14:18', '2026-02-24 16:14:18'),
(104, 'App\\Models\\User', 1, 'UserApp', 'ee9cf927e5244df262765712259ff7009a45eec42c8ada56df9784338a6c67c9', '[\"*\"]', NULL, NULL, '2026-02-24 16:40:28', '2026-02-24 16:40:28'),
(105, 'App\\Models\\User', 2, 'UserApp', '404a09907e1d24fff5c5dbf807e8beaba426b20d44fb604f51e03018a1f01ff2', '[\"*\"]', NULL, NULL, '2026-02-24 16:41:24', '2026-02-24 16:41:24'),
(106, 'App\\Models\\User', 1, 'UserApp', 'db19da66c47e58d5e009f89cc4124abb44ea64b5c93ad6449c30442ebfdb8fae', '[\"*\"]', NULL, NULL, '2026-02-24 16:48:34', '2026-02-24 16:48:34'),
(107, 'App\\Models\\User', 1, 'UserApp', '43c006a2f368c91feaf489f3a96a29ae49e0aa8df54c87853b140dbd2120f1fa', '[\"*\"]', NULL, NULL, '2026-02-24 16:49:50', '2026-02-24 16:49:50'),
(108, 'App\\Models\\User', 1, 'UserApp', '0fa47f82b4ee47f78356e28929897246729c23dbedf10583cc908e8a5a4c4f25', '[\"*\"]', NULL, NULL, '2026-02-24 16:53:26', '2026-02-24 16:53:26'),
(109, 'App\\Models\\User', 1, 'UserApp', '6722a74662a777e3f94fc5040adce5081df38d578476f3ec08b48bd8f8e902d2', '[\"*\"]', NULL, NULL, '2026-02-24 17:16:08', '2026-02-24 17:16:08'),
(110, 'App\\Models\\User', 1, 'UserApp', '54fc66ad4a2e899f8cf02da2c05cc19bc97cc8023d53508176021280d760d10d', '[\"*\"]', NULL, NULL, '2026-02-24 17:24:29', '2026-02-24 17:24:29'),
(111, 'App\\Models\\User', 1, 'UserApp', 'af6d79a2efa23eac3e11ddb0a94dbef60891037b33417cfa8620f31892107cf6', '[\"*\"]', NULL, NULL, '2026-02-24 17:39:49', '2026-02-24 17:39:49');

-- --------------------------------------------------------

--
-- Table structure for table `plinko_bets`
--

CREATE TABLE `plinko_bets` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT 'type=1 green,type=2 yellow,type=3 red',
  `indexs` int(11) DEFAULT NULL,
  `multipler` varchar(255) DEFAULT NULL,
  `win_amount` double DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tax` varchar(155) DEFAULT NULL,
  `after_tax` varchar(155) DEFAULT NULL,
  `orderid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plinko_index_lists`
--

CREATE TABLE `plinko_index_lists` (
  `id` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `multiplier` double DEFAULT NULL,
  `indexs` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `plinko_index_lists`
--

INSERT INTO `plinko_index_lists` (`id`, `type`, `multiplier`, `indexs`, `status`, `datetime`) VALUES
(1, 1, 2, '1', 1, '2024-06-12 10:06:29'),
(2, 1, 0.6, '2', 1, '2024-06-12 10:09:06'),
(3, 1, 1.1, '3', 1, '2024-06-12 10:09:06'),
(4, 1, 0.8, '4', 1, '2024-06-12 10:09:06'),
(5, 1, 1.2, '5', 1, '2024-06-12 10:09:06'),
(6, 1, 0.4, '6', 1, '2024-06-12 10:09:06'),
(7, 1, 0.3, '7', 1, '2024-06-12 10:09:06'),
(8, 1, 1.6, '8', 1, '2024-06-12 10:09:06'),
(9, 2, 1.5, '1', 1, '2024-06-12 10:13:31'),
(10, 2, 0.1, '2', 1, '2024-06-12 10:13:31'),
(11, 2, 0.9, '3', 1, '2024-06-12 10:13:31'),
(12, 2, 1.1, '4', 1, '2024-06-12 10:13:31'),
(13, 2, 0.7, '5', 1, '2024-06-12 10:13:31'),
(14, 2, 1.4, '6', 1, '2024-06-12 10:13:31'),
(15, 2, 0.6, '7', 1, '2024-06-12 10:13:31'),
(16, 2, 1.3, '8', 1, '2024-06-12 10:13:31'),
(17, 3, 1.7, '1', 1, '2024-06-12 10:16:24'),
(18, 3, 0.3, '2', 1, '2024-06-12 10:16:24'),
(19, 3, 1.2, '3', 1, '2024-06-12 10:16:24'),
(20, 3, 0.6, '4', 1, '2024-06-12 10:16:24'),
(21, 3, 1.3, '5', 1, '2024-06-12 10:16:24'),
(22, 3, 0.1, '6', 1, '2024-06-12 10:16:24'),
(23, 3, 0.7, '7', 1, '2024-06-12 10:16:24'),
(24, 3, 1.9, '8', 1, '2024-06-12 10:16:24'),
(25, 1, 0.6, '9', 1, '2024-06-12 10:16:24'),
(26, 1, 1.3, '10', 1, '2024-06-12 10:16:24'),
(27, 1, 0.1, '11', 1, '2024-06-12 10:16:24'),
(28, 1, 0.7, '12', 1, '2024-06-12 10:16:24'),
(29, 1, 1.9, '13', 1, '2024-06-12 10:16:24'),
(30, 2, 1.1, '9', 1, '2024-06-12 10:13:31'),
(31, 2, 0.7, '10', 1, '2024-06-12 10:13:31'),
(32, 2, 1.4, '11', 1, '2024-06-12 10:13:31'),
(33, 2, 0.6, '12', 1, '2024-06-12 10:13:31'),
(34, 2, 1.3, '13', 1, '2024-06-12 10:13:31'),
(35, 3, 0.6, '9', 1, '2024-06-12 10:16:24'),
(36, 3, 1.3, '10', 1, '2024-06-12 10:16:24'),
(37, 3, 0.1, '11', 1, '2024-06-12 10:16:24'),
(38, 3, 0.7, '12', 1, '2024-06-12 10:16:24'),
(39, 3, 1.9, '13', 1, '2024-06-12 10:16:24');

-- --------------------------------------------------------

--
-- Table structure for table `qr_codes`
--

CREATE TABLE `qr_codes` (
  `id` int(11) NOT NULL,
  `option_name` varchar(50) NOT NULL,
  `qr_code` varchar(255) NOT NULL,
  `wallet_address` varchar(255) NOT NULL,
  `upi_address` varchar(555) NOT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '0 = Inactive, 1 = Active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `account_number` varchar(55) NOT NULL,
  `ifsc_code` varchar(55) NOT NULL,
  `account_name` varchar(55) NOT NULL,
  `account_type` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `qr_codes`
--

INSERT INTO `qr_codes` (`id`, `option_name`, `qr_code`, `wallet_address`, `upi_address`, `status`, `created_at`, `updated_at`, `account_number`, `ifsc_code`, `account_name`, `account_type`) VALUES
(1, 'Option 1', 'https://root.nexwin.vip/public/uploads/payinqr/1771908045_WhatsApp Image 2026-02-24 at 10.00.07 AM.jpeg', '6264735929@ibl', '987654321@upi', 1, '2025-10-13 10:37:14', '2026-02-24 07:56:16', '', '', '', ''),
(2, 'Option 2', 'https://root.nexwin.vip/public/uploads/payinqr/1771919762_WhatsApp Image 2026-02-24 at 10.00.08 AM.jpeg', '6264735929@ibl', '', 1, '2025-10-13 10:37:14', '2026-02-24 07:56:02', '54540100002860', 'BARB0SANAWA', 'Bihari', 'Saving');

-- --------------------------------------------------------

--
-- Table structure for table `recent_history`
--

CREATE TABLE `recent_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(55) NOT NULL,
  `sub_cat_id` int(55) NOT NULL,
  `sub_cat_name` varchar(55) NOT NULL,
  `image` varchar(555) DEFAULT NULL,
  `game_code` int(11) NOT NULL,
  `game_name` varchar(55) NOT NULL,
  `game_img` varchar(555) NOT NULL,
  `category` varchar(55) NOT NULL,
  `gameID` int(55) NOT NULL,
  `gameNameEn` varchar(55) NOT NULL,
  `img` varchar(555) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `revenue`
--

CREATE TABLE `revenue` (
  `id` int(11) NOT NULL,
  `revenue` varchar(55) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `revenue`
--

INSERT INTO `revenue` (`id`, `revenue`, `created_at`, `updated_at`) VALUES
(1, '15', '2025-11-17 09:01:26', '2026-01-30 21:44:25');

-- --------------------------------------------------------

--
-- Table structure for table `roast_control`
--

CREATE TABLE `roast_control` (
  `id` int(11) NOT NULL,
  `types` int(11) NOT NULL,
  `roast_multiplier` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roast_control`
--

INSERT INTO `roast_control` (`id`, `types`, `roast_multiplier`) VALUES
(1, 1, 19.44),
(2, 2, 451.71),
(3, 3, 0.00),
(4, 4, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 1, NULL, NULL),
(2, 'Super Stokez', 1, NULL, NULL),
(3, 'Distributor', 1, NULL, NULL),
(4, 'Agents', 1, NULL, NULL),
(5, 'Player', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles_defined`
--

CREATE TABLE `roles_defined` (
  `id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles_defined`
--

INSERT INTO `roles_defined` (`id`, `role_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', '2025-07-12 11:52:00', '2025-07-12 11:52:00'),
(2, 2, 'Agent', '2025-07-12 11:52:00', '2025-07-12 11:52:00');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rules`
--

CREATE TABLE `rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rules`
--

INSERT INTO `rules` (`id`, `game_id`, `type`, `name`, `list`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Invitation Reward Rule', '[\"Only when the number of invited accounts is reached and each account can meet the recharge amount can you receive the bonus.\", \"The invitation account meets the requirements, but the recharge amount of the account does not meet the requirements, and the bonus cannot be claimed.\", \"Please claim the event bonus within the event period. All bonuses will be cleared after the event expires.\", \"Please complete the task within the event period. After the event expires, the invitation record will be cleared.\"]', 0, '2024-05-01 10:19:01', '2024-05-01 10:19:01'),
(2, 1, 2, 'Withdraw Rule', '[\"Withdraw time 00:00-23:59\", \"Inday Remaining Withdrawal Times 3\", \"Withdrawal amount range ₹200\", \"Please confirm your beneficial account information before withdrawing. If your information is incorrect, our company will not be liable for the amount of loss.\", \"If your beneficial information is incorrect, please contact customer service.\"]', 0, '2024-05-01 10:19:01', '2024-05-01 10:19:01'),
(3, 1, 3, 'Deposit Rule', '[\"If the transfer time is up, please fill out the deposit form again.\", \"The transfer amount must match the order you created, otherwise the money cannot be credited successfully.\", \"If you transfer the wrong amount, our company will not be responsible for the lost amount!\", \"Note: do not cancel the deposit order after the money has been transferred.\"]', 0, '2024-05-01 17:16:49', '2024-05-01 17:16:49'),
(4, 1, 4, 'Attendance Game Rule', '[\"The higher the number of consecutive login days, the more rewards you get, up to 7 consecutive days.\", \"During the activity, please check once a day.\", \"Players with no deposit history cannot claim the bonus\", \"Deposit requirements must be met from day one.\", \"The platform reserves the right to final interpretation of this activity.\", \"When you encounter problems, please contact customer service\"]', 0, '2024-05-01 17:16:49', '2024-05-01 17:16:49'),
(5, 1, 5, 'Home page animated text', '[\"Welcome to the GlobalBet-24 Games!  Greetings, Gamers and Enthusiasts!  The GlobalBet-24 Games is more than just a platform for gaming.  We invite you to join us, you\'ll find a variety of games, promo, bonus, luxury gold awards, Register now and win..\", \"If your deposit not receive, please send it directly to GlobalBet-24 Games Self-service Center (https://globalbet24.live/) wait till already get process, do not send to another person and trust anyone claiming to represent GlobalBet-24 Games. Always verify our website authenticity through the official community channels. Your safety and trust is our prority.\"]', 0, '2024-05-01 17:16:49', '2024-05-01 17:16:49'),
(6, 1, 6, 'Wingo animated text', '[\"Welcome to the GlobalBet-24 Games!  Greetings, Gamers and Enthusiasts!  The GlobalBet-24 Games is more than just a platform for gaming.  We invite you to join us, you\'ll find a variety of games, promo, bonus, luxury gold awards, Register now and win.\", \"If your deposit not receive, please send it directly to GlobalBet-24 Games Self-service Center (https://globalbet24.live/) wait till already get process, do not send to another person and trust anyone claiming to represent GlobalBet-24 Games. Always verify our website authenticity through the official community channels. Your safety and trust is our prority.\"]', 0, '2024-05-01 17:16:49', '2024-05-01 17:16:49');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1teOBHrZt5RcIjpv7t2MDU8vdyMzjIEHU1abTI2J', NULL, '34.208.28.11', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFR4SHd6YkN3N3hYZnV3YUdZUUdBMnlTcVg0eVZKb01UeTkzTUMzbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771925792),
('29QYXD8Ad7NPddJ34g4KiHQLywj8kVU7cZHiqONq', NULL, '49.43.117.83', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1 Edg/145.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWm9sYWJvRTMzbmpQMkZFUXNYajRKNHJKb0NqaFZoYzFTc3BocVdOeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwL3BsYXkvMzMzMDdmYzktYzQ2MC00N2E3LTk0ZDgtM2YyN2M2NTJmMzIwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771933761),
('3SI6CjZt8zXEDtiKRSyK4q2lnCtB4sJD3Nvz89dj', NULL, '34.208.28.11', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.7632.109 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEZaVGMyakwzVHNZUHNMOVRpZW40NDBFZXA5bjB1dDV4czEwN0wydSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771925786),
('3VibqSOre0UkPwv19VeO5pYj99eZAlTX4jpc4kLn', NULL, '49.43.117.83', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1 Edg/145.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTTdFMjkySUZQaWg2bmhFUlpDSThtMUw2SlZ6eVRWdDNrSVBDV3hkRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwL3BsYXkvMzMzMDdmYzktYzQ2MC00N2E3LTk0ZDgtM2YyN2M2NTJmMzIwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771933762),
('4siAIEvPKfzL7folwAAkaLu6DG5RE3TDB46vilPH', NULL, '103.4.250.75', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXE4TDNSNkd5TlloT1o1MDJmaHRwUXU2d1pwNW04bVNoVWtRUWx1WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771925613),
('7g3bATIWERS3WwFrnuMlXdw4On8A1q1PpuDRGVC2', NULL, '49.43.117.83', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0JWRDN6WWc5SmN5WWJwSGZnTmJvVDRZWGF0SW54NWZTbmFhMk5QUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwL3BsYXkvZGI1MTdiMGMtMGViYS00NzcxLWFlZjItMmJmNWNiNDg2MzYyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771933941),
('9HAoTIwHmJGreHDvHHOsREgLMFsikdLNHXqwfqtj', NULL, '49.43.117.83', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR01HUlJFazg5SjF5UGZMalhzZDdaaklGYkFaQm9PNkRyREVkZUxhbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwL3BsYXkvZGI1MTdiMGMtMGViYS00NzcxLWFlZjItMmJmNWNiNDg2MzYyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771933941),
('AKeG9kiTx0DvChNqTQkhx4fzjbu9td3Ijn1fSsaC', NULL, '64.233.173.200', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0h6Y0JPR2s1R2ZSU1VGVENMeGxiSTdKTzVvVWxjNkJrVzhEckJjbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwL2F0dGVuZGFuY2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1771932782),
('BfFELeZfJvZEZOAlkRuYEkFOhbIJO5Yj2OxU5yxv', NULL, '49.43.117.83', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHhyclJabmdFdlgzS2ZHbGpIZllvRTQ0SEJudjRRQnlxREdabnJLZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwL3BsYXkvN2ZkM2M2ZjQtNzFkZC00NDlkLTk0ODctMzU3YzZlOTQ3OWZhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771935073),
('ERmmFLDVIJaTfYLpgpGFXvvFrYNu5K0ANAzcb5xG', NULL, '152.58.128.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2I2Vkw1T3ZwRjdaWFdHSHNXYVRSa2p2MkNiT21UNU1XYmZKT1NRMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771931260),
('fDQHzdhYGLZubwTOsYlISzGPcTZWA2vHFU0ygq2E', NULL, '95.143.63.15', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWQxMWRjbzl2ZmRGY3pZZXh0Z2o3SkxBY2t2Z1lKbkRpNXBnRmhCSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771933954),
('gEXLeVQHhu1oRb0rGz7CkEhkGECbVNhzbZJZ5Mm1', NULL, '54.247.57.72', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTc3OXVsVjE3d2p2RmkxRHNLeEVnNDNWZDREc2l6MVJNRE0zZkFteCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771927878),
('HWE3LmDjCrEJFk0RHWOJp9UEGssYUbcFEUtbq5cg', NULL, '49.43.117.83', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDNjRnptR3JwdmliNE1KYjcxSDNRalpMYVpWRGl1TFhEQzJiamQ0TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwL3BsYXkvZWZmZjc4YzctMjQ5MS00MjlkLWFiOTMtZmQyYjRmMGY4YjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771934078),
('HYajRVhl7cAnR4PMgAxSH4SgkkEU69uov42rt8G0', NULL, '54.247.57.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRlV1cDBGQ01zeDBNQlZ6c29mNkMzRW10d1B0YXhxZzdQQnJITFhiUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771927875),
('IiPt8D1H0UYc2PS1azfQKf8aI4vBqAvnIW0178wK', NULL, '49.43.117.83', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidW55SnRNWm5qZkk5VXIyalJCS0RXMmZFVWlodll5cEs0SHdNbDhWMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwL3BsYXkvZDMyNTFjNzctNmJhYi00Y2VjLThjMDEtZTAyNzRjZGM4ZDY0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771934226),
('issCJZtwjZG6Jz9lPXMpXDI0RkOBtL6mZpGapwFW', NULL, '49.43.117.83', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWUyaDZqT1NDNlhTSDRGWVZLVmJuWEZyOHFmdlZBUm8xWnZjTEU1ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwL3BsYXkvZGI1MTdiMGMtMGViYS00NzcxLWFlZjItMmJmNWNiNDg2MzYyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771934310),
('KEjoKXB06QE6sszhRhDs2hckiHJBsSraHxXd6A0m', NULL, '49.43.117.83', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGRYR3NtbUNYQ1BVdDlDWTlmRWtPZ3kyblhsamNsU3paNEpneUNxSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwL3BsYXkvMDVjMTJkZGYtMWE4NC00NTQ2LWFmMmYtZGY4NDYxZjI1ZTE3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771934116),
('kinGQacXrut6sNN4vQGOue4nkUxhJzci2xCq7WCQ', NULL, '64.233.173.200', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUhlYXNWaTBROE9pSXlCTWl4b1M4UVB5amFBaDlVV0RyQ1hUbHk2aiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771932878),
('kppZwyPnyGz8hvpijIaAfQHgm2nafM7zSxHpg0Ka', NULL, '49.43.117.83', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1NhNkFFR0x2U1lXTllMVlZoVVNENFRTckdHNjlBZTNJbzBmV1R6cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwL3BsYXkvZDMyNTFjNzctNmJhYi00Y2VjLThjMDEtZTAyNzRjZGM4ZDY0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771934226),
('kwYBDaRbyd9K7mLeLD9186t8gRcFMS2VEetPUIjQ', NULL, '49.43.117.83', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1 Edg/145.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjF4aVRHa0tXT3FxTFlZUW1PN1E2QWc4TDdLTzF4ZXhtb0k5MEs2SCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwL3BsYXkvZDQwYTljYzEtOTcwYi00NDQ0LTk3ZmYtOGViZmU5ODhmNTZkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771933583),
('lefjMeEUodcKgiGLT9XP2ktVPZoLIcKdQRomcLZf', NULL, '64.233.173.200', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGlnczAwMTRxQTU1blFkNGFldmpxZU96SEJKamtoajVOZ1pMaWx3NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771933220),
('migjAbHCieTgILTqql9oGFQjBo2k68yiPgcHkVJj', NULL, '49.43.117.83', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUtyYkpSUzhnVTFjbG1Bd2hDMm5KdmVZT0JISHVNaWk5UTVrUUlvciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwL3BsYXkvZWZmZjc4YzctMjQ5MS00MjlkLWFiOTMtZmQyYjRmMGY4YjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771934077),
('MulDCsN6CTWOyNmCBkY4MD19dMbDOslhw7WI0aov', NULL, '49.43.117.83', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiekgzS3l1Qm5pQ3Y4MXBSclVBdHEzRTA2YlRmcU9aaHRJaE9OWXhqaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwL3BsYXkvZjFlMTdlOGUtMzExOS00ZTYzLWIxMmMtMGQzYWI4ODg4YzJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771934355),
('mUvCRN27y9yUYEWH7Ht8ReqYv0PuFJUcL0168fZq', NULL, '64.233.173.200', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWxuOXVNZzJjbnV5UERSd1BhTHlkTHVaSG8xYjBWdXN1TGtqSE1oaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771932782),
('nCFIjUq5crkKwWjzcNOouOplRKo6AB3YxtpOU0fk', NULL, '49.43.117.83', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkFmSWZSVXQ0SWFwbmtSMmsyQXJLbW5rejZrcTlURUV1bFBObE9zdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwL3BsYXkvNzkwM2IwYzYtODljNy00YTFlLWI0ZmYtZWFiYzZlYjE2YWI0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771933882),
('NVpxxY9dLuQYZU5hnvR175AZGvFnHooeZQ41rYvT', NULL, '152.56.178.74', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoieGl5eWk0UzVDNWhsVGdoUzZkNklTS2xUSjlxMjhPYUN1bG9Pc21YWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo3OiJyb2xlX2lkIjtpOjE7czoxMToicGVybWlzc2lvbnMiO2E6NTg6e2k6MDtzOjE6IjEiO2k6MTtzOjE6IjIiO2k6MjtzOjE6IjMiO2k6MztzOjE6IjQiO2k6NDtzOjE6IjUiO2k6NTtzOjE6IjYiO2k6NjtzOjE6IjciO2k6NztzOjE6IjgiO2k6ODtzOjE6IjkiO2k6OTtzOjI6IjEwIjtpOjEwO3M6MjoiMTEiO2k6MTE7czoyOiIxMiI7aToxMjtzOjI6IjEzIjtpOjEzO3M6MjoiMTQiO2k6MTQ7czoyOiIxNSI7aToxNTtzOjI6IjE2IjtpOjE2O3M6MjoiMTciO2k6MTc7czoyOiIxOCI7aToxODtzOjI6IjE5IjtpOjE5O3M6MjoiMjAiO2k6MjA7czoyOiIyMSI7aToyMTtzOjI6IjIyIjtpOjIyO3M6MjoiMjMiO2k6MjM7czoyOiIyNCI7aToyNDtzOjI6IjI1IjtpOjI1O3M6MjoiMjYiO2k6MjY7czoyOiIyNyI7aToyNztzOjI6IjI4IjtpOjI4O3M6MjoiMjkiO2k6Mjk7czoyOiIzMCI7aTozMDtzOjI6IjMxIjtpOjMxO3M6MjoiMzIiO2k6MzI7czoyOiIzMyI7aTozMztzOjI6IjM0IjtpOjM0O3M6MjoiMzUiO2k6MzU7czoyOiIzNiI7aTozNjtzOjI6IjM3IjtpOjM3O3M6MjoiMzgiO2k6Mzg7czoyOiIzOSI7aTozOTtzOjI6IjQwIjtpOjQwO3M6MjoiNDEiO2k6NDE7czoyOiI0MiI7aTo0MjtzOjI6IjQzIjtpOjQzO3M6MjoiNDQiO2k6NDQ7czoyOiI0NSI7aTo0NTtzOjI6IjQ2IjtpOjQ2O3M6MjoiNDciO2k6NDc7czoyOiI0OCI7aTo0ODtzOjI6IjQ5IjtpOjQ5O3M6MjoiNTAiO2k6NTA7czoyOiI1MSI7aTo1MTtzOjI6IjUyIjtpOjUyO3M6MjoiNTMiO2k6NTM7czoyOiI1NCI7aTo1NDtzOjI6IjU1IjtpOjU1O3M6MjoiNTYiO2k6NTY7czoyOiI1NyI7aTo1NztzOjI6IjU4Ijt9czoxOToicGFzc3dvcmRfY2hhbmdlZF9hdCI7czoxOToiMjAyNi0wMS0xNSAxNzo0NzoyNiI7czoxMzoibGFzdF9hY3Rpdml0eSI7aToxNzcxOTMyNTY5O30=', 1771933255),
('Q74uiNHnYvVB1ietPhWz7p07W07OFYjn1CRcFo3N', NULL, '49.43.117.83', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkFXY1FjT2lnZ0dCN2tCUDN5TWtsTkl5WHNZaGNpeU13NkkzOXMwUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwL3BsYXkvZGI1MTdiMGMtMGViYS00NzcxLWFlZjItMmJmNWNiNDg2MzYyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771934310),
('r1m2gF4mO0LmcnLhEquSyGelLJ6ZHDOLVBpwxusa', NULL, '49.43.117.83', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1 Edg/145.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHJ1azVXZVhvQWZWTG5mV2w5MHFRdmRJQ1VROE9iUkZxRXc0WVI5RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwL3BsYXkvZDQwYTljYzEtOTcwYi00NDQ0LTk3ZmYtOGViZmU5ODhmNTZkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771933582),
('RHWnfZZEM8k0lBCBYpwHhk3OxjGAFZZJpS5ndRKa', NULL, '49.43.117.83', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHlsa21TR3YwaWd6REx6dXI4cmhpVWtzUmRJZU1IT211SjNRRGVuNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwL3BsYXkvZTdmZGU0ZWYtMjM5OS00ZjgxLWFlMGItN2U1MDMzMjU4YjE4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771933906),
('sO7UCX98nAjc867VT1mVh1kxj0TWmv8B78fO7qxX', NULL, '49.43.117.83', 'WhatsApp/2.23.20.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoickxCOU9xTTVYSFoxWFVrNE5VYUxtZVVtWm92SFBtczdCMW5hNDNHRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771931221),
('TuRAkW2Hi7O3TcgMG3wpA9wJ6AHbD3mJixCCVKDP', NULL, '49.43.117.83', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkJUNWtLNzJybG5DMnpocnQ5bnFYeURLdW9aSW9WTzFCTHRhcGt6VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwL3BsYXkvMDVjMTJkZGYtMWE4NC00NTQ2LWFmMmYtZGY4NDYxZjI1ZTE3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771934115),
('TXKPw6VGxiL8SpduuMNhsAceI4fwdZmwkCSrKxAl', NULL, '54.247.57.72', 'Mozilla/5.0 (X11; Linux x86_64; rv:83.0) Gecko/20100101 Firefox/83.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiczZ2NWZHNDg2V0tnQUFwem53dHRRYnFWSDVyZHE2cGFWakZObFZrTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771927874),
('tykGc6VH5ek6JFpg4n4ITfYLX9e6cNNYZRRjsO0R', NULL, '103.4.251.67', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmJScHpJZmdsckc3bkJ3ZXNJTUpjYnFGWnR1dEh2bTc1bmVIeVlzcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771925606),
('UW6JdVlAzCPVl8vnJnxyIvTZXIz7bj5yvQVlSEWd', NULL, '49.43.117.83', 'WhatsApp/2.23.20.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0xoamJHNXhWUmtGS0FaemMwaUlqT3BFQk1GUmw4TGh2TDhPdWxSdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwL2Rhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1771931220),
('Vblzd0nYtsYTVHGT8jionGb0Rba4zgNeWIgKEo9M', NULL, '74.125.215.168', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRVk4ZkF2d3piOUxyMDVBTzdlTExnQVhzZVlEMDlIRGZJaXVKUW1RaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771932784),
('vRCVwG8MDLBKMHAbJSTayxmN4JYBOEMpA3jtdUPi', NULL, '46.202.140.154', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/126.0.6478.107 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiejJMdlZKNTdMOGlGM1FhT3EwcmFFS2gwWW1FVFJxZGRKV3J4eDZiVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771927264),
('w5w8NxlmJ0GehuBXI9QXpDzPUVoWt4LJ3RUYGIdm', NULL, '49.43.117.83', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidTROWTczUXhZbEFBSDBSSkM3QlI0UmFpcnRGbk5UcG1HMzZzU2xMUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwL3BsYXkvZjFlMTdlOGUtMzExOS00ZTYzLWIxMmMtMGQzYWI4ODg4YzJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771934356),
('WmVBIGlgtX2imRBpDViSRSqNvnLn01Fdtsb9tEVy', NULL, '103.4.250.75', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTRTek1zREhyZG4ybE1JMjdZRjRQbEU4SWJrNFlsVjFPTUhQTXduRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771925606),
('XTARnbUIHrLimr9kPY6vfpmEZhlKvR0wcwfWMKAH', NULL, '64.233.173.199', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzdhcm16YklHZW80cVBDMGpaOEJqVWoyb0FxcUdlc1JFYk9nZEpJUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vcm9vdC5uZXh3aW4udmlwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771932783);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `type`, `name`, `description`, `link`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'About us', 'Welcome to Nex Win App. Nex Win is a dynamic gaming platform offering a multi-gaming experience that caters to enthusiasts of all kinds. Whether you enjoy strategic games like Dragon Tiger, thrilling games like Aviator, or fun games like Plinko and Color Prediction, Nex Win is your go-to destination for diverse and exciting gameplay. Our mission is to provide an engaging and fair gaming environment where players can compete, have fun, and win rewards. We are committed to continuous innovation, ensuring our platform stays fresh and captivating. Join us on this exciting journey and be a part of our growing community!</p>\n\n<p>Nex Win is operates its portal in India, which offers online fantasy sports, E-sports, casual games, and card-based games through the web portal&nbsp;{win4cash.club} and mobile application(s) available on Play Store and app store as well as on our official website (collectively referred to as the &ldquo;portal&rdquo;) (Nex Win is a product of Nex Win Tech LLPreferred to herein as &ldquo;Nex Win&rdquo; or &ldquo;we&rdquo; or &ldquo;us&rdquo; &ldquo;our&rdquo;).</p>\n\n<p>Nex Win&nbsp;is considered a &ldquo;game of skill.&rdquo; The game of skills can be defined as a game wherein the skills of the individuals participating in any online e-sports gaming play a dominant role rather than the mere luck of the individuals.</p>\n\n<p>Nex Win -&nbsp;respects the privacy of its users and is committed to protecting it in all respects. To offer an enriching and holistic internet experience to its users,&nbsp;Nex Win offers a vast repository of amusement facilities. kindly take time to read the &#39;about us&#39; section to learn more about&nbsp;Nex Win Most of the amusement facilities are offered for free but you may need registration to participate in&nbsp;Nex Win online games.</p>\n\n<p>The information about the user is collected by&nbsp;Nex Win  as (i) information supplied by users and (ii) information automatically tracked during the user&#39;s navigation on&nbsp;Nex Win </p>\n\n<p>Before you submit any information to the portal, please read this privacy policy for an explanation of how we will treat your personal information. by using any part of the portal, you consent to the collection, use, disclosure, and transfer of your personal information for the purposes outlined in this privacy policy and to the collection, processing, and maintenance of this information. If you do not agree to this Privacy Policy, please do not use the portal. Your use of any part of the portal indicates your acceptance of this privacy policy and the collection, use, and disclosure of your personal information by this Privacy Policy. While you have the option not to provide us with certain information or withdraw consent to collect certain information, kindly note that in such an event you may not be able to take full advantage of the entire scope of features and services offered to you and we reserve the right not to provide you with our services.</p>\n\n<p>Purpose and Usage:<br />\nTo utilize certain services on the Portal, users are required to provide specific information during the registration process.</p>\n\n<p>This information includes-</p>\n\n<p>1. Profile Picture (the image that you upload from your device)&nbsp;<br />\n2. Name&nbsp;<br />\n3. Email address &nbsp;<br />\n4. Date of birth&nbsp;<br />\n5. State<br />\n6. Government ids such as aadhaar card or driver&#39;s license or voter id</p>\n\n<p>Furthermore, to grant you access to the features offered through the Portal, verify your identity, and safeguard your account, we may request your permission to capture and record device-related information, operating system details, network specifics, and location data. Additionally, we may seek your consent to gather information regarding the apps installed on your device. This allows us to enhance our services and improve your overall experience on the Portal. In certain cases, you may also be required to provide additional information, such as your Permanent Account Number (PAN).</p>\n\n<p>In specific instances, we may collect sensitive personal information (SPI) from you on the Portal. SPI refers to personal information that pertains to your financial details, such as the payment instrument or mode used for transactions. The collection of such SPI is solely to facilitate prompt and secure payments.</p>\n\n<p>It is important to note that aside from the financial information provided during payment for services on the&nbsp;&nbsp;Nex Win&nbsp;does not collect any other SPI while delivering the services. Any SPI collected by&nbsp;Nex Win will not be disclosed to any third-party service providers without your explicit consent, except as otherwise stated in this Privacy Policy or as required by law. This condition does not apply to publicly available information, including SPI related to you on the Portal.</p>\n\n<p>We collect and utilize personal information (i.e., information that can be used to identify you and is not publicly available) to operate, provide, develop, and enhance the services we offer. This includes keeping you informed about our offerings, as well as the products and services provided by our affiliates and group entities. Additionally, we may share this information with our affiliates and group entities, who may contact you regarding their products and services.</p>\n\n<p>While using the services, users may invite other existing users or new users (referred to as &quot;Invited Users&quot;) to participate in the services through various social media platforms such as Facebook, WhatsApp, Instagram, etc. The information provided for this purpose may be used to contact and invite the Invited Users to register with&nbsp;Nex Win and participate in the relevant game. The participation of Invited Users in any game is subject to the terms outlined in this Privacy Policy and the Terms and Conditions for using the Portal. By inviting others, you confirm that the Invited Users have consented to and agreed with the disclosure of their information to us, our affiliates, and/or our group entities. Additionally, you may choose to invite your friends by synchronizing your phonebook and directly inviting them from the Portal to play the game and utilize the services.</p>\n\n<p>All the required information is specific to the type of game or services the user wishes to participate in or access. It will be utilized solely to provide the requested services and ensure a seamless user experience.</p>\n\n<p>Disclosure/Sharing:<br />\nNex Win&nbsp;may share the information provided by you and data concerning your usage of the Services and participation in the Games with its affiliates and group entities. This sharing is intended to enable Nex Win&rsquo;s affiliates and group entities to contact you regarding the products and services they offer. Additionally,&nbsp;Nex Win may share such information with third-party service providers engaged by&nbsp;Nex Win for purposes such as data analytics, storage, service improvements (including product enhancements), and to enhance your overall experience with Nex Win. Any affiliate, group entity, or third-party service provider with whom the information is shared will be required to maintain the same standards as&nbsp;Nex Win in terms of information security to the best of their abilities.</p>\n\n<p>By using the Portal, you explicitly agree and grant consent to the collection, use, and storage of your information by&nbsp;Nex Win reserves the right to share, disclose, and transfer the information collected, including personal information, with its affiliates and group entities. If&nbsp;Nex Win sells or transfers all or a portion of its business assets, consumer information may be shared, disclosed, or transferred as part of the transaction. Therefore, you expressly grant consent and permission to&nbsp;Nex Win for the disclosure and transfer of personal information to such third parties.</p>\n\n<p>Nex Win&nbsp;may share information and data regarding the usage of the Services and participation in the Game with its commercial partners to facilitate user engagement, marketing and promotional activities, and other related purposes. Furthermore,&nbsp;Nex Win reserves the right to disclose or share information with affiliates, group entities, and third parties in limited circumstances. These circumstances include complying with applicable laws, responding to duly authorized legal processes or governmental requests, preventing fraud or imminent harm, and ensuring the security of our network and services.</p>\n\n<p>Use of cookies:<br />\nTo improve the effectiveness and usability of the portal for our users, we use &quot;cookies&quot;, or such similar electronic tools to collect information to assign each visitor a unique random number as a User Identification (User ID) to understand the User&#39;s interests using the identified computer. Unless the user voluntarily identifies himself/herself (e.g., through registration),&nbsp;Nex Win has no way of knowing who the User is, even if we assign a cookie to the User&#39;s computer. The only personal information a cookie can contain is information supplied by the User. a cookie cannot read data off the user&#39;s hard drive.&nbsp;Nex Win advertisers may also assign their cookies to the user&#39;s browser (if the User clicks on their ad banners), a process that&nbsp;Nex Win does not control.</p>\n\n<p>Nex Win&nbsp;web servers automatically collect limited information about a user&#39;s computer&#39;s connection to the internet, including the user&#39;s IP address, when the user visits the Portal. (The user&#39;s IP address is a number that lets computers attached to the Internet know where to send data to the User -- such as the web pages viewed by the User). The User&#39;s IP address does not identify the User personally.&nbsp;Nex Win uses this information to deliver its web pages to Users upon request, to tailor its Portal to the interests of its users, to measure traffic within the Portal, and to let advertisers know the geographic locations from where&nbsp;Nex Win visitors come.</p>\n\n<p>Links:<br />\nNex Win&nbsp;also includes links to other websites. such websites are governed by their respective privacy policies, which are beyond Nex Win&#39;s control. Once the User leaves&nbsp;Nex Win servers (the User can tell where he/she is by checking the URL in the location bar on the User&#39;s browser), the use of any information provided by the User is governed by the privacy policy of the operator of the site which the User is visiting. That policy may differ from Nex Win&#39;s own. If the user can&#39;t find the privacy policy of any of these sites via a link from the site&#39;s homepage, the user may contact the site directly for more information.&nbsp;Nex Win is not responsible for the privacy practices or the content of such websites.</p>\n\n<p>Security procedures:<br />\nAll information gathered on&nbsp;Nex Win has been securely stored within Nex Win-controlled databases. The database is stored on servers secured behind a firewall; access to such servers is password-protected and strictly limited based on a need-to-know basis. However, we understand that as effective as our security measures are, no security system is impenetrable. Thus, we cannot guarantee the security of our database, nor can we guarantee that the information you supply will not be intercepted while being transmitted to us over the Internet. Further, any information you include in a posting to the discussion areas will be available to anyone with internet access. By using the portal, you understand and agree that your information may be used in or transferred to countries other than India.</p>\n\n<p>Nex Win&nbsp;also believes that the internet is an ever-evolving medium. We may periodically review from time to time and change our privacy policy to incorporate such future changes as may be considered appropriate, without any notice to you. Our use of any information we gather will always be consistent with the policy under which the information was collected, regardless of what the new policy may be. Any changes to our privacy policy will be posted on this page, so you are always aware of what information we collect, how we use it, how we store it, and under what circumstances we disclose it.</p>\n\n<p>Advertising:<br />\nWhen&nbsp;Nex Win presents information to its online advertisers -- to help them understand our audience and confirm the value of advertising on the portal -- it is usually in the form of aggregated statistics on traffic to various pages within our site. When you register with Nex Win, we contact you from time to time about updating your content to provide features that we believe may benefit you. By registering on our portal, you agree to receive all communications from us including promotional messages relating to tournaments, contests, leagues &amp; bonuses through SMS, voice call, email &amp; push notifications.</p>\n\n<p>Disclaimer:<br />\nThere are deceptive emails, websites, blogs, and other online communications circulating on the internet that falsely claim to be associated with or from&nbsp;Nex Win These deceptive communications may feature our logo, photos, links, content, or other information. Some of them may even contact users directly, asking for login credentials, passwords, or personal information. They may also falsely inform users that they have won a prize or offer a method to engage in illegal or unauthorized activities. We want to clarify that these deceptive communications and their accompanying materials are in no way associated with&nbsp;Nex Win To ensure your safety, we strongly advise against responding to such deceptive communications. Please be aware that we will not be held responsible for any loss, damage, or harm that you may experience as a result of relying on or acting upon such deceptive communications.</p>\n\n<p>Please note that unless it is necessary for verification purposes as outlined in the Terms and Conditions, we and our employees will not contact you to request your sensitive personal information (SPI).</p>\n\n<p>Conditions of use:<br />\nNex Win&nbsp;does not warrant that this portal, its servers, or emails sent by us or on our behalf are virus-free.&nbsp;Nex Win will not be liable for any damages of any kind arising from the use of this portal, including, but not limited to compensatory, direct, indirect, incidental, punitive, special, and consequential damages, loss of data, goodwill, business opportunity, income or profit, loss of or damage to property and claims of third parties. In no event will&nbsp;Nex Win be liable for any damages whatsoever in an amount over INR 100.</p>\n\n<p>User Account and Data Deletion:<br />\nUsers have the right to request the deletion of their user accounts and personal information from Nex Win. To initiate this process, users can send a written request via email to&nbsp;info@Nex Win.app</p>\n\n<p>We strive to respond to such requests promptly, within 60 days from either receiving the written request or any additional information requested to fulfill the request, whichever is later.</p>\n\n<p>&gt;In addition to account deletion, users also have the option to request suspension or temporary deactivation of their accounts by contacting&nbsp;info@Nex Win.app</p>\n\n<p>&gt;With the suspension option, users will be unable to participate in paid contests on their user accounts but will retain access to other parts of the Portal. Alternatively, temporary deactivation prevents login access to the Portal but allows users to reactivate their accounts along with all associated data.</p>\n\n<p>&gt;If a user chooses to permanently deactivate their account, they will lose access to the Portal and its services, including any user data and personal information linked to their account. However, users may request account restoration within six (6) months from the date of receiving the account deletion notification from&nbsp;Nex Win by contacting&nbsp;info@Nex Win.app</p>\n\n<p>&gt;When a data deletion request is made, we follow a secure deletion process to ensure that the data is completely removed from our servers or retained only in anonymized form. We take precautions to protect information from accidental or malicious deletion. However, please note that there may be slight delays between the deletion request and the removal of data from both our active systems and backup systems.</p>\n\n<p>Applicable law and jurisdiction:<br />\nBy visiting this portal, you agree that the laws of the republic of india without regard to its conflict of laws principles, govern this privacy policy and any dispute arising in respect hereof shall be subject to and governed by the dispute resolution process set out in the&nbsp;terms and conditions.</p>\n\n<p>Updating information:<br />\nYou will promptly notify&nbsp;Nex Win if there are any changes, updates or modifications to your information. further, you may also review, update or modify your information and user preferences by logging into your profile page on the portal.</p>\n\n<p>Contact us:<br />\nAny questions or clarifications with respect to this Policy or any complaints, comments, concerns or feedback can be sent to&nbsp;Nex Win at: info@Nex Win.app or by normal/physical mail addressed to:</p>\n\n<p>Attn: Nex Win Team&nbsp;</p>\nThanks', '', NULL, 1, NULL, NULL),
(2, 2, 'Terms and Conditions (TnC)\n', '<p><strong>1. Introduction</strong></p>\n\n<p>Welcome to Nex Win! By accessing or using our platform, you agree to comply with and be bound by these Terms and Conditions (&quot;Terms&quot;). If you do not agree, please do not use our platform.</p>\n\n<p><strong>2. Account Registration and Security</strong></p>\n\n<ul>\n	<li>Eligibility: Must be 18+.</li>\n	<li>Account Creation: Provide accurate information.</li>\n	<li>Account Security: Notify us of unauthorized use.o</li>\n</ul>\n\n<p><strong>3. User Conduct</strong></p>\n\n<ul>\n	<li>Prohibited Activities: No unlawful activities or harmful behavior.</li>\n	<li>User Content: Grant us a license to use your submitted content.</li>\n</ul>\n\n<p><strong>4. Intellectual Property</strong></p>\n\n<ul>\n	<li>Ownership: All platform content belongs to Nex Win.</li>\n	<li>License: Limited, non-transferable license for personal use.</li>\n</ul>\n\n<p><strong>5. Payments and Refunds</strong></p>\n\n<ul>\n	<li>In-App Purchases: Final and non-refundable.</li>\n	<li>Payment Methods: Provide valid payment methods.</li>\n	<li>Refund Policy: No refunds, except as required by law.</li>\n</ul>\n\n<p><strong>6. Termination</strong></p>\n\n<ul>\n	<li>By Nex Win: We can suspend or terminate accounts.</li>\n	<li>Effect of Termination: Rights to use cease immediately.</li>\n</ul>\n\n<p><strong>7. Disclaimers and Limitation of Liability</strong></p>\n\n<ul>\n	<li>No Warranties: Platform provided &quot;as is.&quot;</li>\n	<li>Limitation of Liability: Not liable for indirect damages.</li>\n</ul>\n\n<p><strong>8. Governing Law and Dispute Resolution</strong></p>\n\n<ul>\n	<li>Governing Law: Local jurisdiction laws apply.</li>\n	<li>Dispute Resolution: Binding arbitration for disputes.</li>\n</ul>\n\n<p><strong>9. Changes to Terms</strong></p>\n\n<ul>\n	<li>We may modify these Terms. Continued use means acceptance of changes.</li>\n</ul>\n\n<p><strong>10. Contact Information</strong></p>\n\n<ul>\n	<li>Email: help.Nexwin@gmail.com</li>\n	<li>https://t.me/nexwin_official</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p><em>By using NexWIn, you agree to these Terms and Conditions.</em></p>', '', NULL, 1, NULL, NULL),
(4, 3, ' Beginners Guide\n', '<p><strong>Welcome to Nex Win: A Beginner&rsquo;s Guide</strong></p>\n\n<p>&nbsp;</p>\n\n<p><strong>1. Getting Started</strong></p>\n\n<p>&nbsp;&nbsp;&nbsp;Sign Up: Create your account with your email or social media.</p>\n\n<p>&nbsp;&nbsp;&nbsp;Profile Setup: Customize your profile with an avatar and username.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>2. Exploring Games</strong></p>\n\n<ul>\n	<li>&nbsp;&nbsp;&nbsp;Aviator: Predict the flight distance of the aviator and win rewards.</li>\n	<li>&nbsp;&nbsp;&nbsp;Color Prediction: Guess the correct color in a series of options.</li>\n	<li>&nbsp;&nbsp;&nbsp;Plinko: Drop the ball and win based on where it lands.</li>\n	<li>&nbsp;&nbsp;&nbsp;Dragon Tiger: Bet on which card (Dragon or Tiger) will be higher.</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p><strong>3. In-Game Currency</strong></p>\n\n<ul>\n	<li>&nbsp;&nbsp;&nbsp;Purchase coins to play games and enter tournaments.</li>\n	<li>&nbsp;&nbsp;&nbsp;Earn rewards through daily login bonuses and challenges.</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p><strong>4. Safety and Fair Play</strong></p>\n\n<ul>\n	<li>&nbsp;&nbsp;&nbsp;We use advanced algorithms to ensure fair play.</li>\n	<li>&nbsp;&nbsp;&nbsp;Report any suspicious activity to our support team.</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p><strong>5. Community and Support</strong></p>\n\n<ul>\n	<li>&nbsp;&nbsp;&nbsp;Join our forums to discuss strategies and meet other players.</li>\n	<li>&nbsp;&nbsp;&nbsp;Contact our support team for any issues or questions.</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p><em>Welcome to the Nex Win community! Have fun and good luck!</em></p>', '', NULL, 1, NULL, NULL),
(5, 4, 'Invitation Rules\r\n', '<p><strong>Nex Win Invitation Rules</strong></p>\n\n<p>&nbsp;</p>\n\n<p><strong>1. Eligibility:</strong></p>\n\n<p>&nbsp;&nbsp;&nbsp;- Only registered users can send invitations.</p>\n\n<p>&nbsp;&nbsp;&nbsp;- Invite friends who are 18 years or older.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>2. Invitation Process:</strong></p>\n\n<p>&nbsp;&nbsp;&nbsp;- Use the unique invitation link found in your profile.</p>\n\n<p>&nbsp;&nbsp;&nbsp;- Share via email, social media, or direct message.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>3. Rewards:</strong></p>\n\n<p>&nbsp;&nbsp;&nbsp;- Earn rewards for each successful referral who registers and plays.</p>\n\n<p>&nbsp;&nbsp;&nbsp;- Both the inviter and the invitee receive bonus coins.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>4. Fair Use:</strong></p>\n\n<p>&nbsp;&nbsp;&nbsp;- Do not spam or misuse the invitation system.</p>\n\n<p>&nbsp;&nbsp;&nbsp;- Invitations must be to genuine friends or contacts.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>5. Monitoring and Abuse:</strong></p>\n\n<p>&nbsp;&nbsp;&nbsp;- We monitor invitation activity.</p>\n\n<p>&nbsp;&nbsp;&nbsp;- Misuse can result in suspension of invitation privileges.</p>\n\n<p>&nbsp;</p>\n\n<p><em>Invite your friends and enjoy the Nex Win experience together!</em></p>\n\n<p>&nbsp;</p>', '', NULL, 1, NULL, NULL),
(6, 5, 'Confidentiality Agreement', '<p><strong>Nex Win Confidentiality Agreement</strong></p>\n\n<p>This Confidentiality Agreement (&ldquo;Agreement&rdquo;) is entered into by and between [Your Name], the &quot;Recipient,&quot; and Nex Win Games, the &quot;Disclosing Party.&quot;</p>\n\n<p>&nbsp;</p>\n\n<p><strong>1. Definition of Confidential Information:</strong></p>\n\n<ul>\n	<li>Includes all non-public information disclosed, such as trade secrets, business plans, and user data.</li>\n</ul>\n\n<p><strong>2. Obligations of Recipient:</strong></p>\n\n<ul>\n	<li>Maintain the confidentiality of the information.</li>\n	<li>Do not disclose to third parties without written consent.</li>\n	<li>Use information solely for the purpose it was provided.</li>\n</ul>\n\n<p><strong>3. Exceptions:</strong></p>\n\n<ul>\n	<li>Information already known to the recipient.</li>\n	<li>Information that becomes public through no fault of the recipient.</li>\n	<li>Information independently developed or obtained by the recipient.</li>\n</ul>\n\n<p><strong>4. Term:</strong></p>\n\n<ul>\n	<li>This Agreement is effective as of the date signed and remains in effect until the confidential information no longer qualifies as confidential or five years, whichever is longer.</li>\n</ul>\n\n<p><strong>5. Miscellaneous:</strong></p>\n\n<ul>\n	<li>Governing Law: [Specify jurisdiction].</li>\n	<li>Amendments: Must be in writing and signed by both parties.</li>\n</ul>\n\n<p>By signing below, both parties agree to the terms of this Confidentiality Agreement.</p>\n\n<p>&nbsp;</p>\n\n<p>Signature: _______ &nbsp; &nbsp; &nbsp; Date: ______</p>\n\n<p>Recipient: _______</p>', '', NULL, 1, NULL, NULL),
(7, 6, 'Risk Disclosure Agreement', '<p><strong>Nex Win Risk Disclosure Agreement</strong></p>\n\n<p>&nbsp;</p>\n\n<p><strong>1. General Risk Acknowledgment:</strong></p>\n\n<ul>\n	<li>Participation in games on Nex Win involves financial risk.</li>\n	<li>You may lose some or all of your money while playing games.</li>\n</ul>\n\n<p><strong>2. No Guarantees:</strong></p>\n\n<ul>\n	<li>Nex Win does not guarantee profits or winnings.</li>\n	<li>Outcomes of games are determined by algorithms and/or chance.</li>\n</ul>\n\n<p><strong>3. User Responsibility:</strong></p>\n\n<ul>\n	<li>You are responsible for all decisions made on the platform.</li>\n	<li>Only play with money you can afford to lose.</li>\n</ul>\n\n<p><strong>4. No Liability:</strong></p>\n\n<ul>\n	<li>Nex Win is not responsible for any losses incurred.</li>\n	<li>We do not provide financial advice or recommendations.</li>\n</ul>\n\n<p><strong>5. Compliance with Laws:</strong></p>\n\n<ul>\n	<li>Ensure your use of Nex Win complies with local laws.</li>\n	<li>It is your responsibility to know and understand the legalities in your jurisdiction.</li>\n</ul>\n\n<p><strong>6. Changes to Risks:</strong></p>\n\n<ul>\n	<li>Nex Win may update this Risk Disclosure Agreement as needed.</li>\n	<li>Continued use of the platform constitutes acceptance of any changes.</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p>By using Nex Win, you acknowledge that you have read and understand this Risk Disclosure Agreement and accept the risks involved.</p>', '', NULL, 1, NULL, NULL),
(8, 7, 'NexWin FAQs', '<p><strong>Nex Win FAQs</strong></p>\n\n<p><strong>1. What is Nex Win?</strong></p>\n\n<p>Nex Win is a multi-gaming platform offering a variety of exciting games, including Aviator, Color Prediction, Plinko, and Dragon Tiger. Our platform provides a thrilling and fair gaming experience with numerous rewards and bonuses.</p>\n\n<p><strong>2. How do I sign up for Nex Win?</strong></p>\n\n<p>Signing up is easy! Click on the &quot;Sign Up&quot; button on our homepage, fill in your details, and create your account. You can also sign up using your social media accounts for quicker access.</p>\n\n<p><strong>3. Is Nex Win free to use?</strong></p>\n\n<p>Yes, creating an account and exploring the platform is free. However, some games and features may require in-app purchases or virtual currency.</p>\n\n<p><strong>4. How do I play the games on Nex Win?</strong></p>\n\n<p>Each game has its own set of rules and instructions. You can find detailed guides within the platform by selecting the game you&rsquo;re interested in. Our Beginner&rsquo;s Guide is also a great resource to get started.</p>\n\n<p><strong>5. What rewards can I earn on Nex Win?</strong></p>\n\n<p>You can earn virtual coins, bonuses, and exclusive prizes by playing games, participating in daily challenges, and inviting friends to join Nex Win.</p>\n\n<p><strong>6. How do I invite friends to Nex Win?</strong></p>\n\n<p>You can invite friends by sharing your unique invitation link found in your profile. Both you and your friend will receive bonus rewards when they sign up and start playing.</p>\n\n<p><strong>7. Are the games on Nex Win fair?</strong></p>\n\n<p>Yes, we use advanced algorithms and random number generators to ensure that all games are fair and transparent. Our priority is to provide a secure and trustworthy gaming environment.</p>\n\n<p><strong>8. How can I purchase virtual currency?</strong></p>\n\n<p>You can purchase virtual currency through our in-app store using various payment methods, including credit/debit cards, PayPal, and more. Check the &quot;Shop&quot; section within the platform for more details.</p>\n\n<p><strong>9. What should I do if I encounter an issue with the platform?</strong></p>\n\n<p>If you experience any issues, please contact our support team via email at support@Nex Win.com or use the live chat feature on our website. We are available 24/7 to assist you.</p>\n\n<p><strong>10. How is my personal information protected?</strong></p>\n\n<p>We take your privacy seriously. Nex Win uses industry-standard encryption and security measures to protect your personal information. For more details, please read our Privacy Policy.</p>\n\n<p><strong>11. Can I close my Nex Win account?</strong></p>\n\n<p>Yes, if you wish to close your account, please contact our support team. Keep in mind that closing your account is permanent, and you will lose access to all your progress and rewards.</p>\n\n<p><strong>12. How do I stay updated with Nex Win&rsquo;s latest news and promotions?</strong></p>\n\n<p>Follow us on our social media channels (Facebook, Twitter, Instagram) and subscribe to our newsletter to stay updated on the latest news, promotions, and events.</p>\n\n<p><strong>13. Is there an age requirement to use Nex Win?</strong></p>\n\n<p>Yes, you must be at least 18 years old to create an account and use the Nex Win platform.</p>\n\n<p><strong>14. How do I update my account information?</strong></p>\n\n<p>You can update your account information by going to your profile settings within the platform. Make sure to save any changes you make.</p>\n\n<p><strong>15. Are there any community guidelines I should follow?</strong></p>\n\n<p>Yes, we have community guidelines to ensure a positive and respectful environment for all players. Please refer to our Terms and Conditions for detailed information on acceptable behavior.</p>\n\n<p><strong>16. What if I forget my password?</strong></p>\n\n<p>If you forget your password, click on the &quot;Forgot Password&quot; link on the login page and follow the instructions to reset it.</p>\n\n<p><strong>17. How do I report a bug or provide feedback?</strong></p>\n\n<p>We appreciate your feedback! You can report bugs or provide feedback by contacting our support team or using the feedback form available on the platform.</p>\n\n<p><strong>18. What happens if my account is suspended?</strong></p>\n\n<p>If your account is suspended, you will receive an email explaining the reason. Please contact our support team for further assistance and to resolve the issue.</p>\n\n<p>&nbsp;</p>\n\n<p><em>If you have any other questions or need further assistance, please don&#39;t hesitate to reach out to our support team. We&#39;re here to help you enjoy your Nex Win experience to the fullest!</em></p>\n\n<p>&nbsp;</p>', '', NULL, 1, NULL, NULL),
(9, 8, 'NexWinGame Rule', '<p>1 minutes 1 issue, 55 seconds to order, 5 seconds waiting for the draw. It opens all day. The total number of trade is 1440 issues.</p>\n  <p>If you spend 100 to trade, after deducting service fee 2%, contract amount : 98</p>\n  <ol>\n    <li>Select green: if the result shows 1,3,7,9 you will get (98*2)=196;If the result shows 5, you will get (98*1.5) 147</li>\n    <li>Select red: if the result shows 2,4,6,8 you will get</li>\n    <li>Select violet: if the result shows 0 or 5, you will get</li>\n    <li>Select number: if the result is the same as the number you selected, you will get</li>\n    <li>Select big: if the result shows 5,6,7,8,9 you will get</li>\n    <li>Select small: if the result shows 0,1,2,3,4 you will get</li>\n  </ol>', '', NULL, 1, NULL, NULL);
INSERT INTO `settings` (`id`, `type`, `name`, `description`, `link`, `image`, `status`, `created_at`, `updated_at`) VALUES
(10, 9, 'Trx game rule', '<div data-v-73484f00=\"\" class=\"TimeLeft__C-PreSale-body\">\n    <div data-v-73484f00=\"\">\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\">What is a hash value?\n                                                            </font>\n                                                        </font>\n                                                    </font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font>\n        </p>\n        <p class=\"MsoNormal\"><span style=\"font-family: Verdana;\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\">Anyone who knows the basics of Bitcoin will\n                                        be exposed to a concept, a hash value. Bitcoin\'s block header has a hash of the\n                                        previous block in it, which is used to point to the previous block.</font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </span><br></p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\"><br></font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\">Hash is the\n                                                                transliteration of English hash, we can also translate\n                                                                it into hash, so hash value is also called hash value. A\n                                                                hash value is a value calculated with a hash function\n                                                                (or hash function/hash algorithm). To understand hash\n                                                                values, one must understand the nature of hash\n                                                                functions. A hash function can computationally transform\n                                                                an input of arbitrary length into an output of fixed\n                                                                length.</font>\n                                                        </font>\n                                                    </font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\"><br></font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\">Every hash function\n                                                                has the property that if the input value is the same,\n                                                                the output hash value is the same. If the input values\n                                                                &ZeroWidthSpace;&ZeroWidthSpace;&ZeroWidthSpace;&ZeroWidthSpace;&ZeroWidthSpace;&ZeroWidthSpace;&ZeroWidthSpace;&ZeroWidthSpace;&ZeroWidthSpace;&ZeroWidthSpace;&ZeroWidthSpace;&ZeroWidthSpace;are\n                                                                different, the output hashes are usually different, but\n                                                                there is a very small chance of a hash collision . If a\n                                                                hash collision is ruled out with a slight change in the\n                                                                input value, a completely unrelated hash value is\n                                                                output. Since the hash function is irreversible and easy\n                                                                to verify, it is almost impossible to reverse the input\n                                                                value through the output hash value. If there is an\n                                                                input value, the corresponding hash value can be\n                                                                verified immediately.</font>\n                                                        </font>\n                                                    </font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\"><br></font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\">Therefore, the hash\n                                                                value of each block is unique, random, unbreakable,\n                                                                unforgeable, the block hash value is automatically\n                                                                identified, and the record cannot be tampered with.\n                                                            </font>\n                                                        </font>\n                                                    </font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font>\n        </p>\n        <p class=\"MsoNormal\"><span style=\"font-family: Verdana;\"><br></span></p>\n        <p class=\"MsoNormal\"><span style=\"font-family: Verdana;\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\">How many types of USDT are there?</font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </span><br></p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\"><br></font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\">1. Omni-USDT based on\n                                                                the Bitcoin network, the deposit address is the BTC\n                                                                address, and the deposit and withdrawal go through the\n                                                                BTC network;</font>\n                                                        </font>\n                                                    </font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\"><br></font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\">2. ERC20-USDT based\n                                                                on the Ethereum ERC20 protocol, the deposit address is\n                                                                the ETH address, and the deposit and withdrawal go\n                                                                through the ETH network;</font>\n                                                        </font>\n                                                    </font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\"><br></font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\">3. TRC20-USDT based\n                                                                on TRON TRC20 protocol and TRX (TRON) network, the\n                                                                deposit address is the TRON address, and the deposit and\n                                                                withdrawal go through the TRON network.</font>\n                                                        </font>\n                                                    </font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\"><br></font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\">TrxHash is the\n                                                                TRC20-USDT Block hash based on the TRON TRC20 protocol\n                                                                and TRX (TRON) network. The last number is used as the\n                                                                result of the lottery to determine whether you have won\n                                                                the lottery (click Block Height to go to the public\n                                                                chain to query the unique Block hash)</font>\n                                                        </font>\n                                                    </font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\"><br></font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\"></font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\"><br></font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\">The rules of play are\n                                                                as follows:</font>\n                                                        </font>\n                                                    </font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font>\n        </p>\n        <p class=\"MsoNormal\"><span style=\"font-family: Verdana;\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">1. 1 lottery draw for 1 minute, purchase within 45\n                                seconds, and the result cannot be purchased within 15 seconds before opening.</font>\n                        </font>\n                    </font>\n                </font>\n            </span><br></p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\"><br></font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\">2. Purchase All Day\n                                                                Unlock. The total number of purchases in one day is\n                                                                1440.</font>\n                                                        </font>\n                                                    </font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\"><br></font>\n        </p>\n        <p class=\"MsoNormal\"><span style=\"font-family: Verdana;\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\">3. 3 points 1 time, 5 points\n                                                        1 time, 10 points 1 time, the rules are the same as 1 point 1\n                                                        time except the draw time is different.</font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </span><br></p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\"><br></font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\">4. The last digit of\n                                                                the Block hash is used as the lottery result:</font>\n                                                        </font>\n                                                    </font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\"><br></font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\">Eg:</font>\n                                                        </font>\n                                                    </font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font>\n        </p>\n        <p class=\"MsoNormal\"><span style=\"font-family: Verdana;\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\">If the hash value is **b569, the lottery\n                                        result is 9</font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </span><br></p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\">Hash value **d14c,\n                                                                the lottery result is 4</font>\n                                                        </font>\n                                                    </font>\n                                                </font><br>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font><span style=\"font-family: 宋体;\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\"> if you spend 100 to trade, after deducting service\n                                fee 2%, contract amount : 98</font>\n                        </font>\n                    </font>\n                </font>\n            </span>\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\"><br></font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\" class=\"\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\" class=\"\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\" class=\"\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\">\n                                                                <font style=\"vertical-align: inherit;\">\n                                                                    <font style=\"vertical-align: inherit;\">l Choose\n                                                                        green: if the result shows 1,3,7,9, you will get\n                                                                    </font>\n                                                                </font>\n                                                            </font>\n                                                        </font>\n                                                    </font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font><span style=\"font-family: Verdana;\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\" class=\"\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\" class=\"\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\" class=\"\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\"> (98 * 2) =196</font>\n                                                        </font>\n                                                    </font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </span>\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\" class=\"\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\" class=\"\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\" class=\"\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\">\n                                                                <font style=\"vertical-align: inherit;\">\n                                                                    <font style=\"vertical-align: inherit;\"> ; if the\n                                                                        result shows 5, you will get</font>\n                                                                </font>\n                                                            </font>\n                                                        </font>\n                                                    </font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font><span style=\"font-family: Verdana;\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\"> (98 * 2) = 196</font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </span><br>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\"><br></font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\" class=\"\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\" class=\"goog-text-highlight\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\">\n                                                                <font style=\"vertical-align: inherit;\">\n                                                                    <font style=\"vertical-align: inherit;\">l choose red:\n                                                                        if the result shows 2,4,6,8, you will get</font>\n                                                                </font>\n                                                            </font>\n                                                        </font>\n                                                    </font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font><span style=\"font-family: Verdana;\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\"> (98 * 2) =196</font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </span>\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\" class=\"\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\" class=\"\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\">; if the result shows\n                                                                0, you will get</font>\n                                                        </font>\n                                                    </font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font><span style=\"font-family: Verdana;\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\">(98 * 2) = 196</font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </span>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\"><br></font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\" class=\"\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\">l choose purple: if\n                                                                the result shows 0 or 5, you will get </font>\n                                                        </font>\n                                                    </font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font><span style=\"font-family: Verdana;\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\"> (98 * 2) = 196</font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </span>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\"><br></font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\" class=\"\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\" class=\"\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\" class=\"\">l Select the\n                                                                number: If the result of opening is the same as the one\n                                                                you selected, you will get </font>\n                                                        </font>\n                                                    </font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font><span style=\"font-family: Verdana;\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\" class=\"\"> (98 * 9) = 882</font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </span>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\"><br></font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\" class=\"\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\" class=\"\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\">l Choose Big: if the\n                                                                result shows 5,6,7,8,9 you will get </font>\n                                                        </font>\n                                                    </font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font>\n            <font style=\"vertical-align: inherit;\"><span style=\"font-family: Verdana;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\"> (98 * 2) = 196</font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </span></font><span style=\"font-family: Verdana;\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\" class=\"\"></font>\n                        </font>\n                    </font>\n                </font>\n            </span><span style=\"font-family: Verdana;\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\"></font>\n                    </font>\n                </font>\n            </span>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\"><br></font>\n        </p>\n        <p class=\"MsoNormal\">\n            <font face=\"Verdana\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\">\n                                        <font style=\"vertical-align: inherit;\">\n                                            <font style=\"vertical-align: inherit;\" class=\"\">\n                                                <font style=\"vertical-align: inherit;\">\n                                                    <font style=\"vertical-align: inherit;\">\n                                                        <font style=\"vertical-align: inherit;\">\n                                                            <font style=\"vertical-align: inherit;\">l Select Small: if\n                                                                the result shows 0,1,2,3,4 you will get </font>\n                                                        </font>\n                                                    </font>\n                                                </font>\n                                            </font>\n                                        </font>\n                                    </font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </font>\n            </font>\n            <font style=\"vertical-align: inherit;\"><span style=\"font-family: Verdana;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\">\n                                <font style=\"vertical-align: inherit;\">\n                                    <font style=\"vertical-align: inherit;\"> (98 * 2) = 196</font>\n                                </font>\n                            </font>\n                        </font>\n                    </font>\n                </span></font><span style=\"font-family: Verdana;\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\">\n                            <font style=\"vertical-align: inherit;\" class=\"\"></font>\n                        </font>\n                    </font>\n                </font>\n            </span><span style=\"font-family: Verdana;\">\n                <font style=\"vertical-align: inherit;\">\n                    <font style=\"vertical-align: inherit;\">\n                        <font style=\"vertical-align: inherit;\"></font>\n                    </font>\n                </font>\n            </span>\n        </p>\n    </div>\n</div>\n', '', NULL, 1, NULL, NULL);
INSERT INTO `settings` (`id`, `type`, `name`, `description`, `link`, `image`, `status`, `created_at`, `updated_at`) VALUES
(11, 10, 'Rules And Regulations', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n  <meta charset=\"UTF-8\">\n  <title>Betting Rules</title>\n</head>\n<body>\n\n  <h2>Introduction Section (Part A)</h2>\n  <p>The General Rules (Set out in Part B below); and The Specific Sports Rules (set out in Part C below - these apply to certain sports).</p>\n  <p>The General Rules apply to all bets unless stated otherwise in the Specific Sports Rules. If there is any inconsistency between the Specific Sports Rules and the General Rules, the Specific Sports Rules shall prevail.</p>\n  <p>The rules governing how markets are offered, managed and/or settled are not the same for every market on each product. In certain circumstances, a bet that is settled as a winner on one product may be settled as a loser on the other product (and vice versa). Additionally, different settlement rules may apply so that, for example, bets that are a winner on one product may be settled as a dead heat or be voided on the other product. Customers must ensure that they familiarise themselves with the relevant rules that apply to the bets that they place on the Site.</p>\n\n  <h3>Customer Responsibility</h3>\n  <p>Customers should make themselves aware of all of the Rules affecting any market on which they wish to place a bet.</p>\n  <p>In particular, customers who use the \"one-click\" option to place bets are solely responsible for their actions and the Site shall have no liability to such customers for any errors made by customers when using this option.</p>\n\n  <h2>PART B - GENERAL RULES</h2>\n\n  <h3>Matters beyond the Site\'s reasonable control and malfunctions</h3>\n  <p>The Site is not liable for any loss or damage you may suffer because of any:</p>\n  <ul>\n    <li>Act of God.</li>\n    <li>Power cut.</li>\n    <li>Trade or labour dispute.</li>\n    <li>Act, failure or omission of any government or authority.</li>\n    <li>Obstruction or failure of telecommunication services.</li>\n    <li>Any other delay or failure caused by a third party or otherwise outside of our control.</li>\n  </ul>\n  <p>In such an event, the Site reserves the right to cancel or suspend access to the Site without incurring any liability.</p>\n  <p>The Site is not liable for the failure of any equipment or software howsoever caused, wherever located or administered, or whether under its direct control or not, that may prevent the operation of the Site.</p>\n  <p>In the event of a technological failure or error which is apparent to the customer, the customer is obliged to notify the Site of such failure/error immediately. If the customer continues to place a bet in these circumstances, they shall take reasonable action to minimise any potential loss. In the absence of such action, the Site reserves the right to void a bet.</p>\n  <p>The Site reserves the right in its absolute discretion to restrict access to the Site, or withhold funds or void any bets outstanding to a customer’s account in its absolute discretion in the event of a technological failure or other malfunction which affects the integrity of the Site whether this is under its direct control or otherwise. Customers will be notified on the Site of any such malfunction which may operate to prevent the placing of further bets or which may result in outstanding bets being voided.</p>\n\n  <h3>Managing markets In-Play</h3>\n  <h4>General</h4>\n  <p>For everything other than horseracing and greyhound racing, if a market is not scheduled to be turned in-play but the Site fails to suspend the market at the relevant time, then:</p>\n  <ul>\n    <li>If the event has a scheduled \'off\' time, all bets matched after that scheduled off time will be void.</li>\n    <li>If the event does not have a scheduled \'off\' time, the Site will use its reasonable endeavours to ascertain the time of the actual \'off\' and all bets after the time of the \'off\' determined by the Site will be void.</li>\n  </ul>\n  <p>For horseracing and greyhound racing, if a market is not scheduled to be turned in-play but the Site fails to suspend the market at the relevant time, then all bets matched after the official \'off\' time will be void.</p>\n  <p>The Site aims to use its reasonable endeavours to suspend in-play markets at the start of and at the end of the event. However, the Site does not guarantee that such markets will be suspended at the relevant time.</p>\n  <p>Customers are responsible for managing their in-play bets at all times.</p>\n  <p>For the purposes of in-play betting, customers should be aware that transmissions described as \"live\" by some broadcasters may actually be delayed or pre-recorded. The extent of any delay may vary depending on the set-up through which they are receiving pictures or data.</p>\n\n  <h4>All markets other than soccer markets - not suspending at the time of the \'off\'</h4>\n  <p>In relation to markets which are scheduled to be turned in-play, the Site aims to use its reasonable endeavours to turn such markets in-play at the time of the \'off\'. However, the Site does not guarantee that such markets will be suspended and turned in-play at the time of the \'off\'.</p>\n  <p>If a market is scheduled to be turned in-play but the Site does not suspend the market and cancel unmatched bets at the time of the \'off\' and the market is not turned in-play with unmatched bets cancelled at any time during the event, all bets matched after the scheduled time of the \'off\' will be void (in the case of horseracing and greyhound racing, bets will be void from the official rather than the scheduled \'off\' time). If the event does not have a scheduled \'off\' time, the Site will use its reasonable endeavours to ascertain the time of the actual \'off\' and all bets after the time of the \'off\' determined by the Site will be void.</p>\n  <p>If a market is scheduled to be turned in-play but the Site does not suspend the market at the time of the \'off\' (so unmatched bets are not cancelled at that time), but the market is intentionally turned in-play at a later time during the event, all bets matched after the time of the \'off\' will stand.</p>\n\n  <h4>Soccer markets - not suspending at kick-off or on the occurrence of a Material Event and rules relating to VAR</h4>\n  <h5>Not suspending at kick-off</h5>\n  <p>In relation to soccer markets that are scheduled to be turned in-play, the Site aims to use its reasonable endeavours to turn such markets in-play at kick-off and to suspend such markets on the occurrence of a Material Event (see definition of \"Material Event\" below).</p>\n  <p>The Site does not guarantee that such markets will be suspended and turned in-play at kick-off.</p>\n  <p>If a market is scheduled to be turned in-play but the Site does not suspend the market at kick-off and the market is not turned in-play at any time during the match, all bets matched after the scheduled time of the kick-off will be void.</p>\n  <p>If a market is scheduled to be turned in-play but the Site does not suspend the market at kick-off (so unmatched bets are not cancelled at that time), but the market is turned in-play at a later time during the match, all bets matched after the scheduled time of the kick-off and before the first \"Material Event\" will stand. However, if there has been one or more \"Material Events\", any bets matched between the first \"Material Event\" and the market being turned in-play will be void.</p>\n\n  <h5>Not suspending on the occurrence of a Material Event and cancellations of Material Events due to VAR</h5>\n  <p>If the Site does not suspend a market on time for the occurrence of a Material Event, the Site reserves the right to void bets unfairly matched after the Material Event has occurred. Voiding of these bets may take place during the event or retrospectively once a game is completed.</p>\n  <p>Where a Material Event is cancelled due to a determination made via a video assistant referee, the Site will void all bets which are matched between the occurrence of the Material Event and the cancellation of it. The voiding of any such bets may take place during the event or retrospectively once a game is completed.</p>\n\n  <h5>Definition of \"Material Event\"</h5>\n  <p>For the purpose of these Rules, a \"Material Event\" shall mean a goal being scored, a penalty being awarded or a player being sent off.</p>\n\n  <h3>Results and market settlement</h3>\n  <h4>General</h4>\n  <p>Markets will be settled in accordance as set out in the Specific Sports Rules.</p>\n  <p>Where the Specific Sports Rules do not specify how and on what basis a market will be settled, markets will be settled on the official result of the relevant governing body regardless of any subsequent disqualification or amendment to the result (except if an amendment is announced within 24 hours of the initial settlement of the relevant market in order to correct an error in reporting the result).</p>\n  <p>If no official result of a relevant governing body is available, the result will be determined by the Site (acting reasonably) using information from independent sources. In such cases, if any new information comes into the public domain within 48 hours of settlement, then the Site shall (acting reasonably) determine either: (i) whether the market should be reinstated or resettled in light of this new information; or (ii) whether or not to wait for further information before deciding whether to reinstate or resettle the market. Except where the Site has announced that it is waiting for further information, any information that comes into the public domain more than 48 hours after a market has been settled shall not be considered by the Site (regardless of whether or not such information may have led to a different result).</p>\n  <p>In the event of any uncertainty about any result or potential result, the Site reserves the right to suspend settlement of any market for an unlimited period until the uncertainty can be resolved to the reasonable satisfaction of the Site. The Site reserves the right to void any market if the uncertainty regarding settlement cannot be resolved to the Site\'s reasonable satisfaction.</p>\n\n  <h4>Resettlements</h4>\n  <p>Markets are generally settled shortly after the end of the event in question. The Site may settle (or part-settle) some markets before the official result is declared (or may increase a customer\'s \'available to bet\' balance by the minimum potential winnings of that customer on a given market) purely as a customer service benefit. However, the Site reserves the right to amend the settlement of the market if: (i) the official result is different to the result on which the Site initially settled the market; or (ii) if the whole market is eventually voided (e.g. for an abandoned event).</p>\n  <p>The Site reserves the right to reverse the settlement of a market if a market is settled in error (for example, a human or technical error).</p>\n  <p>If The Site resettles a market, this may lead to amendments being made to a customer\'s balance to reflect changes in market settlement.</p>\n\n  <h4>Non-runners, Withdrawals and Disqualifications</h4>\n  <p>Subject always to the Site\'s right to void bets under its terms and conditions or for any exception under the Rules, if a market contains a statement that says \"All bets stand, run or not\" (or something similar), then all bets on a team or competitor will stand regardless of whether or not the team or competitor starts the event or takes any part in the event.</p>\n  <p>If a team or competitor is disqualified, withdraws or forfeits after starting an event they will be deemed a loser providing at least one other team or competitor completes the event. If no team or competitor completes an event (having started) then all bets will be void except for bets on any markets which have been unconditionally determined.</p>\n\n  <h4>Winner With [named selection]\' markets</h4>\n  <p>The Site may from time to time offer markets that are dependent on the participation of a particular competitor. If the competitor named in a \'Winner with …\' market title does not participate in the tournament or event then all bets on the market will be void.</p>\n  <p>A team or competitor will be deemed to have participated if they have taken part to the extent necessary to record an official result or classification (including any disqualification but excluding any \"did not start\" or equivalent classification).</p>\n\n  <h4>Abandonments, Cancellations, Postponements</h4>\n  <p>Some markets have different rules and these are listed in the Specific Sports Rules. However, where a market has no rules in the Specific Sports Rules in relation to an abandonment, cancellation and/or postponement the following shall apply.</p>\n  <p><strong>In relation to any match, fixture, game, individual event, or similar:</strong> If the event is not completed within three days after the scheduled completion date, then all bets on markets for this event will be void, except for bets on any markets that have been unconditionally determined.</p>\n  <p><strong>In relation to any tournament, competition or similar:</strong> If the event is not completed within three days after the scheduled completion date, then any markets relating to the event will be settled in accordance with the official ruling of the relevant governing body, providing such a decision is given within 90 days after the scheduled completion date. If no official ruling is announced in this 90 day period, then bets on any market relating to this event will be void, except for bets on any markets which have been unconditionally determined. If a market is to be voided but has been part-settled as a courtesy to customers, then such part-settled bets will be reversed and all bets on the market will be void.</p>\n  <p>The Site will decide (acting reasonably) whether a market relates to a match (or similar) or a tournament (or similar).</p>\n\n  <h4>Change of venue</h4>\n  <p>Some markets have different rules and these are listed in the Specific Sports Rules. However, if change of venue is not dealt with in the Specific Sports Rules then the following shall apply:</p>\n  <ul>\n    <li>For any team sport: if the scheduled venue is changed after the market is loaded by the Site, all bets will be void only if the new venue is a home ground of the original away team.</li>\n    <li>For all categories or markets other than team sports: if the scheduled venue is changed after the market is loaded by the Site, all bets will stand.</li>\n    <li>If there is a change in the type of scheduled surface after the market has been loaded, all bets will stand.</li>\n  </ul>\n\n  <h4>Periods of time</h4>\n  <p>Some markets have different rules and these are listed in the Specific Sports Rules. However, if not dealt with in the Specific Sports Rules then the following shall apply.</p>\n  <p>If the scheduled duration of an event is changed after the market has been loaded but before the start of the event, then all bets will be void.</p>\n  <p>Some markets refer to the length of time until an occurrence in the event (e.g. time of first goal). If an event happens in stoppage or injury time after any regular time period then it will be deemed to have occurred at the end of the regular time period. For example, if a goal is scored in first half stoppage-time in a soccer match it will be deemed to have occurred on 45 minutes.</p>\n  <p>All bets apply to the relevant full \'regular time\' period including stoppage time. Any extra-time and/or penalty shoot-out is not included.</p>\n  <p>References within these Rules to a particular number of \'days\' shall mean the end of the day local time after the expiry of the specified number of days.</p>\n\n  <h4>\"To qualify\" markets</h4>\n  <p>Some markets have different rules and these are listed in the Specific Sports Rules. However, if not dealt with in the Specific Sports Rules then the following shall apply.</p>\n  <p>Any \"to qualify\" market (e.g. \"to reach the final\" markets) will be determined by the competitor or team that qualifies, whether or not they take part in the next round or event for which they have qualified. Markets will be settled after the qualifying stage and any subsequent disqualification or amendment to the result will not count.</p>\n\n  <h3>Cross betting</h3>\n  <p>Cross betting is strictly prohibited on our platform. Cross betting refers to the act of placing a bet on our website and simultaneously placing an opposite or conflicting bet on another platform or site for the same event.</p>\n  <p>If a player is found engaging in cross betting, their account may be suspended or permanently blocked without any prior warning or notice. Any winnings obtained through cross betting will be considered invalid and may be forfeited.</p>\n  <p>We reserve the right to take immediate action to maintain fair gameplay and protect the integrity of our platform.</p>\n\n  <h3>Dead heats</h3>\n  <p>Unless stated otherwise in the Specific Sports Rules the Dead Heat Rule applies to bets on a market where there are more winners than expected.</p>\n  <p>For each bet matched on a relevant winning selection, the stake money is first reduced in proportion by multiplying it by the sum of the number of winners expected, divided by the number of actual winners (i.e. stake multiplied by (number of winners expected/number of actual winners)). The winnings are then paid to the successful backers on this \'reduced stake\' (reduced stake multiplied by traded price) and the remaining stake money is paid to the appropriate layers.</p>\n\n  <h3>Miscellaneous</h3>\n  <ul>\n    <li>All references to time periods in the Rules relate to the time zone in which the event takes place.</li>\n    <li>All information supplied by the Site is done so in good faith. However, the Site cannot accept liability for any errors or omissions in respect of any information, such as the posting of prices, runners, times, scores, results or general statistics.</li>\n    <li>The Site reserves the right to correct any obvious errors and shall take all reasonable steps to ensure markets are administered with integrity and transparency.</li>\n    <li>If an incorrect team or competitor name is displayed (excluding minor spelling mistakes) or the incorrect number of teams, competitors or outcomes is displayed in any complete market or section of a market, then the Site reserves the right to void bets.</li>\n    <li>If a customer has made a bet on the basis of a palpable error (i.e. where an incorrect price is offered that is materially different from those available in the general market at the time the bet was made), the Site reserves the right to void the bet.</li>\n  </ul>\n\n  <h2>PART C - SPECIFIC SPORTS RULES</h2>\n  <p>The Specific Sports Rules set out in this Part C are rules relating to specific sports, and these rules shall apply to the relevant sports in conjunction with the General Rules set out in Part B above. In the event of any inconsistency between the Specific Sports Rules and the General Rules, the Specific Sports Rules shall prevail.</p>\n\n</body>\n</html>\n', '', NULL, 1, NULL, NULL),
(12, 11, 'Responsible Gaming Policy', ' <h1>Nex Win – Responsible Gaming Policy</h1>\n\n  <p>\n    At Nex Win, we are strongly committed to promoting Responsible Gambling. \n    Our goal is to provide a safe, fair, and enjoyable gaming environment for all players. \n    While gaming is a form of entertainment, we recognize that for some, it may become difficult to manage.\n  </p>\n\n  <p>\n    To support our players, we provide tools and features that can help you stay in control of your gaming activity:\n  </p>\n\n  <h2>✅ Player Protection Tools</h2>\n\n  <h3>Deposit Limits</h3>\n  <p>Set a daily, weekly, or monthly limit on how much you can deposit.</p>\n\n  <h3>Time-Out Option</h3>\n  <p>Take a short break from gaming by temporarily suspending your account for:</p>\n  <ul>\n    <li>24 hours</li>\n    <li>1 week</li>\n    <li>1 month</li>\n    <li>Or up to 6 weeks (based on your request)</li>\n  </ul>\n\n  <h3>Self-Exclusion</h3>\n  <p>\n    Choose to block your account for a longer period (minimum 6 months).<br>\n    During this period, your account will remain locked and cannot be reopened.<br>\n    Once the self-exclusion period ends, you may contact our support team to request reactivation.\n  </p>\n\n  <h2>⚠️ Important Note</h2>\n  <p>\n    Self-exclusion requests are final and cannot be reversed until the chosen time period has expired.\n  </p>\n  <p>\n    If you feel you are losing control of your gaming, we strongly encourage you to use these tools or seek professional help.\n  </p>\n\n  <p>\n    At Nex Win, your safety and well-being come first. \n    We urge all players to play responsibly, within their limits, and only for entertainment purposes.\n  </p>\n\n  <p>\n    For assistance or to activate any of the above features, please contact our Nex Win Support Team.\n  </p>', '', NULL, 1, NULL, NULL),
(13, 12, 'Privacy Policy', '<h1>Nex Win – Terms & Conditions</h1>\n\n  <div class=\"section\">\n    <h2>1. Eligibility</h2>\n    <p>You must be 18+ years old and from a region where online gaming & betting is legally permitted.</p>\n    <p>It is your responsibility to follow local laws. Nex Win is not liable for consequences arising from violations.</p>\n  </div>\n\n  <div class=\"section\">\n    <h2>2. Deposits & Withdrawals</h2>\n    <ul>\n      <li>Deposit limits may vary based on account history and verification.</li>\n      <li>Withdrawals will always be processed to the same payment source used for deposit.</li>\n      <li>Proof of identity and address may be required before withdrawals.</li>\n      <li>All payments are processed via secure gateways (including 3D Secure for cards).</li>\n    </ul>\n  </div>\n\n  <div class=\"section\">\n    <h2>3. Account & Security</h2>\n    <ul>\n      <li>You agree to provide accurate details (Name, DOB, Email, ID proof, etc.) during registration.</li>\n      <li>Misuse, multiple accounts, fraudulent activity, or cross-betting (placing bets against Nex Win on other sites) may result in suspension or permanent ban without notice.</li>\n      <li>Your account credentials must be kept secure. Nex Win is not responsible for unauthorized use due to user negligence.</li>\n    </ul>\n  </div>\n\n  <div class=\"section\">\n    <h2>4. Privacy & Data Usage</h2>\n    <ul>\n      <li>Nex Win respects your privacy and collects only necessary data for account management, security, and compliance.</li>\n      <li>Data collected may include personal details, payment info (encrypted), device & location info, and usage behavior.</li>\n      <li>Your data will never be sold, but may be shared with affiliates, payment partners, or legal authorities when required.</li>\n      <li>Cookies may be used to improve user experience.</li>\n    </ul>\n  </div>\n\n  <div class=\"section\">\n    <h2>5. Fair Play & Betting Permissions</h2>\n    <ul>\n      <li>Nex Win may restrict or allow certain games/bet types based on permissions.</li>\n      <li>Players must ensure they have sufficient balance before placing bets.</li>\n      <li>Any attempt to manipulate game outcomes or abuse promotions may result in account action.</li>\n    </ul>\n  </div>\n\n  <div class=\"section\">\n    <h2>6. Liability Disclaimer</h2>\n    <ul>\n      <li>All games are for entertainment with real monetary risk. Play responsibly.</li>\n      <li>Nex Win is not liable for network issues, technical errors, or third-party system failures.</li>\n      <li>Maximum liability of Nex Win in any dispute shall not exceed ₹100.</li>\n    </ul>\n  </div>\n\n  <div class=\"section\">\n    <h2>7. Account Closure & Data Deletion</h2>\n    <ul>\n      <li>You may request account suspension, deactivation, or permanent deletion via our support team.</li>\n      <li>Upon deletion, all data will be erased (except where retention is required by law).</li>\n      <li>Accounts inactive or in violation of terms may be closed by Nex Win.</li>\n    </ul>\n  </div>\n\n  <div class=\"section\">\n    <h2>8. Updates & Changes</h2>\n    <p>Nex Win may update these Terms & Privacy Policy anytime. Continued use of the platform means acceptance of changes.</p>\n  </div>\n\n  <div class=\"section\">\n    <h2>9. Governing Law</h2>\n    <p>All disputes are subject to the laws of the Republic of India and under the jurisdiction of Indian courts.</p>\n  </div>\n\n  <div class=\"section\">\n    <h2>10. Contact Us</h2>\n    <p>For support, queries, or account-related issues, reach out to our official support team via WhatsApp or email (details on the site).</p>\n  </div>', '', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `activity_image` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `active_from` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `image`, `activity_image`, `link`, `active_from`, `status`, `created_at`, `updated_at`) VALUES
(18, 'feedback', 'https://root.nexwin.vip/uploads/sliders/slider1.png', 'https://root.nexwin.vip/uploads/sliders/1763996031_activity_WhatsApp Image 2025-11-23 at 22.37.19_a1fdc672.jpg', NULL, NULL, 1, '2025-11-24 20:23:51', '2025-11-24 20:23:51'),
(19, 'offer', 'https://root.nexwin.vip/uploads/sliders/slider2.png', 'https://root.nexwin.vip/uploads/sliders/1765693641_activity_WB 09 WEB.png', NULL, NULL, 1, '2025-12-14 11:57:21', '2025-12-14 11:57:21'),
(20, 'offer', 'https://root.nexwin.vip/uploads/sliders/slider3.png', 'https://root.nexwin.vip/uploads/sliders/1765694499_activity_B04 FOR WEB (2).png', NULL, NULL, 1, '2025-12-14 12:11:39', '2025-12-14 12:11:39'),
(21, 'jn', 'https://root.nexwin.vip/uploads/sliders/slider4.png', 'https://root.nexwin.vip/uploads/sliders/1766752548_activity_NEW YEAR OFFER 2026 WEB.png', 'https://nexwin.vip/', '2025-12-27 17:29:00', 1, '2025-12-26 18:05:48', '2025-12-26 18:05:48');

-- --------------------------------------------------------

--
-- Table structure for table `subcat_list`
--

CREATE TABLE `subcat_list` (
  `id` int(55) NOT NULL,
  `cat_id` int(55) NOT NULL,
  `cat_name` varchar(55) NOT NULL,
  `sub_cat_id` int(55) NOT NULL,
  `sub_cat_name` varchar(55) NOT NULL,
  `image` varchar(555) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `subcat_list`
--

INSERT INTO `subcat_list` (`id`, `cat_id`, `cat_name`, `sub_cat_id`, `sub_cat_name`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'all', 1, 'Dragon Tiger', 'https://root.winbhai.in/public/sub_cat_img_jili/all/Dragon tiger.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(2, 1, 'all', 2, 'Aviator', 'https://root.winbhai.in/public/sub_cat_img_jili/all/Aviator.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(3, 1, 'all', 3, 'Mines', 'https://root.winbhai.in/public/sub_cat_img_jili/all/mines.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(4, 1, 'all', 4, 'Colour Games', 'https://root.winbhai.in/public/sub_cat_img_jili/all/colour games.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(5, 1, 'all', 5, 'Colour Prediction', 'https://root.winbhai.in/public/sub_cat_img_jili/all/color_prediction.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(6, 1, 'all', 6, 'Andar Bahar', 'https://root.winbhai.in/public/sub_cat_img_jili/all/andar bahar.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(7, 1, 'all', 7, 'Teen Patti', 'https://root.winbhai.in/public/sub_cat_img_jili/all/live teen patti.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(8, 1, 'all', 8, 'Lottery', 'https://root.winbhai.in/public/sub_cat_img_jili/all/Lottery.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(9, 1, 'all', 9, 'Live Lobby', 'https://root.winbhai.in/public/sub_cat_img_jili/all/live lobby.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(10, 1, 'all', 10, 'Crash Games', 'https://root.winbhai.in/public/sub_cat_img_jili/all/crash games.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(11, 1, 'all', 11, 'Casual Games', 'https://root.winbhai.in/public/miss/casual.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(12, 1, 'all', 12, 'Scratch Cards', 'https://root.winbhai.in/public/bggaming/scratch-card.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(13, 1, 'all', 13, 'Slot Games', 'https://root.winbhai.in/public/miss/slot.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(14, 1, 'all', 14, 'Live Blackjack', 'https://root.winbhai.in/public/sub_cat_img_jili/all/live blackjack.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(15, 1, 'all', 15, 'Baccarat', 'https://root.winbhai.in/public/sub_cat_img_jili/all/Live Baccarat.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(16, 1, 'all', 16, 'Sic Bo', 'https://root.winbhai.in/public/sub_cat_img_jili/all/live-sic-bo.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(17, 1, 'all', 17, 'Live Roulette', 'https://root.winbhai.in/public/sub_cat_img_jili/all/live-roulette.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(18, 1, 'all', 18, 'Virtual Casino', 'https://root.winbhai.in/public/miss/virtualcasino.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(19, 1, 'all', 19, 'TV Games', 'https://root.winbhai.in/public/miss/tv.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(20, 1, 'all', 20, 'Live Dice', 'https://root.winbhai.in/public/sub_cat_img_jili/all/live dice.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(21, 1, 'all', 21, 'Live Game Shows', 'https://root.winbhai.in/public/sub_cat_img_jili/all/live-game-shows.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(22, 1, 'all', 22, 'Live', 'https://root.winbhai.in/public/sub_cat_img_jili/all/live.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(23, 1, 'all', 23, '32 Cards', 'https://root.winbhai.in/public/sub_cat_img_jili/all/32 cards.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(24, 1, 'all', 24, 'Blackjack', 'https://root.winbhai.in/public/sub_cat_img_jili/all/black jack.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(25, 1, 'all', 25, 'Lucky7', 'https://root.winbhai.in/public/miss/lucky7.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(26, 1, 'all', 26, 'Video Slot', 'https://root.winbhai.in/public/miss/videoslot.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(27, 1, 'all', 27, 'Bingo', 'https://root.winbhai.in/public/sub_cat_img_jili/all/bingo.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(28, 1, 'all', 28, 'Monopoly', 'https://root.winbhai.in/public/sub_cat_img_jili/all/monopoly.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(29, 1, 'all', 29, 'Deal Or No Deal', 'https://root.winbhai.in/public/sub_cat_img_jili/all/deal or no deal.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(30, 1, 'all', 30, 'Live Dealer', 'https://root.winbhai.in/public/sub_cat_img_jili/all/live dealer.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(31, 1, 'all', 31, 'Rummy', 'https://root.winbhai.in/public/sub_cat_img_jili/all/rummy.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(32, 1, 'all', 32, 'Indian Games', 'https://root.winbhai.in/public/sub_cat_img_jili/all/indian games.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(33, 1, 'all', 33, 'Arcade Games', 'https://root.winbhai.in/public/sub_cat_img_jili/all/arcade games.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(34, 1, 'all', 34, 'First Person', 'https://root.winbhai.in/public/sub_cat_img_jili/all/first person.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(35, 1, 'all', 35, 'Game Shows', 'https://root.winbhai.in/public/sub_cat_img_jili/all/game shows.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(36, 1, 'all', 36, 'Keno', 'https://root.winbhai.in/public/sub_cat_img_jili/all/keno.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(37, 1, 'all', 37, 'Live Dragon Tiger', 'https://root.winbhai.in/public/sub_cat_img_jili/all/live dragon tiger.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(38, 1, 'all', 38, 'Fun Games', 'https://root.winbhai.in/public/sub_cat_img_jili/all/fun games.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(39, 1, 'all', 39, 'Poker', 'https://root.winbhai.in/public/miss/poker.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(40, 1, 'all', 40, 'Table Games', 'https://root.winbhai.in/public/miss/tablegame.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(41, 1, 'all', 41, 'Roulette', 'https://root.winbhai.in/public/miss/roulette.png', '2025-11-17 11:01:11', '2025-11-17 11:01:11'),
(42, 2, 'mac88', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:04:39', '2025-11-17 11:04:39'),
(43, 2, 'mac88', 2, 'Dragon Tiger', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88/Dragon tiger.png', '2025-11-17 11:04:39', '2025-11-17 11:04:39'),
(44, 2, 'mac88', 3, 'Baccarat', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88/Live Baccarat.png', '2025-11-17 11:04:39', '2025-11-17 11:04:39'),
(45, 2, 'mac88', 4, 'Sic Bo', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88/live-sic-bo.png', '2025-11-17 11:04:39', '2025-11-17 11:04:39'),
(46, 2, 'mac88', 5, 'Live Roulette', 'https://root.winbhai.in/public/sub_cat_img_jili/roullette.png', '2025-11-17 11:04:39', '2025-11-17 11:04:39'),
(47, 2, 'mac88', 6, 'Live Poker', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88/live poker.png', '2025-11-17 11:04:39', '2025-11-17 11:04:39'),
(48, 2, 'mac88', 7, 'Teen Patti', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:04:39', '2025-11-17 11:04:39'),
(49, 2, 'mac88', 8, 'Hilo', 'https://root.winbhai.in/public/sub_cat_img_jili/all/hilo.png', '2025-11-17 11:04:39', '2025-11-17 11:04:39'),
(50, 2, 'mac88', 9, 'Cricket War', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88/cricket.png', '2025-11-17 11:04:39', '2025-11-17 11:04:39'),
(51, 2, 'mac88', 10, 'Lottery', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88/Lottery.png', '2025-11-17 11:04:39', '2025-11-17 11:04:39'),
(52, 2, 'mac88', 11, 'Lucky7', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88/lucky 7.png', '2025-11-17 11:04:39', '2025-11-17 11:04:39'),
(53, 2, 'mac88', 12, 'Andar Bahar', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88/andar bahar.png', '2025-11-17 11:04:39', '2025-11-17 11:04:39'),
(54, 2, 'mac88', 13, '32 Cards', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88/32 cards.png', '2025-11-17 11:04:39', '2025-11-17 11:04:39'),
(55, 2, 'mac88', 14, 'Live Game Shows', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88/live-game-shows.png', '2025-11-17 11:04:39', '2025-11-17 11:04:39'),
(56, 2, 'mac88', 15, 'Others', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88/others.png', '2025-11-17 11:04:39', '2025-11-17 11:04:39'),
(57, 3, 'macexcite', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:07:41', '2025-11-17 11:07:41'),
(58, 3, 'macexcite', 2, '32 Cards', 'https://root.winbhai.in/public/sub_cat_img_jili/macexcite/32 cards.png', '2025-11-17 11:07:41', '2025-11-17 11:07:41'),
(59, 3, 'macexcite', 3, 'Andar Bahar', 'https://root.winbhai.in/public/sub_cat_img_jili/macexcite/andar bahar.png', '2025-11-17 11:07:41', '2025-11-17 11:07:41'),
(60, 3, 'macexcite', 4, 'Cricket War', 'https://root.winbhai.in/public/sub_cat_img_jili/macexcite/cricket.png', '2025-11-17 11:07:41', '2025-11-17 11:07:41'),
(61, 3, 'macexcite', 5, 'Dragon Tiger', 'https://root.winbhai.in/public/sub_cat_img_jili/macexcite/Dragon tiger.png', '2025-11-17 11:07:41', '2025-11-17 11:07:41'),
(62, 3, 'macexcite', 6, 'Hilo', 'https://root.winbhai.in/public/sub_cat_img_jili/macexcite/hilo.png', '2025-11-17 11:07:41', '2025-11-17 11:07:41'),
(63, 3, 'macexcite', 7, 'Lucky7', 'https://root.winbhai.in/public/sub_cat_img_jili/macexcite/lucky 7.png', '2025-11-17 11:07:41', '2025-11-17 11:07:41'),
(64, 3, 'macexcite', 8, 'Lottery', 'https://root.winbhai.in/public/sub_cat_img_jili/macexcite/Lottery.png', '2025-11-17 11:07:41', '2025-11-17 11:07:41'),
(65, 3, 'macexcite', 9, 'Teen Patti', 'https://root.winbhai.in/public/sub_cat_img_jili/macexcite/teen patti.png', '2025-11-17 11:07:41', '2025-11-17 11:07:41'),
(66, 3, 'macexcite', 10, 'Baccarat', 'https://root.winbhai.in/public/sub_cat_img_jili/macexcite/Live Baccarat.png', '2025-11-17 11:07:41', '2025-11-17 11:07:41'),
(67, 3, 'macexcite', 11, 'Live Poker', 'https://root.winbhai.in/public/sub_cat_img_jili/macexcite/live poker.png', '2025-11-17 11:07:41', '2025-11-17 11:07:41'),
(68, 3, 'macexcite', 12, 'Sic Bo', 'https://root.winbhai.in/public/sub_cat_img_jili/macexcite/live-sic-bo.png', '2025-11-17 11:07:41', '2025-11-17 11:07:41'),
(69, 3, 'macexcite', 13, 'Live Game Shows', 'https://root.winbhai.in/public/sub_cat_img_jili/macexcite/live-game-shows.png', '2025-11-17 11:07:41', '2025-11-17 11:07:41'),
(70, 3, 'macexcite', 14, 'Live Roulette', 'https://root.winbhai.in/public/sub_cat_img_jili/macexcite/live-roulette.png', '2025-11-17 11:07:41', '2025-11-17 11:07:41'),
(71, 3, 'macexcite', 15, 'Others', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88/others.png', '2025-11-17 11:07:41', '2025-11-17 11:07:41'),
(72, 4, 'Live pre', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:08:50', '2025-11-17 11:08:50'),
(73, 4, 'Live pre', 2, 'Casual Games', 'https://root.winbhai.in/public/sub_cat_img_jili/livepre/casual games.png', '2025-11-17 11:08:50', '2025-11-17 11:08:50'),
(74, 4, 'Live pre', 3, 'Others', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88/others.png', '2025-11-17 11:08:50', '2025-11-17 11:08:50'),
(75, 5, 'Fun Games', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:13:24', '2025-11-17 11:13:24'),
(76, 5, 'Fun Games', 2, 'Fun Games', 'https://root.winbhai.in/public/sub_cat_img_jili/fungame/fungame.png', '2025-11-17 11:13:24', '2025-11-17 11:13:24'),
(77, 5, 'Fun Games', 3, 'Aviator', 'https://root.winbhai.in/public/sub_cat_img_jili/fungame/aviator.png', '2025-11-17 11:13:24', '2025-11-17 11:13:24'),
(78, 5, 'Fun Games', 4, 'Mines', 'https://root.winbhai.in/public/sub_cat_img_jili/fungame/mines.png', '2025-11-17 11:13:24', '2025-11-17 11:13:24'),
(79, 5, 'Fun Games', 5, 'Slots', 'https://root.winbhai.in/public/sub_cat_img_jili/fungame/slotgames.png', '2025-11-17 11:13:24', '2025-11-17 11:13:24'),
(80, 5, 'Fun Games', 6, 'Hilo', 'https://root.winbhai.in/public/sub_cat_img_jili/fungame/hilo.png', '2025-11-17 11:13:24', '2025-11-17 11:13:24'),
(81, 5, 'Fun Games', 7, 'Crash Games', 'https://root.winbhai.in/public/sub_cat_img_jili//fungame/crashgame.png', '2025-11-17 11:13:24', '2025-11-17 11:13:24'),
(82, 5, 'Fun Games', 8, 'Blackjack', 'https://root.winbhai.in/public/sub_cat_img_jili/fungame/blackjack.png', '2025-11-17 11:13:24', '2025-11-17 11:13:24'),
(83, 5, 'Fun Games', 9, 'Others', 'https://root.winbhai.in/public/sub_cat_img_jili/fungame/others.png', '2025-11-17 11:13:24', '2025-11-17 11:13:24'),
(84, 6, 'mac88 virtual', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:14:38', '2025-11-17 11:14:38'),
(85, 6, 'mac88 virtual', 2, 'Lucky7', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88_virtual/lucky77.png', '2025-11-17 11:14:38', '2025-11-17 11:14:38'),
(86, 6, 'mac88 virtual', 3, 'Dragon Tiger', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88_virtual/dragontiger.png', '2025-11-17 11:14:38', '2025-11-17 11:14:38'),
(87, 6, 'mac88 virtual', 4, 'Teen Patti', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88_virtual/teenpatti.png', '2025-11-17 11:14:38', '2025-11-17 11:14:38'),
(88, 6, 'mac88 virtual', 5, '32 Cards', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88_virtual/32cards.png', '2025-11-17 11:14:38', '2025-11-17 11:14:38'),
(89, 6, 'mac88 virtual', 6, 'Andar Bahar', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88_virtual/andarbahar.png', '2025-11-17 11:14:38', '2025-11-17 11:14:38'),
(90, 6, 'mac88 virtual', 7, 'Hilo', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88_virtual/hilo.png', '2025-11-17 11:14:38', '2025-11-17 11:14:38'),
(91, 6, 'mac88 virtual', 8, 'Baccarat', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88_virtual/Live Baccarat.png', '2025-11-17 11:14:38', '2025-11-17 11:14:38'),
(92, 6, 'mac88 virtual', 9, 'Poker', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88_virtual/live poker.png', '2025-11-17 11:14:38', '2025-11-17 11:14:38'),
(93, 6, 'mac88 virtual', 10, 'Roulette', 'https://root.winbhai.in/public/sub_cat_img_jili/roulette.jpeg', '2025-11-17 11:14:38', '2025-11-17 11:14:38'),
(94, 6, 'mac88 virtual', 11, 'Colour Games', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88_virtual/colour games.png', '2025-11-17 11:14:38', '2025-11-17 11:14:38'),
(95, 6, 'mac88 virtual', 12, 'Others', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88_virtual/others.png', '2025-11-17 11:14:38', '2025-11-17 11:14:38'),
(96, 7, 'color & chicken', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:15:15', '2025-11-17 11:15:15'),
(97, 7, 'color & chicken', 2, 'Color Prediction', 'https://root.winbhai.in/public/sub_cat_img_jili/colorandchicken/color prediction.png', '2025-11-17 11:15:15', '2025-11-17 11:15:15'),
(98, 7, 'color & chicken', 3, 'Chicken Games', 'https://root.winbhai.in/public/sub_cat_img_jili/colorandchicken/chickengames.png', '2025-11-17 11:15:15', '2025-11-17 11:15:15'),
(99, 8, 'live88', 1, 'Roulette', 'https://root.winbhai.in/public/sub_cat_img_jili/live88/roullette.png', '2025-11-17 11:15:58', '2025-11-17 11:15:58'),
(100, 8, 'live88', 2, 'Baccarat', 'https://root.winbhai.in/public/sub_cat_img_jili/live88/baccarat.png', '2025-11-17 11:15:58', '2025-11-17 11:15:58'),
(101, 8, 'live88', 3, 'Blackjack', 'https://root.winbhai.in/public/sub_cat_img_jili/live88/blackjack.png', '2025-11-17 11:15:58', '2025-11-17 11:15:58'),
(102, 9, 'spribe', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:16:36', '2025-11-17 11:16:36'),
(103, 9, 'spribe', 2, 'Mines', 'https://root.winbhai.in/public/sub_cat_img_jili/spribe/mines.png', '2025-11-17 11:16:36', '2025-11-17 11:16:36'),
(104, 9, 'spribe', 3, 'Crash Games', 'https://root.winbhai.in/public/sub_cat_img_jili/spribe/crashgame.png', '2025-11-17 11:16:36', '2025-11-17 11:16:36'),
(105, 9, 'spribe', 4, 'Aviator', 'https://root.winbhai.in/public/sub_cat_img_jili/spribe/Aviator.png', '2025-11-17 11:16:36', '2025-11-17 11:16:36'),
(106, 9, 'spribe', 5, 'Plinko', 'https://root.winbhai.in/public/miss/plinko.png', '2025-11-17 11:16:36', '2025-11-17 11:16:36'),
(107, 9, 'spribe', 6, 'Dice', 'https://root.winbhai.in/public/sub_cat_img_jili/spribe/live dice.png', '2025-11-17 11:16:36', '2025-11-17 11:16:36'),
(108, 10, 'evolution', 2, 'Baccarat', 'https://root.winbhai.in/public/sub_cat_img_jili/evolution/livebackcarat.png', '2025-11-17 11:18:10', '2025-11-17 11:18:10'),
(109, 10, 'evolution', 3, 'Casual Games', 'https://root.winbhai.in/public/sub_cat_img_jili/evolution/dragon itger.png', '2025-11-17 11:18:10', '2025-11-17 11:18:10'),
(110, 10, 'evolution', 4, 'Blackjack', 'https://root.winbhai.in/public/sub_cat_img_jili/evolution/blackjack.png', '2025-11-17 11:18:10', '2025-11-17 11:18:10'),
(111, 10, 'evolution', 5, 'Dragon Tiger', 'https://root.winbhai.in/public/sub_cat_img_jili/evolution/dragon itger.png', '2025-11-17 11:18:10', '2025-11-17 11:18:10'),
(112, 10, 'evolution', 6, 'Deal', 'https://root.winbhai.in/public/sub_cat_img_jili/evolution/deal or no deal.png', '2025-11-17 11:18:10', '2025-11-17 11:18:10'),
(113, 10, 'evolution', 7, 'Roulette', 'https://root.winbhai.in/public/sub_cat_img_jili/evolution/live-roulette.png', '2025-11-17 11:18:10', '2025-11-17 11:18:10'),
(114, 10, 'evolution', 8, 'Live', 'https://root.winbhai.in/public/sub_cat_img_jili/evolution/live.png', '2025-11-17 11:18:10', '2025-11-17 11:18:10'),
(115, 10, 'evolution', 9, 'Bingo', 'https://root.winbhai.in/public/sub_cat_img_jili/evolution/bingo.png', '2025-11-17 11:18:10', '2025-11-17 11:18:10'),
(116, 10, 'evolution', 10, 'Monopoly', 'https://root.winbhai.in/public/sub_cat_img_jili/evolution/monopoly.png', '2025-11-17 11:18:10', '2025-11-17 11:18:10'),
(117, 10, 'evolution', 11, 'Video Slot', 'https://root.winbhai.in/public/sub_cat_img_jili/evolution/video slot.png', '2025-11-17 11:18:10', '2025-11-17 11:18:10'),
(118, 10, 'evolution', 12, 'Crash Games', 'https://root.winbhai.in/public/sub_cat_img_jili/evolution/crash games.png', '2025-11-17 11:18:10', '2025-11-17 11:18:10'),
(119, 10, 'evolution', 13, 'Live Game Shows', 'https://root.winbhai.in/public/sub_cat_img_jili/evolution/live-game-shows.png', '2025-11-17 11:18:10', '2025-11-17 11:18:10'),
(120, 10, 'evolution', 14, 'Team Patti', 'https://root.winbhai.in/public/sub_cat_img_jili//ezugi/teen%20patti.png', '2025-11-17 11:18:10', '2025-11-17 11:18:10'),
(121, 10, 'evolution', 15, 'Live Dealer', 'https://root.winbhai.in/public/sub_cat_img_jili/evolution/live dealer.png', '2025-11-17 11:18:10', '2025-11-17 11:18:10'),
(122, 10, 'evolution', 16, 'Live Blackjack', 'https://root.winbhai.in/public/sub_cat_img_jili/evolution/live blackjack.png', '2025-11-17 11:18:10', '2025-11-17 11:18:10'),
(123, 10, 'evolution', 17, 'Live Dice', 'https://root.winbhai.in/public/sub_cat_img_jili/evolution/live dice.png', '2025-11-17 11:18:10', '2025-11-17 11:18:10'),
(124, 10, 'evolution', 18, 'Andar Bahar', 'https://root.winbhai.in/public/sub_cat_img_jili/evolution/andar bahar.png', '2025-11-17 11:18:10', '2025-11-17 11:18:10'),
(125, 10, 'evolution', 19, 'Live Poker', 'https://root.winbhai.in/public/sub_cat_img_jili/evolution/live poker.png', '2025-11-17 11:18:10', '2025-11-17 11:18:10'),
(126, 11, 'Astar', 2, 'Aviator', 'https://root.winbhai.in/public/sub_cat_img_jili/Astar/aviator.png\n', '2025-11-17 11:18:34', '2025-11-17 11:18:34'),
(127, 11, 'Astar', 3, 'Mines', 'https://root.winbhai.in/public/sub_cat_img_jili/Astar/mines.png', '2025-11-17 11:18:34', '2025-11-17 11:18:34'),
(128, 11, 'Astar', 4, 'Slot Games', 'https://root.winbhai.in/public/sub_cat_img_jili/Astar/SLot games.png', '2025-11-17 11:18:34', '2025-11-17 11:18:34'),
(129, 11, 'Astar', 5, 'Live Blackjack', 'https://root.winbhai.in/public/sub_cat_img_jili/Astar/liveblackjack.png', '2025-11-17 11:18:34', '2025-11-17 11:18:34'),
(130, 11, 'Astar', 6, 'Video Slot', 'https://root.winbhai.in/public/sub_cat_img_jili/Astar/video slot.png', '2025-11-17 11:18:34', '2025-11-17 11:18:34'),
(131, 11, 'Astar', 7, 'Lottery', 'https://root.winbhai.in/public/sub_cat_img_jili/Astar/Lottery.png', '2025-11-17 11:18:34', '2025-11-17 11:18:34'),
(132, 11, 'Astar', 8, 'Crash Games', 'https://root.winbhai.in/public/sub_cat_img_jili/Astar/crash games.png', '2025-11-17 11:18:34', '2025-11-17 11:18:34'),
(133, 11, 'Astar', 9, 'Scratch Cards', 'https://root.winbhai.in/public/sub_cat_img_jili/Astar/scratch-card.png', '2025-11-17 11:18:34', '2025-11-17 11:18:34'),
(134, 11, 'Astar', 10, 'Others', 'https://root.winbhai.in/public/sub_cat_img_jili/Astar/others.png', '2025-11-17 11:18:34', '2025-11-17 11:18:34'),
(135, 12, 'inout', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:18:57', '2025-11-17 11:18:57'),
(136, 12, 'inout', 2, 'Fun Games', 'https://root.winbhai.in/public/sub_cat_img_jili/inout/fun games.png', '2025-11-17 11:18:57', '2025-11-17 11:18:57'),
(137, 12, 'inout', 3, 'Chicken Road', 'https://root.winbhai.in/public/sub_cat_img_jili/betsoft/SLot games.png', '2025-11-17 11:18:57', '2025-11-17 11:18:57'),
(138, 12, 'inout', 4, 'Plinko', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88/live poker.png', '2025-11-17 11:18:57', '2025-11-17 11:18:57'),
(139, 12, 'inout', 5, 'Crash Games', 'https://root.winbhai.in/public/sub_cat_img_jili/inout/crash games.png', '2025-11-17 11:18:57', '2025-11-17 11:18:57'),
(140, 12, 'inout', 6, 'Hilo', 'https://root.winbhai.in/public/sub_cat_img_jili/inout/hilo.png', '2025-11-17 11:18:57', '2025-11-17 11:18:57'),
(141, 12, 'inout', 7, 'Dice', 'https://root.winbhai.in/public/sub_cat_img_jili/inout/live dice.png', '2025-11-17 11:18:57', '2025-11-17 11:18:57'),
(142, 12, 'inout', 8, 'Mines', 'https://root.winbhai.in/public/sub_cat_img_jili/inout/mines.png', '2025-11-17 11:18:57', '2025-11-17 11:18:57'),
(143, 12, 'inout', 9, 'Poker', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88/live poker.png', '2025-11-17 11:18:57', '2025-11-17 11:18:57'),
(144, 12, 'inout', 10, 'Limbo', 'https://root.winbhai.in/public/sub_cat_img_jili/mac88/live poker.png', '2025-11-17 11:18:57', '2025-11-17 11:18:57'),
(145, 13, 'ezugi', 2, 'Baccarat', 'https://root.winbhai.in/public/sub_cat_img_jili/ezugi/Live Baccarat.png', '2025-11-17 11:19:24', '2025-11-17 11:19:24'),
(146, 13, 'ezugi', 3, 'Dragon Tiger', 'https://root.winbhai.in/public/sub_cat_img_jili/ezugi/live dragon tiger.png', '2025-11-17 11:19:24', '2025-11-17 11:19:24'),
(147, 13, 'ezugi', 4, 'Live Roulette', 'https://root.winbhai.in/public/sub_cat_img_jili/ezugi/live-roulette.png', '2025-11-17 11:19:24', '2025-11-17 11:19:24'),
(148, 13, 'ezugi', 5, 'Teen Patti', 'https://root.winbhai.in/public/sub_cat_img_jili//ezugi/teen patti.png', '2025-11-17 11:19:24', '2025-11-17 11:19:24'),
(149, 13, 'ezugi', 6, 'Live Blackjack', 'https://root.winbhai.in/public/sub_cat_img_jili/ezugi/live blackjack.png', '2025-11-17 11:19:24', '2025-11-17 11:19:24'),
(150, 13, 'ezugi', 7, 'Andar Bahar', 'https://root.winbhai.in/public/sub_cat_img_jili/evolution/andar bahar.png', '2025-11-17 11:19:24', '2025-11-17 11:19:24'),
(151, 13, 'ezugi', 8, 'Live Poker', 'https://root.winbhai.in/public/sub_cat_img_jili/ezugi/live poker.png', '2025-11-17 11:19:24', '2025-11-17 11:19:24'),
(152, 13, 'ezugi', 9, 'Live Lobby', 'https://root.winbhai.in/public/sub_cat_img_jili/ezugi/Live Baccarat.png', '2025-11-17 11:19:24', '2025-11-17 11:19:24'),
(153, 13, 'ezugi', 10, 'Slot Games', 'https://root.winbhai.in/public/sub_cat_img_jili/ezugi/SLot games.png', '2025-11-17 11:19:24', '2025-11-17 11:19:24'),
(154, 13, 'ezugi', 11, 'Lucky 7', 'https://root.winbhai.in/public/sub_cat_img_jili/ezugi/lucky 7.png', '2025-11-17 11:19:24', '2025-11-17 11:19:24'),
(155, 13, 'ezugi', 12, 'Cricket War', 'https://root.winbhai.in/public/sub_cat_img_jili/ezugi/cricket.png', '2025-11-17 11:19:24', '2025-11-17 11:19:24'),
(156, 13, 'ezugi', 13, 'Sic Bo', 'https://root.winbhai.in/public/sub_cat_img_jili/ezugi/live-sic-bo.png', '2025-11-17 11:19:24', '2025-11-17 11:19:24'),
(157, 14, 'vivo', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:19:42', '2025-11-17 11:19:42'),
(158, 14, 'vivo', 2, 'Roulette', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/roulette.png', '2025-11-17 11:19:42', '2025-11-17 11:19:42'),
(159, 15, 'Jili', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:20:14', '2025-11-17 11:20:14'),
(161, 15, 'Jili', 3, 'Mines', 'https://root.winbhai.in/public/sub_cat_img_jili/jili/mines.png', '2025-11-17 11:20:14', '2025-11-17 11:20:14'),
(163, 15, 'Jili', 5, 'Lottery', 'https://root.winbhai.in/public/sub_cat_img_jili/jili/Lottery.png', '2025-11-17 11:20:14', '2025-11-17 11:20:14'),
(164, 15, 'Jili', 6, 'Andar Bahar', 'https://root.winbhai.in/public/sub_cat_img_jili//jili/andar bahar.png', '2025-11-17 11:20:14', '2025-11-17 11:20:14'),
(165, 15, 'Jili', 7, 'Bingo', 'https://root.winbhai.in/public/sub_cat_img_jili/jili/bingo.png', '2025-11-17 11:20:14', '2025-11-17 11:20:14'),
(166, 15, 'Jili', 8, 'Dragon Tiger', 'https://root.winbhai.in/public/sub_cat_img_jili/jili/Dragon tiger.png', '2025-11-17 11:20:14', '2025-11-17 11:20:14'),
(167, 15, 'Jili', 9, 'Indian Games', 'https://root.winbhai.in/public/sub_cat_img_jili/jili/indian games.png', '2025-11-17 11:20:14', '2025-11-17 11:20:14'),
(168, 15, 'Jili', 10, 'Baccarat', 'https://root.winbhai.in/public/sub_cat_img_jili/jili/Live Baccarat.png', '2025-11-17 11:20:14', '2025-11-17 11:20:14'),
(169, 15, 'Jili', 11, 'Live Poker', 'https://root.winbhai.in/public/sub_cat_img_jili/jili/live poker.png', '2025-11-17 11:20:14', '2025-11-17 11:20:14'),
(170, 15, 'Jili', 12, 'Sic', 'https://root.winbhai.in/public/sub_cat_img_jili/jili/live-sic-bo.png', '2025-11-17 11:20:14', '2025-11-17 11:20:14'),
(171, 15, 'Jili', 13, 'Lucky', 'https://root.winbhai.in/public/sub_cat_img_jili/jili/lucky 7.png', '2025-11-17 11:20:14', '2025-11-17 11:20:14'),
(172, 16, 'ae sexy', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:20:47', '2025-11-17 11:20:47'),
(173, 16, 'ae sexy', 2, 'Dragon Tiger', 'https://root.winbhai.in/public/sub_cat_img_jili/ae_sexy/Dragon tiger.png', '2025-11-17 11:20:47', '2025-11-17 11:20:47'),
(174, 16, 'ae sexy', 3, 'Indian Games', 'https://root.winbhai.in/public/sub_cat_img_jili/ae_sexy/indian games.png', '2025-11-17 11:20:47', '2025-11-17 11:20:47'),
(175, 16, 'ae sexy', 4, 'Baccarat', 'https://root.winbhai.in/public/sub_cat_img_jili/ae_sexy/Live Baccarat.png', '2025-11-17 11:20:47', '2025-11-17 11:20:47'),
(176, 16, 'ae sexy', 5, 'Live Lobby', 'https://root.winbhai.in/public/sub_cat_img_jili/ae_sexy/live lobby.png', '2025-11-17 11:20:47', '2025-11-17 11:20:47'),
(177, 16, 'ae sexy', 6, 'Sic Bo', 'https://root.winbhai.in/public/sub_cat_img_jili/ae_sexy/live-sic-bo.png', '2025-11-17 11:20:47', '2025-11-17 11:20:47'),
(178, 16, 'ae sexy', 7, 'Live Roulette', 'https://root.winbhai.in/public/sub_cat_img_jili/ae_sexy/live-roulette.png', '2025-11-17 11:20:47', '2025-11-17 11:20:47'),
(179, 17, 'bet soft', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:21:35', '2025-11-17 11:21:35'),
(180, 17, 'bet soft', 2, 'Crash Games', 'https://root.winbhai.in/public/sub_cat_img_jili/betsoft/crash-game.png', '2025-11-17 11:21:35', '2025-11-17 11:21:35'),
(181, 17, 'bet soft', 3, 'Baccarat', 'https://root.winbhai.in/public/sub_cat_img_jili/betsoft/Live Baccarat.png', '2025-11-17 11:21:35', '2025-11-17 11:21:35'),
(182, 17, 'bet soft', 4, 'Live Blackjack', 'https://root.winbhai.in/public/sub_cat_img_jili/ezugi/live blackjack.png', '2025-11-17 11:21:35', '2025-11-17 11:21:35'),
(183, 17, 'bet soft', 5, 'Slot Games', 'https://root.winbhai.in/public/sub_cat_img_jili/betsoft/SLot games.png', '2025-11-17 11:21:35', '2025-11-17 11:21:35'),
(184, 18, 'turbo', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:22:18', '2025-11-17 11:22:18'),
(185, 18, 'turbo', 2, 'Casual Games', 'https://root.winbhai.in/public/sub_cat_img_jili/turbo/casual games.png', '2025-11-17 11:22:18', '2025-11-17 11:22:18'),
(186, 18, 'turbo', 3, 'Crash Games', 'https://root.winbhai.in/public/sub_cat_img_jili/turbo/crash-game.png', '2025-11-17 11:22:18', '2025-11-17 11:22:18'),
(187, 18, 'turbo', 4, 'Slot Games', 'https://root.winbhai.in/public/sub_cat_img_jili/turbo/SLot games.png', '2025-11-17 11:22:18', '2025-11-17 11:22:18'),
(188, 19, 'cq9', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:22:45', '2025-11-17 11:22:45'),
(189, 19, 'cq9', 2, 'Slot Games', 'https://root.winbhai.in/public/sub_cat_img_jili/cq9/SLot games.png', '2025-11-17 11:22:45', '2025-11-17 11:22:45'),
(190, 19, 'cq9', 3, 'Fishing', 'https://root.winbhai.in/public/sub_cat_img_jili/cq9/fishing.png', '2025-11-17 11:22:45', '2025-11-17 11:22:45'),
(191, 19, 'cq9', 4, 'Table', 'https://root.winbhai.in/public/sub_cat_img_jili/cq9/table.png', '2025-11-17 11:22:45', '2025-11-17 11:22:45'),
(192, 19, 'cq9', 5, 'Arcade Games', 'https://root.winbhai.in/public/sub_cat_img_jili/cq9/arcade games.png', '2025-11-17 11:22:45', '2025-11-17 11:22:45'),
(193, 19, 'cq9', 6, 'Live', 'https://root.winbhai.in/public/sub_cat_img_jili/cq9/live.png', '2025-11-17 11:22:45', '2025-11-17 11:22:45'),
(194, 19, 'cq9', 7, 'Crash Games', 'https://root.winbhai.in/public/sub_cat_img_jili/cq9/crash-game.png', '2025-11-17 11:22:45', '2025-11-17 11:22:45'),
(195, 19, 'cq9', 8, 'Fun Games', 'https://root.winbhai.in/public/sub_cat_img_jili/cq9/fun games.png', '2025-11-17 11:22:45', '2025-11-17 11:22:45'),
(196, 19, 'cq9', 9, 'Others', 'http://root.winbhai.in/public/sub_cat_img_jili/all/others.png', '2025-11-17 11:22:45', '2025-11-17 11:22:45'),
(197, 20, 'jdb', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:25:32', '2025-11-17 11:25:32'),
(198, 20, 'jdb', 2, 'Slot Games', 'https://root.winbhai.in/public/sub_cat_img_jili/jdb/SLot games.png', '2025-11-17 11:25:32', '2025-11-17 11:25:32'),
(199, 20, 'jdb', 3, 'Fish Shooting', 'https://root.winbhai.in/public/sub_cat_img_jili//jdb/fish-shooting.png', '2025-11-17 11:25:32', '2025-11-17 11:25:32'),
(200, 20, 'jdb', 4, 'Arcade Games', 'https://root.winbhai.in/public/sub_cat_img_jili/jdb/arcade games.png', '2025-11-17 11:25:32', '2025-11-17 11:25:32'),
(201, 20, 'jdb', 5, 'Cards', 'https://root.winbhai.in/public/sub_cat_img_jili/jdb/cards.png', '2025-11-17 11:25:32', '2025-11-17 11:25:32'),
(202, 20, 'jdb', 6, 'Bingo', 'https://root.winbhai.in/public/sub_cat_img_jili/jdb/bingo.png', '2025-11-17 11:25:32', '2025-11-17 11:25:32'),
(203, 21, 'pgsGames', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:26:08', '2025-11-17 11:26:08'),
(204, 22, 'miniGames', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:26:47', '2025-11-17 11:26:47'),
(205, 22, 'miniGames', 2, 'Casual Games', 'https://root.winbhai.in/public/sub_cat_img_jili/mini_games/casual games.png', '2025-11-17 11:26:47', '2025-11-17 11:26:47'),
(206, 22, 'miniGames', 3, 'Fun Games', 'https://root.winbhai.in/public/sub_cat_img_jili/mini_games/fun games.png', '2025-11-17 11:26:47', '2025-11-17 11:26:47'),
(207, 22, 'miniGames', 4, 'Coin', 'https://root.winbhai.in/public/sub_cat_img_jili/mini_games/coin.png', '2025-11-17 11:26:47', '2025-11-17 11:26:47'),
(208, 23, 'saGames', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:27:18', '2025-11-17 11:27:18'),
(209, 24, 'smartSoft', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:27:48', '2025-11-17 11:27:48'),
(210, 24, 'smartSoft', 2, 'Slot Games', 'https://root.winbhai.in/public/sub_cat_img_jili/smart_soft/SLot games.png', '2025-11-17 11:27:48', '2025-11-17 11:27:48'),
(211, 24, 'smartSoft', 3, 'Casual Games', 'https://root.winbhai.in/public/sub_cat_img_jili/smart_soft/casual games.png', '2025-11-17 11:27:48', '2025-11-17 11:27:48'),
(212, 24, 'smartSoft', 4, 'Crash Games', 'https://root.winbhai.in/public/sub_cat_img_jili/smart_soft/crash-game.png', '2025-11-17 11:27:48', '2025-11-17 11:27:48'),
(213, 25, 'playTech', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:28:18', '2025-11-17 11:28:18'),
(214, 25, 'playTech', 2, 'Casino', 'https://root.winbhai.in/public/sub_cat_img_jili/play_tech/casino.png', '2025-11-17 11:28:18', '2025-11-17 11:28:18'),
(215, 25, 'playTech', 3, 'Live', 'https://root.winbhai.in/public/sub_cat_img_jili/play_tech/live.png', '2025-11-17 11:28:18', '2025-11-17 11:28:18'),
(216, 25, 'playTech', 4, 'Poker', 'https://root.winbhai.in/public/sub_cat_img_jili/play_tech/poker.png', '2025-11-17 11:28:18', '2025-11-17 11:28:18'),
(217, 25, 'playTech', 5, 'Bingo', 'https://root.winbhai.in/public/sub_cat_img_jili/play_tech/bingo.png', '2025-11-17 11:28:18', '2025-11-17 11:28:18'),
(218, 25, 'playTech', 6, 'Casual Games', 'https://root.winbhai.in/public/sub_cat_img_jili/play_tech/casual games.png', '2025-11-17 11:28:18', '2025-11-17 11:28:18'),
(219, 25, 'playTech', 7, 'Hilo', 'https://root.winbhai.in/public/sub_cat_img_jili/all/hilo.png', '2025-11-17 11:28:18', '2025-11-17 11:28:18'),
(220, 25, 'playTech', 8, 'Hold Spin', 'https://root.winbhai.in/public/sub_cat_img_jili/play_tech/hold and spin.png', '2025-11-17 11:28:18', '2025-11-17 11:28:18'),
(221, 26, 'all', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:28:50', '2025-11-17 11:28:50'),
(222, 26, 'all', 2, 'Baccarat', 'https://root.winbhai.in/public/sub_cat_img_jili/all.jpeg', '2025-11-17 11:28:50', '2025-11-17 11:28:50'),
(223, 26, 'all', 3, 'Roulette', 'https://root.winbhai.in/public/sub_cat_img_jili/all/roulette.png', '2025-11-17 11:28:50', '2025-11-17 11:28:50'),
(224, 26, 'all', 4, 'Ultra Roulette', 'https://root.winbhai.in/public/sub_cat_img_jili/all.jpeg', '2025-11-17 11:28:50', '2025-11-17 11:28:50'),
(225, 26, 'all', 5, 'Sic Bo', 'https://root.winbhai.in/public/sub_cat_img_jili/all.jpeg', '2025-11-17 11:28:50', '2025-11-17 11:28:50'),
(226, 26, 'all', 6, 'Thai Hilo', 'https://root.winbhai.in/public/sub_cat_img_jili/all.jpeg', '2025-11-17 11:28:50', '2025-11-17 11:28:50'),
(227, 26, 'all', 7, 'Fish Shrimp Crab', 'https://root.winbhai.in/public/sub_cat_img_jili/all.jpeg', '2025-11-17 11:28:50', '2025-11-17 11:28:50'),
(228, 26, 'all', 8, 'Dragon Tiger', 'https://root.winbhai.in/public/sub_cat_img_jili/all.jpeg', '2025-11-17 11:28:50', '2025-11-17 11:28:50'),
(229, 26, 'all', 9, 'Blackjack', 'https://root.winbhai.in/public/sub_cat_img_jili/all.jpeg', '2025-11-17 11:28:50', '2025-11-17 11:28:50'),
(230, 26, 'all', 10, 'Pok Daeng', 'https://root.winbhai.in/public/sub_cat_img_jili/all.jpeg', '2025-11-17 11:28:50', '2025-11-17 11:28:50'),
(231, 26, 'all', 11, 'XocDia', 'https://root.winbhai.in/public/sub_cat_img_jili/all.jpeg', '2025-11-17 11:28:50', '2025-11-17 11:28:50'),
(232, 26, 'all', 12, 'Teen Patti 20-20', 'https://root.winbhai.in/public/sub_cat_img_jili/all.jpeg', '2025-11-17 11:28:50', '2025-11-17 11:28:50'),
(233, 26, 'all', 13, 'Andar Bahar', 'https://root.winbhai.in/public/sub_cat_img_jili/all.jpeg', '2025-11-17 11:28:50', '2025-11-17 11:28:50'),
(234, 27, 'trending', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:29:30', '2025-11-17 11:29:30'),
(235, 28, 'crash', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:29:58', '2025-11-17 11:29:58'),
(236, 29, 'slot', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:30:26', '2025-11-17 11:30:26'),
(237, 30, 'fishing', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:30:56', '2025-11-17 11:30:56'),
(238, 31, 'aura', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:31:28', '2025-11-17 11:31:28'),
(239, 10, 'evolution', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(258, 10, 'evolution', 20, 'Hilo', 'https://root.winbhai.in/public/sub_cat_img_jili/all/hilo.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(259, 10, 'evolution', 21, 'Sic Bo', 'https://root.winbhai.in/public/sub_cat_img_jili/all/live-sic-bo.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(260, 10, 'evolution', 22, 'Virtual Casino', 'https://root.winbhai.in/public/sub_cat_img_jili/all/virtual-casino.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(261, 10, 'evolution', 23, 'First Person', 'https://root.winbhai.in/public/miss/firstperson.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(262, 10, 'evolution', 24, 'Game Shows', 'https://root.winbhai.in/public/miss/gameshow.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(263, 11, 'Astar', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(264, 13, 'Ezugi', 1, 'All', 'https://root.winbhai.in/public/sub_cat_img_jili/vivo/all.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(265, 15, 'Jili', 2, 'Slot', 'https://root.winbhai.in/public/sub_cat_img_jili/Astar/SLot games.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(266, 15, 'Jili', 4, 'Scratch', 'https://root.winbhai.in/public/sub_cat_img_jili/Astar/scratch-card.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(267, 32, 'Bgaming', 1, 'All', 'https://root.winbhai.in/public/bggaming/all.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(268, 32, 'Bgaming', 2, 'Crash  Games', 'https://root.winbhai.in/public/bggaming/crash-game.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(269, 32, 'Bgaming', 3, 'Roulette', 'https://root.winbhai.in/public/bggaming/roulette.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(270, 32, 'Bgaming', 4, 'Lightning', 'https://root.winbhai.in/public/bggaming/Lightning.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(271, 32, 'Bgaming', 5, 'Casual Games', 'https://root.winbhai.in/public/bggaming/casual%20games.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(272, 32, 'Bgaming', 6, 'Black jack', 'https://root.winbhai.in/public/bggaming/black%20jack.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(273, 32, 'Bgaming', 7, 'Arcade games', 'https://root.winbhai.in/public/bggaming/arcade%20games.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(274, 32, 'Bgaming', 8, 'Scratch Games', 'https://root.winbhai.in/public/bggaming/scratch-card.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(275, 32, 'Bgaming', 9, 'Hold Spin', 'https://root.winbhai.in/public/bggaming/hold%20spin.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(276, 33, 'Pragmatic Play', 1, 'All', 'https://root.winbhai.in/public/pragmaticplay/all.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(277, 33, 'Pragmatic Play', 2, 'Slot games', 'https://root.winbhai.in/public/pragmaticplay/SLot%20games.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(278, 33, 'Pragmatic Play', 3, 'Live casino', 'https://root.winbhai.in/public/pragmaticplay/casino.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(279, 33, 'Pragmatic Play', 4, 'Bingo', 'https://root.winbhai.in/public/pragmaticplay/Bingo.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(280, 34, 'T1', 1, 'All', 'https://root.winbhai.in/public/T1/all.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(281, 34, 'T1', 2, 'Crash Games', 'https://root.winbhai.in/public/T1/crash-game.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(282, 34, 'T1', 3, 'Color Games', 'https://root.winbhai.in/public/T1/colour%20games.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(283, 34, 'T1', 4, 'Bingo', 'https://root.winbhai.in/public/T1/bingo.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(284, 34, 'T1', 5, 'Hilo', 'https://root.winbhai.in/public/T1/hilo.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(285, 34, 'T1', 6, 'Mines', 'https://root.winbhai.in/public/T1/mines.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(286, 35, 'Tada Gaming', 1, 'All', 'https://root.winbhai.in/public/Tadagaming/all.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(287, 35, 'Tada Gaming', 2, 'Slot Games', 'https://root.winbhai.in/public/Tadagaming/SLot%20games.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(288, 35, 'Tada Gaming', 3, 'Fish', 'https://root.winbhai.in/public/Tadagaming/fish.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(289, 35, 'Tada Gaming', 4, 'Arcade games', 'https://root.winbhai.in/public/Tadagaming/arcade%20games.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(290, 35, 'Tada Gaming', 5, 'Table and Crads', 'https://root.winbhai.in/public/Tadagaming/table%20and%20card.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(291, 35, 'Tada Gaming', 6, 'Bingo', 'https://root.winbhai.in/public/Tadagaming/Bingo.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(292, 35, 'Tada Gaming', 7, 'Crash Games', 'https://root.winbhai.in/public/Tadagaming/crash-game.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(293, 36, 'Micro Gaming', 1, 'All', 'https://root.winbhai.in/public/Microgaming/all.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(294, 36, 'Micro Gaming', 2, 'Slot Games', 'https://root.winbhai.in/public/Microgaming/SLot%20games.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(295, 36, 'Micro Gaming', 3, 'Table Games', 'https://root.winbhai.in/public/Microgaming/table%20games.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15'),
(296, 36, 'Micro Gaming', 4, 'Lottery', 'https://root.winbhai.in/public/Microgaming/Lottery.png', '2025-11-17 11:32:15', '2025-11-17 11:32:15');

-- --------------------------------------------------------

--
-- Table structure for table `subtype`
--

CREATE TABLE `subtype` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `subtype`
--

INSERT INTO `subtype` (`id`, `name`, `status`) VALUES
(1, 'Intrest', 1),
(2, 'Add Fund', 0),
(3, 'Deposit', 1),
(4, 'Bet', 0),
(5, 'Bonus', 1),
(6, 'Win', 1),
(7, 'Withdrawal', 1),
(8, 'Cancel Withdrawal', 1),
(9, 'First Deposit Bonus', 1),
(10, 'Deduct Fund', 1),
(11, 'Daily Rewards', 1),
(12, 'Weekly Rewards', 1),
(13, 'Salary', 1),
(14, 'Attendance Bonus', 1),
(20, 'Girf card', 1),
(21, 'Activity_reward_daily', 0),
(22, 'Activity_reward_weekly', 0),
(23, 'commission', 1),
(24, 'aviator', 1),
(25, 'brtting rebate', 1),
(26, 'Invitation Bonus', 1),
(27, 'Level up rewards', 1),
(28, 'Monthly Rewards', 1),
(31, 'DAILY SALARY', 0),
(32, 'MONTHLY SALARY', 0),
(33, 'Referral Bonus', 1),
(34, 'Bonus on 2nd recharge ₹1000+!', 1),
(36, 'ADD FUND', 0),
(37, 'FUND TRANSFER', 0),
(38, 'FIRST RECHARGE SELF BONUS', 0),
(39, 'SECOND RECHARGE SELF BONUS', 0),
(40, 'FIRST RECHARGE AGENT BONUS', 0),
(41, 'ADVERTISEMENT SUPPORT', 0),
(42, 'ADVANCE SALARY', 0);

-- --------------------------------------------------------

--
-- Table structure for table `support_setting`
--

CREATE TABLE `support_setting` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `socialmedia` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `support_setting`
--

INSERT INTO `support_setting` (`id`, `name`, `socialmedia`, `status`, `datetime`) VALUES
(1, 'Telegram ', '', 1, '2024-06-04 06:38:14'),
(2, 'Email', '', 1, '2024-06-04 06:38:14'),
(3, 'Channel', '', 1, '2024-06-04 06:38:14');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_histories`
--

CREATE TABLE `transaction_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `mobile` double NOT NULL DEFAULT 0,
  `description` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `actual_amount` bigint(20) NOT NULL DEFAULT 0,
  `type` int(10) UNSIGNED DEFAULT NULL,
  `account_id` int(10) UNSIGNED DEFAULT NULL,
  `payout` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(555) NOT NULL COMMENT 'Hash value of ethereum',
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usdt_qr`
--

CREATE TABLE `usdt_qr` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `qr_code` varchar(255) DEFAULT NULL,
  `wallet_address` varchar(64) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `usdt_qr`
--

INSERT INTO `usdt_qr` (`id`, `name`, `qr_code`, `wallet_address`, `type`, `created_at`, `updated_at`) VALUES
(1, 'USDT Payin', 'https://root.nexwin.vip/uploads/WhatsApp Image 2026-02-24 at 10.00.08 AM.jpeg', 'TGL1iQQpg7k526Zo3kHxHME2jMC1fWHjfy', 1, '2024-05-20 05:41:21', '2024-05-20 05:41:21');

-- --------------------------------------------------------

--
-- Table structure for table `usdt_wallet_address`
--

CREATE TABLE `usdt_wallet_address` (
  `id` int(11) NOT NULL,
  `user_id` varchar(55) NOT NULL,
  `wallet_address` varchar(255) NOT NULL,
  `wallet_type` varchar(55) NOT NULL,
  `phone_no` varchar(55) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `usdt_wallet_address`
--

INSERT INTO `usdt_wallet_address` (`id`, `user_id`, `wallet_address`, `wallet_type`, `phone_no`, `created_at`, `updated_at`) VALUES
(1, '17', '0x5A93Ce2f3880FfEED23534Cb9Bc7389bF68091A5', 'BEP20', '8082393325', '2026-01-21 17:05:42', '2026-01-21 17:05:42'),
(2, '1', '0x5A93Ce2f3880FfEED23534Cb9Bc7389bF68091A5', 'BEP20', '8082393325', '2026-01-28 15:32:35', '2026-01-28 15:32:35'),
(3, '1', '0x5A93Ce2f3880FfEED23534Cb9Bc7389bF68091A5', 'BEP20', '8082393325', '2026-01-30 21:22:49', '2026-01-30 21:22:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(55) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `type` varchar(55) DEFAULT NULL,
  `u_id` varchar(10) DEFAULT NULL,
  `wallet` double(10,2) NOT NULL DEFAULT 0.00,
  `winning_wallet` double(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `withdraw_balance` double(10,2) NOT NULL DEFAULT 0.00,
  `country_code` varchar(10) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `password` varchar(24) DEFAULT NULL,
  `userimage` varchar(555) DEFAULT NULL,
  `referral_link` varchar(255) DEFAULT NULL,
  `referral_code` varchar(55) DEFAULT NULL,
  `referral_user_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `campaign_user_id` int(11) DEFAULT NULL,
  `third_party_wallet` double(10,2) NOT NULL DEFAULT 0.00,
  `commission` double(10,2) NOT NULL DEFAULT 0.00,
  `bonus` double(10,2) DEFAULT 0.00,
  `total_referral_bonus` double(10,2) NOT NULL DEFAULT 0.00,
  `turnover` double(10,2) NOT NULL DEFAULT 0.00,
  `today_turnover` double(10,2) NOT NULL DEFAULT 0.00,
  `totalbet` int(11) NOT NULL DEFAULT 0,
  `first_recharge` int(11) NOT NULL DEFAULT 0 COMMENT '0= first rechage pending,1=first recharge success',
  `salary_first_recharge` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `first_recharge_amount` double(10,2) DEFAULT NULL,
  `recharge` double(10,2) NOT NULL DEFAULT 0.00,
  `verification` int(11) NOT NULL DEFAULT 0,
  `role_id` int(11) NOT NULL DEFAULT 0,
  `agent_id` int(55) DEFAULT NULL,
  `permissions` varchar(555) DEFAULT NULL,
  `revenue` double DEFAULT NULL,
  `parent_id` int(55) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `bonus_wallet` double(10,2) NOT NULL DEFAULT 0.00,
  `total_payin` double(10,2) DEFAULT 0.00,
  `total_payout` double(10,2) DEFAULT 0.00,
  `no_of_payin` int(11) DEFAULT 0,
  `no_of_payout` int(11) DEFAULT 0,
  `yesterday_payin` double(10,2) DEFAULT 0.00,
  `yesterday_register` int(11) DEFAULT 0,
  `yesterday_no_of_payin` int(11) DEFAULT 0,
  `yesterday_first_deposit` double(10,2) DEFAULT 0.00,
  `yesterday_total_commission` double(10,2) NOT NULL DEFAULT 0.00,
  `deposit_balance` double(10,2) NOT NULL DEFAULT 0.00,
  `win_loss` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=Active ,0=Inactive',
  `account_type` tinyint(4) DEFAULT 0 COMMENT '	type 0=Real,1=Demo',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `login_token` varchar(64) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `address` varchar(155) DEFAULT NULL,
  `pincode` varchar(55) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `password_changed_at` timestamp NULL DEFAULT NULL,
  `illegal_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `type`, `u_id`, `wallet`, `winning_wallet`, `withdraw_balance`, `country_code`, `mobile`, `email`, `password`, `userimage`, `referral_link`, `referral_code`, `referral_user_id`, `campaign_id`, `campaign_user_id`, `third_party_wallet`, `commission`, `bonus`, `total_referral_bonus`, `turnover`, `today_turnover`, `totalbet`, `first_recharge`, `salary_first_recharge`, `first_recharge_amount`, `recharge`, `verification`, `role_id`, `agent_id`, `permissions`, `revenue`, `parent_id`, `dob`, `bonus_wallet`, `total_payin`, `total_payout`, `no_of_payin`, `no_of_payout`, `yesterday_payin`, `yesterday_register`, `yesterday_no_of_payin`, `yesterday_first_deposit`, `yesterday_total_commission`, `deposit_balance`, `win_loss`, `status`, `account_type`, `created_at`, `updated_at`, `login_token`, `remark`, `city`, `address`, `pincode`, `session_id`, `password_changed_at`, `illegal_count`) VALUES
(1, 'admin', NULL, NULL, 'GXYJ5671', 1547.00, 9.00, 0.00, '+91', '1234567890', 'admin@gmail.com', '12345678', 'https://root.winbhai.in/uploads/profileimage/1.png', '', 'ZUPNGADEG', 1, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 1.00, 0, 0, 0, NULL, 0.00, 2, 1, 0, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\"]', NULL, 1, NULL, 0.00, 0.00, 0.00, 0, 0, 0.00, 0, 0, 0.00, 0.00, 0.00, 0, 1, 0, '2026-01-28 15:27:57', '2026-02-24 17:39:49', '111|sSHo5CUSppe8aLuXmXxViaXWDBkUDTesPlCAGa4le733ec73', NULL, NULL, NULL, NULL, 'NVpxxY9dLuQYZU5hnvR175AZGvFnHooeZQ41rYvT', '2026-01-15 17:47:26', 0),
(2, 'demo1111', NULL, NULL, 'DEMO1234', 0.00, 0.00, 0.00, '+91', '1111111111', 'demo@gmail.com', '11111111', 'https://root.winbhai.in/uploads/profileimage/1.png', NULL, 'DEMO1234', 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 1, NULL, 0.00, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0, 0, 0.00, 0, 0, 0.00, 0.00, 0.00, 0, 1, 1, '2025-12-25 20:05:46', '2026-02-24 16:41:24', '105|4ludDmu3Ar9r0uKjbM1nQ4Vq1A3Lj9eh3GydJ4rp1bb3db72', NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `versions`
--

CREATE TABLE `versions` (
  `id` int(11) NOT NULL,
  `version` varchar(100) DEFAULT NULL,
  `link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `versions`
--

INSERT INTO `versions` (`id`, `version`, `link`) VALUES
(1, '1.0.0', 'https://root.globalbet24.live/globalbet.apk');

-- --------------------------------------------------------

--
-- Table structure for table `vip_levels`
--

CREATE TABLE `vip_levels` (
  `id` int(11) NOT NULL,
  `name` varchar(28) NOT NULL,
  `betting_range` varchar(64) NOT NULL,
  `deposit_range` varchar(64) NOT NULL,
  `level_up_rewards` int(11) NOT NULL,
  `monthly_rewards` int(11) NOT NULL,
  `rebate_rate` double(10,2) NOT NULL,
  `safe_income` float NOT NULL,
  `my_exprience` int(11) NOT NULL DEFAULT 0,
  `days_count` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vip_levels`
--

INSERT INTO `vip_levels` (`id`, `name`, `betting_range`, `deposit_range`, `level_up_rewards`, `monthly_rewards`, `rebate_rate`, `safe_income`, `my_exprience`, `days_count`, `status`, `created_at`, `updated_at`) VALUES
(1, 'vip 1', '3000', '3000', 60, 30, 0.06, 0.2, 0, 30, 0, '2024-12-25 05:31:11', '2024-06-20 06:53:55'),
(2, 'vip 2', '30000', '30000', 180, 90, 0.06, 0.2, 0, 30, 0, '2024-12-25 05:32:19', '2024-06-20 06:55:48'),
(3, 'vip 3', '300000', '300000', 690, 290, 0.06, 0.25, 0, 30, 0, '2024-12-25 05:32:36', '2024-06-20 07:06:09'),
(4, 'vip 4', '2000000', '2000000', 1800, 890, 0.65, 0.25, 0, 30, 0, '2024-12-25 05:32:59', '2024-06-20 07:06:09'),
(5, 'vip 5', '20000000', '20000000', 6900, 1890, 0.65, 0.3, 0, 30, 0, '2024-12-25 05:33:06', '2024-06-20 07:16:24'),
(6, 'vip 6', '60000000', '60000000', 16900, 6900, 0.65, 0.3, 0, 30, 0, '2024-12-25 05:33:10', '2024-06-20 07:16:24'),
(7, 'vip 7', '300000000', '300000000', 69000, 16900, 0.07, 0.325, 0, 30, 0, '2024-12-25 05:33:23', '2024-06-20 07:16:24'),
(8, 'vip 8', '1000000000', '1000000000', 169000, 69000, 0.07, 0.35, 0, 30, 0, '2024-12-25 05:33:32', '2024-06-20 07:16:24'),
(9, 'vip 9', '5000000000', '5000000000', 690000, 169000, 0.07, 0.35, 0, 30, 0, '2024-12-25 05:33:39', '2024-06-20 07:26:37'),
(10, 'vip 10', '9999999999', '9999999999', 1690000, 690000, 0.08, 0.4, 0, 30, 0, '2024-12-25 05:33:59', '2024-06-20 07:26:37');

-- --------------------------------------------------------

--
-- Table structure for table `vip_levels_claim`
--

CREATE TABLE `vip_levels_claim` (
  `id` int(11) NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `vip_levels_id` int(10) UNSIGNED NOT NULL,
  `exp` varchar(32) DEFAULT '100',
  `status` tinyint(4) NOT NULL,
  `level_up_status` tinyint(4) NOT NULL DEFAULT 0,
  `monthly_rewards_status` tinyint(4) NOT NULL DEFAULT 0,
  `rebate_rate_status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `virtual_games`
--

CREATE TABLE `virtual_games` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` int(11) NOT NULL,
  `actual_number` int(11) NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `multiplier` decimal(10,2) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `virtual_games`
--

INSERT INTO `virtual_games` (`id`, `name`, `number`, `actual_number`, `game_id`, `multiplier`, `type`, `created_at`, `updated_at`) VALUES
(51, '0', 0, 0, 1, 9.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(52, '1', 1, 1, 1, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(53, '2', 2, 2, 1, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(54, '3', 3, 3, 1, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(55, '4', 4, 4, 1, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(56, '5', 5, 5, 1, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(57, '6', 6, 6, 1, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(58, '7', 7, 7, 1, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(59, '8', 8, 8, 1, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(60, '9', 9, 9, 1, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(61, 'Small', 50, 0, 1, 2.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(62, 'Small', 50, 1, 1, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(63, 'Small', 50, 2, 1, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(64, 'Small', 50, 3, 1, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(65, 'Small', 50, 4, 1, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(66, 'Big', 40, 5, 1, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(67, 'Big', 40, 6, 1, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(68, 'Big', 40, 7, 1, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(69, 'Big', 40, 8, 1, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(70, 'Big', 40, 9, 1, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(72, 'Green', 10, 1, 1, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(73, 'Red', 30, 2, 1, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(74, 'Green', 10, 3, 1, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(75, 'Red', 30, 4, 1, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(77, 'Red', 30, 6, 1, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(78, 'Green', 10, 7, 1, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(79, 'Red', 30, 8, 1, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(80, 'Green', 10, 9, 1, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(81, 'Voilet', 20, 0, 1, 5.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(82, 'Voilet', 20, 1, 1, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(83, 'Voilet', 20, 2, 1, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(84, 'Voilet', 20, 3, 1, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(85, 'Voilet', 20, 4, 1, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(86, 'Voilet', 20, 5, 1, 5.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(87, 'Voilet', 20, 6, 1, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(88, 'Voilet', 20, 7, 1, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(89, 'Voilet', 20, 8, 1, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(90, 'Voilet', 20, 9, 1, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(91, 'Green', 10, 5, 1, 1.50, '1', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(92, 'Red', 30, 0, 1, 1.50, '1', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(93, '0', 0, 0, 2, 9.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(94, '1', 1, 1, 2, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(95, '2', 2, 2, 2, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(96, '3', 3, 3, 2, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(97, '4', 4, 4, 2, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(98, '5', 5, 5, 2, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(99, '6', 6, 6, 2, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(100, '7', 7, 7, 2, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(101, '8', 8, 8, 2, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(102, '9', 9, 9, 2, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(103, 'Small', 50, 0, 2, 2.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(104, 'Small', 50, 1, 2, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(105, 'Small', 50, 2, 2, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(106, 'Small', 50, 3, 2, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(107, 'Small', 50, 4, 2, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(108, 'Big', 40, 5, 2, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(109, 'Big', 40, 6, 2, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(110, 'Big', 40, 7, 2, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(111, 'Big', 40, 8, 2, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(112, 'Big', 40, 9, 2, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(113, 'Green', 10, 1, 2, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(114, 'Red', 30, 2, 2, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(115, 'Green', 10, 3, 2, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(116, 'Red', 30, 4, 2, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(117, 'Red', 30, 6, 2, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(118, 'Green', 10, 7, 2, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(119, 'Red', 30, 8, 2, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(120, 'Green', 10, 9, 2, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(121, 'Voilet', 20, 0, 2, 5.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(122, 'Voilet', 20, 1, 2, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(123, 'Voilet', 20, 2, 2, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(124, 'Voilet', 20, 3, 2, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(125, 'Voilet', 20, 4, 2, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(126, 'Voilet', 20, 5, 2, 5.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(127, 'Voilet', 20, 6, 2, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(128, 'Voilet', 20, 7, 2, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(129, 'Voilet', 20, 8, 2, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(130, 'Voilet', 20, 9, 2, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(131, 'Green', 10, 5, 2, 1.50, '1', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(132, 'Red', 30, 0, 2, 1.50, '1', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(133, '0', 0, 0, 3, 9.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(134, '1', 1, 1, 3, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(135, '2', 2, 2, 3, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(136, '3', 3, 3, 3, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(137, '4', 4, 4, 3, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(138, '5', 5, 5, 3, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(139, '6', 6, 6, 3, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(140, '7', 7, 7, 3, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(141, '8', 8, 8, 3, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(142, '9', 9, 9, 3, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(143, 'Small', 50, 0, 3, 2.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(144, 'Small', 50, 1, 3, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(145, 'Small', 50, 2, 3, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(146, 'Small', 50, 3, 3, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(147, 'Small', 50, 4, 3, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(148, 'Big', 40, 5, 3, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(149, 'Big', 40, 6, 3, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(150, 'Big', 40, 7, 3, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(151, 'Big', 40, 8, 3, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(152, 'Big', 40, 9, 3, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(153, 'Green', 10, 1, 3, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(154, 'Red', 30, 2, 3, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(155, 'Green', 10, 3, 3, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(156, 'Red', 30, 4, 3, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(157, 'Red', 30, 6, 3, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(158, 'Green', 10, 7, 3, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(159, 'Red', 30, 8, 3, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(160, 'Green', 10, 9, 3, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(161, 'Voilet', 20, 0, 3, 5.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(162, 'Voilet', 20, 1, 3, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(163, 'Voilet', 20, 2, 3, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(164, 'Voilet', 20, 3, 3, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(165, 'Voilet', 20, 4, 3, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(166, 'Voilet', 20, 5, 3, 5.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(167, 'Voilet', 20, 6, 3, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(168, 'Voilet', 20, 7, 3, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(169, 'Voilet', 20, 8, 3, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(170, 'Voilet', 20, 9, 3, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(171, 'Green', 10, 5, 3, 1.50, '1', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(172, 'Red', 30, 0, 3, 1.50, '1', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1293, '0', 0, 0, 4, 9.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(1294, '1', 1, 1, 4, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1295, '2', 2, 2, 4, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1296, '3', 3, 3, 4, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1297, '4', 4, 4, 4, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1298, '5', 5, 5, 4, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1299, '6', 6, 6, 4, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1300, '7', 7, 7, 4, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1301, '8', 8, 8, 4, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1302, '9', 9, 9, 4, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1303, 'Small', 50, 0, 4, 2.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(1304, 'Small', 50, 1, 4, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1305, 'Small', 50, 2, 4, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1306, 'Small', 50, 3, 4, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1307, 'Small', 50, 4, 4, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1308, 'Big', 40, 5, 4, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1309, 'Big', 40, 6, 4, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1310, 'Big', 40, 7, 4, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1311, 'Big', 40, 8, 4, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1312, 'Big', 40, 9, 4, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1313, 'Green', 10, 1, 4, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1314, 'Red', 30, 2, 4, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1315, 'Green', 10, 3, 4, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1316, 'Red', 30, 4, 4, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1317, 'Red', 30, 6, 4, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1318, 'Green', 10, 7, 4, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1319, 'Red', 30, 8, 4, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1320, 'Green', 10, 9, 4, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1321, 'Voilet', 20, 0, 4, 5.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(1322, 'Voilet', 20, 1, 4, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1323, 'Voilet', 20, 2, 4, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1324, 'Voilet', 20, 3, 4, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1325, 'Voilet', 20, 4, 4, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1326, 'Voilet', 20, 5, 4, 5.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1327, 'Voilet', 20, 6, 4, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1328, 'Voilet', 20, 7, 4, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1329, 'Voilet', 20, 8, 4, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1330, 'Voilet', 20, 9, 4, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1331, 'Green', 10, 5, 4, 1.50, '1', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1332, 'Red', 30, 0, 4, 1.50, '1', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1334, '0', 0, 0, 6, 9.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(1335, '1', 1, 1, 6, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1336, '2', 2, 2, 6, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1337, '3', 3, 3, 6, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1338, '4', 4, 4, 6, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1339, '5', 5, 5, 6, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1340, '6', 6, 6, 6, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1341, '7', 7, 7, 6, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1342, '8', 8, 8, 6, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1343, '9', 9, 9, 6, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1344, 'Small', 50, 0, 6, 2.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(1345, 'Small', 50, 1, 6, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1346, 'Small', 50, 2, 6, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1347, 'Small', 50, 3, 6, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1348, 'Small', 50, 4, 6, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1349, 'Big', 40, 5, 6, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1350, 'Big', 40, 6, 6, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1351, 'Big', 40, 7, 6, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1352, 'Big', 40, 8, 6, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1353, 'Big', 40, 9, 6, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1354, 'Green', 10, 1, 6, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1355, 'Red', 30, 2, 6, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1356, 'Green', 10, 3, 6, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1357, 'Red', 30, 4, 6, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1358, 'Red', 30, 6, 6, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1359, 'Green', 10, 7, 6, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1360, 'Red', 30, 8, 6, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1361, 'Green', 10, 9, 6, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1362, 'Voilet', 20, 0, 6, 5.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(1363, 'Voilet', 20, 1, 6, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1364, 'Voilet', 20, 2, 6, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1365, 'Voilet', 20, 3, 6, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1366, 'Voilet', 20, 4, 6, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1367, 'Voilet', 20, 5, 6, 5.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1368, 'Voilet', 20, 6, 6, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1369, 'Voilet', 20, 7, 6, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1370, 'Voilet', 20, 8, 6, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1371, 'Voilet', 20, 9, 6, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1372, 'Green', 10, 5, 6, 1.50, '1', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1373, 'Red', 30, 0, 6, 1.50, '1', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1374, '0', 0, 0, 7, 9.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(1375, '1', 1, 1, 7, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1376, '2', 2, 2, 7, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1377, '3', 3, 3, 7, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1378, '4', 4, 4, 7, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1379, '5', 5, 5, 7, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1380, '6', 6, 6, 7, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1381, '7', 7, 7, 7, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1382, '8', 8, 8, 7, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1383, '9', 9, 9, 7, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1384, 'Small', 50, 0, 7, 2.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(1385, 'Small', 50, 1, 7, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1386, 'Small', 50, 2, 7, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:06:00'),
(1387, 'Small', 50, 3, 7, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1388, 'Small', 50, 4, 7, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1389, 'Big', 40, 5, 7, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1390, 'Big', 40, 6, 7, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1391, 'Big', 40, 7, 7, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1392, 'Big', 40, 8, 7, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1393, 'Big', 40, 9, 7, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1394, 'Green', 10, 1, 7, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1395, 'Red', 30, 2, 7, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1396, 'Green', 10, 3, 7, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1397, 'Red', 30, 4, 7, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1398, 'Red', 30, 6, 7, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1399, 'Green', 10, 7, 7, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1400, 'Red', 30, 8, 7, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1401, 'Green', 10, 9, 7, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1402, 'Voilet', 20, 0, 7, 5.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(1403, 'Voilet', 20, 1, 7, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1404, 'Voilet', 20, 2, 7, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1405, 'Voilet', 20, 3, 7, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1406, 'Voilet', 20, 4, 7, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1407, 'Voilet', 20, 5, 7, 5.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1408, 'Voilet', 20, 6, 7, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1409, 'Voilet', 20, 7, 7, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1410, 'Voilet', 20, 8, 7, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1411, 'Voilet', 20, 9, 7, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1412, 'Green', 10, 5, 7, 1.50, '1', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1413, 'Red', 30, 0, 7, 1.50, '1', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1414, '0', 0, 0, 8, 9.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(1415, '1', 1, 1, 8, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1416, '2', 2, 2, 8, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1417, '3', 3, 3, 8, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1418, '4', 4, 4, 8, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1419, '5', 5, 5, 8, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1420, '6', 6, 6, 8, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1421, '7', 7, 7, 8, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1422, '8', 8, 8, 8, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1423, '9', 9, 9, 8, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1424, 'Small', 50, 0, 8, 2.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(1425, 'Small', 50, 1, 8, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1426, 'Small', 50, 2, 8, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1427, 'Small', 50, 3, 8, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1428, 'Small', 50, 4, 8, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1429, 'Big', 40, 5, 8, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1430, 'Big', 40, 6, 8, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1431, 'Big', 40, 7, 8, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1432, 'Big', 40, 8, 8, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1433, 'Big', 40, 9, 8, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1434, 'Green', 10, 1, 8, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1435, 'Red', 30, 2, 8, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1436, 'Green', 10, 3, 8, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1437, 'Red', 30, 4, 8, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1438, 'Red', 30, 6, 8, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1439, 'Green', 10, 7, 8, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1440, 'Red', 30, 8, 8, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1441, 'Green', 10, 9, 8, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1442, 'Voilet', 20, 0, 8, 5.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(1443, 'Voilet', 20, 1, 8, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1444, 'Voilet', 20, 2, 8, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1445, 'Voilet', 20, 3, 8, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1446, 'Voilet', 20, 4, 8, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1447, 'Voilet', 20, 5, 8, 5.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1448, 'Voilet', 20, 6, 8, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1449, 'Voilet', 20, 7, 8, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1450, 'Voilet', 20, 8, 8, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1451, 'Voilet', 20, 9, 8, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1452, 'Green', 10, 5, 8, 1.50, '1', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1453, 'Red', 30, 0, 8, 1.50, '1', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1454, '0', 0, 0, 9, 9.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(1455, '1', 1, 1, 9, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1456, '2', 2, 2, 9, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1457, '3', 3, 3, 9, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1458, '4', 4, 4, 9, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1459, '5', 5, 5, 9, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1460, '6', 6, 6, 9, 9.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1461, '7', 7, 7, 9, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1462, '8', 8, 8, 9, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1463, '9', 9, 9, 9, 9.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1464, 'Small', 50, 0, 9, 2.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(1465, 'Small', 50, 1, 9, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1466, 'Small', 50, 2, 9, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1467, 'Small', 50, 3, 9, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1468, 'Small', 50, 4, 9, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1469, 'Big', 40, 5, 9, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1470, 'Big', 40, 6, 9, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1471, 'Big', 40, 7, 9, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1472, 'Big', 40, 8, 9, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1473, 'Big', 40, 9, 9, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1474, 'Green', 10, 1, 9, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1475, 'Red', 30, 2, 9, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1476, 'Green', 10, 3, 9, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1477, 'Red', 30, 4, 9, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1478, 'Red', 30, 6, 9, 2.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1479, 'Green', 10, 7, 9, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1480, 'Red', 30, 8, 9, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1481, 'Green', 10, 9, 9, 2.00, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1482, 'Voilet', 20, 0, 9, 5.00, '0', '2024-04-01 10:13:48', '2024-04-01 10:13:48'),
(1483, 'Voilet', 20, 1, 9, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1484, 'Voilet', 20, 2, 9, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1485, 'Voilet', 20, 3, 9, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1486, 'Voilet', 20, 4, 9, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1487, 'Voilet', 20, 5, 9, 5.00, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1488, 'Voilet', 20, 6, 9, 1.50, '0', '2024-04-14 09:01:06', '2024-04-14 09:01:06'),
(1489, 'Voilet', 20, 7, 9, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1490, 'Voilet', 20, 8, 9, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1491, 'Voilet', 20, 9, 9, 1.50, '0', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1492, 'Green', 10, 5, 9, 1.50, '1', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1493, 'Red', 30, 0, 9, 1.50, '1', '2024-04-14 09:02:05', '2024-04-14 09:02:05'),
(1494, 'Dragon', 1, 1, 10, 2.00, '0', '2025-05-07 12:27:18', '2025-05-07 12:27:22'),
(1495, 'Tiger', 2, 2, 10, 2.00, '0', '2025-05-07 12:27:14', '2025-05-07 12:27:26'),
(1496, 'Tie', 3, 3, 10, 5.00, '0', '2025-05-07 12:27:11', '2025-05-07 12:27:29'),
(1497, 'Andar', 1, 1, 13, 2.00, '0', '2025-05-07 12:27:08', '2025-05-07 12:27:32'),
(1498, 'Bahar', 2, 2, 13, 2.00, '0', '2025-05-07 12:27:04', '2025-05-07 12:27:35'),
(1499, 'Head', 1, 1, 14, 2.00, '0', '2025-05-07 12:26:31', '2025-05-07 12:26:38'),
(1500, 'Tail', 2, 2, 14, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1501, 'Low', 1, 1, 17, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1502, 'Medium', 2, 2, 17, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1503, 'High', 3, 3, 17, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1504, 'seven_down', 1, 1, 15, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1505, 'seven', 2, 2, 15, 5.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1506, 'seven_up', 3, 3, 15, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1507, 'Heart', 1, 1, 16, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1508, 'Club', 2, 2, 16, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1509, 'Spacdes', 3, 3, 16, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1510, 'Diamond', 4, 4, 16, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1511, 'Red', 5, 5, 16, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1512, 'Black', 6, 6, 16, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1513, '1', 1, 1, 20, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1514, '2', 2, 2, 20, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1515, '3', 3, 3, 20, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1516, '4', 4, 4, 20, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1517, '5', 5, 5, 20, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1518, '6', 6, 6, 20, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1519, 'Two', 4, 2, 15, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1520, 'Three', 5, 3, 15, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1521, 'Four', 6, 4, 15, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1522, 'Five', 7, 5, 15, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1523, 'Six', 8, 6, 15, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1524, 'Eight', 9, 8, 15, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1525, 'Nine', 10, 9, 15, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1526, 'Ten', 11, 10, 15, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1527, 'Eleven', 12, 11, 15, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1530, 'Twelve', 13, 12, 15, 2.00, '1', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1531, 'heart', 1, 1, 22, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1532, 'spades', 2, 2, 22, 4.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1533, 'diamond', 3, 3, 22, 6.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1534, 'club', 4, 4, 22, 8.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1535, 'face', 5, 5, 22, 10.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1536, 'flag', 6, 6, 22, 20.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1537, 'High', 1, 1, 24, 5.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1538, 'Low', 2, 2, 24, 5.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1539, 'set', 1, 1, 25, 3.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1540, 'pure seq', 2, 2, 25, 4.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1541, 'seq', 3, 3, 25, 5.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1542, 'colour', 4, 4, 25, 6.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1543, 'pair', 5, 5, 25, 10.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1544, 'highcard', 6, 6, 25, 20.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1545, 'Butterfly', 1, 1, 21, 10.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1546, 'Kite', 2, 2, 21, 8.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1547, 'Umbrella', 3, 3, 21, 7.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1548, 'Ball', 4, 4, 21, 4.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1549, 'Sun', 5, 5, 21, 3.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1550, 'Rabbit', 6, 6, 21, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1551, 'Bird', 7, 7, 21, 9.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1552, 'Bucket', 8, 8, 21, 0.50, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1553, 'Lamp', 9, 9, 21, 1.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1554, 'Bull', 10, 10, 21, 0.20, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1555, 'Rose', 11, 11, 21, 6.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1556, 'Football', 12, 12, 21, 5.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1557, 'Banker', 1, 1, 18, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1558, 'Player', 2, 2, 18, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1559, 'Mini Roullete 1', 1, 1, 26, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1560, 'Mini Roullete 2', 2, 2, 26, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1561, 'Mini Roullete 3', 3, 3, 26, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1562, 'Mini Roullete 4', 4, 4, 26, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1563, 'Mini Roullete 5', 5, 5, 26, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1564, 'Mini Roullete 6', 6, 6, 26, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1565, 'Mini Roullete 7', 7, 7, 26, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1566, 'Mini Roullete 8', 8, 8, 26, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1567, 'Mini Roullete 9', 9, 9, 26, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1568, 'Mini Roullete 10', 10, 10, 26, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1569, 'Mini Roullete 11', 11, 11, 26, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1570, 'Mini Roullete 12', 12, 12, 26, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1607, 'Blockchain Lottery 1 Hrs', 0, 0, 27, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1608, 'Blockchain Lottery 1 Hrs', 1, 1, 27, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1609, 'Blockchain Lottery 1 Hrs', 2, 2, 27, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1610, 'Blockchain Lottery 1 Hrs', 3, 3, 27, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1611, 'Blockchain Lottery 1 Hrs', 4, 4, 27, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1612, 'Blockchain Lottery 1 Hrs', 5, 5, 27, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1613, 'Blockchain Lottery 1 Hrs', 6, 6, 27, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1614, 'Blockchain Lottery 1 Hrs', 7, 7, 27, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1615, 'Blockchain Lottery 1 Hrs', 8, 8, 27, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1616, 'Blockchain Lottery 1 Hrs', 9, 9, 27, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1620, 'Blockchain Lottery 3 Hrs', 0, 0, 28, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1621, 'Blockchain Lottery 3 Hrs', 1, 1, 28, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1622, 'Blockchain Lottery 3 Hrs', 2, 2, 28, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1623, 'Blockchain Lottery 3 Hrs', 3, 3, 28, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1624, 'Blockchain Lottery 3 Hrs', 4, 4, 28, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1625, 'Blockchain Lottery 3 Hrs', 5, 5, 28, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1626, 'Blockchain Lottery 3 Hrs', 6, 6, 28, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1627, 'Blockchain Lottery 3 Hrs', 7, 7, 28, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1628, 'Blockchain Lottery 3 Hrs', 8, 8, 28, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1629, 'Blockchain Lottery 3 Hrs', 9, 9, 28, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1630, 'Blockchain Lottery 24 Hrs', 0, 0, 29, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1631, 'Blockchain Lottery 24 Hrs', 1, 1, 29, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1632, 'Blockchain Lottery 24 Hrs', 2, 2, 29, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1633, 'Blockchain Lottery 24 Hrs', 3, 3, 29, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1634, 'Blockchain Lottery 24 Hrs', 4, 4, 29, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1635, 'Blockchain Lottery 24 Hrs', 5, 5, 29, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1636, 'Blockchain Lottery 24 Hrs', 6, 6, 29, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1637, 'Blockchain Lottery 24 Hrs', 7, 7, 29, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1638, 'Blockchain Lottery 24 Hrs', 8, 8, 29, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46'),
(1639, 'Blockchain Lottery 24 Hrs', 9, 9, 29, 2.00, '0', '2025-05-07 12:26:43', '2025-05-07 12:26:46');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_history`
--

CREATE TABLE `wallet_history` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `subtypeid` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `description_2` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_histories`
--

CREATE TABLE `withdraw_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `usdt_amount` float DEFAULT NULL,
  `actual_amount` double NOT NULL DEFAULT 0,
  `mobile` varchar(255) DEFAULT NULL,
  `account_id` varchar(555) DEFAULT NULL,
  `type` varchar(155) DEFAULT NULL,
  `usdt_wallet_address` varchar(100) DEFAULT NULL,
  `upi_id` varchar(64) DEFAULT NULL,
  `order_id` varchar(100) DEFAULT NULL,
  `payout` int(10) UNSIGNED DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `response` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=Pending,2=success,3=reject',
  `typeimage` varchar(255) DEFAULT NULL,
  `referenceId` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `rejectmsg` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_details`
--
ALTER TABLE `account_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `active_game_sessions`
--
ALTER TABLE `active_game_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_rewards`
--
ALTER TABLE `activity_rewards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_rewards_claim`
--
ALTER TABLE `activity_rewards_claim`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_settings`
--
ALTER TABLE `admin_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_winner_results`
--
ALTER TABLE `admin_winner_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `all_images`
--
ALTER TABLE `all_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amount_lists`
--
ALTER TABLE `amount_lists`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `at_claim`
--
ALTER TABLE `at_claim`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aviator_admin_result`
--
ALTER TABLE `aviator_admin_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aviator_bet`
--
ALTER TABLE `aviator_bet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aviator_result`
--
ALTER TABLE `aviator_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aviator_setting`
--
ALTER TABLE `aviator_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `betlogs`
--
ALTER TABLE `betlogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bets`
--
ALTER TABLE `bets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bet_results`
--
ALTER TABLE `bet_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bet_values`
--
ALTER TABLE `bet_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `casino_lobby`
--
ALTER TABLE `casino_lobby`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_language`
--
ALTER TABLE `category_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `checkin_redeems`
--
ALTER TABLE `checkin_redeems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `check_ins`
--
ALTER TABLE `check_ins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chicken_bets`
--
ALTER TABLE `chicken_bets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commission_logs`
--
ALTER TABLE `commission_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_with_us`
--
ALTER TABLE `contact_with_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupon_code` (`coupon_code`);

--
-- Indexes for table `coupon_history`
--
ALTER TABLE `coupon_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_services`
--
ALTER TABLE `customer_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit_category`
--
ALTER TABLE `deposit_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extra_first_deposit_bonus`
--
ALTER TABLE `extra_first_deposit_bonus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extra_first_deposit_bonus_claim`
--
ALTER TABLE `extra_first_deposit_bonus_claim`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fundtransfer_subtype`
--
ALTER TABLE `fundtransfer_subtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fund_user_details`
--
ALTER TABLE `fund_user_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game_history`
--
ALTER TABLE `game_history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_user_round` (`user_id`,`game_round`);

--
-- Indexes for table `game_rules`
--
ALTER TABLE `game_rules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `game_settings`
--
ALTER TABLE `game_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game_subcat_sliders`
--
ALTER TABLE `game_subcat_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_cart`
--
ALTER TABLE `gift_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_claim`
--
ALTER TABLE `gift_claim`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `invite_bonus`
--
ALTER TABLE `invite_bonus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invite_bonus_claim`
--
ALTER TABLE `invite_bonus_claim`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ip_address`
--
ALTER TABLE `ip_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `minegame_bet`
--
ALTER TABLE `minegame_bet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mine_multipliers`
--
ALTER TABLE `mine_multipliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlm_levels`
--
ALTER TABLE `mlm_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multiplier`
--
ALTER TABLE `multiplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multipliers`
--
ALTER TABLE `multipliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Notice`
--
ALTER TABLE `Notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications_login`
--
ALTER TABLE `notifications_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_admin`
--
ALTER TABLE `notification_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp_pack_history`
--
ALTER TABLE `otp_pack_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp_sms`
--
ALTER TABLE `otp_sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payins`
--
ALTER TABLE `payins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mid` (`mid`);

--
-- Indexes for table `payment_limits`
--
ALTER TABLE `payment_limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payzaar_callback`
--
ALTER TABLE `payzaar_callback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pay_modes`
--
ALTER TABLE `pay_modes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions_users`
--
ALTER TABLE `permissions_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_users_role_id_foreign` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plinko_bets`
--
ALTER TABLE `plinko_bets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plinko_index_lists`
--
ALTER TABLE `plinko_index_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qr_codes`
--
ALTER TABLE `qr_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recent_history`
--
ALTER TABLE `recent_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `revenue`
--
ALTER TABLE `revenue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roast_control`
--
ALTER TABLE `roast_control`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles_defined`
--
ALTER TABLE `roles_defined`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_users_user_id_foreign` (`user_id`),
  ADD KEY `role_users_role_id_foreign` (`role_id`);

--
-- Indexes for table `rules`
--
ALTER TABLE `rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcat_list`
--
ALTER TABLE `subcat_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subtype`
--
ALTER TABLE `subtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_setting`
--
ALTER TABLE `support_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_histories`
--
ALTER TABLE `transaction_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usdt_qr`
--
ALTER TABLE `usdt_qr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usdt_wallet_address`
--
ALTER TABLE `usdt_wallet_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `versions`
--
ALTER TABLE `versions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vip_levels`
--
ALTER TABLE `vip_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vip_levels_claim`
--
ALTER TABLE `vip_levels_claim`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `virtual_games`
--
ALTER TABLE `virtual_games`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_history`
--
ALTER TABLE `wallet_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_histories`
--
ALTER TABLE `withdraw_histories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_details`
--
ALTER TABLE `account_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `active_game_sessions`
--
ALTER TABLE `active_game_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `activity_rewards`
--
ALTER TABLE `activity_rewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `activity_rewards_claim`
--
ALTER TABLE `activity_rewards_claim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_settings`
--
ALTER TABLE `admin_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `admin_winner_results`
--
ALTER TABLE `admin_winner_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amount_lists`
--
ALTER TABLE `amount_lists`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `at_claim`
--
ALTER TABLE `at_claim`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aviator_admin_result`
--
ALTER TABLE `aviator_admin_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `aviator_bet`
--
ALTER TABLE `aviator_bet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `aviator_result`
--
ALTER TABLE `aviator_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `aviator_setting`
--
ALTER TABLE `aviator_setting`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `betlogs`
--
ALTER TABLE `betlogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `bets`
--
ALTER TABLE `bets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bet_results`
--
ALTER TABLE `bet_results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bet_values`
--
ALTER TABLE `bet_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `casino_lobby`
--
ALTER TABLE `casino_lobby`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category_language`
--
ALTER TABLE `category_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `checkin_redeems`
--
ALTER TABLE `checkin_redeems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `check_ins`
--
ALTER TABLE `check_ins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chicken_bets`
--
ALTER TABLE `chicken_bets`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `commission_logs`
--
ALTER TABLE `commission_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_with_us`
--
ALTER TABLE `contact_with_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coupon_history`
--
ALTER TABLE `coupon_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_services`
--
ALTER TABLE `customer_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `deposit_category`
--
ALTER TABLE `deposit_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extra_first_deposit_bonus`
--
ALTER TABLE `extra_first_deposit_bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `extra_first_deposit_bonus_claim`
--
ALTER TABLE `extra_first_deposit_bonus_claim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fundtransfer_subtype`
--
ALTER TABLE `fundtransfer_subtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `fund_user_details`
--
ALTER TABLE `fund_user_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `game_history`
--
ALTER TABLE `game_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `game_rules`
--
ALTER TABLE `game_rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `game_settings`
--
ALTER TABLE `game_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `game_subcat_sliders`
--
ALTER TABLE `game_subcat_sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gift_cart`
--
ALTER TABLE `gift_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gift_claim`
--
ALTER TABLE `gift_claim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invite_bonus`
--
ALTER TABLE `invite_bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `invite_bonus_claim`
--
ALTER TABLE `invite_bonus_claim`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ip_address`
--
ALTER TABLE `ip_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `minegame_bet`
--
ALTER TABLE `minegame_bet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mine_multipliers`
--
ALTER TABLE `mine_multipliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `mlm_levels`
--
ALTER TABLE `mlm_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `multiplier`
--
ALTER TABLE `multiplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `multipliers`
--
ALTER TABLE `multipliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `Notice`
--
ALTER TABLE `Notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `notifications_login`
--
ALTER TABLE `notifications_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `notification_admin`
--
ALTER TABLE `notification_admin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `otp_pack_history`
--
ALTER TABLE `otp_pack_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `otp_sms`
--
ALTER TABLE `otp_sms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payins`
--
ALTER TABLE `payins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_limits`
--
ALTER TABLE `payment_limits`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payzaar_callback`
--
ALTER TABLE `payzaar_callback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pay_modes`
--
ALTER TABLE `pay_modes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `permissions_users`
--
ALTER TABLE `permissions_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `plinko_bets`
--
ALTER TABLE `plinko_bets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plinko_index_lists`
--
ALTER TABLE `plinko_index_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `qr_codes`
--
ALTER TABLE `qr_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `recent_history`
--
ALTER TABLE `recent_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revenue`
--
ALTER TABLE `revenue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roast_control`
--
ALTER TABLE `roast_control`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `roles_defined`
--
ALTER TABLE `roles_defined`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role_users`
--
ALTER TABLE `role_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rules`
--
ALTER TABLE `rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `subcat_list`
--
ALTER TABLE `subcat_list`
  MODIFY `id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `subtype`
--
ALTER TABLE `subtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `support_setting`
--
ALTER TABLE `support_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaction_histories`
--
ALTER TABLE `transaction_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usdt_qr`
--
ALTER TABLE `usdt_qr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usdt_wallet_address`
--
ALTER TABLE `usdt_wallet_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `versions`
--
ALTER TABLE `versions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vip_levels`
--
ALTER TABLE `vip_levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `vip_levels_claim`
--
ALTER TABLE `vip_levels_claim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `virtual_games`
--
ALTER TABLE `virtual_games`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1640;

--
-- AUTO_INCREMENT for table `wallet_history`
--
ALTER TABLE `wallet_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_histories`
--
ALTER TABLE `withdraw_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_language`
--
ALTER TABLE `category_language`
  ADD CONSTRAINT `category_language_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_language_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_users`
--
ALTER TABLE `role_users`
  ADD CONSTRAINT `role_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
