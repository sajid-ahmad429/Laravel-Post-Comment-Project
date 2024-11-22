-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2024 at 02:46 PM
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
-- Database: `comments_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `parent_comment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `content`, `post_id`, `parent_comment_id`, `depth`, `created_at`, `updated_at`) VALUES
(1, 'I believe we need more awareness about this.', 1, NULL, 0, '2024-11-21 15:24:44', '2024-11-21 15:24:44'),
(2, 'Thanks for sharing this perspective.', 1, 1, 1, '2024-11-21 15:24:44', '2024-11-21 15:24:44'),
(3, 'That’s an interesting take!', 1, 2, 2, '2024-11-21 15:24:45', '2024-11-21 15:24:45'),
(4, 'This is an important discussion.', 1, 1, 1, '2024-11-21 15:24:45', '2024-11-21 15:24:45'),
(5, 'Let’s discuss this further.', 1, 4, 2, '2024-11-21 15:24:45', '2024-11-21 15:24:45'),
(6, 'I completely agree with this!', 1, NULL, 0, '2024-11-21 15:24:45', '2024-11-21 15:24:45'),
(7, 'This is an important discussion.', 1, 6, 1, '2024-11-21 15:24:45', '2024-11-21 15:24:45'),
(8, 'Totally agree with you.', 1, 7, 2, '2024-11-21 15:24:45', '2024-11-21 15:24:45'),
(9, 'Absolutely insightful!', 1, NULL, 0, '2024-11-21 15:24:45', '2024-11-21 15:24:45'),
(10, 'Couldn’t have said it better myself!', 1, 9, 1, '2024-11-21 15:24:45', '2024-11-21 15:24:45'),
(11, 'That’s an interesting take!', 1, 10, 2, '2024-11-21 15:24:45', '2024-11-21 15:24:45'),
(12, 'Thanks for sharing this perspective.', 1, 9, 1, '2024-11-21 15:24:45', '2024-11-21 15:24:45'),
(13, 'I completely agree with this!', 1, NULL, 0, '2024-11-21 15:24:45', '2024-11-21 15:24:45'),
(14, 'Thanks for sharing this perspective.', 1, 13, 1, '2024-11-21 15:24:45', '2024-11-21 15:24:45'),
(15, 'That’s an interesting take!', 1, 14, 2, '2024-11-21 15:24:45', '2024-11-21 15:24:45'),
(16, 'This is an important discussion.', 1, 13, 1, '2024-11-21 15:24:45', '2024-11-21 15:24:45'),
(17, 'Absolutely insightful!', 2, NULL, 0, '2024-11-21 15:24:45', '2024-11-21 15:24:45'),
(18, 'Thanks for sharing this perspective.', 2, 17, 1, '2024-11-21 15:24:45', '2024-11-21 15:24:45'),
(19, 'Great to see others engaging on this topic.', 2, 18, 2, '2024-11-21 15:24:45', '2024-11-21 15:24:45'),
(20, 'Absolutely insightful!', 2, NULL, 0, '2024-11-21 15:24:45', '2024-11-21 15:24:45'),
(21, 'Thanks for sharing this perspective.', 2, 20, 1, '2024-11-21 15:24:45', '2024-11-21 15:24:45'),
(22, 'I believe we need more awareness about this.', 3, NULL, 0, '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(23, 'Thanks for sharing this perspective.', 3, 22, 1, '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(24, 'Totally agree with you.', 3, 23, 2, '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(25, 'Absolutely insightful!', 3, NULL, 0, '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(26, 'This is an important discussion.', 3, 25, 1, '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(27, 'Couldn’t have said it better myself!', 3, 25, 1, '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(28, 'I believe we need more awareness about this.', 3, NULL, 0, '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(29, 'Couldn’t have said it better myself!', 3, 28, 1, '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(30, 'Absolutely insightful!', 3, NULL, 0, '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(31, 'Thanks for sharing this perspective.', 3, 30, 1, '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(32, 'Looking forward to more posts like this.', 3, 30, 1, '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(33, 'I completely agree with this!', 4, NULL, 0, '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(34, 'Looking forward to more posts like this.', 4, 33, 1, '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(35, 'Let’s discuss this further.', 4, 34, 2, '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(36, 'Absolutely insightful!', 4, NULL, 0, '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(37, 'Thanks for sharing this perspective.', 4, 36, 1, '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(38, 'That’s an interesting take!', 4, 37, 2, '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(39, 'I believe we need more awareness about this.', 4, NULL, 0, '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(40, 'Looking forward to more posts like this.', 4, 39, 1, '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(41, 'Let’s discuss this further.', 4, 40, 2, '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(42, 'Couldn’t have said it better myself!', 4, 39, 1, '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(43, 'Looking forward to more posts like this.', 4, 39, 1, '2024-11-21 15:24:47', '2024-11-21 15:24:47'),
(44, 'Great to see others engaging on this topic.', 4, 43, 2, '2024-11-21 15:24:47', '2024-11-21 15:24:47'),
(45, 'I completely agree with this!', 5, NULL, 0, '2024-11-21 15:24:47', '2024-11-21 15:24:47'),
(46, 'This is an important discussion.', 5, 45, 1, '2024-11-21 15:24:47', '2024-11-21 15:24:47'),
(47, 'Thanks for sharing this perspective.', 5, 45, 1, '2024-11-21 15:24:47', '2024-11-21 15:24:47'),
(48, 'Let’s discuss this further.', 5, 47, 2, '2024-11-21 15:24:47', '2024-11-21 15:24:47'),
(49, 'Thanks for sharing this perspective.', 5, 45, 1, '2024-11-21 15:24:47', '2024-11-21 15:24:47'),
(50, 'That’s an interesting take!', 5, 49, 2, '2024-11-21 15:24:47', '2024-11-21 15:24:47'),
(51, 'This topic is so relevant in today’s India.', 5, NULL, 0, '2024-11-21 15:24:47', '2024-11-21 15:24:47'),
(52, 'Thanks for sharing this perspective.', 5, 51, 1, '2024-11-21 15:24:47', '2024-11-21 15:24:47'),
(53, 'I completely agree with this!', 5, NULL, 0, '2024-11-21 15:24:47', '2024-11-21 15:24:47'),
(54, 'Looking forward to more posts like this.', 5, 53, 1, '2024-11-21 15:24:47', '2024-11-21 15:24:47'),
(55, 'Great to see others engaging on this topic.', 5, 54, 2, '2024-11-21 15:24:47', '2024-11-21 15:24:47'),
(56, 'This is an important discussion.', 5, 53, 1, '2024-11-21 15:24:47', '2024-11-21 15:24:47'),
(57, 'Let’s discuss this further.', 5, 56, 2, '2024-11-21 15:24:47', '2024-11-21 15:24:47'),
(58, 'This topic is so relevant in today’s India.', 5, NULL, 0, '2024-11-21 15:24:47', '2024-11-21 15:24:47'),
(59, 'This is an important discussion.', 5, 58, 1, '2024-11-21 15:24:47', '2024-11-21 15:24:47'),
(60, 'Yes you are right', 2, 17, 1, '2024-11-22 02:52:17', '2024-11-22 02:52:17'),
(61, 'Rights', 2, 20, 1, '2024-11-22 07:10:37', '2024-11-22 07:10:37'),
(62, 'Absolutely', 2, 20, 1, '2024-11-22 07:11:03', '2024-11-22 07:11:03');

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_20_195124_create_posts_table', 2),
(6, '2024_11_20_195306_create_comments_table', 3),
(8, '2024_11_21_073358_create_posts_table', 4),
(9, '2024_11_21_073448_create_comments_table', 4),
(10, '2024_11_21_073741_add_avatar_to_users_table', 5),
(11, '2024_11_21_074212_add_avatar_to_users_table', 6);

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
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 'Importance of Startup Culture', 'Possimus doloremque deserunt ducimus velit sit velit. Quas excepturi sint velit explicabo qui magnam dolore mollitia. Similique minima laudantium hic omnis. Incidunt autem velit magnam quo incidunt consectetur. Culture plays a vital role in shaping the lives of Indian people.', '2024-11-21 15:24:44', '2024-11-21 15:24:44'),
(2, 'Importance of Startup Culture', 'Omnis impedit illo vel aut dolor voluptas amet vel. Non eos maxime et quo. Aspernatur esse numquam accusamus nobis et veniam. Et ut enim impedit quis. Veritatis omnis nobis porro aliquam est non quis itaque. The government has initiated multiple schemes to empower citizens.', '2024-11-21 15:24:45', '2024-11-21 15:24:45'),
(3, 'Importance of Ayurveda', 'Ea architecto numquam est laboriosam est laboriosam quod. Dolorum inventore quis sit fugit molestiae dolores fuga. Tempora corrupti voluptatum harum perferendis. Fuga fuga ratione voluptas tempore magnam officia ipsam. Id optio omnis alias neque enim maxime in quo. Culture plays a vital role in shaping the lives of Indian people.', '2024-11-21 15:24:45', '2024-11-21 15:24:45'),
(4, 'Importance of Yoga', 'Molestiae in in rerum qui. Error et rerum nesciunt eos distinctio est deserunt. Rem veniam labore et enim corporis voluptates ea. Culture plays a vital role in shaping the lives of Indian people.', '2024-11-21 15:24:46', '2024-11-21 15:24:46'),
(5, 'Importance of Indian Festivals', 'Alias distinctio perferendis voluptatibus non corporis necessitatibus. Ut minus qui eius eligendi impedit. Voluptate consequatur corporis quia aliquam. Culture plays a vital role in shaping the lives of Indian people.', '2024-11-21 15:24:47', '2024-11-21 15:24:47');

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
('BQcppPca8O36NCxBDp91a0gkNxnpCD1Cun7sTWyn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicXBjM2tWQTBMbnFLblRSY2tKbFlOcjlhU1dZSTVmcjZjWURVbEhTSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wb3N0LzIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732264513),
('lw4rorTeEwxraET25zIeoya9vMDz24dNmg9JYtDJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVUlObDBUQ3F3Y3FkeFp2RWhZWEZZWElVMDMyYUQxMnlQTnVuTG5BbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732279219),
('VVFQnoXzgyk9eEOIE2QA9tpapudhEtLe893aPwRr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVFhQ3Q5RkJHNW03Skd4UVo5SzV5ZVJHcXpqRmRpSk9aRTJnM3VGaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wb3N0L01RPT0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732282370);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', NULL, '2024-11-21 15:20:14', '$2y$12$rVtVJP/Wt4wLzPAotSdYKuZepipkLopIDwk3mEJ64gOfN0eWaa1lW', 'mb6yQCRZmC', '2024-11-21 15:20:15', '2024-11-21 15:20:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_parent_comment_id_foreign` (`parent_comment_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_parent_comment_id_foreign` FOREIGN KEY (`parent_comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
