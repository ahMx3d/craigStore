-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2020 at 04:33 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `craigstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `photo` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `password` varchar(225) CHARACTER SET utf8mb4 NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `photo`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$10$sZDA1jnjmQXOHrEIPtuZsOb3lYKWuQZ0rmtso0lbUwXtDW2QC2lCG', '2020-07-29 10:52:02', '2020-07-29 10:52:02');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `abbr` varchar(10) NOT NULL,
  `locale` varchar(20) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `direction` enum('ltr','rtl') NOT NULL DEFAULT 'rtl',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 => Active\r\n0 => pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `abbr`, `locale`, `name`, `direction`, `status`, `created_at`, `updated_at`) VALUES
(8, 'EN', NULL, 'English', 'ltr', 1, '2020-07-30 07:51:43', '2020-08-09 17:53:24'),
(12, 'AR', NULL, 'اللغه العربيه', 'rtl', 1, '2020-07-30 08:13:34', '2020-07-30 08:13:34');

-- --------------------------------------------------------

--
-- Table structure for table `main_cates`
--

CREATE TABLE `main_cates` (
  `id` int(11) NOT NULL,
  `trans_lang` varchar(10) NOT NULL COMMENT 'Translation Language',
  `trans_of` int(11) UNSIGNED NOT NULL COMMENT 'Code for each category of translation',
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) DEFAULT NULL COMMENT 'Used for SEO',
  `photo` varchar(150) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 => Active,\r\n0 => Pending',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The website main categories';

--
-- Dumping data for table `main_cates`
--

INSERT INTO `main_cates` (`id`, `trans_lang`, `trans_of`, `name`, `slug`, `photo`, `status`, `created_at`, `updated_at`) VALUES
(58, 'AR', 0, 'الكترونيات', 'الكترونيات', 'images/main_cates/ukJYhhIcpQnw4A4FIU1MKdwRySFyUdmEsakM4f7G.jpeg', 1, '2020-08-03 16:52:24', '2020-08-11 14:13:25'),
(59, 'EN', 58, 'Electronics', 'electronics', 'images/main_cates/ukJYhhIcpQnw4A4FIU1MKdwRySFyUdmEsakM4f7G.jpeg', 1, '2020-08-03 16:52:24', '2020-08-03 16:52:24'),
(60, 'AR', 0, 'سماعات', 'سماعات', 'images/main_cates/6JYMft9tvvTzAkieAYinPP9do2x9O7G3gsQY2N9r.jpeg', 1, '2020-08-03 23:10:41', '2020-08-03 23:10:41'),
(61, 'EN', 60, 'Beats', 'beats', 'images/main_cates/6JYMft9tvvTzAkieAYinPP9do2x9O7G3gsQY2N9r.jpeg', 1, '2020-08-03 23:10:41', '2020-08-03 23:10:41'),
(62, 'AR', 0, 'تليفونات', 'تليفونات', 'images/main_cates/Da6M07DB5lD20o1J8vkDtQ9wXoIzymk2wKktCj5h.jpeg', 1, '2020-08-04 00:14:01', '2020-08-11 13:04:08'),
(63, 'EN', 62, 'Phones', 'phones', 'images/main_cates/Da6M07DB5lD20o1J8vkDtQ9wXoIzymk2wKktCj5h.jpeg', 1, '2020-08-04 00:14:01', '2020-08-04 00:14:01');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_cates`
--

CREATE TABLE `sub_cates` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT 'FOREIGN KEY OF SUB RELATED CATEGORIES',
  `cate_id` int(10) UNSIGNED NOT NULL COMMENT 'FOREIGN KEY OF RELATED MAIN CATEGORY',
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) DEFAULT NULL COMMENT 'FOR SEO',
  `photo` varchar(150) DEFAULT NULL,
  `trans_lang` varchar(10) NOT NULL COMMENT 'TRANSLATION LANGUAGE',
  `trans_of` int(11) UNSIGNED NOT NULL COMMENT 'FOREIGN KEY OF TRANSLATED CATEGORY',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 FOR ACTIVE & 0 FOR PENDING',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='SUB CATEGORIES TABLE';

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `logo` varchar(200) NOT NULL,
  `mobile` varchar(100) NOT NULL COMMENT 'MUST BE UNIQUE FOR LOGIN',
  `password` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(100) NOT NULL COMMENT 'MUST BE UNIQUE FOR LOGIN',
  `cate_id` int(11) UNSIGNED NOT NULL COMMENT 'RELATED CATEGORY AS FOREIGN KEY',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'VENDOR STATUS AS 0=>PENDING&1=>ACTIVE',
  `latitude` text DEFAULT NULL COMMENT 'address latitude from google maps',
  `longitude` text DEFAULT NULL COMMENT 'address longitude from google maps',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='VENDORS TABLE';

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `logo`, `mobile`, `password`, `address`, `email`, `cate_id`, `status`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(2, 'AhMed SaLah', 'images/vendors/7JyEw59A06E5E7XXrGpYQDeQl0CEtaSYbMtjZ3UD.png', '01068966635', '$2y$10$ynybR1.TZHlzEfF4WYo2ruJymX8JPDeXeW.g4cw393BWRrq34uSpy', 'cairo', 'ahmed@gmail.com', 58, 1, NULL, NULL, '2020-08-08 02:19:23', '2020-08-11 18:49:53'),
(17, 'mohamed', 'images/vendors/uTBqCeDFxd9iToXFpGqVadjtxPb0rCaSMVgfgeII.png', '01024546668', '$2y$10$HxbywSrp7ZJlbAs0YIOqceYj9B9gIixP4OfATnfcqGENSfuB0qhYu', 'zayed', 'sd@gmail.com', 60, 1, NULL, NULL, '2020-08-10 21:30:37', '2020-08-11 18:49:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_cates`
--
ALTER TABLE `main_cates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `sub_cates`
--
ALTER TABLE `sub_cates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `main_cates`
--
ALTER TABLE `main_cates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sub_cates`
--
ALTER TABLE `sub_cates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
