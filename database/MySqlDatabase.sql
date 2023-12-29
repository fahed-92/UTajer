-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Aug 21, 2021 at 03:53 PM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `martfury`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'kC6PW9OE8Lpd6i43hDBYaGxy4puS7G78', 1, '2021-07-12 22:41:42', '2021-07-12 22:41:42', '2021-07-12 22:41:42'),
(2, 1, 'qrri3mzoQqaumdeNsFASf0LDHiiLT7dA', 1, '2021-08-03 20:58:52', '2021-08-03 20:58:52', '2021-08-03 20:58:52'),
(3, 1, 'i1z6r3uddaoLjfahYRIErEkyAZUgY4Ol', 1, '2021-08-21 01:52:22', '2021-08-21 01:52:22', '2021-08-21 01:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked` bigint(20) NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `name`, `expired_at`, `location`, `key`, `image`, `url`, `clicked`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Top Slider Image 1', '2026-08-21 00:00:00', 'top-slider-image-1', 'IAHC8V4Q0SQG', 'promotion/1.jpg', '/products', 0, 1, 'published', '2021-08-21 01:52:21', '2021-08-21 01:52:21'),
(2, 'Top Slider Image 2', '2026-08-21 00:00:00', 'top-slider-image-2', 'SNYXSLKD46VX', 'promotion/2.jpg', '/products', 0, 2, 'published', '2021-08-21 01:52:21', '2021-08-21 01:52:21'),
(3, 'Homepage middle 1', '2026-08-21 00:00:00', 'not_set', 'IZ6WU8KUALYD', 'promotion/3.jpg', '/products', 0, 3, 'published', '2021-08-21 01:52:21', '2021-08-21 01:52:21'),
(4, 'Homepage middle 2', '2026-08-21 00:00:00', 'not_set', 'ILSFJVYFGCPZ', 'promotion/4.jpg', '/products', 0, 4, 'published', '2021-08-21 01:52:21', '2021-08-21 01:52:21'),
(5, 'Homepage middle 3', '2026-08-21 00:00:00', 'not_set', 'ZDOZUZZIU7FT', 'promotion/5.jpg', '/products', 0, 5, 'published', '2021-08-21 01:52:21', '2021-08-21 01:52:21'),
(6, 'Homepage big 1', '2026-08-21 00:00:00', 'not_set', 'Q9YDUIC9HSWS', 'promotion/6.jpg', '/products', 0, 6, 'published', '2021-08-21 01:52:21', '2021-08-21 01:52:21'),
(7, 'Homepage bottom small', '2026-08-21 00:00:00', 'not_set', '6XOUUXTMC2OB', 'promotion/7.jpg', '/products', 0, 7, 'published', '2021-08-21 01:52:21', '2021-08-21 01:52:21'),
(8, 'Product sidebar', '2026-08-21 00:00:00', 'product-sidebar', 'QTWSPFYLREDF', 'promotion/8.jpg', '/products', 0, 8, 'published', '2021-08-21 01:52:21', '2021-08-21 01:52:21'),
(9, 'Homepage big 2', '2026-08-21 00:00:00', 'not_set', 'IZ6WU8KUALYE', 'promotion/9.jpg', '/products', 0, 9, 'published', '2021-08-21 01:52:21', '2021-08-21 01:52:21');

-- --------------------------------------------------------

--
-- Table structure for table `audit_histories`
--

CREATE TABLE `audit_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` int(10) UNSIGNED NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT '0',
  `is_featured` tinyint(4) NOT NULL DEFAULT '0',
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `description`, `status`, `author_id`, `author_type`, `icon`, `order`, `is_featured`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Ecommerce', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 1, '2021-08-21 01:52:19', '2021-08-21 01:52:19'),
(2, 'Fashion', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2021-08-21 01:52:19', '2021-08-21 01:52:19'),
(3, 'Electronic', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2021-08-21 01:52:19', '2021-08-21 01:52:19'),
(4, 'Commercial', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2021-08-21 01:52:19', '2021-08-21 01:52:19');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `address`, `subject`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Prof. Riley Cormier', 'jakubowski.alejandrin@example.com', '+1 (321) 939-4021', '1395 Issac Pass Apt. 543\nSchulistside, MA 85842', 'Et voluptates porro cumque ut blanditiis quo.', 'Nihil molestiae illum illum harum quisquam et. Dolore assumenda rerum asperiores quidem sequi voluptate voluptatem ut. Doloribus asperiores aut quos id velit. Aut accusamus odio necessitatibus et suscipit non fugit. Blanditiis ut adipisci deleniti officiis voluptas id. Expedita recusandae numquam consequuntur. Aperiam sed voluptas quidem.', 'unread', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(2, 'Ibrahim Beer I', 'bashirian.jacinthe@example.net', '(520) 297-3157', '1398 Jazmyne Prairie\nMelliemouth, ID 83723-3253', 'Voluptates labore voluptas quia fuga saepe.', 'Nisi debitis sunt sunt nemo sunt impedit perspiciatis. Aut a adipisci qui. Et et iste aut inventore possimus nemo ex deleniti. Deleniti laudantium quidem aut vero recusandae suscipit commodi aliquid. Exercitationem id et quidem sed. Dicta voluptates vel ad nihil doloribus vero alias. Aspernatur ab repudiandae sint quae neque nostrum quos veniam. Dolor corrupti tempore sed nemo molestias corrupti nostrum placeat.', 'unread', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(3, 'Aliza Johnson IV', 'jeremie56@example.net', '+1 (804) 505-3331', '914 Jena Shore\nMcCluremouth, ME 25049', 'Earum aut vel libero illum ut neque.', 'Est laborum quod voluptas. Cumque aut ea sed et odit laudantium et excepturi. Est deleniti eius accusamus. Fugit laborum repellat labore laboriosam eos molestias. Error aut cupiditate accusamus quas dolor. Numquam ut est a voluptates earum. Ullam omnis similique quam omnis recusandae dolorum molestiae qui. Sit dolore consequatur minus perspiciatis culpa. Placeat delectus rerum unde repudiandae. Recusandae ad vel ipsa cupiditate alias consequatur. Modi soluta iste et eum.', 'unread', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(4, 'Mr. Howard Ankunding I', 'caitlyn.abbott@example.org', '760-490-0871', '12669 Swift Divide Suite 010\nNorth Donnell, NE 73474-9741', 'Delectus quibusdam dolorem ea deserunt ut.', 'Dolore deleniti et eos id dolores. Impedit enim debitis nobis cupiditate dolores debitis totam. Sit atque numquam minus. Blanditiis sed dolorem sed quas ut est. Sequi impedit dignissimos aut laborum recusandae voluptatem. Harum eos quis sed quae earum. Numquam vel qui non quos voluptatem. Dolorem repellat facere culpa sint id. Eum iusto possimus doloribus tempora qui fugiat.', 'read', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(5, 'Constantin Eichmann', 'harvey.jennie@example.com', '930-803-3328', '1101 Kris Way\nNorth Gabrielletown, VA 10828', 'At in adipisci consequatur fugit.', 'Nulla in recusandae voluptatem sapiente. Sit vel totam et mollitia est et incidunt. Deserunt officiis explicabo impedit animi quis dicta voluptatem. Aut fugit labore blanditiis voluptatem unde eos blanditiis. Magni iure exercitationem voluptatibus at sunt. Qui impedit rem dolores fugiat. Nemo quisquam consequuntur quia adipisci. Quia aliquid ut et dolor est dolorem. Rerum omnis qui eos. Dolor neque mollitia tempora et deserunt ipsa. Amet facilis voluptatum dicta sunt ipsum tenetur sunt unde.', 'unread', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(6, 'Tate Satterfield', 'alice68@example.com', '+1.786.906.8858', '3140 Friesen Crossing Suite 394\nGrayceburgh, MA 71637-1179', 'Saepe et dolor velit.', 'Et aliquid quo repellendus autem. Est voluptatem est laborum porro reiciendis. Ea delectus vel deserunt similique. Aut est aperiam laboriosam. Quam distinctio nesciunt quas corrupti ullam consectetur. Nesciunt libero vel labore consequatur. Laudantium quae similique ut occaecati quod beatae. Et neque deleniti non voluptas officia ea. Debitis illo omnis dolor reprehenderit quibusdam omnis. Quo perspiciatis doloribus magni sed autem quia ut. Dolor eveniet perferendis reiciendis quidem.', 'read', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(7, 'Ludie Streich', 'stiedemann.bulah@example.net', '1-323-756-9209', '3406 Shawn Junction Apt. 175\nLake Clarissaview, MT 60881-5677', 'Soluta iure odio nemo accusantium.', 'Nobis aut dolores animi voluptatibus et quam. Reiciendis iusto quibusdam asperiores officiis. Qui voluptatem ex quaerat corporis ea pariatur velit. Et quasi perspiciatis distinctio ut. Animi sunt consequatur qui voluptatibus at perferendis voluptatem. Repudiandae culpa maxime aspernatur esse voluptates. Amet pariatur quae vitae consectetur ut ipsa.', 'unread', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(8, 'Garett Marks', 'hiram.torphy@example.net', '+1-928-526-8196', '438 Powlowski Coves Suite 699\nNolanside, MD 00195', 'Et et in beatae omnis suscipit accusamus.', 'Eaque et odio temporibus eos et magnam rem. Cumque itaque ipsam vel dolores qui architecto dolorem. Illum adipisci alias excepturi aperiam. Expedita id rerum aut rerum in aut architecto. Nihil voluptas aut dolorem tenetur quod molestias. Qui ratione unde perferendis consequatur nostrum adipisci. Deleniti ut beatae sequi consequuntur. Perspiciatis esse veniam rem ad id. Tempore culpa veritatis sequi ab.', 'unread', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(9, 'Jed Hansen', 'orunolfsson@example.com', '424-245-0353', '14557 Torphy Point\nNorth Zenafort, HI 20647-2852', 'Neque magni quo et.', 'Aliquam dolorem aut officiis sunt asperiores molestiae non. Asperiores non hic voluptas. Et molestias tenetur alias ad dolores et. Minima optio nisi molestiae sed totam. Sunt quaerat debitis ea sunt incidunt ipsa sunt. Et ex et velit alias. Eius vel vitae accusamus. Officia velit veritatis fugiat. Animi velit error nesciunt praesentium id harum. Ipsam consequuntur quia in dolores earum.', 'read', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(10, 'Manuela Moore', 'clare85@example.net', '(860) 563-7863', '9681 Skiles Via Apt. 803\nEast Willis, AL 07045-2641', 'Tempore quam voluptas aut quaerat.', 'Dolores enim expedita debitis laborum. Dolorum quia beatae consequuntur deleniti in maiores quia. Aperiam magni iure aperiam maiores voluptas. Commodi quibusdam ipsa iure quia est laudantium deleniti dolorem. Accusantium explicabo possimus tenetur voluptatem blanditiis ut et. Quasi aspernatur et qui sapiente dolorem repudiandae eos. Nisi occaecati dolorem totam qui ab. Veritatis voluptas ut ea earum consequuntur modi ut. Qui id commodi voluptas nesciunt porro.', 'read', '2021-08-21 01:52:15', '2021-08-21 01:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `contact_replies`
--

CREATE TABLE `contact_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widgets`
--

CREATE TABLE `dashboard_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widget_settings`
--

CREATE TABLE `dashboard_widget_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `widget_id` int(10) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_brands`
--

CREATE TABLE `ec_brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_brands`
--

INSERT INTO `ec_brands` (`id`, `name`, `description`, `website`, `logo`, `status`, `order`, `is_featured`, `created_at`, `updated_at`) VALUES
(1, 'Fashion live', NULL, NULL, 'brands/1.jpg', 'published', 0, 1, '2021-08-21 01:51:50', '2021-08-21 01:51:50'),
(2, 'Hand crafted', NULL, NULL, 'brands/2.jpg', 'published', 1, 1, '2021-08-21 01:51:50', '2021-08-21 01:51:50'),
(3, 'Mestonix', NULL, NULL, 'brands/3.jpg', 'published', 2, 1, '2021-08-21 01:51:50', '2021-08-21 01:51:50'),
(4, 'Sunshine', NULL, NULL, 'brands/4.jpg', 'published', 3, 1, '2021-08-21 01:51:50', '2021-08-21 01:51:50'),
(5, 'Pure', NULL, NULL, 'brands/5.jpg', 'published', 4, 1, '2021-08-21 01:51:50', '2021-08-21 01:51:50'),
(6, 'Anfold', NULL, NULL, 'brands/6.jpg', 'published', 5, 1, '2021-08-21 01:51:50', '2021-08-21 01:51:50'),
(7, 'Automotive', NULL, NULL, 'brands/7.jpg', 'published', 6, 1, '2021-08-21 01:51:50', '2021-08-21 01:51:50');

-- --------------------------------------------------------

--
-- Table structure for table `ec_brands_translations`
--

CREATE TABLE `ec_brands_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_brands_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_cart`
--

CREATE TABLE `ec_cart` (
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_currencies`
--

CREATE TABLE `ec_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `decimals` tinyint(3) UNSIGNED DEFAULT '0',
  `order` int(10) UNSIGNED DEFAULT '0',
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_currencies`
--

INSERT INTO `ec_currencies` (`id`, `title`, `symbol`, `is_prefix_symbol`, `decimals`, `order`, `is_default`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 1, 2, 0, 1, 1, '2021-08-21 01:51:50', '2021-08-21 01:51:50'),
(2, 'EUR', '€', 0, 2, 1, 0, 0.84, '2021-08-21 01:51:50', '2021-08-21 01:51:50'),
(3, 'VND', '₫', 0, 0, 2, 0, 23203, '2021-08-21 01:51:50', '2021-08-21 01:51:50');

-- --------------------------------------------------------

--
-- Table structure for table `ec_customers`
--

CREATE TABLE `ec_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_vendor` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_customers`
--

INSERT INTO `ec_customers` (`id`, `name`, `email`, `password`, `avatar`, `dob`, `phone`, `remember_token`, `created_at`, `updated_at`, `confirmed_at`, `email_verify_token`, `is_vendor`) VALUES
(1, 'Ian Conroy', 'customer@botble.com', '$2y$10$asms3YwwK4vlbwmiAIgBX.Gwn6he/vw4xy.Gk3VXsS7M6GYqy1dFm', 'customers/3.jpg', NULL, '+12107247331', NULL, '2021-08-21 01:52:13', '2021-08-21 01:52:13', '2021-08-21 08:52:13', NULL, 0),
(2, 'Dr. Jordon Dare IV', 'vendor@botble.com', '$2y$10$q50VgBtFEGOR18ruwGUFN..I2qKFrnVBwnR9dx0dKIy2Hp7DlDcRe', 'customers/7.jpg', NULL, '+13185188791', NULL, '2021-08-21 01:52:13', '2021-08-21 01:52:24', '2021-08-21 08:52:13', NULL, 1),
(3, 'Arjun Rempel', 'arnulfo15@example.org', '$2y$10$2HaTbqBx5otX8GDnbVIQyecZZuhvTm1eqX9ObtP9cwXJyHQaJgG5i', 'customers/1.jpg', NULL, '+14757150566', NULL, '2021-08-21 01:52:13', '2021-08-21 01:52:13', '2021-08-21 08:52:13', NULL, 0),
(4, 'Mia Lindgren', 'jaime89@example.net', '$2y$10$91LPXEo9B4cQ8173hqlwtebg2djiFxXDi7HEEq/2.ZP0e39OgNSXO', 'customers/2.jpg', NULL, '+14639385323', NULL, '2021-08-21 01:52:14', '2021-08-21 01:52:24', '2021-08-21 08:52:14', NULL, 1),
(5, 'Sabina Beatty', 'icarter@example.org', '$2y$10$7D3A9N7l7KPclvaa5zZXuuLn6L9CaLQh96aYpLeK3UfMukatb6Nk2', 'customers/3.jpg', NULL, '+17475958312', NULL, '2021-08-21 01:52:14', '2021-08-21 01:52:14', '2021-08-21 08:52:14', NULL, 0),
(6, 'Darby Wilderman', 'hester.muller@example.com', '$2y$10$2TBnYP6ZNn.T1eJUkwtTs.ab1NjyCIzaBhFcRnSPRr6FJtwjhM3/.', 'customers/4.jpg', NULL, '+17474759263', NULL, '2021-08-21 01:52:14', '2021-08-21 01:52:25', '2021-08-21 08:52:14', NULL, 1),
(7, 'Dr. Keyshawn Heaney', 'violet64@example.net', '$2y$10$Lx9GnU5eIoqhEnsQPLSf1OWU/doPWhUD.VGerkrsX8QhZCCMG5OpW', 'customers/5.jpg', NULL, '+19364203452', NULL, '2021-08-21 01:52:14', '2021-08-21 01:52:14', '2021-08-21 08:52:14', NULL, 0),
(8, 'Kim Welch', 'ukerluke@example.net', '$2y$10$0o9OTrWYPJ8DYyeCwQ/jBuWcHHRlwtWveA40.6iPOkhLvWKnb1JvG', 'customers/6.jpg', NULL, '+16235877104', NULL, '2021-08-21 01:52:15', '2021-08-21 01:52:15', '2021-08-21 08:52:15', NULL, 0),
(9, 'Sarina Corkery', 'rae.farrell@example.net', '$2y$10$0ahFogz6jLguV3PAyjeYd.ctVbW1P7wAjBbruhLSIDns73xdNK7SW', 'customers/7.jpg', NULL, '+12818673093', NULL, '2021-08-21 01:52:15', '2021-08-21 01:52:25', '2021-08-21 08:52:15', NULL, 1),
(10, 'Alexanne Huels MD', 'stephania40@example.org', '$2y$10$8ZH2mrsmUyuZ6IotM3geGu8v6bh4no9fk1Nl5XcEjRjsTqK150Z3u', 'customers/8.jpg', NULL, '+18720575985', NULL, '2021-08-21 01:52:15', '2021-08-21 01:52:25', '2021-08-21 08:52:15', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ec_customer_addresses`
--

CREATE TABLE `ec_customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_customer_addresses`
--

INSERT INTO `ec_customer_addresses` (`id`, `name`, `email`, `phone`, `country`, `state`, `city`, `address`, `customer_id`, `is_default`, `created_at`, `updated_at`, `zip_code`) VALUES
(1, 'Ian Conroy', 'customer@botble.com', '+15032700992', 'GN', 'Kansas', 'Hayesmouth', '52718 Taylor Roads Suite 863', 1, 1, '2021-08-21 01:52:13', '2021-08-21 01:52:13', '52534-6724'),
(2, 'Ian Conroy', 'customer@botble.com', '+19376912016', 'PK', 'District of Columbia', 'West Justenhaven', '95273 Tromp Square Suite 744', 1, 0, '2021-08-21 01:52:13', '2021-08-21 01:52:13', '93652-7303'),
(3, 'Dr. Jordon Dare IV', 'vendor@botble.com', '+12405209160', 'FM', 'South Dakota', 'Hardyview', '52875 Katelynn Forks Apt. 414', 2, 1, '2021-08-21 01:52:13', '2021-08-21 01:52:13', '57533-1174'),
(4, 'Dr. Jordon Dare IV', 'vendor@botble.com', '+13863687474', 'FI', 'Kentucky', 'Cormierport', '6342 Heathcote Alley', 2, 0, '2021-08-21 01:52:13', '2021-08-21 01:52:13', '69884'),
(5, 'Arjun Rempel', 'arnulfo15@example.org', '+13079764932', 'PY', 'Connecticut', 'North Paxton', '293 Crooks Prairie', 3, 1, '2021-08-21 01:52:13', '2021-08-21 01:52:13', '57654'),
(6, 'Mia Lindgren', 'jaime89@example.net', '+16191138857', 'BT', 'Arkansas', 'New Dagmarchester', '899 Luettgen Brooks', 4, 1, '2021-08-21 01:52:14', '2021-08-21 01:52:14', '87882-2002'),
(7, 'Sabina Beatty', 'icarter@example.org', '+12626164118', 'BM', 'Iowa', 'Port Paigemouth', '4294 Dooley Court Apt. 670', 5, 1, '2021-08-21 01:52:14', '2021-08-21 01:52:14', '36128-9963'),
(8, 'Darby Wilderman', 'hester.muller@example.com', '+19864122462', 'TF', 'South Carolina', 'Altenwerthton', '2703 Esta Track', 6, 1, '2021-08-21 01:52:14', '2021-08-21 01:52:14', '83640-6702'),
(9, 'Dr. Keyshawn Heaney', 'violet64@example.net', '+13608514467', 'MU', 'Nebraska', 'Randalview', '12265 Stehr Forges', 7, 1, '2021-08-21 01:52:14', '2021-08-21 01:52:14', '65316-8855'),
(10, 'Kim Welch', 'ukerluke@example.net', '+15850500037', 'LK', 'Iowa', 'Ashleetown', '42403 Fidel Road', 8, 1, '2021-08-21 01:52:15', '2021-08-21 01:52:15', '99346-2735'),
(11, 'Sarina Corkery', 'rae.farrell@example.net', '+15801722005', 'RO', 'Vermont', 'Jaycebury', '94109 Maggio Wells Apt. 318', 9, 1, '2021-08-21 01:52:15', '2021-08-21 01:52:15', '67000-7533'),
(12, 'Alexanne Huels MD', 'stephania40@example.org', '+13611876475', 'MQ', 'New Jersey', 'Binsville', '4957 Wilkinson Lakes', 10, 1, '2021-08-21 01:52:15', '2021-08-21 01:52:15', '07785-0780');

-- --------------------------------------------------------

--
-- Table structure for table `ec_customer_password_resets`
--

CREATE TABLE `ec_customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_discounts`
--

CREATE TABLE `ec_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_used` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` double DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'coupon',
  `can_use_with_promotion` tinyint(1) NOT NULL DEFAULT '0',
  `discount_on` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int(10) UNSIGNED DEFAULT NULL,
  `type_option` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `target` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all-orders',
  `min_order_price` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_discount_customers`
--

CREATE TABLE `ec_discount_customers` (
  `discount_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_discount_products`
--

CREATE TABLE `ec_discount_products` (
  `discount_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_discount_product_collections`
--

CREATE TABLE `ec_discount_product_collections` (
  `discount_id` int(10) UNSIGNED NOT NULL,
  `product_collection_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_flash_sales`
--

CREATE TABLE `ec_flash_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` datetime NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_flash_sales`
--

INSERT INTO `ec_flash_sales` (`id`, `name`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Winter Sale', '2021-09-20 00:00:00', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `ec_flash_sales_translations`
--

CREATE TABLE `ec_flash_sales_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_flash_sales_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_flash_sale_products`
--

CREATE TABLE `ec_flash_sale_products` (
  `flash_sale_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `price` double UNSIGNED DEFAULT NULL,
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `sold` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_flash_sale_products`
--

INSERT INTO `ec_flash_sale_products` (`flash_sale_id`, `product_id`, `price`, `quantity`, `sold`) VALUES
(1, 1, 36.915, 20, 5),
(1, 2, 18.225, 13, 2),
(1, 3, 10.8, 16, 5),
(1, 4, 231.6816, 11, 1),
(1, 5, 324.52, 7, 3),
(1, 6, 314.53, 11, 2),
(1, 7, 493.95, 15, 4),
(1, 8, 706.7592, 18, 4),
(1, 9, 477.9, 10, 3),
(1, 10, 806, 15, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ec_grouped_products`
--

CREATE TABLE `ec_grouped_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_product_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `fixed_qty` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_orders`
--

CREATE TABLE `ec_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `amount` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `shipping_amount` decimal(15,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `discount_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_finished` tinyint(1) DEFAULT '1',
  `token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_orders`
--

INSERT INTO `ec_orders` (`id`, `user_id`, `shipping_option`, `shipping_method`, `status`, `amount`, `tax_amount`, `shipping_amount`, `description`, `coupon_code`, `discount_amount`, `sub_total`, `is_confirmed`, `discount_description`, `is_finished`, `token`, `payment_id`, `created_at`, `updated_at`, `store_id`) VALUES
(1, 7, '1', 'default', 'pending', '1754.60', '56.60', '0.00', NULL, NULL, '0.00', '1698.00', 1, NULL, 1, 'ISX5aC9t7vaww67WoPbzfGIRJRpfh', 1, '2021-08-12 17:52:26', '2021-08-21 01:52:26', 5),
(2, 7, '1', 'default', 'pending', '2483.10', '80.10', '0.00', NULL, NULL, '0.00', '2403.00', 1, NULL, 1, 'eO6yDGtXCQvFdIrWfMf9OWTD2yhqj', 2, '2021-08-07 17:52:26', '2021-08-21 01:52:26', 2),
(3, 5, '1', 'default', 'completed', '248.78', '8.03', '0.00', NULL, NULL, '0.00', '240.75', 1, NULL, 1, 'yXs8wRbtJmw2sqRe2Hn5UvysJ7DJB', 3, '2021-08-14 17:52:26', '2021-08-21 01:52:27', 1),
(4, 5, '1', 'default', 'pending', '2967.30', '141.30', '0.00', NULL, NULL, '0.00', '2826.00', 1, NULL, 1, 'AqLWnSGHFmKZmWoL2i0elOTrIBUe2', 4, '2021-08-08 09:52:26', '2021-08-21 01:52:26', 2),
(5, 5, '1', 'default', 'pending', '578.60', '52.60', '0.00', NULL, NULL, '0.00', '526.00', 1, NULL, 1, 'p8JkPLhxg1eynI2fNoOoQh3BG9Y9S', 5, '2021-08-11 13:52:26', '2021-08-21 01:52:26', 4),
(6, 8, '1', 'default', 'pending', '2720.50', '104.50', '0.00', NULL, NULL, '0.00', '2616.00', 1, NULL, 1, 'IzoxE7yEcNsSFjwSeQiMqbkmrs6Xo', 6, '2021-08-19 13:52:26', '2021-08-21 01:52:26', 4),
(7, 8, '1', 'default', 'completed', '622.60', '56.60', '0.00', NULL, NULL, '0.00', '566.00', 1, NULL, 1, 'cmHmTGeOU3q8R7u0Y2WUYrU7cVgmU', 7, '2021-08-12 01:52:26', '2021-08-21 01:52:27', 5),
(8, 8, '1', 'default', 'pending', '2483.10', '80.10', '0.00', NULL, NULL, '0.00', '2403.00', 1, NULL, 1, 'SxkBiInw6jExfnSnJ7wpZdRDwf1Qv', 8, '2021-08-19 13:52:26', '2021-08-21 01:52:26', 2),
(9, 8, '1', 'default', 'pending', '1608.90', '51.90', '0.00', NULL, NULL, '0.00', '1557.00', 1, NULL, 1, '18wMGgbeL6GvyekqOdvLiIVyoQliP', 9, '2021-08-09 17:52:26', '2021-08-21 01:52:26', 4),
(10, 8, '1', 'default', 'completed', '3952.50', '127.50', '0.00', NULL, NULL, '0.00', '3825.00', 1, NULL, 1, 'GiBeljzlT54wOh7w2iEz3jUaBCh2J', 10, '2021-08-18 05:52:26', '2021-08-21 01:52:28', 5),
(11, 8, '1', 'default', 'pending', '1173.90', '55.90', '0.00', NULL, NULL, '0.00', '1118.00', 1, NULL, 1, 'F6N8G73532OHbMkPPzKQT7cNKYQX5', 11, '2021-08-13 23:52:26', '2021-08-21 01:52:26', 2),
(12, 8, '1', 'default', 'completed', '1639.90', '52.90', '0.00', NULL, NULL, '0.00', '1587.00', 1, NULL, 1, 'xlpfmSQV9QMd0lO02BsdsYxgVFer5', 12, '2021-08-09 17:52:26', '2021-08-21 01:52:29', 3),
(13, 1, '1', 'default', 'completed', '4380.30', '141.30', '0.00', NULL, NULL, '0.00', '4239.00', 1, NULL, 1, 'Pc8t9G7PfSf0hl3JO2qMGR4Hr3hit', 13, '2021-08-14 09:52:26', '2021-08-21 01:52:29', 2),
(14, 1, '1', 'default', 'pending', '1630.60', '52.60', '0.00', NULL, NULL, '0.00', '1578.00', 1, NULL, 1, 'Muf9wgRFYYLiGx8koH6uXJ125bWwQ', 14, '2021-08-19 17:52:26', '2021-08-21 01:52:26', 4),
(15, 5, '1', 'default', 'pending', '1793.40', '85.40', '0.00', NULL, NULL, '0.00', '1708.00', 1, NULL, 1, 'kJL1SvySFhb2mqlDhCSBjq971F3pC', 15, '2021-08-13 13:52:26', '2021-08-21 01:52:26', 2),
(16, 5, '1', 'default', 'pending', '2677.50', '127.50', '0.00', NULL, NULL, '0.00', '2550.00', 1, NULL, 1, '6hOaKQJi6fVkNPLYQx5fISueLbqoJ', 16, '2021-08-17 07:52:26', '2021-08-21 01:52:26', 5),
(17, 1, '1', 'default', 'completed', '614.90', '55.90', '0.00', NULL, NULL, '0.00', '559.00', 1, NULL, 1, '22RHYv7Hn6uxcPIlrb08bpsTPwPdd', 17, '2021-08-17 13:52:26', '2021-08-21 01:52:30', 2),
(18, 1, '1', 'default', 'pending', '3741.70', '120.70', '0.00', NULL, NULL, '0.00', '3621.00', 1, NULL, 1, 'md9ENZHCIL39AMDuGJ8QuuEoMlQao', 18, '2021-08-14 01:52:26', '2021-08-21 01:52:26', 1),
(19, 1, '1', 'default', 'pending', '248.78', '8.03', '0.00', NULL, NULL, '0.00', '240.75', 1, NULL, 1, 'PeiGoEs5X9yZe6eDdCs5K8UMp4IKj', 19, '2021-08-11 07:52:26', '2021-08-21 01:52:26', 1),
(20, 1, '1', 'default', 'pending', '790.90', '71.90', '0.00', NULL, NULL, '0.00', '719.00', 1, NULL, 1, 'iRplQTvE1Ixd3AhRCgyZSXpioibOY', 20, '2021-08-10 05:52:26', '2021-08-21 01:52:26', 3),
(21, 1, '1', 'default', 'pending', '2647.40', '85.40', '0.00', NULL, NULL, '0.00', '2562.00', 1, NULL, 1, 'bOfT3DB6hznw7qVQmTKwFv059a5wW', 21, '2021-08-11 01:52:26', '2021-08-21 01:52:26', 2),
(22, 1, '1', 'default', 'pending', '2427.60', '115.60', '0.00', NULL, NULL, '0.00', '2312.00', 1, NULL, 1, 'F8GGiGSSF7gI803huB3rd6Cu6PKrl', 22, '2021-08-20 01:52:26', '2021-08-21 01:52:26', 5),
(23, 1, '1', 'default', 'completed', '790.90', '71.90', '0.00', NULL, NULL, '0.00', '719.00', 1, NULL, 1, 'J93mTHObd1pv7HLKb4tNlyO9N790k', 23, '2021-08-15 01:52:26', '2021-08-21 01:52:30', 3),
(24, 1, '1', 'default', 'pending', '44.55', '4.05', '0.00', NULL, NULL, '0.00', '40.50', 1, NULL, 1, 'yaRmv6mR465zPWEPOMLsW2dPB0XvF', 24, '2021-08-14 15:52:26', '2021-08-21 01:52:26', 1),
(25, 1, '1', 'default', 'pending', '1188.60', '56.60', '0.00', NULL, NULL, '0.00', '1132.00', 1, NULL, 1, 'Ufw8j7OeA6EPLUpNOOGLZJ4U9fDMx', 25, '2021-08-16 11:52:26', '2021-08-21 01:52:26', 5),
(26, 1, '1', 'default', 'pending', '4216.00', '136.00', '0.00', NULL, NULL, '0.00', '4080.00', 1, NULL, 1, 'bGzkJR773VM05JwrX4o3JbXJjIvLy', 26, '2021-08-13 13:52:26', '2021-08-21 01:52:26', 2),
(27, 1, '1', 'default', 'pending', '511.50', '46.50', '0.00', NULL, NULL, '0.00', '465.00', 1, NULL, 1, 'Uje9Ppi4a2mTXwXfTUGxBcV67yH2J', 27, '2021-08-20 05:52:26', '2021-08-21 01:52:26', 4),
(28, 5, '1', 'default', 'completed', '42.00', '2.00', '0.00', NULL, NULL, '0.00', '40.00', 1, NULL, 1, '8EJUIvlMGToESU0onawIk9Km93QoX', 28, '2021-08-19 13:52:26', '2021-08-21 01:52:31', 1),
(29, 5, '1', 'default', 'completed', '1089.90', '51.90', '0.00', NULL, NULL, '0.00', '1038.00', 1, NULL, 1, 'MnxYlkWAd3E39LfWnLia5iafKTmLa', 29, '2021-08-17 07:52:26', '2021-08-21 01:52:32', 4),
(30, 5, '1', 'default', 'pending', '1720.50', '55.50', '0.00', NULL, NULL, '0.00', '1665.00', 1, NULL, 1, '4tAJ11wI6SkYHKSSMX0kG0TGAAzDp', 30, '2021-08-18 19:52:26', '2021-08-21 01:52:26', 2),
(31, 1, '1', 'default', 'pending', '170.10', '8.10', '0.00', NULL, NULL, '0.00', '162.00', 1, NULL, 1, '5cZ1sNaaC9ZmlTfxtuH5ThIuPTqyX', 31, '2021-08-18 09:52:26', '2021-08-21 01:52:26', 1),
(32, 1, '1', 'default', 'pending', '2647.40', '85.40', '0.00', NULL, NULL, '0.00', '2562.00', 1, NULL, 1, 'vHETymMVj5FXITypwb6qKB8D7Kd2x', 32, '2021-08-18 09:52:26', '2021-08-21 01:52:26', 2),
(33, 1, '1', 'default', 'pending', '649.00', '59.00', '0.00', NULL, NULL, '0.00', '590.00', 1, NULL, 1, '6M4QRovXvINzsQMDw77n1OpaXVssk', 33, '2021-08-16 09:52:26', '2021-08-21 01:52:26', 5),
(34, 5, '1', 'default', 'pending', '487.30', '44.30', '0.00', NULL, NULL, '0.00', '443.00', 1, NULL, 1, 'ymJ4wGMqV2Ye4cTMR6eMUgEm6GYFq', 34, '2021-08-17 13:52:26', '2021-08-21 01:52:26', 3),
(35, 5, '1', 'default', 'pending', '633.60', '57.60', '0.00', NULL, NULL, '0.00', '576.00', 1, NULL, 1, 'wEr3CxPtTABiGYMrTKHQLonDVSawT', 35, '2021-08-16 23:52:26', '2021-08-21 01:52:26', 1),
(36, 5, '1', 'default', 'completed', '1247.40', '59.40', '0.00', NULL, NULL, '0.00', '1188.00', 1, NULL, 1, '32F62saFteGHTX1hIFr6VywGYNHzB', 36, '2021-08-18 03:52:27', '2021-08-21 01:52:32', 2),
(37, 5, '1', 'default', 'pending', '622.60', '56.60', '0.00', NULL, NULL, '0.00', '566.00', 1, NULL, 1, 'JgcRkGsnpheDdiIjqFHVWdRDnXNbs', 37, '2021-08-15 05:52:27', '2021-08-21 01:52:27', 5),
(38, 1, '1', 'default', 'pending', '2293.20', '168.20', '0.00', NULL, NULL, '0.00', '2125.00', 1, NULL, 1, 'HbuKcuZhKyCrZqMASeJiYlcOzWzio', 38, '2021-08-18 01:52:27', '2021-08-21 01:52:27', 3),
(39, 1, '1', 'default', 'pending', '1188.60', '56.60', '0.00', NULL, NULL, '0.00', '1132.00', 1, NULL, 1, 'Qb6cE9ZDo73XldIe8cld1FmEJyeuK', 39, '2021-08-19 13:52:27', '2021-08-21 01:52:27', 5),
(40, 3, '1', 'default', 'pending', '1592.80', '144.80', '0.00', NULL, NULL, '0.00', '1448.00', 1, NULL, 1, 'Y0SOKEY6oasQSn3INjy5NAJuWnHIF', 40, '2021-08-19 19:52:27', '2021-08-21 01:52:27', 2),
(41, 1, '1', 'default', 'pending', '1793.40', '85.40', '0.00', NULL, NULL, '0.00', '1708.00', 1, NULL, 1, 'w4jP87JG9YfAHOp5cibahPXfnLa0i', 41, '2021-08-20 01:52:27', '2021-08-21 01:52:27', 2),
(42, 1, '1', 'default', 'completed', '1327.70', '120.70', '0.00', NULL, NULL, '0.00', '1207.00', 1, NULL, 1, 'qlawj1bOPws5oYaUInnbWaTRapbea', 42, '2021-08-19 17:52:27', '2021-08-21 01:52:33', 1),
(43, 5, '1', 'default', 'pending', '248.78', '8.03', '0.00', NULL, NULL, '0.00', '240.75', 1, NULL, 1, 'wgBCF1yUWjIYC0AMUpZq6wRgzbZwr', 43, '2021-08-19 07:52:27', '2021-08-21 01:52:27', 1),
(44, 5, '1', 'default', 'pending', '3730.50', '139.50', '0.00', NULL, NULL, '0.00', '3591.00', 1, NULL, 1, 'UTP1BRStdglgdynav8oYC2VLg8VHp', 44, '2021-08-20 19:52:27', '2021-08-21 01:52:27', 2),
(45, 5, '1', 'default', 'pending', '168.53', '8.03', '0.00', NULL, NULL, '0.00', '160.50', 1, NULL, 1, '53f54tzdqMIgWH57ykhK1pm7roRAP', 45, '2021-08-19 13:52:27', '2021-08-21 01:52:27', 1),
(46, 5, '1', 'default', 'pending', '2677.50', '127.50', '0.00', NULL, NULL, '0.00', '2550.00', 1, NULL, 1, 'KRq6u1LqS3iAHWQto2IePVTdCwVbr', 46, '2021-08-20 13:52:27', '2021-08-21 01:52:27', 5),
(47, 5, '1', 'default', 'pending', '1247.40', '59.40', '0.00', NULL, NULL, '0.00', '1188.00', 1, NULL, 1, 'OXOfv9hjXBHacd5jJ2k9g0yUDF24z', 47, '2021-08-20 15:52:27', '2021-08-21 01:52:27', 2),
(48, 5, '1', 'default', 'completed', '1188.60', '56.60', '0.00', NULL, NULL, '0.00', '1132.00', 1, NULL, 1, 'N38nCGjGBzUnCEosMnY4huTaqbRez', 48, '2021-08-20 17:52:27', '2021-08-21 01:52:33', 5),
(49, 5, '1', 'default', 'completed', '3741.70', '120.70', '0.00', NULL, NULL, '0.00', '3621.00', 1, NULL, 1, 'VAAvcHJpLN5iqylsE6Jyj7Qmnps2W', 49, '2021-08-20 13:52:27', '2021-08-21 01:52:34', 1),
(50, 5, '1', 'default', 'pending', '1509.90', '71.90', '0.00', NULL, NULL, '0.00', '1438.00', 1, NULL, 1, 'qn69qe7t6DhwdTTUoWvDJhhIhuSOL', 50, '2021-08-20 15:52:27', '2021-08-21 01:52:27', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ec_order_addresses`
--

CREATE TABLE `ec_order_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_order_addresses`
--

INSERT INTO `ec_order_addresses` (`id`, `name`, `phone`, `email`, `country`, `state`, `city`, `address`, `order_id`, `zip_code`) VALUES
(1, 'Dr. Keyshawn Heaney', '+13608514467', 'violet64@example.net', 'MU', 'Nebraska', 'Randalview', '12265 Stehr Forges', 1, '65316-8855'),
(2, 'Dr. Keyshawn Heaney', '+13608514467', 'violet64@example.net', 'MU', 'Nebraska', 'Randalview', '12265 Stehr Forges', 2, '65316-8855'),
(3, 'Sabina Beatty', '+12626164118', 'icarter@example.org', 'BM', 'Iowa', 'Port Paigemouth', '4294 Dooley Court Apt. 670', 3, '36128-9963'),
(4, 'Sabina Beatty', '+12626164118', 'icarter@example.org', 'BM', 'Iowa', 'Port Paigemouth', '4294 Dooley Court Apt. 670', 4, '36128-9963'),
(5, 'Sabina Beatty', '+12626164118', 'icarter@example.org', 'BM', 'Iowa', 'Port Paigemouth', '4294 Dooley Court Apt. 670', 5, '36128-9963'),
(6, 'Kim Welch', '+15850500037', 'ukerluke@example.net', 'LK', 'Iowa', 'Ashleetown', '42403 Fidel Road', 6, '99346-2735'),
(7, 'Kim Welch', '+15850500037', 'ukerluke@example.net', 'LK', 'Iowa', 'Ashleetown', '42403 Fidel Road', 7, '99346-2735'),
(8, 'Kim Welch', '+15850500037', 'ukerluke@example.net', 'LK', 'Iowa', 'Ashleetown', '42403 Fidel Road', 8, '99346-2735'),
(9, 'Kim Welch', '+15850500037', 'ukerluke@example.net', 'LK', 'Iowa', 'Ashleetown', '42403 Fidel Road', 9, '99346-2735'),
(10, 'Kim Welch', '+15850500037', 'ukerluke@example.net', 'LK', 'Iowa', 'Ashleetown', '42403 Fidel Road', 10, '99346-2735'),
(11, 'Kim Welch', '+15850500037', 'ukerluke@example.net', 'LK', 'Iowa', 'Ashleetown', '42403 Fidel Road', 11, '99346-2735'),
(12, 'Kim Welch', '+15850500037', 'ukerluke@example.net', 'LK', 'Iowa', 'Ashleetown', '42403 Fidel Road', 12, '99346-2735'),
(13, 'Ian Conroy', '+15032700992', 'customer@botble.com', 'GN', 'Kansas', 'Hayesmouth', '52718 Taylor Roads Suite 863', 13, '52534-6724'),
(14, 'Ian Conroy', '+15032700992', 'customer@botble.com', 'GN', 'Kansas', 'Hayesmouth', '52718 Taylor Roads Suite 863', 14, '52534-6724'),
(15, 'Sabina Beatty', '+12626164118', 'icarter@example.org', 'BM', 'Iowa', 'Port Paigemouth', '4294 Dooley Court Apt. 670', 15, '36128-9963'),
(16, 'Sabina Beatty', '+12626164118', 'icarter@example.org', 'BM', 'Iowa', 'Port Paigemouth', '4294 Dooley Court Apt. 670', 16, '36128-9963'),
(17, 'Ian Conroy', '+15032700992', 'customer@botble.com', 'GN', 'Kansas', 'Hayesmouth', '52718 Taylor Roads Suite 863', 17, '52534-6724'),
(18, 'Ian Conroy', '+15032700992', 'customer@botble.com', 'GN', 'Kansas', 'Hayesmouth', '52718 Taylor Roads Suite 863', 18, '52534-6724'),
(19, 'Ian Conroy', '+15032700992', 'customer@botble.com', 'GN', 'Kansas', 'Hayesmouth', '52718 Taylor Roads Suite 863', 19, '52534-6724'),
(20, 'Ian Conroy', '+15032700992', 'customer@botble.com', 'GN', 'Kansas', 'Hayesmouth', '52718 Taylor Roads Suite 863', 20, '52534-6724'),
(21, 'Ian Conroy', '+15032700992', 'customer@botble.com', 'GN', 'Kansas', 'Hayesmouth', '52718 Taylor Roads Suite 863', 21, '52534-6724'),
(22, 'Ian Conroy', '+15032700992', 'customer@botble.com', 'GN', 'Kansas', 'Hayesmouth', '52718 Taylor Roads Suite 863', 22, '52534-6724'),
(23, 'Ian Conroy', '+15032700992', 'customer@botble.com', 'GN', 'Kansas', 'Hayesmouth', '52718 Taylor Roads Suite 863', 23, '52534-6724'),
(24, 'Ian Conroy', '+15032700992', 'customer@botble.com', 'GN', 'Kansas', 'Hayesmouth', '52718 Taylor Roads Suite 863', 24, '52534-6724'),
(25, 'Ian Conroy', '+15032700992', 'customer@botble.com', 'GN', 'Kansas', 'Hayesmouth', '52718 Taylor Roads Suite 863', 25, '52534-6724'),
(26, 'Ian Conroy', '+15032700992', 'customer@botble.com', 'GN', 'Kansas', 'Hayesmouth', '52718 Taylor Roads Suite 863', 26, '52534-6724'),
(27, 'Ian Conroy', '+15032700992', 'customer@botble.com', 'GN', 'Kansas', 'Hayesmouth', '52718 Taylor Roads Suite 863', 27, '52534-6724'),
(28, 'Sabina Beatty', '+12626164118', 'icarter@example.org', 'BM', 'Iowa', 'Port Paigemouth', '4294 Dooley Court Apt. 670', 28, '36128-9963'),
(29, 'Sabina Beatty', '+12626164118', 'icarter@example.org', 'BM', 'Iowa', 'Port Paigemouth', '4294 Dooley Court Apt. 670', 29, '36128-9963'),
(30, 'Sabina Beatty', '+12626164118', 'icarter@example.org', 'BM', 'Iowa', 'Port Paigemouth', '4294 Dooley Court Apt. 670', 30, '36128-9963'),
(31, 'Ian Conroy', '+15032700992', 'customer@botble.com', 'GN', 'Kansas', 'Hayesmouth', '52718 Taylor Roads Suite 863', 31, '52534-6724'),
(32, 'Ian Conroy', '+15032700992', 'customer@botble.com', 'GN', 'Kansas', 'Hayesmouth', '52718 Taylor Roads Suite 863', 32, '52534-6724'),
(33, 'Ian Conroy', '+15032700992', 'customer@botble.com', 'GN', 'Kansas', 'Hayesmouth', '52718 Taylor Roads Suite 863', 33, '52534-6724'),
(34, 'Sabina Beatty', '+12626164118', 'icarter@example.org', 'BM', 'Iowa', 'Port Paigemouth', '4294 Dooley Court Apt. 670', 34, '36128-9963'),
(35, 'Sabina Beatty', '+12626164118', 'icarter@example.org', 'BM', 'Iowa', 'Port Paigemouth', '4294 Dooley Court Apt. 670', 35, '36128-9963'),
(36, 'Sabina Beatty', '+12626164118', 'icarter@example.org', 'BM', 'Iowa', 'Port Paigemouth', '4294 Dooley Court Apt. 670', 36, '36128-9963'),
(37, 'Sabina Beatty', '+12626164118', 'icarter@example.org', 'BM', 'Iowa', 'Port Paigemouth', '4294 Dooley Court Apt. 670', 37, '36128-9963'),
(38, 'Ian Conroy', '+15032700992', 'customer@botble.com', 'GN', 'Kansas', 'Hayesmouth', '52718 Taylor Roads Suite 863', 38, '52534-6724'),
(39, 'Ian Conroy', '+15032700992', 'customer@botble.com', 'GN', 'Kansas', 'Hayesmouth', '52718 Taylor Roads Suite 863', 39, '52534-6724'),
(40, 'Arjun Rempel', '+13079764932', 'arnulfo15@example.org', 'PY', 'Connecticut', 'North Paxton', '293 Crooks Prairie', 40, '57654'),
(41, 'Ian Conroy', '+15032700992', 'customer@botble.com', 'GN', 'Kansas', 'Hayesmouth', '52718 Taylor Roads Suite 863', 41, '52534-6724'),
(42, 'Ian Conroy', '+15032700992', 'customer@botble.com', 'GN', 'Kansas', 'Hayesmouth', '52718 Taylor Roads Suite 863', 42, '52534-6724'),
(43, 'Sabina Beatty', '+12626164118', 'icarter@example.org', 'BM', 'Iowa', 'Port Paigemouth', '4294 Dooley Court Apt. 670', 43, '36128-9963'),
(44, 'Sabina Beatty', '+12626164118', 'icarter@example.org', 'BM', 'Iowa', 'Port Paigemouth', '4294 Dooley Court Apt. 670', 44, '36128-9963'),
(45, 'Sabina Beatty', '+12626164118', 'icarter@example.org', 'BM', 'Iowa', 'Port Paigemouth', '4294 Dooley Court Apt. 670', 45, '36128-9963'),
(46, 'Sabina Beatty', '+12626164118', 'icarter@example.org', 'BM', 'Iowa', 'Port Paigemouth', '4294 Dooley Court Apt. 670', 46, '36128-9963'),
(47, 'Sabina Beatty', '+12626164118', 'icarter@example.org', 'BM', 'Iowa', 'Port Paigemouth', '4294 Dooley Court Apt. 670', 47, '36128-9963'),
(48, 'Sabina Beatty', '+12626164118', 'icarter@example.org', 'BM', 'Iowa', 'Port Paigemouth', '4294 Dooley Court Apt. 670', 48, '36128-9963'),
(49, 'Sabina Beatty', '+12626164118', 'icarter@example.org', 'BM', 'Iowa', 'Port Paigemouth', '4294 Dooley Court Apt. 670', 49, '36128-9963'),
(50, 'Sabina Beatty', '+12626164118', 'icarter@example.org', 'BM', 'Iowa', 'Port Paigemouth', '4294 Dooley Court Apt. 670', 50, '36128-9963');

-- --------------------------------------------------------

--
-- Table structure for table `ec_order_histories`
--

CREATE TABLE `ec_order_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `extras` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_order_histories`
--

INSERT INTO `ec_order_histories` (`id`, `action`, `description`, `user_id`, `order_id`, `extras`, `created_at`, `updated_at`) VALUES
(1, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 1, NULL, '2021-08-12 17:52:26', '2021-08-12 17:52:26'),
(2, 'confirm_order', 'Order was verified by %user_name%', 0, 1, NULL, '2021-08-12 17:52:26', '2021-08-12 17:52:26'),
(3, 'confirm_payment', 'Payment was confirmed (amount $1,754.60) by %user_name%', 0, 1, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(4, 'create_shipment', 'Created shipment for order', 0, 1, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(5, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 2, NULL, '2021-08-07 17:52:26', '2021-08-07 17:52:26'),
(6, 'confirm_order', 'Order was verified by %user_name%', 0, 2, NULL, '2021-08-07 17:52:26', '2021-08-07 17:52:26'),
(7, 'confirm_payment', 'Payment was confirmed (amount $2,483.10) by %user_name%', 0, 2, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(8, 'create_shipment', 'Created shipment for order', 0, 2, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(9, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 3, NULL, '2021-08-14 17:52:26', '2021-08-14 17:52:26'),
(10, 'confirm_order', 'Order was verified by %user_name%', 0, 3, NULL, '2021-08-14 17:52:26', '2021-08-14 17:52:26'),
(11, 'confirm_payment', 'Payment was confirmed (amount $248.78) by %user_name%', 0, 3, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(12, 'create_shipment', 'Created shipment for order', 0, 3, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(13, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 3, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(14, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 4, NULL, '2021-08-08 09:52:26', '2021-08-08 09:52:26'),
(15, 'confirm_order', 'Order was verified by %user_name%', 0, 4, NULL, '2021-08-08 09:52:26', '2021-08-08 09:52:26'),
(16, 'create_shipment', 'Created shipment for order', 0, 4, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(17, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 4, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(18, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 5, NULL, '2021-08-11 13:52:26', '2021-08-11 13:52:26'),
(19, 'confirm_order', 'Order was verified by %user_name%', 0, 5, NULL, '2021-08-11 13:52:26', '2021-08-11 13:52:26'),
(20, 'confirm_payment', 'Payment was confirmed (amount $578.60) by %user_name%', 0, 5, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(21, 'create_shipment', 'Created shipment for order', 0, 5, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(22, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 6, NULL, '2021-08-19 13:52:26', '2021-08-19 13:52:26'),
(23, 'confirm_order', 'Order was verified by %user_name%', 0, 6, NULL, '2021-08-19 13:52:26', '2021-08-19 13:52:26'),
(24, 'create_shipment', 'Created shipment for order', 0, 6, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(25, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 7, NULL, '2021-08-12 01:52:26', '2021-08-12 01:52:26'),
(26, 'confirm_order', 'Order was verified by %user_name%', 0, 7, NULL, '2021-08-12 01:52:26', '2021-08-12 01:52:26'),
(27, 'confirm_payment', 'Payment was confirmed (amount $622.60) by %user_name%', 0, 7, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(28, 'create_shipment', 'Created shipment for order', 0, 7, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(29, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 7, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(30, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 8, NULL, '2021-08-19 13:52:26', '2021-08-19 13:52:26'),
(31, 'confirm_order', 'Order was verified by %user_name%', 0, 8, NULL, '2021-08-19 13:52:26', '2021-08-19 13:52:26'),
(32, 'confirm_payment', 'Payment was confirmed (amount $2,483.10) by %user_name%', 0, 8, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(33, 'create_shipment', 'Created shipment for order', 0, 8, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(34, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 9, NULL, '2021-08-09 17:52:26', '2021-08-09 17:52:26'),
(35, 'confirm_order', 'Order was verified by %user_name%', 0, 9, NULL, '2021-08-09 17:52:26', '2021-08-09 17:52:26'),
(36, 'confirm_payment', 'Payment was confirmed (amount $1,608.90) by %user_name%', 0, 9, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(37, 'create_shipment', 'Created shipment for order', 0, 9, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(38, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 10, NULL, '2021-08-18 05:52:26', '2021-08-18 05:52:26'),
(39, 'confirm_order', 'Order was verified by %user_name%', 0, 10, NULL, '2021-08-18 05:52:26', '2021-08-18 05:52:26'),
(40, 'confirm_payment', 'Payment was confirmed (amount $3,952.50) by %user_name%', 0, 10, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(41, 'create_shipment', 'Created shipment for order', 0, 10, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(42, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 10, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(43, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 11, NULL, '2021-08-13 23:52:26', '2021-08-13 23:52:26'),
(44, 'confirm_order', 'Order was verified by %user_name%', 0, 11, NULL, '2021-08-13 23:52:26', '2021-08-13 23:52:26'),
(45, 'confirm_payment', 'Payment was confirmed (amount $1,173.90) by %user_name%', 0, 11, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(46, 'create_shipment', 'Created shipment for order', 0, 11, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(47, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 12, NULL, '2021-08-09 17:52:26', '2021-08-09 17:52:26'),
(48, 'confirm_order', 'Order was verified by %user_name%', 0, 12, NULL, '2021-08-09 17:52:26', '2021-08-09 17:52:26'),
(49, 'confirm_payment', 'Payment was confirmed (amount $1,639.90) by %user_name%', 0, 12, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(50, 'create_shipment', 'Created shipment for order', 0, 12, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(51, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 12, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(52, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 13, NULL, '2021-08-14 09:52:26', '2021-08-14 09:52:26'),
(53, 'confirm_order', 'Order was verified by %user_name%', 0, 13, NULL, '2021-08-14 09:52:26', '2021-08-14 09:52:26'),
(54, 'confirm_payment', 'Payment was confirmed (amount $4,380.30) by %user_name%', 0, 13, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(55, 'create_shipment', 'Created shipment for order', 0, 13, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(56, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 13, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(57, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 14, NULL, '2021-08-19 17:52:26', '2021-08-19 17:52:26'),
(58, 'confirm_order', 'Order was verified by %user_name%', 0, 14, NULL, '2021-08-19 17:52:26', '2021-08-19 17:52:26'),
(59, 'confirm_payment', 'Payment was confirmed (amount $1,630.60) by %user_name%', 0, 14, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(60, 'create_shipment', 'Created shipment for order', 0, 14, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(61, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 15, NULL, '2021-08-13 13:52:26', '2021-08-13 13:52:26'),
(62, 'confirm_order', 'Order was verified by %user_name%', 0, 15, NULL, '2021-08-13 13:52:26', '2021-08-13 13:52:26'),
(63, 'confirm_payment', 'Payment was confirmed (amount $1,793.40) by %user_name%', 0, 15, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(64, 'create_shipment', 'Created shipment for order', 0, 15, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(65, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 16, NULL, '2021-08-17 07:52:26', '2021-08-17 07:52:26'),
(66, 'confirm_order', 'Order was verified by %user_name%', 0, 16, NULL, '2021-08-17 07:52:26', '2021-08-17 07:52:26'),
(67, 'create_shipment', 'Created shipment for order', 0, 16, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(68, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 16, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(69, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 17, NULL, '2021-08-17 13:52:26', '2021-08-17 13:52:26'),
(70, 'confirm_order', 'Order was verified by %user_name%', 0, 17, NULL, '2021-08-17 13:52:26', '2021-08-17 13:52:26'),
(71, 'confirm_payment', 'Payment was confirmed (amount $614.90) by %user_name%', 0, 17, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(72, 'create_shipment', 'Created shipment for order', 0, 17, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(73, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 17, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(74, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 18, NULL, '2021-08-14 01:52:26', '2021-08-14 01:52:26'),
(75, 'confirm_order', 'Order was verified by %user_name%', 0, 18, NULL, '2021-08-14 01:52:26', '2021-08-14 01:52:26'),
(76, 'create_shipment', 'Created shipment for order', 0, 18, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(77, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 18, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(78, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 19, NULL, '2021-08-11 07:52:26', '2021-08-11 07:52:26'),
(79, 'confirm_order', 'Order was verified by %user_name%', 0, 19, NULL, '2021-08-11 07:52:26', '2021-08-11 07:52:26'),
(80, 'confirm_payment', 'Payment was confirmed (amount $248.78) by %user_name%', 0, 19, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(81, 'create_shipment', 'Created shipment for order', 0, 19, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(82, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 20, NULL, '2021-08-10 05:52:26', '2021-08-10 05:52:26'),
(83, 'confirm_order', 'Order was verified by %user_name%', 0, 20, NULL, '2021-08-10 05:52:26', '2021-08-10 05:52:26'),
(84, 'confirm_payment', 'Payment was confirmed (amount $790.90) by %user_name%', 0, 20, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(85, 'create_shipment', 'Created shipment for order', 0, 20, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(86, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 21, NULL, '2021-08-11 01:52:26', '2021-08-11 01:52:26'),
(87, 'confirm_order', 'Order was verified by %user_name%', 0, 21, NULL, '2021-08-11 01:52:26', '2021-08-11 01:52:26'),
(88, 'confirm_payment', 'Payment was confirmed (amount $2,647.40) by %user_name%', 0, 21, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(89, 'create_shipment', 'Created shipment for order', 0, 21, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(90, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 22, NULL, '2021-08-20 01:52:26', '2021-08-20 01:52:26'),
(91, 'confirm_order', 'Order was verified by %user_name%', 0, 22, NULL, '2021-08-20 01:52:26', '2021-08-20 01:52:26'),
(92, 'confirm_payment', 'Payment was confirmed (amount $2,427.60) by %user_name%', 0, 22, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(93, 'create_shipment', 'Created shipment for order', 0, 22, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(94, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 23, NULL, '2021-08-15 01:52:26', '2021-08-15 01:52:26'),
(95, 'confirm_order', 'Order was verified by %user_name%', 0, 23, NULL, '2021-08-15 01:52:26', '2021-08-15 01:52:26'),
(96, 'confirm_payment', 'Payment was confirmed (amount $790.90) by %user_name%', 0, 23, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(97, 'create_shipment', 'Created shipment for order', 0, 23, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(98, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 23, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(99, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 24, NULL, '2021-08-14 15:52:26', '2021-08-14 15:52:26'),
(100, 'confirm_order', 'Order was verified by %user_name%', 0, 24, NULL, '2021-08-14 15:52:26', '2021-08-14 15:52:26'),
(101, 'create_shipment', 'Created shipment for order', 0, 24, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(102, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 24, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(103, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 25, NULL, '2021-08-16 11:52:26', '2021-08-16 11:52:26'),
(104, 'confirm_order', 'Order was verified by %user_name%', 0, 25, NULL, '2021-08-16 11:52:26', '2021-08-16 11:52:26'),
(105, 'confirm_payment', 'Payment was confirmed (amount $1,188.60) by %user_name%', 0, 25, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(106, 'create_shipment', 'Created shipment for order', 0, 25, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(107, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 26, NULL, '2021-08-13 13:52:26', '2021-08-13 13:52:26'),
(108, 'confirm_order', 'Order was verified by %user_name%', 0, 26, NULL, '2021-08-13 13:52:26', '2021-08-13 13:52:26'),
(109, 'confirm_payment', 'Payment was confirmed (amount $4,216.00) by %user_name%', 0, 26, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(110, 'create_shipment', 'Created shipment for order', 0, 26, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(111, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 27, NULL, '2021-08-20 05:52:26', '2021-08-20 05:52:26'),
(112, 'confirm_order', 'Order was verified by %user_name%', 0, 27, NULL, '2021-08-20 05:52:26', '2021-08-20 05:52:26'),
(113, 'confirm_payment', 'Payment was confirmed (amount $511.50) by %user_name%', 0, 27, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(114, 'create_shipment', 'Created shipment for order', 0, 27, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(115, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 28, NULL, '2021-08-19 13:52:26', '2021-08-19 13:52:26'),
(116, 'confirm_order', 'Order was verified by %user_name%', 0, 28, NULL, '2021-08-19 13:52:26', '2021-08-19 13:52:26'),
(117, 'confirm_payment', 'Payment was confirmed (amount $42.00) by %user_name%', 0, 28, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(118, 'create_shipment', 'Created shipment for order', 0, 28, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(119, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 28, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(120, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 29, NULL, '2021-08-17 07:52:26', '2021-08-17 07:52:26'),
(121, 'confirm_order', 'Order was verified by %user_name%', 0, 29, NULL, '2021-08-17 07:52:26', '2021-08-17 07:52:26'),
(122, 'confirm_payment', 'Payment was confirmed (amount $1,089.90) by %user_name%', 0, 29, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(123, 'create_shipment', 'Created shipment for order', 0, 29, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(124, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 29, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(125, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 30, NULL, '2021-08-18 19:52:26', '2021-08-18 19:52:26'),
(126, 'confirm_order', 'Order was verified by %user_name%', 0, 30, NULL, '2021-08-18 19:52:26', '2021-08-18 19:52:26'),
(127, 'confirm_payment', 'Payment was confirmed (amount $1,720.50) by %user_name%', 0, 30, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(128, 'create_shipment', 'Created shipment for order', 0, 30, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(129, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 31, NULL, '2021-08-18 09:52:26', '2021-08-18 09:52:26'),
(130, 'confirm_order', 'Order was verified by %user_name%', 0, 31, NULL, '2021-08-18 09:52:26', '2021-08-18 09:52:26'),
(131, 'create_shipment', 'Created shipment for order', 0, 31, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(132, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 32, NULL, '2021-08-18 09:52:26', '2021-08-18 09:52:26'),
(133, 'confirm_order', 'Order was verified by %user_name%', 0, 32, NULL, '2021-08-18 09:52:26', '2021-08-18 09:52:26'),
(134, 'confirm_payment', 'Payment was confirmed (amount $2,647.40) by %user_name%', 0, 32, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(135, 'create_shipment', 'Created shipment for order', 0, 32, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(136, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 33, NULL, '2021-08-16 09:52:26', '2021-08-16 09:52:26'),
(137, 'confirm_order', 'Order was verified by %user_name%', 0, 33, NULL, '2021-08-16 09:52:26', '2021-08-16 09:52:26'),
(138, 'create_shipment', 'Created shipment for order', 0, 33, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(139, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 34, NULL, '2021-08-17 13:52:26', '2021-08-17 13:52:26'),
(140, 'confirm_order', 'Order was verified by %user_name%', 0, 34, NULL, '2021-08-17 13:52:26', '2021-08-17 13:52:26'),
(141, 'confirm_payment', 'Payment was confirmed (amount $487.30) by %user_name%', 0, 34, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(142, 'create_shipment', 'Created shipment for order', 0, 34, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(143, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 35, NULL, '2021-08-16 23:52:26', '2021-08-16 23:52:26'),
(144, 'confirm_order', 'Order was verified by %user_name%', 0, 35, NULL, '2021-08-16 23:52:26', '2021-08-16 23:52:26'),
(145, 'confirm_payment', 'Payment was confirmed (amount $633.60) by %user_name%', 0, 35, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(146, 'create_shipment', 'Created shipment for order', 0, 35, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(147, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 36, NULL, '2021-08-18 03:52:27', '2021-08-18 03:52:27'),
(148, 'confirm_order', 'Order was verified by %user_name%', 0, 36, NULL, '2021-08-18 03:52:27', '2021-08-18 03:52:27'),
(149, 'confirm_payment', 'Payment was confirmed (amount $1,247.40) by %user_name%', 0, 36, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(150, 'create_shipment', 'Created shipment for order', 0, 36, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(151, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 36, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(152, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 37, NULL, '2021-08-15 05:52:27', '2021-08-15 05:52:27'),
(153, 'confirm_order', 'Order was verified by %user_name%', 0, 37, NULL, '2021-08-15 05:52:27', '2021-08-15 05:52:27'),
(154, 'confirm_payment', 'Payment was confirmed (amount $622.60) by %user_name%', 0, 37, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(155, 'create_shipment', 'Created shipment for order', 0, 37, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(156, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 38, NULL, '2021-08-18 01:52:27', '2021-08-18 01:52:27'),
(157, 'confirm_order', 'Order was verified by %user_name%', 0, 38, NULL, '2021-08-18 01:52:27', '2021-08-18 01:52:27'),
(158, 'confirm_payment', 'Payment was confirmed (amount $2,293.20) by %user_name%', 0, 38, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(159, 'create_shipment', 'Created shipment for order', 0, 38, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(160, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 39, NULL, '2021-08-19 13:52:27', '2021-08-19 13:52:27'),
(161, 'confirm_order', 'Order was verified by %user_name%', 0, 39, NULL, '2021-08-19 13:52:27', '2021-08-19 13:52:27'),
(162, 'create_shipment', 'Created shipment for order', 0, 39, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(163, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 39, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(164, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 40, NULL, '2021-08-19 19:52:27', '2021-08-19 19:52:27'),
(165, 'confirm_order', 'Order was verified by %user_name%', 0, 40, NULL, '2021-08-19 19:52:27', '2021-08-19 19:52:27'),
(166, 'confirm_payment', 'Payment was confirmed (amount $1,592.80) by %user_name%', 0, 40, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(167, 'create_shipment', 'Created shipment for order', 0, 40, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(168, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 41, NULL, '2021-08-20 01:52:27', '2021-08-20 01:52:27'),
(169, 'confirm_order', 'Order was verified by %user_name%', 0, 41, NULL, '2021-08-20 01:52:27', '2021-08-20 01:52:27'),
(170, 'create_shipment', 'Created shipment for order', 0, 41, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(171, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 41, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(172, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 42, NULL, '2021-08-19 17:52:27', '2021-08-19 17:52:27'),
(173, 'confirm_order', 'Order was verified by %user_name%', 0, 42, NULL, '2021-08-19 17:52:27', '2021-08-19 17:52:27'),
(174, 'confirm_payment', 'Payment was confirmed (amount $1,327.70) by %user_name%', 0, 42, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(175, 'create_shipment', 'Created shipment for order', 0, 42, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(176, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 42, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(177, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 43, NULL, '2021-08-19 07:52:27', '2021-08-19 07:52:27'),
(178, 'confirm_order', 'Order was verified by %user_name%', 0, 43, NULL, '2021-08-19 07:52:27', '2021-08-19 07:52:27'),
(179, 'confirm_payment', 'Payment was confirmed (amount $248.78) by %user_name%', 0, 43, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(180, 'create_shipment', 'Created shipment for order', 0, 43, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(181, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 44, NULL, '2021-08-20 19:52:27', '2021-08-20 19:52:27'),
(182, 'confirm_order', 'Order was verified by %user_name%', 0, 44, NULL, '2021-08-20 19:52:27', '2021-08-20 19:52:27'),
(183, 'confirm_payment', 'Payment was confirmed (amount $3,730.50) by %user_name%', 0, 44, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(184, 'create_shipment', 'Created shipment for order', 0, 44, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(185, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 45, NULL, '2021-08-19 13:52:27', '2021-08-19 13:52:27'),
(186, 'confirm_order', 'Order was verified by %user_name%', 0, 45, NULL, '2021-08-19 13:52:27', '2021-08-19 13:52:27'),
(187, 'create_shipment', 'Created shipment for order', 0, 45, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(188, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 46, NULL, '2021-08-20 13:52:27', '2021-08-20 13:52:27'),
(189, 'confirm_order', 'Order was verified by %user_name%', 0, 46, NULL, '2021-08-20 13:52:27', '2021-08-20 13:52:27'),
(190, 'create_shipment', 'Created shipment for order', 0, 46, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(191, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 46, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(192, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 47, NULL, '2021-08-20 15:52:27', '2021-08-20 15:52:27'),
(193, 'confirm_order', 'Order was verified by %user_name%', 0, 47, NULL, '2021-08-20 15:52:27', '2021-08-20 15:52:27'),
(194, 'confirm_payment', 'Payment was confirmed (amount $1,247.40) by %user_name%', 0, 47, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(195, 'create_shipment', 'Created shipment for order', 0, 47, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(196, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 48, NULL, '2021-08-20 17:52:27', '2021-08-20 17:52:27'),
(197, 'confirm_order', 'Order was verified by %user_name%', 0, 48, NULL, '2021-08-20 17:52:27', '2021-08-20 17:52:27'),
(198, 'confirm_payment', 'Payment was confirmed (amount $1,188.60) by %user_name%', 0, 48, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(199, 'create_shipment', 'Created shipment for order', 0, 48, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(200, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 48, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(201, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 49, NULL, '2021-08-20 13:52:27', '2021-08-20 13:52:27'),
(202, 'confirm_order', 'Order was verified by %user_name%', 0, 49, NULL, '2021-08-20 13:52:27', '2021-08-20 13:52:27'),
(203, 'confirm_payment', 'Payment was confirmed (amount $3,741.70) by %user_name%', 0, 49, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(204, 'create_shipment', 'Created shipment for order', 0, 49, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(205, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 49, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(206, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 50, NULL, '2021-08-20 15:52:27', '2021-08-20 15:52:27'),
(207, 'confirm_order', 'Order was verified by %user_name%', 0, 50, NULL, '2021-08-20 15:52:27', '2021-08-20 15:52:27'),
(208, 'create_shipment', 'Created shipment for order', 0, 50, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(209, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 50, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(210, 'update_status', 'Order confirmed by %user_name%', 0, 3, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(211, 'update_status', 'Order confirmed by %user_name%', 0, 7, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(212, 'update_status', 'Order confirmed by %user_name%', 0, 10, NULL, '2021-08-21 01:52:28', '2021-08-21 01:52:28'),
(213, 'update_status', 'Order confirmed by %user_name%', 0, 12, NULL, '2021-08-21 01:52:29', '2021-08-21 01:52:29'),
(214, 'update_status', 'Order confirmed by %user_name%', 0, 13, NULL, '2021-08-21 01:52:29', '2021-08-21 01:52:29'),
(215, 'update_status', 'Order confirmed by %user_name%', 0, 17, NULL, '2021-08-21 01:52:30', '2021-08-21 01:52:30'),
(216, 'update_status', 'Order confirmed by %user_name%', 0, 23, NULL, '2021-08-21 01:52:30', '2021-08-21 01:52:30'),
(217, 'update_status', 'Order confirmed by %user_name%', 0, 28, NULL, '2021-08-21 01:52:31', '2021-08-21 01:52:31'),
(218, 'update_status', 'Order confirmed by %user_name%', 0, 29, NULL, '2021-08-21 01:52:32', '2021-08-21 01:52:32'),
(219, 'update_status', 'Order confirmed by %user_name%', 0, 36, NULL, '2021-08-21 01:52:32', '2021-08-21 01:52:32'),
(220, 'update_status', 'Order confirmed by %user_name%', 0, 42, NULL, '2021-08-21 01:52:33', '2021-08-21 01:52:33'),
(221, 'update_status', 'Order confirmed by %user_name%', 0, 48, NULL, '2021-08-21 01:52:33', '2021-08-21 01:52:33'),
(222, 'update_status', 'Order confirmed by %user_name%', 0, 49, NULL, '2021-08-21 01:52:34', '2021-08-21 01:52:34');

-- --------------------------------------------------------

--
-- Table structure for table `ec_order_product`
--

CREATE TABLE `ec_order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` double(8,2) DEFAULT '0.00',
  `restock_quantity` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_order_product`
--

INSERT INTO `ec_order_product` (`id`, `order_id`, `qty`, `price`, `tax_amount`, `options`, `product_id`, `product_name`, `weight`, `restock_quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '566.00', '56.60', '[]', 69, 'Samsung Gear VR Virtual Reality Headset', 2316.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(2, 2, 3, '801.00', '80.10', '[]', 82, 'MVMTH Classical Leather Watch In Black', 1563.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(3, 3, 3, '80.25', '8.03', '[]', 28, 'Dual Camera 20MP', 2679.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(4, 4, 2, '854.00', '85.40', '[]', 39, 'Smart Watch External', 1586.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(5, 4, 2, '559.00', '55.90', '[]', 60, 'B&O Play Mini Bluetooth Speaker', 1404.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(6, 5, 1, '526.00', '52.60', '[]', 68, 'Apple MacBook Air Retina 12-Inch Laptop', 603.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(7, 6, 2, '519.00', '51.90', '[]', 34, 'Red & Black Headphone', 1616.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(8, 6, 3, '526.00', '52.60', '[]', 67, 'Apple MacBook Air Retina 12-Inch Laptop', 1809.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(9, 7, 1, '566.00', '56.60', '[]', 69, 'Samsung Gear VR Virtual Reality Headset', 772.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(10, 8, 3, '801.00', '80.10', '[]', 82, 'MVMTH Classical Leather Watch In Black', 1563.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(11, 9, 3, '519.00', '51.90', '[]', 34, 'Red & Black Headphone', 2424.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(12, 10, 3, '1275.00', '127.50', '[]', 56, 'Xbox One Wireless Controller Black Color', 2226.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(13, 11, 2, '559.00', '55.90', '[]', 62, 'B&O Play Mini Bluetooth Speaker', 1404.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(14, 12, 3, '529.00', '52.90', '[]', 63, 'Apple MacBook Air Retina 13.3-Inch Laptop', 2367.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(15, 13, 3, '854.00', '85.40', '[]', 38, 'Smart Watch External', 2379.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(16, 13, 3, '559.00', '55.90', '[]', 60, 'B&O Play Mini Bluetooth Speaker', 2106.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(17, 14, 3, '526.00', '52.60', '[]', 68, 'Apple MacBook Air Retina 12-Inch Laptop', 1809.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(18, 15, 2, '854.00', '85.40', '[]', 38, 'Smart Watch External', 1586.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(19, 16, 2, '1275.00', '127.50', '[]', 56, 'Xbox One Wireless Controller Black Color', 1484.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(20, 17, 1, '559.00', '55.90', '[]', 62, 'B&O Play Mini Bluetooth Speaker', 702.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(21, 18, 3, '1207.00', '120.70', '[]', 73, 'Aveeno Moisturizing Body Shower 450ml', 1602.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(22, 19, 3, '80.25', '8.03', '[]', 26, 'Dual Camera 20MP', 2679.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(23, 20, 1, '719.00', '71.90', '[]', 77, 'NYX Beauty Couton Pallete Makeup 12', 663.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(24, 21, 3, '854.00', '85.40', '[]', 39, 'Smart Watch External', 2379.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(25, 22, 2, '590.00', '59.00', '[]', 50, 'Samsung Smart Phone', 1436.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(26, 22, 2, '566.00', '56.60', '[]', 70, 'Samsung Gear VR Virtual Reality Headset', 1544.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(27, 23, 1, '719.00', '71.90', '[]', 76, 'NYX Beauty Couton Pallete Makeup 12', 663.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(28, 24, 1, '40.50', '4.05', '[]', 29, 'Smart Watches', 847.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(29, 25, 2, '566.00', '56.60', '[]', 69, 'Samsung Gear VR Virtual Reality Headset', 1544.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(30, 26, 3, '559.00', '55.90', '[]', 60, 'B&O Play Mini Bluetooth Speaker', 2106.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(31, 26, 3, '801.00', '80.10', '[]', 80, 'MVMTH Classical Leather Watch In Black', 1563.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(32, 27, 1, '465.00', '46.50', '[]', 83, 'Baxter Care Hair Kit For Bearded Mens', 533.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(33, 28, 2, '20.00', '2.00', '[]', 32, 'Beat Headphone', 1066.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(34, 29, 2, '519.00', '51.90', '[]', 34, 'Red & Black Headphone', 1616.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(35, 30, 3, '555.00', '55.50', '[]', 44, 'Audio Equipment', 2355.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(36, 31, 2, '40.50', '4.05', '[]', 29, 'Smart Watches', 1694.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(37, 31, 2, '40.50', '4.05', '[]', 30, 'Smart Watches', 1694.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(38, 32, 3, '854.00', '85.40', '[]', 38, 'Smart Watch External', 2379.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(39, 33, 1, '590.00', '59.00', '[]', 49, 'Samsung Smart Phone', 718.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(40, 34, 1, '443.00', '44.30', '[]', 42, 'Nikon HD camera', 567.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(41, 35, 1, '576.00', '57.60', '[]', 57, 'EPSION Plaster Printer', 590.00, 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(42, 36, 2, '594.00', '59.40', '[]', 59, 'Sound Intone I65 Earphone White Version', 1044.00, 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(43, 37, 1, '566.00', '56.60', '[]', 71, 'Samsung Gear VR Virtual Reality Headset', 772.00, 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(44, 38, 2, '443.00', '44.30', '[]', 42, 'Nikon HD camera', 1134.00, 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(45, 38, 1, '1239.00', '123.90', '[]', 85, 'Ciate Palemore Lipstick Bold Red Color', 567.00, 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(46, 39, 2, '566.00', '56.60', '[]', 69, 'Samsung Gear VR Virtual Reality Headset', 1544.00, 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(47, 40, 1, '854.00', '85.40', '[]', 39, 'Smart Watch External', 793.00, 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(48, 40, 1, '594.00', '59.40', '[]', 58, 'Sound Intone I65 Earphone White Version', 522.00, 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(49, 41, 2, '854.00', '85.40', '[]', 38, 'Smart Watch External', 1586.00, 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(50, 42, 1, '1207.00', '120.70', '[]', 73, 'Aveeno Moisturizing Body Shower 450ml', 534.00, 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(51, 43, 3, '80.25', '8.03', '[]', 26, 'Dual Camera 20MP', 2679.00, 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(52, 44, 2, '594.00', '59.40', '[]', 59, 'Sound Intone I65 Earphone White Version', 1044.00, 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(53, 44, 3, '801.00', '80.10', '[]', 82, 'MVMTH Classical Leather Watch In Black', 1563.00, 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(54, 45, 2, '80.25', '8.03', '[]', 26, 'Dual Camera 20MP', 1786.00, 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(55, 46, 2, '1275.00', '127.50', '[]', 56, 'Xbox One Wireless Controller Black Color', 1484.00, 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(56, 47, 2, '594.00', '59.40', '[]', 59, 'Sound Intone I65 Earphone White Version', 1044.00, 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(57, 48, 2, '566.00', '56.60', '[]', 70, 'Samsung Gear VR Virtual Reality Headset', 1544.00, 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(58, 49, 3, '1207.00', '120.70', '[]', 72, 'Aveeno Moisturizing Body Shower 450ml', 1602.00, 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(59, 50, 2, '719.00', '71.90', '[]', 78, 'NYX Beauty Couton Pallete Makeup 12', 1326.00, 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27');

-- --------------------------------------------------------

--
-- Table structure for table `ec_products`
--

CREATE TABLE `ec_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `images` text COLLATE utf8mb4_unicode_ci,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `allow_checkout_when_out_of_stock` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `with_storehouse_management` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `is_variation` tinyint(4) NOT NULL DEFAULT '0',
  `is_searchable` tinyint(4) NOT NULL DEFAULT '0',
  `is_show_on_list` tinyint(4) NOT NULL DEFAULT '0',
  `sale_type` tinyint(4) NOT NULL DEFAULT '0',
  `price` double UNSIGNED DEFAULT NULL,
  `sale_price` double UNSIGNED DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `length` double(8,2) DEFAULT NULL,
  `wide` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `weight` double(8,2) DEFAULT NULL,
  `barcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `length_unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wide_unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height_unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight_unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `views` bigint(20) NOT NULL DEFAULT '0',
  `stock_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'in_stock',
  `store_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_products`
--

INSERT INTO `ec_products` (`id`, `name`, `description`, `content`, `status`, `images`, `sku`, `order`, `quantity`, `allow_checkout_when_out_of_stock`, `with_storehouse_management`, `is_featured`, `options`, `category_id`, `brand_id`, `is_variation`, `is_searchable`, `is_show_on_list`, `sale_type`, `price`, `sale_price`, `start_date`, `end_date`, `length`, `wide`, `height`, `weight`, `barcode`, `length_unit`, `wide_unit`, `height_unit`, `weight_unit`, `created_at`, `updated_at`, `tax_id`, `views`, `stock_status`, `store_id`) VALUES
(1, 'Dual Camera 20MP', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/1.jpg\"]', 'SW-148-A0', 0, 12, 0, 1, 1, NULL, NULL, 4, 0, 0, 0, 0, 80.25, NULL, NULL, NULL, 16.00, 13.00, 11.00, 893.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:25', 1, 81779, 'in_stock', 1),
(2, 'Smart Watches', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/2.jpg\",\"products\\/2-1.jpg\",\"products\\/2-2.jpg\",\"products\\/2-3.jpg\"]', 'SW-164-A0', 0, 14, 0, 1, 1, NULL, NULL, 5, 0, 0, 0, 0, 40.5, NULL, NULL, NULL, 16.00, 11.00, 13.00, 847.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:25', 1, 195341, 'in_stock', 1),
(3, 'Beat Headphone', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/3.jpg\"]', 'SW-110-A0', 0, 19, 0, 1, 1, NULL, NULL, 7, 0, 0, 0, 0, 20, NULL, NULL, NULL, 16.00, 15.00, 15.00, 533.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:25', 1, 113073, 'in_stock', 1),
(4, 'Red & Black Headphone', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/4.jpg\",\"products\\/4-1.jpg\",\"products\\/4-2.jpg\",\"products\\/4-3.jpg\"]', 'SW-113-A0', 0, 17, 0, 1, 1, NULL, NULL, 2, 0, 0, 0, 0, 519, 373.68, NULL, NULL, 10.00, 15.00, 19.00, 808.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:25', 1, 5817, 'in_stock', 4),
(5, 'Smart Watch External', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/5.jpg\",\"products\\/5-1.jpg\",\"products\\/5-2.jpg\",\"products\\/5-3.jpg\"]', 'SW-145-A0', 0, 19, 0, 1, 1, NULL, NULL, 7, 0, 0, 0, 0, 854, NULL, NULL, NULL, 12.00, 10.00, 13.00, 793.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:25', 1, 105021, 'in_stock', 2),
(6, 'Nikon HD camera', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/6.jpg\"]', 'SW-153-A0', 0, 12, 0, 1, 1, NULL, NULL, 6, 0, 0, 0, 0, 443, NULL, NULL, NULL, 12.00, 11.00, 13.00, 567.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:25', 1, 182335, 'in_stock', 3),
(7, 'Audio Equipment', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/7.jpg\"]', 'SW-153-A0', 0, 12, 0, 1, 1, NULL, NULL, 5, 0, 0, 0, 0, 555, NULL, NULL, NULL, 20.00, 19.00, 11.00, 785.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:25', 1, 65710, 'in_stock', 2),
(8, 'Smart Televisions', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/8.jpg\",\"products\\/8-1.jpg\",\"products\\/8-2.jpg\",\"products\\/8-3.jpg\"]', 'SW-144-A0', 0, 17, 0, 1, 1, NULL, NULL, 7, 0, 0, 0, 0, 1137, 955.08, NULL, NULL, 15.00, 16.00, 17.00, 852.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:25', 1, 101241, 'in_stock', 4),
(9, 'Samsung Smart Phone', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/9.jpg\",\"products\\/9-1.jpg\",\"products\\/9-2.jpg\"]', 'SW-137-A0', 0, 18, 0, 1, 1, NULL, NULL, 1, 0, 0, 0, 0, 590, NULL, NULL, NULL, 10.00, 13.00, 18.00, 718.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:25', 1, 140874, 'in_stock', 5),
(10, 'Herschel Leather Duffle Bag In Brown Color', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/10.jpg\",\"products\\/10-1.jpg\",\"products\\/10-2.jpg\"]', 'SW-131-A0', 0, 17, 0, 1, 0, NULL, NULL, 5, 0, 0, 0, 0, 1300, NULL, NULL, NULL, 15.00, 19.00, 10.00, 625.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:25', 1, 186443, 'in_stock', 5),
(11, 'Xbox One Wireless Controller Black Color', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/11.jpg\",\"products\\/11-1.jpg\",\"products\\/11-2.jpg\",\"products\\/11-3.jpg\"]', 'SW-153-A0', 0, 17, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 0, 1275, NULL, NULL, NULL, 17.00, 18.00, 19.00, 742.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:25', 1, 191835, 'in_stock', 5),
(12, 'EPSION Plaster Printer', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/12.jpg\",\"products\\/12-1.jpg\",\"products\\/12-2.jpg\",\"products\\/12-3.jpg\"]', 'SW-149-A0', 0, 15, 0, 1, 0, NULL, NULL, 7, 0, 0, 0, 0, 576, 432, NULL, NULL, 19.00, 18.00, 20.00, 590.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:25', 1, 71746, 'in_stock', 1),
(13, 'Sound Intone I65 Earphone White Version', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/13.jpg\",\"products\\/13-1.jpg\"]', 'SW-168-A0', 0, 17, 0, 1, 0, NULL, NULL, 2, 0, 0, 0, 0, 594, NULL, NULL, NULL, 20.00, 14.00, 15.00, 522.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:25', 1, 153396, 'in_stock', 2),
(14, 'B&O Play Mini Bluetooth Speaker', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/14.jpg\"]', 'SW-152-A0', 0, 10, 0, 1, 0, NULL, NULL, 2, 0, 0, 0, 0, 559, NULL, NULL, NULL, 14.00, 18.00, 17.00, 702.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:26', 1, 18914, 'in_stock', 2),
(15, 'Apple MacBook Air Retina 13.3-Inch Laptop', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/15.jpg\",\"products\\/15-1.jpg\"]', 'SW-183-A0', 0, 13, 0, 1, 0, NULL, NULL, 3, 0, 0, 0, 0, 529, NULL, NULL, NULL, 14.00, 11.00, 11.00, 789.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:26', 1, 94622, 'in_stock', 3),
(16, 'Apple MacBook Air Retina 12-Inch Laptop', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/16.jpg\"]', 'SW-141-A0', 0, 14, 0, 1, 0, NULL, NULL, 4, 0, 0, 0, 0, 526, 426.06, NULL, NULL, 19.00, 13.00, 11.00, 603.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:26', 1, 95823, 'in_stock', 4),
(17, 'Samsung Gear VR Virtual Reality Headset', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/17.jpg\",\"products\\/17-1.jpg\",\"products\\/17-2.jpg\",\"products\\/17-3.jpg\"]', 'SW-174-A0', 0, 20, 0, 1, 0, NULL, NULL, 3, 0, 0, 0, 0, 566, NULL, NULL, NULL, 12.00, 19.00, 14.00, 772.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:26', 1, 181251, 'in_stock', 5),
(18, 'Aveeno Moisturizing Body Shower 450ml', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/18.jpg\",\"products\\/18-1.jpg\",\"products\\/18-2.jpg\",\"products\\/18-3.jpg\"]', 'SW-134-A0', 0, 16, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 0, 1207, NULL, NULL, NULL, 15.00, 15.00, 10.00, 534.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:26', 1, 166600, 'in_stock', 1);
INSERT INTO `ec_products` (`id`, `name`, `description`, `content`, `status`, `images`, `sku`, `order`, `quantity`, `allow_checkout_when_out_of_stock`, `with_storehouse_management`, `is_featured`, `options`, `category_id`, `brand_id`, `is_variation`, `is_searchable`, `is_show_on_list`, `sale_type`, `price`, `sale_price`, `start_date`, `end_date`, `length`, `wide`, `height`, `weight`, `barcode`, `length_unit`, `wide_unit`, `height_unit`, `weight_unit`, `created_at`, `updated_at`, `tax_id`, `views`, `stock_status`, `store_id`) VALUES
(19, 'NYX Beauty Couton Pallete Makeup 12', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/19.jpg\",\"products\\/19-1.jpg\",\"products\\/19-2.jpg\",\"products\\/19-3.jpg\"]', 'SW-180-A0', 0, 18, 0, 1, 0, NULL, NULL, 5, 0, 0, 0, 0, 1192, NULL, NULL, NULL, 12.00, 12.00, 19.00, 889.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:26', 1, 28785, 'in_stock', 3),
(20, 'NYX Beauty Couton Pallete Makeup 12', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/20.jpg\",\"products\\/20-1.jpg\",\"products\\/20-2.jpg\",\"products\\/20-3.jpg\"]', 'SW-194-A0', 0, 16, 0, 1, 0, NULL, NULL, 6, 0, 0, 0, 0, 719, 503.3, NULL, NULL, 18.00, 20.00, 17.00, 663.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:26', 1, 198403, 'in_stock', 3),
(21, 'MVMTH Classical Leather Watch In Black', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/21.jpg\",\"products\\/21-1.jpg\",\"products\\/21-2.jpg\"]', 'SW-134-A0', 0, 17, 0, 1, 0, NULL, NULL, 5, 0, 0, 0, 0, 801, NULL, NULL, NULL, 16.00, 20.00, 20.00, 521.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:26', 1, 62866, 'in_stock', 2),
(22, 'Baxter Care Hair Kit For Bearded Mens', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/22.jpg\",\"products\\/22-1.jpg\",\"products\\/22-2.jpg\",\"products\\/22-3.jpg\"]', 'SW-167-A0', 0, 18, 0, 1, 0, NULL, NULL, 3, 0, 0, 0, 0, 465, NULL, NULL, NULL, 19.00, 18.00, 14.00, 533.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:26', 1, 195908, 'in_stock', 4),
(23, 'Ciate Palemore Lipstick Bold Red Color', '<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/23.jpg\",\"products\\/23-1.jpg\",\"products\\/23-2.jpg\",\"products\\/23-3.jpg\"]', 'SW-113-A0', 0, 15, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 0, 1239, NULL, NULL, NULL, 11.00, 19.00, 11.00, 567.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:26', 1, 31789, 'in_stock', 3),
(24, 'Dual Camera 20MP', NULL, NULL, 'published', '[\"products\\/1.jpg\"]', 'SW-148-A0', 0, 12, 0, 1, 0, NULL, NULL, 4, 1, 0, 0, 0, 80.25, NULL, NULL, NULL, 16.00, 13.00, 11.00, 893.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(25, 'Dual Camera 20MP', NULL, NULL, 'published', '[\"products\\/1.jpg\"]', 'SW-148-A0-A1', 0, 12, 0, 1, 0, NULL, NULL, 4, 1, 0, 0, 0, 80.25, NULL, NULL, NULL, 16.00, 13.00, 11.00, 893.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(26, 'Dual Camera 20MP', NULL, NULL, 'published', '[\"products\\/1.jpg\"]', 'SW-148-A0-A2', 0, 12, 0, 1, 0, NULL, NULL, 4, 1, 0, 0, 0, 80.25, NULL, NULL, NULL, 16.00, 13.00, 11.00, 893.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(27, 'Dual Camera 20MP', NULL, NULL, 'published', '[\"products\\/1.jpg\"]', 'SW-148-A0-A3', 0, 12, 0, 1, 0, NULL, NULL, 4, 1, 0, 0, 0, 80.25, NULL, NULL, NULL, 16.00, 13.00, 11.00, 893.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(28, 'Dual Camera 20MP', NULL, NULL, 'published', '[\"products\\/1.jpg\"]', 'SW-148-A0-A4', 0, 12, 0, 1, 0, NULL, NULL, 4, 1, 0, 0, 0, 80.25, NULL, NULL, NULL, 16.00, 13.00, 11.00, 893.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(29, 'Smart Watches', NULL, NULL, 'published', '[\"products\\/2.jpg\"]', 'SW-164-A0', 0, 14, 0, 1, 0, NULL, NULL, 5, 1, 0, 0, 0, 40.5, NULL, NULL, NULL, 16.00, 11.00, 13.00, 847.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(30, 'Smart Watches', NULL, NULL, 'published', '[\"products\\/2-1.jpg\"]', 'SW-164-A0-A1', 0, 14, 0, 1, 0, NULL, NULL, 5, 1, 0, 0, 0, 40.5, NULL, NULL, NULL, 16.00, 11.00, 13.00, 847.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(31, 'Smart Watches', NULL, NULL, 'published', '[\"products\\/2-2.jpg\"]', 'SW-164-A0-A2', 0, 14, 0, 1, 0, NULL, NULL, 5, 1, 0, 0, 0, 40.5, NULL, NULL, NULL, 16.00, 11.00, 13.00, 847.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(32, 'Beat Headphone', NULL, NULL, 'published', '[\"products\\/3.jpg\"]', 'SW-110-A0', 0, 19, 0, 1, 0, NULL, NULL, 7, 1, 0, 0, 0, 20, NULL, NULL, NULL, 16.00, 15.00, 15.00, 533.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(33, 'Beat Headphone', NULL, NULL, 'published', '[\"products\\/3.jpg\"]', 'SW-110-A0-A1', 0, 19, 0, 1, 0, NULL, NULL, 7, 1, 0, 0, 0, 20, NULL, NULL, NULL, 16.00, 15.00, 15.00, 533.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(34, 'Red & Black Headphone', NULL, NULL, 'published', '[\"products\\/4.jpg\"]', 'SW-113-A0', 0, 17, 0, 1, 0, NULL, NULL, 2, 1, 0, 0, 0, 519, 373.68, NULL, NULL, 10.00, 15.00, 19.00, 808.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(35, 'Red & Black Headphone', NULL, NULL, 'published', '[\"products\\/4-1.jpg\"]', 'SW-113-A0-A1', 0, 17, 0, 1, 0, NULL, NULL, 2, 1, 0, 0, 0, 519, 410.01, NULL, NULL, 10.00, 15.00, 19.00, 808.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(36, 'Smart Watch External', NULL, NULL, 'published', '[\"products\\/5.jpg\"]', 'SW-145-A0', 0, 19, 0, 1, 0, NULL, NULL, 7, 1, 0, 0, 0, 854, NULL, NULL, NULL, 12.00, 10.00, 13.00, 793.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(37, 'Smart Watch External', NULL, NULL, 'published', '[\"products\\/5-1.jpg\"]', 'SW-145-A0-A1', 0, 19, 0, 1, 0, NULL, NULL, 7, 1, 0, 0, 0, 854, NULL, NULL, NULL, 12.00, 10.00, 13.00, 793.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(38, 'Smart Watch External', NULL, NULL, 'published', '[\"products\\/5-2.jpg\"]', 'SW-145-A0-A2', 0, 19, 0, 1, 0, NULL, NULL, 7, 1, 0, 0, 0, 854, NULL, NULL, NULL, 12.00, 10.00, 13.00, 793.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(39, 'Smart Watch External', NULL, NULL, 'published', '[\"products\\/5-3.jpg\"]', 'SW-145-A0-A3', 0, 19, 0, 1, 0, NULL, NULL, 7, 1, 0, 0, 0, 854, NULL, NULL, NULL, 12.00, 10.00, 13.00, 793.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(40, 'Nikon HD camera', NULL, NULL, 'published', '[\"products\\/6.jpg\"]', 'SW-153-A0', 0, 12, 0, 1, 0, NULL, NULL, 6, 1, 0, 0, 0, 443, NULL, NULL, NULL, 12.00, 11.00, 13.00, 567.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(41, 'Nikon HD camera', NULL, NULL, 'published', '[\"products\\/6.jpg\"]', 'SW-153-A0-A1', 0, 12, 0, 1, 0, NULL, NULL, 6, 1, 0, 0, 0, 443, NULL, NULL, NULL, 12.00, 11.00, 13.00, 567.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(42, 'Nikon HD camera', NULL, NULL, 'published', '[\"products\\/6.jpg\"]', 'SW-153-A0-A2', 0, 12, 0, 1, 0, NULL, NULL, 6, 1, 0, 0, 0, 443, NULL, NULL, NULL, 12.00, 11.00, 13.00, 567.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(43, 'Audio Equipment', NULL, NULL, 'published', '[\"products\\/7.jpg\"]', 'SW-153-A0', 0, 12, 0, 1, 0, NULL, NULL, 5, 1, 0, 0, 0, 555, NULL, NULL, NULL, 20.00, 19.00, 11.00, 785.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(44, 'Audio Equipment', NULL, NULL, 'published', '[\"products\\/7.jpg\"]', 'SW-153-A0-A1', 0, 12, 0, 1, 0, NULL, NULL, 5, 1, 0, 0, 0, 555, NULL, NULL, NULL, 20.00, 19.00, 11.00, 785.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(45, 'Smart Televisions', NULL, NULL, 'published', '[\"products\\/8.jpg\"]', 'SW-144-A0', 0, 17, 0, 1, 0, NULL, NULL, 7, 1, 0, 0, 0, 1137, 955.08, NULL, NULL, 15.00, 16.00, 17.00, 852.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(46, 'Smart Televisions', NULL, NULL, 'published', '[\"products\\/8-1.jpg\"]', 'SW-144-A0-A1', 0, 17, 0, 1, 0, NULL, NULL, 7, 1, 0, 0, 0, 1137, 955.08, NULL, NULL, 15.00, 16.00, 17.00, 852.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(47, 'Samsung Smart Phone', NULL, NULL, 'published', '[\"products\\/9.jpg\"]', 'SW-137-A0', 0, 18, 0, 1, 0, NULL, NULL, 1, 1, 0, 0, 0, 590, NULL, NULL, NULL, 10.00, 13.00, 18.00, 718.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(48, 'Samsung Smart Phone', NULL, NULL, 'published', '[\"products\\/9-1.jpg\"]', 'SW-137-A0-A1', 0, 18, 0, 1, 0, NULL, NULL, 1, 1, 0, 0, 0, 590, NULL, NULL, NULL, 10.00, 13.00, 18.00, 718.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(49, 'Samsung Smart Phone', NULL, NULL, 'published', '[\"products\\/9-2.jpg\"]', 'SW-137-A0-A2', 0, 18, 0, 1, 0, NULL, NULL, 1, 1, 0, 0, 0, 590, NULL, NULL, NULL, 10.00, 13.00, 18.00, 718.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(50, 'Samsung Smart Phone', NULL, NULL, 'published', '[\"products\\/9.jpg\"]', 'SW-137-A0-A3', 0, 18, 0, 1, 0, NULL, NULL, 1, 1, 0, 0, 0, 590, NULL, NULL, NULL, 10.00, 13.00, 18.00, 718.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(51, 'Herschel Leather Duffle Bag In Brown Color', NULL, NULL, 'published', '[\"products\\/10.jpg\"]', 'SW-131-A0', 0, 17, 0, 1, 0, NULL, NULL, 5, 1, 0, 0, 0, 1300, NULL, NULL, NULL, 15.00, 19.00, 10.00, 625.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(52, 'Herschel Leather Duffle Bag In Brown Color', NULL, NULL, 'published', '[\"products\\/10-1.jpg\"]', 'SW-131-A0-A1', 0, 17, 0, 1, 0, NULL, NULL, 5, 1, 0, 0, 0, 1300, NULL, NULL, NULL, 15.00, 19.00, 10.00, 625.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(53, 'Herschel Leather Duffle Bag In Brown Color', NULL, NULL, 'published', '[\"products\\/10-2.jpg\"]', 'SW-131-A0-A2', 0, 17, 0, 1, 0, NULL, NULL, 5, 1, 0, 0, 0, 1300, NULL, NULL, NULL, 15.00, 19.00, 10.00, 625.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(54, 'Xbox One Wireless Controller Black Color', NULL, NULL, 'published', '[\"products\\/11.jpg\"]', 'SW-153-A0', 0, 17, 0, 1, 0, NULL, NULL, 1, 1, 0, 0, 0, 1275, NULL, NULL, NULL, 17.00, 18.00, 19.00, 742.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(55, 'Xbox One Wireless Controller Black Color', NULL, NULL, 'published', '[\"products\\/11-1.jpg\"]', 'SW-153-A0-A1', 0, 17, 0, 1, 0, NULL, NULL, 1, 1, 0, 0, 0, 1275, NULL, NULL, NULL, 17.00, 18.00, 19.00, 742.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(56, 'Xbox One Wireless Controller Black Color', NULL, NULL, 'published', '[\"products\\/11-2.jpg\"]', 'SW-153-A0-A2', 0, 17, 0, 1, 0, NULL, NULL, 1, 1, 0, 0, 0, 1275, NULL, NULL, NULL, 17.00, 18.00, 19.00, 742.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(57, 'EPSION Plaster Printer', NULL, NULL, 'published', '[\"products\\/12.jpg\"]', 'SW-149-A0', 0, 15, 0, 1, 0, NULL, NULL, 7, 1, 0, 0, 0, 576, 432, NULL, NULL, 19.00, 18.00, 20.00, 590.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(58, 'Sound Intone I65 Earphone White Version', NULL, NULL, 'published', '[\"products\\/13.jpg\"]', 'SW-168-A0', 0, 17, 0, 1, 0, NULL, NULL, 2, 1, 0, 0, 0, 594, NULL, NULL, NULL, 20.00, 14.00, 15.00, 522.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(59, 'Sound Intone I65 Earphone White Version', NULL, NULL, 'published', '[\"products\\/13-1.jpg\"]', 'SW-168-A0-A1', 0, 17, 0, 1, 0, NULL, NULL, 2, 1, 0, 0, 0, 594, NULL, NULL, NULL, 20.00, 14.00, 15.00, 522.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(60, 'B&O Play Mini Bluetooth Speaker', NULL, NULL, 'published', '[\"products\\/14.jpg\"]', 'SW-152-A0', 0, 10, 0, 1, 0, NULL, NULL, 2, 1, 0, 0, 0, 559, NULL, NULL, NULL, 14.00, 18.00, 17.00, 702.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(61, 'B&O Play Mini Bluetooth Speaker', NULL, NULL, 'published', '[\"products\\/14.jpg\"]', 'SW-152-A0-A1', 0, 10, 0, 1, 0, NULL, NULL, 2, 1, 0, 0, 0, 559, NULL, NULL, NULL, 14.00, 18.00, 17.00, 702.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(62, 'B&O Play Mini Bluetooth Speaker', NULL, NULL, 'published', '[\"products\\/14.jpg\"]', 'SW-152-A0-A2', 0, 10, 0, 1, 0, NULL, NULL, 2, 1, 0, 0, 0, 559, NULL, NULL, NULL, 14.00, 18.00, 17.00, 702.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(63, 'Apple MacBook Air Retina 13.3-Inch Laptop', NULL, NULL, 'published', '[\"products\\/15.jpg\"]', 'SW-183-A0', 0, 13, 0, 1, 0, NULL, NULL, 3, 1, 0, 0, 0, 529, NULL, NULL, NULL, 14.00, 11.00, 11.00, 789.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(64, 'Apple MacBook Air Retina 13.3-Inch Laptop', NULL, NULL, 'published', '[\"products\\/15-1.jpg\"]', 'SW-183-A0-A1', 0, 13, 0, 1, 0, NULL, NULL, 3, 1, 0, 0, 0, 529, NULL, NULL, NULL, 14.00, 11.00, 11.00, 789.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(65, 'Apple MacBook Air Retina 13.3-Inch Laptop', NULL, NULL, 'published', '[\"products\\/15.jpg\"]', 'SW-183-A0-A2', 0, 13, 0, 1, 0, NULL, NULL, 3, 1, 0, 0, 0, 529, NULL, NULL, NULL, 14.00, 11.00, 11.00, 789.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(66, 'Apple MacBook Air Retina 12-Inch Laptop', NULL, NULL, 'published', '[\"products\\/16.jpg\"]', 'SW-141-A0', 0, 14, 0, 1, 0, NULL, NULL, 4, 1, 0, 0, 0, 526, 426.06, NULL, NULL, 19.00, 13.00, 11.00, 603.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(67, 'Apple MacBook Air Retina 12-Inch Laptop', NULL, NULL, 'published', '[\"products\\/16.jpg\"]', 'SW-141-A0-A1', 0, 14, 0, 1, 0, NULL, NULL, 4, 1, 0, 0, 0, 526, 473.4, NULL, NULL, 19.00, 13.00, 11.00, 603.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(68, 'Apple MacBook Air Retina 12-Inch Laptop', NULL, NULL, 'published', '[\"products\\/16.jpg\"]', 'SW-141-A0-A2', 0, 14, 0, 1, 0, NULL, NULL, 4, 1, 0, 0, 0, 526, 405.02, NULL, NULL, 19.00, 13.00, 11.00, 603.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(69, 'Samsung Gear VR Virtual Reality Headset', NULL, NULL, 'published', '[\"products\\/17.jpg\"]', 'SW-174-A0', 0, 20, 0, 1, 0, NULL, NULL, 3, 1, 0, 0, 0, 566, NULL, NULL, NULL, 12.00, 19.00, 14.00, 772.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(70, 'Samsung Gear VR Virtual Reality Headset', NULL, NULL, 'published', '[\"products\\/17-1.jpg\"]', 'SW-174-A0-A1', 0, 20, 0, 1, 0, NULL, NULL, 3, 1, 0, 0, 0, 566, NULL, NULL, NULL, 12.00, 19.00, 14.00, 772.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(71, 'Samsung Gear VR Virtual Reality Headset', NULL, NULL, 'published', '[\"products\\/17-2.jpg\"]', 'SW-174-A0-A2', 0, 20, 0, 1, 0, NULL, NULL, 3, 1, 0, 0, 0, 566, NULL, NULL, NULL, 12.00, 19.00, 14.00, 772.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(72, 'Aveeno Moisturizing Body Shower 450ml', NULL, NULL, 'published', '[\"products\\/18.jpg\"]', 'SW-134-A0', 0, 16, 0, 1, 0, NULL, NULL, 1, 1, 0, 0, 0, 1207, NULL, NULL, NULL, 15.00, 15.00, 10.00, 534.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(73, 'Aveeno Moisturizing Body Shower 450ml', NULL, NULL, 'published', '[\"products\\/18-1.jpg\"]', 'SW-134-A0-A1', 0, 16, 0, 1, 0, NULL, NULL, 1, 1, 0, 0, 0, 1207, NULL, NULL, NULL, 15.00, 15.00, 10.00, 534.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(74, 'Aveeno Moisturizing Body Shower 450ml', NULL, NULL, 'published', '[\"products\\/18-2.jpg\"]', 'SW-134-A0-A2', 0, 16, 0, 1, 0, NULL, NULL, 1, 1, 0, 0, 0, 1207, NULL, NULL, NULL, 15.00, 15.00, 10.00, 534.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(75, 'NYX Beauty Couton Pallete Makeup 12', NULL, NULL, 'published', '[\"products\\/19.jpg\"]', 'SW-180-A0', 0, 18, 0, 1, 0, NULL, NULL, 5, 1, 0, 0, 0, 1192, NULL, NULL, NULL, 12.00, 12.00, 19.00, 889.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(76, 'NYX Beauty Couton Pallete Makeup 12', NULL, NULL, 'published', '[\"products\\/20.jpg\"]', 'SW-194-A0', 0, 16, 0, 1, 0, NULL, NULL, 6, 1, 0, 0, 0, 719, 503.3, NULL, NULL, 18.00, 20.00, 17.00, 663.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(77, 'NYX Beauty Couton Pallete Makeup 12', NULL, NULL, 'published', '[\"products\\/20-1.jpg\"]', 'SW-194-A0-A1', 0, 16, 0, 1, 0, NULL, NULL, 6, 1, 0, 0, 0, 719, 524.87, NULL, NULL, 18.00, 20.00, 17.00, 663.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(78, 'NYX Beauty Couton Pallete Makeup 12', NULL, NULL, 'published', '[\"products\\/20-2.jpg\"]', 'SW-194-A0-A2', 0, 16, 0, 1, 0, NULL, NULL, 6, 1, 0, 0, 0, 719, 632.72, NULL, NULL, 18.00, 20.00, 17.00, 663.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(79, 'MVMTH Classical Leather Watch In Black', NULL, NULL, 'published', '[\"products\\/21.jpg\"]', 'SW-134-A0', 0, 17, 0, 1, 0, NULL, NULL, 5, 1, 0, 0, 0, 801, NULL, NULL, NULL, 16.00, 20.00, 20.00, 521.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(80, 'MVMTH Classical Leather Watch In Black', NULL, NULL, 'published', '[\"products\\/21-1.jpg\"]', 'SW-134-A0-A1', 0, 17, 0, 1, 0, NULL, NULL, 5, 1, 0, 0, 0, 801, NULL, NULL, NULL, 16.00, 20.00, 20.00, 521.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(81, 'MVMTH Classical Leather Watch In Black', NULL, NULL, 'published', '[\"products\\/21-2.jpg\"]', 'SW-134-A0-A2', 0, 17, 0, 1, 0, NULL, NULL, 5, 1, 0, 0, 0, 801, NULL, NULL, NULL, 16.00, 20.00, 20.00, 521.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(82, 'MVMTH Classical Leather Watch In Black', NULL, NULL, 'published', '[\"products\\/21.jpg\"]', 'SW-134-A0-A3', 0, 17, 0, 1, 0, NULL, NULL, 5, 1, 0, 0, 0, 801, NULL, NULL, NULL, 16.00, 20.00, 20.00, 521.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(83, 'Baxter Care Hair Kit For Bearded Mens', NULL, NULL, 'published', '[\"products\\/22.jpg\"]', 'SW-167-A0', 0, 18, 0, 1, 0, NULL, NULL, 3, 1, 0, 0, 0, 465, NULL, NULL, NULL, 19.00, 18.00, 14.00, 533.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(84, 'Ciate Palemore Lipstick Bold Red Color', NULL, NULL, 'published', '[\"products\\/23.jpg\"]', 'SW-113-A0', 0, 15, 0, 1, 0, NULL, NULL, 1, 1, 0, 0, 0, 1239, NULL, NULL, NULL, 11.00, 19.00, 11.00, 567.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL),
(85, 'Ciate Palemore Lipstick Bold Red Color', NULL, NULL, 'published', '[\"products\\/23-1.jpg\"]', 'SW-113-A0-A1', 0, 15, 0, 1, 0, NULL, NULL, 1, 1, 0, 0, 0, 1239, NULL, NULL, NULL, 11.00, 19.00, 11.00, 567.00, NULL, NULL, NULL, NULL, NULL, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL, 0, 'in_stock', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ec_products_translations`
--

CREATE TABLE `ec_products_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_products_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_attributes`
--

CREATE TABLE `ec_product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_set_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_attributes`
--

INSERT INTO `ec_product_attributes` (`id`, `attribute_set_id`, `title`, `slug`, `color`, `image`, `is_default`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Green', 'green', '#5FB7D4', NULL, 1, 1, 'published', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(2, 1, 'Blue', 'blue', '#333333', NULL, 0, 2, 'published', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(3, 1, 'Red', 'red', '#DA323F', NULL, 0, 3, 'published', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(4, 1, 'Black', 'back', '#2F366C', NULL, 0, 4, 'published', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(5, 1, 'Brown', 'brown', '#87554B', NULL, 0, 5, 'published', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(6, 2, 'S', 's', NULL, NULL, 1, 1, 'published', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(7, 2, 'M', 'm', NULL, NULL, 1, 2, 'published', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(8, 2, 'L', 'l', NULL, NULL, 1, 3, 'published', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(9, 2, 'XL', 'xl', NULL, NULL, 1, 4, 'published', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(10, 2, 'XXL', 'xxl', NULL, NULL, 1, 5, 'published', '2021-08-21 01:52:11', '2021-08-21 01:52:11');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_attributes_translations`
--

CREATE TABLE `ec_product_attributes_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attributes_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_attribute_sets`
--

CREATE TABLE `ec_product_attribute_sets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_layout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'swatch_dropdown',
  `is_searchable` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `is_comparable` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `is_use_in_product_listing` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_attribute_sets`
--

INSERT INTO `ec_product_attribute_sets` (`id`, `title`, `slug`, `display_layout`, `is_searchable`, `is_comparable`, `is_use_in_product_listing`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Color', 'color', 'visual', 1, 1, 1, 'published', 0, '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(2, 'Size', 'size', 'text', 1, 1, 1, 'published', 1, '2021-08-21 01:52:11', '2021-08-21 01:52:11');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_attribute_sets_translations`
--

CREATE TABLE `ec_product_attribute_sets_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attribute_sets_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_categories`
--

CREATE TABLE `ec_product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT '0',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_categories`
--

INSERT INTO `ec_product_categories` (`id`, `name`, `parent_id`, `description`, `status`, `order`, `image`, `is_featured`, `created_at`, `updated_at`) VALUES
(1, 'Hot Promotions', 0, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(2, 'Electronics', 0, NULL, 'published', 1, 'product-categories/1.jpg', 1, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(3, 'Clothing', 0, NULL, 'published', 2, 'product-categories/2.jpg', 1, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(4, 'Computers', 0, NULL, 'published', 3, 'product-categories/3.jpg', 1, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(5, 'Home & Kitchen', 0, NULL, 'published', 4, 'product-categories/4.jpg', 1, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(6, 'Health & Beauty', 0, NULL, 'published', 5, 'product-categories/5.jpg', 1, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(7, 'Jewelry & Watch', 0, NULL, 'published', 6, 'product-categories/6.jpg', 1, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(8, 'Technology Toys', 0, NULL, 'published', 7, 'product-categories/7.jpg', 1, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(9, 'Phones', 0, NULL, 'published', 8, 'product-categories/8.jpg', 1, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(10, 'Babies & Moms', 0, NULL, 'published', 9, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(11, 'Sport & Outdoor', 0, NULL, 'published', 10, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(12, 'Books & Office', 0, NULL, 'published', 11, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(13, 'Cars & Motorcycles', 0, NULL, 'published', 12, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(14, 'Home Improvements', 0, NULL, 'published', 13, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(15, 'Consumer Electronic', 2, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(16, 'Accessories & Parts', 2, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(17, 'Computer & Technologies', 4, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(18, 'Networking', 4, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(19, 'Home Audio & Theaters', 15, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(20, 'TV & Videos', 15, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(21, 'Camera, Photos & Videos', 15, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(22, 'Cellphones & Accessories', 15, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(23, 'Headphones', 15, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(24, 'Videos games', 15, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(25, 'Wireless Speakers', 15, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(26, 'Office Electronic', 15, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(27, 'Digital Cables', 16, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(28, 'Audio & Video Cables', 16, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(29, 'Batteries', 16, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(30, 'Computer & Tablets', 17, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(31, 'Laptop', 17, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(32, 'Monitors', 17, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(33, 'Computer Components', 17, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(34, 'Drive & Storages', 18, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(35, 'Gaming Laptop', 18, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(36, 'Security & Protection', 18, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(37, 'Accessories', 18, NULL, 'published', 0, NULL, 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_categories_translations`
--

CREATE TABLE `ec_product_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_categories_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_category_product`
--

CREATE TABLE `ec_product_category_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_category_product`
--

INSERT INTO `ec_product_category_product` (`id`, `category_id`, `product_id`) VALUES
(1, 23, 1),
(2, 16, 1),
(3, 9, 1),
(4, 36, 2),
(5, 32, 2),
(6, 18, 2),
(7, 16, 2),
(8, 4, 3),
(9, 14, 3),
(10, 35, 3),
(11, 15, 3),
(12, 13, 4),
(13, 10, 4),
(14, 14, 4),
(15, 16, 4),
(16, 30, 5),
(17, 6, 5),
(18, 17, 5),
(19, 15, 5),
(20, 32, 6),
(21, 35, 6),
(22, 30, 6),
(23, 17, 6),
(24, 15, 7),
(25, 36, 7),
(26, 11, 7),
(27, 16, 7),
(28, 20, 8),
(29, 14, 8),
(30, 12, 8),
(31, 15, 8),
(32, 25, 9),
(33, 15, 9),
(34, 18, 10),
(35, 30, 10),
(36, 21, 10),
(37, 17, 10),
(38, 23, 11),
(39, 33, 11),
(40, 11, 11),
(41, 17, 11),
(42, 21, 12),
(43, 19, 12),
(44, 13, 12),
(45, 17, 12),
(46, 6, 13),
(47, 28, 13),
(48, 25, 13),
(49, 15, 13),
(50, 12, 14),
(51, 29, 14),
(52, 27, 14),
(53, 15, 14),
(54, 23, 15),
(55, 3, 15),
(56, 11, 15),
(57, 16, 15),
(58, 2, 16),
(59, 35, 16),
(60, 12, 16),
(61, 15, 16),
(62, 6, 17),
(63, 21, 17),
(64, 37, 17),
(65, 17, 17),
(66, 2, 18),
(67, 9, 18),
(68, 15, 18),
(69, 20, 19),
(70, 9, 19),
(71, 35, 19),
(72, 16, 19),
(73, 4, 20),
(74, 3, 20),
(75, 19, 20),
(76, 16, 20),
(77, 4, 21),
(78, 26, 21),
(79, 16, 21),
(80, 15, 21),
(81, 9, 22),
(82, 2, 22),
(83, 22, 22),
(84, 15, 22),
(85, 29, 23),
(86, 27, 23),
(87, 5, 23),
(88, 16, 23);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_collections`
--

CREATE TABLE `ec_product_collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_collections`
--

INSERT INTO `ec_product_collections` (`id`, `name`, `slug`, `description`, `image`, `status`, `created_at`, `updated_at`, `is_featured`) VALUES
(1, 'New Arrival', 'new-arrival', NULL, NULL, 'published', '2021-08-21 01:51:51', '2021-08-21 01:51:51', 0),
(2, 'Best Sellers', 'best-sellers', NULL, NULL, 'published', '2021-08-21 01:51:51', '2021-08-21 01:51:51', 0),
(3, 'Special Offer', 'special-offer', NULL, NULL, 'published', '2021-08-21 01:51:51', '2021-08-21 01:51:51', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_collections_translations`
--

CREATE TABLE `ec_product_collections_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_collections_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_collection_products`
--

CREATE TABLE `ec_product_collection_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_collection_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_collection_products`
--

INSERT INTO `ec_product_collection_products` (`id`, `product_collection_id`, `product_id`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 1, 3),
(4, 3, 4),
(5, 1, 5),
(6, 1, 6),
(7, 3, 7),
(8, 1, 8),
(9, 2, 9),
(10, 1, 10),
(11, 2, 11),
(12, 2, 12),
(13, 2, 13),
(14, 3, 14),
(15, 1, 15),
(16, 2, 16),
(17, 2, 17),
(18, 2, 18),
(19, 2, 19),
(20, 3, 20),
(21, 2, 21),
(22, 3, 22),
(23, 1, 23);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_cross_sale_relations`
--

CREATE TABLE `ec_product_cross_sale_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_product_id` int(10) UNSIGNED NOT NULL,
  `to_product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_cross_sale_relations`
--

INSERT INTO `ec_product_cross_sale_relations` (`id`, `from_product_id`, `to_product_id`) VALUES
(14, 3, 12),
(39, 7, 10),
(48, 9, 18),
(55, 10, 6),
(61, 11, 12),
(67, 12, 19),
(68, 12, 18),
(78, 14, 5),
(93, 16, 20),
(116, 20, 16),
(130, 22, 13),
(142, 1, 8),
(143, 1, 19),
(148, 2, 16),
(150, 3, 7),
(152, 3, 6),
(160, 5, 18),
(162, 5, 7),
(165, 6, 8),
(166, 7, 4),
(168, 7, 18),
(172, 8, 3),
(175, 9, 13),
(183, 11, 3),
(192, 13, 2),
(196, 14, 17),
(200, 15, 5),
(201, 15, 9),
(202, 15, 17),
(209, 17, 14),
(211, 18, 14),
(213, 18, 4),
(218, 19, 17),
(220, 20, 15),
(221, 20, 19),
(225, 21, 17),
(227, 22, 17),
(232, 23, 16),
(233, 23, 18),
(235, 23, 6),
(236, 1, 13),
(237, 1, 6),
(238, 1, 17),
(239, 1, 20),
(240, 1, 15),
(241, 2, 12),
(242, 2, 6),
(243, 2, 11),
(244, 2, 20),
(245, 3, 15),
(246, 3, 9),
(247, 3, 13),
(248, 4, 7),
(249, 4, 10),
(250, 4, 1),
(251, 4, 8),
(252, 4, 6),
(253, 4, 16),
(254, 5, 12),
(255, 5, 20),
(256, 5, 10),
(257, 5, 16),
(258, 5, 3),
(259, 6, 18),
(260, 6, 11),
(261, 6, 2),
(262, 6, 14),
(263, 6, 10),
(264, 7, 1),
(265, 7, 11),
(266, 7, 16),
(267, 7, 9),
(268, 8, 7),
(269, 8, 19),
(270, 8, 13),
(271, 8, 11),
(272, 9, 19),
(273, 9, 7),
(274, 9, 4),
(275, 9, 8),
(276, 9, 17),
(277, 10, 18),
(278, 10, 19),
(279, 10, 8),
(280, 10, 15),
(281, 10, 5),
(282, 11, 10),
(283, 11, 8),
(284, 11, 13),
(285, 11, 14),
(286, 11, 4),
(287, 12, 13),
(288, 12, 7),
(289, 12, 3),
(290, 12, 20),
(291, 13, 3),
(292, 13, 18),
(293, 13, 5),
(294, 13, 19),
(295, 13, 6),
(296, 14, 12),
(297, 14, 6),
(298, 15, 4),
(299, 15, 12),
(300, 15, 16),
(301, 15, 20),
(302, 16, 2),
(303, 16, 18),
(304, 16, 9),
(305, 16, 7),
(306, 16, 17),
(307, 17, 5),
(308, 17, 15),
(309, 17, 2),
(310, 17, 7),
(311, 18, 6),
(312, 18, 15),
(313, 18, 16),
(314, 19, 12),
(315, 19, 5),
(316, 19, 10),
(317, 19, 6),
(318, 20, 1),
(319, 20, 14),
(320, 20, 5),
(321, 20, 3),
(322, 21, 6),
(323, 21, 1),
(324, 21, 9),
(325, 21, 16),
(326, 21, 19),
(327, 22, 14),
(328, 22, 10),
(329, 22, 1),
(330, 22, 12),
(331, 23, 19),
(332, 23, 13);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_labels`
--

CREATE TABLE `ec_product_labels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_labels`
--

INSERT INTO `ec_product_labels` (`id`, `name`, `color`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Hot', '#ec2434', 'published', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(2, 'New', '#00c9a7', 'published', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(3, 'Sale', '#fe9931', 'published', '2021-08-21 01:51:51', '2021-08-21 01:51:51');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_labels_translations`
--

CREATE TABLE `ec_product_labels_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_labels_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_label_products`
--

CREATE TABLE `ec_product_label_products` (
  `product_label_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_label_products`
--

INSERT INTO `ec_product_label_products` (`product_label_id`, `product_id`) VALUES
(1, 15),
(2, 6),
(2, 12),
(2, 21),
(3, 3),
(3, 9),
(3, 18);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_related_relations`
--

CREATE TABLE `ec_product_related_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_product_id` int(10) UNSIGNED NOT NULL,
  `to_product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_tags`
--

CREATE TABLE `ec_product_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_tags`
--

INSERT INTO `ec_product_tags` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Electronic', NULL, 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(2, 'Mobile', NULL, 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(3, 'Iphone', NULL, 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(4, 'Printer', NULL, 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(5, 'Office', NULL, 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(6, 'IT', NULL, 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_tag_product`
--

CREATE TABLE `ec_product_tag_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_tag_product`
--

INSERT INTO `ec_product_tag_product` (`product_id`, `tag_id`) VALUES
(1, 1),
(1, 2),
(1, 6),
(2, 1),
(2, 3),
(2, 4),
(3, 3),
(3, 4),
(4, 2),
(4, 3),
(4, 4),
(5, 1),
(5, 2),
(5, 3),
(6, 2),
(6, 3),
(7, 1),
(7, 3),
(7, 6),
(8, 1),
(8, 5),
(8, 6),
(9, 2),
(9, 4),
(9, 6),
(10, 1),
(10, 4),
(10, 5),
(11, 1),
(11, 5),
(11, 6),
(12, 5),
(12, 6),
(13, 1),
(13, 2),
(13, 3),
(14, 1),
(14, 4),
(14, 6),
(15, 5),
(15, 6),
(16, 1),
(16, 6),
(17, 2),
(17, 3),
(17, 4),
(18, 2),
(18, 6),
(19, 2),
(19, 4),
(19, 5),
(20, 2),
(20, 5),
(20, 6),
(21, 2),
(21, 3),
(21, 6),
(22, 2),
(22, 4),
(23, 1),
(23, 2),
(23, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_up_sale_relations`
--

CREATE TABLE `ec_product_up_sale_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_product_id` int(10) UNSIGNED NOT NULL,
  `to_product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_variations`
--

CREATE TABLE `ec_product_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `configurable_product_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_variations`
--

INSERT INTO `ec_product_variations` (`id`, `product_id`, `configurable_product_id`, `is_default`) VALUES
(1, 24, 1, 1),
(2, 25, 1, 0),
(3, 26, 1, 0),
(4, 27, 1, 0),
(5, 28, 1, 0),
(6, 29, 2, 1),
(7, 30, 2, 0),
(8, 31, 2, 0),
(9, 32, 3, 1),
(10, 33, 3, 0),
(11, 34, 4, 1),
(12, 35, 4, 0),
(13, 36, 5, 1),
(14, 37, 5, 0),
(15, 38, 5, 0),
(16, 39, 5, 0),
(17, 40, 6, 1),
(18, 41, 6, 0),
(19, 42, 6, 0),
(20, 43, 7, 1),
(21, 44, 7, 0),
(22, 45, 8, 1),
(23, 46, 8, 0),
(24, 47, 9, 1),
(25, 48, 9, 0),
(26, 49, 9, 0),
(27, 50, 9, 0),
(28, 51, 10, 1),
(29, 52, 10, 0),
(30, 53, 10, 0),
(31, 54, 11, 1),
(32, 55, 11, 0),
(33, 56, 11, 0),
(34, 57, 12, 1),
(35, 58, 13, 1),
(36, 59, 13, 0),
(37, 60, 14, 1),
(38, 61, 14, 0),
(39, 62, 14, 0),
(40, 63, 15, 1),
(41, 64, 15, 0),
(42, 65, 15, 0),
(43, 66, 16, 1),
(44, 67, 16, 0),
(45, 68, 16, 0),
(46, 69, 17, 1),
(47, 70, 17, 0),
(48, 71, 17, 0),
(49, 72, 18, 1),
(50, 73, 18, 0),
(51, 74, 18, 0),
(52, 75, 19, 1),
(53, 76, 20, 1),
(54, 77, 20, 0),
(55, 78, 20, 0),
(56, 79, 21, 1),
(57, 80, 21, 0),
(58, 81, 21, 0),
(59, 82, 21, 0),
(60, 83, 22, 1),
(61, 84, 23, 1),
(62, 85, 23, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_variation_items`
--

CREATE TABLE `ec_product_variation_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_variation_items`
--

INSERT INTO `ec_product_variation_items` (`id`, `attribute_id`, `variation_id`) VALUES
(1, 2, 1),
(2, 7, 1),
(3, 1, 2),
(4, 9, 2),
(5, 4, 3),
(6, 9, 3),
(7, 1, 4),
(8, 9, 4),
(9, 4, 5),
(10, 10, 5),
(11, 4, 6),
(12, 8, 6),
(13, 2, 7),
(14, 6, 7),
(15, 3, 8),
(16, 9, 8),
(17, 4, 9),
(18, 10, 9),
(19, 1, 10),
(20, 7, 10),
(21, 3, 11),
(22, 10, 11),
(23, 4, 12),
(24, 8, 12),
(25, 1, 13),
(26, 9, 13),
(27, 4, 14),
(28, 9, 14),
(29, 4, 15),
(30, 8, 15),
(31, 1, 16),
(32, 8, 16),
(33, 1, 17),
(34, 10, 17),
(35, 5, 18),
(36, 8, 18),
(37, 3, 19),
(38, 9, 19),
(39, 5, 20),
(40, 10, 20),
(41, 4, 21),
(42, 8, 21),
(43, 3, 22),
(44, 6, 22),
(45, 2, 23),
(46, 10, 23),
(47, 1, 24),
(48, 7, 24),
(49, 2, 25),
(50, 8, 25),
(51, 5, 26),
(52, 6, 26),
(53, 1, 27),
(54, 10, 27),
(55, 3, 28),
(56, 8, 28),
(57, 4, 29),
(58, 10, 29),
(59, 2, 30),
(60, 8, 30),
(61, 5, 31),
(62, 8, 31),
(63, 5, 32),
(64, 8, 32),
(65, 3, 33),
(66, 8, 33),
(67, 4, 34),
(68, 7, 34),
(69, 2, 35),
(70, 9, 35),
(71, 2, 36),
(72, 6, 36),
(73, 4, 37),
(74, 10, 37),
(75, 2, 38),
(76, 8, 38),
(77, 3, 39),
(78, 6, 39),
(79, 1, 40),
(80, 8, 40),
(81, 2, 41),
(82, 7, 41),
(83, 4, 42),
(84, 9, 42),
(85, 5, 43),
(86, 10, 43),
(87, 5, 44),
(88, 9, 44),
(89, 1, 45),
(90, 9, 45),
(91, 1, 46),
(92, 7, 46),
(93, 1, 47),
(94, 8, 47),
(95, 1, 48),
(96, 7, 48),
(97, 5, 49),
(98, 8, 49),
(99, 2, 50),
(100, 8, 50),
(101, 5, 51),
(102, 7, 51),
(103, 2, 52),
(104, 6, 52),
(105, 2, 53),
(106, 7, 53),
(107, 5, 54),
(108, 6, 54),
(109, 1, 55),
(110, 8, 55),
(111, 2, 56),
(112, 6, 56),
(113, 2, 57),
(114, 8, 57),
(115, 4, 58),
(116, 8, 58),
(117, 5, 59),
(118, 10, 59),
(119, 5, 60),
(120, 9, 60),
(121, 4, 61),
(122, 8, 61),
(123, 5, 62),
(124, 8, 62);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_with_attribute`
--

CREATE TABLE `ec_product_with_attribute` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_with_attribute`
--

INSERT INTO `ec_product_with_attribute` (`id`, `attribute_id`, `product_id`) VALUES
(1, 1, 1),
(2, 8, 1),
(3, 4, 2),
(4, 8, 2),
(5, 4, 3),
(6, 7, 3),
(7, 4, 4),
(8, 7, 4),
(9, 3, 5),
(10, 8, 5),
(11, 1, 6),
(12, 9, 6),
(13, 1, 7),
(14, 10, 7),
(15, 5, 8),
(16, 10, 8),
(17, 3, 9),
(18, 6, 9),
(19, 5, 10),
(20, 6, 10),
(21, 1, 11),
(22, 8, 11),
(23, 3, 12),
(24, 10, 12),
(25, 5, 13),
(26, 6, 13),
(27, 3, 14),
(28, 8, 14),
(29, 5, 15),
(30, 7, 15),
(31, 4, 16),
(32, 10, 16),
(33, 3, 17),
(34, 8, 17),
(35, 4, 18),
(36, 9, 18),
(37, 2, 19),
(38, 6, 19),
(39, 2, 20),
(40, 7, 20),
(41, 4, 21),
(42, 8, 21),
(43, 1, 22),
(44, 10, 22),
(45, 3, 23),
(46, 6, 23);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_with_attribute_set`
--

CREATE TABLE `ec_product_with_attribute_set` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_with_attribute_set`
--

INSERT INTO `ec_product_with_attribute_set` (`id`, `attribute_set_id`, `product_id`, `order`) VALUES
(1, 1, 1, 0),
(2, 2, 1, 0),
(3, 1, 2, 0),
(4, 2, 2, 0),
(5, 1, 3, 0),
(6, 2, 3, 0),
(7, 1, 4, 0),
(8, 2, 4, 0),
(9, 1, 5, 0),
(10, 2, 5, 0),
(11, 1, 6, 0),
(12, 2, 6, 0),
(13, 1, 7, 0),
(14, 2, 7, 0),
(15, 1, 8, 0),
(16, 2, 8, 0),
(17, 1, 9, 0),
(18, 2, 9, 0),
(19, 1, 10, 0),
(20, 2, 10, 0),
(21, 1, 11, 0),
(22, 2, 11, 0),
(23, 1, 12, 0),
(24, 2, 12, 0),
(25, 1, 13, 0),
(26, 2, 13, 0),
(27, 1, 14, 0),
(28, 2, 14, 0),
(29, 1, 15, 0),
(30, 2, 15, 0),
(31, 1, 16, 0),
(32, 2, 16, 0),
(33, 1, 17, 0),
(34, 2, 17, 0),
(35, 1, 18, 0),
(36, 2, 18, 0),
(37, 1, 19, 0),
(38, 2, 19, 0),
(39, 1, 20, 0),
(40, 2, 20, 0),
(41, 1, 21, 0),
(42, 2, 21, 0),
(43, 1, 22, 0),
(44, 2, 22, 0),
(45, 1, 23, 0),
(46, 2, 23, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ec_reviews`
--

CREATE TABLE `ec_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `star` double(8,2) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_reviews`
--

INSERT INTO `ec_reviews` (`id`, `customer_id`, `product_id`, `star`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(1, 8, 79, 1.00, 'Quasi dolorem vitae repellat quia eligendi nam. Deleniti tempora aut est explicabo dolorem magni. Nulla tempora placeat et officia.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(2, 3, 34, 1.00, 'Perspiciatis quis aut perferendis beatae. Omnis illum quos quo vel itaque perspiciatis. Rerum consequuntur quaerat sapiente recusandae.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(3, 4, 47, 4.00, 'Nostrum atque vel voluptate distinctio. Fugit possimus qui a beatae. Amet ea eos distinctio velit autem expedita quos porro.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(4, 4, 73, 5.00, 'Voluptatem perferendis officia illo possimus odio unde. Animi officiis necessitatibus sed ut. Tenetur corrupti labore ut sit corrupti.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(5, 10, 37, 3.00, 'Quia dolorum aut perferendis. Quae repellat incidunt commodi velit non esse et. Quod consequatur vel omnis.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(6, 4, 11, 3.00, 'Et aut voluptatem quod blanditiis voluptate consequatur. Sint dolores laborum ipsam esse ullam.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(7, 5, 30, 2.00, 'Ut qui eum earum aliquid. Pariatur aspernatur ducimus dolores eum. Qui dolores cumque autem maiores consequatur enim. Sed blanditiis illo animi modi.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(8, 1, 39, 2.00, 'Qui commodi quis sequi velit. Voluptatem culpa nam quas esse deleniti consequatur laudantium. Ut amet qui in et.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(9, 7, 37, 3.00, 'Quia veniam ea omnis explicabo porro tenetur saepe. Ut facilis est eum. Quia facere ipsa quae non. Nobis at repellat velit est voluptate voluptatum.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(10, 10, 70, 2.00, 'Molestiae enim facere omnis qui aut in et. Quasi qui ipsum soluta cum. Ipsum qui velit dolores dolores iusto.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(11, 7, 60, 1.00, 'Numquam quisquam saepe quo aut. Voluptate distinctio error sed minus placeat labore. Unde nostrum nihil commodi est voluptatem nobis.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(12, 7, 25, 2.00, 'Voluptatem rem odit ut quibusdam voluptatem. Labore vel ut rerum. Quibusdam sequi qui quia sit.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(13, 9, 29, 3.00, 'Autem eveniet aut ratione sit odit. Ratione sunt qui officiis ipsa nobis ut.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(14, 10, 47, 4.00, 'Illum explicabo unde consequuntur eveniet. Aut et neque aut dolores perspiciatis excepturi. Culpa culpa doloribus sit blanditiis temporibus.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(15, 2, 73, 2.00, 'Nihil cumque ad est magni est. Et esse quia illo et aliquid expedita vel. Nobis aut eos aut.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(16, 9, 63, 1.00, 'Quo perferendis et rem amet velit. Consectetur odio rerum officia dolorem dolores. Commodi sunt aut non ex.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(17, 7, 60, 2.00, 'Ea et sint eveniet. Architecto doloremque ex recusandae aliquid dolores quod inventore.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(18, 10, 71, 3.00, 'Cupiditate repudiandae mollitia nihil velit et et recusandae ut. Saepe assumenda error aliquam praesentium. Consectetur rem ab aut consequatur.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(19, 8, 63, 3.00, 'Ut nobis aut aut optio corporis. Qui necessitatibus pariatur doloribus minima aut et. Nemo rerum qui sint eaque minus mollitia reiciendis quis.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(20, 1, 43, 1.00, 'Maiores autem laboriosam placeat qui facilis. Et maiores atque est porro qui aut aut.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(21, 2, 46, 1.00, 'Architecto fugiat magnam veniam eum aperiam id. Autem cumque qui et ratione earum.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(22, 7, 10, 1.00, 'Amet impedit doloremque quisquam possimus itaque vel praesentium. Aut et consequatur dicta. Animi ea et expedita expedita.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(23, 3, 68, 5.00, 'Aliquam non quod fugit quia. Aut ut dolores nihil a optio eum. Velit est id officiis omnis.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(24, 3, 35, 2.00, 'Aut minima porro rem nisi vel. Beatae id voluptas unde labore. Molestiae sed eum dolores adipisci.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(25, 5, 13, 4.00, 'Et fuga consectetur cum. Aut inventore nobis quia vel. Recusandae dignissimos non quis adipisci.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(26, 3, 13, 4.00, 'Incidunt quaerat nulla odit deleniti. Illum laborum quo quos quidem repellendus exercitationem est voluptatum.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(27, 10, 62, 1.00, 'Explicabo aspernatur beatae ut sed odit consequuntur. Ratione sunt non qui odit aut. Aliquam voluptatem voluptatem magni placeat delectus vel.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(28, 10, 13, 2.00, 'Provident voluptatem id quam nihil. Id consectetur magni porro assumenda. Molestiae rerum quas eos exercitationem.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(29, 6, 66, 1.00, 'Magnam at animi blanditiis repellendus debitis voluptatem. Magni dolorem autem temporibus quo laboriosam. Quis aut ut minus recusandae.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(30, 7, 3, 4.00, 'Ea rerum sunt commodi perferendis quo. Iste ipsa unde eligendi accusantium officia totam. Nihil odio nulla ut ut unde.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(31, 8, 68, 2.00, 'Impedit quo odit nemo ipsum. Velit atque doloremque molestiae. Quas sed recusandae vel optio laudantium cum.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(32, 3, 31, 1.00, 'Aut sed voluptatibus omnis facere. Et occaecati aliquam soluta in asperiores. Officiis voluptatem laborum magni architecto.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(33, 1, 12, 4.00, 'Odit ratione autem iste adipisci nihil. Incidunt et quia pariatur provident aut. Molestiae neque magni temporibus adipisci.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(34, 7, 83, 3.00, 'Fuga magnam sed aut. Neque non quia ut aut ut ut. Quos non in earum recusandae laudantium.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(35, 6, 24, 3.00, 'Sint corporis voluptate corrupti deleniti debitis asperiores consectetur. Eaque ratione tempora et debitis. Id velit et hic alias velit placeat eos.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(36, 8, 38, 5.00, 'Et ab provident qui fuga velit et eos excepturi. Est magni aut assumenda in. Odio et vero molestiae et aperiam voluptatibus iure.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(37, 7, 11, 1.00, 'Aut ut nam vero sed. Dolore inventore soluta explicabo labore ipsum nesciunt. Aspernatur sed dolor qui incidunt atque.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(38, 5, 74, 2.00, 'Quia voluptate voluptatem ad eaque. Eum ut est expedita maiores ut ullam aut est. Beatae omnis temporibus iure non rerum quia at consequatur.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(39, 6, 47, 1.00, 'Voluptatem aperiam quidem ducimus quis. Nihil et ea ea aut qui. Voluptate saepe ut rem nisi maxime nam illo dolor.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(40, 4, 53, 2.00, 'Repellat aliquam deleniti dolor. Aut natus minus non. Nemo mollitia non dolor.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(41, 1, 35, 5.00, 'Et quia recusandae optio vel perferendis aspernatur quas. Quibusdam quibusdam sint placeat in. Optio ad magni ab fuga.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(42, 4, 55, 3.00, 'Corporis rerum veritatis dolores. Aut iste iste alias. Officiis omnis aspernatur fuga. Illum est ipsum officiis laborum architecto eum quod.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(43, 5, 70, 2.00, 'Non architecto et excepturi. Molestias et est dolore temporibus illo. Illum ullam at alias voluptatum sit praesentium rem.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(44, 7, 14, 3.00, 'Aut non dolorem voluptates sed sed quam adipisci. Quas et perspiciatis commodi cupiditate molestiae. Quas cum sit eos eos molestiae.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(45, 10, 24, 2.00, 'Nihil quasi accusantium distinctio laboriosam vel quidem. Dolor sed et voluptas laboriosam repellat. Et assumenda et doloribus ipsum omnis et magnam.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(46, 2, 68, 1.00, 'Hic accusamus omnis molestiae eum velit. Non voluptatem expedita nisi est aut sed quod molestiae. Facilis placeat rerum soluta vero.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(47, 9, 38, 2.00, 'Quibusdam a est laborum sapiente sit ea dolor. Quas quod culpa reprehenderit voluptatem omnis veniam sequi. Enim ipsum illo aut et.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(48, 5, 50, 1.00, 'Voluptas sunt quia beatae error architecto. Ipsa minus qui voluptate. Alias hic dolor quia repellat sapiente.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(49, 8, 56, 2.00, 'Impedit consequatur quo quod neque illum molestiae. Nam blanditiis ipsa corrupti suscipit. Labore rerum qui eum fugiat cum cumque dolore.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(50, 10, 84, 3.00, 'Quaerat aperiam optio provident est quia quis dolores. Impedit nulla error ut dicta sed. Sit eos enim dolore cumque.', 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipments`
--

CREATE TABLE `ec_shipments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `weight` double(8,2) DEFAULT '0.00',
  `shipment_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cod_amount` decimal(15,2) DEFAULT '0.00',
  `cod_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cross_checking_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `price` decimal(15,2) DEFAULT '0.00',
  `store_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_shipments`
--

INSERT INTO `ec_shipments` (`id`, `order_id`, `user_id`, `weight`, `shipment_id`, `note`, `status`, `cod_amount`, `cod_status`, `cross_checking_status`, `price`, `store_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 2316.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(2, 2, NULL, 1563.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(3, 3, NULL, 2679.00, NULL, '', 'delivered', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(4, 4, NULL, 2990.00, NULL, '', 'delivered', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(5, 5, NULL, 603.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(6, 6, NULL, 3425.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(7, 7, NULL, 772.00, NULL, '', 'delivered', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(8, 8, NULL, 1563.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(9, 9, NULL, 2424.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(10, 10, NULL, 2226.00, NULL, '', 'delivered', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(11, 11, NULL, 1404.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(12, 12, NULL, 2367.00, NULL, '', 'delivered', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(13, 13, NULL, 4485.00, NULL, '', 'delivered', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(14, 14, NULL, 1809.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(15, 15, NULL, 1586.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(16, 16, NULL, 1484.00, NULL, '', 'delivered', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(17, 17, NULL, 702.00, NULL, '', 'delivered', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(18, 18, NULL, 1602.00, NULL, '', 'delivered', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(19, 19, NULL, 2679.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(20, 20, NULL, 663.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(21, 21, NULL, 2379.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(22, 22, NULL, 2980.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(23, 23, NULL, 663.00, NULL, '', 'delivered', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(24, 24, NULL, 847.00, NULL, '', 'delivered', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(25, 25, NULL, 1544.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(26, 26, NULL, 3669.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(27, 27, NULL, 533.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(28, 28, NULL, 1066.00, NULL, '', 'delivered', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(29, 29, NULL, 1616.00, NULL, '', 'delivered', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(30, 30, NULL, 2355.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(31, 31, NULL, 3388.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(32, 32, NULL, 2379.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(33, 33, NULL, 718.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(34, 34, NULL, 567.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(35, 35, NULL, 590.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(36, 36, NULL, 1044.00, NULL, '', 'delivered', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(37, 37, NULL, 772.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(38, 38, NULL, 1701.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(39, 39, NULL, 1544.00, NULL, '', 'delivered', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(40, 40, NULL, 1315.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(41, 41, NULL, 1586.00, NULL, '', 'delivered', '1793.40', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(42, 42, NULL, 534.00, NULL, '', 'delivered', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(43, 43, NULL, 2679.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(44, 44, NULL, 2607.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(45, 45, NULL, 1786.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(46, 46, NULL, 1484.00, NULL, '', 'delivered', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(47, 47, NULL, 1044.00, NULL, '', 'approved', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(48, 48, NULL, 1544.00, NULL, '', 'delivered', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(49, 49, NULL, 1602.00, NULL, '', 'delivered', '0.00', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(50, 50, NULL, 1326.00, NULL, '', 'delivered', '1509.90', 'completed', 'pending', '0.00', 0, '2021-08-21 01:52:27', '2021-08-21 01:52:27');

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipment_histories`
--

CREATE TABLE `ec_shipment_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `shipment_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_shipment_histories`
--

INSERT INTO `ec_shipment_histories` (`id`, `action`, `description`, `user_id`, `shipment_id`, `order_id`, `created_at`, `updated_at`) VALUES
(1, 'create_from_order', 'Shipping was created from order %order_id%', 0, 1, 1, '2021-08-12 17:52:26', '2021-08-12 17:52:26'),
(2, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 1, 1, '2021-08-19 09:52:26', '2021-08-21 01:52:26'),
(3, 'create_from_order', 'Shipping was created from order %order_id%', 0, 2, 2, '2021-08-07 17:52:26', '2021-08-07 17:52:26'),
(4, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 2, 2, '2021-08-19 09:52:26', '2021-08-21 01:52:26'),
(5, 'create_from_order', 'Shipping was created from order %order_id%', 0, 3, 3, '2021-08-14 17:52:26', '2021-08-14 17:52:26'),
(6, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 3, 3, '2021-08-19 11:52:26', '2021-08-21 01:52:26'),
(7, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 3, 3, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(8, 'create_from_order', 'Shipping was created from order %order_id%', 0, 4, 4, '2021-08-08 09:52:26', '2021-08-08 09:52:26'),
(9, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 4, 4, '2021-08-19 11:52:26', '2021-08-21 01:52:26'),
(10, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 4, 4, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(11, 'create_from_order', 'Shipping was created from order %order_id%', 0, 5, 5, '2021-08-11 13:52:26', '2021-08-11 13:52:26'),
(12, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 5, 5, '2021-08-19 11:52:26', '2021-08-21 01:52:26'),
(13, 'create_from_order', 'Shipping was created from order %order_id%', 0, 6, 6, '2021-08-19 13:52:26', '2021-08-19 13:52:26'),
(14, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 6, 6, '2021-08-19 13:52:26', '2021-08-21 01:52:26'),
(15, 'create_from_order', 'Shipping was created from order %order_id%', 0, 7, 7, '2021-08-12 01:52:26', '2021-08-12 01:52:26'),
(16, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 7, 7, '2021-08-19 13:52:26', '2021-08-21 01:52:26'),
(17, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 7, 7, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(18, 'create_from_order', 'Shipping was created from order %order_id%', 0, 8, 8, '2021-08-19 13:52:26', '2021-08-19 13:52:26'),
(19, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 8, 8, '2021-08-19 13:52:26', '2021-08-21 01:52:26'),
(20, 'create_from_order', 'Shipping was created from order %order_id%', 0, 9, 9, '2021-08-09 17:52:26', '2021-08-09 17:52:26'),
(21, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 9, 9, '2021-08-19 15:52:26', '2021-08-21 01:52:26'),
(22, 'create_from_order', 'Shipping was created from order %order_id%', 0, 10, 10, '2021-08-18 05:52:26', '2021-08-18 05:52:26'),
(23, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 10, 10, '2021-08-19 15:52:26', '2021-08-21 01:52:26'),
(24, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 10, 10, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(25, 'create_from_order', 'Shipping was created from order %order_id%', 0, 11, 11, '2021-08-13 23:52:26', '2021-08-13 23:52:26'),
(26, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 11, 11, '2021-08-19 15:52:26', '2021-08-21 01:52:26'),
(27, 'create_from_order', 'Shipping was created from order %order_id%', 0, 12, 12, '2021-08-09 17:52:26', '2021-08-09 17:52:26'),
(28, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 12, 12, '2021-08-19 15:52:26', '2021-08-21 01:52:26'),
(29, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 12, 12, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(30, 'create_from_order', 'Shipping was created from order %order_id%', 0, 13, 13, '2021-08-14 09:52:26', '2021-08-14 09:52:26'),
(31, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 13, 13, '2021-08-19 17:52:26', '2021-08-21 01:52:26'),
(32, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 13, 13, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(33, 'create_from_order', 'Shipping was created from order %order_id%', 0, 14, 14, '2021-08-19 17:52:26', '2021-08-19 17:52:26'),
(34, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 14, 14, '2021-08-19 17:52:26', '2021-08-21 01:52:26'),
(35, 'create_from_order', 'Shipping was created from order %order_id%', 0, 15, 15, '2021-08-13 13:52:26', '2021-08-13 13:52:26'),
(36, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 15, 15, '2021-08-19 19:52:26', '2021-08-21 01:52:26'),
(37, 'create_from_order', 'Shipping was created from order %order_id%', 0, 16, 16, '2021-08-17 07:52:26', '2021-08-17 07:52:26'),
(38, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 16, 16, '2021-08-19 19:52:26', '2021-08-21 01:52:26'),
(39, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 16, 16, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(40, 'create_from_order', 'Shipping was created from order %order_id%', 0, 17, 17, '2021-08-17 13:52:26', '2021-08-17 13:52:26'),
(41, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 17, 17, '2021-08-19 21:52:26', '2021-08-21 01:52:26'),
(42, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 17, 17, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(43, 'create_from_order', 'Shipping was created from order %order_id%', 0, 18, 18, '2021-08-14 01:52:26', '2021-08-14 01:52:26'),
(44, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 18, 18, '2021-08-19 21:52:26', '2021-08-21 01:52:26'),
(45, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 18, 18, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(46, 'create_from_order', 'Shipping was created from order %order_id%', 0, 19, 19, '2021-08-11 07:52:26', '2021-08-11 07:52:26'),
(47, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 19, 19, '2021-08-19 23:52:26', '2021-08-21 01:52:26'),
(48, 'create_from_order', 'Shipping was created from order %order_id%', 0, 20, 20, '2021-08-10 05:52:26', '2021-08-10 05:52:26'),
(49, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 20, 20, '2021-08-19 23:52:26', '2021-08-21 01:52:26'),
(50, 'create_from_order', 'Shipping was created from order %order_id%', 0, 21, 21, '2021-08-11 01:52:26', '2021-08-11 01:52:26'),
(51, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 21, 21, '2021-08-20 01:52:26', '2021-08-21 01:52:26'),
(52, 'create_from_order', 'Shipping was created from order %order_id%', 0, 22, 22, '2021-08-20 01:52:26', '2021-08-20 01:52:26'),
(53, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 22, 22, '2021-08-20 01:52:26', '2021-08-21 01:52:26'),
(54, 'create_from_order', 'Shipping was created from order %order_id%', 0, 23, 23, '2021-08-15 01:52:26', '2021-08-15 01:52:26'),
(55, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 23, 23, '2021-08-20 01:52:26', '2021-08-21 01:52:26'),
(56, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 23, 23, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(57, 'create_from_order', 'Shipping was created from order %order_id%', 0, 24, 24, '2021-08-14 15:52:26', '2021-08-14 15:52:26'),
(58, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 24, 24, '2021-08-20 03:52:26', '2021-08-21 01:52:26'),
(59, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 24, 24, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(60, 'create_from_order', 'Shipping was created from order %order_id%', 0, 25, 25, '2021-08-16 11:52:26', '2021-08-16 11:52:26'),
(61, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 25, 25, '2021-08-20 03:52:26', '2021-08-21 01:52:26'),
(62, 'create_from_order', 'Shipping was created from order %order_id%', 0, 26, 26, '2021-08-13 13:52:26', '2021-08-13 13:52:26'),
(63, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 26, 26, '2021-08-20 05:52:26', '2021-08-21 01:52:26'),
(64, 'create_from_order', 'Shipping was created from order %order_id%', 0, 27, 27, '2021-08-20 05:52:26', '2021-08-20 05:52:26'),
(65, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 27, 27, '2021-08-20 05:52:26', '2021-08-21 01:52:26'),
(66, 'create_from_order', 'Shipping was created from order %order_id%', 0, 28, 28, '2021-08-19 13:52:26', '2021-08-19 13:52:26'),
(67, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 28, 28, '2021-08-20 07:52:26', '2021-08-21 01:52:26'),
(68, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 28, 28, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(69, 'create_from_order', 'Shipping was created from order %order_id%', 0, 29, 29, '2021-08-17 07:52:26', '2021-08-17 07:52:26'),
(70, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 29, 29, '2021-08-20 07:52:26', '2021-08-21 01:52:26'),
(71, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 29, 29, '2021-08-21 01:52:26', '2021-08-21 01:52:26'),
(72, 'create_from_order', 'Shipping was created from order %order_id%', 0, 30, 30, '2021-08-18 19:52:26', '2021-08-18 19:52:26'),
(73, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 30, 30, '2021-08-20 07:52:26', '2021-08-21 01:52:26'),
(74, 'create_from_order', 'Shipping was created from order %order_id%', 0, 31, 31, '2021-08-18 09:52:26', '2021-08-18 09:52:26'),
(75, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 31, 31, '2021-08-20 09:52:26', '2021-08-21 01:52:26'),
(76, 'create_from_order', 'Shipping was created from order %order_id%', 0, 32, 32, '2021-08-18 09:52:26', '2021-08-18 09:52:26'),
(77, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 32, 32, '2021-08-20 09:52:26', '2021-08-21 01:52:26'),
(78, 'create_from_order', 'Shipping was created from order %order_id%', 0, 33, 33, '2021-08-16 09:52:26', '2021-08-16 09:52:26'),
(79, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 33, 33, '2021-08-20 09:52:26', '2021-08-21 01:52:26'),
(80, 'create_from_order', 'Shipping was created from order %order_id%', 0, 34, 34, '2021-08-17 13:52:26', '2021-08-17 13:52:26'),
(81, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 34, 34, '2021-08-20 11:52:26', '2021-08-21 01:52:26'),
(82, 'create_from_order', 'Shipping was created from order %order_id%', 0, 35, 35, '2021-08-16 23:52:26', '2021-08-16 23:52:26'),
(83, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 35, 35, '2021-08-20 11:52:26', '2021-08-21 01:52:26'),
(84, 'create_from_order', 'Shipping was created from order %order_id%', 0, 36, 36, '2021-08-18 03:52:27', '2021-08-18 03:52:27'),
(85, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 36, 36, '2021-08-20 11:52:27', '2021-08-21 01:52:27'),
(86, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 36, 36, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(87, 'create_from_order', 'Shipping was created from order %order_id%', 0, 37, 37, '2021-08-15 05:52:27', '2021-08-15 05:52:27'),
(88, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 37, 37, '2021-08-20 11:52:27', '2021-08-21 01:52:27'),
(89, 'create_from_order', 'Shipping was created from order %order_id%', 0, 38, 38, '2021-08-18 01:52:27', '2021-08-18 01:52:27'),
(90, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 38, 38, '2021-08-20 13:52:27', '2021-08-21 01:52:27'),
(91, 'create_from_order', 'Shipping was created from order %order_id%', 0, 39, 39, '2021-08-19 13:52:27', '2021-08-19 13:52:27'),
(92, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 39, 39, '2021-08-20 13:52:27', '2021-08-21 01:52:27'),
(93, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 39, 39, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(94, 'create_from_order', 'Shipping was created from order %order_id%', 0, 40, 40, '2021-08-19 19:52:27', '2021-08-19 19:52:27'),
(95, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 40, 40, '2021-08-20 15:52:27', '2021-08-21 01:52:27'),
(96, 'create_from_order', 'Shipping was created from order %order_id%', 0, 41, 41, '2021-08-20 01:52:27', '2021-08-20 01:52:27'),
(97, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 41, 41, '2021-08-20 17:52:27', '2021-08-21 01:52:27'),
(98, 'update_cod_status', 'Updated COD status to Completed . Updated by: %user_name%', 0, 41, 41, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(99, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 41, 41, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(100, 'create_from_order', 'Shipping was created from order %order_id%', 0, 42, 42, '2021-08-19 17:52:27', '2021-08-19 17:52:27'),
(101, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 42, 42, '2021-08-20 17:52:27', '2021-08-21 01:52:27'),
(102, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 42, 42, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(103, 'create_from_order', 'Shipping was created from order %order_id%', 0, 43, 43, '2021-08-19 07:52:27', '2021-08-19 07:52:27'),
(104, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 43, 43, '2021-08-20 19:52:27', '2021-08-21 01:52:27'),
(105, 'create_from_order', 'Shipping was created from order %order_id%', 0, 44, 44, '2021-08-20 19:52:27', '2021-08-20 19:52:27'),
(106, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 44, 44, '2021-08-20 19:52:27', '2021-08-21 01:52:27'),
(107, 'create_from_order', 'Shipping was created from order %order_id%', 0, 45, 45, '2021-08-19 13:52:27', '2021-08-19 13:52:27'),
(108, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 45, 45, '2021-08-20 21:52:27', '2021-08-21 01:52:27'),
(109, 'create_from_order', 'Shipping was created from order %order_id%', 0, 46, 46, '2021-08-20 13:52:27', '2021-08-20 13:52:27'),
(110, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 46, 46, '2021-08-20 21:52:27', '2021-08-21 01:52:27'),
(111, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 46, 46, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(112, 'create_from_order', 'Shipping was created from order %order_id%', 0, 47, 47, '2021-08-20 15:52:27', '2021-08-20 15:52:27'),
(113, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 47, 47, '2021-08-20 23:52:27', '2021-08-21 01:52:27'),
(114, 'create_from_order', 'Shipping was created from order %order_id%', 0, 48, 48, '2021-08-20 17:52:27', '2021-08-20 17:52:27'),
(115, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 48, 48, '2021-08-20 23:52:27', '2021-08-21 01:52:27'),
(116, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 48, 48, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(117, 'create_from_order', 'Shipping was created from order %order_id%', 0, 49, 49, '2021-08-20 13:52:27', '2021-08-20 13:52:27'),
(118, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 49, 49, '2021-08-20 23:52:27', '2021-08-21 01:52:27'),
(119, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 49, 49, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(120, 'create_from_order', 'Shipping was created from order %order_id%', 0, 50, 50, '2021-08-20 15:52:27', '2021-08-20 15:52:27'),
(121, 'update_status', 'Changed status of shipping to : Approved . Updated by: %user_name%', 0, 50, 50, '2021-08-20 23:52:27', '2021-08-21 01:52:27'),
(122, 'update_cod_status', 'Updated COD status to Completed . Updated by: %user_name%', 0, 50, 50, '2021-08-21 01:52:27', '2021-08-21 01:52:27'),
(123, 'update_status', 'Changed status of shipping to : Delivered . Updated by: %user_name%', 0, 50, 50, '2021-08-21 01:52:27', '2021-08-21 01:52:27');

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipping`
--

CREATE TABLE `ec_shipping` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_shipping`
--

INSERT INTO `ec_shipping` (`id`, `title`, `country`, `created_at`, `updated_at`) VALUES
(1, 'All', NULL, '2021-08-21 01:52:15', '2021-08-21 01:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipping_rules`
--

CREATE TABLE `ec_shipping_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_id` int(10) UNSIGNED NOT NULL,
  `type` enum('base_on_price','base_on_weight') COLLATE utf8mb4_unicode_ci DEFAULT 'base_on_price',
  `from` decimal(15,2) DEFAULT '0.00',
  `to` decimal(15,2) DEFAULT '0.00',
  `price` decimal(15,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_shipping_rules`
--

INSERT INTO `ec_shipping_rules` (`id`, `name`, `shipping_id`, `type`, `from`, `to`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Delivery', 1, 'base_on_price', '0.00', NULL, '0.00', '2021-08-21 01:52:15', '2021-08-21 01:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipping_rule_items`
--

CREATE TABLE `ec_shipping_rule_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shipping_rule_id` int(10) UNSIGNED NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_price` decimal(15,2) DEFAULT '0.00',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_store_locators`
--

CREATE TABLE `ec_store_locators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT '0',
  `is_shipping_location` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_store_locators`
--

INSERT INTO `ec_store_locators` (`id`, `name`, `email`, `phone`, `address`, `country`, `state`, `city`, `is_primary`, `is_shipping_location`, `created_at`, `updated_at`) VALUES
(1, 'Martfury', 'sales@botble.com', '1800979769', '502 New Street', 'AU', 'Brighton VIC', 'Brighton VIC', 1, 1, '2021-08-21 01:52:22', '2021-08-21 01:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `ec_taxes`
--

CREATE TABLE `ec_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` double(8,6) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_taxes`
--

INSERT INTO `ec_taxes` (`id`, `title`, `percentage`, `priority`, `status`, `created_at`, `updated_at`) VALUES
(1, 'VAT', 10.000000, 1, 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(2, 'None', 0.000000, 2, 'published', '2021-08-21 01:52:15', '2021-08-21 01:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `ec_wish_lists`
--

CREATE TABLE `ec_wish_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'What Shipping Methods Are Available?', 'Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.', 1, 'published', '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(2, 'Do You Ship Internationally?', 'Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.', 1, 'published', '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(3, 'How Long Will It Take To Get My Package?', 'Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.', 1, 'published', '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(4, 'What Payment Methods Are Accepted?', 'Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.', 2, 'published', '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(5, 'Is Buying On-Line Safe?', 'Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.', 2, 'published', '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(6, 'How do I place an Order?', 'Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb Odd Future seitan normcore. Master cleanse American Apparel gentrify flexitarian beard slow-carb next level. Raw denim polaroid paleo farm-to-table, put a bird on it lo-fi tattooed Wes Anderson Pinterest letterpress. Fingerstache McSweeney’s pour-over, letterpress Schlitz photo booth master cleanse bespoke hashtag chillwave gentrify.', 3, 'published', '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(7, 'How Can I Cancel Or Change My Order?', 'Plaid letterpress leggings craft beer meh ethical Pinterest. Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth.', 3, 'published', '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(8, 'Do I need an account to place an order?', 'Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY. Cray ugh 3 wolf moon fap, fashion axe irony butcher cornhole typewriter chambray VHS banjo street art.', 3, 'published', '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(9, 'How Do I Track My Order?', 'Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb @Odd Future seitan normcore. Master cleanse American Apparel gentrify flexitarian beard slow-carb next level.', 3, 'published', '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(10, 'How Can I Return a Product?', 'Kale chips Truffaut Williamsburg, hashtag fixie Pinterest raw denim c hambray drinking vinegar Carles street art Bushwick gastropub. Wolf Tumblr paleo church-key. Plaid food truck Echo Park YOLO bitters hella, direct trade Thundercats leggings quinoa before they sold out. You probably haven’t heard of them wayfarers authentic umami drinking vinegar Pinterest Cosby sweater, fingerstache fap High Life.', 3, 'published', '2021-08-21 01:52:22', '2021-08-21 01:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `name`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'SHIPPING', 0, 'published', '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(2, 'PAYMENT', 1, 'published', '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(3, 'Order & Returns', 2, 'published', '2021-08-21 01:52:22', '2021-08-21 01:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
--

CREATE TABLE `media_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_files`
--

INSERT INTO `media_files` (`id`, `user_id`, `name`, `folder_id`, `mime_type`, `size`, `url`, `options`, `created_at`, `updated_at`, `deleted_at`) VALUES
(245, 0, '1', 17, 'image/jpeg', 2200, 'brands/1.jpg', '[]', '2021-08-21 01:51:49', '2021-08-21 01:51:49', NULL),
(246, 0, '2', 17, 'image/jpeg', 2685, 'brands/2.jpg', '[]', '2021-08-21 01:51:49', '2021-08-21 01:51:49', NULL),
(247, 0, '3', 17, 'image/jpeg', 2311, 'brands/3.jpg', '[]', '2021-08-21 01:51:49', '2021-08-21 01:51:49', NULL),
(248, 0, '4', 17, 'image/jpeg', 2374, 'brands/4.jpg', '[]', '2021-08-21 01:51:49', '2021-08-21 01:51:49', NULL),
(249, 0, '5', 17, 'image/jpeg', 1927, 'brands/5.jpg', '[]', '2021-08-21 01:51:50', '2021-08-21 01:51:50', NULL),
(250, 0, '6', 17, 'image/jpeg', 2519, 'brands/6.jpg', '[]', '2021-08-21 01:51:50', '2021-08-21 01:51:50', NULL),
(251, 0, '7', 17, 'image/jpeg', 3043, 'brands/7.jpg', '[]', '2021-08-21 01:51:50', '2021-08-21 01:51:50', NULL),
(252, 0, '1', 18, 'image/jpeg', 5173, 'product-categories/1.jpg', '[]', '2021-08-21 01:51:50', '2021-08-21 01:51:50', NULL),
(253, 0, '2', 18, 'image/jpeg', 7355, 'product-categories/2.jpg', '[]', '2021-08-21 01:51:50', '2021-08-21 01:51:50', NULL),
(254, 0, '3', 18, 'image/jpeg', 4427, 'product-categories/3.jpg', '[]', '2021-08-21 01:51:50', '2021-08-21 01:51:50', NULL),
(255, 0, '4', 18, 'image/jpeg', 2963, 'product-categories/4.jpg', '[]', '2021-08-21 01:51:50', '2021-08-21 01:51:50', NULL),
(256, 0, '5', 18, 'image/jpeg', 5016, 'product-categories/5.jpg', '[]', '2021-08-21 01:51:50', '2021-08-21 01:51:50', NULL),
(257, 0, '6', 18, 'image/jpeg', 4101, 'product-categories/6.jpg', '[]', '2021-08-21 01:51:50', '2021-08-21 01:51:50', NULL),
(258, 0, '7', 18, 'image/jpeg', 2576, 'product-categories/7.jpg', '[]', '2021-08-21 01:51:51', '2021-08-21 01:51:51', NULL),
(259, 0, '8', 18, 'image/jpeg', 4670, 'product-categories/8.jpg', '[]', '2021-08-21 01:51:51', '2021-08-21 01:51:51', NULL),
(260, 0, '1', 19, 'image/jpeg', 4911, 'products/1.jpg', '[]', '2021-08-21 01:51:51', '2021-08-21 01:51:51', NULL),
(261, 0, '10-1', 19, 'image/jpeg', 120755, 'products/10-1.jpg', '[]', '2021-08-21 01:51:51', '2021-08-21 01:51:51', NULL),
(262, 0, '10-2', 19, 'image/jpeg', 148563, 'products/10-2.jpg', '[]', '2021-08-21 01:51:52', '2021-08-21 01:51:52', NULL),
(263, 0, '10', 19, 'image/jpeg', 11176, 'products/10.jpg', '[]', '2021-08-21 01:51:52', '2021-08-21 01:51:52', NULL),
(264, 0, '11-1', 19, 'image/jpeg', 13706, 'products/11-1.jpg', '[]', '2021-08-21 01:51:52', '2021-08-21 01:51:52', NULL),
(265, 0, '11-2', 19, 'image/jpeg', 16809, 'products/11-2.jpg', '[]', '2021-08-21 01:51:52', '2021-08-21 01:51:52', NULL),
(266, 0, '11-3', 19, 'image/jpeg', 23991, 'products/11-3.jpg', '[]', '2021-08-21 01:51:52', '2021-08-21 01:51:52', NULL),
(267, 0, '11', 19, 'image/jpeg', 8234, 'products/11.jpg', '[]', '2021-08-21 01:51:53', '2021-08-21 01:51:53', NULL),
(268, 0, '12-1', 19, 'image/jpeg', 47775, 'products/12-1.jpg', '[]', '2021-08-21 01:51:53', '2021-08-21 01:51:53', NULL),
(269, 0, '12-2', 19, 'image/jpeg', 52722, 'products/12-2.jpg', '[]', '2021-08-21 01:51:53', '2021-08-21 01:51:53', NULL),
(270, 0, '12-3', 19, 'image/jpeg', 57295, 'products/12-3.jpg', '[]', '2021-08-21 01:51:54', '2021-08-21 01:51:54', NULL),
(271, 0, '12', 19, 'image/jpeg', 9642, 'products/12.jpg', '[]', '2021-08-21 01:51:54', '2021-08-21 01:51:54', NULL),
(272, 0, '13-1', 19, 'image/jpeg', 7494, 'products/13-1.jpg', '[]', '2021-08-21 01:51:54', '2021-08-21 01:51:54', NULL),
(273, 0, '13', 19, 'image/jpeg', 7266, 'products/13.jpg', '[]', '2021-08-21 01:51:54', '2021-08-21 01:51:54', NULL),
(274, 0, '14', 19, 'image/jpeg', 6626, 'products/14.jpg', '[]', '2021-08-21 01:51:54', '2021-08-21 01:51:54', NULL),
(275, 0, '15-1', 19, 'image/jpeg', 9014, 'products/15-1.jpg', '[]', '2021-08-21 01:51:54', '2021-08-21 01:51:54', NULL),
(276, 0, '15', 19, 'image/jpeg', 6629, 'products/15.jpg', '[]', '2021-08-21 01:51:55', '2021-08-21 01:51:55', NULL),
(277, 0, '16', 19, 'image/jpeg', 8558, 'products/16.jpg', '[]', '2021-08-21 01:51:55', '2021-08-21 01:51:55', NULL),
(278, 0, '17-1', 19, 'image/jpeg', 63248, 'products/17-1.jpg', '[]', '2021-08-21 01:51:55', '2021-08-21 01:51:55', NULL),
(279, 0, '17-2', 19, 'image/jpeg', 71404, 'products/17-2.jpg', '[]', '2021-08-21 01:51:55', '2021-08-21 01:51:55', NULL),
(280, 0, '17-3', 19, 'image/jpeg', 58949, 'products/17-3.jpg', '[]', '2021-08-21 01:51:56', '2021-08-21 01:51:56', NULL),
(281, 0, '17', 19, 'image/jpeg', 7050, 'products/17.jpg', '[]', '2021-08-21 01:51:56', '2021-08-21 01:51:56', NULL),
(282, 0, '18-1', 19, 'image/jpeg', 527022, 'products/18-1.jpg', '[]', '2021-08-21 01:51:56', '2021-08-21 01:51:56', NULL),
(283, 0, '18-2', 19, 'image/jpeg', 43849, 'products/18-2.jpg', '[]', '2021-08-21 01:51:57', '2021-08-21 01:51:57', NULL),
(284, 0, '18-3', 19, 'image/jpeg', 63876, 'products/18-3.jpg', '[]', '2021-08-21 01:51:57', '2021-08-21 01:51:57', NULL),
(285, 0, '18', 19, 'image/jpeg', 61587, 'products/18.jpg', '[]', '2021-08-21 01:51:57', '2021-08-21 01:51:57', NULL),
(286, 0, '19-1', 19, 'image/jpeg', 23166, 'products/19-1.jpg', '[]', '2021-08-21 01:51:57', '2021-08-21 01:51:57', NULL),
(287, 0, '19-2', 19, 'image/jpeg', 12306, 'products/19-2.jpg', '[]', '2021-08-21 01:51:58', '2021-08-21 01:51:58', NULL),
(288, 0, '19-3', 19, 'image/jpeg', 51458, 'products/19-3.jpg', '[]', '2021-08-21 01:51:58', '2021-08-21 01:51:58', NULL),
(289, 0, '19', 19, 'image/jpeg', 227872, 'products/19.jpg', '[]', '2021-08-21 01:51:58', '2021-08-21 01:51:58', NULL),
(290, 0, '2-1', 19, 'image/jpeg', 85522, 'products/2-1.jpg', '[]', '2021-08-21 01:51:58', '2021-08-21 01:51:58', NULL),
(291, 0, '2-2', 19, 'image/jpeg', 122423, 'products/2-2.jpg', '[]', '2021-08-21 01:51:59', '2021-08-21 01:51:59', NULL),
(292, 0, '2-3', 19, 'image/jpeg', 61996, 'products/2-3.jpg', '[]', '2021-08-21 01:51:59', '2021-08-21 01:51:59', NULL),
(293, 0, '2', 19, 'image/jpeg', 10832, 'products/2.jpg', '[]', '2021-08-21 01:51:59', '2021-08-21 01:51:59', NULL),
(294, 0, '20-1', 19, 'image/jpeg', 108013, 'products/20-1.jpg', '[]', '2021-08-21 01:52:00', '2021-08-21 01:52:00', NULL),
(295, 0, '20-2', 19, 'image/jpeg', 107598, 'products/20-2.jpg', '[]', '2021-08-21 01:52:00', '2021-08-21 01:52:00', NULL),
(296, 0, '20-3', 19, 'image/jpeg', 31959, 'products/20-3.jpg', '[]', '2021-08-21 01:52:00', '2021-08-21 01:52:00', NULL),
(297, 0, '20', 19, 'image/jpeg', 12798, 'products/20.jpg', '[]', '2021-08-21 01:52:01', '2021-08-21 01:52:01', NULL),
(298, 0, '21-1', 19, 'image/jpeg', 92022, 'products/21-1.jpg', '[]', '2021-08-21 01:52:01', '2021-08-21 01:52:01', NULL),
(299, 0, '21-2', 19, 'image/jpeg', 73796, 'products/21-2.jpg', '[]', '2021-08-21 01:52:01', '2021-08-21 01:52:01', NULL),
(300, 0, '21', 19, 'image/jpeg', 72410, 'products/21.jpg', '[]', '2021-08-21 01:52:02', '2021-08-21 01:52:02', NULL),
(301, 0, '22-1', 19, 'image/jpeg', 50174, 'products/22-1.jpg', '[]', '2021-08-21 01:52:02', '2021-08-21 01:52:02', NULL),
(302, 0, '22-2', 19, 'image/jpeg', 63267, 'products/22-2.jpg', '[]', '2021-08-21 01:52:02', '2021-08-21 01:52:02', NULL),
(303, 0, '22-3', 19, 'image/jpeg', 125017, 'products/22-3.jpg', '[]', '2021-08-21 01:52:03', '2021-08-21 01:52:03', NULL),
(304, 0, '22', 19, 'image/jpeg', 88636, 'products/22.jpg', '[]', '2021-08-21 01:52:03', '2021-08-21 01:52:03', NULL),
(305, 0, '23-1', 19, 'image/jpeg', 64117, 'products/23-1.jpg', '[]', '2021-08-21 01:52:04', '2021-08-21 01:52:04', NULL),
(306, 0, '23-2', 19, 'image/jpeg', 96786, 'products/23-2.jpg', '[]', '2021-08-21 01:52:04', '2021-08-21 01:52:04', NULL),
(307, 0, '23-3', 19, 'image/jpeg', 46477, 'products/23-3.jpg', '[]', '2021-08-21 01:52:05', '2021-08-21 01:52:05', NULL),
(308, 0, '23', 19, 'image/jpeg', 68142, 'products/23.jpg', '[]', '2021-08-21 01:52:05', '2021-08-21 01:52:05', NULL),
(309, 0, '3', 19, 'image/jpeg', 8388, 'products/3.jpg', '[]', '2021-08-21 01:52:05', '2021-08-21 01:52:05', NULL),
(310, 0, '4-1', 19, 'image/jpeg', 39071, 'products/4-1.jpg', '[]', '2021-08-21 01:52:06', '2021-08-21 01:52:06', NULL),
(311, 0, '4-2', 19, 'image/jpeg', 35982, 'products/4-2.jpg', '[]', '2021-08-21 01:52:06', '2021-08-21 01:52:06', NULL),
(312, 0, '4-3', 19, 'image/jpeg', 62867, 'products/4-3.jpg', '[]', '2021-08-21 01:52:06', '2021-08-21 01:52:06', NULL),
(313, 0, '4', 19, 'image/jpeg', 5547, 'products/4.jpg', '[]', '2021-08-21 01:52:07', '2021-08-21 01:52:07', NULL),
(314, 0, '5-1', 19, 'image/jpeg', 72383, 'products/5-1.jpg', '[]', '2021-08-21 01:52:07', '2021-08-21 01:52:07', NULL),
(315, 0, '5-2', 19, 'image/jpeg', 108591, 'products/5-2.jpg', '[]', '2021-08-21 01:52:07', '2021-08-21 01:52:07', NULL),
(316, 0, '5-3', 19, 'image/jpeg', 63741, 'products/5-3.jpg', '[]', '2021-08-21 01:52:08', '2021-08-21 01:52:08', NULL),
(317, 0, '5', 19, 'image/jpeg', 98052, 'products/5.jpg', '[]', '2021-08-21 01:52:08', '2021-08-21 01:52:08', NULL),
(318, 0, '6', 19, 'image/jpeg', 10944, 'products/6.jpg', '[]', '2021-08-21 01:52:08', '2021-08-21 01:52:08', NULL),
(319, 0, '7', 19, 'image/jpeg', 10160, 'products/7.jpg', '[]', '2021-08-21 01:52:09', '2021-08-21 01:52:09', NULL),
(320, 0, '8-1', 19, 'image/jpeg', 9986, 'products/8-1.jpg', '[]', '2021-08-21 01:52:09', '2021-08-21 01:52:09', NULL),
(321, 0, '8-2', 19, 'image/jpeg', 8132, 'products/8-2.jpg', '[]', '2021-08-21 01:52:09', '2021-08-21 01:52:09', NULL),
(322, 0, '8-3', 19, 'image/jpeg', 7867, 'products/8-3.jpg', '[]', '2021-08-21 01:52:09', '2021-08-21 01:52:09', NULL),
(323, 0, '8', 19, 'image/jpeg', 10459, 'products/8.jpg', '[]', '2021-08-21 01:52:09', '2021-08-21 01:52:09', NULL),
(324, 0, '9-1', 19, 'image/jpeg', 623616, 'products/9-1.jpg', '[]', '2021-08-21 01:52:09', '2021-08-21 01:52:09', NULL),
(325, 0, '9-2', 19, 'image/jpeg', 647454, 'products/9-2.jpg', '[]', '2021-08-21 01:52:10', '2021-08-21 01:52:10', NULL),
(326, 0, '9', 19, 'image/jpeg', 16733, 'products/9.jpg', '[]', '2021-08-21 01:52:10', '2021-08-21 01:52:10', NULL),
(327, 0, '1', 20, 'image/jpeg', 11752, 'customers/1.jpg', '[]', '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL),
(328, 0, '10', 20, 'image/jpeg', 27814, 'customers/10.jpg', '[]', '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL),
(329, 0, '2', 20, 'image/jpeg', 19005, 'customers/2.jpg', '[]', '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL),
(330, 0, '3', 20, 'image/jpeg', 20400, 'customers/3.jpg', '[]', '2021-08-21 01:52:12', '2021-08-21 01:52:12', NULL),
(331, 0, '4', 20, 'image/jpeg', 26819, 'customers/4.jpg', '[]', '2021-08-21 01:52:12', '2021-08-21 01:52:12', NULL),
(332, 0, '5', 20, 'image/jpeg', 14367, 'customers/5.jpg', '[]', '2021-08-21 01:52:12', '2021-08-21 01:52:12', NULL),
(333, 0, '6', 20, 'image/jpeg', 12367, 'customers/6.jpg', '[]', '2021-08-21 01:52:12', '2021-08-21 01:52:12', NULL),
(334, 0, '7', 20, 'image/jpeg', 20652, 'customers/7.jpg', '[]', '2021-08-21 01:52:12', '2021-08-21 01:52:12', NULL),
(335, 0, '8', 20, 'image/jpeg', 21164, 'customers/8.jpg', '[]', '2021-08-21 01:52:12', '2021-08-21 01:52:12', NULL),
(336, 0, '9', 20, 'image/jpeg', 6084, 'customers/9.jpg', '[]', '2021-08-21 01:52:12', '2021-08-21 01:52:12', NULL),
(337, 0, '1', 21, 'image/jpeg', 532819, 'news/1.jpg', '[]', '2021-08-21 01:52:15', '2021-08-21 01:52:15', NULL),
(338, 0, '2', 21, 'image/jpeg', 553729, 'news/2.jpg', '[]', '2021-08-21 01:52:16', '2021-08-21 01:52:16', NULL),
(339, 0, '3', 21, 'image/jpeg', 522223, 'news/3.jpg', '[]', '2021-08-21 01:52:16', '2021-08-21 01:52:16', NULL),
(340, 0, '4', 21, 'image/jpeg', 910908, 'news/4.jpg', '[]', '2021-08-21 01:52:17', '2021-08-21 01:52:17', NULL),
(341, 0, '5', 21, 'image/jpeg', 666561, 'news/5.jpg', '[]', '2021-08-21 01:52:17', '2021-08-21 01:52:17', NULL),
(342, 0, '6', 21, 'image/jpeg', 431929, 'news/6.jpg', '[]', '2021-08-21 01:52:18', '2021-08-21 01:52:18', NULL),
(343, 0, '7', 21, 'image/jpeg', 568268, 'news/7.jpg', '[]', '2021-08-21 01:52:18', '2021-08-21 01:52:18', NULL),
(344, 0, '1', 22, 'image/jpeg', 139880, 'sliders/1.jpg', '[]', '2021-08-21 01:52:19', '2021-08-21 01:52:19', NULL),
(345, 0, '2', 22, 'image/jpeg', 85128, 'sliders/2.jpg', '[]', '2021-08-21 01:52:19', '2021-08-21 01:52:19', NULL),
(346, 0, '3', 22, 'image/jpeg', 85668, 'sliders/3.jpg', '[]', '2021-08-21 01:52:19', '2021-08-21 01:52:19', NULL),
(347, 0, '1', 23, 'image/jpeg', 56015, 'promotion/1.jpg', '[]', '2021-08-21 01:52:20', '2021-08-21 01:52:20', NULL),
(348, 0, '2', 23, 'image/jpeg', 39964, 'promotion/2.jpg', '[]', '2021-08-21 01:52:20', '2021-08-21 01:52:20', NULL),
(349, 0, '3', 23, 'image/jpeg', 71948, 'promotion/3.jpg', '[]', '2021-08-21 01:52:20', '2021-08-21 01:52:20', NULL),
(350, 0, '4', 23, 'image/jpeg', 94590, 'promotion/4.jpg', '[]', '2021-08-21 01:52:20', '2021-08-21 01:52:20', NULL),
(351, 0, '5', 23, 'image/jpeg', 96153, 'promotion/5.jpg', '[]', '2021-08-21 01:52:21', '2021-08-21 01:52:21', NULL),
(352, 0, '6', 23, 'image/jpeg', 160910, 'promotion/6.jpg', '[]', '2021-08-21 01:52:21', '2021-08-21 01:52:21', NULL),
(353, 0, '7', 23, 'image/jpeg', 59044, 'promotion/7.jpg', '[]', '2021-08-21 01:52:21', '2021-08-21 01:52:21', NULL),
(354, 0, '8', 23, 'image/jpeg', 39964, 'promotion/8.jpg', '[]', '2021-08-21 01:52:21', '2021-08-21 01:52:21', NULL),
(355, 0, '9', 23, 'image/jpeg', 54865, 'promotion/9.jpg', '[]', '2021-08-21 01:52:21', '2021-08-21 01:52:21', NULL),
(356, 0, 'app', 24, 'image/png', 88771, 'general/app.png', '[]', '2021-08-21 01:52:22', '2021-08-21 01:52:22', NULL),
(357, 0, 'coming-soon', 24, 'image/jpeg', 83359, 'general/coming-soon.jpg', '[]', '2021-08-21 01:52:22', '2021-08-21 01:52:22', NULL),
(358, 0, 'favicon', 24, 'image/png', 5147, 'general/favicon.png', '[]', '2021-08-21 01:52:23', '2021-08-21 01:52:23', NULL),
(359, 0, 'logo-dark', 24, 'image/png', 906, 'general/logo-dark.png', '[]', '2021-08-21 01:52:23', '2021-08-21 01:52:23', NULL),
(360, 0, 'logo-light', 24, 'image/png', 1430, 'general/logo-light.png', '[]', '2021-08-21 01:52:23', '2021-08-21 01:52:23', NULL),
(361, 0, 'logo', 24, 'image/png', 892, 'general/logo.png', '[]', '2021-08-21 01:52:23', '2021-08-21 01:52:23', NULL),
(362, 0, 'newsletter', 24, 'image/jpeg', 25569, 'general/newsletter.jpg', '[]', '2021-08-21 01:52:23', '2021-08-21 01:52:23', NULL),
(363, 0, 'payment-method-1', 24, 'image/jpeg', 976, 'general/payment-method-1.jpg', '[]', '2021-08-21 01:52:23', '2021-08-21 01:52:23', NULL),
(364, 0, 'payment-method-2', 24, 'image/jpeg', 1122, 'general/payment-method-2.jpg', '[]', '2021-08-21 01:52:24', '2021-08-21 01:52:24', NULL),
(365, 0, 'payment-method-3', 24, 'image/jpeg', 1040, 'general/payment-method-3.jpg', '[]', '2021-08-21 01:52:24', '2021-08-21 01:52:24', NULL),
(366, 0, 'payment-method-4', 24, 'image/jpeg', 722, 'general/payment-method-4.jpg', '[]', '2021-08-21 01:52:24', '2021-08-21 01:52:24', NULL),
(367, 0, 'payment-method-5', 24, 'image/jpeg', 773, 'general/payment-method-5.jpg', '[]', '2021-08-21 01:52:24', '2021-08-21 01:52:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_folders`
--

CREATE TABLE `media_folders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_folders`
--

INSERT INTO `media_folders` (`id`, `user_id`, `name`, `slug`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(17, 0, 'brands', 'brands', 0, '2021-08-21 01:51:49', '2021-08-21 01:51:49', NULL),
(18, 0, 'product-categories', 'product-categories', 0, '2021-08-21 01:51:50', '2021-08-21 01:51:50', NULL),
(19, 0, 'products', 'products', 0, '2021-08-21 01:51:51', '2021-08-21 01:51:51', NULL),
(20, 0, 'customers', 'customers', 0, '2021-08-21 01:52:11', '2021-08-21 01:52:11', NULL),
(21, 0, 'news', 'news', 0, '2021-08-21 01:52:15', '2021-08-21 01:52:15', NULL),
(22, 0, 'sliders', 'sliders', 0, '2021-08-21 01:52:19', '2021-08-21 01:52:19', NULL),
(23, 0, 'promotion', 'promotion', 0, '2021-08-21 01:52:20', '2021-08-21 01:52:20', NULL),
(24, 0, 'general', 'general', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_settings`
--

CREATE TABLE `media_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Main menu', 'main-menu', 'published', '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(2, 'Quick links', 'quick-links', 'published', '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(3, 'Company', 'company', 'published', '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(4, 'Business', 'business', 'published', '2021-08-21 01:52:22', '2021-08-21 01:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `menu_locations`
--

CREATE TABLE `menu_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_locations`
--

INSERT INTO `menu_locations` (`id`, `menu_id`, `location`, `created_at`, `updated_at`) VALUES
(1, 1, 'main-menu', '2021-08-21 01:52:22', '2021-08-21 01:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `menu_nodes`
--

CREATE TABLE `menu_nodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `reference_id` int(10) UNSIGNED DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_nodes`
--

INSERT INTO `menu_nodes` (`id`, `menu_id`, `parent_id`, `reference_id`, `reference_type`, `url`, `icon_font`, `position`, `title`, `css_class`, `target`, `has_child`, `created_at`, `updated_at`) VALUES
(1, 1, 0, NULL, NULL, '/', NULL, 0, 'Home', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(2, 1, 0, NULL, NULL, '#', NULL, 0, 'Pages', NULL, '_self', 1, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(3, 1, 2, 2, 'Botble\\Page\\Models\\Page', '/about-us', NULL, 0, 'About us', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(4, 1, 2, 3, 'Botble\\Page\\Models\\Page', '/terms-of-use', NULL, 0, 'Terms Of Use', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(5, 1, 2, 4, 'Botble\\Page\\Models\\Page', '/terms-conditions', NULL, 0, 'Terms & Conditions', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(6, 1, 2, 5, 'Botble\\Page\\Models\\Page', '/refund-policy', NULL, 0, 'Refund Policy', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(7, 1, 2, 12, 'Botble\\Page\\Models\\Page', '/coming-soon', NULL, 0, 'Coming soon', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(8, 1, 0, NULL, NULL, '/products', NULL, 0, 'Shop', NULL, '_self', 1, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(9, 1, 8, NULL, NULL, '/products', NULL, 0, 'All products', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(10, 1, 8, 15, 'Botble\\Ecommerce\\Models\\ProductCategory', '/product-categories/consumer-electronic', NULL, 0, 'Products Of Category', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(11, 1, 8, NULL, NULL, '/products/beat-headphone', NULL, 0, 'Product Single', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(12, 1, 0, 6, 'Botble\\Page\\Models\\Page', '/blog', NULL, 0, 'Blog', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(13, 1, 0, 7, 'Botble\\Page\\Models\\Page', '/faqs', NULL, 0, 'FAQs', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(14, 1, 0, 8, 'Botble\\Page\\Models\\Page', '/contact', NULL, 0, 'Contact', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(15, 2, 0, 3, 'Botble\\Page\\Models\\Page', '/terms-of-use', NULL, 0, 'Terms Of Use', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(16, 2, 0, 4, 'Botble\\Page\\Models\\Page', '/terms-conditions', NULL, 0, 'Terms & Conditions', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(17, 2, 0, 5, 'Botble\\Page\\Models\\Page', '/refund-policy', NULL, 0, 'Refund Policy', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(18, 2, 0, 7, 'Botble\\Page\\Models\\Page', '/faqs', NULL, 0, 'FAQs', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(19, 2, 0, NULL, NULL, '/nothing', NULL, 0, '404 Page', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(20, 3, 0, 2, 'Botble\\Page\\Models\\Page', '/about-us', NULL, 0, 'About us', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(21, 3, 0, 10, 'Botble\\Page\\Models\\Page', '/affiliate', NULL, 0, 'Affiliate', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(22, 3, 0, 11, 'Botble\\Page\\Models\\Page', '/career', NULL, 0, 'Career', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(23, 3, 0, 8, 'Botble\\Page\\Models\\Page', '/contact', NULL, 0, 'Contact us', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(24, 4, 0, 6, 'Botble\\Page\\Models\\Page', '/blog', NULL, 0, 'Our blog', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(25, 4, 0, NULL, NULL, '/cart', NULL, 0, 'Cart', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(26, 4, 0, NULL, NULL, '/customer/overview', NULL, 0, 'My account', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22'),
(27, 4, 0, NULL, NULL, '/products', NULL, 0, 'Shop', NULL, '_self', 0, '2021-08-21 01:52:22', '2021-08-21 01:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `meta_boxes`
--

CREATE TABLE `meta_boxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_boxes`
--

INSERT INTO `meta_boxes` (`id`, `meta_key`, `meta_value`, `reference_id`, `reference_type`, `created_at`, `updated_at`) VALUES
(1, 'icon', '[\"icon-star\"]', 1, 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-07-12 22:41:12', '2021-07-12 22:41:12'),
(2, 'icon', '[\"icon-laundry\"]', 2, 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-07-12 22:41:12', '2021-07-12 22:41:12'),
(3, 'icon', '[\"icon-shirt\"]', 3, 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-07-12 22:41:12', '2021-07-12 22:41:12'),
(4, 'icon', '[\"icon-desktop\"]', 4, 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-07-12 22:41:12', '2021-07-12 22:41:12'),
(5, 'icon', '[\"icon-lampshade\"]', 5, 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-07-12 22:41:12', '2021-07-12 22:41:12'),
(6, 'icon', '[\"icon-heart-pulse\"]', 6, 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-07-12 22:41:12', '2021-07-12 22:41:12'),
(7, 'icon', '[\"icon-diamond2\"]', 7, 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-07-12 22:41:12', '2021-07-12 22:41:12'),
(8, 'icon', '[\"icon-desktop\"]', 8, 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-07-12 22:41:12', '2021-07-12 22:41:12'),
(9, 'icon', '[\"icon-smartphone\"]', 9, 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-07-12 22:41:12', '2021-07-12 22:41:12'),
(10, 'icon', '[\"icon-baby-bottle\"]', 10, 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-07-12 22:41:12', '2021-07-12 22:41:12'),
(11, 'icon', '[\"icon-baseball\"]', 11, 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-07-12 22:41:12', '2021-07-12 22:41:12'),
(12, 'icon', '[\"icon-book2\"]', 12, 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-07-12 22:41:12', '2021-07-12 22:41:12'),
(13, 'icon', '[\"icon-car-siren\"]', 13, 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-07-12 22:41:12', '2021-07-12 22:41:12'),
(14, 'icon', '[\"icon-wrench\"]', 14, 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-07-12 22:41:12', '2021-07-12 22:41:12');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_04_09_032329_create_base_tables', 1),
(2, '2013_04_09_062329_create_revisions_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2016_06_10_230148_create_acl_tables', 1),
(6, '2016_06_14_230857_create_menus_table', 1),
(7, '2016_06_28_221418_create_pages_table', 1),
(8, '2016_10_05_074239_create_setting_table', 1),
(9, '2016_11_28_032840_create_dashboard_widget_tables', 1),
(10, '2016_12_16_084601_create_widgets_table', 1),
(11, '2017_05_09_070343_create_media_tables', 1),
(12, '2017_11_03_070450_create_slug_table', 1),
(13, '2019_01_05_053554_create_jobs_table', 1),
(14, '2019_05_03_000001_create_customer_columns', 1),
(15, '2019_05_03_000002_create_subscriptions_table', 1),
(16, '2019_05_03_000003_create_subscription_items_table', 1),
(17, '2019_08_19_000000_create_failed_jobs_table', 1),
(18, '2020_11_18_150916_ads_create_ads_table', 2),
(19, '2015_06_29_025744_create_audit_history', 3),
(20, '2015_06_18_033822_create_blog_table', 4),
(21, '2021_02_16_092633_remove_default_value_for_author_type', 4),
(22, '2016_06_17_091537_create_contacts_table', 5),
(23, '2020_03_05_041139_create_ecommerce_tables', 6),
(24, '2020_09_22_135635_update_taxes_table', 6),
(25, '2020_09_29_101006_add_views_into_ec_products_table', 6),
(26, '2020_10_01_152311_make_column_image_in_product_attributes_table_nullable', 6),
(27, '2020_10_06_073439_improve_ecommerce_database', 6),
(28, '2020_11_01_040415_update_table_ec_order_addresses', 6),
(29, '2020_11_04_091510_make_column_phone_in_order_addresses_nullable', 6),
(30, '2020_11_30_015801_update_table_ec_product_categories', 6),
(31, '2021_01_01_044147_ecommerce_create_flash_sale_table', 6),
(32, '2021_01_17_082713_add_column_is_featured_to_product_collections_table', 6),
(33, '2021_01_18_024333_add_zip_code_into_table_customer_addresses', 6),
(34, '2021_02_18_073505_update_table_ec_reviews', 6),
(35, '2021_03_10_024419_add_column_confirmed_at_to_table_ec_customers', 6),
(36, '2021_03_10_025153_change_column_tax_amount', 6),
(37, '2021_03_20_033103_add_column_availability_to_table_ec_products', 6),
(38, '2021_04_28_074008_ecommerce_create_product_label_table', 6),
(39, '2021_06_28_153141_correct_slugs_data', 6),
(40, '2018_07_09_221238_create_faq_table', 7),
(41, '2021_07_06_030002_create_marketplace_table', 8),
(42, '2017_10_24_154832_create_newsletter_table', 9),
(43, '2017_05_18_080441_create_payment_tables', 10),
(44, '2021_03_27_144913_add_customer_type_into_table_payments', 10),
(45, '2021_05_24_034720_make_column_currency_nullable', 10),
(46, '2017_07_11_140018_create_simple_slider_table', 11),
(47, '2016_10_07_193005_create_translations_table', 12),
(48, '2021_07_18_101839_fix_old_theme_options', 13),
(49, '2021_05_31_173037_ecommerce_create_ec_products_translations', 14),
(50, '2021_08_02_084121_fix_old_shortcode', 14),
(51, '2021_08_09_161302_add_metadata_column_to_payments_table', 15),
(52, '2021_08_17_105016_remove_column_currency_id_in_some_tables', 15);

-- --------------------------------------------------------

--
-- Table structure for table `mp_customer_revenues`
--

CREATE TABLE `mp_customer_revenues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_amount` decimal(15,2) UNSIGNED DEFAULT '0.00',
  `fee` decimal(15,2) UNSIGNED DEFAULT '0.00',
  `amount` decimal(15,2) UNSIGNED DEFAULT '0.00',
  `current_balance` decimal(15,2) UNSIGNED DEFAULT '0.00',
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mp_customer_revenues`
--

INSERT INTO `mp_customer_revenues` (`id`, `customer_id`, `order_id`, `sub_amount`, `fee`, `amount`, `current_balance`, `currency`, `description`, `created_at`, `updated_at`) VALUES
(1, 2, 3, '248.78', '0.00', '248.78', '0.00', 'USD', NULL, '2021-08-20 17:52:27', '2021-08-20 17:52:27'),
(2, 10, 7, '622.60', '0.00', '622.60', '0.00', 'USD', NULL, '2021-08-16 09:52:27', '2021-08-16 09:52:27'),
(3, 10, 10, '3952.50', '0.00', '3952.50', '622.60', 'USD', NULL, '2021-08-19 05:52:28', '2021-08-19 05:52:28'),
(4, 6, 12, '1639.90', '0.00', '1639.90', '0.00', 'USD', NULL, '2021-08-16 17:52:29', '2021-08-16 17:52:29'),
(5, 4, 13, '4380.30', '0.00', '4380.30', '0.00', 'USD', NULL, '2021-08-16 09:52:29', '2021-08-16 09:52:29'),
(6, 4, 17, '614.90', '0.00', '614.90', '4380.30', 'USD', NULL, '2021-08-12 01:52:30', '2021-08-12 01:52:30'),
(7, 6, 23, '790.90', '0.00', '790.90', '1639.90', 'USD', NULL, '2021-08-19 01:52:30', '2021-08-19 01:52:30'),
(8, 2, 28, '42.00', '0.00', '42.00', '248.78', 'USD', NULL, '2021-08-06 13:52:31', '2021-08-06 13:52:31'),
(9, 9, 29, '1089.90', '0.00', '1089.90', '0.00', 'USD', NULL, '2021-08-13 13:52:32', '2021-08-13 13:52:32'),
(10, 4, 36, '1247.40', '0.00', '1247.40', '4995.20', 'USD', NULL, '2021-07-24 07:52:32', '2021-07-24 07:52:32'),
(11, 2, 42, '1327.70', '0.00', '1327.70', '290.78', 'USD', NULL, '2021-08-03 03:52:33', '2021-08-03 03:52:33'),
(12, 10, 48, '1188.60', '0.00', '1188.60', '4575.10', 'USD', NULL, '2021-07-15 07:52:33', '2021-07-15 07:52:33'),
(13, 2, 49, '3741.70', '0.00', '3741.70', '1618.48', 'USD', NULL, '2021-08-04 09:52:34', '2021-08-04 09:52:34');

-- --------------------------------------------------------

--
-- Table structure for table `mp_customer_withdrawals`
--

CREATE TABLE `mp_customer_withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `fee` decimal(15,2) UNSIGNED DEFAULT '0.00',
  `amount` decimal(15,2) UNSIGNED DEFAULT '0.00',
  `current_balance` decimal(15,2) UNSIGNED DEFAULT '0.00',
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `bank_info` text COLLATE utf8mb4_unicode_ci,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `images` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mp_customer_withdrawals`
--

INSERT INTO `mp_customer_withdrawals` (`id`, `customer_id`, `fee`, `amount`, `current_balance`, `currency`, `description`, `bank_info`, `payment_channel`, `user_id`, `status`, `images`, `created_at`, `updated_at`) VALUES
(1, 2, '0.00', '851.00', '5360.18', 'USD', '', '{\"name\":\"Camron Olson\",\"number\":\"+12485434786\",\"full_name\":\"Joesph Stoltenberg PhD\",\"description\":\"Prof. Layla Herzog Jr.\"}', NULL, 0, 'pending', NULL, '2021-08-21 01:52:35', '2021-08-21 01:52:35'),
(2, 2, '0.00', '643.00', '4509.18', 'USD', '', '{\"name\":\"Camron Olson\",\"number\":\"+12485434786\",\"full_name\":\"Joesph Stoltenberg PhD\",\"description\":\"Prof. Layla Herzog Jr.\"}', NULL, 0, 'pending', NULL, '2021-08-21 01:52:35', '2021-08-21 01:52:35'),
(3, 2, '0.00', '910.00', '3866.18', 'USD', '', '{\"name\":\"Camron Olson\",\"number\":\"+12485434786\",\"full_name\":\"Joesph Stoltenberg PhD\",\"description\":\"Prof. Layla Herzog Jr.\"}', NULL, 0, 'completed', NULL, '2021-08-21 01:52:36', '2021-08-21 01:52:36'),
(4, 2, '0.00', '403.00', '2956.18', 'USD', '', '{\"name\":\"Camron Olson\",\"number\":\"+12485434786\",\"full_name\":\"Joesph Stoltenberg PhD\",\"description\":\"Prof. Layla Herzog Jr.\"}', NULL, 0, 'processing', NULL, '2021-08-21 01:52:36', '2021-08-21 01:52:36'),
(5, 4, '0.00', '1042.00', '6242.60', 'USD', '', '{\"name\":\"Prof. Royce Rolfson\",\"number\":\"+13348662544\",\"full_name\":\"Howard Crona\",\"description\":\"Mr. Toni Morissette\"}', NULL, 0, 'completed', NULL, '2021-08-21 01:52:37', '2021-08-21 01:52:37'),
(6, 4, '0.00', '893.00', '5200.60', 'USD', '', '{\"name\":\"Prof. Royce Rolfson\",\"number\":\"+13348662544\",\"full_name\":\"Howard Crona\",\"description\":\"Mr. Toni Morissette\"}', NULL, 0, 'completed', NULL, '2021-08-21 01:52:38', '2021-08-21 01:52:38'),
(7, 4, '0.00', '1005.00', '4307.60', 'USD', '', '{\"name\":\"Prof. Royce Rolfson\",\"number\":\"+13348662544\",\"full_name\":\"Howard Crona\",\"description\":\"Mr. Toni Morissette\"}', NULL, 0, 'pending', NULL, '2021-08-21 01:52:38', '2021-08-21 01:52:38'),
(8, 6, '0.00', '296.00', '2430.80', 'USD', '', '{\"name\":\"Iva Schowalter\",\"number\":\"+15511509560\",\"full_name\":\"Favian Bernhard\",\"description\":\"Derek Smitham\"}', NULL, 0, 'pending', NULL, '2021-08-21 01:52:39', '2021-08-21 01:52:39'),
(9, 6, '0.00', '241.00', '2134.80', 'USD', '', '{\"name\":\"Iva Schowalter\",\"number\":\"+15511509560\",\"full_name\":\"Favian Bernhard\",\"description\":\"Derek Smitham\"}', NULL, 0, 'completed', NULL, '2021-08-21 01:52:40', '2021-08-21 01:52:40'),
(10, 6, '0.00', '16.00', '1893.80', 'USD', '', '{\"name\":\"Iva Schowalter\",\"number\":\"+15511509560\",\"full_name\":\"Favian Bernhard\",\"description\":\"Derek Smitham\"}', NULL, 0, 'completed', NULL, '2021-08-21 01:52:40', '2021-08-21 01:52:40'),
(11, 9, '0.00', '267.00', '1089.90', 'USD', '', '{\"name\":\"Gerald Heller\",\"number\":\"+13604088742\",\"full_name\":\"Mrs. Kristy Hirthe\",\"description\":\"Lorenz Erdman\"}', NULL, 0, 'pending', NULL, '2021-08-21 01:52:41', '2021-08-21 01:52:41'),
(12, 9, '0.00', '199.00', '822.90', 'USD', '', '{\"name\":\"Gerald Heller\",\"number\":\"+13604088742\",\"full_name\":\"Mrs. Kristy Hirthe\",\"description\":\"Lorenz Erdman\"}', NULL, 0, 'processing', NULL, '2021-08-21 01:52:41', '2021-08-21 01:52:41'),
(13, 9, '0.00', '48.00', '623.90', 'USD', '', '{\"name\":\"Gerald Heller\",\"number\":\"+13604088742\",\"full_name\":\"Mrs. Kristy Hirthe\",\"description\":\"Lorenz Erdman\"}', NULL, 0, 'completed', NULL, '2021-08-21 01:52:42', '2021-08-21 01:52:42'),
(14, 9, '0.00', '105.00', '575.90', 'USD', '', '{\"name\":\"Gerald Heller\",\"number\":\"+13604088742\",\"full_name\":\"Mrs. Kristy Hirthe\",\"description\":\"Lorenz Erdman\"}', NULL, 0, 'processing', NULL, '2021-08-21 01:52:43', '2021-08-21 01:52:43'),
(15, 10, '0.00', '1123.00', '5763.70', 'USD', '', '{\"name\":\"Ima Johnston III\",\"number\":\"+15319479038\",\"full_name\":\"Augustus Lehner\",\"description\":\"Maxie Rolfson\"}', NULL, 0, 'processing', NULL, '2021-08-21 01:52:44', '2021-08-21 01:52:44'),
(16, 10, '0.00', '1369.00', '4640.70', 'USD', '', '{\"name\":\"Ima Johnston III\",\"number\":\"+15319479038\",\"full_name\":\"Augustus Lehner\",\"description\":\"Maxie Rolfson\"}', NULL, 0, 'pending', NULL, '2021-08-21 01:52:44', '2021-08-21 01:52:44'),
(17, 10, '0.00', '648.00', '3271.70', 'USD', '', '{\"name\":\"Ima Johnston III\",\"number\":\"+15319479038\",\"full_name\":\"Augustus Lehner\",\"description\":\"Maxie Rolfson\"}', NULL, 0, 'completed', NULL, '2021-08-21 01:52:45', '2021-08-21 01:52:45'),
(18, 10, '0.00', '320.00', '2623.70', 'USD', '', '{\"name\":\"Ima Johnston III\",\"number\":\"+15319479038\",\"full_name\":\"Augustus Lehner\",\"description\":\"Maxie Rolfson\"}', NULL, 0, 'pending', NULL, '2021-08-21 01:52:46', '2021-08-21 01:52:46');

-- --------------------------------------------------------

--
-- Table structure for table `mp_stores`
--

CREATE TABLE `mp_stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mp_stores`
--

INSERT INTO `mp_stores` (`id`, `name`, `email`, `phone`, `address`, `country`, `state`, `city`, `customer_id`, `logo`, `description`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Vicenta Gibson', 'eduardo12@example.org', '+14703313875', '3069 Crona Parkway', 'CY', 'South Carolina', 'Smithport', 2, 'customers/1.jpg', 'Dolores sit sint ut et eum deleniti eligendi.', 'Quia qui soluta reiciendis ipsam. Sequi nobis nisi qui quidem. Laborum eaque commodi quasi dicta dolorem et similique saepe.', 'published', '2021-08-21 01:52:25', '2021-08-21 01:52:25'),
(2, 'Jeanne Crona', 'kunze.carmen@example.org', '+15185933829', '511 Turner Plaza Suite 609', 'BM', 'North Dakota', 'West Jammie', 4, 'customers/2.jpg', 'Qui molestiae labore est sed.', 'Ea suscipit voluptatem ullam occaecati. Ipsa rerum ut at earum optio corporis et consequuntur. Ut fugiat facilis quos quasi.', 'published', '2021-08-21 01:52:25', '2021-08-21 01:52:25'),
(3, 'Holly Altenwerth', 'irunte@example.org', '+17029454720', '95735 Brekke Ville Apt. 533', 'TN', 'Texas', 'Wilhelmville', 6, 'customers/3.jpg', 'Delectus quo quia repudiandae modi.', 'Consequatur vel voluptas aut. Sint incidunt facilis blanditiis laborum sed sunt et. Ab corporis ea vitae aut.', 'published', '2021-08-21 01:52:25', '2021-08-21 01:52:25'),
(4, 'Peggie Oberbrunner', 'dibbert.valentina@example.org', '+17796737659', '63489 Alyce Rapid Suite 880', 'NG', 'Minnesota', 'Lake Bradlymouth', 9, 'customers/4.jpg', 'Soluta minus doloremque ex praesentium error.', 'Distinctio in architecto voluptas asperiores. Consequuntur voluptas dolor non.', 'published', '2021-08-21 01:52:25', '2021-08-21 01:52:25'),
(5, 'Melany Murray', 'effertz.alexander@example.org', '+16021921648', '96422 Viola Plaza Apt. 525', 'PS', 'Virginia', 'New Weston', 10, 'customers/5.jpg', 'Id nesciunt tempora libero repellat.', 'Eos commodi optio voluptatem qui illum dolorum itaque. Deserunt dignissimos sit est explicabo fugit. Soluta minus iure dolore debitis.', 'published', '2021-08-21 01:52:25', '2021-08-21 01:52:25');

-- --------------------------------------------------------

--
-- Table structure for table `mp_vendor_info`
--

CREATE TABLE `mp_vendor_info` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_revenue` decimal(15,2) NOT NULL DEFAULT '0.00',
  `signature` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_info` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mp_vendor_info`
--

INSERT INTO `mp_vendor_info` (`id`, `customer_id`, `balance`, `total_fee`, `total_revenue`, `signature`, `bank_info`, `created_at`, `updated_at`) VALUES
(1, 2, '2553.18', '0.00', '5360.18', '$2y$10$TN626iXCZkfkyN2SCqrx0.pp5yA6hRHLDwo7T.WY.AFq/Qs2W2d5i', '{\"name\":\"Camron Olson\",\"number\":\"+12485434786\",\"full_name\":\"Joesph Stoltenberg PhD\",\"description\":\"Prof. Layla Herzog Jr.\"}', '2021-08-21 01:52:24', '2021-08-21 01:52:37'),
(2, 4, '3302.60', '0.00', '6242.60', '$2y$10$DZMB07a9R98mbpC6ucjNGOK/K7Bwl1X/0ipzNd9q7jWVdS6PXCihy', '{\"name\":\"Prof. Royce Rolfson\",\"number\":\"+13348662544\",\"full_name\":\"Howard Crona\",\"description\":\"Mr. Toni Morissette\"}', '2021-08-21 01:52:25', '2021-08-21 01:52:39'),
(3, 6, '1877.80', '0.00', '2430.80', '$2y$10$ZLq8X8.pFGxjofJOgn6/Tefoc2kN7mPtijPO4H9sFHNLKguYWQbPy', '{\"name\":\"Iva Schowalter\",\"number\":\"+15511509560\",\"full_name\":\"Favian Bernhard\",\"description\":\"Derek Smitham\"}', '2021-08-21 01:52:25', '2021-08-21 01:52:41'),
(4, 9, '470.90', '0.00', '1089.90', '$2y$10$pjW208uhSxDvsCwWKXcgUOPz/Ukz807f3zBDTRkb5ZWU.ZBKe3eKe', '{\"name\":\"Gerald Heller\",\"number\":\"+13604088742\",\"full_name\":\"Mrs. Kristy Hirthe\",\"description\":\"Lorenz Erdman\"}', '2021-08-21 01:52:25', '2021-08-21 01:52:44'),
(5, 10, '2303.70', '0.00', '5763.70', '$2y$10$hsHE0khGF/7VJxwiVZ6p7eVwR6UM2BXs/WjtpDUdeeM3NeyAGh5my', '{\"name\":\"Ima Johnston III\",\"number\":\"+15319479038\",\"full_name\":\"Augustus Lehner\",\"description\":\"Maxie Rolfson\"}', '2021-08-21 01:52:25', '2021-08-21 01:52:46');

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(4) NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `content`, `user_id`, `image`, `template`, `is_featured`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Home', '<div>[simple-slider key=\"home-slider\"][/simple-slider]</div><div>[site-features icon1=\"icon-rocket\" title1=\"Free Delivery\" subtitle1=\"For all orders over $99\" icon2=\"icon-sync\" title2=\"90 Days Return\" subtitle2=\"If goods have problems\" icon3=\"icon-credit-card\" title3=\"Secure Payment\" subtitle3=\"100% secure payment\" icon4=\"icon-bubbles\" title4=\"24/7 Support\" subtitle4=\"Dedicated support\" icon5=\"icon-gift\" title5=\"Gift Service\" subtitle5=\"Support gift service\"][/site-features]</div><div>[flash-sale title=\"Deal of the day\" flash_sale_id=\"1\"][/flash-sale]</div><div>[featured-product-categories title=\"Top Categories\"][/featured-product-categories]</div><div>[theme-ads key_1=\"IZ6WU8KUALYD\" key_2=\"ILSFJVYFGCPZ\" key_3=\"ZDOZUZZIU7FT\"][/theme-ads]</div><div>[featured-products title=\"Featured products\"][/featured-products]</div><div>[theme-ads key_1=\"Q9YDUIC9HSWS\" key_2=\"IZ6WU8KUALYE\"][/theme-ads]</div><div>[product-collections title=\"Exclusive Products\"][/product-collections]</div><div>[product-category-products category_id=\"17\"][/product-category-products]</div><div>[download-app title=\"Download Martfury App Now!\" subtitle=\"Shopping fastly and easily more with our app. Get a link to download the app on your phone.\" screenshot=\"general/app.png\" android_app_url=\"https://www.appstore.com\" ios_app_url=\"https://play.google.com/store\"][/download-app]</div><div>[product-category-products category_id=\"15\"][/product-category-products]</div><div>[newsletter-form title=\"Join Our Newsletter Now\" subtitle=\"Subscribe to get information about products and coupons\"][/newsletter-form]</div>', 1, NULL, 'homepage', 0, NULL, 'published', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(2, 'About us', '<p>Gryphon. \'We can do no more, whatever happens. What WILL become of me? They\'re dreadfully fond of pretending to be no use in talking to herself, in a hurry: a large dish of tarts upon it: they looked so grave and anxious.) Alice could only see her. She is such a thing I ask! It\'s always six o\'clock now.\' A bright idea came into her face. \'Very,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Dormouse, after thinking a minute or two the Caterpillar sternly. \'Explain yourself!\' \'I.</p><p>I can\'t remember,\' said the Gryphon, half to herself, for she was small enough to try the experiment?\' \'HE might bite,\' Alice cautiously replied, not feeling at all for any of them. However, on the bank--the birds with draggled feathers, the animals with their hands and feet, to make it stop. \'Well, I\'d hardly finished the goose, with the edge of the officers: but the wise little Alice herself, and once again the tiny hands were clasped upon her arm, and timidly said \'Consider, my dear: she is.</p><p>I\'d only been the right words,\' said poor Alice, \'when one wasn\'t always growing larger and smaller, and being so many tea-things are put out here?\' she asked. \'Yes, that\'s it,\' said Alice, who felt very glad to find herself still in sight, hurrying down it. There was a different person then.\' \'Explain all that,\' said the Cat, as soon as look at them--\'I wish they\'d get the trial done,\' she thought, \'till its ears have come, or at any rate a book of rules for shutting people up like.</p><p>AND WASHING--extra.\"\' \'You couldn\'t have wanted it much,\' said Alice; not that she was as long as you go to on the same thing as \"I get what I was going off into a small passage, not much larger than a pig, my dear,\' said Alice, \'a great girl like you,\' (she might well say that \"I see what this bottle does. I do it again and again.\' \'You are old, Father William,\' the young Crab, a little ledge of rock, and, as the doubled-up soldiers were always getting up and repeat something now. Tell her to.</p>', 1, NULL, 'default', 0, NULL, 'published', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(3, 'Terms Of Use', '<p>MARMALADE\', but to get to,\' said the King sharply. \'Do you play croquet with the Mouse to Alice with one elbow against the door, and the little thing sat down at them, and was just going to give the prizes?\' quite a long breath, and said \'That\'s very curious.\' \'It\'s all his fancy, that: they never executes nobody, you know. Which shall sing?\' \'Oh, YOU sing,\' said the King. \'Shan\'t,\' said the one who got any advantage from the time he had a large cat which was immediately suppressed by the.</p><p>Hatter. \'Stolen!\' the King put on her lap as if she had hurt the poor child, \'for I can\'t tell you what year it is?\' \'Of course it is,\' said the Queen. \'Can you play croquet?\' The soldiers were silent, and looked along the passage into the sea, some children digging in the act of crawling away: besides all this, there was the King; \'and don\'t be particular--Here, Bill! catch hold of this elegant thimble\'; and, when it grunted again, and that\'s very like having a game of croquet she was quite.</p><p>Alice, the little creature down, and was in confusion, getting the Dormouse turned out, and, by the little thing grunted in reply (it had left off writing on his slate with one elbow against the roof of the what?\' said the Mouse, turning to the garden at once; but, alas for poor Alice! when she looked down into its mouth again, and did not wish to offend the Dormouse followed him: the March Hare and the baby joined):-- \'Wow! wow! wow!\' While the Duchess asked, with another hedgehog, which.</p><p>Alice like the three gardeners at it, busily painting them red. Alice thought she might as well as she had been jumping about like that!\' \'I couldn\'t help it,\' said Alice to herself, \'if one only knew how to set them free, Exactly as we needn\'t try to find it out, we should all have our heads cut off, you know. Please, Ma\'am, is this New Zealand or Australia?\' (and she tried the little passage: and THEN--she found herself falling down a large dish of tarts upon it: they looked so good, that it.</p>', 1, NULL, 'default', 0, NULL, 'published', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(4, 'Terms & Conditions', '<p>Queen in a sorrowful tone, \'I\'m afraid I don\'t like them raw.\' \'Well, be off, then!\' said the King sharply. \'Do you take me for a rabbit! I suppose you\'ll be asleep again before it\'s done.\' \'Once upon a time she found this a very pretty dance,\' said Alice thoughtfully: \'but then--I shouldn\'t be hungry for it, she found a little timidly: \'but it\'s no use their putting their heads down and saying \"Come up again, dear!\" I shall ever see such a tiny golden key, and unlocking the door and went on.</p><p>Gryphon; and then I\'ll tell him--it was for bringing the cook took the watch and looked at them with large eyes like a star-fish,\' thought Alice. \'I\'m glad I\'ve seen that done,\' thought Alice. One of the tail, and ending with the glass table as before, \'It\'s all about it!\' and he called the Queen, stamping on the bank--the birds with draggled feathers, the animals with their hands and feet, to make out at the Cat\'s head with great emphasis, looking hard at Alice the moment she quite forgot you.</p><p>Cheshire Cat: now I shall remember it in the same as the hall was very glad to find that she was playing against herself, for this curious child was very nearly carried it out to be a person of authority among them, called out, \'First witness!\' The first witness was the fan and two or three pairs of tiny white kid gloves and a large one, but the Mouse with an M, such as mouse-traps, and the Dormouse followed him: the March Hare. \'It was the White Rabbit, \'and that\'s why. Pig!\' She said it to.</p><p>Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, \'as all the players, except the King, \'and don\'t look at the other, and making quite a conversation of it altogether; but after a pause: \'the reason is, that there\'s any one of the garden: the roses growing on it except a little sharp bark just over her head impatiently; and, turning to the end of your nose-- What made you so awfully clever?\' \'I have answered three questions, and that you weren\'t to talk nonsense. The Queen\'s argument.</p>', 1, NULL, 'default', 0, NULL, 'published', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(5, 'Refund Policy', '<p>Alice quietly said, just as she could, for the Duchess said after a fashion, and this time the Queen said severely \'Who is it I can\'t take LESS,\' said the Lory. Alice replied in an offended tone, and everybody else. \'Leave off that!\' screamed the Pigeon. \'I\'m NOT a serpent, I tell you, you coward!\' and at last she stretched her arms round it as to prevent its undoing itself,) she carried it off. \'If everybody minded their own business,\' the Duchess to play croquet.\' The Frog-Footman repeated.</p><p>They were just beginning to get in?\' she repeated, aloud. \'I must go by the way to explain the paper. \'If there\'s no name signed at the end.\' \'If you do. I\'ll set Dinah at you!\' There was nothing so VERY remarkable in that; nor did Alice think it was,\' he said. \'Fifteenth,\' said the Gryphon. \'--you advance twice--\' \'Each with a trumpet in one hand and a great hurry, muttering to himself as he came, \'Oh! the Duchess, \'chop off her unfortunate guests to execution--once more the shriek of the.</p><p>Alice. \'I wonder what they\'ll do next! As for pulling me out of the sea.\' \'I couldn\'t afford to learn it.\' said the Gryphon only answered \'Come on!\' cried the Gryphon, and, taking Alice by the White Rabbit, who said in a large plate came skimming out, straight at the mushroom (she had grown so large a house, that she had known them all her fancy, that: they never executes nobody, you know. Which shall sing?\' \'Oh, YOU sing,\' said the Hatter. \'It isn\'t directed at all,\' said the Gryphon. \'Then.</p><p>However, I\'ve got to do,\' said Alice in a trembling voice:-- \'I passed by his face only, she would manage it. \'They were obliged to have wondered at this, that she wasn\'t a really good school,\' said the Hatter. \'He won\'t stand beating. Now, if you were me?\' \'Well, perhaps your feelings may be ONE.\' \'One, indeed!\' said the Lory. Alice replied very gravely. \'What else have you executed, whether you\'re nervous or not.\' \'I\'m a poor man, your Majesty,\' he began. \'You\'re a very hopeful tone though).</p>', 1, NULL, 'default', 0, NULL, 'published', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(6, 'Blog', '<p>---</p>', 1, NULL, 'blog-sidebar', 0, NULL, 'published', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(7, 'FAQs', '<div>[faq title=\"Frequently Asked Questions\"][/faq]</div>', 1, NULL, 'default', 0, NULL, 'published', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(8, 'Contact', '<div>[google-map]502 New Street, Brighton VIC, Australia[/google-map]</div><div>[contact-info-boxes title=\"Contact Us For Any Questions\"][/contact-info-boxes]</div><div>[contact-form][/contact-form]</div>', 1, NULL, 'full-width', 0, NULL, 'published', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(9, 'Cookie Policy', '<h3>EU Cookie Consent</h3><p>To use this Website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>', 1, NULL, 'default', 0, NULL, 'published', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(10, 'Affiliate', '<p>At this moment Five, who had followed him into the air, mixed up with the dream of Wonderland of long ago: and how she would get up and repeat something now. Tell her to wink with one eye, How the Owl had the best way to fly up into the garden. Then she went back for a minute or two she walked down the chimney!\' \'Oh! So Bill\'s got to the heads of the Gryphon, and, taking Alice by the soldiers, who of course you know what a delightful thing a bit!\' said the Mouse was bristling all over, and she.</p><p>The Queen had ordered. They very soon had to double themselves up and picking the daisies, when suddenly a footman in livery, with a lobster as a lark, And will talk in contemptuous tones of her own courage. \'It\'s no use in crying like that!\' But she waited patiently. \'Once,\' said the Dodo managed it.) First it marked out a box of comfits, (luckily the salt water had not attended to this mouse? Everything is so out-of-the-way down here, and I\'m I, and--oh dear, how puzzling it all came.</p><p>Alice was beginning to get us dry would be grand, certainly,\' said Alice in a court of justice before, but she could not think of what work it would be four thousand miles down, I think--\' (for, you see, as she spoke. (The unfortunate little Bill had left off staring at the Queen, and in another moment, when she had put the hookah out of sight: \'but it sounds uncommon nonsense.\' Alice said to the game. CHAPTER IX. The Mock Turtle went on, \'I must go by the pope, was soon submitted to by all.</p><p>The door led right into it. \'That\'s very important,\' the King had said that day. \'That PROVES his guilt,\' said the Caterpillar. \'Well, I\'ve tried banks, and I\'ve tried hedges,\' the Pigeon in a hoarse, feeble voice: \'I heard the King said, turning to Alice. \'Nothing,\' said Alice. \'Of course twinkling begins with an air of great dismay, and began to get to,\' said the King. \'Nothing whatever,\' said Alice. \'Why?\' \'IT DOES THE BOOTS AND SHOES.\' the Gryphon interrupted in a minute. Alice began in a.</p>', 1, NULL, 'default', 0, NULL, 'published', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(11, 'Career', '<p>I had to run back into the garden with one eye; but to her lips. \'I know SOMETHING interesting is sure to happen,\' she said to the door, staring stupidly up into a cucumber-frame, or something of the baby, and not to be Involved in this affair, He trusts to you how it was done. They had a consultation about this, and after a pause: \'the reason is, that there\'s any one of the jurymen. \'It isn\'t a bird,\' Alice remarked. \'Oh, you foolish Alice!\' she answered herself. \'How can you learn lessons in.</p><p>GAVE HER ONE, THEY GAVE HIM TWO--\" why, that must be growing small again.\' She got up this morning? I almost think I can remember feeling a little bottle that stood near. The three soldiers wandered about in the pool a little scream, half of fright and half believed herself in a coaxing tone, and everybody laughed, \'Let the jury consider their verdict,\' the King repeated angrily, \'or I\'ll have you executed.\' The miserable Hatter dropped his teacup and bread-and-butter, and then the other.</p><p>I could, if I shall have to turn into a large cat which was lit up by wild beasts and other unpleasant things, all because they WOULD go with Edgar Atheling to meet William and offer him the crown. William\'s conduct at first she would catch a bat, and that\'s all the first position in which the cook till his eyes were getting extremely small for a minute or two, she made her so savage when they passed too close, and waving their forepaws to mark the time, while the Dodo replied very readily.</p><p>Queen?\' said the Duchess, who seemed ready to talk about trouble!\' said the King, looking round the court and got behind Alice as he fumbled over the jury-box with the distant sobs of the conversation. Alice felt so desperate that she knew that were of the e--e--evening, Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole the Tarts? The King laid his hand upon her face. \'Wake up, Alice dear!\' said her sister; \'Why, what are YOUR shoes done with?\' said the Caterpillar angrily, rearing itself.</p>', 1, NULL, 'default', 0, NULL, 'published', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(12, 'Coming soon', '<p>Condimentum ipsum a adipiscing hac dolor set consectetur urna commodo elit parturient <br/>molestie ut nisl partu convallier ullamcorpe.</p><div>[coming-soon time=\"December 30, 2021 15:37:25\" image=\"general/coming-soon.jpg\"][/coming-soon]</div>', 1, NULL, 'coming-soon', 0, NULL, 'published', '2021-08-21 01:52:20', '2021-08-21 01:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `charge_id` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `refunded_amount` decimal(15,2) UNSIGNED DEFAULT NULL,
  `refund_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `currency`, `user_id`, `charge_id`, `payment_channel`, `description`, `amount`, `order_id`, `status`, `payment_type`, `customer_id`, `refunded_amount`, `refund_note`, `created_at`, `updated_at`, `customer_type`, `metadata`) VALUES
(1, 'USD', 0, 'K31DQW9TTE', 'mollie', NULL, '1754.60', 1, 'completed', 'confirm', 7, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(2, 'USD', 0, 'DZKGCGQFBV', 'paystack', NULL, '2483.10', 2, 'completed', 'confirm', 7, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(3, 'USD', 0, 'DNHL37DOGK', 'paypal', NULL, '248.78', 3, 'completed', 'confirm', 5, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(4, 'USD', 0, 'NDDXHKAJP0', 'bank_transfer', NULL, '2967.30', 4, 'pending', 'confirm', 5, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(5, 'USD', 0, 'JZOS7WMJQ1', 'paypal', NULL, '578.60', 5, 'completed', 'confirm', 5, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(6, 'USD', 0, 'JDSZSRZDUG', 'bank_transfer', NULL, '2720.50', 6, 'pending', 'confirm', 8, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(7, 'USD', 0, '8RYFXN6MCS', 'mollie', NULL, '622.60', 7, 'completed', 'confirm', 8, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(8, 'USD', 0, 'TJHJOO46WD', 'stripe', NULL, '2483.10', 8, 'completed', 'confirm', 8, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(9, 'USD', 0, 'LG2050EMBG', 'sslcommerz', NULL, '1608.90', 9, 'completed', 'confirm', 8, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(10, 'USD', 0, 'IZAB7QUBJU', 'razorpay', NULL, '3952.50', 10, 'completed', 'confirm', 8, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(11, 'USD', 0, 'S92WL2MWTI', 'razorpay', NULL, '1173.90', 11, 'completed', 'confirm', 8, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(12, 'USD', 0, 'NCCRTP1ONY', 'sslcommerz', NULL, '1639.90', 12, 'completed', 'confirm', 8, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(13, 'USD', 0, 'BQSQPT3YR1', 'mollie', NULL, '4380.30', 13, 'completed', 'confirm', 1, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(14, 'USD', 0, 'NDPMFOQQWL', 'mollie', NULL, '1630.60', 14, 'completed', 'confirm', 1, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(15, 'USD', 0, 'SSOSRHG1KB', 'mollie', NULL, '1793.40', 15, 'completed', 'confirm', 5, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(16, 'USD', 0, 'MZ7S9ITLGV', 'bank_transfer', NULL, '2677.50', 16, 'pending', 'confirm', 5, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(17, 'USD', 0, 'NYGJK4HN6C', 'paypal', NULL, '614.90', 17, 'completed', 'confirm', 1, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(18, 'USD', 0, 'FTYEEET2UD', 'bank_transfer', NULL, '3741.70', 18, 'pending', 'confirm', 1, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(19, 'USD', 0, 'RLPOM4QGHX', 'paypal', NULL, '248.78', 19, 'completed', 'confirm', 1, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(20, 'USD', 0, '3LWSWNZLSH', 'stripe', NULL, '790.90', 20, 'completed', 'confirm', 1, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(21, 'USD', 0, '2ALQTIVS9D', 'paystack', NULL, '2647.40', 21, 'completed', 'confirm', 1, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(22, 'USD', 0, 'OQOM7HCQ1T', 'paypal', NULL, '2427.60', 22, 'completed', 'confirm', 1, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(23, 'USD', 0, 'EYYMKBB6KY', 'paypal', NULL, '790.90', 23, 'completed', 'confirm', 1, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(24, 'USD', 0, 'JD64IF8EEC', 'bank_transfer', NULL, '44.55', 24, 'pending', 'confirm', 1, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(25, 'USD', 0, 'JYJBNGWO2N', 'paypal', NULL, '1188.60', 25, 'completed', 'confirm', 1, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(26, 'USD', 0, '4P8QTLXRAA', 'paypal', NULL, '4216.00', 26, 'completed', 'confirm', 1, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(27, 'USD', 0, '8NMICAVHXK', 'paystack', NULL, '511.50', 27, 'completed', 'confirm', 1, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(28, 'USD', 0, 'MGHU9A6BCF', 'paypal', NULL, '42.00', 28, 'completed', 'confirm', 5, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(29, 'USD', 0, 'PIEDQIDVGL', 'sslcommerz', NULL, '1089.90', 29, 'completed', 'confirm', 5, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(30, 'USD', 0, 'METNJZLVQH', 'paystack', NULL, '1720.50', 30, 'completed', 'confirm', 5, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(31, 'USD', 0, 'C9RMIJDKZE', 'bank_transfer', NULL, '170.10', 31, 'pending', 'confirm', 1, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(32, 'USD', 0, 'UCH2VQJGDT', 'paystack', NULL, '2647.40', 32, 'completed', 'confirm', 1, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(33, 'USD', 0, '4PCZMP7QUT', 'bank_transfer', NULL, '649.00', 33, 'pending', 'confirm', 1, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(34, 'USD', 0, '0MVJPYHVQF', 'stripe', NULL, '487.30', 34, 'completed', 'confirm', 5, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(35, 'USD', 0, '2TBXJUVYI7', 'paystack', NULL, '633.60', 35, 'completed', 'confirm', 5, NULL, NULL, '2021-08-21 01:52:26', '2021-08-21 01:52:26', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(36, 'USD', 0, 'TIHY4T0AHR', 'sslcommerz', NULL, '1247.40', 36, 'completed', 'confirm', 5, NULL, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(37, 'USD', 0, '5PIGPQGB40', 'mollie', NULL, '622.60', 37, 'completed', 'confirm', 5, NULL, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(38, 'USD', 0, 'MLYMZGEYFQ', 'sslcommerz', NULL, '2293.20', 38, 'completed', 'confirm', 1, NULL, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(39, 'USD', 0, 'JZHJN43BWH', 'bank_transfer', NULL, '1188.60', 39, 'pending', 'confirm', 1, NULL, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(40, 'USD', 0, 'WL9XQDO2DF', 'stripe', NULL, '1592.80', 40, 'completed', 'confirm', 3, NULL, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(41, 'USD', 0, 'T67NIPVAVM', 'cod', NULL, '1793.40', 41, 'pending', 'confirm', 1, NULL, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(42, 'USD', 0, 'SMU1T7EA01', 'sslcommerz', NULL, '1327.70', 42, 'completed', 'confirm', 1, NULL, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(43, 'USD', 0, 'XDPGDPV20D', 'paypal', NULL, '248.78', 43, 'completed', 'confirm', 5, NULL, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(44, 'USD', 0, 'CSSDC0H7YI', 'paystack', NULL, '3730.50', 44, 'completed', 'confirm', 5, NULL, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(45, 'USD', 0, 'LDST2N2LE7', 'bank_transfer', NULL, '168.53', 45, 'pending', 'confirm', 5, NULL, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(46, 'USD', 0, '8EMJGDX1EE', 'bank_transfer', NULL, '2677.50', 46, 'pending', 'confirm', 5, NULL, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(47, 'USD', 0, '7GJBSBAOEA', 'paystack', NULL, '1247.40', 47, 'completed', 'confirm', 5, NULL, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(48, 'USD', 0, 'F7XDE1KZPU', 'mollie', NULL, '1188.60', 48, 'completed', 'confirm', 5, NULL, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(49, 'USD', 0, 'Q69PSVC7KR', 'sslcommerz', NULL, '3741.70', 49, 'completed', 'confirm', 5, NULL, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(50, 'USD', 0, 'HTWDY6GKGO', 'cod', NULL, '1509.90', 50, 'pending', 'confirm', 5, NULL, NULL, '2021-08-21 01:52:27', '2021-08-21 01:52:27', 'Botble\\Ecommerce\\Models\\Customer', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `description`, `content`, `status`, `author_id`, `author_type`, `is_featured`, `image`, `views`, `format_type`, `created_at`, `updated_at`) VALUES
(1, '4 Expert Tips On How To Choose The Right Men’s Wallet', 'You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/1.jpg', 566, NULL, '2021-08-21 01:52:19', '2021-08-21 01:52:19'),
(2, 'Sexy Clutches: How to Buy & Wear a Designer Clutch Bag', 'There isn’t much a girl can’t handle with the right accessories. That’s why the perfect women’s clutch bag is a wardrobe essential for first dates and spring weddings.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/2.jpg', 1854, NULL, '2021-08-21 01:52:19', '2021-08-21 01:52:19'),
(3, 'The Top 2020 Handbag Trends to Know', 'For the handbag obsessives, let\'s dive into the latter a little more. This year will bring a fresh array of bag designs, and already we\'ve gotten a sneak peek of what both spring and fall 2020 collections have to offer/', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/3.jpg', 2178, NULL, '2021-08-21 01:52:19', '2021-08-21 01:52:19'),
(4, 'How to Match the Color of Your Handbag With an Outfit', 'To match your multi-colored purses with your favorite outfits, simply select a complementary handbag hue that will make your outfit pop for work or the weekend.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/4.jpg', 293, NULL, '2021-08-21 01:52:19', '2021-08-21 01:52:19'),
(5, 'How to Care for Leather Bags', 'A leather bag is a special, near-universally beloved object, appreciated in equal measure by bon-vivants of both sexes, who cherish the supple hand, understated burnish and heady smell that can only emanate from premium quality skin.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/5.jpg', 1758, NULL, '2021-08-21 01:52:19', '2021-08-21 01:52:19'),
(6, 'We\'re Crushing Hard on Summer\'s 10 Biggest Bag Trends', 'Summer is just around the corner, and there\'s no easier way to amp up your new-season look than with a chic, new handbag. Whether you\'re wearing basic sweat shorts and a tank top or a pretty floral maxi dress, a bag is an effortless way to add interest to all your summer ensembles.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/6.jpg', 971, NULL, '2021-08-21 01:52:19', '2021-08-21 01:52:19'),
(7, 'Explore Fashion Trending For Guys In Autumn 2021', 'Summer is just around the corner, and there\'s no easier way to amp up your new-season look than with a chic, new handbag. Whether you\'re wearing basic sweat shorts and a tank top or a pretty floral maxi dress, a bag is an effortless way to add interest to all your summer ensembles.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/7.jpg', 603, NULL, '2021-08-21 01:52:19', '2021-08-21 01:52:19');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `category_id`, `post_id`) VALUES
(7, 1, 7),
(9, 1, 2),
(11, 2, 4),
(12, 3, 5),
(14, 4, 1),
(15, 2, 3),
(16, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `tag_id`, `post_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 1, 2),
(7, 2, 2),
(8, 3, 2),
(9, 4, 2),
(10, 5, 2),
(11, 1, 3),
(12, 2, 3),
(13, 3, 3),
(14, 4, 3),
(15, 5, 3),
(16, 1, 4),
(17, 2, 4),
(18, 3, 4),
(19, 4, 4),
(20, 5, 4),
(21, 1, 5),
(22, 2, 5),
(23, 3, 5),
(24, 4, 5),
(25, 5, 5),
(26, 1, 6),
(27, 2, 6),
(28, 3, 6),
(29, 4, 6),
(30, 5, 6),
(31, 1, 7),
(32, 2, 7),
(33, 3, 7),
(34, 4, 7),
(35, 5, 7);

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'activated_plugins', '[\"ads\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"ecommerce\",\"faq\",\"marketplace\",\"mollie\",\"newsletter\",\"payment\",\"paystack\",\"razorpay\",\"simple-slider\",\"social-login\",\"sslcommerz\",\"translation\"]', NULL, NULL),
(4, 'simple_slider_using_assets', '0', NULL, NULL),
(5, 'permalink-botble-blog-models-post', 'blog', NULL, NULL),
(6, 'permalink-botble-blog-models-category', 'blog', NULL, NULL),
(7, 'payment_cod_status', '1', NULL, NULL),
(8, 'payment_cod_description', 'Please pay money directly to the postman, if you choose cash on delivery method (COD).', NULL, NULL),
(9, 'payment_bank_transfer_status', '1', NULL, NULL),
(10, 'payment_bank_transfer_description', 'Please send money to our bank account: ACB - 1990 404 19.', NULL, NULL),
(11, 'plugins_ecommerce_customer_new_order_status', '0', NULL, NULL),
(12, 'plugins_ecommerce_admin_new_order_status', '0', NULL, NULL),
(13, 'ecommerce_store_name', 'Martfury', NULL, NULL),
(14, 'ecommerce_store_phone', '1800979769', NULL, NULL),
(15, 'ecommerce_store_address', '502 New Street', NULL, NULL),
(16, 'ecommerce_store_state', 'Brighton VIC', NULL, NULL),
(17, 'ecommerce_store_city', 'Brighton VIC', NULL, NULL),
(18, 'ecommerce_store_country', 'AU', NULL, NULL),
(19, 'theme', 'martfury', NULL, NULL),
(20, 'admin_logo', 'general/logo-light.png', NULL, NULL),
(178, 'media_random_hash', 'eb986c4f87976a7d5d4a61651a0f42e7', NULL, NULL),
(193, 'theme-martfury-site_title', 'Martfury - Laravel Ecommerce system', NULL, NULL),
(194, 'theme-martfury-copyright', '© 2021 Martfury. All Rights Reserved.', NULL, NULL),
(195, 'theme-martfury-favicon', 'general/favicon.png', NULL, NULL),
(196, 'theme-martfury-logo', 'general/logo.png', NULL, NULL),
(197, 'theme-martfury-welcome_message', 'Welcome to Martfury Online Shopping Store!', NULL, NULL),
(198, 'theme-martfury-address', '502 New Street, Brighton VIC, Australia', NULL, NULL),
(199, 'theme-martfury-hotline', '1800 97 97 69', NULL, NULL),
(200, 'theme-martfury-email', 'contact@martfury.co', NULL, NULL),
(201, 'theme-martfury-payment_methods', '[\"general\\/payment-method-1.jpg\",\"general\\/payment-method-2.jpg\",\"general\\/payment-method-3.jpg\",\"general\\/payment-method-4.jpg\",\"general\\/payment-method-5.jpg\"]', NULL, NULL),
(202, 'theme-martfury-newsletter_image', 'general/newsletter.jpg', NULL, NULL),
(203, 'theme-martfury-homepage_id', '1', NULL, NULL),
(204, 'theme-martfury-blog_page_id', '6', NULL, NULL),
(205, 'theme-martfury-cookie_consent_message', 'Your experience on this site will be improved by allowing cookies ', NULL, NULL),
(206, 'theme-martfury-cookie_consent_learn_more_url', 'http://martfury.local/cookie-policy', NULL, NULL),
(207, 'theme-martfury-cookie_consent_learn_more_text', 'Cookie Policy', NULL, NULL),
(208, 'theme-martfury-number_of_products_per_page', '40', NULL, NULL),
(209, 'theme-martfury-product_feature_1_title', 'Shipping worldwide', NULL, NULL),
(210, 'theme-martfury-product_feature_1_icon', 'icon-network', NULL, NULL),
(211, 'theme-martfury-product_feature_2_title', 'Free 7-day return if eligible, so easy', NULL, NULL),
(212, 'theme-martfury-product_feature_2_icon', 'icon-3d-rotate', NULL, NULL),
(213, 'theme-martfury-product_feature_3_title', 'Supplier give bills for this product.', NULL, NULL),
(214, 'theme-martfury-product_feature_3_icon', 'icon-receipt', NULL, NULL),
(215, 'theme-martfury-product_feature_4_title', 'Pay online or when receiving goods', NULL, NULL),
(216, 'theme-martfury-product_feature_4_icon', 'icon-credit-card', NULL, NULL),
(217, 'theme-martfury-contact_info_box_1_title', 'Contact Directly', NULL, NULL),
(218, 'theme-martfury-contact_info_box_1_subtitle', 'contact@martfury.com', NULL, NULL),
(219, 'theme-martfury-contact_info_box_1_details', '(+004) 912-3548-07', NULL, NULL),
(220, 'theme-martfury-contact_info_box_2_title', 'Headquarters', NULL, NULL),
(221, 'theme-martfury-contact_info_box_2_subtitle', '17 Queen St, Southbank, Melbourne 10560, Australia', NULL, NULL),
(222, 'theme-martfury-contact_info_box_2_details', '', NULL, NULL),
(223, 'theme-martfury-contact_info_box_3_title', 'Work With Us', NULL, NULL),
(224, 'theme-martfury-contact_info_box_3_subtitle', 'Send your CV to our email:', NULL, NULL),
(225, 'theme-martfury-contact_info_box_3_details', 'career@martfury.com', NULL, NULL),
(226, 'theme-martfury-contact_info_box_4_title', 'Customer Service', NULL, NULL),
(227, 'theme-martfury-contact_info_box_4_subtitle', 'customercare@martfury.com', NULL, NULL),
(228, 'theme-martfury-contact_info_box_4_details', '(800) 843-2446', NULL, NULL),
(229, 'theme-martfury-contact_info_box_5_title', 'Media Relations', NULL, NULL),
(230, 'theme-martfury-contact_info_box_5_subtitle', 'media@martfury.com', NULL, NULL),
(231, 'theme-martfury-contact_info_box_5_details', '(801) 947-3564', NULL, NULL),
(232, 'theme-martfury-contact_info_box_6_title', 'Vendor Support', NULL, NULL),
(233, 'theme-martfury-contact_info_box_6_subtitle', 'vendorsupport@martfury.com', NULL, NULL),
(234, 'theme-martfury-contact_info_box_6_details', '(801) 947-3100', NULL, NULL),
(235, 'theme-martfury-number_of_cross_sale_products_in_cart_page', '7', NULL, NULL),
(236, 'theme-martfury-logo_in_the_checkout_page', 'general/logo-dark.png', NULL, NULL),
(237, 'theme-martfury-logo_in_invoices', 'general/logo-dark.png', NULL, NULL),
(238, 'theme-martfury-logo_vendor_dashboard', 'general/logo-dark.png', NULL, NULL),
(241, 'theme-martfury-social-name-1', 'Facebook', NULL, NULL),
(242, 'theme-martfury-social-url-1', 'https://www.facebook.com/', NULL, NULL),
(243, 'theme-martfury-social-icon-1', 'fa-facebook', NULL, NULL),
(244, 'theme-martfury-social-color-1', '#3b5999', NULL, NULL),
(245, 'theme-martfury-social-name-2', 'Twitter', NULL, NULL),
(246, 'theme-martfury-social-url-2', 'https://www.twitter.com/', NULL, NULL),
(247, 'theme-martfury-social-icon-2', 'fa-twitter', NULL, NULL),
(248, 'theme-martfury-social-color-2', '#55ACF9', NULL, NULL),
(249, 'theme-martfury-social-name-3', 'Instagram', NULL, NULL),
(250, 'theme-martfury-social-url-3', 'https://www.instagram.com/', NULL, NULL),
(251, 'theme-martfury-social-icon-3', 'fa-instagram', NULL, NULL),
(252, 'theme-martfury-social-color-3', '#E1306C', NULL, NULL),
(253, 'theme-martfury-social-name-4', 'Youtube', NULL, NULL),
(254, 'theme-martfury-social-url-4', 'https://www.youtube.com/', NULL, NULL),
(255, 'theme-martfury-social-icon-4', 'fa-youtube', NULL, NULL),
(256, 'theme-martfury-social-color-4', '#FF0000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `simple_sliders`
--

CREATE TABLE `simple_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `simple_sliders`
--

INSERT INTO `simple_sliders` (`id`, `name`, `key`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Home slider', 'home-slider', 'The main slider on homepage', 'published', '2021-08-21 01:52:20', '2021-08-21 01:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `simple_slider_items`
--

CREATE TABLE `simple_slider_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `simple_slider_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `simple_slider_items`
--

INSERT INTO `simple_slider_items` (`id`, `simple_slider_id`, `title`, `image`, `link`, `description`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, 'Slider 1', 'sliders/1.jpg', '/products', NULL, 1, '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(2, 1, 'Slider 2', 'sliders/2.jpg', '/products', NULL, 2, '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(3, 1, 'Slider 3', 'sliders/3.jpg', '/products', NULL, 3, '2021-08-21 01:52:20', '2021-08-21 01:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `slugs`
--

CREATE TABLE `slugs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slugs`
--

INSERT INTO `slugs` (`id`, `key`, `reference_id`, `reference_type`, `prefix`, `created_at`, `updated_at`) VALUES
(211, 'fashion-live', 1, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2021-08-21 01:51:50', '2021-08-21 01:51:50'),
(212, 'hand-crafted', 2, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2021-08-21 01:51:50', '2021-08-21 01:51:50'),
(213, 'mestonix', 3, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2021-08-21 01:51:50', '2021-08-21 01:51:50'),
(214, 'sunshine', 4, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2021-08-21 01:51:50', '2021-08-21 01:51:50'),
(215, 'pure', 5, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2021-08-21 01:51:50', '2021-08-21 01:51:50'),
(216, 'anfold', 6, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2021-08-21 01:51:50', '2021-08-21 01:51:50'),
(217, 'automotive', 7, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2021-08-21 01:51:50', '2021-08-21 01:51:50'),
(218, 'hot-promotions', 1, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(219, 'electronics', 2, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(220, 'clothing', 3, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(221, 'computers', 4, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(222, 'home-kitchen', 5, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(223, 'health-beauty', 6, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(224, 'jewelry-watch', 7, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(225, 'technology-toys', 8, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(226, 'phones', 9, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(227, 'babies-moms', 10, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(228, 'sport-outdoor', 11, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(229, 'books-office', 12, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(230, 'cars-motorcycles', 13, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(231, 'home-improvements', 14, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(232, 'consumer-electronic', 15, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(233, 'accessories-parts', 16, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(234, 'computer-technologies', 17, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(235, 'networking', 18, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(236, 'home-audio-theaters', 19, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(237, 'tv-videos', 20, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(238, 'camera-photos-videos', 21, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(239, 'cellphones-accessories', 22, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(240, 'headphones', 23, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(241, 'videos-games', 24, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(242, 'wireless-speakers', 25, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(243, 'office-electronic', 26, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(244, 'digital-cables', 27, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(245, 'audio-video-cables', 28, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(246, 'batteries', 29, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(247, 'computer-tablets', 30, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(248, 'laptop', 31, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(249, 'monitors', 32, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(250, 'computer-components', 33, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(251, 'drive-storages', 34, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(252, 'gaming-laptop', 35, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(253, 'security-protection', 36, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(254, 'accessories', 37, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-08-21 01:51:51', '2021-08-21 01:51:51'),
(255, 'dual-camera-20mp', 1, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(256, 'smart-watches', 2, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(257, 'beat-headphone', 3, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(258, 'red-black-headphone', 4, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(259, 'smart-watch-external', 5, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(260, 'nikon-hd-camera', 6, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(261, 'audio-equipment', 7, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(262, 'smart-televisions', 8, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(263, 'samsung-smart-phone', 9, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(264, 'herschel-leather-duffle-bag-in-brown-color', 10, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(265, 'xbox-one-wireless-controller-black-color', 11, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(266, 'epsion-plaster-printer', 12, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(267, 'sound-intone-i65-earphone-white-version', 13, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(268, 'bo-play-mini-bluetooth-speaker', 14, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(269, 'apple-macbook-air-retina-133-inch-laptop', 15, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(270, 'apple-macbook-air-retina-12-inch-laptop', 16, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(271, 'samsung-gear-vr-virtual-reality-headset', 17, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(272, 'aveeno-moisturizing-body-shower-450ml', 18, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(273, 'nyx-beauty-couton-pallete-makeup-12', 19, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(274, 'nyx-beauty-couton-pallete-makeup-12', 20, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(275, 'mvmth-classical-leather-watch-in-black', 21, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(276, 'baxter-care-hair-kit-for-bearded-mens', 22, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(277, 'ciate-palemore-lipstick-bold-red-color', 23, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
(278, 'electronic', 1, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(279, 'mobile', 2, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(280, 'iphone', 3, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(281, 'printer', 4, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(282, 'office', 5, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(283, 'it', 6, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-08-21 01:52:15', '2021-08-21 01:52:15'),
(284, 'general', 1, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-08-21 01:52:19', '2021-08-21 01:52:19'),
(285, 'design', 2, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-08-21 01:52:19', '2021-08-21 01:52:19'),
(286, 'jquery', 3, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-08-21 01:52:19', '2021-08-21 01:52:19'),
(287, 'branding', 4, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-08-21 01:52:19', '2021-08-21 01:52:19'),
(288, 'modern', 5, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-08-21 01:52:19', '2021-08-21 01:52:19'),
(289, 'ecommerce', 1, 'Botble\\Blog\\Models\\Category', 'blog', '2021-08-21 01:52:19', '2021-08-21 01:52:22'),
(290, 'fashion', 2, 'Botble\\Blog\\Models\\Category', 'blog', '2021-08-21 01:52:19', '2021-08-21 01:52:22'),
(291, 'electronic', 3, 'Botble\\Blog\\Models\\Category', 'blog', '2021-08-21 01:52:19', '2021-08-21 01:52:22'),
(292, 'commercial', 4, 'Botble\\Blog\\Models\\Category', 'blog', '2021-08-21 01:52:19', '2021-08-21 01:52:22'),
(293, '4-expert-tips-on-how-to-choose-the-right-mens-wallet', 1, 'Botble\\Blog\\Models\\Post', 'blog', '2021-08-21 01:52:19', '2021-08-21 01:52:22'),
(294, 'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag', 2, 'Botble\\Blog\\Models\\Post', 'blog', '2021-08-21 01:52:19', '2021-08-21 01:52:22'),
(295, 'the-top-2020-handbag-trends-to-know', 3, 'Botble\\Blog\\Models\\Post', 'blog', '2021-08-21 01:52:19', '2021-08-21 01:52:22'),
(296, 'how-to-match-the-color-of-your-handbag-with-an-outfit', 4, 'Botble\\Blog\\Models\\Post', 'blog', '2021-08-21 01:52:19', '2021-08-21 01:52:22'),
(297, 'how-to-care-for-leather-bags', 5, 'Botble\\Blog\\Models\\Post', 'blog', '2021-08-21 01:52:19', '2021-08-21 01:52:22'),
(298, 'were-crushing-hard-on-summers-10-biggest-bag-trends', 6, 'Botble\\Blog\\Models\\Post', 'blog', '2021-08-21 01:52:19', '2021-08-21 01:52:22'),
(299, 'explore-fashion-trending-for-guys-in-autumn-2021', 7, 'Botble\\Blog\\Models\\Post', 'blog', '2021-08-21 01:52:19', '2021-08-21 01:52:22'),
(300, 'home', 1, 'Botble\\Page\\Models\\Page', '', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(301, 'about-us', 2, 'Botble\\Page\\Models\\Page', '', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(302, 'terms-of-use', 3, 'Botble\\Page\\Models\\Page', '', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(303, 'terms-conditions', 4, 'Botble\\Page\\Models\\Page', '', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(304, 'refund-policy', 5, 'Botble\\Page\\Models\\Page', '', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(305, 'blog', 6, 'Botble\\Page\\Models\\Page', '', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(306, 'faqs', 7, 'Botble\\Page\\Models\\Page', '', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(307, 'contact', 8, 'Botble\\Page\\Models\\Page', '', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(308, 'cookie-policy', 9, 'Botble\\Page\\Models\\Page', '', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(309, 'affiliate', 10, 'Botble\\Page\\Models\\Page', '', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(310, 'career', 11, 'Botble\\Page\\Models\\Page', '', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(311, 'coming-soon', 12, 'Botble\\Page\\Models\\Page', '', '2021-08-21 01:52:20', '2021-08-21 01:52:20'),
(312, 'vicenta-gibson', 1, 'Botble\\Marketplace\\Models\\Store', 'stores', '2021-08-21 01:52:25', '2021-08-21 01:52:25'),
(313, 'jeanne-crona', 2, 'Botble\\Marketplace\\Models\\Store', 'stores', '2021-08-21 01:52:25', '2021-08-21 01:52:25'),
(314, 'holly-altenwerth', 3, 'Botble\\Marketplace\\Models\\Store', 'stores', '2021-08-21 01:52:25', '2021-08-21 01:52:25'),
(315, 'peggie-oberbrunner', 4, 'Botble\\Marketplace\\Models\\Store', 'stores', '2021-08-21 01:52:25', '2021-08-21 01:52:25'),
(316, 'melany-murray', 5, 'Botble\\Marketplace\\Models\\Store', 'stores', '2021-08-21 01:52:25', '2021-08-21 01:52:25');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `author_id`, `author_type`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'General', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-08-21 01:52:19', '2021-08-21 01:52:19'),
(2, 'Design', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-08-21 01:52:19', '2021-08-21 01:52:19'),
(3, 'Jquery', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-08-21 01:52:19', '2021-08-21 01:52:19'),
(4, 'Branding', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-08-21 01:52:19', '2021-08-21 01:52:19'),
(5, 'Modern', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-08-21 01:52:19', '2021-08-21 01:52:19');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 0, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(2, 0, 'en', 'auth', 'password', 'The provided password is incorrect.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(3, 0, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(4, 0, 'en', 'pagination', 'previous', '&laquo; Previous', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(5, 0, 'en', 'pagination', 'next', 'Next &raquo;', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(6, 0, 'en', 'passwords', 'reset', 'Your password has been reset!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(7, 0, 'en', 'passwords', 'sent', 'We have emailed your password reset link!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(8, 0, 'en', 'passwords', 'throttled', 'Please wait before retrying.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(9, 0, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(10, 0, 'en', 'passwords', 'user', 'We can\'t find a user with that email address.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(11, 0, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(12, 0, 'en', 'validation', 'accepted_if', 'The :attribute must be accepted when :other is :value.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(13, 0, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(14, 0, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(15, 0, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(16, 0, 'en', 'validation', 'alpha', 'The :attribute must only contain letters.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(17, 0, 'en', 'validation', 'alpha_dash', 'The :attribute must only contain letters, numbers, dashes and underscores.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(18, 0, 'en', 'validation', 'alpha_num', 'The :attribute must only contain letters and numbers.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(19, 0, 'en', 'validation', 'array', 'The :attribute must be an array.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(20, 0, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(21, 0, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(22, 0, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(23, 0, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(24, 0, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(25, 0, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(26, 0, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(27, 0, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(28, 0, 'en', 'validation', 'current_password', 'The password is incorrect.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(29, 0, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(30, 0, 'en', 'validation', 'date_equals', 'The :attribute must be a date equal to :date.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(31, 0, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(32, 0, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(33, 0, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(34, 0, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(35, 0, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(36, 0, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(37, 0, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(38, 0, 'en', 'validation', 'ends_with', 'The :attribute must end with one of the following: :values.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(39, 0, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(40, 0, 'en', 'validation', 'file', 'The :attribute must be a file.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(41, 0, 'en', 'validation', 'filled', 'The :attribute field must have a value.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(42, 0, 'en', 'validation', 'gt.numeric', 'The :attribute must be greater than :value.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(43, 0, 'en', 'validation', 'gt.file', 'The :attribute must be greater than :value kilobytes.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(44, 0, 'en', 'validation', 'gt.string', 'The :attribute must be greater than :value characters.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(45, 0, 'en', 'validation', 'gt.array', 'The :attribute must have more than :value items.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(46, 0, 'en', 'validation', 'gte.numeric', 'The :attribute must be greater than or equal :value.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(47, 0, 'en', 'validation', 'gte.file', 'The :attribute must be greater than or equal :value kilobytes.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(48, 0, 'en', 'validation', 'gte.string', 'The :attribute must be greater than or equal :value characters.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(49, 0, 'en', 'validation', 'gte.array', 'The :attribute must have :value items or more.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(50, 0, 'en', 'validation', 'image', 'The :attribute must be an image.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(51, 0, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(52, 0, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(53, 0, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(54, 0, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(55, 0, 'en', 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(56, 0, 'en', 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(57, 0, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(58, 0, 'en', 'validation', 'lt.numeric', 'The :attribute must be less than :value.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(59, 0, 'en', 'validation', 'lt.file', 'The :attribute must be less than :value kilobytes.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(60, 0, 'en', 'validation', 'lt.string', 'The :attribute must be less than :value characters.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(61, 0, 'en', 'validation', 'lt.array', 'The :attribute must have less than :value items.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(62, 0, 'en', 'validation', 'lte.numeric', 'The :attribute must be less than or equal :value.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(63, 0, 'en', 'validation', 'lte.file', 'The :attribute must be less than or equal :value kilobytes.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(64, 0, 'en', 'validation', 'lte.string', 'The :attribute must be less than or equal :value characters.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(65, 0, 'en', 'validation', 'lte.array', 'The :attribute must not have more than :value items.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(66, 0, 'en', 'validation', 'max.numeric', 'The :attribute must not be greater than :max.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(67, 0, 'en', 'validation', 'max.file', 'The :attribute must not be greater than :max kilobytes.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(68, 0, 'en', 'validation', 'max.string', 'The :attribute must not be greater than :max characters.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(69, 0, 'en', 'validation', 'max.array', 'The :attribute must not have more than :max items.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(70, 0, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(71, 0, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(72, 0, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(73, 0, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(74, 0, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(75, 0, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(76, 0, 'en', 'validation', 'multiple_of', 'The :attribute must be a multiple of :value.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(77, 0, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(78, 0, 'en', 'validation', 'not_regex', 'The :attribute format is invalid.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(79, 0, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(80, 0, 'en', 'validation', 'password', 'The password is incorrect.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(81, 0, 'en', 'validation', 'present', 'The :attribute field must be present.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(82, 0, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(83, 0, 'en', 'validation', 'required', 'The :attribute field is required.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(84, 0, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(85, 0, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(86, 0, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(87, 0, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values are present.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(88, 0, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(89, 0, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(90, 0, 'en', 'validation', 'prohibited', 'The :attribute field is prohibited.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(91, 0, 'en', 'validation', 'prohibited_if', 'The :attribute field is prohibited when :other is :value.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(92, 0, 'en', 'validation', 'prohibited_unless', 'The :attribute field is prohibited unless :other is in :values.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(93, 0, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(94, 0, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(95, 0, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(96, 0, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(97, 0, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(98, 0, 'en', 'validation', 'starts_with', 'The :attribute must start with one of the following: :values.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(99, 0, 'en', 'validation', 'string', 'The :attribute must be a string.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(100, 0, 'en', 'validation', 'timezone', 'The :attribute must be a valid timezone.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(101, 0, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(102, 0, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(103, 0, 'en', 'validation', 'url', 'The :attribute must be a valid URL.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(104, 0, 'en', 'validation', 'uuid', 'The :attribute must be a valid UUID.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(105, 0, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(106, 0, 'en', 'core/acl/api', 'api_clients', 'API Clients', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(107, 0, 'en', 'core/acl/api', 'create_new_client', 'Create new client', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(108, 0, 'en', 'core/acl/api', 'create_new_client_success', 'Create new client successfully!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(109, 0, 'en', 'core/acl/api', 'edit_client', 'Edit client \":name\"', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(110, 0, 'en', 'core/acl/api', 'edit_client_success', 'Updated client successfully!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(111, 0, 'en', 'core/acl/api', 'delete_success', 'Deleted client successfully!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(112, 0, 'en', 'core/acl/api', 'confirm_delete_title', 'Confirm delete client \":name\"', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(113, 0, 'en', 'core/acl/api', 'confirm_delete_description', 'Do you really want to delete client \":name\"?', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(114, 0, 'en', 'core/acl/api', 'cancel_delete', 'No', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(115, 0, 'en', 'core/acl/api', 'continue_delete', 'Yes, let\'s delete it!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(116, 0, 'en', 'core/acl/api', 'name', 'Name', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(117, 0, 'en', 'core/acl/api', 'cancel', 'Cancel', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(118, 0, 'en', 'core/acl/api', 'save', 'Save', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(119, 0, 'en', 'core/acl/api', 'edit', 'Edit', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(120, 0, 'en', 'core/acl/api', 'delete', 'Delete', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(121, 0, 'en', 'core/acl/api', 'client_id', 'Client ID', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(122, 0, 'en', 'core/acl/api', 'secret', 'Secret', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(123, 0, 'en', 'core/acl/auth', 'login.username', 'Email/Username', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(124, 0, 'en', 'core/acl/auth', 'login.email', 'Email', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(125, 0, 'en', 'core/acl/auth', 'login.password', 'Password', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(126, 0, 'en', 'core/acl/auth', 'login.title', 'User Login', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(127, 0, 'en', 'core/acl/auth', 'login.remember', 'Remember me?', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(128, 0, 'en', 'core/acl/auth', 'login.login', 'Sign in', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(129, 0, 'en', 'core/acl/auth', 'login.placeholder.username', 'Please enter your username', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(130, 0, 'en', 'core/acl/auth', 'login.placeholder.email', 'Please enter your email', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(131, 0, 'en', 'core/acl/auth', 'login.success', 'Login successfully!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(132, 0, 'en', 'core/acl/auth', 'login.fail', 'Wrong username or password.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(133, 0, 'en', 'core/acl/auth', 'login.not_active', 'Your account has not been activated yet!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(134, 0, 'en', 'core/acl/auth', 'login.banned', 'This account is banned.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(135, 0, 'en', 'core/acl/auth', 'login.logout_success', 'Logout successfully!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(136, 0, 'en', 'core/acl/auth', 'login.dont_have_account', 'You don\'t have account on this system, please contact administrator for more information!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(137, 0, 'en', 'core/acl/auth', 'forgot_password.title', 'Forgot Password', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(138, 0, 'en', 'core/acl/auth', 'forgot_password.message', '<p>Have you forgotten your password?</p><p>Please enter your email account. System will send a email with active link to reset your password.</p>', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(139, 0, 'en', 'core/acl/auth', 'forgot_password.submit', 'Submit', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(140, 0, 'en', 'core/acl/auth', 'reset.new_password', 'New password', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(141, 0, 'en', 'core/acl/auth', 'reset.password_confirmation', 'Confirm new password', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(142, 0, 'en', 'core/acl/auth', 'reset.email', 'Email', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(143, 0, 'en', 'core/acl/auth', 'reset.title', 'Reset your password', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(144, 0, 'en', 'core/acl/auth', 'reset.update', 'Update', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(145, 0, 'en', 'core/acl/auth', 'reset.wrong_token', 'This link is invalid or expired. Please try using reset form again.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(146, 0, 'en', 'core/acl/auth', 'reset.user_not_found', 'This username is not exist.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(147, 0, 'en', 'core/acl/auth', 'reset.success', 'Reset password successfully!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(148, 0, 'en', 'core/acl/auth', 'reset.fail', 'Token is invalid, the reset password link has been expired!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(149, 0, 'en', 'core/acl/auth', 'reset.reset.title', 'Email reset password', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(150, 0, 'en', 'core/acl/auth', 'reset.send.success', 'A email was sent to your email account. Please check and complete this action.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(151, 0, 'en', 'core/acl/auth', 'reset.send.fail', 'Can not send email in this time. Please try again later.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(152, 0, 'en', 'core/acl/auth', 'reset.new-password', 'New password', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(153, 0, 'en', 'core/acl/auth', 'email.reminder.title', 'Email reset password', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(154, 0, 'en', 'core/acl/auth', 'password_confirmation', 'Password confirm', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(155, 0, 'en', 'core/acl/auth', 'failed', 'Failed', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(156, 0, 'en', 'core/acl/auth', 'throttle', 'Throttle', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(157, 0, 'en', 'core/acl/auth', 'not_member', 'Not a member yet?', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(158, 0, 'en', 'core/acl/auth', 'register_now', 'Register now', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(159, 0, 'en', 'core/acl/auth', 'lost_your_password', 'Lost your password?', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(160, 0, 'en', 'core/acl/auth', 'login_title', 'Admin', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(161, 0, 'en', 'core/acl/auth', 'login_via_social', 'Login with social networks', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(162, 0, 'en', 'core/acl/auth', 'back_to_login', 'Back to login page', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(163, 0, 'en', 'core/acl/auth', 'sign_in_below', 'Sign In Below', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(164, 0, 'en', 'core/acl/auth', 'languages', 'Languages', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(165, 0, 'en', 'core/acl/auth', 'reset_password', 'Reset Password', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(166, 0, 'en', 'core/acl/auth', 'settings.email.title', 'ACL', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(167, 0, 'en', 'core/acl/auth', 'settings.email.description', 'ACL email configuration', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(168, 0, 'en', 'core/acl/permissions', 'notices.role_in_use', 'Cannot delete this role, it is still in use!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(169, 0, 'en', 'core/acl/permissions', 'notices.role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(170, 0, 'en', 'core/acl/permissions', 'notices.role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(171, 0, 'en', 'core/acl/permissions', 'notices.delete_global_role', 'You are not allowed to delete global roles!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(172, 0, 'en', 'core/acl/permissions', 'notices.delete_success', 'The selected role was deleted successfully!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(173, 0, 'en', 'core/acl/permissions', 'notices.modified_success', 'The selected role was modified successfully!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(174, 0, 'en', 'core/acl/permissions', 'notices.create_success', 'The new role was successfully created', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(175, 0, 'en', 'core/acl/permissions', 'notices.duplicated_success', 'The selected role was duplicated successfully', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(176, 0, 'en', 'core/acl/permissions', 'notices.no_select', 'Please select at least one record to take this action!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(177, 0, 'en', 'core/acl/permissions', 'notices.not_found', 'Role not found', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(178, 0, 'en', 'core/acl/permissions', 'name', 'Name', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(179, 0, 'en', 'core/acl/permissions', 'current_role', 'Current Role', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(180, 0, 'en', 'core/acl/permissions', 'no_role_assigned', 'No role assigned', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(181, 0, 'en', 'core/acl/permissions', 'role_assigned', 'Assigned Role', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(182, 0, 'en', 'core/acl/permissions', 'create_role', 'Create New Role', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(183, 0, 'en', 'core/acl/permissions', 'role_name', 'Name', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(184, 0, 'en', 'core/acl/permissions', 'role_description', 'Description', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(185, 0, 'en', 'core/acl/permissions', 'permission_flags', 'Permission Flags', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(186, 0, 'en', 'core/acl/permissions', 'cancel', 'Cancel', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(187, 0, 'en', 'core/acl/permissions', 'reset', 'Reset', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(188, 0, 'en', 'core/acl/permissions', 'save', 'Save', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(189, 0, 'en', 'core/acl/permissions', 'global_role_msg', 'This is a global role and cannot be modified.  You can use the Duplicate button to make a copy of this role that you can then modify.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(190, 0, 'en', 'core/acl/permissions', 'details', 'Details', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(191, 0, 'en', 'core/acl/permissions', 'duplicate', 'Duplicate', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(192, 0, 'en', 'core/acl/permissions', 'all', 'All Permissions', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(193, 0, 'en', 'core/acl/permissions', 'list_role', 'List Roles', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(194, 0, 'en', 'core/acl/permissions', 'created_on', 'Created On', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(195, 0, 'en', 'core/acl/permissions', 'created_by', 'Created By', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(196, 0, 'en', 'core/acl/permissions', 'actions', 'Actions', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(197, 0, 'en', 'core/acl/permissions', 'role_in_use', 'Cannot delete this role, it is still in use!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(198, 0, 'en', 'core/acl/permissions', 'role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(199, 0, 'en', 'core/acl/permissions', 'delete_global_role', 'Can not delete global role', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(200, 0, 'en', 'core/acl/permissions', 'delete_success', 'Delete role successfully', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(201, 0, 'en', 'core/acl/permissions', 'no_select', 'Please select at least one role to take this action!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(202, 0, 'en', 'core/acl/permissions', 'not_found', 'No role found!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(203, 0, 'en', 'core/acl/permissions', 'role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(204, 0, 'en', 'core/acl/permissions', 'modified_success', 'Modified successfully', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(205, 0, 'en', 'core/acl/permissions', 'create_success', 'Create successfully', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(206, 0, 'en', 'core/acl/permissions', 'duplicated_success', 'Duplicated successfully', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(207, 0, 'en', 'core/acl/permissions', 'options', 'Options', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(208, 0, 'en', 'core/acl/permissions', 'access_denied_message', 'You are not allowed to do this action', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(209, 0, 'en', 'core/acl/permissions', 'roles', 'Roles', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(210, 0, 'en', 'core/acl/permissions', 'role_permission', 'Roles and Permissions', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(211, 0, 'en', 'core/acl/permissions', 'user_management', 'User Management', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(212, 0, 'en', 'core/acl/permissions', 'super_user_management', 'Super User Management', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(213, 0, 'en', 'core/acl/permissions', 'action_unauthorized', 'This action is unauthorized.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(214, 0, 'en', 'core/acl/reminders', 'password', 'Passwords must be at least six characters and match the confirmation.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(215, 0, 'en', 'core/acl/reminders', 'user', 'We can\'t find a user with that e-mail address.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(216, 0, 'en', 'core/acl/reminders', 'token', 'This password reset token is invalid.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(217, 0, 'en', 'core/acl/reminders', 'sent', 'Password reminder sent!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(218, 0, 'en', 'core/acl/reminders', 'reset', 'Password has been reset!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(219, 0, 'en', 'core/acl/users', 'delete_user_logged_in', 'Can\'t delete this user. This user is logged on!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(220, 0, 'en', 'core/acl/users', 'no_select', 'Please select at least one record to take this action!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(221, 0, 'en', 'core/acl/users', 'lock_user_logged_in', 'Can\'t lock this user. This user is logged on!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(222, 0, 'en', 'core/acl/users', 'update_success', 'Update status successfully!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(223, 0, 'en', 'core/acl/users', 'save_setting_failed', 'Something went wrong when save your setting', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(224, 0, 'en', 'core/acl/users', 'not_found', 'User not found', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(225, 0, 'en', 'core/acl/users', 'email_exist', 'That email address already belongs to an existing account', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(226, 0, 'en', 'core/acl/users', 'username_exist', 'That username address already belongs to an existing account', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(227, 0, 'en', 'core/acl/users', 'update_profile_success', 'Your profile changes were successfully saved', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(228, 0, 'en', 'core/acl/users', 'password_update_success', 'Password successfully changed', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(229, 0, 'en', 'core/acl/users', 'current_password_not_valid', 'Current password is not valid', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(230, 0, 'en', 'core/acl/users', 'user_exist_in', 'User is already a member', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(231, 0, 'en', 'core/acl/users', 'email', 'Email', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(232, 0, 'en', 'core/acl/users', 'role', 'Role', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(233, 0, 'en', 'core/acl/users', 'username', 'Username', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(234, 0, 'en', 'core/acl/users', 'last_name', 'Last Name', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(235, 0, 'en', 'core/acl/users', 'first_name', 'First Name', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(236, 0, 'en', 'core/acl/users', 'message', 'Message', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(237, 0, 'en', 'core/acl/users', 'cancel_btn', 'Cancel', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(238, 0, 'en', 'core/acl/users', 'change_password', 'Change password', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(239, 0, 'en', 'core/acl/users', 'current_password', 'Current password', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(240, 0, 'en', 'core/acl/users', 'new_password', 'New Password', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(241, 0, 'en', 'core/acl/users', 'confirm_new_password', 'Confirm New Password', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(242, 0, 'en', 'core/acl/users', 'password', 'Password', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(243, 0, 'en', 'core/acl/users', 'save', 'Save', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(244, 0, 'en', 'core/acl/users', 'cannot_delete', 'User could not be deleted', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(245, 0, 'en', 'core/acl/users', 'deleted', 'User deleted', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(246, 0, 'en', 'core/acl/users', 'last_login', 'Last Login', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(247, 0, 'en', 'core/acl/users', 'error_update_profile_image', 'Error when update profile image', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(248, 0, 'en', 'core/acl/users', 'email_reminder_template', '<h3>Hello :name</h3><p>The system has received a request to restore the password for your account, to complete this task please click the link below.</p><p><a href=\":link\">Reset password now</a></p><p>If not you ask recover password, please ignore this email.</p><p>This email is valid for 60 minutes after receiving the email.</p>', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(249, 0, 'en', 'core/acl/users', 'change_profile_image', 'Change Profile Image', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(250, 0, 'en', 'core/acl/users', 'new_image', 'New Image', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(251, 0, 'en', 'core/acl/users', 'loading', 'Loading', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(252, 0, 'en', 'core/acl/users', 'close', 'Close', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(253, 0, 'en', 'core/acl/users', 'update', 'Update', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(254, 0, 'en', 'core/acl/users', 'read_image_failed', 'Failed to read the image file', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(255, 0, 'en', 'core/acl/users', 'users', 'Users', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(256, 0, 'en', 'core/acl/users', 'update_avatar_success', 'Update profile image successfully!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(257, 0, 'en', 'core/acl/users', 'info.title', 'User profile', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(258, 0, 'en', 'core/acl/users', 'info.first_name', 'First Name', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(259, 0, 'en', 'core/acl/users', 'info.last_name', 'Last Name', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(260, 0, 'en', 'core/acl/users', 'info.email', 'Email', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(261, 0, 'en', 'core/acl/users', 'info.second_email', 'Secondary Email', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(262, 0, 'en', 'core/acl/users', 'info.address', 'Address', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(263, 0, 'en', 'core/acl/users', 'info.second_address', 'Secondary Address', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(264, 0, 'en', 'core/acl/users', 'info.birth_day', 'Date of birth', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(265, 0, 'en', 'core/acl/users', 'info.job', 'Job Position', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(266, 0, 'en', 'core/acl/users', 'info.mobile_number', 'Mobile Number', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(267, 0, 'en', 'core/acl/users', 'info.second_mobile_number', 'Secondary Phone', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(268, 0, 'en', 'core/acl/users', 'info.interes', 'Interests', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(269, 0, 'en', 'core/acl/users', 'info.about', 'About', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(270, 0, 'en', 'core/acl/users', 'gender.title', 'Gender', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(271, 0, 'en', 'core/acl/users', 'gender.male', 'Male', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(272, 0, 'en', 'core/acl/users', 'gender.female', 'Female', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(273, 0, 'en', 'core/acl/users', 'total_users', 'Total users', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(274, 0, 'en', 'core/acl/users', 'statuses.activated', 'Activated', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(275, 0, 'en', 'core/acl/users', 'statuses.deactivated', 'Deactivated', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(276, 0, 'en', 'core/acl/users', 'make_super', 'Make super', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(277, 0, 'en', 'core/acl/users', 'remove_super', 'Remove super', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(278, 0, 'en', 'core/acl/users', 'is_super', 'Is super?', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(279, 0, 'en', 'core/acl/users', 'email_placeholder', 'Ex: example@gmail.com', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(280, 0, 'en', 'core/acl/users', 'password_confirmation', 'Re-type password', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(281, 0, 'en', 'core/acl/users', 'select_role', 'Select role', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(282, 0, 'en', 'core/acl/users', 'create_new_user', 'Create a new user', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(283, 0, 'en', 'core/acl/users', 'cannot_delete_super_user', 'Permission denied. Cannot delete a super user!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(284, 0, 'en', 'core/acl/users', 'assigned_role', 'Assigned Role', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(285, 0, 'en', 'core/acl/users', 'no_role_assigned', 'No role assigned', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(286, 0, 'en', 'core/acl/users', 'view_user_profile', 'View user\'s profile', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(287, 0, 'vi', 'core/acl/auth', 'login.username', 'Tên truy cập', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(288, 0, 'vi', 'core/acl/auth', 'login.password', 'Mật khẩu', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(289, 0, 'vi', 'core/acl/auth', 'login.title', 'Đăng nhập vào quản trị', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(290, 0, 'vi', 'core/acl/auth', 'login.remember', 'Nhớ mật khẩu?', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(291, 0, 'vi', 'core/acl/auth', 'login.login', 'Đăng nhập', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(292, 0, 'vi', 'core/acl/auth', 'login.placeholder.username', 'Vui lòng nhập tên truy cập', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(293, 0, 'vi', 'core/acl/auth', 'login.placeholder.email', 'Vui lòng nhập email', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(294, 0, 'vi', 'core/acl/auth', 'login.success', 'Đăng nhập thành công!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(295, 0, 'vi', 'core/acl/auth', 'login.fail', 'Sai tên truy cập hoặc mật khẩu.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(296, 0, 'vi', 'core/acl/auth', 'login.not_active', 'Tài khoản của bạn chưa được kích hoạt!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(297, 0, 'vi', 'core/acl/auth', 'login.banned', 'Tài khoản này đã bị khóa.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(298, 0, 'vi', 'core/acl/auth', 'login.logout_success', 'Đăng xuất thành công!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(299, 0, 'vi', 'core/acl/auth', 'login.dont_have_account', 'Bạn không có tài khoản trong hệ thống, vui lòng liên hệ quản trị viên!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(300, 0, 'vi', 'core/acl/auth', 'login.email', 'Email', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(301, 0, 'vi', 'core/acl/auth', 'forgot_password.title', 'Quên mật khẩu', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(302, 0, 'vi', 'core/acl/auth', 'forgot_password.message', '<p>Quên mật khẩu?</p><p>Vui lòng nhập email đăng nhập tài khoản của bạn để hệ thống gửi liên kết khôi phục mật khẩu.</p>', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(303, 0, 'vi', 'core/acl/auth', 'forgot_password.submit', 'Hoàn tất', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(304, 0, 'vi', 'core/acl/auth', 'reset.new_password', 'Mật khẩu mới', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(305, 0, 'vi', 'core/acl/auth', 'reset.title', 'Khôi phục mật khẩu', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(306, 0, 'vi', 'core/acl/auth', 'reset.update', 'Cập nhật', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(307, 0, 'vi', 'core/acl/auth', 'reset.wrong_token', 'Liên kết này không chính xác hoặc đã hết hiệu lực, vui lòng yêu cầu khôi phục mật khẩu lại!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(308, 0, 'vi', 'core/acl/auth', 'reset.user_not_found', 'Tên đăng nhập không tồn tại.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(309, 0, 'vi', 'core/acl/auth', 'reset.success', 'Khôi phục mật khẩu thành công!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(310, 0, 'vi', 'core/acl/auth', 'reset.fail', 'Token không hợp lệ hoặc liên kết khôi phục mật khẩu đã hết thời gian hiệu lực!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(311, 0, 'vi', 'core/acl/auth', 'reset.reset.title', 'Email khôi phục mật khẩu', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(312, 0, 'vi', 'core/acl/auth', 'reset.send.success', 'Một email khôi phục mật khẩu đã được gửi tới email của bạn, vui lòng kiểm tra và hoàn tất yêu cầu.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(313, 0, 'vi', 'core/acl/auth', 'reset.send.fail', 'Không thể gửi email trong lúc này. Vui lòng thực hiện lại sau.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(314, 0, 'vi', 'core/acl/auth', 'reset.new-password', 'Mật khẩu mới', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(315, 0, 'vi', 'core/acl/auth', 'reset.email', 'Email', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(316, 0, 'vi', 'core/acl/auth', 'email.reminder.title', 'Email khôi phục mật khẩu', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(317, 0, 'vi', 'core/acl/auth', 'failed', 'Không thành công', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(318, 0, 'vi', 'core/acl/auth', 'throttle', 'Throttle', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(319, 0, 'vi', 'core/acl/auth', 'back_to_login', 'Quay lại trang đăng nhập', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(320, 0, 'vi', 'core/acl/auth', 'login_title', 'Đăng nhập vào quản trị', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(321, 0, 'vi', 'core/acl/auth', 'login_via_social', 'Đăng nhập thông qua mạng xã hội', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(322, 0, 'vi', 'core/acl/auth', 'lost_your_password', 'Quên mật khẩu?', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(323, 0, 'vi', 'core/acl/auth', 'not_member', 'Chưa là thành viên?', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(324, 0, 'vi', 'core/acl/auth', 'register_now', 'Đăng ký ngay', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(325, 0, 'vi', 'core/acl/permissions', 'notices.role_in_use', 'Không thể xóa quyền người dùng này vì nó đang được sử dụng!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(326, 0, 'vi', 'core/acl/permissions', 'notices.role_delete_belong_user', 'Không thể xóa quyền hạn này vì nó thuộc về người khác!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(327, 0, 'vi', 'core/acl/permissions', 'notices.role_edit_belong_user', 'Bạn không được phép sửa quyền này vì nó thuộc về người khác', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(328, 0, 'vi', 'core/acl/permissions', 'notices.delete_global_role', 'Bạn không thể xóa quyền người dùng hệ thống!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(329, 0, 'vi', 'core/acl/permissions', 'notices.delete_success', 'Quyền người dùng đã được xóa!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(330, 0, 'vi', 'core/acl/permissions', 'notices.modified_success', 'Quyền người dùng đã được cập nhật thành công!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(331, 0, 'vi', 'core/acl/permissions', 'notices.create_success', 'Quyền người dùng mới đã được tạo thành công!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(332, 0, 'vi', 'core/acl/permissions', 'notices.duplicated_success', 'Quyền người dùng đã được sao chép thành công!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(333, 0, 'vi', 'core/acl/permissions', 'notices.no_select', 'Hãy chọn ít nhất một quyền người dùng để thực hiện hành động này!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(334, 0, 'vi', 'core/acl/permissions', 'notices.not_found', 'Không tìm thấy quyền người dùng này', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(335, 0, 'vi', 'core/acl/permissions', 'name', 'Tên', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(336, 0, 'vi', 'core/acl/permissions', 'current_role', 'Quyền hiện tại', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(337, 0, 'vi', 'core/acl/permissions', 'no_role_assigned', 'Không có quyền hạn nào', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(338, 0, 'vi', 'core/acl/permissions', 'role_assigned', 'Quyền đã được gán', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(339, 0, 'vi', 'core/acl/permissions', 'create_role', 'Tạo quyền mới', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(340, 0, 'vi', 'core/acl/permissions', 'role_name', 'Tên', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(341, 0, 'vi', 'core/acl/permissions', 'role_description', 'Mô tả', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(342, 0, 'vi', 'core/acl/permissions', 'permission_flags', 'Cờ đánh dấu quyền hạn', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(343, 0, 'vi', 'core/acl/permissions', 'cancel', 'Hủy bỏ', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(344, 0, 'vi', 'core/acl/permissions', 'reset', 'Làm lại', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(345, 0, 'vi', 'core/acl/permissions', 'save', 'Lưu', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(346, 0, 'vi', 'core/acl/permissions', 'global_role_msg', 'Đây là một phân quyền toàn cục và không thể thay đổi.  Bạn có thể sử dụng nút \"Nhân bản\" để tạo một bản sao chép cho phân quyền này và chỉnh sửa.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(347, 0, 'vi', 'core/acl/permissions', 'details', 'Chi tiết', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(348, 0, 'vi', 'core/acl/permissions', 'duplicate', 'Nhân bản', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(349, 0, 'vi', 'core/acl/permissions', 'all', 'Tất cả phân quyền', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(350, 0, 'vi', 'core/acl/permissions', 'list_role', 'Danh sách quyền', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(351, 0, 'vi', 'core/acl/permissions', 'created_on', 'Ngày tạo', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(352, 0, 'vi', 'core/acl/permissions', 'created_by', 'Được tạo bởi', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(353, 0, 'vi', 'core/acl/permissions', 'actions', 'Tác vụ', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(354, 0, 'vi', 'core/acl/permissions', 'create_success', 'Tạo thành công!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(355, 0, 'vi', 'core/acl/permissions', 'delete_global_role', 'Không thể xóa quyền hệ thống', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(356, 0, 'vi', 'core/acl/permissions', 'delete_success', 'Xóa quyền thành công', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(357, 0, 'vi', 'core/acl/permissions', 'duplicated_success', 'Nhân bản thành công', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(358, 0, 'vi', 'core/acl/permissions', 'modified_success', 'Sửa thành công', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(359, 0, 'vi', 'core/acl/permissions', 'no_select', 'Hãy chọn ít nhất một quyền để thực hiện hành động này!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(360, 0, 'vi', 'core/acl/permissions', 'not_found', 'Không tìm thấy quyền thành viên nào!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(361, 0, 'vi', 'core/acl/permissions', 'options', 'Tùy chọn', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(362, 0, 'vi', 'core/acl/permissions', 'role_delete_belong_user', 'Không thể xóa quyền hạn này vì nó thuộc về người khác!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(363, 0, 'vi', 'core/acl/permissions', 'role_edit_belong_user', 'Bạn không được phép sửa quyền này vì nó thuộc về người khác', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(364, 0, 'vi', 'core/acl/permissions', 'role_in_use', 'Không thể xóa quyền người dùng này vì nó đang được sử dụng!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(365, 0, 'vi', 'core/acl/permissions', 'access_denied_message', 'Bạn không có quyền sử dụng chức năng này!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(366, 0, 'vi', 'core/acl/permissions', 'roles', 'Quyền', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(367, 0, 'vi', 'core/acl/permissions', 'role_permission', 'Nhóm và phân quyền', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(368, 0, 'vi', 'core/acl/permissions', 'user_management', 'Quản lý người dùng hệ thống', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(369, 0, 'vi', 'core/acl/permissions', 'super_user_management', 'Quản lý người dùng cấp cao', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(370, 0, 'vi', 'core/acl/reminders', 'password', 'Mật khẩu phải ít nhất 6 kí tự và trùng khớp với mật khẩu xác nhận.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(371, 0, 'vi', 'core/acl/reminders', 'user', 'Hệ thống không thể tìm thấy tài khoản với email này.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(372, 0, 'vi', 'core/acl/reminders', 'token', 'Mã khôi phục mật khẩu này không hợp lệ.', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(373, 0, 'vi', 'core/acl/reminders', 'sent', 'Liên kết khôi phục mật khẩu đã được gửi!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(374, 0, 'vi', 'core/acl/reminders', 'reset', 'Mật khẩu đã được thay đổi!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(375, 0, 'vi', 'core/acl/users', 'delete_user_logged_in', 'Không thể xóa người dùng đang đăng nhập hệ thống!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(376, 0, 'vi', 'core/acl/users', 'no_select', 'Hãy chọn ít nhất một trường để thực hiện hành động này!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(377, 0, 'vi', 'core/acl/users', 'lock_user_logged_in', 'Không thể khóa người dùng đang đăng nhập hệ thống!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(378, 0, 'vi', 'core/acl/users', 'update_success', 'Cập nhật trạng thái thành công!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(379, 0, 'vi', 'core/acl/users', 'save_setting_failed', 'Có lỗi xảy ra trong quá trình lưu cài đặt của người dùng', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(380, 0, 'vi', 'core/acl/users', 'not_found', 'Không tìm thấy người dùng', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(381, 0, 'vi', 'core/acl/users', 'email_exist', 'Email này đã được sử dụng bởi người dùng khác trong hệ thống', '2021-08-18 04:43:41', '2021-08-18 04:44:11');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(382, 0, 'vi', 'core/acl/users', 'username_exist', 'Tên đăng nhập này đã được sử dụng bởi người dùng khác trong hệ thống', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(383, 0, 'vi', 'core/acl/users', 'update_profile_success', 'Thông tin tài khoản của bạn đã được cập nhật thành công', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(384, 0, 'vi', 'core/acl/users', 'password_update_success', 'Cập nhật mật khẩu thành công', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(385, 0, 'vi', 'core/acl/users', 'current_password_not_valid', 'Mật khẩu hiện tại không chính xác', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(386, 0, 'vi', 'core/acl/users', 'user_exist_in', 'Người dùng đã là thành viên', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(387, 0, 'vi', 'core/acl/users', 'email', 'Email', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(388, 0, 'vi', 'core/acl/users', 'username', 'Tên đăng nhập', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(389, 0, 'vi', 'core/acl/users', 'role', 'Phân quyền', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(390, 0, 'vi', 'core/acl/users', 'first_name', 'Họ', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(391, 0, 'vi', 'core/acl/users', 'last_name', 'Tên', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(392, 0, 'vi', 'core/acl/users', 'message', 'Thông điệp', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(393, 0, 'vi', 'core/acl/users', 'cancel_btn', 'Hủy bỏ', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(394, 0, 'vi', 'core/acl/users', 'password', 'Mật khẩu', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(395, 0, 'vi', 'core/acl/users', 'new_password', 'Mật khẩu mới', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(396, 0, 'vi', 'core/acl/users', 'save', 'Lưu', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(397, 0, 'vi', 'core/acl/users', 'confirm_new_password', 'Xác nhận mật khẩu mới', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(398, 0, 'vi', 'core/acl/users', 'deleted', 'Xóa thành viên thành công', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(399, 0, 'vi', 'core/acl/users', 'cannot_delete', 'Không thể xóa thành viên', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(400, 0, 'vi', 'core/acl/users', 'last_login', 'Lần cuối đăng nhập', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(401, 0, 'vi', 'core/acl/users', 'error_update_profile_image', 'Có lỗi trong quá trình đổi ảnh đại diện', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(402, 0, 'vi', 'core/acl/users', 'email_reminder_template', '<h3>Xin chào :name</h3><p>Hệ thống vừa nhận được yêu cầu khôi phục mật khẩu cho tài khoản của bạn, để hoàn tất tác vụ này vui lòng click vào đường link bên dưới.</p><p><a href=\":link\">Khôi phục mật khẩu</a></p><p>Nếu không phải bạn yêu cầu khôi phục mật khẩu, vui lòng bỏ qua email này.</p><p>Email này có giá trị trong vòng 60 phút kể từ lúc nhận được email.</p>', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(403, 0, 'vi', 'core/acl/users', 'change_profile_image', 'Thay đổi ảnh đại diện', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(404, 0, 'vi', 'core/acl/users', 'new_image', 'Ảnh mới', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(405, 0, 'vi', 'core/acl/users', 'loading', 'Đang tải', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(406, 0, 'vi', 'core/acl/users', 'close', 'Đóng', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(407, 0, 'vi', 'core/acl/users', 'update', 'Cập nhật', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(408, 0, 'vi', 'core/acl/users', 'read_image_failed', 'Không đọc được nội dung của hình ảnh', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(409, 0, 'vi', 'core/acl/users', 'update_avatar_success', 'Cập nhật ảnh đại diện thành công!', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(410, 0, 'vi', 'core/acl/users', 'users', 'Quản trị viên', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(411, 0, 'vi', 'core/acl/users', 'info.title', 'Thông tin người dùng', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(412, 0, 'vi', 'core/acl/users', 'info.first_name', 'Họ', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(413, 0, 'vi', 'core/acl/users', 'info.last_name', 'Tên', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(414, 0, 'vi', 'core/acl/users', 'info.email', 'Email', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(415, 0, 'vi', 'core/acl/users', 'info.second_email', 'Email dự phòng', '2021-08-18 04:43:41', '2021-08-18 04:44:11'),
(416, 0, 'vi', 'core/acl/users', 'info.address', 'Địa chỉ', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(417, 0, 'vi', 'core/acl/users', 'info.second_address', 'Địa chỉ dự phòng', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(418, 0, 'vi', 'core/acl/users', 'info.birth_day', 'Ngày sinh', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(419, 0, 'vi', 'core/acl/users', 'info.job', 'Nghề nghiệp', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(420, 0, 'vi', 'core/acl/users', 'info.mobile_number', 'Số điện thoại di động', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(421, 0, 'vi', 'core/acl/users', 'info.second_mobile_number', 'Số điện thoại dự phòng', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(422, 0, 'vi', 'core/acl/users', 'info.interes', 'Sở thích', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(423, 0, 'vi', 'core/acl/users', 'info.about', 'Giới thiệu', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(424, 0, 'vi', 'core/acl/users', 'gender.title', 'Giới tính', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(425, 0, 'vi', 'core/acl/users', 'gender.male', 'nam', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(426, 0, 'vi', 'core/acl/users', 'gender.female', 'nữ', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(427, 0, 'vi', 'core/acl/users', 'change_password', 'Thay đổi mật khẩu', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(428, 0, 'vi', 'core/acl/users', 'current_password', 'Mật khẩu hiện tại', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(429, 0, 'en', 'core/base/base', 'yes', 'Yes', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(430, 0, 'en', 'core/base/base', 'no', 'No', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(431, 0, 'en', 'core/base/base', 'is_default', 'Is default?', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(432, 0, 'en', 'core/base/base', 'proc_close_disabled_error', 'Function proc_close() is disabled. Please contact your hosting provider to enable\n    it. Or you can add to .env: CAN_EXECUTE_COMMAND=false to disable this feature.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(433, 0, 'en', 'core/base/base', 'email_template.header', 'Email template header', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(434, 0, 'en', 'core/base/base', 'email_template.footer', 'Email template footer', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(435, 0, 'en', 'core/base/base', 'email_template.site_title', 'Site title', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(436, 0, 'en', 'core/base/base', 'email_template.site_url', 'Site URL', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(437, 0, 'en', 'core/base/base', 'email_template.site_logo', 'Site Logo', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(438, 0, 'en', 'core/base/base', 'email_template.date_time', 'Current date time', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(439, 0, 'en', 'core/base/base', 'email_template.date_year', 'Current year', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(440, 0, 'en', 'core/base/base', 'email_template.site_admin_email', 'Site admin email', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(441, 0, 'en', 'core/base/base', 'change_image', 'Change image', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(442, 0, 'en', 'core/base/base', 'delete_image', 'Delete image', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(443, 0, 'en', 'core/base/base', 'preview_image', 'Preview image', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(444, 0, 'en', 'core/base/base', 'image', 'Image', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(445, 0, 'en', 'core/base/base', 'using_button', 'Using button', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(446, 0, 'en', 'core/base/base', 'select_image', 'Select image', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(447, 0, 'en', 'core/base/base', 'to_add_more_image', 'to add more images', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(448, 0, 'en', 'core/base/base', 'add_image', 'Add image', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(449, 0, 'en', 'core/base/base', 'tools', 'Tools', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(450, 0, 'en', 'core/base/cache', 'cache_management', 'Cache management', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(451, 0, 'en', 'core/base/cache', 'cache_commands', 'Clear cache commands', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(452, 0, 'en', 'core/base/cache', 'commands.clear_cms_cache.title', 'Clear all CMS cache', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(453, 0, 'en', 'core/base/cache', 'commands.clear_cms_cache.description', 'Clear CMS caching: database caching, static blocks... Run this command when you don\'t see the changes after updating data.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(454, 0, 'en', 'core/base/cache', 'commands.clear_cms_cache.success_msg', 'Cache cleaned', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(455, 0, 'en', 'core/base/cache', 'commands.refresh_compiled_views.title', 'Refresh compiled views', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(456, 0, 'en', 'core/base/cache', 'commands.refresh_compiled_views.description', 'Clear compiled views to make views up to date.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(457, 0, 'en', 'core/base/cache', 'commands.refresh_compiled_views.success_msg', 'Cache view refreshed', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(458, 0, 'en', 'core/base/cache', 'commands.clear_config_cache.title', 'Clear config cache', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(459, 0, 'en', 'core/base/cache', 'commands.clear_config_cache.description', 'You might need to refresh the config caching when you change something on production environment.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(460, 0, 'en', 'core/base/cache', 'commands.clear_config_cache.success_msg', 'Config cache cleaned', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(461, 0, 'en', 'core/base/cache', 'commands.clear_route_cache.title', 'Clear route cache', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(462, 0, 'en', 'core/base/cache', 'commands.clear_route_cache.description', 'Clear cache routing.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(463, 0, 'en', 'core/base/cache', 'commands.clear_route_cache.success_msg', 'The route cache has been cleaned', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(464, 0, 'en', 'core/base/cache', 'commands.clear_log.title', 'Clear log', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(465, 0, 'en', 'core/base/cache', 'commands.clear_log.description', 'Clear system log files', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(466, 0, 'en', 'core/base/cache', 'commands.clear_log.success_msg', 'The system log has been cleaned', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(467, 0, 'en', 'core/base/enums', 'statuses.draft', 'Draft', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(468, 0, 'en', 'core/base/enums', 'statuses.pending', 'Pending', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(469, 0, 'en', 'core/base/enums', 'statuses.published', 'Published', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(470, 0, 'en', 'core/base/errors', '401_title', 'Permission Denied', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(471, 0, 'en', 'core/base/errors', '401_msg', '<li>You have not been granted access to the section by the administrator.</li>\n	                <li>You may have the wrong account type.</li>\n	                <li>You are not authorized to view the requested resource.</li>\n	                <li>Your subscription may have expired.</li>', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(472, 0, 'en', 'core/base/errors', '404_title', 'Page could not be found', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(473, 0, 'en', 'core/base/errors', '404_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(474, 0, 'en', 'core/base/errors', '500_title', 'Page could not be loaded', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(475, 0, 'en', 'core/base/errors', '500_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(476, 0, 'en', 'core/base/errors', 'reasons', 'This may have occurred because of several reasons', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(477, 0, 'en', 'core/base/errors', 'try_again', 'Please try again in a few minutes, or alternatively return to the homepage by <a href=\"http://martfury.local/admin\">clicking here</a>.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(478, 0, 'en', 'core/base/errors', 'not_found', 'Not Found', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(479, 0, 'en', 'core/base/forms', 'choose_image', 'Choose image', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(480, 0, 'en', 'core/base/forms', 'actions', 'Actions', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(481, 0, 'en', 'core/base/forms', 'save', 'Save', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(482, 0, 'en', 'core/base/forms', 'save_and_continue', 'Save & Edit', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(483, 0, 'en', 'core/base/forms', 'image', 'Image', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(484, 0, 'en', 'core/base/forms', 'image_placeholder', 'Insert path of image or click upload button', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(485, 0, 'en', 'core/base/forms', 'create', 'Create', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(486, 0, 'en', 'core/base/forms', 'edit', 'Edit', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(487, 0, 'en', 'core/base/forms', 'permalink', 'Permalink', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(488, 0, 'en', 'core/base/forms', 'ok', 'OK', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(489, 0, 'en', 'core/base/forms', 'cancel', 'Cancel', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(490, 0, 'en', 'core/base/forms', 'character_remain', 'character(s) remain', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(491, 0, 'en', 'core/base/forms', 'template', 'Template', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(492, 0, 'en', 'core/base/forms', 'choose_file', 'Choose file', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(493, 0, 'en', 'core/base/forms', 'file', 'File', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(494, 0, 'en', 'core/base/forms', 'content', 'Content', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(495, 0, 'en', 'core/base/forms', 'description', 'Description', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(496, 0, 'en', 'core/base/forms', 'name', 'Name', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(497, 0, 'en', 'core/base/forms', 'slug', 'Slug', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(498, 0, 'en', 'core/base/forms', 'title', 'Title', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(499, 0, 'en', 'core/base/forms', 'value', 'Value', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(500, 0, 'en', 'core/base/forms', 'name_placeholder', 'Name', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(501, 0, 'en', 'core/base/forms', 'alias_placeholder', 'Alias', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(502, 0, 'en', 'core/base/forms', 'description_placeholder', 'Short description', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(503, 0, 'en', 'core/base/forms', 'parent', 'Parent', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(504, 0, 'en', 'core/base/forms', 'icon', 'Icon', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(505, 0, 'en', 'core/base/forms', 'icon_placeholder', 'Ex: fa fa-home', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(506, 0, 'en', 'core/base/forms', 'order_by', 'Order by', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(507, 0, 'en', 'core/base/forms', 'order_by_placeholder', 'Order by', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(508, 0, 'en', 'core/base/forms', 'is_featured', 'Is featured?', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(509, 0, 'en', 'core/base/forms', 'is_default', 'Is default?', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(510, 0, 'en', 'core/base/forms', 'update', 'Update', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(511, 0, 'en', 'core/base/forms', 'publish', 'Publish', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(512, 0, 'en', 'core/base/forms', 'remove_image', 'Remove image', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(513, 0, 'en', 'core/base/forms', 'remove_file', 'Remove file', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(514, 0, 'en', 'core/base/forms', 'order', 'Order', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(515, 0, 'en', 'core/base/forms', 'alias', 'Alias', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(516, 0, 'en', 'core/base/forms', 'basic_information', 'Basic information', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(517, 0, 'en', 'core/base/forms', 'short_code', 'Shortcode', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(518, 0, 'en', 'core/base/forms', 'add_short_code', 'Add a shortcode', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(519, 0, 'en', 'core/base/forms', 'add', 'Add', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(520, 0, 'en', 'core/base/forms', 'link', 'Link', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(521, 0, 'en', 'core/base/forms', 'show_hide_editor', 'Show/Hide Editor', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(522, 0, 'en', 'core/base/forms', 'basic_info_title', 'Basic information', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(523, 0, 'en', 'core/base/forms', 'expand_all', 'Expand all', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(524, 0, 'en', 'core/base/forms', 'collapse_all', 'Collapse all', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(525, 0, 'en', 'core/base/forms', 'view_new_tab', 'Open in new tab', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(526, 0, 'en', 'core/base/layouts', 'platform_admin', 'Platform Administration', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(527, 0, 'en', 'core/base/layouts', 'dashboard', 'Dashboard', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(528, 0, 'en', 'core/base/layouts', 'widgets', 'Widgets', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(529, 0, 'en', 'core/base/layouts', 'plugins', 'Plugins', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(530, 0, 'en', 'core/base/layouts', 'settings', 'Settings', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(531, 0, 'en', 'core/base/layouts', 'setting_general', 'General', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(532, 0, 'en', 'core/base/layouts', 'setting_email', 'Email', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(533, 0, 'en', 'core/base/layouts', 'system_information', 'System information', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(534, 0, 'en', 'core/base/layouts', 'theme', 'Theme', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(535, 0, 'en', 'core/base/layouts', 'copyright', 'Copyright :year &copy; :company. Version: <span>:version</span>', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(536, 0, 'en', 'core/base/layouts', 'profile', 'Profile', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(537, 0, 'en', 'core/base/layouts', 'logout', 'Logout', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(538, 0, 'en', 'core/base/layouts', 'no_search_result', 'No results found, please try with different keywords.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(539, 0, 'en', 'core/base/layouts', 'home', 'Home', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(540, 0, 'en', 'core/base/layouts', 'search', 'Search', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(541, 0, 'en', 'core/base/layouts', 'add_new', 'Add new', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(542, 0, 'en', 'core/base/layouts', 'n_a', 'N/A', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(543, 0, 'en', 'core/base/layouts', 'page_loaded_time', 'Page loaded in', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(544, 0, 'en', 'core/base/layouts', 'view_website', 'View website', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(545, 0, 'en', 'core/base/mail', 'send-fail', 'Send email failed', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(546, 0, 'en', 'core/base/notices', 'create_success_message', 'Created successfully', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(547, 0, 'en', 'core/base/notices', 'update_success_message', 'Updated successfully', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(548, 0, 'en', 'core/base/notices', 'delete_success_message', 'Deleted successfully', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(549, 0, 'en', 'core/base/notices', 'success_header', 'Success!', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(550, 0, 'en', 'core/base/notices', 'error_header', 'Error!', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(551, 0, 'en', 'core/base/notices', 'no_select', 'Please select at least one record to perform this action!', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(552, 0, 'en', 'core/base/notices', 'processing_request', 'We are processing your request.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(553, 0, 'en', 'core/base/notices', 'error', 'Error!', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(554, 0, 'en', 'core/base/notices', 'success', 'Success!', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(555, 0, 'en', 'core/base/notices', 'info', 'Info!', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(556, 0, 'en', 'core/base/notices', 'enum.validate_message', 'The :attribute value you have entered is invalid.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(557, 0, 'en', 'core/base/system', 'no_select', 'Please select at least one record to take this action!', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(558, 0, 'en', 'core/base/system', 'cannot_find_user', 'Unable to find specified user', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(559, 0, 'en', 'core/base/system', 'supper_revoked', 'Super user access revoked', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(560, 0, 'en', 'core/base/system', 'cannot_revoke_yourself', 'Can not revoke supper user access permission yourself!', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(561, 0, 'en', 'core/base/system', 'cant_remove_supper', 'You don\'t has permission to remove this super user', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(562, 0, 'en', 'core/base/system', 'cant_find_user_with_email', 'Unable to find user with specified email address', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(563, 0, 'en', 'core/base/system', 'supper_granted', 'Super user access granted', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(564, 0, 'en', 'core/base/system', 'delete_log_success', 'Delete log file successfully!', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(565, 0, 'en', 'core/base/system', 'get_member_success', 'Member list retrieved successfully', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(566, 0, 'en', 'core/base/system', 'error_occur', 'The following errors occurred', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(567, 0, 'en', 'core/base/system', 'user_management', 'User Management', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(568, 0, 'en', 'core/base/system', 'user_management_description', 'Manage users.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(569, 0, 'en', 'core/base/system', 'role_and_permission', 'Roles and Permissions', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(570, 0, 'en', 'core/base/system', 'role_and_permission_description', 'Manage the available roles.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(571, 0, 'en', 'core/base/system', 'user.list_super', 'List Super Users', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(572, 0, 'en', 'core/base/system', 'user.email', 'Email', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(573, 0, 'en', 'core/base/system', 'user.last_login', 'Last Login', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(574, 0, 'en', 'core/base/system', 'user.username', 'Username', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(575, 0, 'en', 'core/base/system', 'user.add_user', 'Add Super User', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(576, 0, 'en', 'core/base/system', 'user.cancel', 'Cancel', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(577, 0, 'en', 'core/base/system', 'user.create', 'Create', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(578, 0, 'en', 'core/base/system', 'options.features', 'Feature Access Control', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(579, 0, 'en', 'core/base/system', 'options.feature_description', 'Manage the available.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(580, 0, 'en', 'core/base/system', 'options.manage_super', 'Super User Management', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(581, 0, 'en', 'core/base/system', 'options.manage_super_description', 'Add/remove super users.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(582, 0, 'en', 'core/base/system', 'options.info', 'System information', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(583, 0, 'en', 'core/base/system', 'options.info_description', 'All information about current system configuration.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(584, 0, 'en', 'core/base/system', 'info.title', 'System information', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(585, 0, 'en', 'core/base/system', 'info.cache', 'Cache', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(586, 0, 'en', 'core/base/system', 'info.locale', 'Active locale', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(587, 0, 'en', 'core/base/system', 'info.environment', 'Environment', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(588, 0, 'en', 'core/base/system', 'disabled_in_demo_mode', 'You cannot do it in demo mode!', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(589, 0, 'en', 'core/base/system', 'report_description', 'Please share this information for troubleshooting', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(590, 0, 'en', 'core/base/system', 'get_system_report', 'Get System Report', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(591, 0, 'en', 'core/base/system', 'system_environment', 'System Environment', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(592, 0, 'en', 'core/base/system', 'framework_version', 'Framework Version', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(593, 0, 'en', 'core/base/system', 'timezone', 'Timezone', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(594, 0, 'en', 'core/base/system', 'debug_mode', 'Debug Mode', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(595, 0, 'en', 'core/base/system', 'storage_dir_writable', 'Storage Dir Writable', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(596, 0, 'en', 'core/base/system', 'cache_dir_writable', 'Cache Dir Writable', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(597, 0, 'en', 'core/base/system', 'app_size', 'App Size', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(598, 0, 'en', 'core/base/system', 'server_environment', 'Server Environment', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(599, 0, 'en', 'core/base/system', 'php_version', 'PHP Version', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(600, 0, 'en', 'core/base/system', 'php_version_error', 'PHP must be >= :version', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(601, 0, 'en', 'core/base/system', 'server_software', 'Server Software', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(602, 0, 'en', 'core/base/system', 'server_os', 'Server OS', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(603, 0, 'en', 'core/base/system', 'database', 'Database', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(604, 0, 'en', 'core/base/system', 'ssl_installed', 'SSL Installed', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(605, 0, 'en', 'core/base/system', 'cache_driver', 'Cache Driver', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(606, 0, 'en', 'core/base/system', 'session_driver', 'Session Driver', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(607, 0, 'en', 'core/base/system', 'queue_connection', 'Queue Connection', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(608, 0, 'en', 'core/base/system', 'mbstring_ext', 'Mbstring Ext', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(609, 0, 'en', 'core/base/system', 'openssl_ext', 'OpenSSL Ext', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(610, 0, 'en', 'core/base/system', 'pdo_ext', 'PDO Ext', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(611, 0, 'en', 'core/base/system', 'curl_ext', 'CURL Ext', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(612, 0, 'en', 'core/base/system', 'exif_ext', 'Exif Ext', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(613, 0, 'en', 'core/base/system', 'file_info_ext', 'File info Ext', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(614, 0, 'en', 'core/base/system', 'tokenizer_ext', 'Tokenizer Ext', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(615, 0, 'en', 'core/base/system', 'extra_stats', 'Extra Stats', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(616, 0, 'en', 'core/base/system', 'installed_packages', 'Installed packages and their version numbers', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(617, 0, 'en', 'core/base/system', 'extra_information', 'Extra Information', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(618, 0, 'en', 'core/base/system', 'copy_report', 'Copy Report', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(619, 0, 'en', 'core/base/system', 'package_name', 'Package Name', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(620, 0, 'en', 'core/base/system', 'dependency_name', 'Dependency Name', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(621, 0, 'en', 'core/base/system', 'version', 'Version', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(622, 0, 'en', 'core/base/system', 'cms_version', 'CMS Version', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(623, 0, 'en', 'core/base/system', 'imagick_or_gd_ext', 'Imagick/GD Ext', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(624, 0, 'en', 'core/base/tables', 'id', 'ID', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(625, 0, 'en', 'core/base/tables', 'name', 'Name', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(626, 0, 'en', 'core/base/tables', 'slug', 'Slug', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(627, 0, 'en', 'core/base/tables', 'title', 'Title', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(628, 0, 'en', 'core/base/tables', 'order_by', 'Order By', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(629, 0, 'en', 'core/base/tables', 'order', 'Order', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(630, 0, 'en', 'core/base/tables', 'status', 'Status', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(631, 0, 'en', 'core/base/tables', 'created_at', 'Created At', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(632, 0, 'en', 'core/base/tables', 'updated_at', 'Updated At', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(633, 0, 'en', 'core/base/tables', 'description', 'Description', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(634, 0, 'en', 'core/base/tables', 'operations', 'Operations', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(635, 0, 'en', 'core/base/tables', 'url', 'URL', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(636, 0, 'en', 'core/base/tables', 'author', 'Author', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(637, 0, 'en', 'core/base/tables', 'notes', 'Notes', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(638, 0, 'en', 'core/base/tables', 'column', 'Column', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(639, 0, 'en', 'core/base/tables', 'origin', 'Origin', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(640, 0, 'en', 'core/base/tables', 'after_change', 'After changes', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(641, 0, 'en', 'core/base/tables', 'views', 'Views', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(642, 0, 'en', 'core/base/tables', 'browser', 'Browser', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(643, 0, 'en', 'core/base/tables', 'session', 'Session', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(644, 0, 'en', 'core/base/tables', 'activated', 'activated', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(645, 0, 'en', 'core/base/tables', 'deactivated', 'deactivated', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(646, 0, 'en', 'core/base/tables', 'is_featured', 'Is featured', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(647, 0, 'en', 'core/base/tables', 'edit', 'Edit', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(648, 0, 'en', 'core/base/tables', 'delete', 'Delete', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(649, 0, 'en', 'core/base/tables', 'restore', 'Restore', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(650, 0, 'en', 'core/base/tables', 'activate', 'Activate', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(651, 0, 'en', 'core/base/tables', 'deactivate', 'Deactivate', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(652, 0, 'en', 'core/base/tables', 'excel', 'Excel', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(653, 0, 'en', 'core/base/tables', 'export', 'Export', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(654, 0, 'en', 'core/base/tables', 'csv', 'CSV', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(655, 0, 'en', 'core/base/tables', 'pdf', 'PDF', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(656, 0, 'en', 'core/base/tables', 'print', 'Print', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(657, 0, 'en', 'core/base/tables', 'reset', 'Reset', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(658, 0, 'en', 'core/base/tables', 'reload', 'Reload', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(659, 0, 'en', 'core/base/tables', 'display', 'Display', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(660, 0, 'en', 'core/base/tables', 'all', 'All', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(661, 0, 'en', 'core/base/tables', 'add_new', 'Add New', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(662, 0, 'en', 'core/base/tables', 'action', 'Actions', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(663, 0, 'en', 'core/base/tables', 'delete_entry', 'Delete', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(664, 0, 'en', 'core/base/tables', 'view', 'View Detail', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(665, 0, 'en', 'core/base/tables', 'save', 'Save', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(666, 0, 'en', 'core/base/tables', 'show_from', 'Show from', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(667, 0, 'en', 'core/base/tables', 'to', 'to', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(668, 0, 'en', 'core/base/tables', 'in', 'in', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(669, 0, 'en', 'core/base/tables', 'records', 'records', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(670, 0, 'en', 'core/base/tables', 'no_data', 'No data to display', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(671, 0, 'en', 'core/base/tables', 'no_record', 'No record', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(672, 0, 'en', 'core/base/tables', 'confirm_delete', 'Confirm delete', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(673, 0, 'en', 'core/base/tables', 'confirm_delete_msg', 'Do you really want to delete this record?', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(674, 0, 'en', 'core/base/tables', 'confirm_delete_many_msg', 'Do you really want to delete selected record(s)?', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(675, 0, 'en', 'core/base/tables', 'cancel', 'Cancel', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(676, 0, 'en', 'core/base/tables', 'template', 'Template', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(677, 0, 'en', 'core/base/tables', 'email', 'Email', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(678, 0, 'en', 'core/base/tables', 'last_login', 'Last login', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(679, 0, 'en', 'core/base/tables', 'shortcode', 'Shortcode', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(680, 0, 'en', 'core/base/tables', 'image', 'Image', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(681, 0, 'en', 'core/base/tables', 'bulk_changes', 'Bulk changes', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(682, 0, 'en', 'core/base/tables', 'submit', 'Submit', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(683, 0, 'en', 'core/base/tables', 'please_select_record', 'Please select at least one record to perform this action!', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(684, 0, 'en', 'core/base/tabs', 'detail', 'Detail', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(685, 0, 'en', 'core/base/tabs', 'file', 'Files', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(686, 0, 'en', 'core/base/tabs', 'record_note', 'Record Note', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(687, 0, 'en', 'core/base/tabs', 'revision', 'Revision History', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(688, 0, 'vi', 'core/base/cache', 'cache_management', 'Quản lý bộ nhớ đệm', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(689, 0, 'vi', 'core/base/cache', 'cache_commands', 'Các lệnh xoá bộ nhớ đệm cơ bản', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(690, 0, 'vi', 'core/base/cache', 'commands.clear_cms_cache.title', 'Xóa tất cả bộ đệm hiện có của ứng dụng', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(691, 0, 'vi', 'core/base/cache', 'commands.clear_cms_cache.description', 'Xóa các bộ nhớ đệm của ứng dụng: cơ sở dữ liệu, nội dung tĩnh... Chạy lệnh này khi bạn thử cập nhật dữ liệu nhưng giao diện không thay đổi', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(692, 0, 'vi', 'core/base/cache', 'commands.clear_cms_cache.success_msg', 'Bộ đệm đã được xóa', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(693, 0, 'vi', 'core/base/cache', 'commands.refresh_compiled_views.title', 'Làm mới bộ đệm giao diện', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(694, 0, 'vi', 'core/base/cache', 'commands.refresh_compiled_views.description', 'Làm mới bộ đệm giao diện giúp phần giao diện luôn mới nhất', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(695, 0, 'vi', 'core/base/cache', 'commands.refresh_compiled_views.success_msg', 'Bộ đệm giao diện đã được làm mới', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(696, 0, 'vi', 'core/base/cache', 'commands.clear_config_cache.title', 'Xóa bộ nhớ đệm của phần cấu hình', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(697, 0, 'vi', 'core/base/cache', 'commands.clear_config_cache.description', 'Bạn cần làm mới bộ đệm cấu hình khi bạn tạo ra sự thay đổi nào đó ở môi trường thành phẩm.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(698, 0, 'vi', 'core/base/cache', 'commands.clear_config_cache.success_msg', 'Bộ đệm cấu hình đã được xóa', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(699, 0, 'vi', 'core/base/cache', 'commands.clear_route_cache.title', 'Xoá cache đường dẫn', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(700, 0, 'vi', 'core/base/cache', 'commands.clear_route_cache.description', 'Cần thực hiện thao tác này khi thấy không xuất hiện đường dẫn mới.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(701, 0, 'vi', 'core/base/cache', 'commands.clear_route_cache.success_msg', 'Bộ đệm điều hướng đã bị xóa', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(702, 0, 'vi', 'core/base/cache', 'commands.clear_log.description', 'Xoá lịch sử lỗi', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(703, 0, 'vi', 'core/base/cache', 'commands.clear_log.success_msg', 'Lịch sử lỗi đã được làm sạch', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(704, 0, 'vi', 'core/base/cache', 'commands.clear_log.title', 'Xoá lịch sử lỗi', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(705, 0, 'vi', 'core/base/enums', 'statuses.draft', 'Bản nháp', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(706, 0, 'vi', 'core/base/enums', 'statuses.pending', 'Đang chờ xử lý', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(707, 0, 'vi', 'core/base/errors', '401_title', 'Bạn không có quyền truy cập trang này', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(708, 0, 'vi', 'core/base/errors', '401_msg', '<li>Bạn không được cấp quyền truy cập bởi quản trị viên.</li>\n	                <li>Bạn sử dụng sai loại tài khoản.</li>\n	                <li>Bạn không được cấp quyền để có thể truy cập trang này</li>', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(709, 0, 'vi', 'core/base/errors', '404_title', 'Không tìm thấy trang yêu cầu', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(710, 0, 'vi', 'core/base/errors', '404_msg', '<li>Trang bạn yêu cầu không tồn tại.</li>\n	                <li>Liên kết bạn vừa nhấn không còn được sử dụng.</li>\n	                <li>Trang này có thể đã được chuyển sang vị trí khác.</li>\n	                <li>Có thể có lỗi xảy ra.</li>\n	                <li>Bạn không được cấp quyền để có thể truy cập trang này</li>', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(711, 0, 'vi', 'core/base/errors', '500_title', 'Không thể tải trang', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(712, 0, 'vi', 'core/base/errors', '500_msg', '<li>Trang bạn yêu cầu không tồn tại.</li>\n	                <li>Liên kết bạn vừa nhấn không còn được sử dụng.</li>\n	                <li>Trang này có thể đã được chuyển sang vị trí khác.</li>\n	                <li>Có thể có lỗi xảy ra.</li>\n	                <li>Bạn không được cấp quyền để có thể truy cập trang này</li>', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(713, 0, 'vi', 'core/base/errors', 'reasons', 'Điều này có thể xảy ra vì nhiều lý do.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(714, 0, 'vi', 'core/base/errors', 'try_again', 'Vui lòng thử lại trong vài phút, hoặc quay trở lại trang chủ bằng cách <a href=\"http://cms.local/admin\"> nhấn vào đây </a>.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(715, 0, 'vi', 'core/base/forms', 'choose_image', 'Chọn ảnh', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(716, 0, 'vi', 'core/base/forms', 'actions', 'Tác vụ', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(717, 0, 'vi', 'core/base/forms', 'save', 'Lưu', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(718, 0, 'vi', 'core/base/forms', 'save_and_continue', 'Lưu & chỉnh sửa', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(719, 0, 'vi', 'core/base/forms', 'image', 'Hình ảnh', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(720, 0, 'vi', 'core/base/forms', 'image_placeholder', 'Chèn đường dẫn hình ảnh hoặc nhấn nút để chọn hình', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(721, 0, 'vi', 'core/base/forms', 'create', 'Tạo mới', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(722, 0, 'vi', 'core/base/forms', 'edit', 'Sửa', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(723, 0, 'vi', 'core/base/forms', 'permalink', 'Đường dẫn', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(724, 0, 'vi', 'core/base/forms', 'ok', 'OK', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(725, 0, 'vi', 'core/base/forms', 'cancel', 'Hủy bỏ', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(726, 0, 'vi', 'core/base/forms', 'character_remain', 'kí tự còn lại', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(727, 0, 'vi', 'core/base/forms', 'template', 'Template', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(728, 0, 'vi', 'core/base/forms', 'choose_file', 'Chọn tập tin', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(729, 0, 'vi', 'core/base/forms', 'file', 'Tập tin', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(730, 0, 'vi', 'core/base/forms', 'content', 'Nội dung', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(731, 0, 'vi', 'core/base/forms', 'description', 'Mô tả', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(732, 0, 'vi', 'core/base/forms', 'name', 'Tên', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(733, 0, 'vi', 'core/base/forms', 'name_placeholder', 'Nhập tên', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(734, 0, 'vi', 'core/base/forms', 'description_placeholder', 'Mô tả ngắn', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(735, 0, 'vi', 'core/base/forms', 'parent', 'Cha', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(736, 0, 'vi', 'core/base/forms', 'icon', 'Biểu tượng', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(737, 0, 'vi', 'core/base/forms', 'order_by', 'Sắp xếp', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(738, 0, 'vi', 'core/base/forms', 'order_by_placeholder', 'Sắp xếp', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(739, 0, 'vi', 'core/base/forms', 'slug', 'Slug', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(740, 0, 'vi', 'core/base/forms', 'is_featured', 'Nổi bật?', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(741, 0, 'vi', 'core/base/forms', 'is_default', 'Mặc định?', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(742, 0, 'vi', 'core/base/forms', 'icon_placeholder', 'Ví dụ: fa fa-home', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(743, 0, 'vi', 'core/base/forms', 'update', 'Cập nhật', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(744, 0, 'vi', 'core/base/forms', 'publish', 'Xuất bản', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(745, 0, 'vi', 'core/base/forms', 'remove_image', 'Xoá ảnh', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(746, 0, 'vi', 'core/base/forms', 'add', 'Thêm', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(747, 0, 'vi', 'core/base/forms', 'add_short_code', 'Thêm shortcode', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(748, 0, 'vi', 'core/base/forms', 'alias', 'Mã thay thế', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(749, 0, 'vi', 'core/base/forms', 'alias_placeholder', 'Mã thay thế', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(750, 0, 'vi', 'core/base/forms', 'basic_information', 'Thông tin cơ bản', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(751, 0, 'vi', 'core/base/forms', 'link', 'Liên kết', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(752, 0, 'vi', 'core/base/forms', 'order', 'Thứ tự', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(753, 0, 'vi', 'core/base/forms', 'short_code', 'Shortcode', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(754, 0, 'vi', 'core/base/forms', 'title', 'Tiêu đề', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(755, 0, 'vi', 'core/base/forms', 'value', 'Giá trị', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(756, 0, 'vi', 'core/base/forms', 'show_hide_editor', 'Ẩn/Hiện trình soạn thảo', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(757, 0, 'vi', 'core/base/forms', 'basic_info_title', 'Thông tin cơ bản', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(758, 0, 'vi', 'core/base/layouts', 'platform_admin', 'Quản trị hệ thống', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(759, 0, 'vi', 'core/base/layouts', 'dashboard', 'Bảng điều khiển', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(760, 0, 'vi', 'core/base/layouts', 'widgets', 'Tiện ích', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(761, 0, 'vi', 'core/base/layouts', 'plugins', 'Tiện ích mở rộng', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(762, 0, 'vi', 'core/base/layouts', 'settings', 'Cài đặt', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(763, 0, 'vi', 'core/base/layouts', 'setting_general', 'Cơ bản', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(764, 0, 'vi', 'core/base/layouts', 'system_information', 'Thông tin hệ thống', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(765, 0, 'vi', 'core/base/layouts', 'theme', 'Giao diện', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(766, 0, 'vi', 'core/base/layouts', 'copyright', 'Bản quyền :year &copy; :company. Phiên bản: <span>:version</span>', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(767, 0, 'vi', 'core/base/layouts', 'profile', 'Thông tin cá nhân', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(768, 0, 'vi', 'core/base/layouts', 'logout', 'Đăng xuất', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(769, 0, 'vi', 'core/base/layouts', 'no_search_result', 'Không có kết quả tìm kiếm, hãy thử lại với từ khóa khác.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(770, 0, 'vi', 'core/base/layouts', 'home', 'Trang chủ', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(771, 0, 'vi', 'core/base/layouts', 'search', 'Tìm kiếm', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(772, 0, 'vi', 'core/base/layouts', 'add_new', 'Thêm mới', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(773, 0, 'vi', 'core/base/layouts', 'n_a', 'N/A', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(774, 0, 'vi', 'core/base/layouts', 'page_loaded_time', 'Trang tải xong trong', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(775, 0, 'vi', 'core/base/layouts', 'view_website', 'Xem trang ngoài', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(776, 0, 'vi', 'core/base/layouts', 'setting_email', 'Email', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(777, 0, 'vi', 'core/base/mail', 'send-fail', 'Gửi email không thành công', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(778, 0, 'vi', 'core/base/notices', 'create_success_message', 'Tạo thành công', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(779, 0, 'vi', 'core/base/notices', 'update_success_message', 'Cập nhật thành công', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(780, 0, 'vi', 'core/base/notices', 'delete_success_message', 'Xóa thành công', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(781, 0, 'vi', 'core/base/notices', 'success_header', 'Thành công!', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(782, 0, 'vi', 'core/base/notices', 'error_header', 'Lỗi!', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(783, 0, 'vi', 'core/base/notices', 'no_select', 'Chọn ít nhất 1 trường để thực hiện hành động này!', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(784, 0, 'vi', 'core/base/notices', 'processing_request', 'Hệ thống đang xử lý yêu cầu.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(785, 0, 'vi', 'core/base/notices', 'error', 'Lỗi!', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(786, 0, 'vi', 'core/base/notices', 'success', 'Thành công!', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(787, 0, 'vi', 'core/base/notices', 'info', 'Thông tin!', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(788, 0, 'vi', 'core/base/system', 'no_select', 'Hãy chọn ít nhất 1 trường để thực hiện hành động này!', '2021-08-18 04:43:42', '2021-08-18 04:44:11');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(789, 0, 'vi', 'core/base/system', 'cannot_find_user', 'Không thể tải được thông tin người dùng', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(790, 0, 'vi', 'core/base/system', 'supper_revoked', 'Quyền quản trị viên cao nhất đã được gỡ bỏ', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(791, 0, 'vi', 'core/base/system', 'cannot_revoke_yourself', 'Không thể gỡ bỏ quyền quản trị cấp cao của chính bạn!', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(792, 0, 'vi', 'core/base/system', 'cant_remove_supper', 'Bạn không có quyền xóa quản trị viên cấp cao', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(793, 0, 'vi', 'core/base/system', 'cant_find_user_with_email', 'Không thể tìm thấy người dùng với email này', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(794, 0, 'vi', 'core/base/system', 'supper_granted', 'Quyền quản trị cao nhất đã được gán', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(795, 0, 'vi', 'core/base/system', 'delete_log_success', 'Xóa tập tin log thành công!', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(796, 0, 'vi', 'core/base/system', 'get_member_success', 'Hiển thị danh sách thành viên thành công', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(797, 0, 'vi', 'core/base/system', 'error_occur', 'Có lỗi dưới đây', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(798, 0, 'vi', 'core/base/system', 'role_and_permission', 'Phân quyền hệ thống', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(799, 0, 'vi', 'core/base/system', 'role_and_permission_description', 'Quản lý những phân quyền trong hệ thống', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(800, 0, 'vi', 'core/base/system', 'user.list_super', 'Danh sách quản trị viên cấp cao', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(801, 0, 'vi', 'core/base/system', 'user.username', 'Tên đăng nhập', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(802, 0, 'vi', 'core/base/system', 'user.email', 'Email', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(803, 0, 'vi', 'core/base/system', 'user.last_login', 'Đăng nhập lần cuối	', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(804, 0, 'vi', 'core/base/system', 'user.add_user', 'Thêm quản trị viên cấp cao', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(805, 0, 'vi', 'core/base/system', 'user.cancel', 'Hủy bỏ', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(806, 0, 'vi', 'core/base/system', 'user.create', 'Thêm', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(807, 0, 'vi', 'core/base/system', 'options.features', 'Kiểm soát truy cập các tính năng', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(808, 0, 'vi', 'core/base/system', 'options.feature_description', 'Bật/tắt các tính năng.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(809, 0, 'vi', 'core/base/system', 'options.manage_super', 'Quản lý quản trị viên cấp cao', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(810, 0, 'vi', 'core/base/system', 'options.manage_super_description', 'Thêm/xóa quản trị viên cấp cao', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(811, 0, 'vi', 'core/base/system', 'options.info', 'Thông tin hệ thống', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(812, 0, 'vi', 'core/base/system', 'options.info_description', 'Những thông tin về cấu hình hiện tại của hệ thống.', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(813, 0, 'vi', 'core/base/system', 'info.title', 'Thông tin hệ thống', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(814, 0, 'vi', 'core/base/system', 'info.cache', 'Bộ nhớ đệm', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(815, 0, 'vi', 'core/base/system', 'info.environment', 'Môi trường', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(816, 0, 'vi', 'core/base/system', 'info.locale', 'Ngôn ngữ hệ thống', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(817, 0, 'vi', 'core/base/system', 'user_management', 'Quản lý thành viên', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(818, 0, 'vi', 'core/base/system', 'user_management_description', 'Quản lý người dùng trong hệ thống', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(819, 0, 'vi', 'core/base/system', 'app_size', 'Kích thước ứng dụng', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(820, 0, 'vi', 'core/base/system', 'cache_dir_writable', 'Có thể ghi bộ nhớ đệm', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(821, 0, 'vi', 'core/base/system', 'cache_driver', 'Loại lưu trữ bộ nhớ đệm', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(822, 0, 'vi', 'core/base/system', 'copy_report', 'Sao chép báo cáo', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(823, 0, 'vi', 'core/base/system', 'curl_ext', 'CURL Ext', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(824, 0, 'vi', 'core/base/system', 'database', 'Hệ thống dữ liệu', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(825, 0, 'vi', 'core/base/system', 'debug_mode', 'Chế độ sửa lỗi', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(826, 0, 'vi', 'core/base/system', 'dependency_name', 'Tên gói', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(827, 0, 'vi', 'core/base/system', 'exif_ext', 'Exif Ext', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(828, 0, 'vi', 'core/base/system', 'extra_information', 'Thông tin mở rộng', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(829, 0, 'vi', 'core/base/system', 'extra_stats', 'Thống kê thêm', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(830, 0, 'vi', 'core/base/system', 'file_info_ext', 'File info Ext', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(831, 0, 'vi', 'core/base/system', 'framework_version', 'Phiên bản framework', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(832, 0, 'vi', 'core/base/system', 'get_system_report', 'Lấy thông tin hệ thống', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(833, 0, 'vi', 'core/base/system', 'installed_packages', 'Các gói đã cài đặt và phiên bản', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(834, 0, 'vi', 'core/base/system', 'mbstring_ext', 'Mbstring Ext', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(835, 0, 'vi', 'core/base/system', 'openssl_ext', 'OpenSSL Ext', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(836, 0, 'vi', 'core/base/system', 'package_name', 'Tên gói', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(837, 0, 'vi', 'core/base/system', 'pdo_ext', 'PDO Ext', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(838, 0, 'vi', 'core/base/system', 'php_version', 'Phiên bản PHP', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(839, 0, 'vi', 'core/base/system', 'report_description', 'Vui lòng chia sẻ thông tin này nhằm mục đích điều tra nguyên nhân gây lỗi', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(840, 0, 'vi', 'core/base/system', 'server_environment', 'Môi trường máy chủ', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(841, 0, 'vi', 'core/base/system', 'server_os', 'Hệ điều hành của máy chủ', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(842, 0, 'vi', 'core/base/system', 'server_software', 'Phần mềm', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(843, 0, 'vi', 'core/base/system', 'session_driver', 'Loại lưu trữ phiên làm việc', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(844, 0, 'vi', 'core/base/system', 'ssl_installed', 'Đã cài đặt chứng chỉ SSL', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(845, 0, 'vi', 'core/base/system', 'storage_dir_writable', 'Có thể lưu trữ dữ liệu tạm', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(846, 0, 'vi', 'core/base/system', 'system_environment', 'Môi trường hệ thống', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(847, 0, 'vi', 'core/base/system', 'timezone', 'Múi giờ', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(848, 0, 'vi', 'core/base/system', 'tokenizer_ext', 'Tokenizer Ext', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(849, 0, 'vi', 'core/base/system', 'version', 'Phiên bản', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(850, 0, 'vi', 'core/base/system', 'cms_version', 'Phiên bản CMS', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(851, 0, 'vi', 'core/base/tables', 'id', 'ID', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(852, 0, 'vi', 'core/base/tables', 'name', 'Tên', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(853, 0, 'vi', 'core/base/tables', 'order_by', 'Thứ tự', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(854, 0, 'vi', 'core/base/tables', 'status', 'Trạng thái', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(855, 0, 'vi', 'core/base/tables', 'created_at', 'Ngày tạo', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(856, 0, 'vi', 'core/base/tables', 'updated_at', 'Ngày cập nhật', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(857, 0, 'vi', 'core/base/tables', 'operations', 'Tác vụ', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(858, 0, 'vi', 'core/base/tables', 'url', 'URL', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(859, 0, 'vi', 'core/base/tables', 'author', 'Người tạo', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(860, 0, 'vi', 'core/base/tables', 'column', 'Cột', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(861, 0, 'vi', 'core/base/tables', 'origin', 'Bản cũ', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(862, 0, 'vi', 'core/base/tables', 'after_change', 'Sau khi thay đổi', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(863, 0, 'vi', 'core/base/tables', 'notes', 'Ghi chú', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(864, 0, 'vi', 'core/base/tables', 'activated', 'kích hoạt', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(865, 0, 'vi', 'core/base/tables', 'browser', 'Trình duyệt', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(866, 0, 'vi', 'core/base/tables', 'deactivated', 'hủy kích hoạt', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(867, 0, 'vi', 'core/base/tables', 'description', 'Mô tả', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(868, 0, 'vi', 'core/base/tables', 'session', 'Phiên', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(869, 0, 'vi', 'core/base/tables', 'views', 'Lượt xem', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(870, 0, 'vi', 'core/base/tables', 'restore', 'Khôi phục', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(871, 0, 'vi', 'core/base/tables', 'edit', 'Sửa', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(872, 0, 'vi', 'core/base/tables', 'delete', 'Xóa', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(873, 0, 'vi', 'core/base/tables', 'action', 'Hành động', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(874, 0, 'vi', 'core/base/tables', 'activate', 'Kích hoạt', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(875, 0, 'vi', 'core/base/tables', 'add_new', 'Thêm mới', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(876, 0, 'vi', 'core/base/tables', 'all', 'Tất cả', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(877, 0, 'vi', 'core/base/tables', 'cancel', 'Hủy bỏ', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(878, 0, 'vi', 'core/base/tables', 'confirm_delete', 'Xác nhận xóa', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(879, 0, 'vi', 'core/base/tables', 'confirm_delete_msg', 'Bạn có chắc chắn muốn xóa bản ghi này?', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(880, 0, 'vi', 'core/base/tables', 'csv', 'CSV', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(881, 0, 'vi', 'core/base/tables', 'deactivate', 'Hủy kích hoạt', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(882, 0, 'vi', 'core/base/tables', 'delete_entry', 'Xóa bản ghi', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(883, 0, 'vi', 'core/base/tables', 'display', 'Hiển thị', '2021-08-18 04:43:42', '2021-08-18 04:44:11'),
(884, 0, 'vi', 'core/base/tables', 'excel', 'Excel', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(885, 0, 'vi', 'core/base/tables', 'export', 'Xuất bản', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(886, 0, 'vi', 'core/base/tables', 'in', 'trong tổng số', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(887, 0, 'vi', 'core/base/tables', 'no_data', 'Không có dữ liệu để hiển thị', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(888, 0, 'vi', 'core/base/tables', 'no_record', 'Không có dữ liệu', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(889, 0, 'vi', 'core/base/tables', 'pdf', 'PDF', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(890, 0, 'vi', 'core/base/tables', 'print', 'In', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(891, 0, 'vi', 'core/base/tables', 'records', 'bản ghi', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(892, 0, 'vi', 'core/base/tables', 'reload', 'Tải lại', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(893, 0, 'vi', 'core/base/tables', 'reset', 'Làm mới', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(894, 0, 'vi', 'core/base/tables', 'save', 'Lưu', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(895, 0, 'vi', 'core/base/tables', 'show_from', 'Hiển thị từ', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(896, 0, 'vi', 'core/base/tables', 'template', 'Giao diện', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(897, 0, 'vi', 'core/base/tables', 'to', 'đến', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(898, 0, 'vi', 'core/base/tables', 'view', 'Xem chi tiết', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(899, 0, 'vi', 'core/base/tables', 'email', 'Email', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(900, 0, 'vi', 'core/base/tables', 'image', 'Hình ảnh', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(901, 0, 'vi', 'core/base/tables', 'is_featured', 'Nổi bật', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(902, 0, 'vi', 'core/base/tables', 'last_login', 'Lần cuối đăng nhập', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(903, 0, 'vi', 'core/base/tables', 'order', 'Thứ tự', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(904, 0, 'vi', 'core/base/tables', 'shortcode', 'Shortcode', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(905, 0, 'vi', 'core/base/tables', 'slug', 'Slug', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(906, 0, 'vi', 'core/base/tables', 'title', 'Tiêu đề', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(907, 0, 'vi', 'core/base/tabs', 'detail', 'Chi tiết', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(908, 0, 'vi', 'core/base/tabs', 'file', 'Tập tin', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(909, 0, 'vi', 'core/base/tabs', 'record_note', 'Ghi chú', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(910, 0, 'vi', 'core/base/tabs', 'revision', 'Lịch sử thay đổi', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(911, 0, 'en', 'core/dashboard/dashboard', 'update_position_success', 'Update widget position successfully!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(912, 0, 'en', 'core/dashboard/dashboard', 'hide_success', 'Update widget successfully!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(913, 0, 'en', 'core/dashboard/dashboard', 'confirm_hide', 'Are you sure?', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(914, 0, 'en', 'core/dashboard/dashboard', 'hide_message', 'Do you really want to hide this widget? It will be disappear on Dashboard!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(915, 0, 'en', 'core/dashboard/dashboard', 'confirm_hide_btn', 'Yes, hide this widget', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(916, 0, 'en', 'core/dashboard/dashboard', 'cancel_hide_btn', 'Cancel', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(917, 0, 'en', 'core/dashboard/dashboard', 'collapse_expand', 'Collapse/Expand', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(918, 0, 'en', 'core/dashboard/dashboard', 'hide', 'Hide', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(919, 0, 'en', 'core/dashboard/dashboard', 'reload', 'Reload', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(920, 0, 'en', 'core/dashboard/dashboard', 'save_setting_success', 'Save widget settings successfully!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(921, 0, 'en', 'core/dashboard/dashboard', 'widget_not_exists', 'Widget is not exits!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(922, 0, 'en', 'core/dashboard/dashboard', 'manage_widgets', 'Manage Widgets', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(923, 0, 'en', 'core/dashboard/dashboard', 'fullscreen', 'Full screen', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(924, 0, 'en', 'core/dashboard/dashboard', 'title', 'Dashboard', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(925, 0, 'vi', 'core/dashboard/dashboard', 'cancel_hide_btn', 'Hủy bỏ', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(926, 0, 'vi', 'core/dashboard/dashboard', 'collapse_expand', 'Mở rộng', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(927, 0, 'vi', 'core/dashboard/dashboard', 'confirm_hide', 'Bạn có chắc?', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(928, 0, 'vi', 'core/dashboard/dashboard', 'confirm_hide_btn', 'Vâng, ẩn tiện ích này', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(929, 0, 'vi', 'core/dashboard/dashboard', 'hide', 'Ẩn', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(930, 0, 'vi', 'core/dashboard/dashboard', 'hide_message', 'Bạn có chắc chắn muốn ẩn tiện ích này? Nó sẽ không được hiển thị trên trang chủ nữa!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(931, 0, 'vi', 'core/dashboard/dashboard', 'hide_success', 'Ẩn tiện ích thành công!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(932, 0, 'vi', 'core/dashboard/dashboard', 'manage_widgets', 'Quản lý tiện ích', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(933, 0, 'vi', 'core/dashboard/dashboard', 'reload', 'Làm mới', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(934, 0, 'vi', 'core/dashboard/dashboard', 'save_setting_success', 'Lưu tiện ích thành công', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(935, 0, 'vi', 'core/dashboard/dashboard', 'update_position_success', 'Cập nhật vị trí tiện ích thành công!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(936, 0, 'vi', 'core/dashboard/dashboard', 'widget_not_exists', 'Tiện ích này không tồn tại!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(937, 0, 'vi', 'core/dashboard/dashboard', 'fullscreen', 'Toàn màn hình', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(938, 0, 'vi', 'core/dashboard/dashboard', 'title', 'Trang quản trị', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(939, 0, 'en', 'core/media/media', 'filter', 'Filter', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(940, 0, 'en', 'core/media/media', 'everything', 'Everything', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(941, 0, 'en', 'core/media/media', 'image', 'Image', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(942, 0, 'en', 'core/media/media', 'video', 'Video', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(943, 0, 'en', 'core/media/media', 'document', 'Document', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(944, 0, 'en', 'core/media/media', 'view_in', 'View in', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(945, 0, 'en', 'core/media/media', 'all_media', 'All media', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(946, 0, 'en', 'core/media/media', 'trash', 'Trash', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(947, 0, 'en', 'core/media/media', 'recent', 'Recent', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(948, 0, 'en', 'core/media/media', 'favorites', 'Favorites', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(949, 0, 'en', 'core/media/media', 'upload', 'Upload', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(950, 0, 'en', 'core/media/media', 'create_folder', 'Create folder', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(951, 0, 'en', 'core/media/media', 'refresh', 'Refresh', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(952, 0, 'en', 'core/media/media', 'empty_trash', 'Empty trash', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(953, 0, 'en', 'core/media/media', 'search_file_and_folder', 'Search file and folder', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(954, 0, 'en', 'core/media/media', 'sort', 'Sort', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(955, 0, 'en', 'core/media/media', 'file_name_asc', 'File name - ASC', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(956, 0, 'en', 'core/media/media', 'file_name_desc', 'File name - DESC', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(957, 0, 'en', 'core/media/media', 'uploaded_date_asc', 'Uploaded date - ASC', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(958, 0, 'en', 'core/media/media', 'uploaded_date_desc', 'Uploaded date - DESC', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(959, 0, 'en', 'core/media/media', 'size_asc', 'Size - ASC', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(960, 0, 'en', 'core/media/media', 'size_desc', 'Size - DESC', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(961, 0, 'en', 'core/media/media', 'actions', 'Actions', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(962, 0, 'en', 'core/media/media', 'nothing_is_selected', 'Nothing is selected', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(963, 0, 'en', 'core/media/media', 'insert', 'Insert', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(964, 0, 'en', 'core/media/media', 'folder_name', 'Folder name', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(965, 0, 'en', 'core/media/media', 'create', 'Create', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(966, 0, 'en', 'core/media/media', 'rename', 'Rename', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(967, 0, 'en', 'core/media/media', 'close', 'Close', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(968, 0, 'en', 'core/media/media', 'save_changes', 'Save changes', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(969, 0, 'en', 'core/media/media', 'move_to_trash', 'Move items to trash', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(970, 0, 'en', 'core/media/media', 'confirm_trash', 'Are you sure you want to move these items to trash?', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(971, 0, 'en', 'core/media/media', 'confirm', 'Confirm', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(972, 0, 'en', 'core/media/media', 'confirm_delete', 'Delete item(s)', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(973, 0, 'en', 'core/media/media', 'confirm_delete_description', 'Your request cannot rollback. Are you sure you wanna delete these items?', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(974, 0, 'en', 'core/media/media', 'empty_trash_title', 'Empty trash', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(975, 0, 'en', 'core/media/media', 'empty_trash_description', 'Your request cannot rollback. Are you sure you wanna remove all items in trash?', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(976, 0, 'en', 'core/media/media', 'up_level', 'Up one level', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(977, 0, 'en', 'core/media/media', 'upload_progress', 'Upload progress', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(978, 0, 'en', 'core/media/media', 'folder_created', 'Folder is created successfully!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(979, 0, 'en', 'core/media/media', 'gallery', 'Media gallery', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(980, 0, 'en', 'core/media/media', 'trash_error', 'Error when delete selected item(s)', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(981, 0, 'en', 'core/media/media', 'trash_success', 'Moved selected item(s) to trash successfully!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(982, 0, 'en', 'core/media/media', 'restore_error', 'Error when restore selected item(s)', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(983, 0, 'en', 'core/media/media', 'restore_success', 'Restore selected item(s) successfully!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(984, 0, 'en', 'core/media/media', 'copy_success', 'Copied selected item(s) successfully!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(985, 0, 'en', 'core/media/media', 'delete_success', 'Deleted selected item(s) successfully!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(986, 0, 'en', 'core/media/media', 'favorite_success', 'Favorite selected item(s) successfully!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(987, 0, 'en', 'core/media/media', 'remove_favorite_success', 'Remove selected item(s) from favorites successfully!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(988, 0, 'en', 'core/media/media', 'rename_error', 'Error when rename item(s)', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(989, 0, 'en', 'core/media/media', 'rename_success', 'Rename selected item(s) successfully!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(990, 0, 'en', 'core/media/media', 'empty_trash_success', 'Empty trash successfully!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(991, 0, 'en', 'core/media/media', 'invalid_action', 'Invalid action!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(992, 0, 'en', 'core/media/media', 'file_not_exists', 'File is not exists!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(993, 0, 'en', 'core/media/media', 'download_file_error', 'Error when downloading files!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(994, 0, 'en', 'core/media/media', 'missing_zip_archive_extension', 'Please enable ZipArchive extension to download file!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(995, 0, 'en', 'core/media/media', 'can_not_download_file', 'Can not download this file!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(996, 0, 'en', 'core/media/media', 'invalid_request', 'Invalid request!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(997, 0, 'en', 'core/media/media', 'add_success', 'Add item successfully!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(998, 0, 'en', 'core/media/media', 'file_too_big', 'File too big. Max file upload is :size bytes', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(999, 0, 'en', 'core/media/media', 'can_not_detect_file_type', 'File type is not allowed or can not detect file type!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1000, 0, 'en', 'core/media/media', 'upload_failed', 'The file is NOT uploaded completely. The server allows max upload file size is :size . Please check your file size OR try to upload again in case of having network errors', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1001, 0, 'en', 'core/media/media', 'menu_name', 'Media', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1002, 0, 'en', 'core/media/media', 'add', 'Add media', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1003, 0, 'en', 'core/media/media', 'javascript.name', 'Name', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1004, 0, 'en', 'core/media/media', 'javascript.url', 'URL', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1005, 0, 'en', 'core/media/media', 'javascript.full_url', 'Full URL', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1006, 0, 'en', 'core/media/media', 'javascript.size', 'Size', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1007, 0, 'en', 'core/media/media', 'javascript.mime_type', 'Type', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1008, 0, 'en', 'core/media/media', 'javascript.created_at', 'Uploaded at', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1009, 0, 'en', 'core/media/media', 'javascript.updated_at', 'Modified at', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1010, 0, 'en', 'core/media/media', 'javascript.nothing_selected', 'Nothing is selected', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1011, 0, 'en', 'core/media/media', 'javascript.visit_link', 'Open link', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1012, 0, 'en', 'core/media/media', 'javascript.no_item.all_media.icon', 'fas fa-cloud-upload-alt', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1013, 0, 'en', 'core/media/media', 'javascript.no_item.all_media.title', 'Drop files and folders here', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1014, 0, 'en', 'core/media/media', 'javascript.no_item.all_media.message', 'Or use the upload button above', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1015, 0, 'en', 'core/media/media', 'javascript.no_item.trash.icon', 'fas fa-trash-alt', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1016, 0, 'en', 'core/media/media', 'javascript.no_item.trash.title', 'There is nothing in your trash currently', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1017, 0, 'en', 'core/media/media', 'javascript.no_item.trash.message', 'Delete files to move them to trash automatically. Delete files from trash to remove them permanently', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1018, 0, 'en', 'core/media/media', 'javascript.no_item.favorites.icon', 'fas fa-star', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1019, 0, 'en', 'core/media/media', 'javascript.no_item.favorites.title', 'You have not added anything to your favorites yet', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1020, 0, 'en', 'core/media/media', 'javascript.no_item.favorites.message', 'Add files to favorites to easily find them later', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1021, 0, 'en', 'core/media/media', 'javascript.no_item.recent.icon', 'far fa-clock', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1022, 0, 'en', 'core/media/media', 'javascript.no_item.recent.title', 'You did not opened anything yet', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1023, 0, 'en', 'core/media/media', 'javascript.no_item.recent.message', 'All recent files that you opened will be appeared here', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1024, 0, 'en', 'core/media/media', 'javascript.no_item.default.icon', 'fas fa-sync', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1025, 0, 'en', 'core/media/media', 'javascript.no_item.default.title', 'No items', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1026, 0, 'en', 'core/media/media', 'javascript.no_item.default.message', 'This directory has no item', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1027, 0, 'en', 'core/media/media', 'javascript.clipboard.success', 'These file links has been copied to clipboard', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1028, 0, 'en', 'core/media/media', 'javascript.message.error_header', 'Error', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1029, 0, 'en', 'core/media/media', 'javascript.message.success_header', 'Success', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1030, 0, 'en', 'core/media/media', 'javascript.download.error', 'No files selected or cannot download these files', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1031, 0, 'en', 'core/media/media', 'javascript.actions_list.basic.preview', 'Preview', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1032, 0, 'en', 'core/media/media', 'javascript.actions_list.file.copy_link', 'Copy link', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1033, 0, 'en', 'core/media/media', 'javascript.actions_list.file.rename', 'Rename', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1034, 0, 'en', 'core/media/media', 'javascript.actions_list.file.make_copy', 'Make a copy', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1035, 0, 'en', 'core/media/media', 'javascript.actions_list.user.favorite', 'Add to favorite', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1036, 0, 'en', 'core/media/media', 'javascript.actions_list.user.remove_favorite', 'Remove favorite', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1037, 0, 'en', 'core/media/media', 'javascript.actions_list.other.download', 'Download', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1038, 0, 'en', 'core/media/media', 'javascript.actions_list.other.trash', 'Move to trash', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1039, 0, 'en', 'core/media/media', 'javascript.actions_list.other.delete', 'Delete permanently', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1040, 0, 'en', 'core/media/media', 'javascript.actions_list.other.restore', 'Restore', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1041, 0, 'en', 'core/media/media', 'name_invalid', 'The folder name has invalid character(s).', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1042, 0, 'en', 'core/media/media', 'url_invalid', 'Please provide a valid URL', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1043, 0, 'en', 'core/media/media', 'path_invalid', 'Please provide a valid path', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1044, 0, 'en', 'core/media/media', 'download_link', 'Download', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1045, 0, 'en', 'core/media/media', 'url', 'URL', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1046, 0, 'en', 'core/media/media', 'download_explain', 'Enter one URL per line.', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1047, 0, 'en', 'core/media/media', 'downloading', 'Downloading...', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1048, 0, 'vi', 'core/media/media', 'filter', 'Lọc', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1049, 0, 'vi', 'core/media/media', 'everything', 'Tất cả', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1050, 0, 'vi', 'core/media/media', 'image', 'Hình ảnh', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1051, 0, 'vi', 'core/media/media', 'video', 'Phim', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1052, 0, 'vi', 'core/media/media', 'document', 'Tài liệu', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1053, 0, 'vi', 'core/media/media', 'view_in', 'Chế độ xem', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1054, 0, 'vi', 'core/media/media', 'all_media', 'Tất cả tập tin', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1055, 0, 'vi', 'core/media/media', 'trash', 'Thùng rác', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1056, 0, 'vi', 'core/media/media', 'recent', 'Gần đây', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1057, 0, 'vi', 'core/media/media', 'favorites', 'Được gắn dấu sao', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1058, 0, 'vi', 'core/media/media', 'upload', 'Tải lên', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1059, 0, 'vi', 'core/media/media', 'create_folder', 'Tạo thư mục', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1060, 0, 'vi', 'core/media/media', 'refresh', 'Làm mới', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1061, 0, 'vi', 'core/media/media', 'empty_trash', 'Dọn thùng rác', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1062, 0, 'vi', 'core/media/media', 'search_file_and_folder', 'Tìm kiếm tập tin và thư mục', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1063, 0, 'vi', 'core/media/media', 'sort', 'Sắp xếp', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1064, 0, 'vi', 'core/media/media', 'file_name_asc', 'Tên tập tin - ASC', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1065, 0, 'vi', 'core/media/media', 'file_name_desc', 'Tên tập tin - DESC', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1066, 0, 'vi', 'core/media/media', 'uploaded_date_asc', 'Ngày tải lên - ASC', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1067, 0, 'vi', 'core/media/media', 'uploaded_date_desc', 'Ngày tải lên - DESC', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1068, 0, 'vi', 'core/media/media', 'size_asc', 'Kích thước - ASC', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1069, 0, 'vi', 'core/media/media', 'size_desc', 'Kích thước - DESC', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1070, 0, 'vi', 'core/media/media', 'actions', 'Hành động', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1071, 0, 'vi', 'core/media/media', 'nothing_is_selected', 'Không có tập tin nào được chọn', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1072, 0, 'vi', 'core/media/media', 'insert', 'Chèn', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1073, 0, 'vi', 'core/media/media', 'folder_name', 'Tên thư mục', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1074, 0, 'vi', 'core/media/media', 'create', 'Tạo', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1075, 0, 'vi', 'core/media/media', 'rename', 'Đổi tên', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1076, 0, 'vi', 'core/media/media', 'close', 'Đóng', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1077, 0, 'vi', 'core/media/media', 'save_changes', 'Lưu thay đổi', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1078, 0, 'vi', 'core/media/media', 'move_to_trash', 'Đưa vào thùng rác', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1079, 0, 'vi', 'core/media/media', 'confirm_trash', 'Bạn có chắc chắn muốn bỏ những tập tin này vào thùng rác?', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1080, 0, 'vi', 'core/media/media', 'confirm', 'Xác nhận', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1081, 0, 'vi', 'core/media/media', 'confirm_delete', 'Xóa tập tin', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1082, 0, 'vi', 'core/media/media', 'confirm_delete_description', 'Hành động này không thể khôi phục. Bạn có chắc chắn muốn xóa các tập tin này?', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1083, 0, 'vi', 'core/media/media', 'empty_trash_title', 'Dọn sạch thùng rác', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1084, 0, 'vi', 'core/media/media', 'empty_trash_description', 'Hành động này không thể khôi phục. Bạn có chắc chắn muốn dọn sạch thùng rác?', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1085, 0, 'vi', 'core/media/media', 'up_level', 'Quay lại một cấp', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1086, 0, 'vi', 'core/media/media', 'upload_progress', 'Tiến trình tải lên', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1087, 0, 'vi', 'core/media/media', 'folder_created', 'Tạo thư mục thành công!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1088, 0, 'vi', 'core/media/media', 'gallery', 'Thư viện tập tin', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1089, 0, 'vi', 'core/media/media', 'trash_error', 'Có lỗi khi xóa tập tin/thư mục', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1090, 0, 'vi', 'core/media/media', 'trash_success', 'Xóa tập tin/thư mục thành công!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1091, 0, 'vi', 'core/media/media', 'restore_error', 'Có lỗi trong quá trình khôi phục', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1092, 0, 'vi', 'core/media/media', 'restore_success', 'Khôi phục thành công!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1093, 0, 'vi', 'core/media/media', 'copy_success', 'Sao chép thành công!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1094, 0, 'vi', 'core/media/media', 'delete_success', 'Xóa thành công!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1095, 0, 'vi', 'core/media/media', 'favorite_success', 'Thêm dấu sao thành công!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1096, 0, 'vi', 'core/media/media', 'remove_favorite_success', 'Bỏ dấu sao thành công!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1097, 0, 'vi', 'core/media/media', 'rename_error', 'Có lỗi trong quá trình đổi tên', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1098, 0, 'vi', 'core/media/media', 'rename_success', 'Đổi tên thành công!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1099, 0, 'vi', 'core/media/media', 'invalid_action', 'Hành động không hợp lệ!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1100, 0, 'vi', 'core/media/media', 'file_not_exists', 'Tập tin không tồn tại!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1101, 0, 'vi', 'core/media/media', 'download_file_error', 'Có lỗi trong quá trình tải xuống tập tin!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1102, 0, 'vi', 'core/media/media', 'missing_zip_archive_extension', 'Hãy bật ZipArchive extension để tải tập tin!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1103, 0, 'vi', 'core/media/media', 'can_not_download_file', 'Không thể tải tập tin!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1104, 0, 'vi', 'core/media/media', 'invalid_request', 'Yêu cầu không hợp lệ!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1105, 0, 'vi', 'core/media/media', 'add_success', 'Thêm thành công!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1106, 0, 'vi', 'core/media/media', 'file_too_big', 'Tập tin quá lớn. Giới hạn tải lên là :size bytes', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1107, 0, 'vi', 'core/media/media', 'can_not_detect_file_type', 'Loại tập tin không hợp lệ hoặc không thể xác định loại tập tin!', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1108, 0, 'vi', 'core/media/media', 'upload_failed', 'The file is NOT uploaded completely. The server allows max upload file size is :size . Please check your file size OR try to upload again in case of having network errors', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1109, 0, 'vi', 'core/media/media', 'menu_name', 'Quản lý tập tin', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1110, 0, 'vi', 'core/media/media', 'add', 'Thêm tập tin', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1111, 0, 'vi', 'core/media/media', 'javascript.name', 'Tên', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1112, 0, 'vi', 'core/media/media', 'javascript.url', 'Đường dẫn', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1113, 0, 'vi', 'core/media/media', 'javascript.full_url', 'Đường dẫn tuyệt đối', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1114, 0, 'vi', 'core/media/media', 'javascript.size', 'Kích thước', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1115, 0, 'vi', 'core/media/media', 'javascript.mime_type', 'Loại', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1116, 0, 'vi', 'core/media/media', 'javascript.created_at', 'Được tải lên lúc', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1117, 0, 'vi', 'core/media/media', 'javascript.updated_at', 'Được chỉnh sửa lúc', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1118, 0, 'vi', 'core/media/media', 'javascript.nothing_selected', 'Bạn chưa chọn tập tin nào', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1119, 0, 'vi', 'core/media/media', 'javascript.visit_link', 'Mở liên kết', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1120, 0, 'vi', 'core/media/media', 'javascript.no_item.all_media.icon', 'fas fa-cloud-upload-alt', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1121, 0, 'vi', 'core/media/media', 'javascript.no_item.all_media.title', 'Bạn có thể kéo thả tập tin vào đây để tải lên', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1122, 0, 'vi', 'core/media/media', 'javascript.no_item.all_media.message', 'Hoặc có thể bấm nút Tải lên ở phía trên', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1123, 0, 'vi', 'core/media/media', 'javascript.no_item.trash.icon', 'fas fa-trash-alt', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1124, 0, 'vi', 'core/media/media', 'javascript.no_item.trash.title', 'Hiện tại không có tập tin nào trong thùng rác', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1125, 0, 'vi', 'core/media/media', 'javascript.no_item.trash.message', 'Xóa tập tin sẽ đem tập tin lưu vào thùng rác. Xóa tập tin trong thùng rác sẽ xóa vĩnh viễn.', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1126, 0, 'vi', 'core/media/media', 'javascript.no_item.favorites.icon', 'fas fa-star', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1127, 0, 'vi', 'core/media/media', 'javascript.no_item.favorites.title', 'Bạn chưa đặt tập tin nào vào mục yêu thích', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1128, 0, 'vi', 'core/media/media', 'javascript.no_item.favorites.message', 'Thêm tập tin vào mục yêu thích để tìm kiếm chúng dễ dàng sau này.', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1129, 0, 'vi', 'core/media/media', 'javascript.no_item.recent.icon', 'far fa-clock', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1130, 0, 'vi', 'core/media/media', 'javascript.no_item.recent.title', 'Bạn chưa mở tập tin nào.', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1131, 0, 'vi', 'core/media/media', 'javascript.no_item.recent.message', 'Mục này hiển thị các tập tin bạn đã xem gần đây.', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1132, 0, 'vi', 'core/media/media', 'javascript.no_item.default.icon', 'fas fa-sync', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1133, 0, 'vi', 'core/media/media', 'javascript.no_item.default.title', 'Thư mục trống', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1134, 0, 'vi', 'core/media/media', 'javascript.no_item.default.message', 'Thư mục này chưa có tập tin nào', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1135, 0, 'vi', 'core/media/media', 'javascript.clipboard.success', 'Đường dẫn của các tập tin đã được sao chép vào clipboard', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1136, 0, 'vi', 'core/media/media', 'javascript.message.error_header', 'Lỗi', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1137, 0, 'vi', 'core/media/media', 'javascript.message.success_header', 'Thành công', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1138, 0, 'vi', 'core/media/media', 'javascript.download.error', 'Bạn chưa chọn tập tin nào hoặc tập tin này không cho phép tải về', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1139, 0, 'vi', 'core/media/media', 'javascript.actions_list.basic.preview', 'Xem trước', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1140, 0, 'vi', 'core/media/media', 'javascript.actions_list.file.copy_link', 'Sao chép đường dẫn', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1141, 0, 'vi', 'core/media/media', 'javascript.actions_list.file.rename', 'Đổi tên', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1142, 0, 'vi', 'core/media/media', 'javascript.actions_list.file.make_copy', 'Nhân bản', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1143, 0, 'vi', 'core/media/media', 'javascript.actions_list.user.favorite', 'Yêu thích', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1144, 0, 'vi', 'core/media/media', 'javascript.actions_list.user.remove_favorite', 'Xóa khỏi mục yêu thích', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1145, 0, 'vi', 'core/media/media', 'javascript.actions_list.other.download', 'Tải xuống', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1146, 0, 'vi', 'core/media/media', 'javascript.actions_list.other.trash', 'Chuyển vào thùng rác', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1147, 0, 'vi', 'core/media/media', 'javascript.actions_list.other.delete', 'Xóa hoàn toàn', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1148, 0, 'vi', 'core/media/media', 'javascript.actions_list.other.restore', 'Khôi phục', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1149, 0, 'vi', 'core/media/media', 'empty_trash_success', 'Dọn sạch thùng rác thành công', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1150, 0, 'vi', 'core/media/media', 'name_invalid', 'Tên thư mục chứa ký tự không hợp lệ', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1151, 0, 'en', 'core/setting/setting', 'title', 'Settings', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1152, 0, 'en', 'core/setting/setting', 'email_setting_title', 'Email settings', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1153, 0, 'en', 'core/setting/setting', 'general.theme', 'Theme', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1154, 0, 'en', 'core/setting/setting', 'general.description', 'Setting site information', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1155, 0, 'en', 'core/setting/setting', 'general.title', 'General', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1156, 0, 'en', 'core/setting/setting', 'general.general_block', 'General Information', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1157, 0, 'en', 'core/setting/setting', 'general.rich_editor', 'Rich Editor', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1158, 0, 'en', 'core/setting/setting', 'general.site_title', 'Site title', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1159, 0, 'en', 'core/setting/setting', 'general.admin_email', 'Admin Email', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1160, 0, 'en', 'core/setting/setting', 'general.seo_block', 'SEO Configuration', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1161, 0, 'en', 'core/setting/setting', 'general.seo_title', 'SEO Title', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1162, 0, 'en', 'core/setting/setting', 'general.seo_description', 'SEO Description', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1163, 0, 'en', 'core/setting/setting', 'general.webmaster_tools_block', 'Google Webmaster Tools', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1164, 0, 'en', 'core/setting/setting', 'general.google_site_verification', 'Google site verification', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1165, 0, 'en', 'core/setting/setting', 'general.placeholder.site_title', 'Site Title (maximum 120 characters)', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1166, 0, 'en', 'core/setting/setting', 'general.placeholder.admin_email', 'Admin Email', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1167, 0, 'en', 'core/setting/setting', 'general.placeholder.seo_title', 'SEO Title (maximum 120 characters)', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1168, 0, 'en', 'core/setting/setting', 'general.placeholder.seo_description', 'SEO Description (maximum 120 characters)', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1169, 0, 'en', 'core/setting/setting', 'general.placeholder.google_analytics', 'Google Analytics', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1170, 0, 'en', 'core/setting/setting', 'general.placeholder.google_site_verification', 'Google Site Verification', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1171, 0, 'en', 'core/setting/setting', 'general.cache_admin_menu', 'Cache admin menu?', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1172, 0, 'en', 'core/setting/setting', 'general.enable_send_error_reporting_via_email', 'Enable to send error reporting via email?', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1173, 0, 'en', 'core/setting/setting', 'general.time_zone', 'Timezone', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1174, 0, 'en', 'core/setting/setting', 'general.default_admin_theme', 'Default admin theme', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1175, 0, 'en', 'core/setting/setting', 'general.enable_change_admin_theme', 'Enable change admin theme?', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1176, 0, 'en', 'core/setting/setting', 'general.enable', 'Enable', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1177, 0, 'en', 'core/setting/setting', 'general.disable', 'Disable', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1178, 0, 'en', 'core/setting/setting', 'general.enable_cache', 'Enable cache?', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1179, 0, 'en', 'core/setting/setting', 'general.cache_time', 'Cache time (minutes)', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1180, 0, 'en', 'core/setting/setting', 'general.cache_time_site_map', 'Cache Time Site map', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1181, 0, 'en', 'core/setting/setting', 'general.admin_logo', 'Admin logo', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1182, 0, 'en', 'core/setting/setting', 'general.admin_favicon', 'Admin favicon', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1183, 0, 'en', 'core/setting/setting', 'general.admin_title', 'Admin title', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1184, 0, 'en', 'core/setting/setting', 'general.admin_title_placeholder', 'Title show to tab of browser', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1185, 0, 'en', 'core/setting/setting', 'general.cache_block', 'Cache', '2021-08-18 04:43:43', '2021-08-18 04:44:11');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1186, 0, 'en', 'core/setting/setting', 'general.admin_appearance_title', 'Admin appearance', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1187, 0, 'en', 'core/setting/setting', 'general.admin_appearance_description', 'Setting admin appearance such as editor, language...', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1188, 0, 'en', 'core/setting/setting', 'general.seo_block_description', 'Setting site title, site meta description, site keyword for optimize SEO', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1189, 0, 'en', 'core/setting/setting', 'general.webmaster_tools_description', 'Google Webmaster Tools (GWT) is free software that helps you manage the technical side of your website', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1190, 0, 'en', 'core/setting/setting', 'general.cache_description', 'Config cache for system for optimize speed', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1191, 0, 'en', 'core/setting/setting', 'general.yes', 'Yes', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1192, 0, 'en', 'core/setting/setting', 'general.no', 'No', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1193, 0, 'en', 'core/setting/setting', 'general.show_on_front', 'Your homepage displays', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1194, 0, 'en', 'core/setting/setting', 'general.select', '— Select —', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1195, 0, 'en', 'core/setting/setting', 'general.show_site_name', 'Show site name after page title, separate with \"-\"?', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1196, 0, 'en', 'core/setting/setting', 'general.locale', 'Site language', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1197, 0, 'en', 'core/setting/setting', 'general.locale_direction', 'Front site language direction', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1198, 0, 'en', 'core/setting/setting', 'general.admin_locale_direction', 'Admin language direction', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1199, 0, 'en', 'core/setting/setting', 'general.admin_login_screen_backgrounds', 'Login screen backgrounds (~1366x768)', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1200, 0, 'en', 'core/setting/setting', 'email.subject', 'Subject', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1201, 0, 'en', 'core/setting/setting', 'email.content', 'Content', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1202, 0, 'en', 'core/setting/setting', 'email.title', 'Setting for email template', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1203, 0, 'en', 'core/setting/setting', 'email.description', 'Email template using HTML & system variables.', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1204, 0, 'en', 'core/setting/setting', 'email.reset_to_default', 'Reset to default', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1205, 0, 'en', 'core/setting/setting', 'email.back', 'Back to settings', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1206, 0, 'en', 'core/setting/setting', 'email.reset_success', 'Reset back to default successfully', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1207, 0, 'en', 'core/setting/setting', 'email.confirm_reset', 'Confirm reset email template?', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1208, 0, 'en', 'core/setting/setting', 'email.confirm_message', 'Do you really want to reset this email template to default?', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1209, 0, 'en', 'core/setting/setting', 'email.continue', 'Continue', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1210, 0, 'en', 'core/setting/setting', 'email.sender_name', 'Sender name', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1211, 0, 'en', 'core/setting/setting', 'email.sender_name_placeholder', 'Name', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1212, 0, 'en', 'core/setting/setting', 'email.sender_email', 'Sender email', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1213, 0, 'en', 'core/setting/setting', 'email.mailer', 'Mailer', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1214, 0, 'en', 'core/setting/setting', 'email.port', 'Port', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1215, 0, 'en', 'core/setting/setting', 'email.port_placeholder', 'Ex: 587', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1216, 0, 'en', 'core/setting/setting', 'email.host', 'Host', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1217, 0, 'en', 'core/setting/setting', 'email.host_placeholder', 'Ex: smtp.gmail.com', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1218, 0, 'en', 'core/setting/setting', 'email.username', 'Username', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1219, 0, 'en', 'core/setting/setting', 'email.username_placeholder', 'Username to login to mail server', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1220, 0, 'en', 'core/setting/setting', 'email.password', 'Password', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1221, 0, 'en', 'core/setting/setting', 'email.password_placeholder', 'Password to login to mail server', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1222, 0, 'en', 'core/setting/setting', 'email.encryption', 'Encryption', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1223, 0, 'en', 'core/setting/setting', 'email.mail_gun_domain', 'Domain', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1224, 0, 'en', 'core/setting/setting', 'email.mail_gun_domain_placeholder', 'Domain', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1225, 0, 'en', 'core/setting/setting', 'email.mail_gun_secret', 'Secret', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1226, 0, 'en', 'core/setting/setting', 'email.mail_gun_secret_placeholder', 'Secret', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1227, 0, 'en', 'core/setting/setting', 'email.mail_gun_endpoint', 'Endpoint', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1228, 0, 'en', 'core/setting/setting', 'email.mail_gun_endpoint_placeholder', 'Endpoint', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1229, 0, 'en', 'core/setting/setting', 'email.log_channel', 'Log channel', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1230, 0, 'en', 'core/setting/setting', 'email.sendmail_path', 'Sendmail Path', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1231, 0, 'en', 'core/setting/setting', 'email.encryption_placeholder', 'Encryption: ssl or tls', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1232, 0, 'en', 'core/setting/setting', 'email.ses_key', 'Key', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1233, 0, 'en', 'core/setting/setting', 'email.ses_key_placeholder', 'Key', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1234, 0, 'en', 'core/setting/setting', 'email.ses_secret', 'Secret', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1235, 0, 'en', 'core/setting/setting', 'email.ses_secret_placeholder', 'Secret', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1236, 0, 'en', 'core/setting/setting', 'email.ses_region', 'Region', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1237, 0, 'en', 'core/setting/setting', 'email.ses_region_placeholder', 'Region', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1238, 0, 'en', 'core/setting/setting', 'email.postmark_token', 'Token', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1239, 0, 'en', 'core/setting/setting', 'email.postmark_token_placeholder', 'Token', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1240, 0, 'en', 'core/setting/setting', 'email.template_title', 'Email templates', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1241, 0, 'en', 'core/setting/setting', 'email.template_description', 'Base templates for all emails', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1242, 0, 'en', 'core/setting/setting', 'email.template_header', 'Email template header', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1243, 0, 'en', 'core/setting/setting', 'email.template_header_description', 'Template for header of emails', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1244, 0, 'en', 'core/setting/setting', 'email.template_footer', 'Email template footer', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1245, 0, 'en', 'core/setting/setting', 'email.template_footer_description', 'Template for footer of emails', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1246, 0, 'en', 'core/setting/setting', 'email.default', 'Default', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1247, 0, 'en', 'core/setting/setting', 'email.using_queue_to_send_mail', 'Using queue job to send emails (Must to setup Queue first https://laravel.com/docs/queues#supervisor-configuration)', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1248, 0, 'en', 'core/setting/setting', 'media.title', 'Media', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1249, 0, 'en', 'core/setting/setting', 'media.driver', 'Driver', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1250, 0, 'en', 'core/setting/setting', 'media.description', 'Settings for media', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1251, 0, 'en', 'core/setting/setting', 'media.aws_access_key_id', 'AWS Access Key ID', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1252, 0, 'en', 'core/setting/setting', 'media.aws_secret_key', 'AWS Secret Key', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1253, 0, 'en', 'core/setting/setting', 'media.aws_default_region', 'AWS Default Region', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1254, 0, 'en', 'core/setting/setting', 'media.aws_bucket', 'AWS Bucket', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1255, 0, 'en', 'core/setting/setting', 'media.aws_url', 'AWS URL', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1256, 0, 'en', 'core/setting/setting', 'media.do_spaces_access_key_id', 'DO Spaces Access Key ID', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1257, 0, 'en', 'core/setting/setting', 'media.do_spaces_secret_key', 'DO Spaces Secret Key', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1258, 0, 'en', 'core/setting/setting', 'media.do_spaces_default_region', 'DO Spaces Default Region', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1259, 0, 'en', 'core/setting/setting', 'media.do_spaces_bucket', 'DO Spaces Bucket', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1260, 0, 'en', 'core/setting/setting', 'media.do_spaces_endpoint', 'DO Spaces Endpoint', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1261, 0, 'en', 'core/setting/setting', 'media.do_spaces_cdn_enabled', 'Is DO Spaces CDN enabled?', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1262, 0, 'en', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain', 'Do Spaces CDN custom domain', '2021-08-18 04:43:43', '2021-08-18 04:44:11'),
(1263, 0, 'en', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain_placeholder', 'https://your-custom-domain.com', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1264, 0, 'en', 'core/setting/setting', 'media.wasabi_access_key_id', 'Wasabi Access Key ID', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1265, 0, 'en', 'core/setting/setting', 'media.wasabi_secret_key', 'Wasabi Secret Key', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1266, 0, 'en', 'core/setting/setting', 'media.wasabi_default_region', 'Wasabi Default Region', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1267, 0, 'en', 'core/setting/setting', 'media.wasabi_bucket', 'Wasabi Bucket', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1268, 0, 'en', 'core/setting/setting', 'media.wasabi_root', 'Wasabi Root', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1269, 0, 'en', 'core/setting/setting', 'media.default_placeholder_image', 'Default placeholder image', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1270, 0, 'en', 'core/setting/setting', 'media.enable_chunk', 'Enable chunk size upload?', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1271, 0, 'en', 'core/setting/setting', 'media.chunk_size', 'Chunk size (Bytes)', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1272, 0, 'en', 'core/setting/setting', 'media.chunk_size_placeholder', 'Default: 1048576 ~ 1MB', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1273, 0, 'en', 'core/setting/setting', 'media.max_file_size', 'Chunk max file size (MB)', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1274, 0, 'en', 'core/setting/setting', 'media.max_file_size_placeholder', 'Default: 1048576 ~ 1GB', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1275, 0, 'en', 'core/setting/setting', 'media.enable_watermark', 'Enable watermark?', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1276, 0, 'en', 'core/setting/setting', 'media.watermark_source', 'Watermark image', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1277, 0, 'en', 'core/setting/setting', 'media.watermark_size', 'Size of watermark (%)', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1278, 0, 'en', 'core/setting/setting', 'media.watermark_size_placeholder', 'Default: 10 (%)', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1279, 0, 'en', 'core/setting/setting', 'media.watermark_opacity', 'Watermark Opacity (%)', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1280, 0, 'en', 'core/setting/setting', 'media.watermark_opacity_placeholder', 'Default: 70 (%)', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1281, 0, 'en', 'core/setting/setting', 'media.watermark_position', 'Watermark position', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1282, 0, 'en', 'core/setting/setting', 'media.watermark_position_x', 'Watermark position X', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1283, 0, 'en', 'core/setting/setting', 'media.watermark_position_y', 'Watermark position Y', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1284, 0, 'en', 'core/setting/setting', 'media.watermark_position_top_left', 'Top left', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1285, 0, 'en', 'core/setting/setting', 'media.watermark_position_top_right', 'Top right', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1286, 0, 'en', 'core/setting/setting', 'media.watermark_position_bottom_left', 'Bottom left', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1287, 0, 'en', 'core/setting/setting', 'media.watermark_position_bottom_right', 'Bottom right', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1288, 0, 'en', 'core/setting/setting', 'media.watermark_position_center', 'Center', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1289, 0, 'en', 'core/setting/setting', 'license.purchase_code', 'Purchase code', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1290, 0, 'en', 'core/setting/setting', 'license.buyer', 'Buyer', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1291, 0, 'en', 'core/setting/setting', 'field_type_not_exists', 'This field type does not exist', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1292, 0, 'en', 'core/setting/setting', 'save_settings', 'Save settings', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1293, 0, 'en', 'core/setting/setting', 'template', 'Template', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1294, 0, 'en', 'core/setting/setting', 'description', 'Description', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1295, 0, 'en', 'core/setting/setting', 'enable', 'Enable', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1296, 0, 'en', 'core/setting/setting', 'send', 'Send', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1297, 0, 'en', 'core/setting/setting', 'test_email_description', 'To send test email, please make sure you are updated configuration to send mail!', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1298, 0, 'en', 'core/setting/setting', 'test_email_input_placeholder', 'Enter the email which you want to send test email.', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1299, 0, 'en', 'core/setting/setting', 'test_email_modal_title', 'Send a test email', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1300, 0, 'en', 'core/setting/setting', 'test_send_mail', 'Send test mail', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1301, 0, 'en', 'core/setting/setting', 'test_email_send_success', 'Send email successfully!', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1302, 0, 'en', 'core/setting/setting', 'locale_direction_ltr', 'Left to Right', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1303, 0, 'en', 'core/setting/setting', 'locale_direction_rtl', 'Right to Left', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1304, 0, 'en', 'core/setting/setting', 'saving', 'Saving...', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1305, 0, 'en', 'core/setting/setting', 'emails_warning', 'You can add up to :count emails', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1306, 0, 'en', 'core/setting/setting', 'email_add_more', 'Add more', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1307, 0, 'vi', 'core/setting/setting', 'title', 'Cài đặt', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1308, 0, 'vi', 'core/setting/setting', 'general.theme', 'Giao diện', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1309, 0, 'vi', 'core/setting/setting', 'general.description', 'Cấu hình những thông tin cài đặt website.', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1310, 0, 'vi', 'core/setting/setting', 'general.title', 'Thông tin chung', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1311, 0, 'vi', 'core/setting/setting', 'general.general_block', 'Thông tin chung', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1312, 0, 'vi', 'core/setting/setting', 'general.site_title', 'Tên trang', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1313, 0, 'vi', 'core/setting/setting', 'general.admin_email', 'Email quản trị viên', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1314, 0, 'vi', 'core/setting/setting', 'general.seo_block', 'Cấu hình SEO', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1315, 0, 'vi', 'core/setting/setting', 'general.seo_title', 'Tiêu đề SEO', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1316, 0, 'vi', 'core/setting/setting', 'general.seo_description', 'Mô tả SEO', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1317, 0, 'vi', 'core/setting/setting', 'general.webmaster_tools_block', 'Google Webmaster Tools', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1318, 0, 'vi', 'core/setting/setting', 'general.google_site_verification', 'Google site verification', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1319, 0, 'vi', 'core/setting/setting', 'general.placeholder.site_title', 'Tên trang (tối đa 120 kí tự)', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1320, 0, 'vi', 'core/setting/setting', 'general.placeholder.admin_email', 'Admin Email', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1321, 0, 'vi', 'core/setting/setting', 'general.placeholder.google_analytics', 'Ví dụ: UA-42767940-2', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1322, 0, 'vi', 'core/setting/setting', 'general.placeholder.google_site_verification', 'Mã xác nhận trang web dùng cho Google Webmaster Tool', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1323, 0, 'vi', 'core/setting/setting', 'general.placeholder.seo_title', 'Tiêu đề SEO (tối đa 120 kí tự)', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1324, 0, 'vi', 'core/setting/setting', 'general.placeholder.seo_description', 'Mô tả SEO (tối đa 120 kí tự)', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1325, 0, 'vi', 'core/setting/setting', 'general.enable_change_admin_theme', 'Cho phép thay đổi giao diện quản trị?', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1326, 0, 'vi', 'core/setting/setting', 'general.enable', 'Bật', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1327, 0, 'vi', 'core/setting/setting', 'general.disable', 'Tắt', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1328, 0, 'vi', 'core/setting/setting', 'general.enable_cache', 'Bật bộ nhớ đệm?', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1329, 0, 'vi', 'core/setting/setting', 'general.cache_time', 'Thời gian lưu bộ nhớ đệm (phút)', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1330, 0, 'vi', 'core/setting/setting', 'general.cache_time_site_map', 'Thời gian lưu sơ đồ trang trong bộ nhớ đệm', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1331, 0, 'vi', 'core/setting/setting', 'general.admin_logo', 'Logo trang quản trị', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1332, 0, 'vi', 'core/setting/setting', 'general.admin_title', 'Tiêu đề trang quản trị', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1333, 0, 'vi', 'core/setting/setting', 'general.admin_title_placeholder', 'Tiêu đề hiển thị trên thẻ trình duyệt', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1334, 0, 'vi', 'core/setting/setting', 'general.rich_editor', 'Bộ soạn thảo văn bản', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1335, 0, 'vi', 'core/setting/setting', 'general.cache_block', 'Bộ nhớ đệm', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1336, 0, 'vi', 'core/setting/setting', 'general.yes', 'Bật', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1337, 0, 'vi', 'core/setting/setting', 'general.no', 'Tắt', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1338, 0, 'vi', 'core/setting/setting', 'email.subject', 'Tiêu đề', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1339, 0, 'vi', 'core/setting/setting', 'email.content', 'Nội dung', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1340, 0, 'vi', 'core/setting/setting', 'email.title', 'Cấu hình email template', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1341, 0, 'vi', 'core/setting/setting', 'email.description', 'Cấu trúc file template sử dụng HTML và các biến trong hệ thống.', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1342, 0, 'vi', 'core/setting/setting', 'email.reset_to_default', 'Khôi phục về mặc định', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1343, 0, 'vi', 'core/setting/setting', 'email.back', 'Trở lại trang cài đặt', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1344, 0, 'vi', 'core/setting/setting', 'email.reset_success', 'Khôi phục mặc định thành công', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1345, 0, 'vi', 'core/setting/setting', 'email.confirm_reset', 'Xác nhận khôi phục mặc định?', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1346, 0, 'vi', 'core/setting/setting', 'email.confirm_message', 'Bạn có chắc chắn muốn khôi phục về bản mặc định?', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1347, 0, 'vi', 'core/setting/setting', 'email.continue', 'Tiếp tục', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1348, 0, 'vi', 'core/setting/setting', 'email.sender_name', 'Tên người gửi', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1349, 0, 'vi', 'core/setting/setting', 'email.sender_name_placeholder', 'Tên', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1350, 0, 'vi', 'core/setting/setting', 'email.sender_email', 'Email của người gửi', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1351, 0, 'vi', 'core/setting/setting', 'email.port', 'Cổng', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1352, 0, 'vi', 'core/setting/setting', 'email.port_placeholder', 'Ví dụ: 587', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1353, 0, 'vi', 'core/setting/setting', 'email.host', 'Máy chủ', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1354, 0, 'vi', 'core/setting/setting', 'email.host_placeholder', 'Ví dụ: smtp.gmail.com', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1355, 0, 'vi', 'core/setting/setting', 'email.username', 'Tên đăng nhập', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1356, 0, 'vi', 'core/setting/setting', 'email.username_placeholder', 'Tên đăng nhập vào máy chủ mail', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1357, 0, 'vi', 'core/setting/setting', 'email.password', 'Mật khẩu', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1358, 0, 'vi', 'core/setting/setting', 'email.password_placeholder', 'Mật khẩu đăng nhập vào máy chủ mail', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1359, 0, 'vi', 'core/setting/setting', 'email.encryption', 'Mã hoá', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1360, 0, 'vi', 'core/setting/setting', 'email.mail_gun_domain', 'Tên miền', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1361, 0, 'vi', 'core/setting/setting', 'email.mail_gun_domain_placeholder', 'Tên miền', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1362, 0, 'vi', 'core/setting/setting', 'email.mail_gun_secret', 'Chuỗi bí mật', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1363, 0, 'vi', 'core/setting/setting', 'email.mail_gun_secret_placeholder', 'Chuỗi bí mật', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1364, 0, 'vi', 'core/setting/setting', 'email.template_title', 'Mẫu giao diện email', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1365, 0, 'vi', 'core/setting/setting', 'email.template_description', 'Giao diện mặc định cho tất cả email', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1366, 0, 'vi', 'core/setting/setting', 'email.template_header', 'Mẫu cho phần trên của email', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1367, 0, 'vi', 'core/setting/setting', 'email.template_header_description', 'Phần trên của tất cả email', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1368, 0, 'vi', 'core/setting/setting', 'email.template_footer', 'Mẫu cho phần dưới của email', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1369, 0, 'vi', 'core/setting/setting', 'email.template_footer_description', 'Phần dưới của tất cả email', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1370, 0, 'vi', 'core/setting/setting', 'save_settings', 'Lưu cài đặt', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1371, 0, 'vi', 'core/setting/setting', 'template', 'Mẫu', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1372, 0, 'vi', 'core/setting/setting', 'description', 'Mô tả', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1373, 0, 'vi', 'core/setting/setting', 'enable', 'Bật', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1374, 0, 'vi', 'core/setting/setting', 'test_send_mail', 'Gửi thử nghiệm', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1375, 0, 'en', 'core/table/general', 'operations', 'Operations', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1376, 0, 'en', 'core/table/general', 'loading_data', 'Loading data from server', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1377, 0, 'en', 'core/table/general', 'display', 'Display', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1378, 0, 'en', 'core/table/general', 'all', 'All', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1379, 0, 'en', 'core/table/general', 'edit_entry', 'Edit', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1380, 0, 'en', 'core/table/general', 'delete_entry', 'Delete', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1381, 0, 'en', 'core/table/general', 'show_from', 'Showing from', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1382, 0, 'en', 'core/table/general', 'to', 'to', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1383, 0, 'en', 'core/table/general', 'in', 'in', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1384, 0, 'en', 'core/table/general', 'records', 'records', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1385, 0, 'en', 'core/table/general', 'no_data', 'No data to display', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1386, 0, 'en', 'core/table/general', 'no_record', 'No record', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1387, 0, 'en', 'core/table/general', 'loading', 'Loading data from server', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1388, 0, 'en', 'core/table/general', 'confirm_delete', 'Confirm delete', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1389, 0, 'en', 'core/table/general', 'confirm_delete_msg', 'Do you really want to delete this record?', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1390, 0, 'en', 'core/table/general', 'cancel', 'Cancel', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1391, 0, 'en', 'core/table/general', 'delete', 'Delete', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1392, 0, 'en', 'core/table/general', 'close', 'Close', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1393, 0, 'en', 'core/table/general', 'contains', 'Contains', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1394, 0, 'en', 'core/table/general', 'is_equal_to', 'Is equal to', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1395, 0, 'en', 'core/table/general', 'greater_than', 'Greater than', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1396, 0, 'en', 'core/table/general', 'less_than', 'Less than', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1397, 0, 'en', 'core/table/general', 'value', 'Value', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1398, 0, 'en', 'core/table/general', 'select_field', 'Select field', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1399, 0, 'en', 'core/table/general', 'reset', 'Reset', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1400, 0, 'en', 'core/table/general', 'add_additional_filter', 'Add additional filter', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1401, 0, 'en', 'core/table/general', 'apply', 'Apply', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1402, 0, 'en', 'core/table/general', 'filters', 'Filters', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1403, 0, 'en', 'core/table/general', 'bulk_change', 'Bulk changes', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1404, 0, 'en', 'core/table/general', 'select_option', 'Select option', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1405, 0, 'en', 'core/table/general', 'bulk_actions', 'Bulk Actions', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1406, 0, 'en', 'core/table/general', 'save_bulk_change_success', 'Update data for selected record(s) successfully!', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1407, 0, 'en', 'core/table/general', 'please_select_record', 'Please select at least one record to perform this action!', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1408, 0, 'en', 'core/table/general', 'filtered', '(filtered from _MAX_ total records)', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1409, 0, 'en', 'core/table/general', 'search', 'Search...', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1410, 0, 'en', 'core/table/table', 'operations', 'Operations', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1411, 0, 'en', 'core/table/table', 'loading_data', 'Loading data from server', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1412, 0, 'en', 'core/table/table', 'display', 'Display', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1413, 0, 'en', 'core/table/table', 'all', 'All', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1414, 0, 'en', 'core/table/table', 'edit_entry', 'Edit', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1415, 0, 'en', 'core/table/table', 'delete_entry', 'Delete', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1416, 0, 'en', 'core/table/table', 'show_from', 'Showing from', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1417, 0, 'en', 'core/table/table', 'to', 'to', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1418, 0, 'en', 'core/table/table', 'in', 'in', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1419, 0, 'en', 'core/table/table', 'records', 'records', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1420, 0, 'en', 'core/table/table', 'no_data', 'No data to display', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1421, 0, 'en', 'core/table/table', 'no_record', 'No record', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1422, 0, 'en', 'core/table/table', 'loading', 'Loading data from server', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1423, 0, 'en', 'core/table/table', 'confirm_delete', 'Confirm delete', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1424, 0, 'en', 'core/table/table', 'confirm_delete_msg', 'Do you really want to delete this record?', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1425, 0, 'en', 'core/table/table', 'cancel', 'Cancel', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1426, 0, 'en', 'core/table/table', 'delete', 'Delete', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1427, 0, 'en', 'core/table/table', 'close', 'Close', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1428, 0, 'en', 'core/table/table', 'contains', 'Contains', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1429, 0, 'en', 'core/table/table', 'is_equal_to', 'Is equal to', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1430, 0, 'en', 'core/table/table', 'greater_than', 'Greater than', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1431, 0, 'en', 'core/table/table', 'less_than', 'Less than', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1432, 0, 'en', 'core/table/table', 'value', 'Value', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1433, 0, 'en', 'core/table/table', 'select_field', 'Select field', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1434, 0, 'en', 'core/table/table', 'reset', 'Reset', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1435, 0, 'en', 'core/table/table', 'add_additional_filter', 'Add additional filter', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1436, 0, 'en', 'core/table/table', 'apply', 'Apply', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1437, 0, 'en', 'core/table/table', 'filters', 'Filters', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1438, 0, 'en', 'core/table/table', 'bulk_change', 'Bulk changes', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1439, 0, 'en', 'core/table/table', 'select_option', 'Select option', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1440, 0, 'en', 'core/table/table', 'bulk_actions', 'Bulk Actions', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1441, 0, 'en', 'core/table/table', 'save_bulk_change_success', 'Update data for selected record(s) successfully!', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1442, 0, 'en', 'core/table/table', 'please_select_record', 'Please select at least one record to perform this action!', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1443, 0, 'en', 'core/table/table', 'filtered', '(filtered from _MAX_ total records)', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1444, 0, 'en', 'core/table/table', 'search', 'Search...', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1445, 0, 'vi', 'core/table/general', 'operations', 'Hành động', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1446, 0, 'vi', 'core/table/general', 'loading_data', 'Đang tải dữ liệu từ hệ thống', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1447, 0, 'vi', 'core/table/general', 'display', 'Hiển thị', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1448, 0, 'vi', 'core/table/general', 'all', 'Tất cả', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1449, 0, 'vi', 'core/table/general', 'edit_entry', 'Sửa', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1450, 0, 'vi', 'core/table/general', 'delete_entry', 'Xoá', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1451, 0, 'vi', 'core/table/general', 'show_from', 'Hiển thị từ', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1452, 0, 'vi', 'core/table/general', 'to', 'đến', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1453, 0, 'vi', 'core/table/general', 'in', 'trong tổng số', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1454, 0, 'vi', 'core/table/general', 'records', 'bản ghi', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1455, 0, 'vi', 'core/table/general', 'no_data', 'Không có dữ liệu để hiển thị', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1456, 0, 'vi', 'core/table/general', 'no_record', 'không có bản ghi nào', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1457, 0, 'vi', 'core/table/general', 'loading', 'Đang tải dữ liệu từ hệ thống', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1458, 0, 'vi', 'core/table/general', 'confirm_delete', 'Xác nhận xoá', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1459, 0, 'vi', 'core/table/general', 'confirm_delete_msg', 'Bạn có chắc chắn muốn xoá bản ghi này?', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1460, 0, 'vi', 'core/table/general', 'cancel', 'Huỷ bỏ', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1461, 0, 'vi', 'core/table/general', 'delete', 'Xoá', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1462, 0, 'vi', 'core/table/general', 'close', 'Đóng', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1463, 0, 'vi', 'core/table/general', 'is_equal_to', 'Bằng với', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1464, 0, 'vi', 'core/table/general', 'greater_than', 'Lớn hơn', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1465, 0, 'vi', 'core/table/general', 'less_than', 'Nhỏ hơn', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1466, 0, 'vi', 'core/table/general', 'value', 'Giá trị', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1467, 0, 'vi', 'core/table/general', 'select_field', 'Chọn trường', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1468, 0, 'vi', 'core/table/general', 'reset', 'Làm mới', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1469, 0, 'vi', 'core/table/general', 'add_additional_filter', 'Thêm bộ lọc', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1470, 0, 'vi', 'core/table/general', 'apply', 'Áp dụng', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1471, 0, 'vi', 'core/table/general', 'select_option', 'Lựa chọn', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1472, 0, 'vi', 'core/table/general', 'filters', 'Lọc dữ liệu', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1473, 0, 'vi', 'core/table/general', 'bulk_change', 'Thay đổi hàng loạt', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1474, 0, 'vi', 'core/table/general', 'bulk_actions', 'Hành động', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1475, 0, 'vi', 'core/table/general', 'contains', 'Bao gồm', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1476, 0, 'vi', 'core/table/general', 'filtered', '(đã được lọc từ _MAX_ bản ghi)', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1477, 0, 'en', 'packages/menu/menu', 'name', 'Menus', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1478, 0, 'en', 'packages/menu/menu', 'key_name', 'Menu name (key: :key)', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1479, 0, 'en', 'packages/menu/menu', 'basic_info', 'Basic information', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1480, 0, 'en', 'packages/menu/menu', 'add_to_menu', 'Add to menu', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1481, 0, 'en', 'packages/menu/menu', 'custom_link', 'Custom link', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1482, 0, 'en', 'packages/menu/menu', 'add_link', 'Add link', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1483, 0, 'en', 'packages/menu/menu', 'structure', 'Menu structure', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1484, 0, 'en', 'packages/menu/menu', 'remove', 'Remove', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1485, 0, 'en', 'packages/menu/menu', 'cancel', 'Cancel', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1486, 0, 'en', 'packages/menu/menu', 'title', 'Title', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1487, 0, 'en', 'packages/menu/menu', 'icon', 'Icon', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1488, 0, 'en', 'packages/menu/menu', 'url', 'URL', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1489, 0, 'en', 'packages/menu/menu', 'target', 'Target', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1490, 0, 'en', 'packages/menu/menu', 'css_class', 'CSS class', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1491, 0, 'en', 'packages/menu/menu', 'self_open_link', 'Open link directly', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1492, 0, 'en', 'packages/menu/menu', 'blank_open_link', 'Open link in new tab', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1493, 0, 'en', 'packages/menu/menu', 'create', 'Create menu', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1494, 0, 'en', 'packages/menu/menu', 'edit', 'Edit menu', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1495, 0, 'en', 'packages/menu/menu', 'menu_settings', 'Menu settings', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1496, 0, 'en', 'packages/menu/menu', 'display_location', 'Display location', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1497, 0, 'vi', 'packages/menu/menu', 'name', 'Menu', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1498, 0, 'vi', 'packages/menu/menu', 'cancel', 'Hủy bỏ', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1499, 0, 'vi', 'packages/menu/menu', 'add_link', 'Thêm liên kết', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1500, 0, 'vi', 'packages/menu/menu', 'add_to_menu', 'Thêm vào trình đơn', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1501, 0, 'vi', 'packages/menu/menu', 'basic_info', 'Thông tin cơ bản', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1502, 0, 'vi', 'packages/menu/menu', 'blank_open_link', 'Mở liên kết trong tab mới', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1503, 0, 'vi', 'packages/menu/menu', 'css_class', 'CSS class', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1504, 0, 'vi', 'packages/menu/menu', 'custom_link', 'Liên kết tùy chọn', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1505, 0, 'vi', 'packages/menu/menu', 'icon', 'Biểu tượng', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1506, 0, 'vi', 'packages/menu/menu', 'key_name', 'Tên menu (key::key)', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1507, 0, 'vi', 'packages/menu/menu', 'remove', 'Xóa', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1508, 0, 'vi', 'packages/menu/menu', 'self_open_link', 'Mở liên kết trong tab hiện tại', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1509, 0, 'vi', 'packages/menu/menu', 'structure', 'Cấu trúc trình đơn', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1510, 0, 'vi', 'packages/menu/menu', 'target', 'Target', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1511, 0, 'vi', 'packages/menu/menu', 'title', 'Tiêu đề', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1512, 0, 'vi', 'packages/menu/menu', 'url', 'URL', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1513, 0, 'vi', 'packages/menu/menu', 'create', 'Tạo trình đơn', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1514, 0, 'vi', 'packages/menu/menu', 'edit', 'Sửa trình đơn', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1515, 0, 'en', 'packages/page/pages', 'create', 'Create new page', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1516, 0, 'en', 'packages/page/pages', 'edit', 'Edit page', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1517, 0, 'en', 'packages/page/pages', 'form.name', 'Name', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1518, 0, 'en', 'packages/page/pages', 'form.name_placeholder', 'Page\'s name (Maximum 120 characters)', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1519, 0, 'en', 'packages/page/pages', 'form.content', 'Content', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1520, 0, 'en', 'packages/page/pages', 'form.note', 'Note content', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1521, 0, 'en', 'packages/page/pages', 'notices.no_select', 'Please select at least one record to take this action!', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1522, 0, 'en', 'packages/page/pages', 'notices.update_success_message', 'Update successfully', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1523, 0, 'en', 'packages/page/pages', 'cannot_delete', 'Page could not be deleted', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1524, 0, 'en', 'packages/page/pages', 'deleted', 'Page deleted', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1525, 0, 'en', 'packages/page/pages', 'pages', 'Pages', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1526, 0, 'en', 'packages/page/pages', 'menu', 'Pages', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1527, 0, 'en', 'packages/page/pages', 'menu_name', 'Pages', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1528, 0, 'en', 'packages/page/pages', 'edit_this_page', 'Edit this page', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1529, 0, 'en', 'packages/page/pages', 'total_pages', 'Total pages', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1530, 0, 'en', 'packages/page/pages', 'settings.show_on_front', 'Your homepage displays', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1531, 0, 'en', 'packages/page/pages', 'settings.select', '— Select —', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1532, 0, 'en', 'packages/page/pages', 'front_page', 'Front Page', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1533, 0, 'vi', 'packages/page/pages', 'create', 'Thêm trang', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1534, 0, 'vi', 'packages/page/pages', 'edit', 'Sửa trang', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1535, 0, 'vi', 'packages/page/pages', 'form.name', 'Tiêu đề trang', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1536, 0, 'vi', 'packages/page/pages', 'form.note', 'Nội dung ghi chú', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1537, 0, 'vi', 'packages/page/pages', 'form.name_placeholder', 'Tên trang (tối đa 120 kí tự)', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1538, 0, 'vi', 'packages/page/pages', 'form.content', 'Nội dung', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1539, 0, 'vi', 'packages/page/pages', 'notices.no_select', 'Chọn ít nhất 1 trang để thực hiện hành động này!', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1540, 0, 'vi', 'packages/page/pages', 'notices.update_success_message', 'Cập nhật thành công', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1541, 0, 'vi', 'packages/page/pages', 'deleted', 'Xóa trang thành công', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1542, 0, 'vi', 'packages/page/pages', 'cannot_delete', 'Không thể xóa trang', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1543, 0, 'vi', 'packages/page/pages', 'menu', 'Trang', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1544, 0, 'vi', 'packages/page/pages', 'menu_name', 'Trang', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1545, 0, 'vi', 'packages/page/pages', 'edit_this_page', 'Sửa trang này', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1546, 0, 'vi', 'packages/page/pages', 'pages', 'Trang', '2021-08-18 04:43:44', '2021-08-18 04:44:11'),
(1547, 0, 'en', 'packages/plugin-management/plugin', 'enabled', 'Enabled', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1548, 0, 'en', 'packages/plugin-management/plugin', 'deactivated', 'Deactivated', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1549, 0, 'en', 'packages/plugin-management/plugin', 'activated', 'Activated', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1550, 0, 'en', 'packages/plugin-management/plugin', 'activate', 'Activate', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1551, 0, 'en', 'packages/plugin-management/plugin', 'deactivate', 'Deactivate', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1552, 0, 'en', 'packages/plugin-management/plugin', 'author', 'By', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1553, 0, 'en', 'packages/plugin-management/plugin', 'update_plugin_status_success', 'Update plugin successfully', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1554, 0, 'en', 'packages/plugin-management/plugin', 'plugins', 'Plugins', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1555, 0, 'en', 'packages/plugin-management/plugin', 'missing_required_plugins', 'Please activate plugin(s): :plugins before activate this plugin!', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1556, 0, 'en', 'packages/plugin-management/plugin', 'remove', 'Remove', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1557, 0, 'en', 'packages/plugin-management/plugin', 'remove_plugin_success', 'Remove plugin successfully!', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1558, 0, 'en', 'packages/plugin-management/plugin', 'remove_plugin', 'Remove plugin', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1559, 0, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_message', 'Do you really want to remove this plugin?', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1560, 0, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_yes', 'Yes, remove it!', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1561, 0, 'en', 'packages/plugin-management/plugin', 'total_plugins', 'Total plugins', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1562, 0, 'en', 'packages/plugin-management/plugin', 'invalid_plugin', 'This plugin is not a valid plugin, please check it again!', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1563, 0, 'en', 'packages/plugin-management/plugin', 'version', 'Version', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1564, 0, 'en', 'packages/plugin-management/plugin', 'invalid_json', 'Invalid plugin.json!', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1565, 0, 'en', 'packages/plugin-management/plugin', 'activate_success', 'Activate plugin successfully!', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1566, 0, 'en', 'packages/plugin-management/plugin', 'activated_already', 'This plugin is activated already!', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1567, 0, 'en', 'packages/plugin-management/plugin', 'plugin_not_exist', 'This plugin is not exists.', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1568, 0, 'en', 'packages/plugin-management/plugin', 'missing_json_file', 'Missing file plugin.json!', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1569, 0, 'en', 'packages/plugin-management/plugin', 'plugin_invalid', 'Plugin is valid!', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1570, 0, 'en', 'packages/plugin-management/plugin', 'published_assets_success', 'Publish assets for plugin :name successfully!', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1571, 0, 'en', 'packages/plugin-management/plugin', 'plugin_removed', 'Plugin has been removed!', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1572, 0, 'en', 'packages/plugin-management/plugin', 'deactivated_success', 'Deactivate plugin successfully!', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1573, 0, 'en', 'packages/plugin-management/plugin', 'deactivated_already', 'This plugin is deactivated already!', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1574, 0, 'en', 'packages/plugin-management/plugin', 'folder_is_not_writeable', 'Cannot write files! Folder :name is not writable. Please chmod to make it writable!', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1575, 0, 'en', 'packages/plugin-management/plugin', 'plugin_is_not_ready', 'Plugin :name is not ready to use', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1576, 0, 'vi', 'packages/plugin-management/plugin', 'activate', 'Kích hoạt', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1577, 0, 'vi', 'packages/plugin-management/plugin', 'author', 'Tác giả', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1578, 0, 'vi', 'packages/plugin-management/plugin', 'version', 'Phiên bản', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1579, 0, 'vi', 'packages/plugin-management/plugin', 'activated', 'Đã kích hoạt', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1580, 0, 'vi', 'packages/plugin-management/plugin', 'deactivate', 'Hủy kích hoạt', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1581, 0, 'vi', 'packages/plugin-management/plugin', 'deactivated', 'Đã vô hiệu', '2021-08-18 04:43:44', '2021-08-18 04:44:12');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1582, 0, 'vi', 'packages/plugin-management/plugin', 'enabled', 'Kích hoạt', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1583, 0, 'vi', 'packages/plugin-management/plugin', 'invalid_plugin', 'Gói mở rộng không hợp lệ', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1584, 0, 'vi', 'packages/plugin-management/plugin', 'update_plugin_status_success', 'Cập nhật trạng thái gói mở rộng thành công', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1585, 0, 'vi', 'packages/plugin-management/plugin', 'missing_required_plugins', 'Vui lòng kích hoạt các tiện ích mở rộng :plugins trước khi kích hoạt tiện ích này', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1586, 0, 'vi', 'packages/plugin-management/plugin', 'plugins', 'Tiện ích mở rộng', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1587, 0, 'en', 'packages/seo-helper/seo-helper', 'meta_box_header', 'Search Engine Optimize', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1588, 0, 'en', 'packages/seo-helper/seo-helper', 'edit_seo_meta', 'Edit SEO meta', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1589, 0, 'en', 'packages/seo-helper/seo-helper', 'default_description', 'Setup meta title & description to make your site easy to discovered on search engines such as Google', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1590, 0, 'en', 'packages/seo-helper/seo-helper', 'seo_title', 'SEO Title', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1591, 0, 'en', 'packages/seo-helper/seo-helper', 'seo_description', 'SEO description', '2021-08-18 04:43:44', '2021-08-18 04:44:12'),
(1592, 0, 'vi', 'packages/seo-helper/seo-helper', 'meta_box_header', 'Tối ưu hoá bộ máy tìm kiếm (SEO)', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1593, 0, 'vi', 'packages/seo-helper/seo-helper', 'edit_seo_meta', 'Chỉnh sửa SEO', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1594, 0, 'vi', 'packages/seo-helper/seo-helper', 'default_description', 'Thiết lập các thẻ mô tả giúp người dùng dễ dàng tìm thấy trên công cụ tìm kiếm như Google.', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1595, 0, 'vi', 'packages/seo-helper/seo-helper', 'seo_title', 'Tiêu đề trang', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1596, 0, 'vi', 'packages/seo-helper/seo-helper', 'seo_description', 'Mô tả trang', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1597, 0, 'en', 'packages/slug/slug', 'permalink_settings', 'Permalink', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1598, 0, 'en', 'packages/slug/slug', 'settings.title', 'Permalink settings', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1599, 0, 'en', 'packages/slug/slug', 'settings.description', 'Manage permalink for all modules.', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1600, 0, 'en', 'packages/slug/slug', 'settings.preview', 'Preview', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1601, 0, 'en', 'packages/slug/slug', 'settings.turn_off_automatic_url_translation_into_latin', 'Turn off automatic URL translation into Latin?', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1602, 0, 'en', 'packages/slug/slug', 'preview', 'Preview', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1603, 0, 'en', 'packages/theme/theme', 'name', 'Themes', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1604, 0, 'en', 'packages/theme/theme', 'theme', 'Theme', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1605, 0, 'en', 'packages/theme/theme', 'author', 'Author', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1606, 0, 'en', 'packages/theme/theme', 'version', 'Version', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1607, 0, 'en', 'packages/theme/theme', 'description', 'Description', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1608, 0, 'en', 'packages/theme/theme', 'active_success', 'Activate theme :name successfully!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1609, 0, 'en', 'packages/theme/theme', 'active', 'Active', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1610, 0, 'en', 'packages/theme/theme', 'activated', 'Activated', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1611, 0, 'en', 'packages/theme/theme', 'appearance', 'Appearance', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1612, 0, 'en', 'packages/theme/theme', 'theme_options', 'Theme options', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1613, 0, 'en', 'packages/theme/theme', 'save_changes', 'Save Changes', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1614, 0, 'en', 'packages/theme/theme', 'developer_mode', 'Developer Mode Enabled', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1615, 0, 'en', 'packages/theme/theme', 'custom_css', 'Custom CSS', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1616, 0, 'en', 'packages/theme/theme', 'custom_js', 'Custom JS', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1617, 0, 'en', 'packages/theme/theme', 'custom_header_js', 'Header JS', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1618, 0, 'en', 'packages/theme/theme', 'custom_header_js_placeholder', 'JS in header of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1619, 0, 'en', 'packages/theme/theme', 'custom_body_js', 'Body JS', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1620, 0, 'en', 'packages/theme/theme', 'custom_body_js_placeholder', 'JS in body of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1621, 0, 'en', 'packages/theme/theme', 'custom_footer_js', 'Footer JS', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1622, 0, 'en', 'packages/theme/theme', 'custom_footer_js_placeholder', 'JS in footer of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1623, 0, 'en', 'packages/theme/theme', 'remove_theme_success', 'Remove theme successfully!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1624, 0, 'en', 'packages/theme/theme', 'theme_is_not_existed', 'This theme is not existed!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1625, 0, 'en', 'packages/theme/theme', 'remove', 'Remove', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1626, 0, 'en', 'packages/theme/theme', 'remove_theme', 'Remove theme', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1627, 0, 'en', 'packages/theme/theme', 'remove_theme_confirm_message', 'Do you really want to remove this theme?', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1628, 0, 'en', 'packages/theme/theme', 'remove_theme_confirm_yes', 'Yes, remove it!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1629, 0, 'en', 'packages/theme/theme', 'total_themes', 'Total themes', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1630, 0, 'en', 'packages/theme/theme', 'show_admin_bar', 'Show admin bar (When admin logged in, still show admin bar in website)?', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1631, 0, 'en', 'packages/theme/theme', 'settings.title', 'Theme', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1632, 0, 'en', 'packages/theme/theme', 'settings.description', 'Setting for theme', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1633, 0, 'en', 'packages/theme/theme', 'add_new', 'Add new', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1634, 0, 'en', 'packages/theme/theme', 'theme_activated_already', 'Theme \":name\" is activated already!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1635, 0, 'en', 'packages/theme/theme', 'missing_json_file', 'Missing file theme.json!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1636, 0, 'en', 'packages/theme/theme', 'theme_invalid', 'Theme is valid!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1637, 0, 'en', 'packages/theme/theme', 'published_assets_success', 'Publish assets for :themes successfully!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1638, 0, 'en', 'packages/theme/theme', 'cannot_remove_theme', 'Cannot remove activated theme, please activate another theme before removing \":name\"!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1639, 0, 'en', 'packages/theme/theme', 'theme_deleted', 'Theme \":name\" has been destroyed.', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1640, 0, 'en', 'packages/theme/theme', 'removed_assets', 'Remove assets of a theme :name successfully!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1641, 0, 'en', 'packages/theme/theme', 'update_custom_css_success', 'Update custom CSS successfully!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1642, 0, 'en', 'packages/theme/theme', 'update_custom_js_success', 'Update custom JS successfully!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1643, 0, 'en', 'packages/theme/theme', 'go_to_dashboard', 'Go to dashboard', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1644, 0, 'en', 'packages/theme/theme', 'custom_css_placeholder', 'Using Ctrl + Space to autocomplete.', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1645, 0, 'en', 'packages/theme/theme', 'theme_option_general', 'General', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1646, 0, 'en', 'packages/theme/theme', 'theme_option_general_description', 'General settings', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1647, 0, 'en', 'packages/theme/theme', 'theme_option_seo_open_graph_image', 'SEO default Open Graph image', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1648, 0, 'en', 'packages/theme/theme', 'theme_option_logo', 'Logo', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1649, 0, 'en', 'packages/theme/theme', 'theme_option_favicon', 'Favicon', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1650, 0, 'en', 'packages/theme/theme', 'folder_is_not_writeable', 'Cannot write files! Folder :name is not writable. Please chmod to make it writable!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1651, 0, 'vi', 'packages/theme/theme', 'activated', 'Đã kích hoạt', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1652, 0, 'vi', 'packages/theme/theme', 'active', 'Kích hoạt', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1653, 0, 'vi', 'packages/theme/theme', 'active_success', 'Kích hoạt giao diện thành công!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1654, 0, 'vi', 'packages/theme/theme', 'author', 'Tác giả', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1655, 0, 'vi', 'packages/theme/theme', 'description', 'Mô tả', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1656, 0, 'vi', 'packages/theme/theme', 'theme', 'Giao diện', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1657, 0, 'vi', 'packages/theme/theme', 'theme_options', 'Tuỳ chọn giao diện', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1658, 0, 'vi', 'packages/theme/theme', 'version', 'Phiên bản', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1659, 0, 'vi', 'packages/theme/theme', 'save_changes', 'Lưu thay đổi', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1660, 0, 'vi', 'packages/theme/theme', 'developer_mode', 'Đang kích hoạt chế độ thử nghiệm', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1661, 0, 'vi', 'packages/theme/theme', 'custom_css', 'Tuỳ chỉnh CSS', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1662, 0, 'en', 'packages/widget/global', 'name', 'Widgets', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1663, 0, 'en', 'packages/widget/global', 'create', 'New widget', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1664, 0, 'en', 'packages/widget/global', 'edit', 'Edit widget', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1665, 0, 'en', 'packages/widget/global', 'delete', 'Delete', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1666, 0, 'en', 'packages/widget/global', 'available', 'Available Widgets', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1667, 0, 'en', 'packages/widget/global', 'instruction', 'To activate a widget drag it to a sidebar or click on it. To deactivate a widget and delete its settings, drag it back.', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1668, 0, 'en', 'packages/widget/global', 'number_tag_display', 'Number tags will be display', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1669, 0, 'en', 'packages/widget/global', 'number_post_display', 'Number posts will be display', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1670, 0, 'en', 'packages/widget/global', 'select_menu', 'Select Menu', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1671, 0, 'en', 'packages/widget/global', 'widget_text', 'Text', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1672, 0, 'en', 'packages/widget/global', 'widget_text_description', 'Arbitrary text or HTML.', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1673, 0, 'en', 'packages/widget/global', 'widget_recent_post', 'Recent Posts', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1674, 0, 'en', 'packages/widget/global', 'widget_recent_post_description', 'Recent posts widget.', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1675, 0, 'en', 'packages/widget/global', 'widget_custom_menu', 'Custom Menu', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1676, 0, 'en', 'packages/widget/global', 'widget_custom_menu_description', 'Add a custom menu to your widget area.', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1677, 0, 'en', 'packages/widget/global', 'widget_tag', 'Tags', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1678, 0, 'en', 'packages/widget/global', 'widget_tag_description', 'Popular tags', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1679, 0, 'en', 'packages/widget/global', 'save_success', 'Save widget successfully!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1680, 0, 'en', 'packages/widget/global', 'delete_success', 'Delete widget successfully!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1681, 0, 'en', 'packages/widget/widget', 'name', 'Widgets', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1682, 0, 'en', 'packages/widget/widget', 'create', 'New widget', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1683, 0, 'en', 'packages/widget/widget', 'edit', 'Edit widget', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1684, 0, 'en', 'packages/widget/widget', 'delete', 'Delete', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1685, 0, 'en', 'packages/widget/widget', 'available', 'Available Widgets', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1686, 0, 'en', 'packages/widget/widget', 'instruction', 'To activate a widget drag it to a sidebar or click on it. To deactivate a widget and delete its settings, drag it back.', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1687, 0, 'en', 'packages/widget/widget', 'number_tag_display', 'Number tags will be display', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1688, 0, 'en', 'packages/widget/widget', 'number_post_display', 'Number posts will be display', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1689, 0, 'en', 'packages/widget/widget', 'select_menu', 'Select Menu', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1690, 0, 'en', 'packages/widget/widget', 'widget_text', 'Text', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1691, 0, 'en', 'packages/widget/widget', 'widget_text_description', 'Arbitrary text or HTML.', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1692, 0, 'en', 'packages/widget/widget', 'widget_recent_post', 'Recent Posts', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1693, 0, 'en', 'packages/widget/widget', 'widget_recent_post_description', 'Recent posts widget.', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1694, 0, 'en', 'packages/widget/widget', 'widget_custom_menu', 'Custom Menu', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1695, 0, 'en', 'packages/widget/widget', 'widget_custom_menu_description', 'Add a custom menu to your widget area.', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1696, 0, 'en', 'packages/widget/widget', 'widget_tag', 'Tags', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1697, 0, 'en', 'packages/widget/widget', 'widget_tag_description', 'Popular tags', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1698, 0, 'en', 'packages/widget/widget', 'save_success', 'Save widget successfully!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1699, 0, 'en', 'packages/widget/widget', 'delete_success', 'Delete widget successfully!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1700, 0, 'en', 'packages/widget/widget', 'primary_sidebar_name', 'Primary sidebar', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1701, 0, 'en', 'packages/widget/widget', 'primary_sidebar_description', 'Primary sidebar section', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1702, 0, 'vi', 'packages/widget/global', 'name', 'Widgets', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1703, 0, 'vi', 'packages/widget/global', 'create', 'New widget', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1704, 0, 'vi', 'packages/widget/global', 'edit', 'Edit widget', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1705, 0, 'vi', 'packages/widget/global', 'available', 'Tiện ích có sẵn', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1706, 0, 'vi', 'packages/widget/global', 'delete', 'Xóa', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1707, 0, 'vi', 'packages/widget/global', 'instruction', 'Để kích hoạt tiện ích, hãy kéo nó vào sidebar hoặc nhấn vào nó. Để hủy kích hoạt tiện ích và xóa các thiết lập của tiện ích, kéo nó quay trở lại.', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1708, 0, 'vi', 'packages/widget/global', 'number_post_display', 'Số bài viết sẽ hiển thị', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1709, 0, 'vi', 'packages/widget/global', 'number_tag_display', 'Số thẻ sẽ hiển thị', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1710, 0, 'vi', 'packages/widget/global', 'select_menu', 'Lựa chọn trình đơn', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1711, 0, 'vi', 'packages/widget/global', 'widget_custom_menu', 'Menu tùy chỉnh', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1712, 0, 'vi', 'packages/widget/global', 'widget_custom_menu_description', 'Thêm menu tùy chỉnh vào khu vực tiện ích của bạn', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1713, 0, 'vi', 'packages/widget/global', 'widget_recent_post', 'Bài viết gần đây', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1714, 0, 'vi', 'packages/widget/global', 'widget_recent_post_description', 'Tiện ích bài viết gần đây', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1715, 0, 'vi', 'packages/widget/global', 'widget_tag', 'Thẻ', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1716, 0, 'vi', 'packages/widget/global', 'widget_tag_description', 'Thẻ phổ biến, sử dụng nhiều', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1717, 0, 'vi', 'packages/widget/global', 'widget_text', 'Văn bản', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1718, 0, 'vi', 'packages/widget/global', 'widget_text_description', 'Văn bản tùy ý hoặc HTML.', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1719, 0, 'vi', 'packages/widget/global', 'delete_success', 'Xoá tiện ích thành công', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1720, 0, 'vi', 'packages/widget/global', 'save_success', 'Lưu tiện ích thành công!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1721, 0, 'en', 'plugins/ads/ads', 'name', 'Ads', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1722, 0, 'en', 'plugins/ads/ads', 'create', 'New ads', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1723, 0, 'en', 'plugins/ads/ads', 'edit', 'Edit ads', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1724, 0, 'en', 'plugins/ads/ads', 'location', 'Location', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1725, 0, 'en', 'plugins/ads/ads', 'url', 'URL', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1726, 0, 'en', 'plugins/ads/ads', 'expired_at', 'Expired at', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1727, 0, 'en', 'plugins/ads/ads', 'key', 'Key', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1728, 0, 'en', 'plugins/ads/ads', 'shortcode', 'Shortcode', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1729, 0, 'en', 'plugins/ads/ads', 'clicked', 'Clicked', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1730, 0, 'en', 'plugins/ads/ads', 'not_set', 'Not set', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1731, 0, 'en', 'plugins/analytics/analytics', 'sessions', 'Sessions', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1732, 0, 'en', 'plugins/analytics/analytics', 'visitors', 'Visitors', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1733, 0, 'en', 'plugins/analytics/analytics', 'pageviews', 'Pageviews', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1734, 0, 'en', 'plugins/analytics/analytics', 'bounce_rate', 'Bounce Rate', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1735, 0, 'en', 'plugins/analytics/analytics', 'page_session', 'Pages/Session', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1736, 0, 'en', 'plugins/analytics/analytics', 'avg_duration', 'Avg. Duration', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1737, 0, 'en', 'plugins/analytics/analytics', 'percent_new_session', 'Percent new session', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1738, 0, 'en', 'plugins/analytics/analytics', 'new_users', 'New visitors', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1739, 0, 'en', 'plugins/analytics/analytics', 'visits', 'visits', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1740, 0, 'en', 'plugins/analytics/analytics', 'views', 'views', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1741, 0, 'en', 'plugins/analytics/analytics', 'view_id_not_specified', 'You must provide a valid view id. The document here: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1742, 0, 'en', 'plugins/analytics/analytics', 'credential_is_not_valid', 'Analytics credentials is not valid. The document here: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1743, 0, 'en', 'plugins/analytics/analytics', 'start_date_can_not_before_end_date', 'Start date :start_date cannot be after end date :end_date', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1744, 0, 'en', 'plugins/analytics/analytics', 'wrong_configuration', 'To view analytics you\'ll need to get a google analytics client id and add it to your settings. <br /> You also need JSON credential data. <br /> The document here: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1745, 0, 'en', 'plugins/analytics/analytics', 'settings.title', 'Google Analytics', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1746, 0, 'en', 'plugins/analytics/analytics', 'settings.description', 'Config Credentials for Google Analytics', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1747, 0, 'en', 'plugins/analytics/analytics', 'settings.tracking_code', 'Tracking ID', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1748, 0, 'en', 'plugins/analytics/analytics', 'settings.tracking_code_placeholder', 'Example: GA-12586526-8', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1749, 0, 'en', 'plugins/analytics/analytics', 'settings.view_id', 'View ID', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1750, 0, 'en', 'plugins/analytics/analytics', 'settings.view_id_description', 'Google Analytics View ID', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1751, 0, 'en', 'plugins/analytics/analytics', 'settings.json_credential', 'Service Account Credentials', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1752, 0, 'en', 'plugins/analytics/analytics', 'settings.json_credential_description', 'Service Account Credentials', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1753, 0, 'en', 'plugins/analytics/analytics', 'widget_analytics_page', 'Top Most Visit Pages', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1754, 0, 'en', 'plugins/analytics/analytics', 'widget_analytics_browser', 'Top Browsers', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1755, 0, 'en', 'plugins/analytics/analytics', 'widget_analytics_referrer', 'Top Referrers', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1756, 0, 'en', 'plugins/analytics/analytics', 'widget_analytics_general', 'Site Analytics', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1757, 0, 'vi', 'plugins/analytics/analytics', 'avg_duration', 'Trung bình', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1758, 0, 'vi', 'plugins/analytics/analytics', 'bounce_rate', 'Tỉ lệ thoát', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1759, 0, 'vi', 'plugins/analytics/analytics', 'page_session', 'Trang/Phiên', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1760, 0, 'vi', 'plugins/analytics/analytics', 'pageviews', 'Lượt xem', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1761, 0, 'vi', 'plugins/analytics/analytics', 'sessions', 'Phiên', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1762, 0, 'vi', 'plugins/analytics/analytics', 'views', 'lượt xem', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1763, 0, 'vi', 'plugins/analytics/analytics', 'visitors', 'Người truy cập', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1764, 0, 'vi', 'plugins/analytics/analytics', 'visits', 'lượt ghé thăm', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1765, 0, 'vi', 'plugins/analytics/analytics', 'credential_is_not_valid', 'Thông tin cài đặt không hợp lệ. Tài liệu hướng dẫn tại đây: <a href=\"http://docs.botble.com/cms/:version/analytics\" target=\"_blank\">http://docs.botble.com/cms/:version/analytics</a>', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1766, 0, 'vi', 'plugins/analytics/analytics', 'new_users', 'Lượt khách mới', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1767, 0, 'vi', 'plugins/analytics/analytics', 'percent_new_session', 'Tỉ lệ khách mới', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1768, 0, 'vi', 'plugins/analytics/analytics', 'start_date_can_not_before_end_date', 'Ngày bắt đầu :start_date không thể sau ngày kết thúc :end_date', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1769, 0, 'vi', 'plugins/analytics/analytics', 'view_id_not_specified', 'Bạn phải cung cấp View ID hợp lê. Tài liệu hướng dẫn tại đây: <a href=\"http://docs.botble.com/cms/:version/analytics\" target=\"_blank\">http://docs.botble.com/cms/:version/analytics</a>', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1770, 0, 'vi', 'plugins/analytics/analytics', 'wrong_configuration', 'Để xem dữ liệu thống kê Google Analytics, bạn cần lấy thông tin Client ID và thêm nó vào trong phần cài đặt. Bạn cũng cần thông tin xác thực dạng JSON. Tài liệu hướng dẫn tại đây: <a href=\"http://docs.botble.com/cms/:version/analytics\" target=\"_blank\">http://docs.botble.com/cms/:version/analytics</a>', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1771, 0, 'vi', 'plugins/analytics/analytics', 'settings.title', 'Google Analytics', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1772, 0, 'vi', 'plugins/analytics/analytics', 'settings.description', 'Config Credentials for Google Analytics', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1773, 0, 'vi', 'plugins/analytics/analytics', 'settings.tracking_code', 'Tracking Code', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1774, 0, 'vi', 'plugins/analytics/analytics', 'settings.tracking_code_placeholder', 'Example: GA-12586526-8', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1775, 0, 'vi', 'plugins/analytics/analytics', 'settings.view_id', 'View ID', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1776, 0, 'vi', 'plugins/analytics/analytics', 'settings.view_id_description', 'Google Analytics View ID', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1777, 0, 'vi', 'plugins/analytics/analytics', 'settings.json_credential', 'Service Account Credentials', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1778, 0, 'vi', 'plugins/analytics/analytics', 'settings.json_credential_description', 'Service Account Credentials', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1779, 0, 'vi', 'plugins/analytics/analytics', 'widget_analytics_browser', 'Trình duyệt truy cập nhiều', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1780, 0, 'vi', 'plugins/analytics/analytics', 'widget_analytics_general', 'Thống kê truy cập', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1781, 0, 'vi', 'plugins/analytics/analytics', 'widget_analytics_page', 'Trang được xem nhiều nhất', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1782, 0, 'vi', 'plugins/analytics/analytics', 'widget_analytics_referrer', 'Trang giới thiệu nhiều', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1783, 0, 'en', 'plugins/audit-log/history', 'name', 'Activities Logs', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1784, 0, 'en', 'plugins/audit-log/history', 'created', 'created', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1785, 0, 'en', 'plugins/audit-log/history', 'updated', 'updated', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1786, 0, 'en', 'plugins/audit-log/history', 'deleted', 'deleted', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1787, 0, 'en', 'plugins/audit-log/history', 'logged in', 'logged in', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1788, 0, 'en', 'plugins/audit-log/history', 'logged out', 'logged out', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1789, 0, 'en', 'plugins/audit-log/history', 'changed password', 'changed password', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1790, 0, 'en', 'plugins/audit-log/history', 'updated profile', 'updated profile', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1791, 0, 'en', 'plugins/audit-log/history', 'attached', 'attached', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1792, 0, 'en', 'plugins/audit-log/history', 'shared', 'shared', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1793, 0, 'en', 'plugins/audit-log/history', 'to the system', 'to the system', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1794, 0, 'en', 'plugins/audit-log/history', 'of the system', 'of the system', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1795, 0, 'en', 'plugins/audit-log/history', 'menu', 'menu', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1796, 0, 'en', 'plugins/audit-log/history', 'post', 'post', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1797, 0, 'en', 'plugins/audit-log/history', 'page', 'page', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1798, 0, 'en', 'plugins/audit-log/history', 'category', 'category', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1799, 0, 'en', 'plugins/audit-log/history', 'tag', 'tag', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1800, 0, 'en', 'plugins/audit-log/history', 'user', 'user', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1801, 0, 'en', 'plugins/audit-log/history', 'contact', 'contact', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1802, 0, 'en', 'plugins/audit-log/history', 'backup', 'backup', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1803, 0, 'en', 'plugins/audit-log/history', 'custom-field', 'custom field', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1804, 0, 'en', 'plugins/audit-log/history', 'widget_audit_logs', 'Activities Logs', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1805, 0, 'en', 'plugins/audit-log/history', 'action', 'Action', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1806, 0, 'en', 'plugins/audit-log/history', 'user_agent', 'User Agent', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1807, 0, 'en', 'plugins/audit-log/history', 'system', 'System', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1808, 0, 'en', 'plugins/audit-log/history', 'delete_all', 'Delete all records', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1809, 0, 'vi', 'plugins/audit-log/history', 'name', 'Lịch sử hoạt động', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1810, 0, 'vi', 'plugins/audit-log/history', 'created', ' đã tạo', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1811, 0, 'vi', 'plugins/audit-log/history', 'updated', ' đã cập nhật', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1812, 0, 'vi', 'plugins/audit-log/history', 'deleted', ' đã xóa', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1813, 0, 'vi', 'plugins/audit-log/history', 'attached', 'đính kèm', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1814, 0, 'vi', 'plugins/audit-log/history', 'backup', 'sao lưu', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1815, 0, 'vi', 'plugins/audit-log/history', 'category', 'danh mục', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1816, 0, 'vi', 'plugins/audit-log/history', 'changed password', 'thay đổi mật khẩu', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1817, 0, 'vi', 'plugins/audit-log/history', 'contact', 'liên hệ', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1818, 0, 'vi', 'plugins/audit-log/history', 'custom-field', 'khung mở rộng', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1819, 0, 'vi', 'plugins/audit-log/history', 'logged in', 'đăng nhập', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1820, 0, 'vi', 'plugins/audit-log/history', 'logged out', 'đăng xuất', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1821, 0, 'vi', 'plugins/audit-log/history', 'menu', 'trình đơn', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1822, 0, 'vi', 'plugins/audit-log/history', 'of the system', 'khỏi hệ thống', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1823, 0, 'vi', 'plugins/audit-log/history', 'page', 'trang', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1824, 0, 'vi', 'plugins/audit-log/history', 'post', 'bài viết', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1825, 0, 'vi', 'plugins/audit-log/history', 'shared', 'đã chia sẻ', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1826, 0, 'vi', 'plugins/audit-log/history', 'tag', 'thẻ', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1827, 0, 'vi', 'plugins/audit-log/history', 'to the system', 'vào hệ thống', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1828, 0, 'vi', 'plugins/audit-log/history', 'updated profile', 'cập nhật tài khoản', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1829, 0, 'vi', 'plugins/audit-log/history', 'user', 'thành viên', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1830, 0, 'vi', 'plugins/audit-log/history', 'widget_audit_logs', 'Lịch sử hoạt động', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1831, 0, 'en', 'plugins/backup/backup', 'name', 'Backup', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1832, 0, 'en', 'plugins/backup/backup', 'backup_description', 'Backup database and uploads folder.', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1833, 0, 'en', 'plugins/backup/backup', 'create_backup_success', 'Created backup successfully!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1834, 0, 'en', 'plugins/backup/backup', 'delete_backup_success', 'Delete backup successfully!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1835, 0, 'en', 'plugins/backup/backup', 'restore_backup_success', 'Restore backup successfully!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1836, 0, 'en', 'plugins/backup/backup', 'generate_btn', 'Generate backup', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1837, 0, 'en', 'plugins/backup/backup', 'create', 'Create a backup', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1838, 0, 'en', 'plugins/backup/backup', 'restore', 'Restore a backup', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1839, 0, 'en', 'plugins/backup/backup', 'create_btn', 'Create', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1840, 0, 'en', 'plugins/backup/backup', 'restore_btn', 'Restore', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1841, 0, 'en', 'plugins/backup/backup', 'restore_confirm_msg', 'Do you really want to restore this revision?', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1842, 0, 'en', 'plugins/backup/backup', 'download_uploads_folder', 'Download backup of uploads folder', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1843, 0, 'en', 'plugins/backup/backup', 'download_database', 'Download backup of database', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1844, 0, 'en', 'plugins/backup/backup', 'restore_tooltip', 'Restore this backup', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1845, 0, 'en', 'plugins/backup/backup', 'demo_alert', 'Hi guest, if you see demo site is destroyed, please help me <a href=\":link\">go here</a> and restore demo site to the latest revision! Thank you so much!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1846, 0, 'en', 'plugins/backup/backup', 'menu_name', 'Backups', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1847, 0, 'en', 'plugins/backup/backup', 'size', 'Size', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1848, 0, 'en', 'plugins/backup/backup', 'no_backups', 'There is no backup now!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1849, 0, 'en', 'plugins/backup/backup', 'proc_open_disabled_error', 'Function <strong>proc_open()</strong> has been disabled so the system cannot backup the database. Please contact your hosting provider to enable it.', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1850, 0, 'en', 'plugins/backup/backup', 'database_backup_not_existed', 'Backup database is not existed!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1851, 0, 'en', 'plugins/backup/backup', 'uploads_folder_backup_not_existed', 'Backup uploads folder is not existed!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1852, 0, 'en', 'plugins/backup/backup', 'important_message1', 'This is a simple backup feature, it is a solution for you if your site has < 1GB data and can be used for quickly backup your site.', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1853, 0, 'en', 'plugins/backup/backup', 'important_message2', 'If you have more than 1GB images/files in local storage, you should use backup feature of your hosting or VPS.', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1854, 0, 'en', 'plugins/backup/backup', 'important_message3', 'To backup your database, function <strong>proc_open()</strong> or <strong>system()</strong> must be enabled. Contact your hosting provider to enable it if it is disabled.', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1855, 0, 'vi', 'plugins/backup/backup', 'backup_description', 'Sao lưu cơ sở dữ liệu và thư mục /uploads', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1856, 0, 'vi', 'plugins/backup/backup', 'create', 'Tạo bản sao lưu', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1857, 0, 'vi', 'plugins/backup/backup', 'create_backup_success', 'Tạo bản sao lưu thành công!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1858, 0, 'vi', 'plugins/backup/backup', 'create_btn', 'Tạo', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1859, 0, 'vi', 'plugins/backup/backup', 'delete_backup_success', 'Xóa bản sao lưu thành công!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1860, 0, 'vi', 'plugins/backup/backup', 'generate_btn', 'Tạo sao lưu', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1861, 0, 'vi', 'plugins/backup/backup', 'name', 'Sao lưu', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1862, 0, 'vi', 'plugins/backup/backup', 'restore', 'Khôi phục bản sao lưu', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1863, 0, 'vi', 'plugins/backup/backup', 'restore_backup_success', 'Khôi phục bản sao lưu thành công', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1864, 0, 'vi', 'plugins/backup/backup', 'restore_btn', 'Khôi phục', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1865, 0, 'vi', 'plugins/backup/backup', 'restore_confirm_msg', 'Bạn có chắc chắn muốn khôi phục hệ thống về thời điểm tạo bản sao lưu này?', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1866, 0, 'vi', 'plugins/backup/backup', 'restore_tooltip', 'Khôi phục bản sao lưu này', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1867, 0, 'vi', 'plugins/backup/backup', 'download_database', 'Tải về bản sao lưu CSDL', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1868, 0, 'vi', 'plugins/backup/backup', 'download_uploads_folder', 'Tải về bản sao lưu thư mục uploads', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1869, 0, 'vi', 'plugins/backup/backup', 'menu_name', 'Sao lưu', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1870, 0, 'vi', 'plugins/backup/backup', 'demo_alert', 'Chào khách, nếu bạn thấy trang demo bị phá hoại, hãy tới <a href=\":link\">trang sao lưu</a> và khôi phục bản sao lưu cuối cùng. Cảm ơn bạn nhiều!', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1871, 0, 'en', 'plugins/blog/base', 'menu_name', 'Blog', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1872, 0, 'en', 'plugins/blog/base', 'blog_page', 'Blog Page', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1873, 0, 'en', 'plugins/blog/base', 'select', '-- Select --', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1874, 0, 'en', 'plugins/blog/base', 'blog_page_id', 'Blog page', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1875, 0, 'en', 'plugins/blog/base', 'number_posts_per_page', 'Number posts per page', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1876, 0, 'en', 'plugins/blog/base', 'write_some_tags', 'Write some tags', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1877, 0, 'en', 'plugins/blog/base', 'short_code_name', 'Blog posts', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1878, 0, 'en', 'plugins/blog/base', 'short_code_description', 'Add blog posts', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1879, 0, 'en', 'plugins/blog/base', 'number_posts_per_page_in_category', 'Number of posts per page in a category', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1880, 0, 'en', 'plugins/blog/base', 'number_posts_per_page_in_tag', 'Number of posts per page in a tag', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1881, 0, 'en', 'plugins/blog/categories', 'create', 'Create new category', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1882, 0, 'en', 'plugins/blog/categories', 'edit', 'Edit category', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1883, 0, 'en', 'plugins/blog/categories', 'menu', 'Categories', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1884, 0, 'en', 'plugins/blog/categories', 'edit_this_category', 'Edit this category', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1885, 0, 'en', 'plugins/blog/categories', 'menu_name', 'Categories', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1886, 0, 'en', 'plugins/blog/categories', 'none', 'None', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1887, 0, 'en', 'plugins/blog/categories', 'total_posts', 'Total posts: :total', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1888, 0, 'en', 'plugins/blog/member', 'dob', 'Born :date', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1889, 0, 'en', 'plugins/blog/member', 'draft_posts', 'Draft Posts', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1890, 0, 'en', 'plugins/blog/member', 'pending_posts', 'Pending Posts', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1891, 0, 'en', 'plugins/blog/member', 'published_posts', 'Published Posts', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1892, 0, 'en', 'plugins/blog/member', 'posts', 'Posts', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1893, 0, 'en', 'plugins/blog/member', 'write_post', 'Write a post', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1894, 0, 'en', 'plugins/blog/posts', 'create', 'Create new post', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1895, 0, 'en', 'plugins/blog/posts', 'edit', 'Edit post', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1896, 0, 'en', 'plugins/blog/posts', 'form.name', 'Name', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1897, 0, 'en', 'plugins/blog/posts', 'form.name_placeholder', 'Post\'s name (Maximum :c characters)', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1898, 0, 'en', 'plugins/blog/posts', 'form.description', 'Description', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1899, 0, 'en', 'plugins/blog/posts', 'form.description_placeholder', 'Short description for post (Maximum :c characters)', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1900, 0, 'en', 'plugins/blog/posts', 'form.categories', 'Categories', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1901, 0, 'en', 'plugins/blog/posts', 'form.tags', 'Tags', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1902, 0, 'en', 'plugins/blog/posts', 'form.tags_placeholder', 'Tags', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1903, 0, 'en', 'plugins/blog/posts', 'form.content', 'Content', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1904, 0, 'en', 'plugins/blog/posts', 'form.is_featured', 'Is featured?', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1905, 0, 'en', 'plugins/blog/posts', 'form.note', 'Note content', '2021-08-18 04:43:45', '2021-08-18 04:44:12'),
(1906, 0, 'en', 'plugins/blog/posts', 'form.format_type', 'Format', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1907, 0, 'en', 'plugins/blog/posts', 'cannot_delete', 'Post could not be deleted', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1908, 0, 'en', 'plugins/blog/posts', 'post_deleted', 'Post deleted', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1909, 0, 'en', 'plugins/blog/posts', 'posts', 'Posts', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1910, 0, 'en', 'plugins/blog/posts', 'post', 'Post', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1911, 0, 'en', 'plugins/blog/posts', 'edit_this_post', 'Edit this post', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1912, 0, 'en', 'plugins/blog/posts', 'no_new_post_now', 'There is no new post now!', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1913, 0, 'en', 'plugins/blog/posts', 'menu_name', 'Posts', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1914, 0, 'en', 'plugins/blog/posts', 'widget_posts_recent', 'Recent Posts', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1915, 0, 'en', 'plugins/blog/posts', 'categories', 'Categories', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1916, 0, 'en', 'plugins/blog/posts', 'category', 'Category', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1917, 0, 'en', 'plugins/blog/posts', 'author', 'Author', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1918, 0, 'en', 'plugins/blog/settings', 'select', '-- Select --', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1919, 0, 'en', 'plugins/blog/settings', 'blog_page_id', 'Blog page', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1920, 0, 'en', 'plugins/blog/tags', 'form.name', 'Name', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1921, 0, 'en', 'plugins/blog/tags', 'form.name_placeholder', 'Tag\'s name (Maximum 120 characters)', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1922, 0, 'en', 'plugins/blog/tags', 'form.description', 'Description', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1923, 0, 'en', 'plugins/blog/tags', 'form.description_placeholder', 'Short description for tag (Maximum 400 characters)', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1924, 0, 'en', 'plugins/blog/tags', 'form.categories', 'Categories', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1925, 0, 'en', 'plugins/blog/tags', 'notices.no_select', 'Please select at least one tag to take this action!', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1926, 0, 'en', 'plugins/blog/tags', 'create', 'Create new tag', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1927, 0, 'en', 'plugins/blog/tags', 'edit', 'Edit tag', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1928, 0, 'en', 'plugins/blog/tags', 'cannot_delete', 'Tag could not be deleted', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1929, 0, 'en', 'plugins/blog/tags', 'deleted', 'Tag deleted', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1930, 0, 'en', 'plugins/blog/tags', 'menu', 'Tags', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1931, 0, 'en', 'plugins/blog/tags', 'edit_this_tag', 'Edit this tag', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1932, 0, 'en', 'plugins/blog/tags', 'menu_name', 'Tags', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1933, 0, 'vi', 'plugins/blog/base', 'menu_name', 'Blog', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1934, 0, 'vi', 'plugins/blog/categories', 'create', 'Thêm danh mục mới', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1935, 0, 'vi', 'plugins/blog/categories', 'edit', 'Sửa danh mục', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1936, 0, 'vi', 'plugins/blog/categories', 'menu_name', 'Danh mục', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1937, 0, 'vi', 'plugins/blog/categories', 'edit_this_category', 'Sửa danh mục này', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1938, 0, 'vi', 'plugins/blog/categories', 'menu', 'Danh mục', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1939, 0, 'vi', 'plugins/blog/posts', 'create', 'Thêm bài viết', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1940, 0, 'vi', 'plugins/blog/posts', 'edit', 'Sửa bài viết', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1941, 0, 'vi', 'plugins/blog/posts', 'form.name', 'Tên', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1942, 0, 'vi', 'plugins/blog/posts', 'form.name_placeholder', 'Tên bài viết (Tối đa 120 kí tự)', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1943, 0, 'vi', 'plugins/blog/posts', 'form.description', 'Mô tả', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1944, 0, 'vi', 'plugins/blog/posts', 'form.description_placeholder', 'Mô tả ngắn cho bài viết (Tối đa 400 kí tự)', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1945, 0, 'vi', 'plugins/blog/posts', 'form.categories', 'Chuyên mục', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1946, 0, 'vi', 'plugins/blog/posts', 'form.tags', 'Từ khóa', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1947, 0, 'vi', 'plugins/blog/posts', 'form.tags_placeholder', 'Thêm từ khóa', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1948, 0, 'vi', 'plugins/blog/posts', 'form.content', 'Nội dung', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1949, 0, 'vi', 'plugins/blog/posts', 'form.note', 'Nội dung ghi chú', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1950, 0, 'vi', 'plugins/blog/posts', 'form.format_type', 'Định dạng', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1951, 0, 'vi', 'plugins/blog/posts', 'post_deleted', 'Xóa bài viết thành công', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1952, 0, 'vi', 'plugins/blog/posts', 'cannot_delete', 'Không thể xóa bài viết', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1953, 0, 'vi', 'plugins/blog/posts', 'menu_name', 'Bài viết', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1954, 0, 'vi', 'plugins/blog/posts', 'edit_this_post', 'Sửa bài viết này', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1955, 0, 'vi', 'plugins/blog/posts', 'no_new_post_now', 'Hiện tại không có bài viết mới!', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1956, 0, 'vi', 'plugins/blog/posts', 'posts', 'Bài viết', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1957, 0, 'vi', 'plugins/blog/posts', 'widget_posts_recent', 'Bài viết gần đây', '2021-08-18 04:43:46', '2021-08-18 04:44:12');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1958, 0, 'vi', 'plugins/blog/posts', 'author', 'Tác giả', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1959, 0, 'vi', 'plugins/blog/tags', 'create', 'Thêm thẻ mới', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1960, 0, 'vi', 'plugins/blog/tags', 'edit', 'Sửa thẻ', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1961, 0, 'vi', 'plugins/blog/tags', 'form.name', 'Tên', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1962, 0, 'vi', 'plugins/blog/tags', 'form.name_placeholder', 'Tên thẻ (Tối đa 120 kí tự)', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1963, 0, 'vi', 'plugins/blog/tags', 'form.description', 'Mô tả', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1964, 0, 'vi', 'plugins/blog/tags', 'form.description_placeholder', 'Mô tả ngắn cho tag (Tối đa 400 kí tự)', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1965, 0, 'vi', 'plugins/blog/tags', 'form.categories', 'Chuyên mục', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1966, 0, 'vi', 'plugins/blog/tags', 'notices.no_select', 'Chọn ít nhất 1 bài viết để thực hiện hành động này!', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1967, 0, 'vi', 'plugins/blog/tags', 'cannot_delete', 'Không thể xóa thẻ', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1968, 0, 'vi', 'plugins/blog/tags', 'deleted', 'Xóa thẻ thành công', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1969, 0, 'vi', 'plugins/blog/tags', 'menu_name', 'Thẻ', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1970, 0, 'vi', 'plugins/blog/tags', 'edit_this_tag', 'Sửa thẻ này', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1971, 0, 'vi', 'plugins/blog/tags', 'menu', 'Thẻ', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1972, 0, 'en', 'plugins/captcha/captcha', 'settings.title', 'Captcha', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1973, 0, 'en', 'plugins/captcha/captcha', 'settings.description', 'Settings for Google Captcha', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1974, 0, 'en', 'plugins/captcha/captcha', 'settings.captcha_site_key', 'Captcha Site Key', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1975, 0, 'en', 'plugins/captcha/captcha', 'settings.captcha_secret', 'Captcha Secret', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1976, 0, 'en', 'plugins/captcha/captcha', 'settings.enable_captcha', 'Enable Captcha?', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1977, 0, 'en', 'plugins/captcha/captcha', 'settings.helper', 'Go here to get credentials https://www.google.com/recaptcha/admin#list.', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1978, 0, 'en', 'plugins/captcha/captcha', 'settings.hide_badge', 'Hide recaptcha badge (for v3)', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1979, 0, 'en', 'plugins/captcha/captcha', 'settings.type', 'Type', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1980, 0, 'en', 'plugins/captcha/captcha', 'settings.v2_description', 'V2 (Verify requests with a challenge)', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1981, 0, 'en', 'plugins/captcha/captcha', 'settings.v3_description', 'V3 (Verify requests with a score)', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1982, 0, 'en', 'plugins/captcha/captcha', 'failed_validate', 'Failed to validate the captcha.', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1983, 0, 'en', 'plugins/contact/contact', 'menu', 'Contact', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1984, 0, 'en', 'plugins/contact/contact', 'edit', 'View contact', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1985, 0, 'en', 'plugins/contact/contact', 'tables.phone', 'Phone', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1986, 0, 'en', 'plugins/contact/contact', 'tables.email', 'Email', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1987, 0, 'en', 'plugins/contact/contact', 'tables.full_name', 'Full Name', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1988, 0, 'en', 'plugins/contact/contact', 'tables.time', 'Time', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1989, 0, 'en', 'plugins/contact/contact', 'tables.address', 'Address', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1990, 0, 'en', 'plugins/contact/contact', 'tables.subject', 'Subject', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1991, 0, 'en', 'plugins/contact/contact', 'tables.content', 'Content', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1992, 0, 'en', 'plugins/contact/contact', 'contact_information', 'Contact information', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1993, 0, 'en', 'plugins/contact/contact', 'replies', 'Replies', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1994, 0, 'en', 'plugins/contact/contact', 'email.header', 'Email', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1995, 0, 'en', 'plugins/contact/contact', 'email.title', 'New contact from your site', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1996, 0, 'en', 'plugins/contact/contact', 'form.name.required', 'Name is required', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1997, 0, 'en', 'plugins/contact/contact', 'form.email.required', 'Email is required', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1998, 0, 'en', 'plugins/contact/contact', 'form.email.email', 'The email address is not valid', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(1999, 0, 'en', 'plugins/contact/contact', 'form.content.required', 'Content is required', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2000, 0, 'en', 'plugins/contact/contact', 'contact_sent_from', 'This contact information sent from', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2001, 0, 'en', 'plugins/contact/contact', 'sender', 'Sender', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2002, 0, 'en', 'plugins/contact/contact', 'sender_email', 'Email', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2003, 0, 'en', 'plugins/contact/contact', 'sender_address', 'Address', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2004, 0, 'en', 'plugins/contact/contact', 'sender_phone', 'Phone', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2005, 0, 'en', 'plugins/contact/contact', 'message_content', 'Message content', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2006, 0, 'en', 'plugins/contact/contact', 'sent_from', 'Email sent from', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2007, 0, 'en', 'plugins/contact/contact', 'form_name', 'Name', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2008, 0, 'en', 'plugins/contact/contact', 'form_email', 'Email', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2009, 0, 'en', 'plugins/contact/contact', 'form_address', 'Address', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2010, 0, 'en', 'plugins/contact/contact', 'form_subject', 'Subject', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2011, 0, 'en', 'plugins/contact/contact', 'form_phone', 'Phone', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2012, 0, 'en', 'plugins/contact/contact', 'form_message', 'Message', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2013, 0, 'en', 'plugins/contact/contact', 'required_field', 'The field with (<span style=\"color: red\">*</span>) is required.', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2014, 0, 'en', 'plugins/contact/contact', 'send_btn', 'Send message', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2015, 0, 'en', 'plugins/contact/contact', 'new_msg_notice', 'You have <span class=\"bold\">:count</span> New Messages', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2016, 0, 'en', 'plugins/contact/contact', 'view_all', 'View all', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2017, 0, 'en', 'plugins/contact/contact', 'statuses.read', 'Read', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2018, 0, 'en', 'plugins/contact/contact', 'statuses.unread', 'Unread', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2019, 0, 'en', 'plugins/contact/contact', 'phone', 'Phone', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2020, 0, 'en', 'plugins/contact/contact', 'address', 'Address', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2021, 0, 'en', 'plugins/contact/contact', 'message', 'Message', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2022, 0, 'en', 'plugins/contact/contact', 'settings.email.title', 'Contact', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2023, 0, 'en', 'plugins/contact/contact', 'settings.email.description', 'Contact email configuration', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2024, 0, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_title', 'Send notice to administrator', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2025, 0, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_description', 'Email template to send notice to administrator when system get new contact', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2026, 0, 'en', 'plugins/contact/contact', 'no_reply', 'No reply yet!', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2027, 0, 'en', 'plugins/contact/contact', 'reply', 'Reply', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2028, 0, 'en', 'plugins/contact/contact', 'send', 'Send', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2029, 0, 'en', 'plugins/contact/contact', 'shortcode_name', 'Contact form', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2030, 0, 'en', 'plugins/contact/contact', 'shortcode_description', 'Add a contact form', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2031, 0, 'en', 'plugins/contact/contact', 'shortcode_content_description', 'Add shortcode [contact-form][/contact-form] to editor?', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2032, 0, 'en', 'plugins/contact/contact', 'message_sent_success', 'Message sent successfully!', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2033, 0, 'vi', 'plugins/contact/contact', 'menu', 'Liên hệ', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2034, 0, 'vi', 'plugins/contact/contact', 'edit', 'Xem liên hệ', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2035, 0, 'vi', 'plugins/contact/contact', 'tables.phone', 'Điện thoại', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2036, 0, 'vi', 'plugins/contact/contact', 'tables.email', 'Email', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2037, 0, 'vi', 'plugins/contact/contact', 'tables.full_name', 'Họ tên', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2038, 0, 'vi', 'plugins/contact/contact', 'tables.time', 'Thời gian', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2039, 0, 'vi', 'plugins/contact/contact', 'tables.address', 'Địa địa chỉ', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2040, 0, 'vi', 'plugins/contact/contact', 'tables.subject', 'Tiêu đề', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2041, 0, 'vi', 'plugins/contact/contact', 'tables.content', 'Nội dung', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2042, 0, 'vi', 'plugins/contact/contact', 'contact_information', 'Thông tin liên hệ', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2043, 0, 'vi', 'plugins/contact/contact', 'email.title', 'Thông tin liên hệ mới', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2044, 0, 'vi', 'plugins/contact/contact', 'email.header', 'Email', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2045, 0, 'vi', 'plugins/contact/contact', 'contact_sent_from', 'Liên hệ này được gửi từ', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2046, 0, 'vi', 'plugins/contact/contact', 'form_address', 'Địa chỉ', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2047, 0, 'vi', 'plugins/contact/contact', 'form_email', 'Thư điện tử', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2048, 0, 'vi', 'plugins/contact/contact', 'form_message', 'Thông điệp', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2049, 0, 'vi', 'plugins/contact/contact', 'form_name', 'Họ tên', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2050, 0, 'vi', 'plugins/contact/contact', 'form_phone', 'Số điện thoại', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2051, 0, 'vi', 'plugins/contact/contact', 'message_content', 'Nội dung thông điệp', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2052, 0, 'vi', 'plugins/contact/contact', 'required_field', 'Những trường có dấu (<span style=\"color: red\">*</span>) là bắt buộc.', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2053, 0, 'vi', 'plugins/contact/contact', 'send_btn', 'Gửi tin nhắn', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2054, 0, 'vi', 'plugins/contact/contact', 'sender', 'Người gửi', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2055, 0, 'vi', 'plugins/contact/contact', 'sender_address', 'Địa chỉ', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2056, 0, 'vi', 'plugins/contact/contact', 'sender_email', 'Thư điện tử', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2057, 0, 'vi', 'plugins/contact/contact', 'sender_phone', 'Số điện thoại', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2058, 0, 'vi', 'plugins/contact/contact', 'sent_from', 'Thư được gửi từ', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2059, 0, 'vi', 'plugins/contact/contact', 'address', 'Địa chỉ', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2060, 0, 'vi', 'plugins/contact/contact', 'message', 'Liên hệ', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2061, 0, 'vi', 'plugins/contact/contact', 'new_msg_notice', 'Bạn có <span class=\"bold\">:count</span> tin nhắn mới', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2062, 0, 'vi', 'plugins/contact/contact', 'phone', 'Điện thoại', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2063, 0, 'vi', 'plugins/contact/contact', 'statuses.read', 'Đã đọc', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2064, 0, 'vi', 'plugins/contact/contact', 'statuses.unread', 'Chưa đọc', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2065, 0, 'vi', 'plugins/contact/contact', 'view_all', 'Xem tất cả', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2066, 0, 'vi', 'plugins/contact/contact', 'settings.email.title', 'Liên hệ', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2067, 0, 'vi', 'plugins/contact/contact', 'settings.email.description', 'Cấu hình thông tin cho mục liên hệ', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2068, 0, 'vi', 'plugins/contact/contact', 'settings.email.templates.notice_title', 'Thông báo tới admin', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2069, 0, 'vi', 'plugins/contact/contact', 'settings.email.templates.notice_description', 'Mẫu nội dung email gửi tới admin khi có liên hệ mới', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2070, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.name', 'Cookie Consent', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2071, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.description', 'Cookie consent settings', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2072, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.enable', 'Enable cookie consent?', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2073, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.message', 'Message', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2074, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.button_text', 'Button text', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2075, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.max_width', 'Max width (px)', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2076, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.background_color', 'Background color', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2077, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.text_color', 'Text color', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2078, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.learn_more_url', 'Learn more URL', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2079, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.learn_more_text', 'Learn more text', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2080, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'message', 'Your experience on this site will be improved by allowing cookies.', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2081, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'button_text', 'Allow cookies', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2082, 0, 'en', 'plugins/ecommerce/brands', 'name', 'Brands', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2083, 0, 'en', 'plugins/ecommerce/brands', 'create', 'New brand', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2084, 0, 'en', 'plugins/ecommerce/brands', 'edit', 'Edit brand', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2085, 0, 'en', 'plugins/ecommerce/brands', 'form.name', 'Name', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2086, 0, 'en', 'plugins/ecommerce/brands', 'form.name_placeholder', 'Brand\'s name (Maximum 255 characters)', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2087, 0, 'en', 'plugins/ecommerce/brands', 'form.description', 'Description', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2088, 0, 'en', 'plugins/ecommerce/brands', 'form.description_placeholder', 'Short description for brand (Maximum 400 characters)', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2089, 0, 'en', 'plugins/ecommerce/brands', 'form.website', 'Website', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2090, 0, 'en', 'plugins/ecommerce/brands', 'form.logo', 'Logo', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2091, 0, 'en', 'plugins/ecommerce/brands', 'form.is_featured', 'Is featured', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2092, 0, 'en', 'plugins/ecommerce/brands', 'logo', 'Logo', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2093, 0, 'en', 'plugins/ecommerce/brands', 'website', 'Website', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2094, 0, 'en', 'plugins/ecommerce/brands', 'notices.no_select', 'Please select at least one record to take this action!', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2095, 0, 'en', 'plugins/ecommerce/brands', 'notices.update_success_message', 'Update successfully', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2096, 0, 'en', 'plugins/ecommerce/brands', 'cannot_delete', 'Brand could not be deleted', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2097, 0, 'en', 'plugins/ecommerce/brands', 'brand_deleted', 'Brand deleted', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2098, 0, 'en', 'plugins/ecommerce/brands', 'menu', 'Brands', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2099, 0, 'en', 'plugins/ecommerce/brands', 'no_brand', 'No brand', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2100, 0, 'en', 'plugins/ecommerce/brands', 'intro.title', 'Manage brands', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2101, 0, 'en', 'plugins/ecommerce/brands', 'intro.description', 'Manage product brands such as Nike, Adidas, Bitis ...', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2102, 0, 'en', 'plugins/ecommerce/brands', 'intro.button_text', 'Create brand', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2103, 0, 'en', 'plugins/ecommerce/bulk-import', 'name', 'Bulk Import', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2104, 0, 'en', 'plugins/ecommerce/bulk-import', 'loading_text', 'Importing', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2105, 0, 'en', 'plugins/ecommerce/bulk-import', 'imported_successfully', 'Imported successfully.', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2106, 0, 'en', 'plugins/ecommerce/bulk-import', 'please_choose_the_file_mime', 'Please choose the file mime :types', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2107, 0, 'en', 'plugins/ecommerce/bulk-import', 'please_choose_the_file', 'Please choose the file', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2108, 0, 'en', 'plugins/ecommerce/bulk-import', 'start_import', 'Start Import', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2109, 0, 'en', 'plugins/ecommerce/bulk-import', 'note', 'Note!', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2110, 0, 'en', 'plugins/ecommerce/bulk-import', 'warning_before_importing', 'If this is your first time using this feature, please read the documentation or contact the Administrator for access to the correct functionality!', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2111, 0, 'en', 'plugins/ecommerce/bulk-import', 'results', 'Result: :success successes, :failed failures', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2112, 0, 'en', 'plugins/ecommerce/bulk-import', 'failures', 'Failures', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2113, 0, 'en', 'plugins/ecommerce/bulk-import', 'tables.import', 'Import', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2114, 0, 'en', 'plugins/ecommerce/bulk-import', 'template', 'Template', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2115, 0, 'en', 'plugins/ecommerce/bulk-import', 'rules', 'Rules', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2116, 0, 'en', 'plugins/ecommerce/bulk-import', 'choose_file_with_mime', 'Choose file with mime: (:types)', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2117, 0, 'en', 'plugins/ecommerce/bulk-import', 'choose_file', 'Choose file', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2118, 0, 'en', 'plugins/ecommerce/bulk-import', 'menu', 'Import products', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2119, 0, 'en', 'plugins/ecommerce/bulk-import', 'download-csv-file', 'Download CSV template', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2120, 0, 'en', 'plugins/ecommerce/bulk-import', 'download-excel-file', 'Download Excel template', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2121, 0, 'en', 'plugins/ecommerce/bulk-import', 'downloading', 'Downloading...', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2122, 0, 'en', 'plugins/ecommerce/bulk-import', 'export.template.input_error', 'Input error', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2123, 0, 'en', 'plugins/ecommerce/bulk-import', 'export.template.number_not_allowed', 'Number is not allowed!', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2124, 0, 'en', 'plugins/ecommerce/bulk-import', 'export.template.allowed_input', 'Allowed input', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2125, 0, 'en', 'plugins/ecommerce/bulk-import', 'export.template.prompt_decimal', 'Only numbers or decimals are accepted and greater than or equal to :min.', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2126, 0, 'en', 'plugins/ecommerce/bulk-import', 'export.template.prompt_whole_number', 'Only numbers are accepted and greater than or equal to :min.', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2127, 0, 'en', 'plugins/ecommerce/bulk-import', 'export.template.prompt_list', 'Please pick a value from the drop-down list.', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2128, 0, 'en', 'plugins/ecommerce/bulk-import', 'export.template.pick_from_list', 'Pick from list', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2129, 0, 'en', 'plugins/ecommerce/bulk-import', 'export.template.value_not_in_list', 'Value is not in list.', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2130, 0, 'en', 'plugins/ecommerce/currency', 'currencies', 'Currencies', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2131, 0, 'en', 'plugins/ecommerce/currency', 'setting_description', 'List of currencies using on website', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2132, 0, 'en', 'plugins/ecommerce/currency', 'name', 'Name', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2133, 0, 'en', 'plugins/ecommerce/currency', 'symbol', 'Symbol', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2134, 0, 'en', 'plugins/ecommerce/currency', 'number_of_decimals', 'Number of decimals', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2135, 0, 'en', 'plugins/ecommerce/currency', 'exchange_rate', 'Exchange rate', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2136, 0, 'en', 'plugins/ecommerce/currency', 'is_prefix_symbol', 'Position of symbol', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2137, 0, 'en', 'plugins/ecommerce/currency', 'is_default', 'Is default?', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2138, 0, 'en', 'plugins/ecommerce/currency', 'remove', 'Remove', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2139, 0, 'en', 'plugins/ecommerce/currency', 'new_currency', 'Add a new currency', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2140, 0, 'en', 'plugins/ecommerce/currency', 'save_settings', 'Save settings', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2141, 0, 'en', 'plugins/ecommerce/currency', 'before_number', 'Before number', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2142, 0, 'en', 'plugins/ecommerce/currency', 'after_number', 'After number', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2143, 0, 'en', 'plugins/ecommerce/currency', 'require_at_least_one_currency', 'The system requires at least one currency!', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2144, 0, 'en', 'plugins/ecommerce/customer', 'name', 'Customers', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2145, 0, 'en', 'plugins/ecommerce/customer', 'create', 'Create a customer', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2146, 0, 'en', 'plugins/ecommerce/customer', 'edit', 'Edit customer \":name\"', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2147, 0, 'en', 'plugins/ecommerce/customer', 'email', 'Email', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2148, 0, 'en', 'plugins/ecommerce/customer', 'email_placeholder', 'Ex: example@gmail.com', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2149, 0, 'en', 'plugins/ecommerce/customer', 'password', 'Password', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2150, 0, 'en', 'plugins/ecommerce/customer', 'change_password', 'Change password?', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2151, 0, 'en', 'plugins/ecommerce/customer', 'password_confirmation', 'Password confirmation', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2152, 0, 'en', 'plugins/ecommerce/customer', 'intro.title', 'Manage customers', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2153, 0, 'en', 'plugins/ecommerce/customer', 'intro.description', 'When a customer buy your product(s), you will know their order histories.', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2154, 0, 'en', 'plugins/ecommerce/customer', 'intro.button_text', 'Create customer', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2155, 0, 'en', 'plugins/ecommerce/discount', 'name', 'Discounts', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2156, 0, 'en', 'plugins/ecommerce/discount', 'create', 'Create discount', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2157, 0, 'en', 'plugins/ecommerce/discount', 'invalid_coupon', 'This coupon is invalid or expired!', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2158, 0, 'en', 'plugins/ecommerce/discount', 'cannot_use_same_time_with_other_discount_program', 'Cannot use this coupon in the same time with other discount program!', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2159, 0, 'en', 'plugins/ecommerce/discount', 'not_used', 'This coupon is not used yet!', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2160, 0, 'en', 'plugins/ecommerce/discount', 'detail', 'Detail', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2161, 0, 'en', 'plugins/ecommerce/discount', 'used', 'Used', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2162, 0, 'en', 'plugins/ecommerce/discount', 'intro.title', 'Manage discount/coupon code', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2163, 0, 'en', 'plugins/ecommerce/discount', 'intro.description', 'Create coupon code or promotion for your products.', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2164, 0, 'en', 'plugins/ecommerce/discount', 'intro.button_text', 'Create discount', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2165, 0, 'en', 'plugins/ecommerce/discount', 'expired', 'Expired', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2166, 0, 'en', 'plugins/ecommerce/discount', 'discount_promotion', 'Discount promotion', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2167, 0, 'en', 'plugins/ecommerce/discount', 'can', 'can', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2168, 0, 'en', 'plugins/ecommerce/discount', 'cannot', 'cannot', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2169, 0, 'en', 'plugins/ecommerce/discount', 'use_with_promotion', 'be used with promotion', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2170, 0, 'en', 'plugins/ecommerce/discount', 'create_discount_validate_title_required_if', 'Please enter the name of the promotion', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2171, 0, 'en', 'plugins/ecommerce/discount', 'create_discount_validate_code_required_if', 'Please enter the promotion code', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2172, 0, 'en', 'plugins/ecommerce/discount', 'create_discount_validate_value_required', 'Amount must be greater than 0', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2173, 0, 'en', 'plugins/ecommerce/discount', 'create_discount_validate_target_required', 'No object selected for promotion', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2174, 0, 'en', 'plugins/ecommerce/discount', 'enums.type-options.amount', 'Amount - Fixed', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2175, 0, 'en', 'plugins/ecommerce/discount', 'enums.type-options.percentage', 'Discount %', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2176, 0, 'en', 'plugins/ecommerce/discount', 'enums.type-options.shipping', 'Free shipping', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2177, 0, 'en', 'plugins/ecommerce/discount', 'enums.type-options.same-price', 'Same price', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2178, 0, 'en', 'plugins/ecommerce/discount', 'discount', 'Discount', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2179, 0, 'en', 'plugins/ecommerce/discount', 'create_coupon_code', 'Create coupon code', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2180, 0, 'en', 'plugins/ecommerce/discount', 'create_discount_promotion', 'Create discount promotion', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2181, 0, 'en', 'plugins/ecommerce/discount', 'generate_coupon_code', 'Generate coupon code', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2182, 0, 'en', 'plugins/ecommerce/discount', 'customers_will_enter_this_coupon_code_when_they_checkout', 'Customers will enter this coupon code when they checkout', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2183, 0, 'en', 'plugins/ecommerce/discount', 'select_type_of_discount', 'Select type of discount', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2184, 0, 'en', 'plugins/ecommerce/discount', 'coupon_code', 'Coupon code', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2185, 0, 'en', 'plugins/ecommerce/discount', 'promotion', 'Promotion', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2186, 0, 'en', 'plugins/ecommerce/discount', 'can_be_used_with_promotion', 'Can be used with promotion', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2187, 0, 'en', 'plugins/ecommerce/discount', 'unlimited_coupon', 'Unlimited coupon', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2188, 0, 'en', 'plugins/ecommerce/discount', 'enter_number', 'Enter number', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2189, 0, 'en', 'plugins/ecommerce/discount', 'coupon_type', 'Coupon type', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2190, 0, 'en', 'plugins/ecommerce/discount', 'percentage_discount', 'Percentage discount (%)', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2191, 0, 'en', 'plugins/ecommerce/discount', 'free_shipping', 'Free shipping', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2192, 0, 'en', 'plugins/ecommerce/discount', 'same_price', 'Same price', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2193, 0, 'en', 'plugins/ecommerce/discount', 'apply_for', 'apply for', '2021-08-18 04:43:46', '2021-08-18 04:44:12'),
(2194, 0, 'en', 'plugins/ecommerce/discount', 'all_orders', 'All orders', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2195, 0, 'en', 'plugins/ecommerce/discount', 'order_amount_from', 'Order amount from', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2196, 0, 'en', 'plugins/ecommerce/discount', 'product_collection', 'Product collection', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2197, 0, 'en', 'plugins/ecommerce/discount', 'product', 'Product', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2198, 0, 'en', 'plugins/ecommerce/discount', 'customer', 'Customer', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2199, 0, 'en', 'plugins/ecommerce/discount', 'variant', 'Variant', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2200, 0, 'en', 'plugins/ecommerce/discount', 'search_product', 'Search product', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2201, 0, 'en', 'plugins/ecommerce/discount', 'no_products_found', 'No products found!', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2202, 0, 'en', 'plugins/ecommerce/discount', 'search_customer', 'Search customer', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2203, 0, 'en', 'plugins/ecommerce/discount', 'no_customer_found', 'No customer found!', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2204, 0, 'en', 'plugins/ecommerce/discount', 'one_time_per_order', 'One time per order', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2205, 0, 'en', 'plugins/ecommerce/discount', 'one_time_per_product_in_cart', 'One time per product in cart', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2206, 0, 'en', 'plugins/ecommerce/discount', 'number_of_products', 'Number of products', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2207, 0, 'en', 'plugins/ecommerce/discount', 'selected_products', 'Selected products', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2208, 0, 'en', 'plugins/ecommerce/discount', 'selected_customers', 'Selected customers', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2209, 0, 'en', 'plugins/ecommerce/discount', 'time', 'Time', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2210, 0, 'en', 'plugins/ecommerce/discount', 'start_date', 'Start date', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2211, 0, 'en', 'plugins/ecommerce/discount', 'end_date', 'End date', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2212, 0, 'en', 'plugins/ecommerce/discount', 'never_expired', 'Never expired', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2213, 0, 'en', 'plugins/ecommerce/discount', 'save', 'Save', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2214, 0, 'en', 'plugins/ecommerce/ecommerce', 'settings', 'Settings', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2215, 0, 'en', 'plugins/ecommerce/ecommerce', 'name', 'Ecommerce', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2216, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.title', 'E-commerce', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2217, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.description', 'Ecommerce email config', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2218, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_subject', 'Subject of order confirmation email', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2219, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_subject_placeholder', 'The subject of email confirmation send to the customer', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2220, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_content', 'Content of order confirmation email', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2221, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_subject', 'Subject of email when changing order\'s status', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2222, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_subject_placeholder', 'Subject of email when changing order\'s status send to customer', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2223, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_content', 'Content of email when changing order\'s status', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2224, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.from_email', 'Email from', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2225, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.from_email_placeholder', 'Email from address to display in mail. Ex: example@gmail.com', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2226, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.title', 'Basic information', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2227, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.state', 'State', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2228, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.city', 'City', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2229, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.country', 'Country', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2230, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.select country', 'Select a country...', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2231, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.weight_unit_gram', 'Gram (g)', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2232, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.weight_unit_kilogram', 'Kilogram (kg)', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2233, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.weight_unit_lb', 'Pound (lb)', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2234, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.weight_unit_oz', 'Ounce (oz)', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2235, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.height_unit_cm', 'Centimeter (cm)', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2236, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.height_unit_m', 'Meter (m)', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2237, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.height_unit_inch', 'Inch', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2238, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.store_locator_title', 'Store locators', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2239, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.store_locator_description', 'All the lists of your chains, main stores, branches, etc. The locations can be used to track sales and to help us configure tax rates to charge when selling products.', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2240, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.phone', 'Phone', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2241, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.address', 'Address', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2242, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.is_primary', 'Primary?', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2243, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.add_new', 'Add new', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2244, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.or', 'Or', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2245, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.change_primary_store', 'change default store locator', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2246, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.other_settings', 'Other settings', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2247, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.other_settings_description', 'Settings for cart, review...', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2248, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_cart', 'Enable shopping cart?', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2249, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_tax', 'Enable tax?', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2250, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.display_product_price_including_taxes', 'Display product price including taxes?', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2251, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_review', 'Enable review?', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2252, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_quick_buy_button', 'Enable quick buy button?', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2253, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.quick_buy_target', 'Quick buy target page?', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2254, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.checkout_page', 'Checkout page', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2255, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.cart_page', 'Cart page', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2256, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.add_location', 'Add location', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2257, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.edit_location', 'Edit location', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2258, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.delete_location', 'Delete location', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2259, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.change_primary_location', 'Change primary location', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2260, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.delete_location_confirmation', 'Are you sure you want to delete this location? This action cannot be undo.', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2261, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.save_location', 'Save location', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2262, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.accept', 'Accept', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2263, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.select_country', 'Select country', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2264, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.zip_code_enabled', 'Enable Zip Code?', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2265, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.thousands_separator', 'Thousands separator', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2266, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.decimal_separator', 'Decimal separator', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2267, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.separator_period', 'Period (.)', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2268, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.separator_comma', 'Comma (,)', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2269, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.separator_space', 'Space ( )', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2270, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.available_countries', 'Available countries', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2271, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.all', 'All', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2272, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.verify_customer_email', 'Verify customer\'s email?', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2273, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.minimum_order_amount', 'Minimum order amount to place an order (:currency).', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2274, 0, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_guest_checkout', 'Enable guest checkout?', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2275, 0, 'en', 'plugins/ecommerce/ecommerce', 'store_address', 'Store address', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2276, 0, 'en', 'plugins/ecommerce/ecommerce', 'store_phone', 'Store phone', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2277, 0, 'en', 'plugins/ecommerce/ecommerce', 'order_id', 'Order ID', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2278, 0, 'en', 'plugins/ecommerce/ecommerce', 'order_token', 'Order token', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2279, 0, 'en', 'plugins/ecommerce/ecommerce', 'customer_name', 'Customer name', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2280, 0, 'en', 'plugins/ecommerce/ecommerce', 'customer_email', 'Customer email', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2281, 0, 'en', 'plugins/ecommerce/ecommerce', 'customer_phone', 'Customer phone', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2282, 0, 'en', 'plugins/ecommerce/ecommerce', 'customer_address', 'Customer address', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2283, 0, 'en', 'plugins/ecommerce/ecommerce', 'product_list', 'List products in order', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2284, 0, 'en', 'plugins/ecommerce/ecommerce', 'payment_detail', 'Payment detail', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2285, 0, 'en', 'plugins/ecommerce/ecommerce', 'shipping_method', 'Shipping method', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2286, 0, 'en', 'plugins/ecommerce/ecommerce', 'payment_method', 'Payment method', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2287, 0, 'en', 'plugins/ecommerce/ecommerce', 'standard_and_format', 'Standard & Format', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2288, 0, 'en', 'plugins/ecommerce/ecommerce', 'standard_and_format_description', 'Standards and formats are used to calculate things like product prices, shipping weights, and order times.', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2289, 0, 'en', 'plugins/ecommerce/ecommerce', 'change_order_format', 'Edit order code format (optional)', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2290, 0, 'en', 'plugins/ecommerce/ecommerce', 'change_order_format_description', 'The default order code starts at: number. You can change the start or end string to create the order code you want, for example \"DH-: number\" or \": number-A\"', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2291, 0, 'en', 'plugins/ecommerce/ecommerce', 'start_with', 'Start with', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2292, 0, 'en', 'plugins/ecommerce/ecommerce', 'end_with', 'End with', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2293, 0, 'en', 'plugins/ecommerce/ecommerce', 'order_will_be_shown', 'Your order code will be shown', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2294, 0, 'en', 'plugins/ecommerce/ecommerce', 'weight_unit', 'Unit of weight', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2295, 0, 'en', 'plugins/ecommerce/ecommerce', 'height_unit', 'Unit length / height', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2296, 0, 'en', 'plugins/ecommerce/ecommerce', 'theme_options.name', 'Ecommerce', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2297, 0, 'en', 'plugins/ecommerce/ecommerce', 'theme_options.description', 'Theme options for Ecommerce', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2298, 0, 'en', 'plugins/ecommerce/ecommerce', 'theme_options.number_products_per_page', 'Number of products per page', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2299, 0, 'en', 'plugins/ecommerce/ecommerce', 'theme_options.number_of_cross_sale_product', 'Number of cross sale products in product detail page', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2300, 0, 'en', 'plugins/ecommerce/ecommerce', 'theme_options.max_price_filter', 'Maximum price to filter', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2301, 0, 'en', 'plugins/ecommerce/ecommerce', 'theme_options.logo_in_the_checkout_page', 'Logo in the checkout page (Default is the main logo)', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2302, 0, 'en', 'plugins/ecommerce/ecommerce', 'theme_options.logo_in_invoices', 'Logo in invoices (Default is the main logo)', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2303, 0, 'en', 'plugins/ecommerce/email', 'customer_new_order_title', 'Order confirmation', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2304, 0, 'en', 'plugins/ecommerce/email', 'customer_new_order_description', 'Send email confirmation to customer when an order placed', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2305, 0, 'en', 'plugins/ecommerce/email', 'order_cancellation_title', 'Order cancellation', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2306, 0, 'en', 'plugins/ecommerce/email', 'order_cancellation_description', 'Send to custom when they cancelled order', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2307, 0, 'en', 'plugins/ecommerce/email', 'delivery_confirmation_title', 'Delivering confirmation', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2308, 0, 'en', 'plugins/ecommerce/email', 'delivery_confirmation_description', 'Send to customer when order is delivering', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2309, 0, 'en', 'plugins/ecommerce/email', 'admin_new_order_title', 'Notice about new order', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2310, 0, 'en', 'plugins/ecommerce/email', 'admin_new_order_description', 'Send to administrators when an order placed', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2311, 0, 'en', 'plugins/ecommerce/email', 'order_confirmation_title', 'Order confirmation', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2312, 0, 'en', 'plugins/ecommerce/email', 'order_confirmation_description', 'Send to customer when they order was confirmed by admins', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2313, 0, 'en', 'plugins/ecommerce/email', 'payment_confirmation_title', 'Payment confirmation', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2314, 0, 'en', 'plugins/ecommerce/email', 'payment_confirmation_description', 'Send to customer when their payment was confirmed', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2315, 0, 'en', 'plugins/ecommerce/email', 'order_recover_title', 'Incomplete order', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2316, 0, 'en', 'plugins/ecommerce/email', 'order_recover_description', 'Send to custom to remind them about incomplete orders', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2317, 0, 'en', 'plugins/ecommerce/email', 'view_order', 'View order', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2318, 0, 'en', 'plugins/ecommerce/email', 'link_go_to_our_shop', 'or <a href=\":link\">Go to our shop</a>', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2319, 0, 'en', 'plugins/ecommerce/email', 'order_number', 'Order number: <strong>:order_id</strong>', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2320, 0, 'en', 'plugins/ecommerce/email', 'order_information', 'Order information:', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2321, 0, 'en', 'plugins/ecommerce/flash-sale', 'name', 'Flash sales', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2322, 0, 'en', 'plugins/ecommerce/flash-sale', 'create', 'New flash sale', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2323, 0, 'en', 'plugins/ecommerce/flash-sale', 'edit', 'Edit flash sale', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2324, 0, 'en', 'plugins/ecommerce/flash-sale', 'products', 'Products', '2021-08-18 04:43:47', '2021-08-18 04:44:12');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2325, 0, 'en', 'plugins/ecommerce/messages', 'cart.add_product_success', 'Add product :product to cart successfully!', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2326, 0, 'en', 'plugins/ecommerce/messages', 'cart.update_cart_success', 'Update cart successfully!', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2327, 0, 'en', 'plugins/ecommerce/messages', 'cart.remove_cart_success', 'Remove item from cart successfully!', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2328, 0, 'en', 'plugins/ecommerce/messages', 'cart.empty_cart_success', 'Empty cart successfully!', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2329, 0, 'en', 'plugins/ecommerce/messages', 'cart.product_not_found', 'This product is out of stock or not exists!', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2330, 0, 'en', 'plugins/ecommerce/messages', 'cart.product_is_out_of_stock', 'Product :product is out of stock!', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2331, 0, 'en', 'plugins/ecommerce/messages', 'order.customer_cancel_error', 'The order is delivering or completed', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2332, 0, 'en', 'plugins/ecommerce/messages', 'order.customer_cancel_success', 'You do cancel the order successful', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2333, 0, 'en', 'plugins/ecommerce/order', 'statuses.pending', 'Pending', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2334, 0, 'en', 'plugins/ecommerce/order', 'statuses.processing', 'Processing', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2335, 0, 'en', 'plugins/ecommerce/order', 'statuses.delivering', 'Delivering', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2336, 0, 'en', 'plugins/ecommerce/order', 'statuses.delivered', 'Delivered', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2337, 0, 'en', 'plugins/ecommerce/order', 'statuses.completed', 'Completed', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2338, 0, 'en', 'plugins/ecommerce/order', 'statuses.canceled', 'Canceled', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2339, 0, 'en', 'plugins/ecommerce/order', 'menu', 'Orders', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2340, 0, 'en', 'plugins/ecommerce/order', 'create', 'Create an order', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2341, 0, 'en', 'plugins/ecommerce/order', 'cancel_error', 'The order is delivering or completed', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2342, 0, 'en', 'plugins/ecommerce/order', 'cancel_success', 'You do cancel the order successful', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2343, 0, 'en', 'plugins/ecommerce/order', 'incomplete_order', 'Incomplete orders', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2344, 0, 'en', 'plugins/ecommerce/order', 'order_id', 'Order ID', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2345, 0, 'en', 'plugins/ecommerce/order', 'product_id', 'Product ID', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2346, 0, 'en', 'plugins/ecommerce/order', 'customer_label', 'Customer', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2347, 0, 'en', 'plugins/ecommerce/order', 'tax_amount', 'Tax Amount', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2348, 0, 'en', 'plugins/ecommerce/order', 'shipping_amount', 'Shipping amount', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2349, 0, 'en', 'plugins/ecommerce/order', 'payment_method', 'Payment method', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2350, 0, 'en', 'plugins/ecommerce/order', 'payment_status_label', 'Payment status', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2351, 0, 'en', 'plugins/ecommerce/order', 'manage_orders', 'Manage orders', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2352, 0, 'en', 'plugins/ecommerce/order', 'order_intro_description', 'Once your store has orders, this is where you will process and track those orders.', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2353, 0, 'en', 'plugins/ecommerce/order', 'create_new_order', 'Create a new order', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2354, 0, 'en', 'plugins/ecommerce/order', 'manage_incomplete_orders', 'Manage incomplete orders', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2355, 0, 'en', 'plugins/ecommerce/order', 'incomplete_orders_intro_description', 'Incomplete order is an order created when a customer adds a product to the cart, proceeds to fill out the purchase information but does not complete the checkout process.', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2356, 0, 'en', 'plugins/ecommerce/order', 'invoice_for_order', 'Invoice for order', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2357, 0, 'en', 'plugins/ecommerce/order', 'created', 'Created', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2358, 0, 'en', 'plugins/ecommerce/order', 'invoice', 'Invoice', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2359, 0, 'en', 'plugins/ecommerce/order', 'return', 'Return', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2360, 0, 'en', 'plugins/ecommerce/order', 'total_refund_amount', 'Total refund amount', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2361, 0, 'en', 'plugins/ecommerce/order', 'total_amount_can_be_refunded', 'Total amount can be refunded', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2362, 0, 'en', 'plugins/ecommerce/order', 'refund_reason', 'Refund reason (optional)', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2363, 0, 'en', 'plugins/ecommerce/order', 'products', 'product(s)', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2364, 0, 'en', 'plugins/ecommerce/order', 'default', 'Default', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2365, 0, 'en', 'plugins/ecommerce/order', 'system', 'System', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2366, 0, 'en', 'plugins/ecommerce/order', 'new_order_from', 'New order :order_id from :customer', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2367, 0, 'en', 'plugins/ecommerce/order', 'confirmation_email_was_sent_to_customer', 'The email confirmation was sent to customer', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2368, 0, 'en', 'plugins/ecommerce/order', 'address_name_required', 'The name field is required.', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2369, 0, 'en', 'plugins/ecommerce/order', 'address_phone_required', 'The phone field is required.', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2370, 0, 'en', 'plugins/ecommerce/order', 'address_email_required', 'The email field is required.', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2371, 0, 'en', 'plugins/ecommerce/order', 'address_email_unique', 'The customer with that email is existed, please choose other email or login with this email!', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2372, 0, 'en', 'plugins/ecommerce/order', 'address_state_required', 'The state field is required.', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2373, 0, 'en', 'plugins/ecommerce/order', 'address_city_required', 'The city field is required.', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2374, 0, 'en', 'plugins/ecommerce/order', 'address_address_required', 'The address field is required.', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2375, 0, 'en', 'plugins/ecommerce/order', 'create_order_from_payment_page', 'Order was created from checkout page', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2376, 0, 'en', 'plugins/ecommerce/order', 'order_was_verified_by', 'Order was verified by %user_name%', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2377, 0, 'en', 'plugins/ecommerce/order', 'new_order', 'New order :order_id', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2378, 0, 'en', 'plugins/ecommerce/order', 'payment_was_confirmed_by', 'Payment was confirmed (amount :money) by %user_name%', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2379, 0, 'en', 'plugins/ecommerce/order', 'edit_order', 'Edit order :code', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2380, 0, 'en', 'plugins/ecommerce/order', 'confirm_order_success', 'Confirm order successfully!', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2381, 0, 'en', 'plugins/ecommerce/order', 'error_when_sending_email', 'There is an error when sending email', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2382, 0, 'en', 'plugins/ecommerce/order', 'sent_confirmation_email_success', 'Sent confirmation email successfully!', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2383, 0, 'en', 'plugins/ecommerce/order', 'order_was_sent_to_shipping_team', 'Order was sent to shipping team', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2384, 0, 'en', 'plugins/ecommerce/order', 'by_username', 'by %user_name%', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2385, 0, 'en', 'plugins/ecommerce/order', 'shipping_was_created_from', 'Shipping was created from order %order_id%', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2386, 0, 'en', 'plugins/ecommerce/order', 'shipping_was_canceled_success', 'Shipping was cancelled successfully!', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2387, 0, 'en', 'plugins/ecommerce/order', 'shipping_was_canceled_by', 'Shipping was cancelled by %user_name%', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2388, 0, 'en', 'plugins/ecommerce/order', 'update_shipping_address_success', 'Update shipping address successfully!', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2389, 0, 'en', 'plugins/ecommerce/order', 'order_was_canceled_by', 'Order was cancelled by %user_name%', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2390, 0, 'en', 'plugins/ecommerce/order', 'confirm_payment_success', 'Confirm payment successfully!', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2391, 0, 'en', 'plugins/ecommerce/order', 'refund_amount_invalid', 'Refund amount must be lower or equal :price', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2392, 0, 'en', 'plugins/ecommerce/order', 'number_of_products_invalid', 'Number of products refund is not valid!', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2393, 0, 'en', 'plugins/ecommerce/order', 'cannot_found_payment_for_this_order', 'Cannot found payment for this order!', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2394, 0, 'en', 'plugins/ecommerce/order', 'refund_success_with_price', 'Refund success :price', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2395, 0, 'en', 'plugins/ecommerce/order', 'refund_success', 'Refund successfully!', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2396, 0, 'en', 'plugins/ecommerce/order', 'order_is_not_existed', 'Order is not existed!', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2397, 0, 'en', 'plugins/ecommerce/order', 'reorder', 'Reorder', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2398, 0, 'en', 'plugins/ecommerce/order', 'sent_email_incomplete_order_success', 'Sent email to remind about incomplete order successfully!', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2399, 0, 'en', 'plugins/ecommerce/order', 'applied_coupon_success', 'Applied coupon \":code\" successfully!', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2400, 0, 'en', 'plugins/ecommerce/order', 'new_order_notice', 'You have <span class=\"bold\">:count</span> New Order(s)', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2401, 0, 'en', 'plugins/ecommerce/order', 'view_all', 'View all', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2402, 0, 'en', 'plugins/ecommerce/order', 'cancel_order', 'Cancel order', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2403, 0, 'en', 'plugins/ecommerce/order', 'order_canceled', 'Order canceled', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2404, 0, 'en', 'plugins/ecommerce/order', 'order_was_canceled_at', 'Order was canceled at', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2405, 0, 'en', 'plugins/ecommerce/order', 'completed', 'Completed', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2406, 0, 'en', 'plugins/ecommerce/order', 'uncompleted', 'Uncompleted', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2407, 0, 'en', 'plugins/ecommerce/order', 'sku', 'SKU', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2408, 0, 'en', 'plugins/ecommerce/order', 'warehouse', 'Warehouse', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2409, 0, 'en', 'plugins/ecommerce/order', 'sub_amount', 'Sub amount', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2410, 0, 'en', 'plugins/ecommerce/order', 'coupon_code', 'Coupon code: \":code\"', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2411, 0, 'en', 'plugins/ecommerce/order', 'shipping_fee', 'Shipping fee', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2412, 0, 'en', 'plugins/ecommerce/order', 'tax', 'Tax', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2413, 0, 'en', 'plugins/ecommerce/order', 'refunded_amount', 'Refunded amount', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2414, 0, 'en', 'plugins/ecommerce/order', 'amount_received', 'The amount actually received', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2415, 0, 'en', 'plugins/ecommerce/order', 'download_invoice', 'Download invoice', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2416, 0, 'en', 'plugins/ecommerce/order', 'add_note', 'Add note...', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2417, 0, 'en', 'plugins/ecommerce/order', 'order_was_confirmed', 'Order was confirmed', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2418, 0, 'en', 'plugins/ecommerce/order', 'confirm_order', 'Confirm order', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2419, 0, 'en', 'plugins/ecommerce/order', 'confirm', 'Confirm', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2420, 0, 'en', 'plugins/ecommerce/order', 'order_was_canceled', 'Order was canceled', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2421, 0, 'en', 'plugins/ecommerce/order', 'pending_payment', 'Pending payment', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2422, 0, 'en', 'plugins/ecommerce/order', 'payment_was_accepted', 'Payment :money was accepted', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2423, 0, 'en', 'plugins/ecommerce/order', 'payment_was_refunded', 'Payment was refunded', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2424, 0, 'en', 'plugins/ecommerce/order', 'confirm_payment', 'Confirm payment', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2425, 0, 'en', 'plugins/ecommerce/order', 'refund', 'Refund', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2426, 0, 'en', 'plugins/ecommerce/order', 'all_products_are_not_delivered', 'All products are not delivered', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2427, 0, 'en', 'plugins/ecommerce/order', 'delivery', 'Delivery', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2428, 0, 'en', 'plugins/ecommerce/order', 'history', 'History', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2429, 0, 'en', 'plugins/ecommerce/order', 'order_number', 'Order number', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2430, 0, 'en', 'plugins/ecommerce/order', 'from', 'from', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2431, 0, 'en', 'plugins/ecommerce/order', 'status', 'Status', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2432, 0, 'en', 'plugins/ecommerce/order', 'successfully', 'Successfully', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2433, 0, 'en', 'plugins/ecommerce/order', 'transaction_type', 'Transaction\'s type', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2434, 0, 'en', 'plugins/ecommerce/order', 'staff', 'Staff', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2435, 0, 'en', 'plugins/ecommerce/order', 'refund_date', 'Refund date', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2436, 0, 'en', 'plugins/ecommerce/order', 'n_a', 'N\\A', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2437, 0, 'en', 'plugins/ecommerce/order', 'payment_date', 'Payment date', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2438, 0, 'en', 'plugins/ecommerce/order', 'payment_gateway', 'Payment gateway', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2439, 0, 'en', 'plugins/ecommerce/order', 'transaction_amount', 'Transaction amount', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2440, 0, 'en', 'plugins/ecommerce/order', 'resend', 'Resend', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2441, 0, 'en', 'plugins/ecommerce/order', 'default_store', 'Default store', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2442, 0, 'en', 'plugins/ecommerce/order', 'update_address', 'Update address', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2443, 0, 'en', 'plugins/ecommerce/order', 'have_an_account_already', 'Have an account already', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2444, 0, 'en', 'plugins/ecommerce/order', 'dont_have_an_account_yet', 'Don\'t have an account yet', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2445, 0, 'en', 'plugins/ecommerce/order', 'mark_payment_as_confirmed', 'Mark <span>:method</span> as confirmed', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2446, 0, 'en', 'plugins/ecommerce/order', 'resend_order_confirmation', 'Resend order confirmation', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2447, 0, 'en', 'plugins/ecommerce/order', 'resend_order_confirmation_description', 'Confirmation email will be sent to <strong>:email</strong>?', '2021-08-18 04:43:47', '2021-08-18 04:44:12'),
(2448, 0, 'en', 'plugins/ecommerce/order', 'send', 'Send', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2449, 0, 'en', 'plugins/ecommerce/order', 'update', 'Update', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2450, 0, 'en', 'plugins/ecommerce/order', 'cancel_shipping_confirmation', 'Cancel shipping confirmation?', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2451, 0, 'en', 'plugins/ecommerce/order', 'cancel_shipping_confirmation_description', 'Cancel shipping confirmation?', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2452, 0, 'en', 'plugins/ecommerce/order', 'cancel_order_confirmation', 'Cancel order confirmation?', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2453, 0, 'en', 'plugins/ecommerce/order', 'cancel_order_confirmation_description', 'Are you sure you want to cancel this order? This action cannot rollback', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2454, 0, 'en', 'plugins/ecommerce/order', 'confirm_payment_confirmation_description', 'Processed by <strong>:method</strong>. Did you receive payment outside the system? This payment won\'t be saved into system and cannot be refunded', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2455, 0, 'en', 'plugins/ecommerce/order', 'save_note', 'Save note', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2456, 0, 'en', 'plugins/ecommerce/order', 'order_note', 'Order note', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2457, 0, 'en', 'plugins/ecommerce/order', 'order_note_placeholder', 'Note about order, ex: time or shipping instruction.', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2458, 0, 'en', 'plugins/ecommerce/order', 'order_amount', 'Order amount', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2459, 0, 'en', 'plugins/ecommerce/order', 'additional_information', 'Additional information', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2460, 0, 'en', 'plugins/ecommerce/order', 'notice_about_incomplete_order', 'Notice about incomplete order', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2461, 0, 'en', 'plugins/ecommerce/order', 'notice_about_incomplete_order_description', 'Remind email about uncompleted order will be send to <strong>:email</strong>?', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2462, 0, 'en', 'plugins/ecommerce/order', 'incomplete_order_description_1', 'An incomplete order is when a potential customer places items in their shopping cart, and goes all the way through to the payment page, but then doesn\'t complete the transaction.', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2463, 0, 'en', 'plugins/ecommerce/order', 'incomplete_order_description_2', 'If you have contacted customers and they want to continue buying, you can help them complete their order by following the link:', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2464, 0, 'en', 'plugins/ecommerce/order', 'send_an_email_to_recover_this_order', 'Send an email to customer to recover this order', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2465, 0, 'en', 'plugins/ecommerce/order', 'see_maps', 'See maps', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2466, 0, 'en', 'plugins/ecommerce/order', 'one_or_more_products_dont_have_enough_quantity', 'One or more products don\'t have enough quantity!', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2467, 0, 'en', 'plugins/ecommerce/order', 'cannot_send_order_recover_to_mail', 'The email could not be found so it can\'t send a recovery email to the customer.', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2468, 0, 'en', 'plugins/ecommerce/order', 'payment_info', 'Payment Info', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2469, 0, 'en', 'plugins/ecommerce/order', 'payment_method_refund_automatic', 'Your customer will be refunded using :method automatically.', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2470, 0, 'en', 'plugins/ecommerce/order', 'order', 'Order', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2471, 0, 'en', 'plugins/ecommerce/order', 'order_information', 'Order information', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2472, 0, 'en', 'plugins/ecommerce/order', 'create_a_new_product', 'Create a new product', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2473, 0, 'en', 'plugins/ecommerce/order', 'out_of_stock', 'Out of stock', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2474, 0, 'en', 'plugins/ecommerce/order', 'products_available', 'product(s) available', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2475, 0, 'en', 'plugins/ecommerce/order', 'no_products_found', 'No products found!', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2476, 0, 'en', 'plugins/ecommerce/order', 'note', 'Note', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2477, 0, 'en', 'plugins/ecommerce/order', 'note_for_order', 'Note for order...', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2478, 0, 'en', 'plugins/ecommerce/order', 'amount', 'Amount', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2479, 0, 'en', 'plugins/ecommerce/order', 'add_discount', 'Add discount', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2480, 0, 'en', 'plugins/ecommerce/order', 'discount', 'Discount', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2481, 0, 'en', 'plugins/ecommerce/order', 'add_shipping_fee', 'Add shipping fee', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2482, 0, 'en', 'plugins/ecommerce/order', 'shipping', 'Shipping', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2483, 0, 'en', 'plugins/ecommerce/order', 'total_amount', 'Total amount', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2484, 0, 'en', 'plugins/ecommerce/order', 'confirm_payment_and_create_order', 'Confirm payment and create order', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2485, 0, 'en', 'plugins/ecommerce/order', 'paid', 'Paid', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2486, 0, 'en', 'plugins/ecommerce/order', 'pay_later', 'Pay later', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2487, 0, 'en', 'plugins/ecommerce/order', 'customer_information', 'Customer information', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2488, 0, 'en', 'plugins/ecommerce/order', 'create_new_customer', 'Create new customer', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2489, 0, 'en', 'plugins/ecommerce/order', 'no_customer_found', 'No customer found!', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2490, 0, 'en', 'plugins/ecommerce/order', 'customer', 'Customer', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2491, 0, 'en', 'plugins/ecommerce/order', 'orders', 'order(s)', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2492, 0, 'en', 'plugins/ecommerce/order', 'shipping_address', 'Shipping Address', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2493, 0, 'en', 'plugins/ecommerce/order', 'see_on_maps', 'See on maps', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2494, 0, 'en', 'plugins/ecommerce/order', 'name', 'Name', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2495, 0, 'en', 'plugins/ecommerce/order', 'price', 'Price', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2496, 0, 'en', 'plugins/ecommerce/order', 'sku_optional', 'SKU (optional)', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2497, 0, 'en', 'plugins/ecommerce/order', 'with_storehouse_management', 'With storehouse management?', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2498, 0, 'en', 'plugins/ecommerce/order', 'quantity', 'Quantity', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2499, 0, 'en', 'plugins/ecommerce/order', 'allow_customer_checkout_when_this_product_out_of_stock', 'Allow customer checkout when this product out of stock?', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2500, 0, 'en', 'plugins/ecommerce/order', 'address', 'Address', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2501, 0, 'en', 'plugins/ecommerce/order', 'phone', 'Phone', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2502, 0, 'en', 'plugins/ecommerce/order', 'country', 'Country', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2503, 0, 'en', 'plugins/ecommerce/order', 'state', 'State', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2504, 0, 'en', 'plugins/ecommerce/order', 'city', 'City', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2505, 0, 'en', 'plugins/ecommerce/order', 'zip_code', 'Zip code', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2506, 0, 'en', 'plugins/ecommerce/order', 'discount_based_on', 'Discount based on', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2507, 0, 'en', 'plugins/ecommerce/order', 'or_coupon_code', 'Or coupon code', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2508, 0, 'en', 'plugins/ecommerce/order', 'description', 'Description', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2509, 0, 'en', 'plugins/ecommerce/order', 'how_to_select_configured_shipping', 'How to select configured shipping?', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2510, 0, 'en', 'plugins/ecommerce/order', 'please_add_customer_information_with_the_complete_shipping_address_to_see_the_configured_shipping_rates', 'Please add customer information with the complete shipping address to see the configured shipping rates', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2511, 0, 'en', 'plugins/ecommerce/order', 'free_shipping', 'Free shipping', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2512, 0, 'en', 'plugins/ecommerce/order', 'custom', 'Custom', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2513, 0, 'en', 'plugins/ecommerce/order', 'email', 'Email', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2514, 0, 'en', 'plugins/ecommerce/order', 'create_order', 'Create order', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2515, 0, 'en', 'plugins/ecommerce/order', 'close', 'Close', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2516, 0, 'en', 'plugins/ecommerce/order', 'confirm_payment_is_paid_for_this_order', 'Confirm payment is paid for this order', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2517, 0, 'en', 'plugins/ecommerce/order', 'payment_status_of_the_order_is_paid_once_the_order_has_been_created_you_cannot_change_the_payment_method_or_status', 'Payment status of the order is Paid. Once the order has been created, you cannot change the payment method or status', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2518, 0, 'en', 'plugins/ecommerce/order', 'select_payment_method', 'Select payment method', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2519, 0, 'en', 'plugins/ecommerce/order', 'cash_on_delivery_cod', 'Cash on delivery (COD)', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2520, 0, 'en', 'plugins/ecommerce/order', 'bank_transfer', 'Bank transfer', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2521, 0, 'en', 'plugins/ecommerce/order', 'paid_amount', 'Paid amount', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2522, 0, 'en', 'plugins/ecommerce/order', 'confirm_that_payment_for_this_order_will_be_paid_later', 'Confirm that payment for this order will be paid later', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2523, 0, 'en', 'plugins/ecommerce/order', 'payment_status_of_the_order_is_pending_once_the_order_has_been_created_you_cannot_change_the_payment_method_or_status', 'Payment status of the order is Pending. Once the order has been created, you cannot change the payment method or status', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2524, 0, 'en', 'plugins/ecommerce/order', 'pending_amount', 'Pending amount', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2525, 0, 'en', 'plugins/ecommerce/order', 'update_email', 'Update email', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2526, 0, 'en', 'plugins/ecommerce/order', 'save', 'Save', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2527, 0, 'en', 'plugins/ecommerce/order', 'cancel', 'Cancel', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2528, 0, 'en', 'plugins/ecommerce/order', 'create_a_new_order', 'Create a new order', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2529, 0, 'en', 'plugins/ecommerce/payment', 'name', 'Payments', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2530, 0, 'en', 'plugins/ecommerce/payment', 'payment_method', 'Payment methods', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2531, 0, 'en', 'plugins/ecommerce/payment', 'view_payment', 'View payment #', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2532, 0, 'en', 'plugins/ecommerce/payment', 'charge_id', 'Charge ID', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2533, 0, 'en', 'plugins/ecommerce/payment', 'amount', 'Amount', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2534, 0, 'en', 'plugins/ecommerce/payment', 'currency', 'Currency', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2535, 0, 'en', 'plugins/ecommerce/payment', 'user', 'User', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2536, 0, 'en', 'plugins/ecommerce/payment', 'paypal_name_required', 'PayPal\'s name is required!', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2537, 0, 'en', 'plugins/ecommerce/payment', 'paypal_name_max', 'PayPal\'s name is too long!', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2538, 0, 'en', 'plugins/ecommerce/payment', 'stripe_name_required', 'Stripe\'s name is required!', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2539, 0, 'en', 'plugins/ecommerce/payment', 'stripe_name_max', 'Stripe\'s name is too long!', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2540, 0, 'en', 'plugins/ecommerce/payment', 'status', 'Status', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2541, 0, 'en', 'plugins/ecommerce/payment', 'enabled', 'Enabled', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2542, 0, 'en', 'plugins/ecommerce/payment', 'disabled', 'Disabled', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2543, 0, 'en', 'plugins/ecommerce/payment', 'client_id', 'Client ID', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2544, 0, 'en', 'plugins/ecommerce/payment', 'client_secret', 'Client Secret', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2545, 0, 'en', 'plugins/ecommerce/payment', 'mode', 'Mode', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2546, 0, 'en', 'plugins/ecommerce/payment', 'sandbox', 'Sandbox', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2547, 0, 'en', 'plugins/ecommerce/payment', 'live', 'Live', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2548, 0, 'en', 'plugins/ecommerce/payment', 'enable_payment_log', 'Enable Payment Log', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2549, 0, 'en', 'plugins/ecommerce/payment', 'yes', 'Yes', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2550, 0, 'en', 'plugins/ecommerce/payment', 'no', 'No', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2551, 0, 'en', 'plugins/ecommerce/payment', 'client_key', 'Client Key', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2552, 0, 'en', 'plugins/ecommerce/payment', 'stripe', 'Stripe', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2553, 0, 'en', 'plugins/ecommerce/payment', 'paypal', 'PayPal', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2554, 0, 'en', 'plugins/ecommerce/payment', 'action', 'Action', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2555, 0, 'en', 'plugins/ecommerce/payment', 'go_back', 'Go back', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2556, 0, 'en', 'plugins/ecommerce/payment', 'view', 'View', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2557, 0, 'en', 'plugins/ecommerce/payment', 'cash_on_delivery', 'Cash on delivery (COD)', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2558, 0, 'en', 'plugins/ecommerce/payment', 'via_bank_transfer', 'Via bank transfer', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2559, 0, 'en', 'plugins/ecommerce/payment', 'payment_via_cart', 'Payment via card', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2560, 0, 'en', 'plugins/ecommerce/payment', 'card_number', 'Card number', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2561, 0, 'en', 'plugins/ecommerce/payment', 'full_name', 'Full name', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2562, 0, 'en', 'plugins/ecommerce/payment', 'payment_via_paypal', 'Payment via PayPal', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2563, 0, 'en', 'plugins/ecommerce/payment', 'mm_yy', 'MM/YY', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2564, 0, 'en', 'plugins/ecommerce/payment', 'cvc', 'CVC', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2565, 0, 'en', 'plugins/ecommerce/payment', 'details', 'Details', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2566, 0, 'en', 'plugins/ecommerce/payment', 'payer_name', 'Payer Name', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2567, 0, 'en', 'plugins/ecommerce/payment', 'email', 'Email', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2568, 0, 'en', 'plugins/ecommerce/payment', 'phone', 'Phone', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2569, 0, 'en', 'plugins/ecommerce/payment', 'country', 'Country', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2570, 0, 'en', 'plugins/ecommerce/payment', 'shipping_address', 'Shipping Address', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2571, 0, 'en', 'plugins/ecommerce/payment', 'payment_details', 'Payment Details', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2572, 0, 'en', 'plugins/ecommerce/payment', 'card', 'Card', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2573, 0, 'en', 'plugins/ecommerce/payment', 'address', 'Address', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2574, 0, 'en', 'plugins/ecommerce/payment', 'could_not_get_stripe_token', 'Could not get Stripe token to make a charge.', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2575, 0, 'en', 'plugins/ecommerce/payment', 'new_payment', 'Payment for order :id', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2576, 0, 'en', 'plugins/ecommerce/payment', 'payment_id', 'Payment ID', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2577, 0, 'en', 'plugins/ecommerce/prices', 'name', 'Price', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2578, 0, 'en', 'plugins/ecommerce/prices', 'create', 'New price', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2579, 0, 'en', 'plugins/ecommerce/prices', 'edit', 'Edit price', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2580, 0, 'en', 'plugins/ecommerce/prices', 'list', 'List price', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2581, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'name', 'Product attribute sets', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2582, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'create', 'New product attribute set', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2583, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'edit', 'Edit product attribute set', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2584, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'visible_in_categories', 'Visible in categories', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2585, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'product_with_more_version', 'Product with more version', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2586, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'create_a_version', 'Create a version', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2587, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'enabled', 'Enabled', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2588, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'attributes', 'Attributes', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2589, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'price', 'Price', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2590, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'edit_btn', 'Edit', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2591, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'remove_btn', 'Remove', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2592, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'product', 'Product', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2593, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'back_to_product', 'Back to product', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2594, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'save', 'Save', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2595, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'other_existing_versions', 'Other existing versions', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2596, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'version_information', 'Version information', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2597, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'add_rule', 'Add rule', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2598, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'rules', 'Rules', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2599, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'pricing', 'Pricing', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2600, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'sale_price', 'Sale price', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2601, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'sale_type', 'Sale type', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2602, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'no_sale_price', 'No sale price', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2603, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'always_on_sale', 'Always on sale', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2604, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'limited_time', 'Limited time', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2605, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'from', 'From', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2606, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'to', 'To', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2607, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'storehouse', 'Storehouse', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2608, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'no_storehouse_management', 'No storehouse management', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2609, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'with_storehouse_management', 'With storehouse management', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2610, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'quantity', 'Quantity', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2611, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'allow_customer_checkout_out_of_stock', 'Allow customer checkout when this product out of stock', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2612, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'shipping', 'Shipping', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2613, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'length', 'Length', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2614, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'wide', 'Wide', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2615, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'height', 'Height', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2616, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'weight', 'Weight', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2617, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'version_images', 'Version images', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2618, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'add_new_image', 'Add new image', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2619, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'attribute_set', 'Attribute set', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2620, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'value', 'Value', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2621, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'dropdown_swatch', 'Dropdown Swatch', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2622, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'visual_swatch', 'Visual Swatch', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2623, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'text_swatch', 'Text Swatch', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2624, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'display_layout', 'Display Layout', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2625, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'searchable', 'Searchable', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2626, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'comparable', 'Comparable', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2627, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'use_in_product_listing', 'Used in product listing', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2628, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'attributes_list', 'Attributes list', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2629, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'is_default', 'Is default?', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2630, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'title', 'Title', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2631, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'slug', 'Slug', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2632, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'color', 'Color', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2633, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'image', 'Image', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2634, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'remove', 'Remove', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2635, 0, 'en', 'plugins/ecommerce/product-attribute-sets', 'add_new_attribute', 'Add new attribute', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2636, 0, 'en', 'plugins/ecommerce/product-attributes', 'name', 'Product attributes', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2637, 0, 'en', 'plugins/ecommerce/product-attributes', 'create', 'New product attribute', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2638, 0, 'en', 'plugins/ecommerce/product-attributes', 'edit', 'Edit product attribute', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2639, 0, 'en', 'plugins/ecommerce/product-attributes', 'intro.title', 'Manage product attributes', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2640, 0, 'en', 'plugins/ecommerce/product-attributes', 'intro.description', 'Product attribute such as color, width, height ...', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2641, 0, 'en', 'plugins/ecommerce/product-attributes', 'intro.button_text', 'Create product attribute', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2642, 0, 'en', 'plugins/ecommerce/product-categories', 'name', 'Product categories', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2643, 0, 'en', 'plugins/ecommerce/product-categories', 'create', 'Create new product category', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2644, 0, 'en', 'plugins/ecommerce/product-categories', 'edit', 'Edit product category', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2645, 0, 'en', 'plugins/ecommerce/product-categories', 'list', 'List product categories', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2646, 0, 'en', 'plugins/ecommerce/product-categories', 'none', 'None', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2647, 0, 'en', 'plugins/ecommerce/product-categories', 'menu', 'Product categories', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2648, 0, 'en', 'plugins/ecommerce/product-categories', 'intro.title', 'Manage product categories', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2649, 0, 'en', 'plugins/ecommerce/product-categories', 'intro.description', 'Such as clothes, shoes, bags, jewelry ...', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2650, 0, 'en', 'plugins/ecommerce/product-categories', 'intro.button_text', 'Create product category', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2651, 0, 'en', 'plugins/ecommerce/product-categories', 'total_products', 'Total products: :total', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2652, 0, 'en', 'plugins/ecommerce/product-collections', 'name', 'Product collections', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2653, 0, 'en', 'plugins/ecommerce/product-collections', 'create', 'New product collection', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2654, 0, 'en', 'plugins/ecommerce/product-collections', 'edit', 'Edit product collection', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2655, 0, 'en', 'plugins/ecommerce/product-collections', 'slug_help_block', 'Label key: <code>:slug</code>. We will use this key for filter.', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2656, 0, 'en', 'plugins/ecommerce/product-collections', 'intro.title', 'Manage product collections', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2657, 0, 'en', 'plugins/ecommerce/product-collections', 'intro.description', 'Group your products into collections to make it easier for customers to find them by category.', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2658, 0, 'en', 'plugins/ecommerce/product-collections', 'intro.button_text', 'Create product collection', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2659, 0, 'en', 'plugins/ecommerce/product-label', 'name', 'Product labels', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2660, 0, 'en', 'plugins/ecommerce/product-label', 'create', 'New product label', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2661, 0, 'en', 'plugins/ecommerce/product-label', 'edit', 'Edit product label', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2662, 0, 'en', 'plugins/ecommerce/product-label', 'color', 'Color', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2663, 0, 'en', 'plugins/ecommerce/product-label', 'color_placeholder', 'Example: #f0f0f0', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2664, 0, 'en', 'plugins/ecommerce/product-tag', 'name', 'Product tags', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2665, 0, 'en', 'plugins/ecommerce/product-tag', 'create', 'New product tag', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2666, 0, 'en', 'plugins/ecommerce/product-tag', 'edit', 'Edit product tag', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2667, 0, 'en', 'plugins/ecommerce/products', 'name', 'Products', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2668, 0, 'en', 'plugins/ecommerce/products', 'create', 'New product', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2669, 0, 'en', 'plugins/ecommerce/products', 'edit', 'Edit product - :name', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2670, 0, 'en', 'plugins/ecommerce/products', 'form.name', 'Name', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2671, 0, 'en', 'plugins/ecommerce/products', 'form.name_placeholder', 'Product\'s name (Maximum 120 characters)', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2672, 0, 'en', 'plugins/ecommerce/products', 'form.description', 'Description', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2673, 0, 'en', 'plugins/ecommerce/products', 'form.description_placeholder', 'Short description for product (Maximum 400 characters)', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2674, 0, 'en', 'plugins/ecommerce/products', 'form.categories', 'Categories', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2675, 0, 'en', 'plugins/ecommerce/products', 'form.content', 'Content', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2676, 0, 'en', 'plugins/ecommerce/products', 'form.price', 'Price', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2677, 0, 'en', 'plugins/ecommerce/products', 'form.quantity', 'Quantity', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2678, 0, 'en', 'plugins/ecommerce/products', 'form.brand', 'Brand', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2679, 0, 'en', 'plugins/ecommerce/products', 'form.width', 'Width', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2680, 0, 'en', 'plugins/ecommerce/products', 'form.height', 'Height', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2681, 0, 'en', 'plugins/ecommerce/products', 'form.weight', 'Weight', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2682, 0, 'en', 'plugins/ecommerce/products', 'form.date.end', 'From date', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2683, 0, 'en', 'plugins/ecommerce/products', 'form.date.start', 'To date', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2684, 0, 'en', 'plugins/ecommerce/products', 'form.image', 'Images', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2685, 0, 'en', 'plugins/ecommerce/products', 'form.collections', 'Product collections', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2686, 0, 'en', 'plugins/ecommerce/products', 'form.labels', 'Labels', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2687, 0, 'en', 'plugins/ecommerce/products', 'form.price_sale', 'Price sale', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2688, 0, 'en', 'plugins/ecommerce/products', 'form.product_type.title', 'Product type', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2689, 0, 'en', 'plugins/ecommerce/products', 'form.product', 'Product', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2690, 0, 'en', 'plugins/ecommerce/products', 'form.total', 'Total', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2691, 0, 'en', 'plugins/ecommerce/products', 'form.sub_total', 'Subtotal', '2021-08-18 04:43:48', '2021-08-18 04:44:12'),
(2692, 0, 'en', 'plugins/ecommerce/products', 'form.shipping_fee', 'Shipping fee', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2693, 0, 'en', 'plugins/ecommerce/products', 'form.discount', 'Discount', '2021-08-18 04:43:49', '2021-08-18 04:44:12');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2694, 0, 'en', 'plugins/ecommerce/products', 'form.options', 'Options', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2695, 0, 'en', 'plugins/ecommerce/products', 'form.shipping.height', 'Height', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2696, 0, 'en', 'plugins/ecommerce/products', 'form.shipping.length', 'Length', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2697, 0, 'en', 'plugins/ecommerce/products', 'form.shipping.title', 'Shipping', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2698, 0, 'en', 'plugins/ecommerce/products', 'form.shipping.weight', 'Weight', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2699, 0, 'en', 'plugins/ecommerce/products', 'form.shipping.wide', 'Wide', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2700, 0, 'en', 'plugins/ecommerce/products', 'form.stock.allow_order_when_out', 'Allow customer checkout when this product out of stock', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2701, 0, 'en', 'plugins/ecommerce/products', 'form.stock.in_stock', 'In stock', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2702, 0, 'en', 'plugins/ecommerce/products', 'form.stock.out_stock', 'Out stock', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2703, 0, 'en', 'plugins/ecommerce/products', 'form.stock.title', 'Stock status', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2704, 0, 'en', 'plugins/ecommerce/products', 'form.storehouse.no_storehouse', 'No storehouse management', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2705, 0, 'en', 'plugins/ecommerce/products', 'form.storehouse.storehouse', 'With storehouse management', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2706, 0, 'en', 'plugins/ecommerce/products', 'form.storehouse.title', 'Storehouse', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2707, 0, 'en', 'plugins/ecommerce/products', 'form.storehouse.quantity', 'Quantity', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2708, 0, 'en', 'plugins/ecommerce/products', 'form.tax', 'Tax', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2709, 0, 'en', 'plugins/ecommerce/products', 'form.is_default', 'Is default', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2710, 0, 'en', 'plugins/ecommerce/products', 'form.action', 'Action', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2711, 0, 'en', 'plugins/ecommerce/products', 'form.restock_quantity', 'Restock quantity', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2712, 0, 'en', 'plugins/ecommerce/products', 'form.remain', 'Remain', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2713, 0, 'en', 'plugins/ecommerce/products', 'form.choose_discount_period', 'Choose Discount Period', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2714, 0, 'en', 'plugins/ecommerce/products', 'form.cancel', 'Cancel', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2715, 0, 'en', 'plugins/ecommerce/products', 'form.no_results', 'No results!', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2716, 0, 'en', 'plugins/ecommerce/products', 'form.value', 'Value', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2717, 0, 'en', 'plugins/ecommerce/products', 'form.attribute_name', 'Attribute name', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2718, 0, 'en', 'plugins/ecommerce/products', 'form.add_more_attribute', 'Add more attribute', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2719, 0, 'en', 'plugins/ecommerce/products', 'form.continue', 'Continue', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2720, 0, 'en', 'plugins/ecommerce/products', 'form.add_new_attributes', 'Add new attributes', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2721, 0, 'en', 'plugins/ecommerce/products', 'form.add_new_attributes_description', 'Adding new attributes helps the product to have many options, such as size or color.', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2722, 0, 'en', 'plugins/ecommerce/products', 'form.create_product_variations', ':link to create product variations!', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2723, 0, 'en', 'plugins/ecommerce/products', 'form.tags', 'Tags', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2724, 0, 'en', 'plugins/ecommerce/products', 'form.write_some_tags', 'Write some tags', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2725, 0, 'en', 'plugins/ecommerce/products', 'form.variation_existed', 'This variation is existed.', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2726, 0, 'en', 'plugins/ecommerce/products', 'form.no_attributes_selected', 'No attributes selected!', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2727, 0, 'en', 'plugins/ecommerce/products', 'form.added_variation_success', 'Added variation successfully!', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2728, 0, 'en', 'plugins/ecommerce/products', 'form.updated_variation_success', 'Updated variation successfully!', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2729, 0, 'en', 'plugins/ecommerce/products', 'form.created_all_variation_success', 'Created all variations successfully!', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2730, 0, 'en', 'plugins/ecommerce/products', 'form.updated_product_attributes_success', 'Updated product attributes successfully!', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2731, 0, 'en', 'plugins/ecommerce/products', 'form.stock_status', 'Stock status', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2732, 0, 'en', 'plugins/ecommerce/products', 'form.auto_generate_sku', 'Auto generate SKU?', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2733, 0, 'en', 'plugins/ecommerce/products', 'price', 'Price', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2734, 0, 'en', 'plugins/ecommerce/products', 'quantity', 'Quantity', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2735, 0, 'en', 'plugins/ecommerce/products', 'type', 'Type', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2736, 0, 'en', 'plugins/ecommerce/products', 'image', 'Thumbnail', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2737, 0, 'en', 'plugins/ecommerce/products', 'sku', 'SKU', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2738, 0, 'en', 'plugins/ecommerce/products', 'brand', 'Brand', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2739, 0, 'en', 'plugins/ecommerce/products', 'cannot_delete', 'Product could not be deleted', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2740, 0, 'en', 'plugins/ecommerce/products', 'product_deleted', 'Product deleted', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2741, 0, 'en', 'plugins/ecommerce/products', 'product_collections', 'Product collections', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2742, 0, 'en', 'plugins/ecommerce/products', 'products', 'Products', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2743, 0, 'en', 'plugins/ecommerce/products', 'menu', 'Products', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2744, 0, 'en', 'plugins/ecommerce/products', 'control.button_add_image', 'Add image', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2745, 0, 'en', 'plugins/ecommerce/products', 'price_sale', 'Sale price', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2746, 0, 'en', 'plugins/ecommerce/products', 'price_group_title', 'Manager product price', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2747, 0, 'en', 'plugins/ecommerce/products', 'store_house_group_title', 'Manager store house', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2748, 0, 'en', 'plugins/ecommerce/products', 'shipping_group_title', 'Manager shipping', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2749, 0, 'en', 'plugins/ecommerce/products', 'overview', 'Overview', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2750, 0, 'en', 'plugins/ecommerce/products', 'attributes', 'Attributes', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2751, 0, 'en', 'plugins/ecommerce/products', 'product_has_variations', 'Product has variations', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2752, 0, 'en', 'plugins/ecommerce/products', 'manage_products', 'Manage products', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2753, 0, 'en', 'plugins/ecommerce/products', 'add_new_product', 'Add a new product', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2754, 0, 'en', 'plugins/ecommerce/products', 'start_by_adding_new_product', 'Start by adding new products.', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2755, 0, 'en', 'plugins/ecommerce/products', 'edit_this_product', 'Edit this product', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2756, 0, 'en', 'plugins/ecommerce/products', 'delete', 'Delete', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2757, 0, 'en', 'plugins/ecommerce/products', 'related_products', 'Related products', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2758, 0, 'en', 'plugins/ecommerce/products', 'cross_selling_products', 'Cross-selling products', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2759, 0, 'en', 'plugins/ecommerce/products', 'up_selling_products', 'Up-selling products', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2760, 0, 'en', 'plugins/ecommerce/products', 'grouped_products', 'Grouped products', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2761, 0, 'en', 'plugins/ecommerce/products', 'search_products', 'Search products', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2762, 0, 'en', 'plugins/ecommerce/products', 'selected_products', 'Selected products', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2763, 0, 'en', 'plugins/ecommerce/products', 'edit_variation_item', 'Edit', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2764, 0, 'en', 'plugins/ecommerce/products', 'variations_box_description', 'Click on \"Edit attribute\" to add/remove attributes of variation or click on \"Add new variation\" to add variation.', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2765, 0, 'en', 'plugins/ecommerce/products', 'save_changes', 'Save changes', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2766, 0, 'en', 'plugins/ecommerce/products', 'continue', 'Continue', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2767, 0, 'en', 'plugins/ecommerce/products', 'edit_attribute', 'Edit attribute', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2768, 0, 'en', 'plugins/ecommerce/products', 'select_attribute', 'Select attribute', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2769, 0, 'en', 'plugins/ecommerce/products', 'add_new_variation', 'Add new variation', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2770, 0, 'en', 'plugins/ecommerce/products', 'edit_variation', 'Edit variation', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2771, 0, 'en', 'plugins/ecommerce/products', 'generate_all_variations', 'Generate all variations', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2772, 0, 'en', 'plugins/ecommerce/products', 'generate_all_variations_confirmation', 'Are you sure you want to generate all variations for this product?', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2773, 0, 'en', 'plugins/ecommerce/products', 'delete_variation', 'Delete variation?', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2774, 0, 'en', 'plugins/ecommerce/products', 'delete_variation_confirmation', 'Are you sure you want to delete this variation? This action cannot be undo.', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2775, 0, 'en', 'plugins/ecommerce/products', 'delete_variations_confirmation', 'Are you sure you want to delete those variations? This action cannot be undo.', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2776, 0, 'en', 'plugins/ecommerce/products', 'product_create_validate_name_required', 'Please enter product\'s name', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2777, 0, 'en', 'plugins/ecommerce/products', 'product_create_validate_sale_price_max', 'The discount must be less than the original price', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2778, 0, 'en', 'plugins/ecommerce/products', 'product_create_validate_sale_price_required_if', 'Must enter a discount when you want to schedule a promotion', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2779, 0, 'en', 'plugins/ecommerce/products', 'product_create_validate_end_date_after', 'End date must be after start date', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2780, 0, 'en', 'plugins/ecommerce/products', 'product_create_validate_start_date_required_if', 'Discount start date cannot be left blank when scheduling is selected', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2781, 0, 'en', 'plugins/ecommerce/products', 'product_create_validate_sale_price', 'Discounts cannot be left blank when scheduling is selected', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2782, 0, 'en', 'plugins/ecommerce/products', 'stock_statuses.in_stock', 'In stock', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2783, 0, 'en', 'plugins/ecommerce/products', 'stock_statuses.out_of_stock', 'Out of stock', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2784, 0, 'en', 'plugins/ecommerce/products', 'stock_statuses.on_backorder', 'On backorder', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2785, 0, 'en', 'plugins/ecommerce/products', 'stock_status', 'Stock status', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2786, 0, 'en', 'plugins/ecommerce/products', 'processing', 'Processing...', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2787, 0, 'en', 'plugins/ecommerce/products', 'delete_selected_variations', 'Delete selected variations', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2788, 0, 'en', 'plugins/ecommerce/products', 'delete_variations', 'Delete variations', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2789, 0, 'en', 'plugins/ecommerce/products', 'category', 'Category', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2790, 0, 'en', 'plugins/ecommerce/reports', 'name', 'Report', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2791, 0, 'en', 'plugins/ecommerce/reports', 'widget.order.title', 'Orders', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2792, 0, 'en', 'plugins/ecommerce/reports', 'count.revenue', 'Today revenue', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2793, 0, 'en', 'plugins/ecommerce/reports', 'count.orders', 'Today orders', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2794, 0, 'en', 'plugins/ecommerce/reports', 'count.products', 'Total products', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2795, 0, 'en', 'plugins/ecommerce/reports', 'count.customers', 'Total customers', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2796, 0, 'en', 'plugins/ecommerce/reports', 'product_name', 'Product name', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2797, 0, 'en', 'plugins/ecommerce/reports', 'quantity', 'Quantity', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2798, 0, 'en', 'plugins/ecommerce/reports', 'revenue_statistics', 'Revenue statistics', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2799, 0, 'en', 'plugins/ecommerce/reports', 'top_selling_products', 'Top Selling Products', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2800, 0, 'en', 'plugins/ecommerce/reports', 'ranges.today', 'Today', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2801, 0, 'en', 'plugins/ecommerce/reports', 'ranges.this_week', 'This week', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2802, 0, 'en', 'plugins/ecommerce/reports', 'ranges.last_7_days', 'Last 7 days', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2803, 0, 'en', 'plugins/ecommerce/reports', 'ranges.this_month', 'This month', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2804, 0, 'en', 'plugins/ecommerce/reports', 'ranges.this_year', 'This year', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2805, 0, 'en', 'plugins/ecommerce/reports', 'revenue_this_month', 'Revenue this month', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2806, 0, 'en', 'plugins/ecommerce/reports', 'order_processing_this_month', 'order(s) processing in this month', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2807, 0, 'en', 'plugins/ecommerce/reports', 'order_completed_this_month', 'order(s) completed in this month', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2808, 0, 'en', 'plugins/ecommerce/reports', 'product_will_be_out_of_stock', 'product(s) will be out of stock soon', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2809, 0, 'en', 'plugins/ecommerce/reports', 'product_out_of_stock', 'product(s) out of stock', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2810, 0, 'en', 'plugins/ecommerce/reports', 'sales_reports', 'Sales Reports', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2811, 0, 'en', 'plugins/ecommerce/reports', 'total_eanrnings', 'Total Earnings', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2812, 0, 'en', 'plugins/ecommerce/reports', 'recent_orders', 'Recent Orders', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2813, 0, 'en', 'plugins/ecommerce/reports', 'statistics', 'Statistics', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2814, 0, 'en', 'plugins/ecommerce/reports', 'items_earning_sales', 'Items Earning Sales: :value', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2815, 0, 'en', 'plugins/ecommerce/reports', 'revenue', 'Revenue', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2816, 0, 'en', 'plugins/ecommerce/reports', 'orders', 'Orders', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2817, 0, 'en', 'plugins/ecommerce/reports', 'products', 'Products', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2818, 0, 'en', 'plugins/ecommerce/reports', 'customers', 'Customers', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2819, 0, 'en', 'plugins/ecommerce/reports', 'choose_a_time_period', 'Choose a time period', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2820, 0, 'en', 'plugins/ecommerce/reports', 'earnings', 'Earnings', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2821, 0, 'en', 'plugins/ecommerce/review', 'name', 'Reviews', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2822, 0, 'en', 'plugins/ecommerce/review', 'add_review', 'Add review', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2823, 0, 'en', 'plugins/ecommerce/review', 'delete_review', 'Delete review', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2824, 0, 'en', 'plugins/ecommerce/review', 'create_review', 'Create Review', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2825, 0, 'en', 'plugins/ecommerce/review', 'please_select_rating', 'Please select rating', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2826, 0, 'en', 'plugins/ecommerce/review', 'comment', 'Comment', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2827, 0, 'en', 'plugins/ecommerce/review', 'approve', 'Approve', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2828, 0, 'en', 'plugins/ecommerce/review', 'approved', 'Approved', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2829, 0, 'en', 'plugins/ecommerce/review', 'disapprove', 'Disapprove', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2830, 0, 'en', 'plugins/ecommerce/review', 'disapproved', 'Disapproved', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2831, 0, 'en', 'plugins/ecommerce/review', 'product', 'Product', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2832, 0, 'en', 'plugins/ecommerce/review', 'user', 'User', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2833, 0, 'en', 'plugins/ecommerce/review', 'star', 'Star', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2834, 0, 'en', 'plugins/ecommerce/review', 'status', 'Status', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2835, 0, 'en', 'plugins/ecommerce/review', 'list_review', 'Customer reviews', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2836, 0, 'en', 'plugins/ecommerce/review', 'intro.title', 'Manage customer reviews', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2837, 0, 'en', 'plugins/ecommerce/review', 'intro.description', 'Customer reviews will be shown here and you can manage it to show/hide in product detail page.', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2838, 0, 'en', 'plugins/ecommerce/shipping', 'name', 'Shipping Rules', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2839, 0, 'en', 'plugins/ecommerce/shipping', 'shipping', 'Shipping', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2840, 0, 'en', 'plugins/ecommerce/shipping', 'title', 'Title', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2841, 0, 'en', 'plugins/ecommerce/shipping', 'amount', 'Amount', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2842, 0, 'en', 'plugins/ecommerce/shipping', 'enable', 'Enable', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2843, 0, 'en', 'plugins/ecommerce/shipping', 'enabled', 'Enabled', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2844, 0, 'en', 'plugins/ecommerce/shipping', 'disable', 'Disable', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2845, 0, 'en', 'plugins/ecommerce/shipping', 'disabled', 'Disabled', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2846, 0, 'en', 'plugins/ecommerce/shipping', 'create_shipping', 'Create a shipping', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2847, 0, 'en', 'plugins/ecommerce/shipping', 'edit_shipping', 'Edit shipping :code', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2848, 0, 'en', 'plugins/ecommerce/shipping', 'status', 'Status', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2849, 0, 'en', 'plugins/ecommerce/shipping', 'shipping_methods', 'Shipping methods', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2850, 0, 'en', 'plugins/ecommerce/shipping', 'create_shipping_method', 'Create shipping method', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2851, 0, 'en', 'plugins/ecommerce/shipping', 'edit_shipping_method', 'Edit shipping method', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2852, 0, 'en', 'plugins/ecommerce/shipping', 'add_shipping_region', 'Add shipping region', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2853, 0, 'en', 'plugins/ecommerce/shipping', 'country', 'Country', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2854, 0, 'en', 'plugins/ecommerce/shipping', 'state', 'State', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2855, 0, 'en', 'plugins/ecommerce/shipping', 'city', 'City', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2856, 0, 'en', 'plugins/ecommerce/shipping', 'address', 'Address', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2857, 0, 'en', 'plugins/ecommerce/shipping', 'phone', 'Phone', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2858, 0, 'en', 'plugins/ecommerce/shipping', 'email', 'Email', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2859, 0, 'en', 'plugins/ecommerce/shipping', 'zip_code', 'Zip code', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2860, 0, 'en', 'plugins/ecommerce/shipping', 'methods.default', 'Default', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2861, 0, 'en', 'plugins/ecommerce/shipping', 'statuses.not_approved', 'Not approved', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2862, 0, 'en', 'plugins/ecommerce/shipping', 'statuses.approved', 'Approved', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2863, 0, 'en', 'plugins/ecommerce/shipping', 'statuses.picking', 'Picking', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2864, 0, 'en', 'plugins/ecommerce/shipping', 'statuses.delay_picking', 'Delay picking', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2865, 0, 'en', 'plugins/ecommerce/shipping', 'statuses.picked', 'Picked', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2866, 0, 'en', 'plugins/ecommerce/shipping', 'statuses.not_picked', 'Not picked', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2867, 0, 'en', 'plugins/ecommerce/shipping', 'statuses.delivering', 'Delivering', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2868, 0, 'en', 'plugins/ecommerce/shipping', 'statuses.delivered', 'Delivered', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2869, 0, 'en', 'plugins/ecommerce/shipping', 'statuses.not_delivered', 'Not delivered', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2870, 0, 'en', 'plugins/ecommerce/shipping', 'statuses.audited', 'Audited', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2871, 0, 'en', 'plugins/ecommerce/shipping', 'statuses.canceled', 'Canceled', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2872, 0, 'en', 'plugins/ecommerce/shipping', 'cod_statuses.pending', 'Pending', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2873, 0, 'en', 'plugins/ecommerce/shipping', 'cod_statuses.completed', 'Completed', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2874, 0, 'en', 'plugins/ecommerce/shipping', 'delete', 'Delete', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2875, 0, 'en', 'plugins/ecommerce/shipping', 'shipping_rules', 'Shipping Rules', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2876, 0, 'en', 'plugins/ecommerce/shipping', 'shipping_rules_description', 'Rules to calculate shipping fee.', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2877, 0, 'en', 'plugins/ecommerce/shipping', 'select_country', 'Select country', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2878, 0, 'en', 'plugins/ecommerce/shipping', 'add_shipping_rule', 'Add shipping rule', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2879, 0, 'en', 'plugins/ecommerce/shipping', 'delete_shipping_rate', 'Delete shipping rate for area', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2880, 0, 'en', 'plugins/ecommerce/shipping', 'delete_shipping_rate_confirmation', 'Are you sure you want to delete <strong class=\"region-price-item-label\"></strong> from this shipping area?', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2881, 0, 'en', 'plugins/ecommerce/shipping', 'delete_shipping_area', 'Delete shipping area', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2882, 0, 'en', 'plugins/ecommerce/shipping', 'delete_shipping_area_confirmation', 'Are you sure you want to delete shipping area <strong class=\"region-item-label\"></strong>?', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2883, 0, 'en', 'plugins/ecommerce/shipping', 'add_shipping_fee_for_area', 'Add shipping fee for area', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2884, 0, 'en', 'plugins/ecommerce/shipping', 'confirm', 'Confirm', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2885, 0, 'en', 'plugins/ecommerce/shipping', 'save', 'Save', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2886, 0, 'en', 'plugins/ecommerce/shipping', 'greater_than', 'Greater than', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2887, 0, 'en', 'plugins/ecommerce/shipping', 'type', 'Type', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2888, 0, 'en', 'plugins/ecommerce/shipping', 'shipping_rule_name', 'Name of shipping rule', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2889, 0, 'en', 'plugins/ecommerce/shipping', 'shipping_fee', 'Shipping fee', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2890, 0, 'en', 'plugins/ecommerce/shipping', 'cancel', 'Cancel', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2891, 0, 'en', 'plugins/ecommerce/shipping', 'base_on_weight', 'Based on product\'s weight (:unit)', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2892, 0, 'en', 'plugins/ecommerce/shipping', 'base_on_price', 'Based on product\'s price', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2893, 0, 'en', 'plugins/ecommerce/shipping', 'shipment_canceled', 'Shipment was canceled', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2894, 0, 'en', 'plugins/ecommerce/shipping', 'at', 'At', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2895, 0, 'en', 'plugins/ecommerce/shipping', 'cash_on_delivery', 'Cash on delivery (COD)', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2896, 0, 'en', 'plugins/ecommerce/shipping', 'update_shipping_status', 'Update shipping status', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2897, 0, 'en', 'plugins/ecommerce/shipping', 'update_cod_status', 'Update COD status', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2898, 0, 'en', 'plugins/ecommerce/shipping', 'history', 'History', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2899, 0, 'en', 'plugins/ecommerce/shipping', 'shipment_information', 'Shipment information', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2900, 0, 'en', 'plugins/ecommerce/shipping', 'order_number', 'Order number', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2901, 0, 'en', 'plugins/ecommerce/shipping', 'shipping_method', 'Shipping method', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2902, 0, 'en', 'plugins/ecommerce/shipping', 'select_shipping_method', 'Select shipping method', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2903, 0, 'en', 'plugins/ecommerce/shipping', 'cod_status', 'COD status', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2904, 0, 'en', 'plugins/ecommerce/shipping', 'shipping_status', 'Shipping status', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2905, 0, 'en', 'plugins/ecommerce/shipping', 'customer_information', 'Customer information', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2906, 0, 'en', 'plugins/ecommerce/shipping', 'sku', 'SKU', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2907, 0, 'en', 'plugins/ecommerce/shipping', 'change_status_confirm_title', 'Confirm <span class=\"shipment-status-label\"></span> ?', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2908, 0, 'en', 'plugins/ecommerce/shipping', 'change_status_confirm_description', 'Are you sure you want to confirm <span class=\"shipment-status-label\"></span> for this shipment?', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2909, 0, 'en', 'plugins/ecommerce/shipping', 'accept', 'Accept', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2910, 0, 'en', 'plugins/ecommerce/shipping', 'weight_unit', 'Weight (:unit)', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2911, 0, 'en', 'plugins/ecommerce/shipping', 'updated_at', 'Last Update', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2912, 0, 'en', 'plugins/ecommerce/shipping', 'cod_amount', 'Cash on delivery amount (COD)', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2913, 0, 'en', 'plugins/ecommerce/shipping', 'cancel_shipping', 'Cancel shipping', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2914, 0, 'en', 'plugins/ecommerce/shipping', 'shipping_address', 'Shipping address', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2915, 0, 'en', 'plugins/ecommerce/shipping', 'packages', 'Packages', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2916, 0, 'en', 'plugins/ecommerce/shipping', 'edit', 'Edit', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2917, 0, 'en', 'plugins/ecommerce/shipping', 'fee', 'Fee', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2918, 0, 'en', 'plugins/ecommerce/shipping', 'note', 'Note', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2919, 0, 'en', 'plugins/ecommerce/shipping', 'finish', 'Finish', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2920, 0, 'en', 'plugins/ecommerce/shipping', 'shipping_fee_cod', 'Shipping fee/COD', '2021-08-18 04:43:49', '2021-08-18 04:44:12'),
(2921, 0, 'en', 'plugins/ecommerce/shipping', 'send_confirmation_email_to_customer', 'Send confirmation email to customer', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2922, 0, 'en', 'plugins/ecommerce/shipping', 'form_name', 'Name', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2923, 0, 'en', 'plugins/ecommerce/shipping', 'changed_shipping_status', 'Changed status of shipping to : :status . Updated by: %user_name%', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2924, 0, 'en', 'plugins/ecommerce/shipping', 'order_confirmed_by', 'Order confirmed by %user_name%', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2925, 0, 'en', 'plugins/ecommerce/shipping', 'shipping_canceled_by', 'Shipping is cancelled by %user_name%', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2926, 0, 'en', 'plugins/ecommerce/shipping', 'update_shipping_status_success', 'Update shipping status successfully!', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2927, 0, 'en', 'plugins/ecommerce/shipping', 'update_cod_status_success', 'Updated COD status of shipping successfully!', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2928, 0, 'en', 'plugins/ecommerce/shipping', 'updated_cod_status_by', 'Updated COD status to :status . Updated by: %user_name%', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2929, 0, 'en', 'plugins/ecommerce/shipping', 'all', 'All', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2930, 0, 'en', 'plugins/ecommerce/shipping', 'error_when_adding_new_region', 'There is an error when adding new region!', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2931, 0, 'en', 'plugins/ecommerce/shipping', 'delivery', 'Delivery', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2932, 0, 'en', 'plugins/ecommerce/shipping', 'adjustment_price_of', 'Adjustment price of :key', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2933, 0, 'en', 'plugins/ecommerce/store-locator', 'name', 'Store locators', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2934, 0, 'en', 'plugins/ecommerce/store-locator', 'description', 'This address will appear on your invoice and will be used to calculate your shipping price.', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2935, 0, 'en', 'plugins/ecommerce/store-locator', 'shop_name', 'Shop name', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2936, 0, 'en', 'plugins/ecommerce/store-locator', 'phone', 'Phone', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2937, 0, 'en', 'plugins/ecommerce/store-locator', 'email', 'Email', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2938, 0, 'en', 'plugins/ecommerce/store-locator', 'state', 'State', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2939, 0, 'en', 'plugins/ecommerce/store-locator', 'city', 'City', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2940, 0, 'en', 'plugins/ecommerce/store-locator', 'country', 'Country', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2941, 0, 'en', 'plugins/ecommerce/store-locator', 'address', 'Address', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2942, 0, 'en', 'plugins/ecommerce/store-locator', 'primary_store_is', 'Primary store is', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2943, 0, 'en', 'plugins/ecommerce/store-locator', 'store_name', 'Store name', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2944, 0, 'en', 'plugins/ecommerce/store-locator', 'select_country', 'Select country...', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2945, 0, 'en', 'plugins/ecommerce/store-locator', 'default_shipping_location', 'Default shipping location', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2946, 0, 'en', 'plugins/ecommerce/store-locator', 'default_store', 'Default store', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2947, 0, 'en', 'plugins/ecommerce/tax', 'name', 'Taxes', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2948, 0, 'en', 'plugins/ecommerce/tax', 'create', 'Create a tax', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2949, 0, 'en', 'plugins/ecommerce/tax', 'edit', 'Edit tax :title', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2950, 0, 'en', 'plugins/ecommerce/tax', 'title', 'Title', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2951, 0, 'en', 'plugins/ecommerce/tax', 'percentage', 'Percentage %', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2952, 0, 'en', 'plugins/ecommerce/tax', 'priority', 'Priority', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2953, 0, 'en', 'plugins/ecommerce/tax', 'select_tax', '-- select --', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2954, 0, 'vi', 'plugins/ecommerce/brands', 'name', 'Thương hiệu', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2955, 0, 'vi', 'plugins/ecommerce/brands', 'create', 'Thêm thương hiệu mới', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2956, 0, 'vi', 'plugins/ecommerce/brands', 'edit', 'Sửa thương hiệu', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2957, 0, 'vi', 'plugins/ecommerce/brands', 'form.name', 'Tên', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2958, 0, 'vi', 'plugins/ecommerce/brands', 'form.name_placeholder', 'Tên thương hiệu (tối đa 255 kí tự)', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2959, 0, 'vi', 'plugins/ecommerce/brands', 'form.description', 'Mô tả', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2960, 0, 'vi', 'plugins/ecommerce/brands', 'form.description_placeholder', 'Mô tả ngắn cho thương hiệu này (tối đa 400 kí tự)', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2961, 0, 'vi', 'plugins/ecommerce/brands', 'form.website', 'Website', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2962, 0, 'vi', 'plugins/ecommerce/brands', 'form.logo', 'Logo', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2963, 0, 'vi', 'plugins/ecommerce/brands', 'form.is_featured', 'Nổi bật?', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2964, 0, 'vi', 'plugins/ecommerce/brands', 'logo', 'Logo', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2965, 0, 'vi', 'plugins/ecommerce/brands', 'website', 'Website', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2966, 0, 'vi', 'plugins/ecommerce/brands', 'notices.no_select', 'Không có bản ghi nào được chọn!', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2967, 0, 'vi', 'plugins/ecommerce/brands', 'notices.update_success_message', 'Cập nhật thành công', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2968, 0, 'vi', 'plugins/ecommerce/brands', 'cannot_delete', 'Xoá không thành công', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2969, 0, 'vi', 'plugins/ecommerce/brands', 'brand_deleted', 'Xoá thương hiệu thành công', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2970, 0, 'vi', 'plugins/ecommerce/brands', 'menu', 'Thương hiệu', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2971, 0, 'vi', 'plugins/ecommerce/brands', 'intro.title', 'Quản lý danh sách thương hiệu', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2972, 0, 'vi', 'plugins/ecommerce/brands', 'intro.description', 'Các thương hiệu của sản phẩm như Nike, Adidas, Bitis ...', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2973, 0, 'vi', 'plugins/ecommerce/brands', 'intro.button_text', 'Tạo thương hiệu', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2995, 0, 'vi', 'plugins/ecommerce/currency', 'currencies', 'Tiền tệ', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2996, 0, 'vi', 'plugins/ecommerce/currency', 'setting_description', 'Các loại tiền tệ được sử dụng trên website.', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2997, 0, 'vi', 'plugins/ecommerce/currency', 'name', 'Tên', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2998, 0, 'vi', 'plugins/ecommerce/currency', 'symbol', 'Ký hiệu', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(2999, 0, 'vi', 'plugins/ecommerce/currency', 'number_of_decimals', 'Số thập phân', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3000, 0, 'vi', 'plugins/ecommerce/currency', 'exchange_rate', 'Tỷ giá', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3001, 0, 'vi', 'plugins/ecommerce/currency', 'is_prefix_symbol', 'Vị trí ký hiệu', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3002, 0, 'vi', 'plugins/ecommerce/currency', 'is_default', 'Mặc định?', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3003, 0, 'vi', 'plugins/ecommerce/currency', 'remove', 'Xoá', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3004, 0, 'vi', 'plugins/ecommerce/currency', 'new_currency', 'Thêm tiền tệ mới', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3005, 0, 'vi', 'plugins/ecommerce/currency', 'save_settings', 'Lưu cài đặt', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3006, 0, 'vi', 'plugins/ecommerce/currency', 'before_number', 'Trước số', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3007, 0, 'vi', 'plugins/ecommerce/currency', 'after_number', 'Sau số', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3008, 0, 'vi', 'plugins/ecommerce/customer', 'name', 'Khách hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3009, 0, 'vi', 'plugins/ecommerce/customer', 'create', 'Create a customer', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3010, 0, 'vi', 'plugins/ecommerce/customer', 'edit', 'Edit customer \":name\"', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3011, 0, 'vi', 'plugins/ecommerce/customer', 'email', 'Email', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3012, 0, 'vi', 'plugins/ecommerce/customer', 'email_placeholder', 'Ex: example@gmail.com', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3013, 0, 'vi', 'plugins/ecommerce/customer', 'password', 'Password', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3014, 0, 'vi', 'plugins/ecommerce/customer', 'change_password', 'Change password?', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3015, 0, 'vi', 'plugins/ecommerce/customer', 'password_confirmation', 'Password confirmation', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3016, 0, 'vi', 'plugins/ecommerce/customer', 'intro.title', 'Quản lý danh sách khách hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3017, 0, 'vi', 'plugins/ecommerce/customer', 'intro.description', 'Khi khách hàng đặt hàng, bạn sẽ biết được thông tin và lịch sử mua hàng của khách hàng.', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3018, 0, 'vi', 'plugins/ecommerce/customer', 'intro.button_text', 'Tạo khách hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3019, 0, 'vi', 'plugins/ecommerce/discount', 'name', 'Khuyến mãi', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3020, 0, 'vi', 'plugins/ecommerce/discount', 'invalid_coupon', 'Mã khuyến mãi không hợp lệ hoặc đã hết hạn!', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3021, 0, 'vi', 'plugins/ecommerce/discount', 'cannot_use_same_time_with_other_discount_program', 'Mã khuyến mãi này không thể sử dụng chung với chương trình khuyến mãi!', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3022, 0, 'vi', 'plugins/ecommerce/discount', 'not_used', 'Chưa sử dụng mã giảm giá này', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3023, 0, 'vi', 'plugins/ecommerce/discount', 'detail', 'Detail', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3024, 0, 'vi', 'plugins/ecommerce/discount', 'used', 'Used', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3025, 0, 'vi', 'plugins/ecommerce/discount', 'start_date', 'Start date', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3026, 0, 'vi', 'plugins/ecommerce/discount', 'end_date', 'End date', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3027, 0, 'vi', 'plugins/ecommerce/discount', 'intro.title', 'Chương trình khuyến mãi', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3028, 0, 'vi', 'plugins/ecommerce/discount', 'intro.description', 'Tạo ra các mã coupon, cài đặt một sản phẩm, hoặc một nhóm sản phẩm khuyến mãi dành cho các khách hàng thân thiết của bạn.', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3029, 0, 'vi', 'plugins/ecommerce/discount', 'intro.button_text', 'Tạo khuyến mãi', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3030, 0, 'vi', 'plugins/ecommerce/ecommerce', 'settings', 'Cài đặt', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3031, 0, 'vi', 'plugins/ecommerce/ecommerce', 'name', 'Thương mại điện tử', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3032, 0, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.title', 'E-commerce', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3033, 0, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.description', 'Ecommerce email config', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3034, 0, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_subject', 'Subject of order confirmation email', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3035, 0, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_subject_placeholder', 'The subject of email confirmation send to the customer', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3036, 0, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_content', 'Content of order confirmation email', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3037, 0, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_subject', 'Subject of email when changing order\'s status', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3038, 0, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_subject_placeholder', 'Subject of email when changing order\'s status send to customer', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3039, 0, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_content', 'Content of email when changing order\'s status', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3040, 0, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.from_email', 'Email from', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3041, 0, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.from_email_placeholder', 'Email from address to display in mail. Ex: example@gmail.com', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3042, 0, 'vi', 'plugins/ecommerce/ecommerce', 'store_address', 'Địa chỉ cửa hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3043, 0, 'vi', 'plugins/ecommerce/ecommerce', 'store_phone', 'Số điện thoại cửa hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3044, 0, 'vi', 'plugins/ecommerce/ecommerce', 'order_id', 'Mã đơn hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3045, 0, 'vi', 'plugins/ecommerce/ecommerce', 'order_token', 'Chuỗi mã hoá đơn hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3046, 0, 'vi', 'plugins/ecommerce/ecommerce', 'customer_name', 'Tên khách hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3047, 0, 'vi', 'plugins/ecommerce/ecommerce', 'customer_email', 'Email khách hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3048, 0, 'vi', 'plugins/ecommerce/ecommerce', 'customer_phone', 'Số điện thoại khách hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3049, 0, 'vi', 'plugins/ecommerce/ecommerce', 'customer_address', 'Địa chỉ khách hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3050, 0, 'vi', 'plugins/ecommerce/ecommerce', 'product_list', 'Danh sách sản phẩm trong đơn hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3051, 0, 'vi', 'plugins/ecommerce/ecommerce', 'payment_detail', 'Chi tiết thanh toán', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3052, 0, 'vi', 'plugins/ecommerce/ecommerce', 'shipping_method', 'Phương thức vận chuyển', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3053, 0, 'vi', 'plugins/ecommerce/ecommerce', 'payment_method', 'Phương thức thanh toán', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3054, 0, 'vi', 'plugins/ecommerce/ecommerce', 'standard_and_format', 'Tiêu chuẩn & Định dạng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3055, 0, 'vi', 'plugins/ecommerce/ecommerce', 'standard_and_format_description', 'Các tiêu chuẩn và các định dạng được sử dụng để tính toán những thứ như giá cả sản phẩm, trọng lượng vận chuyển và thời gian đơn hàng được đặt.', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3056, 0, 'vi', 'plugins/ecommerce/ecommerce', 'change_order_format', 'Chỉnh sửa định dạng mã đơn hàng (tùy chọn)', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3057, 0, 'vi', 'plugins/ecommerce/ecommerce', 'change_order_format_description', 'Mã đơn hàng mặc định bắt đầu từ :number. Bạn có thể thay đổi chuỗi bắt đầu hoặc kết thúc để tạo mã đơn hàng theo ý bạn, ví dụ \"DH-:number\" hoặc \":number-A\"', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3058, 0, 'vi', 'plugins/ecommerce/ecommerce', 'start_with', 'Bắt đầu bằng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3059, 0, 'vi', 'plugins/ecommerce/ecommerce', 'end_with', 'Kết thúc bằng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3060, 0, 'vi', 'plugins/ecommerce/ecommerce', 'order_will_be_shown', 'Mã đơn hàng của bạn sẽ hiển thị theo mẫu', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3061, 0, 'vi', 'plugins/ecommerce/ecommerce', 'weight_unit', 'Đơn vị cân nặng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3062, 0, 'vi', 'plugins/ecommerce/ecommerce', 'height_unit', 'Đơn vị chiều dài/chiều cao', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3063, 0, 'vi', 'plugins/ecommerce/email', 'customer_new_order_title', 'Xác nhận đơn hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3064, 0, 'vi', 'plugins/ecommerce/email', 'customer_new_order_description', 'Được gửi khi khách hàng tạo đơn hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3065, 0, 'vi', 'plugins/ecommerce/email', 'order_cancellation_title', 'Hủy đơn hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3066, 0, 'vi', 'plugins/ecommerce/email', 'order_cancellation_description', 'Được gửi khi khách hàng hủy đơn hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3067, 0, 'vi', 'plugins/ecommerce/email', 'delivery_confirmation_title', 'Xác nhận giao hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3068, 0, 'vi', 'plugins/ecommerce/email', 'delivery_confirmation_description', 'Được gửi đến khách hàng khi bắt đầu giao hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3069, 0, 'vi', 'plugins/ecommerce/email', 'admin_new_order_title', 'Thông báo có đơn hàng mới', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3070, 0, 'vi', 'plugins/ecommerce/email', 'admin_new_order_description', 'Được gửi cho quản trị viên khi có khách mua hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3071, 0, 'vi', 'plugins/ecommerce/email', 'order_confirmation_title', 'Xác nhận đơn hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3072, 0, 'vi', 'plugins/ecommerce/email', 'order_confirmation_description', 'Email được gửi đến khách hàng khi đơn hàng xác nhận', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3073, 0, 'vi', 'plugins/ecommerce/email', 'payment_confirmation_title', 'Xác nhận thanh toán', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3074, 0, 'vi', 'plugins/ecommerce/email', 'payment_confirmation_description', 'Email được gửi đến khách hàng khi đơn hàng xác nhận thanh toán', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3075, 0, 'vi', 'plugins/ecommerce/email', 'order_recover_title', 'Đơn hàng đang chờ hoàn tất', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3076, 0, 'vi', 'plugins/ecommerce/email', 'order_recover_description', 'Email nhắc nhở khách hàng hoàn tất đơn hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3077, 0, 'vi', 'plugins/ecommerce/email', 'link_go_to_our_shop', 'hoặc <a href=\":link\">Truy cập website</a>', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3078, 0, 'vi', 'plugins/ecommerce/email', 'order_information', 'Thông tin đơn hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3079, 0, 'vi', 'plugins/ecommerce/email', 'order_number', 'Mã đơn hàng: <strong>:order_id</strong>', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3080, 0, 'vi', 'plugins/ecommerce/email', 'view_order', 'Xem đơn hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3081, 0, 'vi', 'plugins/ecommerce/order', 'statuses.pending', 'Chưa xử lý', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3082, 0, 'vi', 'plugins/ecommerce/order', 'statuses.processing', 'Đang xử lý', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3083, 0, 'vi', 'plugins/ecommerce/order', 'statuses.delivering', 'Đang giao hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(3084, 0, 'vi', 'plugins/ecommerce/order', 'statuses.delivered', 'Đã giao hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3085, 0, 'vi', 'plugins/ecommerce/order', 'statuses.completed', 'Hoàn thành', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3086, 0, 'vi', 'plugins/ecommerce/order', 'statuses.canceled', 'Bị huỷ', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3087, 0, 'vi', 'plugins/ecommerce/order', 'name', 'Đơn hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3090, 0, 'vi', 'plugins/ecommerce/order', 'incomplete_order', 'Đơn hàng chưa hoàn tất', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3091, 0, 'vi', 'plugins/ecommerce/order', 'order_id', 'Mã đơn hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3092, 0, 'vi', 'plugins/ecommerce/order', 'customer_label', 'Khách hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3093, 0, 'vi', 'plugins/ecommerce/order', 'amount', 'Tổng cộng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3094, 0, 'vi', 'plugins/ecommerce/order', 'shipping_amount', 'Phí vận chuyển', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3095, 0, 'vi', 'plugins/ecommerce/order', 'payment_method', 'Phương thức thanh toán', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3096, 0, 'vi', 'plugins/ecommerce/order', 'payment_status_label', 'Trạng thái thanh toán', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3097, 0, 'vi', 'plugins/ecommerce/order', 'manage_orders', 'Quản lý đơn hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3098, 0, 'vi', 'plugins/ecommerce/order', 'order_intro_description', 'Một khi cửa hàng của bạn có đơn đặt hàng, đây sẽ là nơi bạn xử lý và theo dõi những đơn đặt hàng đó.', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3099, 0, 'vi', 'plugins/ecommerce/order', 'create_new_order', 'Tạo đơn hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3100, 0, 'vi', 'plugins/ecommerce/order', 'manage_incomplete_orders', 'Quản lý đơn hàng chưa hoàn tất', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3101, 0, 'vi', 'plugins/ecommerce/order', 'incomplete_orders_intro_description', 'Đơn hàng chưa hoàn tất là đơn hàng được tạo khi khách hàng thêm sản phẩm vào giỏ hàng, tiến hành điền thông tin mua hàng nhưng không hoàn tất quá trình thanh toán.', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3102, 0, 'vi', 'plugins/ecommerce/order', 'cannot_send_order_recover_to_mail', 'Không tìm thấy email nên không thể gửi email khôi phục cho khách hàng.', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3103, 0, 'vi', 'plugins/ecommerce/payment', 'name', 'Thanh toán', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3104, 0, 'vi', 'plugins/ecommerce/payment', 'payment_method', 'Phương thức thanh toán', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3105, 0, 'vi', 'plugins/ecommerce/payment', 'view_payment', 'Xem thanh toán #', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3106, 0, 'vi', 'plugins/ecommerce/payment', 'charge_id', 'Mã giao dịch', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3107, 0, 'vi', 'plugins/ecommerce/payment', 'amount', 'Số tiền', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3108, 0, 'vi', 'plugins/ecommerce/payment', 'currency', 'Đơn vị tiền tệ', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3109, 0, 'vi', 'plugins/ecommerce/payment', 'user', 'Người dùng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3110, 0, 'vi', 'plugins/ecommerce/payment', 'paypal_name_required', 'Tên của phương thức PayPal là bắt buộc!', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3111, 0, 'vi', 'plugins/ecommerce/payment', 'paypal_name_max', 'Tên của phương thức PayPal quá dài!', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3112, 0, 'vi', 'plugins/ecommerce/payment', 'stripe_name_required', 'Tên của phương thức Stripe là bắt buộc!', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3113, 0, 'vi', 'plugins/ecommerce/payment', 'stripe_name_max', 'Tên của phương thức Stripe quá dài!', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3114, 0, 'vi', 'plugins/ecommerce/payment', 'status', 'Trạng thái', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3115, 0, 'vi', 'plugins/ecommerce/payment', 'enabled', 'Bật', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3116, 0, 'vi', 'plugins/ecommerce/payment', 'disabled', 'Tắt', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3117, 0, 'vi', 'plugins/ecommerce/payment', 'client_id', 'Client ID', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3118, 0, 'vi', 'plugins/ecommerce/payment', 'client_secret', 'Client Secret', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3119, 0, 'vi', 'plugins/ecommerce/payment', 'mode', 'Chế độ', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3120, 0, 'vi', 'plugins/ecommerce/payment', 'sandbox', 'Sandbox', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3121, 0, 'vi', 'plugins/ecommerce/payment', 'live', 'Live', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3122, 0, 'vi', 'plugins/ecommerce/payment', 'enable_payment_log', 'Bật lưu nhật ký thanh toán', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3123, 0, 'vi', 'plugins/ecommerce/payment', 'yes', 'Có', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3124, 0, 'vi', 'plugins/ecommerce/payment', 'no', 'Không', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3125, 0, 'vi', 'plugins/ecommerce/payment', 'client_key', 'Client Key', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3126, 0, 'vi', 'plugins/ecommerce/payment', 'stripe', 'Stripe', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3127, 0, 'vi', 'plugins/ecommerce/payment', 'paypal', 'PayPal', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3128, 0, 'vi', 'plugins/ecommerce/payment', 'action', 'Hành động', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3129, 0, 'vi', 'plugins/ecommerce/payment', 'go_back', 'Quay lại', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3130, 0, 'vi', 'plugins/ecommerce/payment', 'view', 'Xem', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3131, 0, 'vi', 'plugins/ecommerce/payment', 'cash_on_delivery', 'Thanh toán khi nhận hàng (COD)', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3132, 0, 'vi', 'plugins/ecommerce/payment', 'via_bank_transfer', 'Thông qua chuyển khoản ngân hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3133, 0, 'vi', 'plugins/ecommerce/payment', 'payment_via_cart', 'Thanh toán bằng thẻ', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3134, 0, 'vi', 'plugins/ecommerce/payment', 'card_number', 'Số thẻ', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3135, 0, 'vi', 'plugins/ecommerce/payment', 'full_name', 'Tên trên thẻ', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3136, 0, 'vi', 'plugins/ecommerce/payment', 'payment_via_paypal', 'Thanh toán thông qua PayPal', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3137, 0, 'vi', 'plugins/ecommerce/payment', 'mm_yy', 'MM/YY', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3138, 0, 'vi', 'plugins/ecommerce/payment', 'cvc', 'CVC', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3139, 0, 'vi', 'plugins/ecommerce/payment', 'details', 'Chi tiết', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3140, 0, 'vi', 'plugins/ecommerce/payment', 'payer_name', 'Người thanh toán', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3141, 0, 'vi', 'plugins/ecommerce/payment', 'email', 'Địa chỉ email', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3142, 0, 'vi', 'plugins/ecommerce/payment', 'phone', 'Điện thoại', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3143, 0, 'vi', 'plugins/ecommerce/payment', 'country', 'Quốc gia', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3144, 0, 'vi', 'plugins/ecommerce/payment', 'shipping_address', 'Địa chỉ giao hàng', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3145, 0, 'vi', 'plugins/ecommerce/payment', 'payment_details', 'Chi tiết giao dịch', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3146, 0, 'vi', 'plugins/ecommerce/payment', 'card', 'Thẻ', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3147, 0, 'vi', 'plugins/ecommerce/payment', 'address', 'Địa chỉ', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3148, 0, 'vi', 'plugins/ecommerce/payment', 'could_not_get_stripe_token', 'Không thể lấy mã Stripe để thanh toán', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3149, 0, 'vi', 'plugins/ecommerce/payment', 'new_payment', 'Thanh toán cho đơn hàng :id', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3150, 0, 'vi', 'plugins/ecommerce/payment', 'payment_id', 'Mã thanh toán', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3151, 0, 'vi', 'plugins/ecommerce/prices', 'name', 'Price', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3152, 0, 'vi', 'plugins/ecommerce/prices', 'create', 'New price', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3153, 0, 'vi', 'plugins/ecommerce/prices', 'edit', 'Edit price', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3154, 0, 'vi', 'plugins/ecommerce/prices', 'list', 'List price', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3155, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'name', 'Product attribute sets', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3156, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'create', 'New product attribute set', '2021-08-18 04:43:50', '2021-08-18 04:44:12'),
(3157, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'edit', 'Edit product attribute set', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3158, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'visible_in_categories', 'Visible in categories', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3159, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'product_with_more_version', 'Product with more version', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3160, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'create_a_version', 'Create a version', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3161, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'enabled', 'Enabled', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3162, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'attributes', 'Attributes', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3163, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'price', 'Price', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3164, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'edit_btn', 'Edit', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3165, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'remove_btn', 'Remove', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3166, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'product', 'Product', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3167, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'back_to_product', 'Back to product', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3168, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'save', 'Save', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3169, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'other_existing_versions', 'Other existing versions', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3170, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'version_information', 'Version information', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3171, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'add_rule', 'Add rule', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3172, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'rules', 'Rules', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3173, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'pricing', 'Pricing', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3174, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'sale_price', 'Sale price', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3175, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'sale_type', 'Sale type', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3176, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'no_sale_price', 'No sale price', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3177, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'always_on_sale', 'Always on sale', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3178, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'limited_time', 'Limited time', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3179, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'from', 'From', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3180, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'to', 'To', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3181, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'storehouse', 'Storehouse', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3182, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'no_storehouse_management', 'No storehouse management', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3183, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'with_storehouse_management', 'With storehouse management', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3184, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'quantity', 'Quantity', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3185, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'allow_customer_checkout_out_of_stock', 'Allow customer checkout when this product out of stock', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3186, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'shipping', 'Shipping', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3187, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'length', 'Length', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3188, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'wide', 'Wide', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3189, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'height', 'Height', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3190, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'weight', 'Weight', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3191, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'version_images', 'Version images', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3192, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'add_new_image', 'Add new image', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3193, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'attribute_set', 'Attribute set', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3194, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'value', 'Value', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3195, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'dropdown_swatch', 'Dropdown Swatch', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3196, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'visual_swatch', 'Visual Swatch', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3197, 0, 'vi', 'plugins/ecommerce/product-attribute-sets', 'text_swatch', 'Text Swatch', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3198, 0, 'vi', 'plugins/ecommerce/product-attributes', 'name', 'Thuộc tính sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3199, 0, 'vi', 'plugins/ecommerce/product-attributes', 'create', 'Tạo', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3200, 0, 'vi', 'plugins/ecommerce/product-attributes', 'edit', 'Sửa', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3201, 0, 'vi', 'plugins/ecommerce/product-attributes', 'intro.title', 'Quản lý danh sách thuộc tính sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3202, 0, 'vi', 'plugins/ecommerce/product-attributes', 'intro.description', 'Các thuộc tính của sản phẩm như màu sắc, kích thước ...', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3203, 0, 'vi', 'plugins/ecommerce/product-attributes', 'intro.button_text', 'Tạo thuộc tính sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3204, 0, 'vi', 'plugins/ecommerce/product-categories', 'create', 'Create new product category', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3205, 0, 'vi', 'plugins/ecommerce/product-categories', 'edit', 'Edit product category', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3206, 0, 'vi', 'plugins/ecommerce/product-categories', 'name', 'Danh mục sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3207, 0, 'vi', 'plugins/ecommerce/product-categories', 'none', 'Không có', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3208, 0, 'vi', 'plugins/ecommerce/product-categories', 'menu', 'Danh mục sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3209, 0, 'vi', 'plugins/ecommerce/product-categories', 'intro.title', 'Quản lý danh sách danh mục sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3210, 0, 'vi', 'plugins/ecommerce/product-categories', 'intro.description', 'Danh mục sản phẩm như quần áo, giày dép, linh kiện điện tử ...', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3211, 0, 'vi', 'plugins/ecommerce/product-categories', 'intro.button_text', 'Tạo danh mục sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3212, 0, 'vi', 'plugins/ecommerce/product-categories', 'total_products', 'Tổng sản phẩm: :total', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3213, 0, 'vi', 'plugins/ecommerce/product-collections', 'name', 'Nhóm sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3214, 0, 'vi', 'plugins/ecommerce/product-collections', 'create', 'Thêm nhóm sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3215, 0, 'vi', 'plugins/ecommerce/product-collections', 'edit', 'Sửa nhóm sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3216, 0, 'vi', 'plugins/ecommerce/product-collections', 'slug_help_block', 'Label key: <code>:slug</code>. We will use this key for filter.', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3217, 0, 'vi', 'plugins/ecommerce/product-collections', 'intro.title', 'Quản lý nhóm sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3218, 0, 'vi', 'plugins/ecommerce/product-collections', 'intro.description', 'Nhóm sản phẩm giúp quản lý sản phẩm và khách hàng tìm kiếm sản phẩm một cách dễ dàng.', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3219, 0, 'vi', 'plugins/ecommerce/product-collections', 'intro.button_text', 'Tạo nhóm sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3220, 0, 'vi', 'plugins/ecommerce/products', 'name', 'Sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3221, 0, 'vi', 'plugins/ecommerce/products', 'create', 'Thêm sản phẩm mới', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3222, 0, 'vi', 'plugins/ecommerce/products', 'edit', 'Sửa sản phẩm - :name', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3223, 0, 'vi', 'plugins/ecommerce/products', 'form.name', 'Tên sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3224, 0, 'vi', 'plugins/ecommerce/products', 'form.name_placeholder', 'Tên sản phẩm (Tối đa 120 chữ cái)', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3225, 0, 'vi', 'plugins/ecommerce/products', 'form.description', 'Mô tả ngắn', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3226, 0, 'vi', 'plugins/ecommerce/products', 'form.description_placeholder', 'Mô tả ngắn gọn cho sản phẩm (Tối đa 400 chữ cái)', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3227, 0, 'vi', 'plugins/ecommerce/products', 'form.categories', 'Danh mục', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3228, 0, 'vi', 'plugins/ecommerce/products', 'form.content', 'Chi tiết sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3229, 0, 'vi', 'plugins/ecommerce/products', 'form.price', 'Giá cơ bản', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3230, 0, 'vi', 'plugins/ecommerce/products', 'form.price_sale', 'Giá giảm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3231, 0, 'vi', 'plugins/ecommerce/products', 'form.quantity', 'Số lượng', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3232, 0, 'vi', 'plugins/ecommerce/products', 'form.brand', 'Thương hiệu', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3233, 0, 'vi', 'plugins/ecommerce/products', 'form.width', 'Rộng', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3234, 0, 'vi', 'plugins/ecommerce/products', 'form.height', 'Cao', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3235, 0, 'vi', 'plugins/ecommerce/products', 'form.weight', 'Cân nặng', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3236, 0, 'vi', 'plugins/ecommerce/products', 'form.image', 'Hình ảnh', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3237, 0, 'vi', 'plugins/ecommerce/products', 'form.product_type.title', 'Loại sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3238, 0, 'vi', 'plugins/ecommerce/products', 'form.stock.title', 'Tình trạng kho', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3239, 0, 'vi', 'plugins/ecommerce/products', 'form.stock.in_stock', 'Còn hàng', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3240, 0, 'vi', 'plugins/ecommerce/products', 'form.stock.out_stock', 'Hết hàng', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3241, 0, 'vi', 'plugins/ecommerce/products', 'form.stock.allow_order_when_out', 'Cho phép đặt hàng khi hết', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3242, 0, 'vi', 'plugins/ecommerce/products', 'form.storehouse.title', 'Quản lý kho', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3243, 0, 'vi', 'plugins/ecommerce/products', 'form.storehouse.no_storehouse', 'Không quản lý kho', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3244, 0, 'vi', 'plugins/ecommerce/products', 'form.storehouse.storehouse', 'Quản lý kho', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3245, 0, 'vi', 'plugins/ecommerce/products', 'form.storehouse.quantity', 'Số lượng', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3246, 0, 'vi', 'plugins/ecommerce/products', 'form.shipping.title', 'Giao hàng', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3247, 0, 'vi', 'plugins/ecommerce/products', 'form.shipping.length', 'Chiều dài', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3248, 0, 'vi', 'plugins/ecommerce/products', 'form.shipping.wide', 'Chiều rộng', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3249, 0, 'vi', 'plugins/ecommerce/products', 'form.shipping.height', 'Chiều cao', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3250, 0, 'vi', 'plugins/ecommerce/products', 'form.shipping.weight', 'Cân nặng', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3251, 0, 'vi', 'plugins/ecommerce/products', 'form.date.start', 'Ngày bắt đầu', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3252, 0, 'vi', 'plugins/ecommerce/products', 'form.date.end', 'Ngày kết thúc', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3253, 0, 'vi', 'plugins/ecommerce/products', 'form.tags', 'Nhãn', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3254, 0, 'vi', 'plugins/ecommerce/products', 'form.tax', 'Thuế', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3255, 0, 'vi', 'plugins/ecommerce/products', 'price', 'Giá cơ bản', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3256, 0, 'vi', 'plugins/ecommerce/products', 'price_sale', 'Giá giảm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3257, 0, 'vi', 'plugins/ecommerce/products', 'quantity', 'Số lượng', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3258, 0, 'vi', 'plugins/ecommerce/products', 'type', 'Loại sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3259, 0, 'vi', 'plugins/ecommerce/products', 'image', 'Ảnh', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3260, 0, 'vi', 'plugins/ecommerce/products', 'sku', 'Mã sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3261, 0, 'vi', 'plugins/ecommerce/products', 'brand', 'Thương hiệu', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3262, 0, 'vi', 'plugins/ecommerce/products', 'cannot_delete', 'Product could not be deleted', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3263, 0, 'vi', 'plugins/ecommerce/products', 'product_deleted', 'Product deleted', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3264, 0, 'vi', 'plugins/ecommerce/products', 'products', 'Sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3265, 0, 'vi', 'plugins/ecommerce/products', 'menu', 'Sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3266, 0, 'vi', 'plugins/ecommerce/products', 'control.button_add_image', 'Thêm hình ảnh', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3267, 0, 'vi', 'plugins/ecommerce/products', 'overview', 'Tổng quan', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3268, 0, 'vi', 'plugins/ecommerce/products', 'attributes', 'Thuộc tính', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3269, 0, 'vi', 'plugins/ecommerce/products', 'product_has_variations', 'Sản phẩm có nhiều phiên bản', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3270, 0, 'vi', 'plugins/ecommerce/products', 'manage_products', 'Quản lý danh sách sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3271, 0, 'vi', 'plugins/ecommerce/products', 'add_new_product', 'Tạo sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3272, 0, 'vi', 'plugins/ecommerce/products', 'start_by_adding_new_product', 'Bắt đầu bán hàng bằng việc thêm sản phẩm.', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3273, 0, 'vi', 'plugins/ecommerce/reports', 'name', 'Báo cáo', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3274, 0, 'vi', 'plugins/ecommerce/reports', 'widget.order.title', 'Đơn hàng', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3275, 0, 'vi', 'plugins/ecommerce/reports', 'count.revenue', 'Doanh thu hôm nay', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3276, 0, 'vi', 'plugins/ecommerce/reports', 'count.orders', 'Đơn hàng hôm nay', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3277, 0, 'vi', 'plugins/ecommerce/reports', 'count.products', 'Sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3278, 0, 'vi', 'plugins/ecommerce/reports', 'count.customers', 'Khách hàng', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3279, 0, 'vi', 'plugins/ecommerce/reports', 'product_name', 'Tên sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3280, 0, 'vi', 'plugins/ecommerce/reports', 'quantity', 'Số lượng', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3281, 0, 'vi', 'plugins/ecommerce/reports', 'revenue_statistics', 'Thống kê doanh thu', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3282, 0, 'vi', 'plugins/ecommerce/reports', 'top_selling_products', 'Sản phẩm bán chạy trong tháng', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3283, 0, 'vi', 'plugins/ecommerce/review', 'name', 'Đánh giá', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3284, 0, 'vi', 'plugins/ecommerce/review', 'list_review', 'Khách hàng đánh giá', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3285, 0, 'vi', 'plugins/ecommerce/review', 'add_review', 'Thêm đánh giá', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3286, 0, 'vi', 'plugins/ecommerce/review', 'delete_review', 'Xóa đánh giá', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3287, 0, 'vi', 'plugins/ecommerce/review', 'create_review', 'Tạo đánh giá', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3288, 0, 'vi', 'plugins/ecommerce/review', 'please_select_rating', 'Chọn đánh giá', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3289, 0, 'vi', 'plugins/ecommerce/review', 'comment', 'Bình luận', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3290, 0, 'vi', 'plugins/ecommerce/review', 'approve', 'Chấp thuận', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3291, 0, 'vi', 'plugins/ecommerce/review', 'approved', 'Đã chấp thuận', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3292, 0, 'vi', 'plugins/ecommerce/review', 'disapprove', 'Không chấp thuận', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3293, 0, 'vi', 'plugins/ecommerce/review', 'disapproved', 'Đã không chấp thuận', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3294, 0, 'vi', 'plugins/ecommerce/review', 'product', 'Sản phẩm', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3295, 0, 'vi', 'plugins/ecommerce/review', 'user', 'Người dùng', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3296, 0, 'vi', 'plugins/ecommerce/review', 'star', 'Sao', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3297, 0, 'vi', 'plugins/ecommerce/review', 'status', 'Trạng thái', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3298, 0, 'vi', 'plugins/ecommerce/review', 'intro.title', 'Quản lý danh sách nhận xét của khách hàng', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3299, 0, 'vi', 'plugins/ecommerce/review', 'intro.description', 'Lưu trữ các nhận xét, đánh giá của khách hàng', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3300, 0, 'vi', 'plugins/ecommerce/shipping', 'name', 'Phí vận chuyển', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3301, 0, 'vi', 'plugins/ecommerce/shipping', 'shipping', 'Vận chuyển', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3302, 0, 'vi', 'plugins/ecommerce/shipping', 'title', 'Title', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3303, 0, 'vi', 'plugins/ecommerce/shipping', 'country', 'Quốc gia', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3304, 0, 'vi', 'plugins/ecommerce/shipping', 'state', 'State', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3305, 0, 'vi', 'plugins/ecommerce/shipping', 'city', 'City', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3306, 0, 'vi', 'plugins/ecommerce/shipping', 'amount', 'Amount', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3308, 0, 'vi', 'plugins/ecommerce/shipping', 'enable', 'Enable', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3309, 0, 'vi', 'plugins/ecommerce/shipping', 'enabled', 'Enabled', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3310, 0, 'vi', 'plugins/ecommerce/shipping', 'disable', 'Disable', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3311, 0, 'vi', 'plugins/ecommerce/shipping', 'disabled', 'Disabled', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3312, 0, 'vi', 'plugins/ecommerce/shipping', 'create_shipping', 'Create a shipping', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3313, 0, 'vi', 'plugins/ecommerce/shipping', 'edit_shipping', 'Edit shipping #', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3314, 0, 'vi', 'plugins/ecommerce/shipping', 'status', 'Status', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3315, 0, 'vi', 'plugins/ecommerce/shipping', 'shipping_methods', 'Phương thức vận chuyển', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3316, 0, 'vi', 'plugins/ecommerce/shipping', 'create_shipping_method', 'Tạo phương thức vận chuyển', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3317, 0, 'vi', 'plugins/ecommerce/shipping', 'edit_shipping_method', 'Sửa phương thức vận chuyển', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3318, 0, 'vi', 'plugins/ecommerce/shipping', 'add_shipping_region', 'Thêm khu vực vận chuyển', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3319, 0, 'vi', 'plugins/ecommerce/shipping', 'methods.default', 'Default', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3320, 0, 'vi', 'plugins/ecommerce/shipping', 'statuses.not_approved', 'Not approved', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3321, 0, 'vi', 'plugins/ecommerce/shipping', 'statuses.approved', 'Approved', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3322, 0, 'vi', 'plugins/ecommerce/shipping', 'statuses.picking', 'Picking', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3323, 0, 'vi', 'plugins/ecommerce/shipping', 'statuses.delay_picking', 'Delay picking', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3324, 0, 'vi', 'plugins/ecommerce/shipping', 'statuses.picked', 'Picked', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3325, 0, 'vi', 'plugins/ecommerce/shipping', 'statuses.not_picked', 'Not picked', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3326, 0, 'vi', 'plugins/ecommerce/shipping', 'statuses.delivering', 'Delivering', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3327, 0, 'vi', 'plugins/ecommerce/shipping', 'statuses.delivered', 'Delivered', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3328, 0, 'vi', 'plugins/ecommerce/shipping', 'statuses.not_delivered', 'Not delivered', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3329, 0, 'vi', 'plugins/ecommerce/shipping', 'statuses.audited', 'Audited', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3330, 0, 'vi', 'plugins/ecommerce/shipping', 'statuses.canceled', 'Canceled', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3331, 0, 'vi', 'plugins/ecommerce/shipping', 'cod_statuses.pending', 'Pending', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3332, 0, 'vi', 'plugins/ecommerce/shipping', 'cod_statuses.completed', 'Completed', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3333, 0, 'vi', 'plugins/ecommerce/store-locator', 'name', 'Địa chỉ cửa hàng', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3334, 0, 'vi', 'plugins/ecommerce/store-locator', 'description', 'Địa chỉ này sẽ xuất hiện trên hoá đơn của bạn và sẽ được sử dụng để tính toán mức giá vận chuyển của bạn.', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3335, 0, 'vi', 'plugins/ecommerce/store-locator', 'shop_name', 'Tên cửa hàng', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3336, 0, 'vi', 'plugins/ecommerce/store-locator', 'phone', 'Điện thoại', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3337, 0, 'vi', 'plugins/ecommerce/store-locator', 'address', 'Địa chỉ', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3338, 0, 'vi', 'plugins/ecommerce/tax', 'name', 'Thuế', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3339, 0, 'vi', 'plugins/ecommerce/tax', 'create', 'Create a tax', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3340, 0, 'vi', 'plugins/ecommerce/tax', 'edit', 'Edit tax :title', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3341, 0, 'vi', 'plugins/ecommerce/tax', 'title', 'Title', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3342, 0, 'vi', 'plugins/ecommerce/tax', 'percentage', 'Percentage %', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3343, 0, 'vi', 'plugins/ecommerce/tax', 'priority', 'Priority', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3344, 0, 'vi', 'plugins/ecommerce/tax', 'select_tax', '-- select --', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3345, 0, 'en', 'plugins/faq/faq-category', 'name', 'Categories', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3346, 0, 'en', 'plugins/faq/faq-category', 'create', 'New category', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3347, 0, 'en', 'plugins/faq/faq-category', 'edit', 'Edit category', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3348, 0, 'en', 'plugins/faq/faq', 'name', 'FAQ', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3349, 0, 'en', 'plugins/faq/faq', 'create', 'New faq', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3350, 0, 'en', 'plugins/faq/faq', 'edit', 'Edit faq', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3351, 0, 'en', 'plugins/faq/faq', 'question', 'Question', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3352, 0, 'en', 'plugins/faq/faq', 'answer', 'Answer', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3353, 0, 'en', 'plugins/faq/faq', 'category', 'Category', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3354, 0, 'en', 'plugins/faq/faq', 'all', 'All', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3355, 0, 'en', 'plugins/faq/faq', 'faq_schema_config', 'FAQ schema configuration (:link)', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3356, 0, 'en', 'plugins/faq/faq', 'learn_more', 'Learn more', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3357, 0, 'en', 'plugins/faq/faq', 'settings.title', 'FAQ', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3358, 0, 'en', 'plugins/faq/faq', 'settings.description', 'Settings for FAQ', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3359, 0, 'en', 'plugins/faq/faq', 'settings.enable_faq_schema', 'Enable FAQ Schema?', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3360, 0, 'en', 'plugins/faq/faq', 'settings.enable_faq_schema_description', 'Learn more: https://developers.google.com/search/docs/data-types/faqpage', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3361, 0, 'vi', 'plugins/faq/faq', 'name', 'Câu hỏi thường gặp', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3362, 0, 'vi', 'plugins/faq/faq', 'create', 'Thêm câu hỏi', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3363, 0, 'vi', 'plugins/faq/faq', 'edit', 'Sửa câu hỏi', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3364, 0, 'vi', 'plugins/faq/faq', 'question', 'Câu hỏi', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3365, 0, 'vi', 'plugins/faq/faq', 'answer', 'Trả lời', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3366, 0, 'en', 'plugins/marketplace/marketplace', 'name', 'Marketplace', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3367, 0, 'en', 'plugins/marketplace/marketplace', 'email.store_name', 'Store name', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3368, 0, 'en', 'plugins/marketplace/marketplace', 'email.store_new_order_title', 'Send order to store', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3369, 0, 'en', 'plugins/marketplace/marketplace', 'email.store_new_order_description', 'Send email to store when a customer an order placed', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3370, 0, 'en', 'plugins/marketplace/marketplace', 'current_balance', 'Current balance', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3371, 0, 'en', 'plugins/marketplace/marketplace', 'settings.name', 'Settings', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3372, 0, 'en', 'plugins/marketplace/marketplace', 'settings.title', 'Settings for marketplace', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3373, 0, 'en', 'plugins/marketplace/marketplace', 'settings.description', '...', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3374, 0, 'en', 'plugins/marketplace/marketplace', 'settings.fee_per_order', 'Fee per order (%), suggest: 2 or 3', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3375, 0, 'en', 'plugins/marketplace/marketplace', 'settings.fee_withdrawal', 'Fee withdrawal (Fixed amount)', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3376, 0, 'en', 'plugins/marketplace/marketplace', 'settings.check_valid_signature', 'Check valid signature in vendor\'s earnings', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3377, 0, 'en', 'plugins/marketplace/marketplace', 'theme_options.name', 'Marketplace', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3378, 0, 'en', 'plugins/marketplace/marketplace', 'theme_options.description', 'Theme options for Marketplace', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3379, 0, 'en', 'plugins/marketplace/marketplace', 'theme_options.logo_vendor_dashboard', 'Logo in the vendor dashboard (Default is the main logo)', '2021-08-18 04:43:51', '2021-08-18 04:44:12'),
(3380, 0, 'en', 'plugins/marketplace/order', 'shipping_method_required', 'Shipping method for \":name\" store order is required.', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3381, 0, 'en', 'plugins/marketplace/order', 'shipping_method_in', 'Shipping method for \":name\" store order is invalid.', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3382, 0, 'en', 'plugins/marketplace/order', 'shipping_option_required', 'Shipping option for \":name\" store order is required.', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3383, 0, 'en', 'plugins/marketplace/store', 'name', 'Stores', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3384, 0, 'en', 'plugins/marketplace/store', 'create', 'New store', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3385, 0, 'en', 'plugins/marketplace/store', 'edit', 'Edit store', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3386, 0, 'en', 'plugins/marketplace/store', 'forms.logo', 'Logo', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3387, 0, 'en', 'plugins/marketplace/store', 'forms.email', 'Email', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3388, 0, 'en', 'plugins/marketplace/store', 'forms.email_placeholder', 'Ex: name@store.com', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3389, 0, 'en', 'plugins/marketplace/store', 'forms.phone', 'Phone', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3390, 0, 'en', 'plugins/marketplace/store', 'forms.phone_placeholder', 'Phone', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3391, 0, 'en', 'plugins/marketplace/store', 'forms.address', 'Address', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3392, 0, 'en', 'plugins/marketplace/store', 'forms.address_placeholder', 'Address', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3393, 0, 'en', 'plugins/marketplace/store', 'forms.city', 'City', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3394, 0, 'en', 'plugins/marketplace/store', 'forms.city_placeholder', 'City', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3395, 0, 'en', 'plugins/marketplace/store', 'forms.state', 'State', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3396, 0, 'en', 'plugins/marketplace/store', 'forms.state_placeholder', 'State', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3397, 0, 'en', 'plugins/marketplace/store', 'forms.country', 'Country', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3398, 0, 'en', 'plugins/marketplace/store', 'forms.country_placeholder', 'Country', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3399, 0, 'en', 'plugins/marketplace/store', 'forms.store_owner', 'Store owner', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3400, 0, 'en', 'plugins/marketplace/store', 'forms.select_store_owner', 'Select a store owner...', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3401, 0, 'en', 'plugins/marketplace/store', 'forms.store', 'Store', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3402, 0, 'en', 'plugins/marketplace/store', 'forms.select_store', 'Select a store...', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3403, 0, 'en', 'plugins/marketplace/store', 'forms.is_vendor', 'Is vendor?', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3404, 0, 'en', 'plugins/marketplace/store', 'store', 'Store', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3405, 0, 'en', 'plugins/marketplace/withdrawal', 'name', 'Withdrawals', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3406, 0, 'en', 'plugins/marketplace/withdrawal', 'edit', 'Edit withdrawal', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3407, 0, 'en', 'plugins/marketplace/withdrawal', 'statuses.pending', 'Pending', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3408, 0, 'en', 'plugins/marketplace/withdrawal', 'statuses.processing', 'Processing', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3409, 0, 'en', 'plugins/marketplace/withdrawal', 'statuses.completed', 'Completed', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3410, 0, 'en', 'plugins/marketplace/withdrawal', 'statuses.canceled', 'Canceled', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3411, 0, 'en', 'plugins/marketplace/withdrawal', 'statuses.refused', 'Refused', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3412, 0, 'en', 'plugins/marketplace/withdrawal', 'amount', 'Amount', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3413, 0, 'en', 'plugins/marketplace/withdrawal', 'customer', 'Customer', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3414, 0, 'en', 'plugins/marketplace/withdrawal', 'vendor', 'Vendor', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3415, 0, 'en', 'plugins/marketplace/withdrawal', 'currency', 'Currency', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3416, 0, 'en', 'plugins/marketplace/withdrawal', 'forms.amount', 'Amount', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3417, 0, 'en', 'plugins/marketplace/withdrawal', 'forms.amount_placeholder', 'Amount you want to withdrawal', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3418, 0, 'en', 'plugins/marketplace/withdrawal', 'forms.fee', 'Fee', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3419, 0, 'en', 'plugins/marketplace/withdrawal', 'forms.fee_helper', 'You have to pay a fee when withdrawing: :fee', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3420, 0, 'en', 'plugins/newsletter/newsletter', 'name', 'Newsletters', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3421, 0, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.title', 'Newsletter', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3422, 0, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.description', 'Config newsletter email templates', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3423, 0, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_admin.title', 'Email send to admin', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3424, 0, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_admin.description', 'Template for sending email to admin', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3425, 0, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_user.title', 'Email send to user', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3426, 0, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_user.description', 'Template for sending email to subscriber', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3427, 0, 'en', 'plugins/newsletter/newsletter', 'settings.title', 'Newsletter', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3428, 0, 'en', 'plugins/newsletter/newsletter', 'settings.description', 'Settings for newsletter', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3429, 0, 'en', 'plugins/newsletter/newsletter', 'settings.mailchimp_api_key', 'Mailchimp API Key', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3430, 0, 'en', 'plugins/newsletter/newsletter', 'settings.mailchimp_list_id', 'Mailchimp List ID', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3431, 0, 'en', 'plugins/newsletter/newsletter', 'settings.sendgrid_api_key', 'Sendgrid API Key', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3432, 0, 'en', 'plugins/newsletter/newsletter', 'settings.sendgrid_list_id', 'Sendgrid List ID', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3433, 0, 'en', 'plugins/newsletter/newsletter', 'statuses.subscribed', 'Subscribed', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3434, 0, 'en', 'plugins/newsletter/newsletter', 'statuses.unsubscribed', 'Unsubscribed', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3435, 0, 'en', 'plugins/payment/payment', 'payments', 'Payments', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3436, 0, 'en', 'plugins/payment/payment', 'checkout_success', 'Checkout successfully!', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3437, 0, 'en', 'plugins/payment/payment', 'view_payment', 'View payment #', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3438, 0, 'en', 'plugins/payment/payment', 'charge_id', 'Charge ID', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3439, 0, 'en', 'plugins/payment/payment', 'amount', 'Amount', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3440, 0, 'en', 'plugins/payment/payment', 'currency', 'Currency', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3441, 0, 'en', 'plugins/payment/payment', 'user', 'User', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3442, 0, 'en', 'plugins/payment/payment', 'stripe', 'Stripe', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3443, 0, 'en', 'plugins/payment/payment', 'paypal', 'PayPal', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3444, 0, 'en', 'plugins/payment/payment', 'action', 'Action', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3445, 0, 'en', 'plugins/payment/payment', 'payment_via_card', 'Payment via card', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3446, 0, 'en', 'plugins/payment/payment', 'card_number', 'Card number', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3447, 0, 'en', 'plugins/payment/payment', 'full_name', 'Full name', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3448, 0, 'en', 'plugins/payment/payment', 'payment_via_paypal', 'Payment via PayPal', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3449, 0, 'en', 'plugins/payment/payment', 'mm_yy', 'MM/YY', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3450, 0, 'en', 'plugins/payment/payment', 'cvc', 'CVC', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3451, 0, 'en', 'plugins/payment/payment', 'details', 'Details', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3452, 0, 'en', 'plugins/payment/payment', 'payer_name', 'Payer Name', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3453, 0, 'en', 'plugins/payment/payment', 'email', 'Email', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3454, 0, 'en', 'plugins/payment/payment', 'phone', 'Phone', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3455, 0, 'en', 'plugins/payment/payment', 'country', 'Country', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3456, 0, 'en', 'plugins/payment/payment', 'shipping_address', 'Shipping Address', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3457, 0, 'en', 'plugins/payment/payment', 'payment_details', 'Payment Details', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3458, 0, 'en', 'plugins/payment/payment', 'card', 'Card', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3459, 0, 'en', 'plugins/payment/payment', 'address', 'Address', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3460, 0, 'en', 'plugins/payment/payment', 'could_not_get_stripe_token', 'Could not get Stripe token to make a charge.', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3461, 0, 'en', 'plugins/payment/payment', 'payment_id', 'Payment ID', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3462, 0, 'en', 'plugins/payment/payment', 'payment_methods', 'Payment methods', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3463, 0, 'en', 'plugins/payment/payment', 'transactions', 'Transactions', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3464, 0, 'en', 'plugins/payment/payment', 'payment_methods_description', 'Setup payment methods for website', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3465, 0, 'en', 'plugins/payment/payment', 'paypal_description', 'Customer can buy product and pay directly via PayPal', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3466, 0, 'en', 'plugins/payment/payment', 'use', 'Use', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3467, 0, 'en', 'plugins/payment/payment', 'stripe_description', 'Customer can buy product and pay directly using Visa, Credit card via Stripe', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3468, 0, 'en', 'plugins/payment/payment', 'edit', 'Edit', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3469, 0, 'en', 'plugins/payment/payment', 'settings', 'Settings', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3470, 0, 'en', 'plugins/payment/payment', 'activate', 'Activate', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3471, 0, 'en', 'plugins/payment/payment', 'deactivate', 'Deactivate', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3472, 0, 'en', 'plugins/payment/payment', 'update', 'Update', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3473, 0, 'en', 'plugins/payment/payment', 'configuration_instruction', 'Configuration instruction for :name', '2021-08-18 04:43:52', '2021-08-18 04:44:12');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(3474, 0, 'en', 'plugins/payment/payment', 'configuration_requirement', 'To use :name, you need', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3475, 0, 'en', 'plugins/payment/payment', 'service_registration', 'Register with :name', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3476, 0, 'en', 'plugins/payment/payment', 'after_service_registration_msg', 'After registration at :name, you will have Client ID, Client Secret', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3477, 0, 'en', 'plugins/payment/payment', 'enter_client_id_and_secret', 'Enter Client ID, Secret into the box in right hand', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3478, 0, 'en', 'plugins/payment/payment', 'method_name', 'Method name', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3479, 0, 'en', 'plugins/payment/payment', 'please_provide_information', 'Please provide information', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3480, 0, 'en', 'plugins/payment/payment', 'client_id', 'Client ID', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3481, 0, 'en', 'plugins/payment/payment', 'client_secret', 'Client Secret', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3482, 0, 'en', 'plugins/payment/payment', 'secret', 'Secret', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3483, 0, 'en', 'plugins/payment/payment', 'stripe_key', 'Stripe Public Key', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3484, 0, 'en', 'plugins/payment/payment', 'stripe_secret', 'Stripe Private Key', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3485, 0, 'en', 'plugins/payment/payment', 'stripe_after_service_registration_msg', 'After registration at :name, you will have Public, Secret keys', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3486, 0, 'en', 'plugins/payment/payment', 'stripe_enter_client_id_and_secret', 'Enter Public, Secret keys into the box in right hand', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3487, 0, 'en', 'plugins/payment/payment', 'pay_online_via', 'Pay online via :name', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3488, 0, 'en', 'plugins/payment/payment', 'sandbox_mode', 'Sandbox mode', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3489, 0, 'en', 'plugins/payment/payment', 'deactivate_payment_method', 'Deactivate payment method', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3490, 0, 'en', 'plugins/payment/payment', 'deactivate_payment_method_description', 'Do you really want to deactivate this payment method?', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3491, 0, 'en', 'plugins/payment/payment', 'agree', 'Agree', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3492, 0, 'en', 'plugins/payment/payment', 'name', 'Payments', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3493, 0, 'en', 'plugins/payment/payment', 'create', 'New payment', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3494, 0, 'en', 'plugins/payment/payment', 'go_back', 'Go back', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3495, 0, 'en', 'plugins/payment/payment', 'information', 'Information', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3496, 0, 'en', 'plugins/payment/payment', 'methods.paypal', 'PayPal', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3497, 0, 'en', 'plugins/payment/payment', 'methods.stripe', 'Stripe', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3498, 0, 'en', 'plugins/payment/payment', 'methods.cod', 'Cash on delivery (COD)', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3499, 0, 'en', 'plugins/payment/payment', 'methods.bank_transfer', 'Bank transfer', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3500, 0, 'en', 'plugins/payment/payment', 'statuses.pending', 'Pending', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3501, 0, 'en', 'plugins/payment/payment', 'statuses.completed', 'Completed', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3502, 0, 'en', 'plugins/payment/payment', 'statuses.refunding', 'Refunding', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3503, 0, 'en', 'plugins/payment/payment', 'statuses.refunded', 'Refunded', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3504, 0, 'en', 'plugins/payment/payment', 'statuses.fraud', 'Fraud', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3505, 0, 'en', 'plugins/payment/payment', 'statuses.failed', 'Failed', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3506, 0, 'en', 'plugins/payment/payment', 'payment_methods_instruction', 'Guide customers to pay directly. You can choose to pay by delivery or bank transfer', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3507, 0, 'en', 'plugins/payment/payment', 'payment_method_description', 'Payment guide - (Displayed on the notice of successful purchase and payment page)', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3508, 0, 'en', 'plugins/payment/payment', 'payment_via_cod', 'Cash on delivery (COD)', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3509, 0, 'en', 'plugins/payment/payment', 'payment_via_bank_transfer', 'Bank transfer', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3510, 0, 'en', 'plugins/payment/payment', 'payment_pending', 'Checkout successfully. Your payment is pending and will be checked by our staff.', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3511, 0, 'en', 'plugins/payment/payment', 'created_at', 'Created At', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3512, 0, 'en', 'plugins/payment/payment', 'payment_channel', 'Payment Channel', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3513, 0, 'en', 'plugins/payment/payment', 'total', 'Total', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3514, 0, 'en', 'plugins/payment/payment', 'status', 'Status', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3515, 0, 'en', 'plugins/payment/payment', 'default_payment_method', 'Default payment method', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3516, 0, 'en', 'plugins/payment/payment', 'turn_off_success', 'Turn off payment method successfully!', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3517, 0, 'en', 'plugins/payment/payment', 'saved_payment_method_success', 'Saved payment method successfully!', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3518, 0, 'en', 'plugins/payment/payment', 'saved_payment_settings_success', 'Saved payment settings successfully!', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3519, 0, 'en', 'plugins/payment/payment', 'payment_name', 'Name', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3520, 0, 'en', 'plugins/payment/payment', 'callback_url', 'Callback URL', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3521, 0, 'en', 'plugins/payment/payment', 'return_url', 'Return URL', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3522, 0, 'en', 'plugins/payment/payment', 'payment_not_found', 'Payment not found!', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3523, 0, 'en', 'plugins/payment/payment', 'refunds.title', 'Refunds', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3524, 0, 'en', 'plugins/payment/payment', 'refunds.id', 'ID', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3525, 0, 'en', 'plugins/payment/payment', 'refunds.breakdowns', 'Breakdowns', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3526, 0, 'en', 'plugins/payment/payment', 'refunds.gross_amount', 'Gross amount', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3527, 0, 'en', 'plugins/payment/payment', 'refunds.paypal_fee', 'PayPal fee', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3528, 0, 'en', 'plugins/payment/payment', 'refunds.net_amount', 'Net amount', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3529, 0, 'en', 'plugins/payment/payment', 'refunds.total_refunded_amount', 'Total refunded amount', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3530, 0, 'en', 'plugins/payment/payment', 'refunds.create_time', 'Create time', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3531, 0, 'en', 'plugins/payment/payment', 'refunds.update_time', 'Update time', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3532, 0, 'en', 'plugins/payment/payment', 'refunds.status', 'Status', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3533, 0, 'en', 'plugins/payment/payment', 'refunds.description', 'Description', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3534, 0, 'en', 'plugins/payment/payment', 'refunds.refunded_at', 'Refunded at', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3535, 0, 'en', 'plugins/payment/payment', 'refunds.error_message', 'Error message', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3536, 0, 'en', 'plugins/payment/payment', 'view_response_source', 'View response source', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3537, 0, 'en', 'plugins/payment/payment', 'status_is_not_completed', 'Status is not COMPLETED', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3538, 0, 'en', 'plugins/payment/payment', 'cannot_found_capture_id', 'Can not found capture id with payment detail', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3539, 0, 'en', 'plugins/payment/payment', 'amount_refunded', 'Amount refunded', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3540, 0, 'en', 'plugins/payment/payment', 'amount_remaining', 'Amount remaining', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3541, 0, 'en', 'plugins/payment/payment', 'paid_at', 'Paid At', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3542, 0, 'en', 'plugins/payment/payment', 'invalid_settings', 'Settings for :name are invalid!', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3543, 0, 'en', 'plugins/payment/payment', 'view_transaction', 'Transaction \":charge_id\"', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3544, 0, 'vi', 'plugins/payment/payment', 'payments', 'Thanh toán', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3545, 0, 'vi', 'plugins/payment/payment', 'checkout_success', 'Thanh toán thành công!', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3546, 0, 'vi', 'plugins/payment/payment', 'view_payment', 'Xem thanh toán #', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3547, 0, 'vi', 'plugins/payment/payment', 'charge_id', 'Mã thanh toán', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3548, 0, 'vi', 'plugins/payment/payment', 'amount', 'Số tiền', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3549, 0, 'vi', 'plugins/payment/payment', 'currency', 'Loại tiền tệ', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3550, 0, 'vi', 'plugins/payment/payment', 'user', 'Người dùng', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3551, 0, 'vi', 'plugins/payment/payment', 'stripe', 'Stripe', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3552, 0, 'vi', 'plugins/payment/payment', 'paypal', 'PayPal', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3553, 0, 'vi', 'plugins/payment/payment', 'action', 'Hành động', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3554, 0, 'vi', 'plugins/payment/payment', 'payment_via_card', 'Thanh toán qua thẻ', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3555, 0, 'vi', 'plugins/payment/payment', 'card_number', 'Số thẻ', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3556, 0, 'vi', 'plugins/payment/payment', 'full_name', 'Họ tên', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3557, 0, 'vi', 'plugins/payment/payment', 'payment_via_paypal', 'Thanh toán qua PayPal', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3558, 0, 'vi', 'plugins/payment/payment', 'mm_yy', 'MM/YY', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3559, 0, 'vi', 'plugins/payment/payment', 'cvc', 'CVC', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3560, 0, 'vi', 'plugins/payment/payment', 'details', 'Chi tiết', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3561, 0, 'vi', 'plugins/payment/payment', 'payer_name', 'Tên người mua', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3562, 0, 'vi', 'plugins/payment/payment', 'email', 'Email', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3563, 0, 'vi', 'plugins/payment/payment', 'phone', 'Điện thoại', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3564, 0, 'vi', 'plugins/payment/payment', 'country', 'Quốc gia', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3565, 0, 'vi', 'plugins/payment/payment', 'shipping_address', 'Địa chỉ giao hàng', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3566, 0, 'vi', 'plugins/payment/payment', 'payment_details', 'Chi tiết thanh toán', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3567, 0, 'vi', 'plugins/payment/payment', 'card', 'Thẻ', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3568, 0, 'vi', 'plugins/payment/payment', 'address', 'Địa chỉ', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3569, 0, 'vi', 'plugins/payment/payment', 'could_not_get_stripe_token', 'Không thể lấy mã Stripe để thanh toán.', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3570, 0, 'vi', 'plugins/payment/payment', 'payment_id', 'Mã thanh toán', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3571, 0, 'vi', 'plugins/payment/payment', 'payment_methods', 'Phương thức thanh toán', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3572, 0, 'vi', 'plugins/payment/payment', 'transactions', 'Lịch sử giao dịch', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3573, 0, 'vi', 'plugins/payment/payment', 'payment_methods_description', 'Cài đặt các phương thức thanh toán cho website', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3574, 0, 'vi', 'plugins/payment/payment', 'paypal_description', 'Khách hàng có thể mua hàng và thanh toán trực tiếp thông qua cổng thanh toán PayPal', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3575, 0, 'vi', 'plugins/payment/payment', 'use', 'Dùng', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3576, 0, 'vi', 'plugins/payment/payment', 'stripe_description', 'Khách hàng có thể mua hàng và thanh toán bằng Visa, Credit card thông qua cổng thanh toán Stripe', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3577, 0, 'vi', 'plugins/payment/payment', 'edit', 'Chỉnh sửa', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3578, 0, 'vi', 'plugins/payment/payment', 'settings', 'Cài đặt', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3579, 0, 'vi', 'plugins/payment/payment', 'activate', 'Kích hoạt', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3580, 0, 'vi', 'plugins/payment/payment', 'deactivate', 'Huỷ kích hoạt', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3581, 0, 'vi', 'plugins/payment/payment', 'update', 'Cập nhật', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3582, 0, 'vi', 'plugins/payment/payment', 'configuration_instruction', 'Hướng dẫn cấu hình :name', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3583, 0, 'vi', 'plugins/payment/payment', 'configuration_requirement', 'Để sử dụng :name bạn cần', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3584, 0, 'vi', 'plugins/payment/payment', 'service_registration', 'Đăng ký dịch vụ với :name', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3585, 0, 'vi', 'plugins/payment/payment', 'after_service_registration_msg', 'Sau khi hoàn tất các bước đăng ký tại :name, bạn sẽ có các thông số Client ID, Client Secret', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3586, 0, 'vi', 'plugins/payment/payment', 'enter_client_id_and_secret', 'Nhập các thông số Client ID, Secret vào ô bên phải', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3587, 0, 'vi', 'plugins/payment/payment', 'method_name', 'Tên phương thức', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3588, 0, 'vi', 'plugins/payment/payment', 'please_provide_information', 'Xin vui lòng cung cấp thông tin', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3589, 0, 'vi', 'plugins/payment/payment', 'client_id', 'Client ID', '2021-08-18 04:43:52', '2021-08-18 04:44:12'),
(3590, 0, 'vi', 'plugins/payment/payment', 'client_secret', 'Client Secret', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3591, 0, 'vi', 'plugins/payment/payment', 'stripe_key', 'Stripe Key', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3592, 0, 'vi', 'plugins/payment/payment', 'stripe_secret', 'Stripe Secret', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3593, 0, 'vi', 'plugins/payment/payment', 'stripe_after_service_registration_msg', 'After registration at :name, you will have Public, Secret keys', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3594, 0, 'vi', 'plugins/payment/payment', 'stripe_enter_client_id_and_secret', 'Enter Public, Secret keys into the box in right hand', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3595, 0, 'vi', 'plugins/payment/payment', 'secret', 'Secret', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3596, 0, 'vi', 'plugins/payment/payment', 'pay_online_via', 'Thanh toán online qua :name', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3597, 0, 'vi', 'plugins/payment/payment', 'sandbox_mode', 'Chế độ thử nghiệm', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3598, 0, 'vi', 'plugins/payment/payment', 'deactivate_payment_method', 'Huỷ kích hoạt phương thức', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3599, 0, 'vi', 'plugins/payment/payment', 'deactivate_payment_method_description', 'Bạn có chắc chắn muốn huỷ phương thức thành toán này?', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3600, 0, 'vi', 'plugins/payment/payment', 'agree', 'Đồng ý', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3601, 0, 'vi', 'plugins/payment/payment', 'name', 'Thanh toán', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3602, 0, 'vi', 'plugins/payment/payment', 'create', 'Thêm thanh toán mới', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3603, 0, 'vi', 'plugins/payment/payment', 'go_back', 'Trở lại', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3604, 0, 'vi', 'plugins/payment/payment', 'information', 'Thông tin', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3605, 0, 'vi', 'plugins/payment/payment', 'methods.paypal', 'PayPal', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3606, 0, 'vi', 'plugins/payment/payment', 'methods.stripe', 'Stripe', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3607, 0, 'vi', 'plugins/payment/payment', 'methods.cod', 'Thanh toán khi giao hàng (COD)', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3608, 0, 'vi', 'plugins/payment/payment', 'methods.bank_transfer', 'Chuyển khoản qua ngân hàng', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3609, 0, 'vi', 'plugins/payment/payment', 'statuses.pending', 'Chưa hoàn tất', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3610, 0, 'vi', 'plugins/payment/payment', 'statuses.completed', 'Đã hoàn thành', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3611, 0, 'vi', 'plugins/payment/payment', 'statuses.refunding', 'Đang hoàn tiền', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3612, 0, 'vi', 'plugins/payment/payment', 'statuses.refunded', 'Đã hoàn tiền', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3613, 0, 'vi', 'plugins/payment/payment', 'statuses.fraud', 'Gian lận', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3614, 0, 'vi', 'plugins/payment/payment', 'statuses.failed', 'Thất bại', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3615, 0, 'vi', 'plugins/payment/payment', 'payment_methods_instruction', 'Hướng dẫn khách hàng thanh toán trực tiếp. Có thể chọn thanh toán khi giao hàng hoặc chuyển khoản', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3616, 0, 'vi', 'plugins/payment/payment', 'payment_method_description', 'Hướng dẫn thanh toán – (Hiển thị ở trang thông báo mua hàng thành công và trang thanh toán)', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3617, 0, 'vi', 'plugins/payment/payment', 'payment_via_cod', 'Thanh toán khi nhận hàng (COD)', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3618, 0, 'vi', 'plugins/payment/payment', 'payment_via_bank_transfer', 'Chuyển khoản qua ngân hàng', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3619, 0, 'vi', 'plugins/payment/payment', 'payment_pending', 'Thực hiện thành công. Thanh toán của bạn đang được xử lý và sẽ được xác nhận bởi nhân viên.', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3620, 0, 'vi', 'plugins/payment/payment', 'created_at', 'Ngày tạo', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3621, 0, 'vi', 'plugins/payment/payment', 'payment_channel', 'Phương thức thanh toán', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3622, 0, 'vi', 'plugins/payment/payment', 'total', 'Tổng cộng', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3623, 0, 'vi', 'plugins/payment/payment', 'status', 'Trạng thái', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3624, 0, 'vi', 'plugins/payment/payment', 'default_payment_method', 'Phương thức thanh toán mặc định', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3625, 0, 'en', 'plugins/simple-slider/simple-slider', 'create', 'New slider', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3626, 0, 'en', 'plugins/simple-slider/simple-slider', 'edit', 'Edit slider', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3627, 0, 'en', 'plugins/simple-slider/simple-slider', 'menu', 'Simple sliders', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3628, 0, 'en', 'plugins/simple-slider/simple-slider', 'settings.title', 'Simple sliders', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3629, 0, 'en', 'plugins/simple-slider/simple-slider', 'settings.description', 'Settings for Simple sliders', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3630, 0, 'en', 'plugins/simple-slider/simple-slider', 'settings.using_assets', 'Using default assets?', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3631, 0, 'en', 'plugins/simple-slider/simple-slider', 'settings.using_assets_description', 'If using assets option is enabled then below scripts will be auto added to front site.', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3632, 0, 'en', 'plugins/simple-slider/simple-slider', 'add_new', 'Add new', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3633, 0, 'en', 'plugins/simple-slider/simple-slider', 'save_sorting', 'Save sorting', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3634, 0, 'en', 'plugins/simple-slider/simple-slider', 'key', 'Key', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3635, 0, 'en', 'plugins/simple-slider/simple-slider', 'slide_items', 'Slide Items', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3636, 0, 'en', 'plugins/simple-slider/simple-slider', 'update_slide_position_success', 'Updated slide position successfully!', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3637, 0, 'en', 'plugins/simple-slider/simple-slider', 'create_new_slide', 'Create a new slide', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3638, 0, 'en', 'plugins/simple-slider/simple-slider', 'edit_slide', 'Edit slide #:id', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3639, 0, 'en', 'plugins/simple-slider/simple-slider', 'simple_slider_shortcode_name', 'Simple Slider', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3640, 0, 'en', 'plugins/simple-slider/simple-slider', 'simple_slider_shortcode_description', 'Add a simple slider', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3641, 0, 'en', 'plugins/simple-slider/simple-slider', 'select_slider', 'Select a slider', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3642, 0, 'en', 'plugins/social-login/social-login', 'settings.title', 'Social Login settings', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3643, 0, 'en', 'plugins/social-login/social-login', 'settings.description', 'Configure social login options', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3644, 0, 'en', 'plugins/social-login/social-login', 'settings.facebook.title', 'Facebook login settings', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3645, 0, 'en', 'plugins/social-login/social-login', 'settings.facebook.description', 'Enable/disable & configure app credentials for Facebook login', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3646, 0, 'en', 'plugins/social-login/social-login', 'settings.facebook.app_id', 'App ID', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3647, 0, 'en', 'plugins/social-login/social-login', 'settings.facebook.app_secret', 'App Secret', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3648, 0, 'en', 'plugins/social-login/social-login', 'settings.facebook.helper', 'Please go to https://developers.facebook.com to create new app update App ID, App Secret. Callback URL is :callback', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3649, 0, 'en', 'plugins/social-login/social-login', 'settings.google.title', 'Google login settings', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3650, 0, 'en', 'plugins/social-login/social-login', 'settings.google.description', 'Enable/disable & configure app credentials for Google login', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3651, 0, 'en', 'plugins/social-login/social-login', 'settings.google.app_id', 'App ID', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3652, 0, 'en', 'plugins/social-login/social-login', 'settings.google.app_secret', 'App Secret', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3653, 0, 'en', 'plugins/social-login/social-login', 'settings.google.helper', 'Please go to https://console.developers.google.com/apis/dashboard to create new app update App ID, App Secret. Callback URL is :callback', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3654, 0, 'en', 'plugins/social-login/social-login', 'settings.github.title', 'Github login settings', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3655, 0, 'en', 'plugins/social-login/social-login', 'settings.github.description', 'Enable/disable & configure app credentials for Github login', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3656, 0, 'en', 'plugins/social-login/social-login', 'settings.github.app_id', 'App ID', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3657, 0, 'en', 'plugins/social-login/social-login', 'settings.github.app_secret', 'App Secret', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3658, 0, 'en', 'plugins/social-login/social-login', 'settings.github.helper', 'Please go to https://github.com/settings/developers to create new app update App ID, App Secret. Callback URL is :callback', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3659, 0, 'en', 'plugins/social-login/social-login', 'settings.linkedin.title', 'Linkedin login settings', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3660, 0, 'en', 'plugins/social-login/social-login', 'settings.linkedin.description', 'Enable/disable & configure app credentials for Linkedin login', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3661, 0, 'en', 'plugins/social-login/social-login', 'settings.linkedin.app_id', 'App ID', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3662, 0, 'en', 'plugins/social-login/social-login', 'settings.linkedin.app_secret', 'App Secret', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3663, 0, 'en', 'plugins/social-login/social-login', 'settings.linkedin.helper', 'Please go to https://www.linkedin.com/developers/apps/new to create new app update App ID, App Secret. Callback URL is :callback', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3664, 0, 'en', 'plugins/social-login/social-login', 'settings.enable', 'Enable?', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3665, 0, 'en', 'plugins/social-login/social-login', 'menu', 'Social Login', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3666, 0, 'en', 'plugins/translation/translation', 'translations', 'Translations', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3667, 0, 'en', 'plugins/translation/translation', 'translations_description', 'Translate all words in system.', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3668, 0, 'en', 'plugins/translation/translation', 'export_warning', 'Warning, translations are not visible until they are exported back to the resources/lang file, using \'php artisan cms:translations:export\' command or publish button.', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3669, 0, 'en', 'plugins/translation/translation', 'import_done', 'Done importing, processed :counter items! Reload this page to refresh the groups!', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3670, 0, 'en', 'plugins/translation/translation', 'translation_manager', 'Translations Manager', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3671, 0, 'en', 'plugins/translation/translation', 'done_publishing', 'Done publishing the translations for group', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3672, 0, 'en', 'plugins/translation/translation', 'append_translation', 'Append new translations', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3673, 0, 'en', 'plugins/translation/translation', 'replace_translation', 'Replace existing translations', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3674, 0, 'en', 'plugins/translation/translation', 'import_group', 'Import group', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3675, 0, 'en', 'plugins/translation/translation', 'confirm_publish_group', 'Are you sure you want to publish the translations group \":group\"? This will overwrite existing language files.', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3676, 0, 'en', 'plugins/translation/translation', 'publish_translations', 'Publish translations', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3677, 0, 'en', 'plugins/translation/translation', 'back', 'Back', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3678, 0, 'en', 'plugins/translation/translation', 'edit_title', 'Enter translation', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3679, 0, 'en', 'plugins/translation/translation', 'choose_group_msg', 'Choose a group to display the group translations. If no groups are visible, make sure you have imported the translations.', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3680, 0, 'en', 'plugins/translation/translation', 'choose_a_group', 'Choose a group', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3681, 0, 'en', 'plugins/translation/translation', 'locales', 'Locales', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3682, 0, 'en', 'plugins/translation/translation', 'theme-translations', 'Theme translations', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3683, 0, 'en', 'plugins/translation/translation', 'admin-translations', 'Other translations', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3684, 0, 'en', 'plugins/translation/translation', 'translate_from', 'Translate from', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3685, 0, 'en', 'plugins/translation/translation', 'to', 'to', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3686, 0, 'en', 'plugins/translation/translation', 'no_other_languages', 'No other language to translate!', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3687, 0, 'en', 'plugins/translation/translation', 'edit', 'Edit', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3688, 0, 'en', 'plugins/translation/translation', 'locale', 'Locale', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3689, 0, 'en', 'plugins/translation/translation', 'locale_placeholder', 'Ex: en', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3690, 0, 'en', 'plugins/translation/translation', 'name', 'Name', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3691, 0, 'en', 'plugins/translation/translation', 'default_locale', 'Default locale?', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3692, 0, 'en', 'plugins/translation/translation', 'actions', 'Actions', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3693, 0, 'en', 'plugins/translation/translation', 'choose_language', 'Choose language', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3694, 0, 'en', 'plugins/translation/translation', 'add_new_language', 'Add new language', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3695, 0, 'en', 'plugins/translation/translation', 'select_language', 'Select language', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3696, 0, 'en', 'plugins/translation/translation', 'flag', 'Flag', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3697, 0, 'en', 'plugins/translation/translation', 'folder_is_not_writeable', 'Cannot write files! Folder /resources/lang is not writable. Please chmod to make it writable!', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3698, 0, 'en', 'plugins/translation/translation', 'delete', 'Delete', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3699, 0, 'en', 'plugins/translation/translation', 'confirm_delete_message', 'Do you really want to delete this locale? It will delete all files/folders for this local in /resources/lang!', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3700, 0, 'en', 'plugins/translation/translation', 'download', 'Download', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3701, 0, 'en', 'plugins/translation/translation', 'select_locale', 'Select locale', '2021-08-18 04:43:53', '2021-08-18 04:44:12'),
(3702, 0, 'vi', 'auth', 'failed', 'Không tìm thấy thông tin đăng nhập hợp lệ.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3703, 0, 'vi', 'auth', 'throttle', 'Đăng nhập không đúng quá nhiều lần. Vui lòng thử lại sau :seconds giây.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3704, 0, 'vi', 'auth', 'password', 'Mật khẩu không chính xác', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3705, 0, 'vi', 'pagination', 'previous', '&laquo; Trước', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3706, 0, 'vi', 'pagination', 'next', 'Sau &raquo;', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3707, 0, 'vi', 'passwords', 'reset', 'Mật khẩu đã được cập nhật!', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3708, 0, 'vi', 'passwords', 'sent', 'Chúng tôi đã gửi cho bạn đường dẫn thay đổi mật khẩu!', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3709, 0, 'vi', 'passwords', 'token', 'Mã xác nhận mật khẩu không hợp lệ.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3710, 0, 'vi', 'passwords', 'user', 'Không tìm thấy thành viên với địa chỉ email này.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3711, 0, 'vi', 'validation', 'accepted', 'Trường :attribute phải được chấp nhận.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3712, 0, 'vi', 'validation', 'active_url', 'Trường :attribute không phải là một URL hợp lệ.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3713, 0, 'vi', 'validation', 'after', 'Trường :attribute phải là một ngày sau ngày :date.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3714, 0, 'vi', 'validation', 'after_or_equal', 'Trường :attribute phải là thời gian bắt đầu sau hoặc đúng bằng :date.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3715, 0, 'vi', 'validation', 'alpha', 'Trường :attribute chỉ có thể chứa các chữ cái.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3716, 0, 'vi', 'validation', 'alpha_dash', 'Trường :attribute chỉ có thể chứa chữ cái, số và dấu gạch ngang.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3717, 0, 'vi', 'validation', 'alpha_num', 'Trường :attribute chỉ có thể chứa chữ cái và số.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3718, 0, 'vi', 'validation', 'array', 'Trường :attribute phải là dạng mảng.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3719, 0, 'vi', 'validation', 'before', 'Trường :attribute phải là một ngày trước ngày :date.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3720, 0, 'vi', 'validation', 'before_or_equal', 'Trường :attribute phải là thời gian bắt đầu trước hoặc đúng bằng :date.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3721, 0, 'vi', 'validation', 'between.array', 'Trường :attribute phải có từ :min - :max phần tử.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3722, 0, 'vi', 'validation', 'between.file', 'Dung lượng tập tin trong trường :attribute phải từ :min - :max kB.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3723, 0, 'vi', 'validation', 'between.numeric', 'Trường :attribute phải nằm trong khoảng :min - :max.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3724, 0, 'vi', 'validation', 'between.string', 'Trường :attribute phải từ :min - :max kí tự.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3725, 0, 'vi', 'validation', 'boolean', 'Trường :attribute phải là true hoặc false.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3726, 0, 'vi', 'validation', 'confirmed', 'Giá trị xác nhận trong trường :attribute không khớp.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3727, 0, 'vi', 'validation', 'date', 'Trường :attribute không phải là định dạng của ngày-tháng.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3728, 0, 'vi', 'validation', 'date_equals', 'Trường :attribute phải là một ngày bằng với :date.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3729, 0, 'vi', 'validation', 'date_format', 'Trường :attribute không giống với định dạng :format.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3730, 0, 'vi', 'validation', 'different', 'Trường :attribute và :other phải khác nhau.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3731, 0, 'vi', 'validation', 'digits', 'Độ dài của trường :attribute phải gồm :digits chữ số.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3732, 0, 'vi', 'validation', 'digits_between', 'Độ dài của trường :attribute phải nằm trong khoảng :min and :max chữ số.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3733, 0, 'vi', 'validation', 'dimensions', 'Trường :attribute có kích thước không hợp lệ.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3734, 0, 'vi', 'validation', 'distinct', 'Trường :attribute có giá trị trùng lặp.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3735, 0, 'vi', 'validation', 'email', 'Trường :attribute phải là một địa chỉ email hợp lệ.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3736, 0, 'vi', 'validation', 'ends_with', 'Trường :attribute phải kết thúc bằng một trong những giá trị sau: :values', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3737, 0, 'vi', 'validation', 'exists', 'Giá trị đã chọn trong trường :attribute không hợp lệ.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3738, 0, 'vi', 'validation', 'file', 'Trường :attribute phải là một tệp tin.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3739, 0, 'vi', 'validation', 'filled', 'Trường :attribute không được bỏ trống.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3740, 0, 'vi', 'validation', 'gt.array', 'Mảng :attribute phải có nhiều hơn :value phần tử.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3741, 0, 'vi', 'validation', 'gt.file', 'Dung lượng trường :attribute phải lớn hơn :value kilobytes.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3742, 0, 'vi', 'validation', 'gt.numeric', 'Giá trị trường :attribute phải lớn hơn :value.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3743, 0, 'vi', 'validation', 'gt.string', 'Độ dài trường :attribute phải nhiều hơn :value kí tự.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3744, 0, 'vi', 'validation', 'gte.array', 'Mảng :attribute phải có ít nhất :value phần tử.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3745, 0, 'vi', 'validation', 'gte.file', 'Dung lượng trường :attribute phải lớn hơn hoặc bằng :value kilobytes.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3746, 0, 'vi', 'validation', 'gte.numeric', 'Giá trị trường :attribute phải lớn hơn hoặc bằng :value.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3747, 0, 'vi', 'validation', 'gte.string', 'Độ dài trường :attribute phải lớn hơn hoặc bằng :value kí tự.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3748, 0, 'vi', 'validation', 'image', 'Trường :attribute phải là định dạng hình ảnh.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3749, 0, 'vi', 'validation', 'in', 'Giá trị đã chọn trong trường :attribute không hợp lệ.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3750, 0, 'vi', 'validation', 'in_array', 'Trường :attribute phải thuộc tập cho phép: :other.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3751, 0, 'vi', 'validation', 'integer', 'Trường :attribute phải là một số nguyên.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3752, 0, 'vi', 'validation', 'ip', 'Trường :attribute phải là một địa chỉ IP.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3753, 0, 'vi', 'validation', 'ipv4', 'Trường :attribute phải là một địa chỉ IPv4.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3754, 0, 'vi', 'validation', 'ipv6', 'Trường :attribute phải là một địa chỉ IPv6.', '2021-08-18 04:43:53', '2021-08-18 04:44:11'),
(3755, 0, 'vi', 'validation', 'json', 'Trường :attribute phải là một chuỗi JSON.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3756, 0, 'vi', 'validation', 'lt.array', 'Mảng :attribute phải có ít hơn :value phần tử.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3757, 0, 'vi', 'validation', 'lt.file', 'Dung lượng trường :attribute phải nhỏ hơn :value kilobytes.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3758, 0, 'vi', 'validation', 'lt.numeric', 'Giá trị trường :attribute phải nhỏ hơn :value.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3759, 0, 'vi', 'validation', 'lt.string', 'Độ dài trường :attribute phải nhỏ hơn :value kí tự.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3760, 0, 'vi', 'validation', 'lte.array', 'Mảng :attribute không được có nhiều hơn :value phần tử.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3761, 0, 'vi', 'validation', 'lte.file', 'Dung lượng trường :attribute phải nhỏ hơn hoặc bằng :value kilobytes.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3762, 0, 'vi', 'validation', 'lte.numeric', 'Giá trị trường :attribute phải nhỏ hơn hoặc bằng :value.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3763, 0, 'vi', 'validation', 'lte.string', 'Độ dài trường :attribute phải nhỏ hơn hoặc bằng :value kí tự.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3764, 0, 'vi', 'validation', 'max.array', 'Trường :attribute không được lớn hơn :max phần tử.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3765, 0, 'vi', 'validation', 'max.file', 'Dung lượng tập tin trong trường :attribute không được lớn hơn :max kB.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3766, 0, 'vi', 'validation', 'max.numeric', 'Trường :attribute không được lớn hơn :max.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3767, 0, 'vi', 'validation', 'max.string', 'Trường :attribute không được lớn hơn :max kí tự.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3768, 0, 'vi', 'validation', 'mimes', 'Trường :attribute phải là một tập tin có định dạng: :values.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3769, 0, 'vi', 'validation', 'mimetypes', 'Trường :attribute phải là một tập tin có định dạng: :values.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3770, 0, 'vi', 'validation', 'min.array', 'Trường :attribute phải có tối thiểu :min phần tử.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3771, 0, 'vi', 'validation', 'min.file', 'Dung lượng tập tin trong trường :attribute phải tối thiểu :min kB.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3772, 0, 'vi', 'validation', 'min.numeric', 'Trường :attribute phải tối thiểu là :min.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3773, 0, 'vi', 'validation', 'min.string', 'Trường :attribute phải có tối thiểu :min kí tự.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3774, 0, 'vi', 'validation', 'multiple_of', 'Trường :attribute phải là bội số của :value', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3775, 0, 'vi', 'validation', 'not_in', 'Giá trị đã chọn trong trường :attribute không hợp lệ.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3776, 0, 'vi', 'validation', 'not_regex', 'Trường :attribute có định dạng không hợp lệ.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3777, 0, 'vi', 'validation', 'numeric', 'Trường :attribute phải là một số.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3778, 0, 'vi', 'validation', 'password', 'Mật khẩu không đúng.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3779, 0, 'vi', 'validation', 'present', 'Trường :attribute phải được cung cấp.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3780, 0, 'vi', 'validation', 'prohibited', 'Trường :attribute bị cấm.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3781, 0, 'vi', 'validation', 'prohibited_if', 'Trường :attribute bị cấm khi :other là :value.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3782, 0, 'vi', 'validation', 'prohibited_unless', 'Trường :attribute bị cấm trừ khi :other là một trong :values.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3783, 0, 'vi', 'validation', 'regex', 'Trường :attribute có định dạng không hợp lệ.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3784, 0, 'vi', 'validation', 'required', 'Trường :attribute không được bỏ trống.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3785, 0, 'vi', 'validation', 'required_if', 'Trường :attribute không được bỏ trống khi trường :other là :value.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3786, 0, 'vi', 'validation', 'required_unless', 'Trường :attribute không được bỏ trống trừ khi :other là :values.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3787, 0, 'vi', 'validation', 'required_with', 'Trường :attribute không được bỏ trống khi một trong :values có giá trị.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3788, 0, 'vi', 'validation', 'required_with_all', 'Trường :attribute không được bỏ trống khi tất cả :values có giá trị.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3789, 0, 'vi', 'validation', 'required_without', 'Trường :attribute không được bỏ trống khi một trong :values không có giá trị.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3790, 0, 'vi', 'validation', 'required_without_all', 'Trường :attribute không được bỏ trống khi tất cả :values không có giá trị.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3791, 0, 'vi', 'validation', 'same', 'Trường :attribute và :other phải giống nhau.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3792, 0, 'vi', 'validation', 'size.array', 'Trường :attribute phải chứa :size phần tử.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3793, 0, 'vi', 'validation', 'size.file', 'Dung lượng tập tin trong trường :attribute phải bằng :size kB.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3794, 0, 'vi', 'validation', 'size.numeric', 'Trường :attribute phải bằng :size.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3795, 0, 'vi', 'validation', 'size.string', 'Trường :attribute phải chứa :size kí tự.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3796, 0, 'vi', 'validation', 'starts_with', 'Trường :attribute phải được bắt đầu bằng một trong những giá trị sau: :values', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3797, 0, 'vi', 'validation', 'string', 'Trường :attribute phải là một chuỗi kí tự.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3798, 0, 'vi', 'validation', 'timezone', 'Trường :attribute phải là một múi giờ hợp lệ.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3799, 0, 'vi', 'validation', 'unique', 'Trường :attribute đã có trong cơ sở dữ liệu.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3800, 0, 'vi', 'validation', 'uploaded', 'Trường :attribute tải lên thất bại.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3801, 0, 'vi', 'validation', 'url', 'Trường :attribute không giống với định dạng một URL.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3802, 0, 'vi', 'validation', 'uuid', 'Trường :attribute phải là một chuỗi UUID hợp lệ.', '2021-08-18 04:43:54', '2021-08-18 04:44:11'),
(3803, 0, 'vi', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2021-08-18 04:43:54', '2021-08-18 04:44:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` int(10) UNSIGNED DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `first_name`, `last_name`, `username`, `avatar_id`, `super_user`, `manage_supers`, `permissions`, `last_login`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(1, 'admin@botble.com', NULL, '$2y$10$d50wpLwaO3b7B7I8BbRRteK/HWU5PQrMZdSORt9.MbKOS1xJbXbke', NULL, '2021-08-21 01:52:22', '2021-08-21 01:52:22', 'System', 'Admin', 'botble', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE `user_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `widget_id`, `sidebar_id`, `theme`, `position`, `data`, `created_at`, `updated_at`) VALUES
(1, 'CustomMenuWidget', 'footer_sidebar', 'martfury', 1, '{\"id\":\"CustomMenuWidget\",\"name\":\"Quick links\",\"menu_id\":\"quick-links\"}', '2021-08-21 01:52:24', '2021-08-21 01:52:24'),
(2, 'CustomMenuWidget', 'footer_sidebar', 'martfury', 2, '{\"id\":\"CustomMenuWidget\",\"name\":\"Company\",\"menu_id\":\"company\"}', '2021-08-21 01:52:24', '2021-08-21 01:52:24'),
(3, 'CustomMenuWidget', 'footer_sidebar', 'martfury', 3, '{\"id\":\"CustomMenuWidget\",\"name\":\"Business\",\"menu_id\":\"business\"}', '2021-08-21 01:52:24', '2021-08-21 01:52:24'),
(4, 'BlogSearchWidget', 'primary_sidebar', 'martfury', 1, '{\"id\":\"BlogSearchWidget\",\"name\":\"Search\"}', '2021-08-21 01:52:24', '2021-08-21 01:52:24'),
(5, 'BlogCategoriesWidget', 'primary_sidebar', 'martfury', 2, '{\"id\":\"BlogCategoriesWidget\",\"name\":\"Categories\"}', '2021-08-21 01:52:24', '2021-08-21 01:52:24'),
(6, 'RecentPostsWidget', 'primary_sidebar', 'martfury', 3, '{\"id\":\"RecentPostsWidget\",\"name\":\"Recent Posts\"}', '2021-08-21 01:52:24', '2021-08-21 01:52:24'),
(7, 'TagsWidget', 'primary_sidebar', 'martfury', 4, '{\"id\":\"TagsWidget\",\"name\":\"Popular Tags\"}', '2021-08-21 01:52:24', '2021-08-21 01:52:24'),
(8, 'ProductCategoriesWidget', 'bottom_footer_sidebar', 'martfury', 1, '{\"id\":\"ProductCategoriesWidget\",\"name\":\"Consumer Electric\",\"categories\":[18,2,3,4,5,6,7]}', '2021-08-21 01:52:24', '2021-08-21 01:52:24'),
(9, 'ProductCategoriesWidget', 'bottom_footer_sidebar', 'martfury', 2, '{\"id\":\"ProductCategoriesWidget\",\"name\":\"Clothing & Apparel\",\"categories\":[8,9,10,11,12]}', '2021-08-21 01:52:24', '2021-08-21 01:52:24'),
(10, 'ProductCategoriesWidget', 'bottom_footer_sidebar', 'martfury', 3, '{\"id\":\"ProductCategoriesWidget\",\"name\":\"Home, Garden & Kitchen\",\"categories\":[13,14,15,16,17]}', '2021-08-21 01:52:24', '2021-08-21 01:52:24'),
(11, 'ProductCategoriesWidget', 'bottom_footer_sidebar', 'martfury', 4, '{\"id\":\"ProductCategoriesWidget\",\"name\":\"Health & Beauty\",\"categories\":[20,21,22,23,24]}', '2021-08-21 01:52:24', '2021-08-21 01:52:24'),
(12, 'ProductCategoriesWidget', 'bottom_footer_sidebar', 'martfury', 5, '{\"id\":\"ProductCategoriesWidget\",\"name\":\"Computer & Technologies\",\"categories\":[25,26,27,28,29,19]}', '2021-08-21 01:52:24', '2021-08-21 01:52:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activations_user_id_index` (`user_id`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ads_key_unique` (`key`);

--
-- Indexes for table `audit_histories`
--
ALTER TABLE `audit_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_histories_user_id_index` (`user_id`),
  ADD KEY `audit_histories_module_index` (`module`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_replies`
--
ALTER TABLE `contact_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  ADD KEY `dashboard_widget_settings_widget_id_index` (`widget_id`);

--
-- Indexes for table `ec_brands`
--
ALTER TABLE `ec_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_brands_translations`
--
ALTER TABLE `ec_brands_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_brands_id`);

--
-- Indexes for table `ec_cart`
--
ALTER TABLE `ec_cart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `ec_currencies`
--
ALTER TABLE `ec_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_customers`
--
ALTER TABLE `ec_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_customers_email_unique` (`email`);

--
-- Indexes for table `ec_customer_addresses`
--
ALTER TABLE `ec_customer_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_customer_password_resets`
--
ALTER TABLE `ec_customer_password_resets`
  ADD KEY `ec_customer_password_resets_email_index` (`email`),
  ADD KEY `ec_customer_password_resets_token_index` (`token`);

--
-- Indexes for table `ec_discounts`
--
ALTER TABLE `ec_discounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_discounts_code_unique` (`code`);

--
-- Indexes for table `ec_discount_customers`
--
ALTER TABLE `ec_discount_customers`
  ADD PRIMARY KEY (`discount_id`,`customer_id`);

--
-- Indexes for table `ec_discount_products`
--
ALTER TABLE `ec_discount_products`
  ADD PRIMARY KEY (`discount_id`,`product_id`);

--
-- Indexes for table `ec_discount_product_collections`
--
ALTER TABLE `ec_discount_product_collections`
  ADD PRIMARY KEY (`discount_id`,`product_collection_id`);

--
-- Indexes for table `ec_flash_sales`
--
ALTER TABLE `ec_flash_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_flash_sales_translations`
--
ALTER TABLE `ec_flash_sales_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_flash_sales_id`);

--
-- Indexes for table `ec_grouped_products`
--
ALTER TABLE `ec_grouped_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_orders`
--
ALTER TABLE `ec_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_order_addresses`
--
ALTER TABLE `ec_order_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_order_histories`
--
ALTER TABLE `ec_order_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_order_product`
--
ALTER TABLE `ec_order_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_products`
--
ALTER TABLE `ec_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_products_translations`
--
ALTER TABLE `ec_products_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_products_id`);

--
-- Indexes for table `ec_product_attributes`
--
ALTER TABLE `ec_product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_attributes_translations`
--
ALTER TABLE `ec_product_attributes_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_product_attributes_id`);

--
-- Indexes for table `ec_product_attribute_sets`
--
ALTER TABLE `ec_product_attribute_sets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_attribute_sets_translations`
--
ALTER TABLE `ec_product_attribute_sets_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_product_attribute_sets_id`);

--
-- Indexes for table `ec_product_categories`
--
ALTER TABLE `ec_product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_categories_translations`
--
ALTER TABLE `ec_product_categories_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_product_categories_id`);

--
-- Indexes for table `ec_product_category_product`
--
ALTER TABLE `ec_product_category_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_category_product_category_id_index` (`category_id`),
  ADD KEY `ec_product_category_product_product_id_index` (`product_id`);

--
-- Indexes for table `ec_product_collections`
--
ALTER TABLE `ec_product_collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_collections_translations`
--
ALTER TABLE `ec_product_collections_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_product_collections_id`);

--
-- Indexes for table `ec_product_collection_products`
--
ALTER TABLE `ec_product_collection_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_collection_products_product_collection_id_index` (`product_collection_id`),
  ADD KEY `ec_product_collection_products_product_id_index` (`product_id`);

--
-- Indexes for table `ec_product_cross_sale_relations`
--
ALTER TABLE `ec_product_cross_sale_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_cross_sale_relations_from_product_id_index` (`from_product_id`),
  ADD KEY `ec_product_cross_sale_relations_to_product_id_index` (`to_product_id`);

--
-- Indexes for table `ec_product_labels`
--
ALTER TABLE `ec_product_labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_labels_translations`
--
ALTER TABLE `ec_product_labels_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_product_labels_id`);

--
-- Indexes for table `ec_product_label_products`
--
ALTER TABLE `ec_product_label_products`
  ADD PRIMARY KEY (`product_label_id`,`product_id`),
  ADD KEY `ec_product_label_products_product_label_id_index` (`product_label_id`),
  ADD KEY `ec_product_label_products_product_id_index` (`product_id`);

--
-- Indexes for table `ec_product_related_relations`
--
ALTER TABLE `ec_product_related_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_related_relations_from_product_id_index` (`from_product_id`),
  ADD KEY `ec_product_related_relations_to_product_id_index` (`to_product_id`);

--
-- Indexes for table `ec_product_tags`
--
ALTER TABLE `ec_product_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_tag_product`
--
ALTER TABLE `ec_product_tag_product`
  ADD PRIMARY KEY (`product_id`,`tag_id`),
  ADD KEY `ec_product_tag_product_product_id_index` (`product_id`),
  ADD KEY `ec_product_tag_product_tag_id_index` (`tag_id`);

--
-- Indexes for table `ec_product_up_sale_relations`
--
ALTER TABLE `ec_product_up_sale_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_up_sale_relations_from_product_id_index` (`from_product_id`),
  ADD KEY `ec_product_up_sale_relations_to_product_id_index` (`to_product_id`);

--
-- Indexes for table `ec_product_variations`
--
ALTER TABLE `ec_product_variations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_variation_items`
--
ALTER TABLE `ec_product_variation_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_with_attribute`
--
ALTER TABLE `ec_product_with_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_with_attribute_set`
--
ALTER TABLE `ec_product_with_attribute_set`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_reviews`
--
ALTER TABLE `ec_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipments`
--
ALTER TABLE `ec_shipments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipment_histories`
--
ALTER TABLE `ec_shipment_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipping`
--
ALTER TABLE `ec_shipping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipping_rules`
--
ALTER TABLE `ec_shipping_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipping_rule_items`
--
ALTER TABLE `ec_shipping_rule_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_store_locators`
--
ALTER TABLE `ec_store_locators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_taxes`
--
ALTER TABLE `ec_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_wish_lists`
--
ALTER TABLE `ec_wish_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_files_user_id_index` (`user_id`);

--
-- Indexes for table `media_folders`
--
ALTER TABLE `media_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_folders_user_id_index` (`user_id`);

--
-- Indexes for table `media_settings`
--
ALTER TABLE `media_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_slug_unique` (`slug`);

--
-- Indexes for table `menu_locations`
--
ALTER TABLE `menu_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_nodes_menu_id_index` (`menu_id`),
  ADD KEY `menu_nodes_parent_id_index` (`parent_id`);

--
-- Indexes for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_boxes_reference_id_index` (`reference_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_customer_revenues`
--
ALTER TABLE `mp_customer_revenues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_customer_withdrawals`
--
ALTER TABLE `mp_customer_withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_stores`
--
ALTER TABLE `mp_stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_vendor_info`
--
ALTER TABLE `mp_vendor_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD KEY `roles_created_by_index` (`created_by`),
  ADD KEY `roles_updated_by_index` (`updated_by`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_users_user_id_index` (`user_id`),
  ADD KEY `role_users_role_id_index` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `simple_sliders`
--
ALTER TABLE `simple_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `simple_slider_items`
--
ALTER TABLE `simple_slider_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slugs`
--
ALTER TABLE `slugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_meta_user_id_index` (`user_id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `audit_histories`
--
ALTER TABLE `audit_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `contact_replies`
--
ALTER TABLE `contact_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_brands`
--
ALTER TABLE `ec_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ec_currencies`
--
ALTER TABLE `ec_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ec_customers`
--
ALTER TABLE `ec_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ec_customer_addresses`
--
ALTER TABLE `ec_customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ec_discounts`
--
ALTER TABLE `ec_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_flash_sales`
--
ALTER TABLE `ec_flash_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ec_grouped_products`
--
ALTER TABLE `ec_grouped_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_orders`
--
ALTER TABLE `ec_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `ec_order_addresses`
--
ALTER TABLE `ec_order_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `ec_order_histories`
--
ALTER TABLE `ec_order_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT for table `ec_order_product`
--
ALTER TABLE `ec_order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `ec_products`
--
ALTER TABLE `ec_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `ec_product_attributes`
--
ALTER TABLE `ec_product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ec_product_attribute_sets`
--
ALTER TABLE `ec_product_attribute_sets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ec_product_categories`
--
ALTER TABLE `ec_product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `ec_product_category_product`
--
ALTER TABLE `ec_product_category_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `ec_product_collections`
--
ALTER TABLE `ec_product_collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ec_product_collection_products`
--
ALTER TABLE `ec_product_collection_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `ec_product_cross_sale_relations`
--
ALTER TABLE `ec_product_cross_sale_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=333;

--
-- AUTO_INCREMENT for table `ec_product_labels`
--
ALTER TABLE `ec_product_labels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ec_product_related_relations`
--
ALTER TABLE `ec_product_related_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_product_tags`
--
ALTER TABLE `ec_product_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ec_product_up_sale_relations`
--
ALTER TABLE `ec_product_up_sale_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_product_variations`
--
ALTER TABLE `ec_product_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `ec_product_variation_items`
--
ALTER TABLE `ec_product_variation_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `ec_product_with_attribute`
--
ALTER TABLE `ec_product_with_attribute`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `ec_product_with_attribute_set`
--
ALTER TABLE `ec_product_with_attribute_set`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `ec_reviews`
--
ALTER TABLE `ec_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `ec_shipments`
--
ALTER TABLE `ec_shipments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `ec_shipment_histories`
--
ALTER TABLE `ec_shipment_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `ec_shipping`
--
ALTER TABLE `ec_shipping`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ec_shipping_rules`
--
ALTER TABLE `ec_shipping_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ec_shipping_rule_items`
--
ALTER TABLE `ec_shipping_rule_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_store_locators`
--
ALTER TABLE `ec_store_locators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ec_taxes`
--
ALTER TABLE `ec_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ec_wish_lists`
--
ALTER TABLE `ec_wish_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=368;

--
-- AUTO_INCREMENT for table `media_folders`
--
ALTER TABLE `media_folders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `media_settings`
--
ALTER TABLE `media_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menu_locations`
--
ALTER TABLE `menu_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `mp_customer_revenues`
--
ALTER TABLE `mp_customer_revenues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `mp_customer_withdrawals`
--
ALTER TABLE `mp_customer_withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `mp_stores`
--
ALTER TABLE `mp_stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mp_vendor_info`
--
ALTER TABLE `mp_vendor_info`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_users`
--
ALTER TABLE `role_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;

--
-- AUTO_INCREMENT for table `simple_sliders`
--
ALTER TABLE `simple_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `simple_slider_items`
--
ALTER TABLE `simple_slider_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `slugs`
--
ALTER TABLE `slugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=317;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3804;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_meta`
--
ALTER TABLE `user_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
