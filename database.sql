-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 12, 2019 at 06:56 AM
-- Server version: 10.2.26-MariaDB-log-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simcypla_hellaplus`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `balance` decimal(11,2) NOT NULL,
  `type` varchar(16) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `user`, `name`, `balance`, `type`, `status`, `created_at`, `updated_at`) VALUES
(0, NULL, 'Other', '0.00', 'Bank', 'Active', '2019-02-21 07:21:51', '2019-02-21 13:33:07'),
(1, 1, 'Paypal', '0.00', 'E-Wallet', 'Active', '2019-02-21 07:08:32', '2019-02-22 07:44:49'),
(2, 1, 'My Bank', '0.00', 'Bank', 'Active', '2019-02-21 07:21:51', '2019-08-08 01:40:07'),
(3, 1, 'Cash', '0.00', 'Cash', 'Active', '2019-02-22 07:46:08', '2019-08-08 01:41:32'),
(4, 1, 'Credit Card', '0.00', 'Card', 'Active', '2019-02-22 07:46:38', '2019-08-08 01:39:38');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('Income','Expense') COLLATE utf8_unicode_ci DEFAULT NULL,
  `budget` decimal(11,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `user`, `name`, `type`, `budget`, `created_at`, `updated_at`) VALUES
(0, NULL, 'Other', 'Expense', '0.00', '2019-02-21 13:30:59', '2019-02-21 13:32:04'),
(1, 1, 'Food', 'Expense', '0.00', '2019-02-09 10:15:08', '2019-08-07 08:48:05'),
(2, 1, 'Rent', 'Expense', '0.00', '2019-02-19 13:05:06', '2019-08-07 08:48:05'),
(3, 1, 'Leisure', 'Expense', '0.00', '2019-02-19 13:05:17', '2019-08-07 08:48:05'),
(4, 1, 'Living', 'Expense', '0.00', '2019-02-19 13:19:50', '2019-08-07 08:48:05'),
(8, 1, 'Transportation', 'Expense', '0.00', '2019-02-22 07:52:58', '2019-08-07 08:48:05'),
(9, 1, 'Salary', 'Income', '0.00', '2021-03-14 00:41:55', '2021-03-14 00:46:07'),
(10, 1, 'Donations', 'Income', '0.00', '2021-03-14 00:41:55', '2021-03-14 00:46:28'),
(11, 1, 'Investments', 'Income', '0.00', '2021-03-14 00:41:55', '2021-03-14 00:46:20');
;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(56) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`) VALUES
(65, 'India Rupee', 'INR');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `account` int(11) DEFAULT 0,
  `category` int(11) DEFAULT 0,
  `expense_date` date NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `account` int(11) DEFAULT NULL,
  `income_group` varchar(255) NOT NULL,
  `category` int(11) DEFAULT 0,
  `income_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE `timezones` (
  `id` int(11) NOT NULL,
  `name` varchar(31) NOT NULL,
  `zone` varchar(272) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `timezones`
--

INSERT INTO `timezones` (`id`, `name`, `zone`) VALUES
(74, '(UTC-05:00) America/New_York', 'America/New_York'),
(170, '(UTC+00:00) Europe/London', 'Europe/London'),
(284, '(UTC+03:00) Indian/Mayotte', 'Indian/Mayotte'),
(325, '(UTC+05:30) Asia/Kolkata', 'Asia/Kolkata');
-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(16) NOT NULL,
  `lname` varchar(16) NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  `token` varchar(256) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `monthly_spending` decimal(11,2) NOT NULL,
  `annual_spending` decimal(11,2) NOT NULL,
  `monthly_saving` decimal(11,2) NOT NULL,
  `monthly_earning` decimal(11,2) NOT NULL,
  `lang` varchar(32) NOT NULL DEFAULT 'en_US',
  `timezone` varchar(64) NOT NULL DEFAULT 'Africa/Nairobi',
  `currency` varchar(8) NOT NULL DEFAULT 'USD',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `phone`, `address`, `password`, `avatar`, `token`, `role`, `status`, `monthly_spending`, `annual_spending`, `monthly_saving`, `monthly_earning`, `lang`, `timezone`, `currency`, `created_at`) VALUES
(1, 'Jane', 'Doe', 'demo@simcycreative.com', '+254720783834', 'Nairobi, Kenya.', '4d7c065dc166b84e681641d01211b968c132028751bdc91d60ed13fe8091f4b3', '', '', 'admin', 'Active', '0.00', '0.00', '0.00', '0.00', 'en_US', 'Indian/Mayotte', 'USD', '2019-02-07 12:47:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `uploaded_by` (`user`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `budget_category` (`category`),
  ADD KEY `user` (`user`),
  ADD KEY `expenses_ibfk_2` (`account`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `account` (`account`);

--
-- Indexes for table `timezones`
--
ALTER TABLE `timezones`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timezones`
--
ALTER TABLE `timezones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=424;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `user` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_ibfk_2` FOREIGN KEY (`account`) REFERENCES `accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_ibfk_3` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `income`
--
ALTER TABLE `income`
  ADD CONSTRAINT `income_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `income_ibfk_2` FOREIGN KEY (`account`) REFERENCES `accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `income_ibfk_3` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
