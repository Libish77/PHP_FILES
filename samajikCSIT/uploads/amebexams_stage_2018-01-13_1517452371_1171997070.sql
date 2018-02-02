# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: ameb.ccdoyc0tfdcg.ap-southeast-2.rds.amazonaws.com (MySQL 5.6.34-log)
# Database: amebexams_stage
# Generation Time: 2018-01-13 07:01:39 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table account_holder_password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account_holder_password_resets`;

CREATE TABLE `account_holder_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `account_holder_password_resets_email_index` (`email`),
  KEY `account_holder_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table account_holders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account_holders`;

CREATE TABLE `account_holders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('teacher','parent','adult_learner','student') COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt_address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `school_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `api_identifier` enum('none','state','exams') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `other_phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suburb` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_holders_email_unique` (`email`),
  KEY `account_holders_role_index` (`role`),
  KEY `account_holders_state_id_index` (`state_id`),
  KEY `account_holders_country_id_index` (`country_id`),
  KEY `account_holders_status_index` (`status`),
  CONSTRAINT `account_holders_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `account_holders_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `account_holders` WRITE;
/*!40000 ALTER TABLE `account_holders` DISABLE KEYS */;

INSERT INTO `account_holders` (`id`, `title`, `role`, `first_name`, `last_name`, `email`, `password`, `phone`, `address`, `alt_address`, `city`, `preference`, `postcode`, `state_id`, `country_id`, `school_name`, `status`, `remember_token`, `created_at`, `updated_at`, `activated`, `api_identifier`, `other_phone`, `suburb`)
VALUES
	(1,'Mr','teacher','Mohammad','Sarfaraz','sarfaraz.yelko@gmail.com','$2y$10$Et5dN6KYLjcvxkn2bByfouw4ytRzzqM661U67JDEF65bhctimlUq6','0406551602','4 Trevannion Street',NULL,'Melbourne','buy-online-exam','3046',4,NULL,NULL,'active',NULL,'2018-01-12 16:55:32','2018-01-12 16:55:44',1,'none',NULL,NULL),
	(2,'Mr','teacher','Bhoj Raj','Bhatta','bhojraj.bhatta99@gmail.com','$2y$10$6uMWFgB6HOeBZ7IaXaUnUOTBsH6tv8np/PE7g4nEaTNQmtqWBud2K','9849962129','Sankhamul road, Kathmandu','Sankhamul road, Kathmandu','Kathmandu','buy-online-exam','446000',8,NULL,NULL,'active','htVK7aZJuDJTXgBH5UdTy1oyJRfTKl80cPTh0Q5iPIoFrHLbqKxANAMQZapU','2018-01-13 14:33:21','2018-01-13 14:34:14',1,'none','9849962129',NULL),
	(3,'None','teacher','NSW','Connect','nsw@test.ameb.edu.au','$2y$10$Et5dN6KYLjcvxkn2bByfouw4ytRzzqM661U67JDEF65bhctimlUq6','1234567890','Sydney',NULL,'Sydney','buy-online-exam','2000',2,NULL,NULL,'active',NULL,NULL,NULL,0,'state',NULL,NULL),
	(4,'None','teacher','Rising','Software','rs@test.ameb.edu.au','$2y$10$Et5dN6KYLjcvxkn2bByfouw4ytRzzqM661U67JDEF65bhctimlUq6','1234567890','Melbourne',NULL,'Melbourne','buy-online-exam','3000',NULL,NULL,NULL,'',NULL,NULL,NULL,0,'exams',NULL,NULL);

/*!40000 ALTER TABLE `account_holders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table account_holders_activations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account_holders_activations`;

CREATE TABLE `account_holders_activations` (
  `account_holder_id` int(10) unsigned NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `account_holders_activations_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table account_holders_update_approval
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account_holders_update_approval`;

CREATE TABLE `account_holders_update_approval` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('teacher','parent','adult_learner','student') COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt_address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `account_holders_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `school_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `approve_status` enum('approved','disapproved') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disapproved',
  `status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `suburb` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'NULL',
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `o_phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_holders_update_approval_role_index` (`role`),
  KEY `account_holders_update_approval_state_id_index` (`state_id`),
  KEY `account_holders_update_approval_account_holders_id_index` (`account_holders_id`),
  KEY `account_holders_update_approval_country_id_index` (`country_id`),
  KEY `account_holders_update_approval_approve_status_index` (`approve_status`),
  KEY `account_holders_update_approval_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table account_state
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account_state`;

CREATE TABLE `account_state` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) unsigned NOT NULL,
  `state_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_state_account_id_index` (`account_id`),
  KEY `account_state_state_id_index` (`state_id`),
  CONSTRAINT `account_state_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `account_holders` (`id`),
  CONSTRAINT `account_state_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table banners
# ------------------------------------------------------------

DROP TABLE IF EXISTS `banners`;

CREATE TABLE `banners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibility` enum('visible','not_visible') COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_text` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_link` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_target` enum('parent','newtab') COLLATE utf8mb4_unicode_ci NOT NULL,
  `second_button_status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `second_button_text` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_button_link` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_button_target` enum('parent','newtab') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `banners_status_index` (`status`),
  KEY `banners_visibility_index` (`visibility`),
  KEY `banners_button_status_index` (`button_status`),
  KEY `banners_button_target_index` (`button_target`),
  KEY `banners_second_button_status_index` (`second_button_status`),
  KEY `banners_second_button_target_index` (`second_button_target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table candidate_archive_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `candidate_archive_history`;

CREATE TABLE `candidate_archive_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exam_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_pin` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('male','female','other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `ameb_candidate_no` int(11) NOT NULL,
  `lui_number` int(11) DEFAULT NULL,
  `registration_year` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exam_id` bigint(20) NOT NULL,
  `account_holder_id` bigint(20) unsigned NOT NULL,
  `is_class_exam` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `class_identifier` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enrollment_status` enum('active','expired','inactive','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_detail_id` bigint(20) unsigned NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `edit_candidates_exam_key_index` (`exam_key`),
  KEY `edit_candidates_account_holder_id_index` (`account_holder_id`),
  KEY `edit_candidates_purchase_detail_id_index` (`purchase_detail_id`),
  CONSTRAINT `edit_candidates_account_holder_id_foreign` FOREIGN KEY (`account_holder_id`) REFERENCES `account_holders` (`id`),
  CONSTRAINT `edit_candidates_purchase_detail_id_foreign` FOREIGN KEY (`purchase_detail_id`) REFERENCES `purchase_details` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table carts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `carts`;

CREATE TABLE `carts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_holder_id` bigint(20) unsigned NOT NULL,
  `payment_method` enum('card','paypal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_placed_timestamp` datetime DEFAULT NULL,
  `order_paid_timestamp` datetime DEFAULT NULL,
  `payment_status` enum('incomplete','complete','declined') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'incomplete',
  `status` enum('incomplete','complete') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('exam','course') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'exam',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_account_holder_id_index` (`account_holder_id`),
  KEY `carts_invoice_id_index` (`invoice_id`),
  CONSTRAINT `carts_account_holder_id_foreign` FOREIGN KEY (`account_holder_id`) REFERENCES `account_holders` (`id`),
  CONSTRAINT `carts_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;

INSERT INTO `carts` (`id`, `account_holder_id`, `payment_method`, `payer_email`, `paid_amount`, `transaction_id`, `payer_name`, `order_placed_timestamp`, `order_paid_timestamp`, `payment_status`, `status`, `type`, `created_at`, `updated_at`, `invoice_id`)
VALUES
	(1,1,'paypal','wpfixfizz-buyer@gmail.com','138.00','LQSUNGUZNTSNA','test buyer','2018-01-12 16:59:09','2018-01-12 17:01:57','complete','complete','exam','2018-01-12 16:59:09','2018-01-12 17:01:57',1),
	(2,2,'paypal','wpfixfizz-buyer@gmail.com','76.00','LQSUNGUZNTSNA','test buyer','2018-01-13 14:35:32','2018-01-13 14:36:24','complete','complete','exam','2018-01-13 14:35:32','2018-01-13 14:36:24',2),
	(3,1,'paypal','wpfixfizz-buyer@gmail.com','70.00','LQSUNGUZNTSNA','test buyer','2018-01-13 15:27:11','2018-01-13 15:29:06','complete','complete','exam','2018-01-13 15:27:11','2018-01-13 15:29:06',4);

/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibility` enum('visible','not_visible') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `availability` enum('available','not_available') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_visibility_index` (`visibility`),
  KEY `categories_status_index` (`status`),
  KEY `categories_availability_index` (`availability`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image`, `visibility`, `status`, `availability`, `created_at`, `updated_at`)
VALUES
	(1,'Online Exam Theory','online-exam-theory','Onlin Exam Theory','','visible','active','available',NULL,NULL);

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cms_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_pages`;

CREATE TABLE `cms_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` enum('visible','hidden') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_on_menu` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_quick_links` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_position` int(10) unsigned NOT NULL,
  `parent_page_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_pages_parent_page_id_foreign` (`parent_page_id`),
  KEY `cms_pages_visibility_index` (`visibility`),
  KEY `cms_pages_status_index` (`status`),
  KEY `cms_pages_display_on_menu_index` (`display_on_menu`),
  KEY `cms_pages_add_quick_links_index` (`add_quick_links`),
  CONSTRAINT `cms_pages_parent_page_id_foreign` FOREIGN KEY (`parent_page_id`) REFERENCES `cms_parent_pages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cms_pages` WRITE;
/*!40000 ALTER TABLE `cms_pages` DISABLE KEYS */;

INSERT INTO `cms_pages` (`id`, `title`, `slug`, `description`, `file`, `visibility`, `status`, `display_on_menu`, `add_quick_links`, `menu_position`, `parent_page_id`, `created_at`, `updated_at`)
VALUES
	(1,'Privacy','privacy','<p><strong>PRIVACY POLICY</strong></p>\r\n\r\n<p><br />\r\nThe Australian Music Examinations Board [www.amebexams.edu.au] web site (<strong>Web Site</strong>) is owned and operated by Australian Music Examinations Board Limited ACN 102 374 587 (<strong>AMEB</strong>). AMEB is committed to protecting the information and privacy of persons accessing this Web Site (<strong>You or Your)</strong>.</p>\r\n\r\n<p>As a user of this Web Site, You are interested in how information collected about You by the Web Site is handled.</p>\r\n\r\n<p>AMEB is committed to complying with the Australian Privacy Principles in the Privacy Act 1988 (Cth).</p>\r\n\r\n<p>By visiting this Web Site and requesting information on or through this Web Site, you agree to the terms of this Privacy Policy, as they may be amended from time to time. If You have any questions, or would like to provide feedback, please feel free to contact us on the number or address listed below.</p>\r\n\r\n<p><strong>The Privacy Practices of AMEB</strong></p>\r\n\r\n<p><strong>1. What is personal information and why do we collect it?</strong></p>\r\n\r\n<p>&#39;Personal information&#39; means information or an opinion (including information or an opinion forming part of a database), whether true or not, and whether recorded in a material form or not, about an individual whose identity is apparent, or can reasonably be ascertained, from the information or opinion.&nbsp;</p>\r\n\r\n<p>We collect and use personal information to:</p>\r\n\r\n<ul>\r\n	<li>Meet legal and regulatory requirements.</li>\r\n	<li>Authorise and process customer transactions.</li>\r\n	<li>Detect and prevent fraud and other illegal uses of our services.</li>\r\n	<li>Develop, offer, and manage the various products and services provided by our company.</li>\r\n	<li>Troubleshoot any problems we may have with our services.</li>\r\n	<li>Provide marketing notices, service updates and any promotional offers.</li>\r\n</ul>\r\n\r\n<p><strong>2. How do we collect personal information?</strong></p>\r\n\r\n<p>Any registration information You provide to an Australian Music Examinations Board office located in your state (AMEB State Office) for the AMEB online examinations (<strong>AMEB Online Examination</strong>) will be retained by AMEB as well as the AMEB State Office. We collect this information directly from You and we will limit the personal information we collect to that which is necessary for our functions and activities.</p>\r\n\r\n<p>AMEB may also collect information about Your use of the Web Site such as what pages You visit and the Internet address You have come from.</p>\r\n\r\n<p>Any further collection of Your personal information than that explained here will only occur with Your consent.</p>\r\n\r\n<p><strong>3. Storage</strong></p>\r\n\r\n<p>We store Your personal information securely, and our staff are required to ensure that Your personal information is not misplaced or misused, and that unauthorised access to, or modification or disclosure of, Your personal information does not occur.</p>\r\n\r\n<p>We will endeavour to destroy Your personal information as soon as it is no longer required by us (and this is permitted by law).</p>\r\n\r\n<p><strong>4. How do we share your personal information with others?</strong></p>\r\n\r\n<p>Any information collected by AMEB will be treated as confidential. We will generally only use or disclose Your personal information for the purpose for which we collected it and for related purposes we consider will be within Your reasonable expectations. For example:</p>\r\n\r\n<ul>\r\n	<li>We may use Your personal information in providing You with information or services You request, and in tailoring Your experience of our site to Your interests. With Your consent, we will send You updates on new features, products and content that we think You are likely to be interested in.</li>\r\n	<li>AMEB may also use pooled information obtained from all AMEB visitors to understand our users&#39; interests and improve our services. These reports may be shared with the partners and sponsors of AMEB but they will not disclose personally identifiable information.</li>\r\n	<li>We may use Your personal information for any marketing and survey purpose to send information to You about additional goods or services that may be of interest to You. In addition, we may disclose Your personal information to third party agents and independent contractors to help us conduct our marketing and survey efforts including but not limited to direct marketing.</li>\r\n	<li>AMEB may disclose Your personal information to other AMEB State Offices, however, other than as stated in this Privacy Policy AMEB will not disclose any of Your personal information to any other third party, except when it has Your permission or under special circumstances, such as when we believe in good faith that the law requires disclosure or where we believe it necessary to provide You with a service which You have requested.</li>\r\n</ul>\r\n\r\n<p>Like many businesses, AMEB uses a range of service providers (including overseas entities) to help us maximise the quality and efficiency of our services and our business operations. This means that individuals and organisations outside of AMEB, such as web hosting services, will sometimes have access to personal information held by AMEB and may use it on behalf of AMEB. We require our service providers to adhere to strict privacy guidelines and not to keep this information or use it for any unauthorised purposes.</p>\r\n\r\n<p><strong>5. How Can You Update Your Personal Information?</strong></p>\r\n\r\n<p>AMEB will try to ensure that Your personal information is kept up to date, complete and as accurate as possible and may from time to time contact you to update your details.</p>\r\n\r\n<p>If at any time You want to know exactly what personal information we hold about You, You are welcome to access Your record by emailing us at office@ameb.edu.au. We may require You to pay a fee in order to access Your personal information held by us. We will advise You of the amount of the fee payable (if any) once we have assessed Your application for access.</p>\r\n\r\n<p>If You lodge a request for access, we may provide You with access to Your personal information in any of a number of ways (including, for example, supplying You with a copy of Your personal information, or providing You with the opportunity to view Your personal information).</p>\r\n\r\n<p>If You establish that any personal information we hold about You is not accurate, complete and up-to-date, to our reasonable satisfaction, we will amend our records accordingly.</p>\r\n\r\n<p>Please notify us if your personal details change so that we may keep our records up-to-date.</p>\r\n\r\n<p><strong>6. Our Web Site Privacy Practices</strong></p>\r\n\r\n<p>We sometimes use cookie technology on our Web Site to enable us to provide information and services to Web Site visitors. Cookies are pieces of information that a Web Site transfers to Your computer&#39;s hard disk for record keeping purposes and are a necessary part of facilitating online transactions. Most web browsers are set to accept cookies. AMEB uses cookies to make Your use of our Web Site and services as enjoyable as possible. Cookies in and of themselves do not personally identify users, although they do identify a user&#39;s browser. Cookies are useful to estimate our number of members and determine overall traffic patterns through our Web Site, as well as responding to Your requests for particular services.</p>\r\n\r\n<p>If You do not wish to receive any cookies You may set Your browser to refuse cookies. This may mean You will not be able to take full advantage of AMEB services.</p>\r\n\r\n<p><strong>7. Automatic Server Logs</strong></p>\r\n\r\n<p>Our Web Site server automatically collects various items of information when You use our Web Site, including:&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Your IP (&quot;Internet Protocol&quot;) address (which, in general terms, is a unique identifier assigned to Your computer when it is connected to the internet);</li>\r\n	<li>the operating system and internet browser software You are currently using; and</li>\r\n	<li>the data that You download (such as web pages or other document files or software), and the time that You download it.</li>\r\n</ul>\r\n\r\n<p>Although, in some circumstances, it may be possible to identify You from this information, we do not attempt to do so, and only use this information for statistical analysis, system administration, and similar related purposes. This information is not disclosed to any other party.</p>\r\n\r\n<p><strong>8. Email and message forms</strong></p>\r\n\r\n<p>We may collect personal information from You (such as your name, address, telephone number and email address, and any other personal information You volunteer) if You send us an email or if You submit information to us using a message or feedback form. We will use this personal information to contact You to respond to Your message, to send you information that You request, and for other related purposes we consider are within Your reasonable expectations. We will not use or disclose any such information for any other purpose without Your consent.</p>\r\n\r\n<p><strong>9. Links to other sites</strong></p>\r\n\r\n<p>If any of our online services (including any email messages we send to you) contain links to other online services that are not maintained by us (<strong>Other Services</strong>), or if Other Services link to our online services, we are not responsible for the privacy practices of the organisations that operate those other services, and by providing such links we do not endorse or approve the other services. This Privacy Policy applies only in respect of AMEB.&nbsp;</p>\r\n\r\n<p><strong>10. Storage and security</strong></p>\r\n\r\n<p>AMEB will endeavour to take all reasonable steps to ensure Your personal information is kept secure, accurate and up-to-date. Your information is stored on secure servers that are protected in controlled facilities. Unfortunately, no data transmission over the internet can be guaranteed to be 100% secure. So, while AMEB make use of available technology, such as encryption software, to protect Your personal information, AMEB cannot give an absolute assurance that the information You provide to AMEB will be secure at all times. You accordingly do so at Your own risk and AMEB will not be held responsible for events arising from unauthorised access to Your personal information.</p>\r\n\r\n<p><strong>Contact us:</strong><br />\r\nIf You have questions about our Privacy Policy and practices, would like to provide feedback or would like to access your personal information held by us, please contact us.</p>\r\n\r\n<p>Email:</p>\r\n\r\n<p>office@ameb.edu.au</p>\r\n\r\n<p><strong>Mail:</strong><br />\r\nAustralian Music Examinations Board<br />\r\nPrivacy Officer<br />\r\nLevel 5&nbsp;<br />\r\n175 Flinders Lane<br />\r\nMelbourne Vic 3000</p>\r\n\r\n<p><strong>Future Changes</strong><br />\r\nAMEB will continue to evolve as we introduce new services and features to our Web Site. Because of this, from time to time, our policies will be reviewed and may be revised. AMEB reserves the right to change its Privacy Policy at any time and notify You by posting an updated version of the policy on the Web Site. If You object to any changes, You may discontinue Your use of the services. The amended Privacy Policy will apply between AMEB and You whether or not we have given You specific notice of any change.</p>\r\n\r\n<p>Last revised: 11 March 2014</p>\r\n\r\n<p>Copyright &copy; 2014 Australian Music Examinations Board Limited. All rights reserved</p>',NULL,'visible','active','no','yes',1,NULL,'2018-01-11 02:35:29','2018-01-11 02:39:31'),
	(2,'Terms and Conditions','terms-and-conditions','<p><strong>TERMS AND CONDITIONS</strong></p>\r\n\r\n<p>The Australian Music Examinations Board [www.amebexams.edu.au] web site (<strong>Web Site</strong>) is owned and operated by Australian Music Examinations Board Limited ACN 102 374 587 (<strong>AMEB</strong>). These terms and conditions set out below constitute a legally binding agreement between the person accessing, using or viewing the Web Site (<strong>You or Your</strong>) and AMEB.</p>\r\n\r\n<p><strong>1. TERMS</strong></p>\r\n\r\n<p>1.1 Your access to and use of the Web Site is conditional upon Your acceptance of and compliance with all terms, conditions, notices, polices and disclaimers contained in these terms and conditions and anywhere else in the Web Site <strong>(Terms). BY ACCESSING AND/OR USING THE WEB SITE YOU INDICATE YOUR ACCEPTANCE OF THE TERMS. IF YOU DO NOT ACCEPT THESE TERMS, YOU MUST STOP USING THIS SITE IMMEDIATELY.</strong> AMEB reserves the right to change the Terms at any time, and any continued access/use of the Website after such change constitutes acceptance of these changes by You.</p>\r\n\r\n<p>1.2 AMEB may amend or modify these Terms from time to time.&nbsp;</p>\r\n\r\n<p><strong>2. AMEB ONLINE EXAMINATION REGISTRATION</strong></p>\r\n\r\n<ul>\r\n	<li>You acknowledge that the AMEB Online Examination is conducted and administered by AMEB (including the collection of all fees and charges set by the relevant AMEB State Office) on behalf of the relevant AMEB State Office.</li>\r\n	<li>Any registration information you provide to an Australian Music Examinations Board office located in your state (<strong>AMEB State Office</strong>) for the purpose of the AMEB online examination (<strong>AMEB Online Examination</strong>) will be retained by AMEB as well as the AMEB State Office.</li>\r\n	<li>You agree to provide true and accurate information as prompted by the registration form (<strong>Registration Information</strong>). When You register, You must provide Your real name and location and any other such details as requested on the registration form.</li>\r\n	<li>By providing Your Registration Information You undertake to sit for the AMEB Online Examination under full supervision and to complete the AMEB Online Examination independently.</li>\r\n	<li>If You provide any information that is untrue, inaccurate or inappropriate or if AMEB has reasonable grounds to suspect that such information is untrue, inaccurate or inappropriate, AMEB may request that the relevant AMEB State Office temporarily suspend, indefinitely suspend or terminate Your registration or results from the AMEB Online Examination. AMEB accepts that You may make a mistake when registering information about You, and that You will need to correct such mistakes. However, AMEB may request that a AMEB State Office temporarily or indefinitely suspend or terminate Your regisitration if certain details about You (e.g., Your location) are changed on more than one occasion.</li>\r\n</ul>\r\n\r\n<p><strong>3. DISCLAIMER AND LIABILTY LIMIT</strong></p>\r\n\r\n<p>3.1 Except where expressly stated, AMEB makes no representations about the content and suitability for any purpose of the information contained in the Web Site. It is provided &#39;as is&#39; without express or implied warranty of any kind. To the extent permitted by law, AMEB and the AMEB State Office specifically disclaim any implied warranty of title, merchantability, fitness for a particular purpose and non-infringement.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>3.2 Other than warranties and conditions implied by relevant legislation including the Trade Practices Act 1974 (Cth), the exclusion of which from an agreement would contravene that statute or cause part or all of this clause to be void (Non-excludable Condition), AMEB and the AMEB State Office exclude all terms, conditions and warranties in relation to all services, information and other material provided, or intended to be provided, through the Web Site. In the event AMEB or the AMEB State Office is liable to You arising from a breach of any Non-excludable Condition (other than one implied by section 69 of the Trade Practices Act 1974), AMEB limits its liability to You for that breach, to the lesser of:</p>\r\n\r\n<ul>\r\n	<li>The amount of fees paid to AMEB or the AMEB State Office in the 12 months prior to the action giving rise to the liability; or</li>\r\n	<li>$99.00(AUD).</li>\r\n</ul>\r\n\r\n<p>3.3 Other than liability for any Non-excludable Condition, AMEB and the AMEB State Office exclude all liability for any damages whatsoever including any special, indirect or consequential damages resulting from loss of use, data or profits, whether in an action in contract, negligence or other tort, statute or otherwise arising out of or in connection with access to or use of the Web Site or the use or performance of information contained in it.</p>\r\n\r\n<p>3.4 Neither AMEB and the AMEB State Office nor any of their employees, agents or third party content providers or licensors warrants that the Web Site will be uninterrupted or error-free.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>4. RELEASE</strong></p>\r\n\r\n<p>4.1 To the extent permitted by law AMEB and the AMEB State Office specifically disclaim all liability for any loss or damage whether actual, special, direct, indirect or consequential of every kind and nature arising out of or in any way connected with the transaction.</p>\r\n\r\n<p>4.2 AMEB and the AMEB State Office reserve the right to plead these Terms as a bar to any claim, action, proceeding or suit brought by You against AMEB or the AMEB State Office for any matter arising out of or in connection to any transaction or dealing or otherwise in respect of these Terms.</p>\r\n\r\n<p><strong>5. BREACH</strong></p>\r\n\r\n<p>Without limiting other remedies available to AMEB at law, equity or under these Terms, AMEB reserves the right without notice to You and in its sole discretion to, being exercised reasonably and having regard to the circumstances, issue You with a warning, restrict Your activities if You breach these Terms.</p>\r\n\r\n<p><strong>6. INDEMNITY</strong></p>\r\n\r\n<p>AMEB accepts no responsibility for Your actions or omissions, and You agree by accessing and/or using the Web Site, to indemnify and hold harmless AMEB and the AMEB State Office their related bodies corporate and their employees, officers, agents and contractors from and against all actions, proceedings, suits, claims, demands and costs (on a full indemnity basis) brought or made against AMEB and/or the AMEB State Office by any person arising from or in consequence of such an actions or omissions, and from and against any direct or indirect damage, loss, cost or expense suffered or incurred by AMEB and/or the AMEB State Office, including in relation to any content or material You contribute to the Web Site (e.g. through feedback, Q&amp;A or forums).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>7. INTELLECTUAL PROPERTY RIGHTS</strong></p>\r\n\r\n<p>7.1 All content and functionality, including all information, text, images, graphics, sound, stories, competitions, software and advertisements contained in the Web Site (Material) are protected by International and Australian law, including Copyright and Trademark law, and all rights are reserved. Except where expressly stated all Material on the Web Site is presented for Your information only, and You are not permitted to download or reproduce any material except when reasonably necessary to access and/or use the Web Site. When You access the Web Site, You agree that You do so, on the following conditions:</p>\r\n\r\n<ul>\r\n	<li>Except as noted above, You may access, use, retrieve, review or download the Material for Your personal information only.</li>\r\n	<li>You may save a local copy of or print Material from the Web Site for Your own personal information, and to inform others about it, but You may not charge any fee for any use and all commercial use or exploitation of any Material on the Web Site is expressly prohibited.</li>\r\n	<li>Any copyright notice or mark appearing on any Material on the Web Site must be included on any copy You make.</li>\r\n	<li>You must keep all Material intact and in the same form as presented on the Web Site; You may not modify it without the express permission of AMEB.</li>\r\n	<li>You must not reproduce, republish or otherwise make available any Material from the Web Site on the internet or any means including by other publicly accessible media (eg, newspaper, television or radio) without the specific written consent of AMEB.</li>\r\n	<li>You must not use the Web Site or any of the Material contained in it for any purpose which is unlawful, prohibited under these Terms, or which violates any right of AMEB or any other owner of any rights in the Material contained in the Web Site.</li>\r\n</ul>\r\n\r\n<p>7.2 These Terms replace entirely any implied licence terms that might otherwise apply to the Material on this Web Site. AMEB explicitly prohibits use of the Material on this Web Site in any manner other than as expressly licensed in these Terms. Activities You must not engage in include:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>making a copy, modification, adaptation or reselling or redistributing any Material on this Web Site;</li>\r\n	<li>any commercial use of Material on this Web Site, unless such use is authorised in writing by AMEB;</li>\r\n	<li>any form of representation, including linking or framing, that could mislead or deceive a person into believing that the Material is from a source other than the Web Site;</li>\r\n	<li>any use of or access to the Web Site by any automatic tool, including &quot;spiders&quot;, &quot;crawlers&quot;, &quot;robots&quot; or offline browsing tools; or</li>\r\n	<li>any access or use of the Web Site by any means that is contrary to the commercial interests of AMEB (e.g., to facilitate a means of encouraging users of the Web Site to use another website offering services similar to those on the Web Site).</li>\r\n</ul>\r\n\r\n<p><strong>8. TRADEMARK</strong></p>\r\n\r\n<p>The &quot;AMEB&quot; and &quot;Australian Music Examinations Board&quot; trademarks are registered trademarks of Australian Music Examination Board Limited and may not be used without the prior specific and written permission of AMEB. No other trademark appearing in the Web Site may be used without the prior specific and written permission of AMEB.</p>\r\n\r\n<p><strong>9. HOTLINKS</strong></p>\r\n\r\n<p>The Web Site may contain hyperlinks to internet web sites operated by third parties (e.g. associates and affiliates of AMEB such as a AMEB State Office). AMEB is not responsible for the contents of any linked web site or any hyperlink contained in the linked web site. The inclusion of any link does not imply any endorsement of the linked web site by AMEB. Any link within the Web Site, which takes You to a third-party web site is clicked on entirely at Your own risk. AMEB does not endorse or in any way adopt representations made by advertisers on or proprietors of the web site or any linked web site, nor are any offers made by such advertisers on or proprietors of the web site also made by AMEB.</p>\r\n\r\n<p><strong>10. DEALINGS WITH THIRD PARTIES</strong></p>\r\n\r\n<p>Any dealings between You and third parties through this Web Site, including an AMEB State Office and their terms, conditions, warranties or representations, are solely between You and such third parties and You agree that AMEB is not responsible or liable for any loss or damage of any kind incurred as a result of such dealings or as the result of the presence of the third parties on this Web Site.</p>\r\n\r\n<p><strong>11. NOTICES</strong></p>\r\n\r\n<p>Notices to You may be made by various means, including either by email, regular mail or by displaying notices or links to notices on the Web Site.</p>\r\n\r\n<p><strong>12. GOVERNING LAW</strong></p>\r\n\r\n<p>The Terms constitute the entire agreement between You and AMEB and will be governed by the Laws of Victoria, Australia. If any provisions of the Terms are found to be invalid or unenforceable by a court of law, it will be severed and will not affect the remainder of the Terms, which will continue in full force and effect. All rights not expressly granted are reserved.</p>\r\n\r\n<p><strong>13. PRIVACY POLICY</strong></p>\r\n\r\n<p>Personally identifiable information may be gathered from Web Site registration, contest registration, content submissions, community postings, suggestions, voting activities and transactional areas. Such information is subject to AMEB&#39;s Privacy Policy. For more information, please see our full Privacy Policy at http://www.webeddev.com/amebexam/privacy,php%22. In general, Your information will not be sold or otherwise transferred to third parties not associated or affiliated with AMEB without Your approval being obtained. For the avoidance of any doubt, the AMEB will share and disclose your personal information to other AMEB State Offices are reasonably required .By providing information in such a manner You agree that it may be used for the purposes for which it is sought (for example, for the delivery of e-mail services or e-commerce transactions). You consent to AMEB forwarding personally identifiable information that is gathered to research agencies for the purposes of conducting surveys on AMEB&#39;s behalf.</p>\r\n\r\n<p><strong>The information contained on this Web Site is subject to change without notice.&nbsp;</strong></p>\r\n\r\n<p>This page last updated: 1 November 2009</p>\r\n\r\n<p>Copyright @&nbsp;2009 Australian Music Examinations Board Limited. All rights reserved</p>',NULL,'visible','active','no','yes',2,NULL,'2018-01-11 02:47:26','2018-01-12 00:26:30'),
	(3,'Exam Policy','exam-policy','<p><strong>ON LINE EXAMINATION POLICY</strong></p>\r\n\r\n<ol>\r\n	<li>Candidates and Supervisors are expected to comply with all policies regarding the conduct of online examinations.</li>\r\n	<li>The candidate will undertake the examination without recourse to any aid (including but not limited to written notes, music scores, recordings, internet sites - other than www.amebexams.edu.au - and books) beyond those provided by the examination itself during the course of the examination.</li>\r\n	<li>The candidate will undertake the examination without recourse to any other person during the course of the examination.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>EXAMINATION CONDUCT - SUPERVISOR PROTOCOL</strong></p>\r\n\r\n<ol>\r\n	<li>The examination must be supervised by an adult 18 years of age or older (Supervisor).</li>\r\n	<li>The Supervisor must sign an electronic declaration confirming they take responsibility for supervising the candidate for the duration of the examination according to the terms of the Examination Policy.</li>\r\n	<li>The Supervisor must provide their name and a contact phone number when completing the electronic declaration.</li>\r\n	<li>The Supervisor must be present for the duration of the examination.</li>\r\n	<li>The Supervisor must take all reasonable steps to ensure that the candidate undertaking the examination is the same person who has completed the entry information for the examination.</li>\r\n	<li>The Supervisor must take all reasonable steps to ensure that the candidate undertaking the examination does not have recourse to any aid (including but not limited to written notes, music scores, recordings, internet sites -other than www.amebexams.edu.au- and books) beyond those provided by the examination itself during the course of the examination.</li>\r\n	<li>The Supervisor must take all reasonable steps to ensure that the candidate has no recourse to any other person during the course of the examination.</li>\r\n	<li>The Supervisor must be prepared to receive a phone call from AMEB to confirm they supervised the examination.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>EXAMINATION TIME</strong></p>\r\n\r\n<ol>\r\n	<li>The examination will be timed and will end when the candidate clicks on &#39;send&#39; or when the time allowed expires</li>\r\n	<li>If a candidate is unable to complete an examination for reasons of illness or external factors (eg power black out) the examination key will remain current and they will be able to resit the examination. In this circumstance the candidate will have to begin a new randomly generated examination at a time of their choice.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>EXAMINATION BREACH</strong></p>\r\n\r\n<ol>\r\n	<li>In the event that a candidate breaches the examination policy they will be subject to a review by AMEB the outcomes of which includes their result being rescinded and may result in the candidate being banned from undertaking further examinations with AMEB.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>APPEALS</strong></p>\r\n\r\n<ol>\r\n	<li>Any Candidate who believes that they have identified an error in a question or an ambiguity that prevents the question from being answered sufficient to prejudice the outcome of the examination for the Candidate is encouraged to contact the Federal Office of the AMEB as soon as possible after the completion of the examination. The verified existence of such errors or ambiguities may constitute grounds for appeal.</li>\r\n	<li>An appeal will normally need to be made in writing and addressed to:\r\n	<p>General Manager</p>\r\n\r\n	<p>AMEB</p>\r\n\r\n	<p>5/175 Flinders Lane</p>\r\n\r\n	<p>Melbourne VIC 3000</p>\r\n\r\n	<p>Or by email to:</p>\r\n\r\n	<p>office@ameb.edu.au</p>\r\n	</li>\r\n	<li>The Federal Office will undertake a review of any question identified as containing a putative error or ambiguity.</li>\r\n	<li>In situations in which the Federal Office confirms the existence of an error or an ambiguity sufficient to prejudice the outcome of the examination for the candidate, the Federal Office will determine the course of action to be taken in regard to the question (including but not limited to awarding full marks for the affected question).</li>\r\n	<li>The finding of the Federal Office regarding questions affected in these ways is final and may not be further appealed.</li>\r\n</ol>',NULL,'visible','active','no','yes',3,NULL,'2018-01-11 03:01:52','2018-01-11 03:01:52'),
	(4,'Sample Paper','sample-paper','<p><strong>Sample Paper</strong></p>\r\n\r\n<p>Click below to sample an online exam. This sample paper is incomplete, (containing only a small selection of questions from the Grade 1 Theory exam) and is not suitable for exam preparation. Purchase an exam to access complete, unlimited practice exams in the relevant subject and grade.</p>\r\n\r\n<p>To try out a sample Theory of Music paper Click Here</p>',NULL,'visible','active','yes','no',4,NULL,'2018-01-11 18:27:46','2018-01-11 18:27:46'),
	(5,'Tutorials','tutorials','<p><strong>TUTORIALS</strong></p>\r\n\r\n<p>To make it easy for new users to learn how the online examinations work, AMEB have provided video tutorials covering all aspects of the examinations. Watch the example tutorial below and see just how easy it is to learn how to use AMEB online examinations.</p>\r\n\r\n<p>This is an example of one tutorial. To see all the tutorials and to get the full benefits of this site please register using the menu on the left.</p>\r\n\r\n<p>Name the notes</p>',NULL,'visible','active','yes','no',5,NULL,'2018-01-11 18:29:23','2018-01-11 18:29:23'),
	(6,'About AMEB','about-ameb','<p><strong>ABOUT AMEB</strong></p>\r\n\r\n<p>Mission Statement: The AMEB exists to provide a graded system of examinations in music and in speech and drama, by offering high quality syllabuses, educative services to our teachers, examiners and candidates, and quality publications that are produced to the highest editorial standard.</p>\r\n\r\n<p>The AMEB Tradition - The Measure of Excellence: The AMEB (Australian Music Examinations Board) conducts examinations in music and speech education. Its accreditation is recognised professionally not only within Australia but also overseas, where it is one of the most respected bodies in this field.</p>\r\n\r\n<p>AMEB examinations are based on syllabuses designed by leading scholars and performers which are regularly updated to ensure that they reflect an appropriate range of performance skills and the latest musicological research. The content of these syllabuses is, wherever practical, published in affordable editions, ensuring that the cost to students of acquiring a full range of the set pieces is as simple and inexpensive as possible.</p>\r\n\r\n<p>Success: The AMEB&#39;s success in developing standards of performance and scholarship has been achieved through the support of teachers in all States. Our syllabuses are reviewed and developed in direct consultation with the people who use our examination system, and are written by leading teachers and performers. With the assistance of its examiners, the Board will continue to work in association with teachers to provide encouragement for students and to give them a sense of achievement. The Board believes that its activities ultimately lead to the enhancement of the cultural life of our community.</p>\r\n\r\n<p><strong>What we offer:</strong></p>\r\n\r\n<ul>\r\n	<li>a qualification that is widely recognised and respected</li>\r\n	<li>the only examination body with formal links to major Australian universities and Ministers for Education</li>\r\n	<li>the most widely used assessment system for Music, Speech and Drama in Australia</li>\r\n	<li>assessment from the preliminary to diploma level</li>\r\n	<li>highly trained examiners who are specialists in their instrument</li>\r\n	<li>detailed written reports for practical examinations</li>\r\n	<li>fresh and accessible syllabuses developed in consultation with teachers, parents and students</li>\r\n	<li>a wide range of repertoire available in the Manual Lists, in addition to AMEB publications</li>\r\n	<li>local teacher support and networks</li>\r\n	<li>quality publications</li>\r\n</ul>',NULL,'visible','active','yes','no',6,NULL,'2018-01-11 18:35:25','2018-01-11 18:35:25');

/*!40000 ALTER TABLE `cms_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cms_parent_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_parent_pages`;

CREATE TABLE `cms_parent_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `file` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'default.jpg',
  `visibility` enum('visible','hidden') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_parent_pages_visibility_index` (`visibility`),
  KEY `cms_parent_pages_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;

INSERT INTO `countries` (`id`, `name`, `code`, `flag`, `created_at`, `updated_at`)
VALUES
	(1,'Afghanistan','AFG','https://restcountries.eu/data/afg.svg',NULL,NULL),
	(2,'Åland Islands','ALA','https://restcountries.eu/data/ala.svg',NULL,NULL),
	(3,'Albania','ALB','https://restcountries.eu/data/alb.svg',NULL,NULL),
	(4,'Algeria','DZA','https://restcountries.eu/data/dza.svg',NULL,NULL),
	(5,'American Samoa','ASM','https://restcountries.eu/data/asm.svg',NULL,NULL),
	(6,'Andorra','AND','https://restcountries.eu/data/and.svg',NULL,NULL),
	(7,'Angola','AGO','https://restcountries.eu/data/ago.svg',NULL,NULL),
	(8,'Anguilla','AIA','https://restcountries.eu/data/aia.svg',NULL,NULL),
	(9,'Antarctica','ATA','https://restcountries.eu/data/ata.svg',NULL,NULL),
	(10,'Antigua and Barbuda','ATG','https://restcountries.eu/data/atg.svg',NULL,NULL),
	(11,'Argentina','ARG','https://restcountries.eu/data/arg.svg',NULL,NULL),
	(12,'Armenia','ARM','https://restcountries.eu/data/arm.svg',NULL,NULL),
	(13,'Aruba','ABW','https://restcountries.eu/data/abw.svg',NULL,NULL),
	(14,'Australia','AUS','https://restcountries.eu/data/aus.svg',NULL,NULL),
	(15,'Austria','AUT','https://restcountries.eu/data/aut.svg',NULL,NULL),
	(16,'Azerbaijan','AZE','https://restcountries.eu/data/aze.svg',NULL,NULL),
	(17,'Bahamas','BHS','https://restcountries.eu/data/bhs.svg',NULL,NULL),
	(18,'Bahrain','BHR','https://restcountries.eu/data/bhr.svg',NULL,NULL),
	(19,'Bangladesh','BGD','https://restcountries.eu/data/bgd.svg',NULL,NULL),
	(20,'Barbados','BRB','https://restcountries.eu/data/brb.svg',NULL,NULL),
	(21,'Belarus','BLR','https://restcountries.eu/data/blr.svg',NULL,NULL),
	(22,'Belgium','BEL','https://restcountries.eu/data/bel.svg',NULL,NULL),
	(23,'Belize','BLZ','https://restcountries.eu/data/blz.svg',NULL,NULL),
	(24,'Benin','BEN','https://restcountries.eu/data/ben.svg',NULL,NULL),
	(25,'Bermuda','BMU','https://restcountries.eu/data/bmu.svg',NULL,NULL),
	(26,'Bhutan','BTN','https://restcountries.eu/data/btn.svg',NULL,NULL),
	(27,'Bolivia (Plurinational State of)','BOL','https://restcountries.eu/data/bol.svg',NULL,NULL),
	(28,'Bonaire, Sint Eustatius and Saba','BES','https://restcountries.eu/data/bes.svg',NULL,NULL),
	(29,'Bosnia and Herzegovina','BIH','https://restcountries.eu/data/bih.svg',NULL,NULL),
	(30,'Botswana','BWA','https://restcountries.eu/data/bwa.svg',NULL,NULL),
	(31,'Bouvet Island','BVT','https://restcountries.eu/data/bvt.svg',NULL,NULL),
	(32,'Brazil','BRA','https://restcountries.eu/data/bra.svg',NULL,NULL),
	(33,'British Indian Ocean Territory','IOT','https://restcountries.eu/data/iot.svg',NULL,NULL),
	(34,'United States Minor Outlying Islands','UMI','https://restcountries.eu/data/umi.svg',NULL,NULL),
	(35,'Virgin Islands (British)','VGB','https://restcountries.eu/data/vgb.svg',NULL,NULL),
	(36,'Virgin Islands (U.S.)','VIR','https://restcountries.eu/data/vir.svg',NULL,NULL),
	(37,'Brunei Darussalam','BRN','https://restcountries.eu/data/brn.svg',NULL,NULL),
	(38,'Bulgaria','BGR','https://restcountries.eu/data/bgr.svg',NULL,NULL),
	(39,'Burkina Faso','BFA','https://restcountries.eu/data/bfa.svg',NULL,NULL),
	(40,'Burundi','BDI','https://restcountries.eu/data/bdi.svg',NULL,NULL),
	(41,'Cambodia','KHM','https://restcountries.eu/data/khm.svg',NULL,NULL),
	(42,'Cameroon','CMR','https://restcountries.eu/data/cmr.svg',NULL,NULL),
	(43,'Canada','CAN','https://restcountries.eu/data/can.svg',NULL,NULL),
	(44,'Cabo Verde','CPV','https://restcountries.eu/data/cpv.svg',NULL,NULL),
	(45,'Cayman Islands','CYM','https://restcountries.eu/data/cym.svg',NULL,NULL),
	(46,'Central African Republic','CAF','https://restcountries.eu/data/caf.svg',NULL,NULL),
	(47,'Chad','TCD','https://restcountries.eu/data/tcd.svg',NULL,NULL),
	(48,'Chile','CHL','https://restcountries.eu/data/chl.svg',NULL,NULL),
	(49,'China','CHN','https://restcountries.eu/data/chn.svg',NULL,NULL),
	(50,'Christmas Island','CXR','https://restcountries.eu/data/cxr.svg',NULL,NULL),
	(51,'Cocos (Keeling) Islands','CCK','https://restcountries.eu/data/cck.svg',NULL,NULL),
	(52,'Colombia','COL','https://restcountries.eu/data/col.svg',NULL,NULL),
	(53,'Comoros','COM','https://restcountries.eu/data/com.svg',NULL,NULL),
	(54,'Congo','COG','https://restcountries.eu/data/cog.svg',NULL,NULL),
	(55,'Congo (Democratic Republic of the)','COD','https://restcountries.eu/data/cod.svg',NULL,NULL),
	(56,'Cook Islands','COK','https://restcountries.eu/data/cok.svg',NULL,NULL),
	(57,'Costa Rica','CRI','https://restcountries.eu/data/cri.svg',NULL,NULL),
	(58,'Croatia','HRV','https://restcountries.eu/data/hrv.svg',NULL,NULL),
	(59,'Cuba','CUB','https://restcountries.eu/data/cub.svg',NULL,NULL),
	(60,'Curaçao','CUW','https://restcountries.eu/data/cuw.svg',NULL,NULL),
	(61,'Cyprus','CYP','https://restcountries.eu/data/cyp.svg',NULL,NULL),
	(62,'Czech Republic','CZE','https://restcountries.eu/data/cze.svg',NULL,NULL),
	(63,'Denmark','DNK','https://restcountries.eu/data/dnk.svg',NULL,NULL),
	(64,'Djibouti','DJI','https://restcountries.eu/data/dji.svg',NULL,NULL),
	(65,'Dominica','DMA','https://restcountries.eu/data/dma.svg',NULL,NULL),
	(66,'Dominican Republic','DOM','https://restcountries.eu/data/dom.svg',NULL,NULL),
	(67,'Ecuador','ECU','https://restcountries.eu/data/ecu.svg',NULL,NULL),
	(68,'Egypt','EGY','https://restcountries.eu/data/egy.svg',NULL,NULL),
	(69,'El Salvador','SLV','https://restcountries.eu/data/slv.svg',NULL,NULL),
	(70,'Equatorial Guinea','GNQ','https://restcountries.eu/data/gnq.svg',NULL,NULL),
	(71,'Eritrea','ERI','https://restcountries.eu/data/eri.svg',NULL,NULL),
	(72,'Estonia','EST','https://restcountries.eu/data/est.svg',NULL,NULL),
	(73,'Ethiopia','ETH','https://restcountries.eu/data/eth.svg',NULL,NULL),
	(74,'Falkland Islands (Malvinas)','FLK','https://restcountries.eu/data/flk.svg',NULL,NULL),
	(75,'Faroe Islands','FRO','https://restcountries.eu/data/fro.svg',NULL,NULL),
	(76,'Fiji','FJI','https://restcountries.eu/data/fji.svg',NULL,NULL),
	(77,'Finland','FIN','https://restcountries.eu/data/fin.svg',NULL,NULL),
	(78,'France','FRA','https://restcountries.eu/data/fra.svg',NULL,NULL),
	(79,'French Guiana','GUF','https://restcountries.eu/data/guf.svg',NULL,NULL),
	(80,'French Polynesia','PYF','https://restcountries.eu/data/pyf.svg',NULL,NULL),
	(81,'French Southern Territories','ATF','https://restcountries.eu/data/atf.svg',NULL,NULL),
	(82,'Gabon','GAB','https://restcountries.eu/data/gab.svg',NULL,NULL),
	(83,'Gambia','GMB','https://restcountries.eu/data/gmb.svg',NULL,NULL),
	(84,'Georgia','GEO','https://restcountries.eu/data/geo.svg',NULL,NULL),
	(85,'Germany','DEU','https://restcountries.eu/data/deu.svg',NULL,NULL),
	(86,'Ghana','GHA','https://restcountries.eu/data/gha.svg',NULL,NULL),
	(87,'Gibraltar','GIB','https://restcountries.eu/data/gib.svg',NULL,NULL),
	(88,'Greece','GRC','https://restcountries.eu/data/grc.svg',NULL,NULL),
	(89,'Greenland','GRL','https://restcountries.eu/data/grl.svg',NULL,NULL),
	(90,'Grenada','GRD','https://restcountries.eu/data/grd.svg',NULL,NULL),
	(91,'Guadeloupe','GLP','https://restcountries.eu/data/glp.svg',NULL,NULL),
	(92,'Guam','GUM','https://restcountries.eu/data/gum.svg',NULL,NULL),
	(93,'Guatemala','GTM','https://restcountries.eu/data/gtm.svg',NULL,NULL),
	(94,'Guernsey','GGY','https://restcountries.eu/data/ggy.svg',NULL,NULL),
	(95,'Guinea','GIN','https://restcountries.eu/data/gin.svg',NULL,NULL),
	(96,'Guinea-Bissau','GNB','https://restcountries.eu/data/gnb.svg',NULL,NULL),
	(97,'Guyana','GUY','https://restcountries.eu/data/guy.svg',NULL,NULL),
	(98,'Haiti','HTI','https://restcountries.eu/data/hti.svg',NULL,NULL),
	(99,'Heard Island and McDonald Islands','HMD','https://restcountries.eu/data/hmd.svg',NULL,NULL),
	(100,'Holy See','VAT','https://restcountries.eu/data/vat.svg',NULL,NULL),
	(101,'Honduras','HND','https://restcountries.eu/data/hnd.svg',NULL,NULL),
	(102,'Hong Kong','HKG','https://restcountries.eu/data/hkg.svg',NULL,NULL),
	(103,'Hungary','HUN','https://restcountries.eu/data/hun.svg',NULL,NULL),
	(104,'Iceland','ISL','https://restcountries.eu/data/isl.svg',NULL,NULL),
	(105,'India','IND','https://restcountries.eu/data/ind.svg',NULL,NULL),
	(106,'Indonesia','IDN','https://restcountries.eu/data/idn.svg',NULL,NULL),
	(107,'Côte d\'Ivoire','CIV','https://restcountries.eu/data/civ.svg',NULL,NULL),
	(108,'Iran (Islamic Republic of)','IRN','https://restcountries.eu/data/irn.svg',NULL,NULL),
	(109,'Iraq','IRQ','https://restcountries.eu/data/irq.svg',NULL,NULL),
	(110,'Ireland','IRL','https://restcountries.eu/data/irl.svg',NULL,NULL),
	(111,'Isle of Man','IMN','https://restcountries.eu/data/imn.svg',NULL,NULL),
	(112,'Israel','ISR','https://restcountries.eu/data/isr.svg',NULL,NULL),
	(113,'Italy','ITA','https://restcountries.eu/data/ita.svg',NULL,NULL),
	(114,'Jamaica','JAM','https://restcountries.eu/data/jam.svg',NULL,NULL),
	(115,'Japan','JPN','https://restcountries.eu/data/jpn.svg',NULL,NULL),
	(116,'Jersey','JEY','https://restcountries.eu/data/jey.svg',NULL,NULL),
	(117,'Jordan','JOR','https://restcountries.eu/data/jor.svg',NULL,NULL),
	(118,'Kazakhstan','KAZ','https://restcountries.eu/data/kaz.svg',NULL,NULL),
	(119,'Kenya','KEN','https://restcountries.eu/data/ken.svg',NULL,NULL),
	(120,'Kiribati','KIR','https://restcountries.eu/data/kir.svg',NULL,NULL),
	(121,'Kuwait','KWT','https://restcountries.eu/data/kwt.svg',NULL,NULL),
	(122,'Kyrgyzstan','KGZ','https://restcountries.eu/data/kgz.svg',NULL,NULL),
	(123,'Lao People\'s Democratic Republic','LAO','https://restcountries.eu/data/lao.svg',NULL,NULL),
	(124,'Latvia','LVA','https://restcountries.eu/data/lva.svg',NULL,NULL),
	(125,'Lebanon','LBN','https://restcountries.eu/data/lbn.svg',NULL,NULL),
	(126,'Lesotho','LSO','https://restcountries.eu/data/lso.svg',NULL,NULL),
	(127,'Liberia','LBR','https://restcountries.eu/data/lbr.svg',NULL,NULL),
	(128,'Libya','LBY','https://restcountries.eu/data/lby.svg',NULL,NULL),
	(129,'Liechtenstein','LIE','https://restcountries.eu/data/lie.svg',NULL,NULL),
	(130,'Lithuania','LTU','https://restcountries.eu/data/ltu.svg',NULL,NULL),
	(131,'Luxembourg','LUX','https://restcountries.eu/data/lux.svg',NULL,NULL),
	(132,'Macao','MAC','https://restcountries.eu/data/mac.svg',NULL,NULL),
	(133,'Macedonia (the former Yugoslav Republic of)','MKD','https://restcountries.eu/data/mkd.svg',NULL,NULL),
	(134,'Madagascar','MDG','https://restcountries.eu/data/mdg.svg',NULL,NULL),
	(135,'Malawi','MWI','https://restcountries.eu/data/mwi.svg',NULL,NULL),
	(136,'Malaysia','MYS','https://restcountries.eu/data/mys.svg',NULL,NULL),
	(137,'Maldives','MDV','https://restcountries.eu/data/mdv.svg',NULL,NULL),
	(138,'Mali','MLI','https://restcountries.eu/data/mli.svg',NULL,NULL),
	(139,'Malta','MLT','https://restcountries.eu/data/mlt.svg',NULL,NULL),
	(140,'Marshall Islands','MHL','https://restcountries.eu/data/mhl.svg',NULL,NULL),
	(141,'Martinique','MTQ','https://restcountries.eu/data/mtq.svg',NULL,NULL),
	(142,'Mauritania','MRT','https://restcountries.eu/data/mrt.svg',NULL,NULL),
	(143,'Mauritius','MUS','https://restcountries.eu/data/mus.svg',NULL,NULL),
	(144,'Mayotte','MYT','https://restcountries.eu/data/myt.svg',NULL,NULL),
	(145,'Mexico','MEX','https://restcountries.eu/data/mex.svg',NULL,NULL),
	(146,'Micronesia (Federated States of)','FSM','https://restcountries.eu/data/fsm.svg',NULL,NULL),
	(147,'Moldova (Republic of)','MDA','https://restcountries.eu/data/mda.svg',NULL,NULL),
	(148,'Monaco','MCO','https://restcountries.eu/data/mco.svg',NULL,NULL),
	(149,'Mongolia','MNG','https://restcountries.eu/data/mng.svg',NULL,NULL),
	(150,'Montenegro','MNE','https://restcountries.eu/data/mne.svg',NULL,NULL),
	(151,'Montserrat','MSR','https://restcountries.eu/data/msr.svg',NULL,NULL),
	(152,'Morocco','MAR','https://restcountries.eu/data/mar.svg',NULL,NULL),
	(153,'Mozambique','MOZ','https://restcountries.eu/data/moz.svg',NULL,NULL),
	(154,'Myanmar','MMR','https://restcountries.eu/data/mmr.svg',NULL,NULL),
	(155,'Namibia','NAM','https://restcountries.eu/data/nam.svg',NULL,NULL),
	(156,'Nauru','NRU','https://restcountries.eu/data/nru.svg',NULL,NULL),
	(157,'Nepal','NPL','https://restcountries.eu/data/npl.svg',NULL,NULL),
	(158,'Netherlands','NLD','https://restcountries.eu/data/nld.svg',NULL,NULL),
	(159,'New Caledonia','NCL','https://restcountries.eu/data/ncl.svg',NULL,NULL),
	(160,'New Zealand','NZL','https://restcountries.eu/data/nzl.svg',NULL,NULL),
	(161,'Nicaragua','NIC','https://restcountries.eu/data/nic.svg',NULL,NULL),
	(162,'Niger','NER','https://restcountries.eu/data/ner.svg',NULL,NULL),
	(163,'Nigeria','NGA','https://restcountries.eu/data/nga.svg',NULL,NULL),
	(164,'Niue','NIU','https://restcountries.eu/data/niu.svg',NULL,NULL),
	(165,'Norfolk Island','NFK','https://restcountries.eu/data/nfk.svg',NULL,NULL),
	(166,'Korea (Democratic People\'s Republic of)','PRK','https://restcountries.eu/data/prk.svg',NULL,NULL),
	(167,'Northern Mariana Islands','MNP','https://restcountries.eu/data/mnp.svg',NULL,NULL),
	(168,'Norway','NOR','https://restcountries.eu/data/nor.svg',NULL,NULL),
	(169,'Oman','OMN','https://restcountries.eu/data/omn.svg',NULL,NULL),
	(170,'Pakistan','PAK','https://restcountries.eu/data/pak.svg',NULL,NULL),
	(171,'Palau','PLW','https://restcountries.eu/data/plw.svg',NULL,NULL),
	(172,'Palestine, State of','PSE','https://restcountries.eu/data/pse.svg',NULL,NULL),
	(173,'Panama','PAN','https://restcountries.eu/data/pan.svg',NULL,NULL),
	(174,'Papua New Guinea','PNG','https://restcountries.eu/data/png.svg',NULL,NULL),
	(175,'Paraguay','PRY','https://restcountries.eu/data/pry.svg',NULL,NULL),
	(176,'Peru','PER','https://restcountries.eu/data/per.svg',NULL,NULL),
	(177,'Philippines','PHL','https://restcountries.eu/data/phl.svg',NULL,NULL),
	(178,'Pitcairn','PCN','https://restcountries.eu/data/pcn.svg',NULL,NULL),
	(179,'Poland','POL','https://restcountries.eu/data/pol.svg',NULL,NULL),
	(180,'Portugal','PRT','https://restcountries.eu/data/prt.svg',NULL,NULL),
	(181,'Puerto Rico','PRI','https://restcountries.eu/data/pri.svg',NULL,NULL),
	(182,'Qatar','QAT','https://restcountries.eu/data/qat.svg',NULL,NULL),
	(183,'Republic of Kosovo','KOS','https://restcountries.eu/data/kos.svg',NULL,NULL),
	(184,'Réunion','REU','https://restcountries.eu/data/reu.svg',NULL,NULL),
	(185,'Romania','ROU','https://restcountries.eu/data/rou.svg',NULL,NULL),
	(186,'Russian Federation','RUS','https://restcountries.eu/data/rus.svg',NULL,NULL),
	(187,'Rwanda','RWA','https://restcountries.eu/data/rwa.svg',NULL,NULL),
	(188,'Saint Barthélemy','BLM','https://restcountries.eu/data/blm.svg',NULL,NULL),
	(189,'Saint Helena, Ascension and Tristan da Cunha','SHN','https://restcountries.eu/data/shn.svg',NULL,NULL),
	(190,'Saint Kitts and Nevis','KNA','https://restcountries.eu/data/kna.svg',NULL,NULL),
	(191,'Saint Lucia','LCA','https://restcountries.eu/data/lca.svg',NULL,NULL),
	(192,'Saint Martin (French part)','MAF','https://restcountries.eu/data/maf.svg',NULL,NULL),
	(193,'Saint Pierre and Miquelon','SPM','https://restcountries.eu/data/spm.svg',NULL,NULL),
	(194,'Saint Vincent and the Grenadines','VCT','https://restcountries.eu/data/vct.svg',NULL,NULL),
	(195,'Samoa','WSM','https://restcountries.eu/data/wsm.svg',NULL,NULL),
	(196,'San Marino','SMR','https://restcountries.eu/data/smr.svg',NULL,NULL),
	(197,'Sao Tome and Principe','STP','https://restcountries.eu/data/stp.svg',NULL,NULL),
	(198,'Saudi Arabia','SAU','https://restcountries.eu/data/sau.svg',NULL,NULL),
	(199,'Senegal','SEN','https://restcountries.eu/data/sen.svg',NULL,NULL),
	(200,'Serbia','SRB','https://restcountries.eu/data/srb.svg',NULL,NULL),
	(201,'Seychelles','SYC','https://restcountries.eu/data/syc.svg',NULL,NULL),
	(202,'Sierra Leone','SLE','https://restcountries.eu/data/sle.svg',NULL,NULL),
	(203,'Singapore','SGP','https://restcountries.eu/data/sgp.svg',NULL,NULL),
	(204,'Sint Maarten (Dutch part)','SXM','https://restcountries.eu/data/sxm.svg',NULL,NULL),
	(205,'Slovakia','SVK','https://restcountries.eu/data/svk.svg',NULL,NULL),
	(206,'Slovenia','SVN','https://restcountries.eu/data/svn.svg',NULL,NULL),
	(207,'Solomon Islands','SLB','https://restcountries.eu/data/slb.svg',NULL,NULL),
	(208,'Somalia','SOM','https://restcountries.eu/data/som.svg',NULL,NULL),
	(209,'South Africa','ZAF','https://restcountries.eu/data/zaf.svg',NULL,NULL),
	(210,'South Georgia and the South Sandwich Islands','SGS','https://restcountries.eu/data/sgs.svg',NULL,NULL),
	(211,'Korea (Republic of)','KOR','https://restcountries.eu/data/kor.svg',NULL,NULL),
	(212,'South Sudan','SSD','https://restcountries.eu/data/ssd.svg',NULL,NULL),
	(213,'Spain','ESP','https://restcountries.eu/data/esp.svg',NULL,NULL),
	(214,'Sri Lanka','LKA','https://restcountries.eu/data/lka.svg',NULL,NULL),
	(215,'Sudan','SDN','https://restcountries.eu/data/sdn.svg',NULL,NULL),
	(216,'Suriname','SUR','https://restcountries.eu/data/sur.svg',NULL,NULL),
	(217,'Svalbard and Jan Mayen','SJM','https://restcountries.eu/data/sjm.svg',NULL,NULL),
	(218,'Swaziland','SWZ','https://restcountries.eu/data/swz.svg',NULL,NULL),
	(219,'Sweden','SWE','https://restcountries.eu/data/swe.svg',NULL,NULL),
	(220,'Switzerland','CHE','https://restcountries.eu/data/che.svg',NULL,NULL),
	(221,'Syrian Arab Republic','SYR','https://restcountries.eu/data/syr.svg',NULL,NULL),
	(222,'Taiwan','TWN','https://restcountries.eu/data/twn.svg',NULL,NULL),
	(223,'Tajikistan','TJK','https://restcountries.eu/data/tjk.svg',NULL,NULL),
	(224,'Tanzania, United Republic of','TZA','https://restcountries.eu/data/tza.svg',NULL,NULL),
	(225,'Thailand','THA','https://restcountries.eu/data/tha.svg',NULL,NULL),
	(226,'Timor-Leste','TLS','https://restcountries.eu/data/tls.svg',NULL,NULL),
	(227,'Togo','TGO','https://restcountries.eu/data/tgo.svg',NULL,NULL),
	(228,'Tokelau','TKL','https://restcountries.eu/data/tkl.svg',NULL,NULL),
	(229,'Tonga','TON','https://restcountries.eu/data/ton.svg',NULL,NULL),
	(230,'Trinidad and Tobago','TTO','https://restcountries.eu/data/tto.svg',NULL,NULL),
	(231,'Tunisia','TUN','https://restcountries.eu/data/tun.svg',NULL,NULL),
	(232,'Turkey','TUR','https://restcountries.eu/data/tur.svg',NULL,NULL),
	(233,'Turkmenistan','TKM','https://restcountries.eu/data/tkm.svg',NULL,NULL),
	(234,'Turks and Caicos Islands','TCA','https://restcountries.eu/data/tca.svg',NULL,NULL),
	(235,'Tuvalu','TUV','https://restcountries.eu/data/tuv.svg',NULL,NULL),
	(236,'Uganda','UGA','https://restcountries.eu/data/uga.svg',NULL,NULL),
	(237,'Ukraine','UKR','https://restcountries.eu/data/ukr.svg',NULL,NULL),
	(238,'United Arab Emirates','ARE','https://restcountries.eu/data/are.svg',NULL,NULL),
	(239,'United Kingdom of Great Britain and Northern Ireland','GBR','https://restcountries.eu/data/gbr.svg',NULL,NULL),
	(240,'United States of America','USA','https://restcountries.eu/data/usa.svg',NULL,NULL),
	(241,'Uruguay','URY','https://restcountries.eu/data/ury.svg',NULL,NULL),
	(242,'Uzbekistan','UZB','https://restcountries.eu/data/uzb.svg',NULL,NULL),
	(243,'Vanuatu','VUT','https://restcountries.eu/data/vut.svg',NULL,NULL),
	(244,'Venezuela (Bolivarian Republic of)','VEN','https://restcountries.eu/data/ven.svg',NULL,NULL),
	(245,'Viet Nam','VNM','https://restcountries.eu/data/vnm.svg',NULL,NULL),
	(246,'Wallis and Futuna','WLF','https://restcountries.eu/data/wlf.svg',NULL,NULL),
	(247,'Western Sahara','ESH','https://restcountries.eu/data/esh.svg',NULL,NULL),
	(248,'Yemen','YEM','https://restcountries.eu/data/yem.svg',NULL,NULL),
	(249,'Zambia','ZMB','https://restcountries.eu/data/zmb.svg',NULL,NULL),
	(250,'Zimbabwe','ZWE','https://restcountries.eu/data/zwe.svg',NULL,NULL);

/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table course_state_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `course_state_price`;

CREATE TABLE `course_state_price` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned NOT NULL,
  `state_id` bigint(20) unsigned NOT NULL,
  `last_updated_by` int(10) unsigned NOT NULL,
  `price` double(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_state_price_course_id_index` (`course_id`),
  KEY `course_state_price_state_id_index` (`state_id`),
  KEY `course_state_price_last_updated_by_index` (`last_updated_by`),
  CONSTRAINT `course_state_price_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `course_state_price_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `course_state_price_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table courses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `sub_category_id` bigint(20) unsigned NOT NULL,
  `grade_id` bigint(20) unsigned NOT NULL,
  `default_price` double(15,2) NOT NULL,
  `rising_software_key` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_price` enum('default','state') COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibility` enum('visible','not_visible') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `availiability_state` enum('available','not_available') COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expiry_months` int(10) unsigned NOT NULL COMMENT 'In Months',
  `test_type` enum('lesson','course') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'lesson',
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_subject_code_unique` (`subject_code`),
  UNIQUE KEY `courses_image_unique` (`image`),
  UNIQUE KEY `courses_rising_software_key_unique` (`rising_software_key`),
  KEY `courses_category_id_index` (`category_id`),
  KEY `courses_sub_category_id_index` (`sub_category_id`),
  KEY `courses_grade_id_index` (`grade_id`),
  KEY `courses_state_price_index` (`state_price`),
  KEY `courses_visibility_index` (`visibility`),
  KEY `courses_status_index` (`status`),
  KEY `courses_availiability_state_index` (`availiability_state`),
  KEY `courses_last_updated_by_index` (`last_updated_by`),
  KEY `courses_test_type_index` (`test_type`),
  CONSTRAINT `courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `courses_grade_id_foreign` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`id`),
  CONSTRAINT `courses_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;

INSERT INTO `courses` (`id`, `title`, `slug`, `subject_code`, `image`, `description`, `category_id`, `sub_category_id`, `grade_id`, `default_price`, `rising_software_key`, `state_price`, `visibility`, `status`, `availiability_state`, `last_updated_by`, `created_at`, `updated_at`, `expiry_months`, `test_type`, `position`)
VALUES
	(2,'Grade 1 Course Theory','grade-1-course-theory','CFT-201','dd51fac2334a40f5b542a9287ffd391028891ca2.png','<p>This is a test</p>',1,1,2,13.00,NULL,'default','visible','active','available',NULL,'2018-01-06 16:54:24','2018-01-11 09:57:20',12,'lesson',1);

/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table email_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_settings`;

CREATE TABLE `email_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email_logo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_sender_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_sender_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_signature` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_link` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_banner_status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email_settings_display_banner_status_index` (`display_banner_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `email_settings` WRITE;
/*!40000 ALTER TABLE `email_settings` DISABLE KEYS */;

INSERT INTO `email_settings` (`id`, `email_logo`, `email_sender_name`, `email_sender_email`, `email_signature`, `banner_image`, `banner_link`, `display_banner_status`, `created_at`, `updated_at`)
VALUES
	(1,'default.jpg','AMEB Federal','online@ameb.edu.au','Best Regards','default.jpg','http://exams.ameb.edu.au/banners/email_banner.jpg','show',NULL,NULL);

/*!40000 ALTER TABLE `email_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table email_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_templates`;

CREATE TABLE `email_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_templates_identifier_unique` (`identifier`),
  KEY `email_templates_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exam_appeal_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exam_appeal_history`;

CREATE TABLE `exam_appeal_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `examkey` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `result_json` text COLLATE utf8mb4_unicode_ci,
  `candidate_id` int(11) NOT NULL,
  `result_id` int(11) NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exam_remarkings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exam_remarkings`;

CREATE TABLE `exam_remarkings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `examkey` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `result_json` text COLLATE utf8mb4_unicode_ci,
  `appeal_date` datetime NOT NULL,
  `result_date` datetime DEFAULT NULL,
  `status` enum('inprogress','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inprogress',
  `account_holder_id` int(11) NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `payer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_placed_timestamp` datetime DEFAULT NULL,
  `order_paid_timestamp` datetime DEFAULT NULL,
  `payment_status` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `candidate_id` int(11) NOT NULL,
  `result_id` int(11) NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exam_results
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exam_results`;

CREATE TABLE `exam_results` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `examkey` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `result_type` enum('practice','official') COLLATE utf8mb4_unicode_ci NOT NULL,
  `result_json` text COLLATE utf8mb4_unicode_ci,
  `is_supervised` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `authorisation_time_limit` datetime DEFAULT NULL,
  `exam_complete_time` datetime DEFAULT NULL,
  `is_remarked` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `remark_appeal_id` int(11) DEFAULT NULL,
  `is_paused` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `activity_log` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `exam_start_time` datetime DEFAULT NULL,
  `exam_remaining_time` int(11) DEFAULT NULL,
  `exam_appeal_time` datetime DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  `candidate_id` int(11) DEFAULT NULL,
  `exam_status` enum('completed','pending','error') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_exam_as` enum('individual','class') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'individual',
  `class_identifier` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exam_valid_time` datetime DEFAULT NULL,
  `last_updated_by` bigint(20) DEFAULT NULL,
  `is_marked` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `result_available_date` datetime DEFAULT NULL,
  `api_url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exam_results` WRITE;
/*!40000 ALTER TABLE `exam_results` DISABLE KEYS */;

INSERT INTO `exam_results` (`id`, `examkey`, `result_type`, `result_json`, `is_supervised`, `authorisation_time_limit`, `exam_complete_time`, `is_remarked`, `remark_appeal_id`, `is_paused`, `activity_log`, `created_at`, `updated_at`, `exam_start_time`, `exam_remaining_time`, `exam_appeal_time`, `supervisor_id`, `candidate_id`, `exam_status`, `start_exam_as`, `class_identifier`, `exam_valid_time`, `last_updated_by`, `is_marked`, `result_available_date`, `api_url`, `external_id`)
VALUES
	(2,'QLD6266616','official','{\n  \"result\": [\n    {\n      \"number\": 0,\n      \"mark\": 0,\n      \"availableMarks\": 0,\n      \"remarks\": \"string\"\n    }\n  ]\n}','yes','2018-01-13 23:59:59',NULL,'no',NULL,'no',NULL,'2018-01-13 16:48:25','2018-01-13 16:48:57','2018-01-13 16:53:57',180,NULL,2,4,'pending','individual',NULL,'2018-01-13 19:53:57',NULL,'no',NULL,'amebexams5cloud://db2.risingsoftware.com/httpibase/?token=84f10b4a-65c1-4195-ae7b-c8400183608f','theory_1_official');

/*!40000 ALTER TABLE `exam_results` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table extension_requests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `extension_requests`;

CREATE TABLE `extension_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `candidate_id` bigint(20) unsigned NOT NULL,
  `account_holder_id` bigint(20) unsigned NOT NULL,
  `payment_method` enum('card','paypal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_placed_timestamp` datetime DEFAULT NULL,
  `order_paid_timestamp` datetime DEFAULT NULL,
  `payment_status` enum('incomplete','complete','declined') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'incomplete',
  `status` enum('incomplete','complete') COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_requests_candidate_id_index` (`candidate_id`),
  KEY `extension_requests_account_holder_id_index` (`account_holder_id`),
  KEY `extension_requests_invoice_id_index` (`invoice_id`),
  CONSTRAINT `extension_requests_account_holder_id_foreign` FOREIGN KEY (`account_holder_id`) REFERENCES `account_holders` (`id`),
  CONSTRAINT `extension_requests_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `purchase_candidates` (`id`),
  CONSTRAINT `extension_requests_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `extension_requests` WRITE;
/*!40000 ALTER TABLE `extension_requests` DISABLE KEYS */;

INSERT INTO `extension_requests` (`id`, `type`, `candidate_id`, `account_holder_id`, `payment_method`, `payer_email`, `paid_amount`, `transaction_id`, `payer_name`, `order_placed_timestamp`, `order_paid_timestamp`, `payment_status`, `status`, `invoice_id`, `created_at`, `updated_at`)
VALUES
	(1,NULL,3,2,'paypal','wpfixfizz-buyer@gmail.com','10.00','LQSUNGUZNTSNA','test buyer',NULL,'2018-01-13 15:06:32','complete','complete',3,'2018-01-13 15:05:56','2018-01-13 15:06:33');

/*!40000 ALTER TABLE `extension_requests` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table faq_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `faq_categories`;

CREATE TABLE `faq_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faq_categories_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;

INSERT INTO `faq_categories` (`id`, `title`, `slug`, `description`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'Troubleshooting Common Problems','troubleshooting-common-problems','Troubleshooting Common Problems','active','2018-01-11 18:39:32','2018-01-11 18:39:32'),
	(2,'General Questions','general-questions','General Questions','active','2018-01-11 18:39:52','2018-01-11 18:39:52'),
	(3,'How to Use the Site','how-to-use-the-site','How to Use the Site','active','2018-01-11 18:40:51','2018-01-11 18:40:51'),
	(4,'Save As You Go (SAYG) Questions','save-as-you-go-sayg-questions','Save As You Go (SAYG) Questions','active','2018-01-11 18:41:54','2018-01-11 18:41:54');

/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table faqs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `faqs`;

CREATE TABLE `faqs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_category_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faqs_status_index` (`status`),
  KEY `faqs_faq_category_id_index` (`faq_category_id`),
  CONSTRAINT `faqs_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;

INSERT INTO `faqs` (`id`, `title`, `slug`, `description`, `status`, `faq_category_id`, `created_at`, `updated_at`)
VALUES
	(1,'What’s the difference between an Account Holder and a Candidate?','what-s-the-difference-between-an-account-holder-and-a-candidate','<p>An Account Holder must be 18 years or older and they will be the person who registers on the site and purchases the exam. The Candidate can be any age and sits the exam.</p>','active',1,'2018-01-11 18:43:42','2018-01-11 18:43:42'),
	(2,'Who is an Account Holder?','who-is-an-account-holder','<p>An Account Holder is typically a parent, guardian, teacher or student 18 years or older. The Account Holder registers for the site and purchases exams for Candidates.</p>\r\n\r\n<p>An Account Holder may also be the Candidate if they are 18 years or older.</p>','active',1,'2018-01-11 18:44:22','2018-01-11 18:44:22'),
	(3,'How do I become an Account Holder?','how-do-i-become-an-account-holder','<p>To become an Account Holder you are required to register for the site. Registration is free and can be done from the Home Page by clicking on the&nbsp;<em>Registration&nbsp;</em>link on the left hand menu.</p>','active',1,'2018-01-11 18:44:52','2018-01-11 18:44:52'),
	(4,'Why do I register and become an Account Holder?','why-do-i-register-and-become-an-account-holder','<p>An Account Holder can purchase an exam for themselves or on behalf of a child. When an Account Holder buys an exam they receive an Exam Key and Password which they pass onto the Candidate giving them access to do tutorials, practice exams and, ultimately, the official exam.</p>','active',1,'2018-01-11 18:45:16','2018-01-11 18:45:16'),
	(5,'Who should be the Account Holder – teacher or parent?','who-should-be-the-account-holder-teacher-or-parent','<p>The Account Holder, that is the purchaser of the exam, becomes the contact point for AMEB. All information is linked to this registration so acknowledgement of the purchase will be sent to the email address of the Account Holder, results will be available to the Account Holder and certificates will be mailed to the Account Holder. Teachers may prefer to be the Account Holder and purchase exams for their students to allow them to maintain access to this information. Particularly where multiple candidates are being entered it may be preferable for the teacher to be the Account Holder.</p>\r\n\r\n<div>&nbsp;</div>','active',1,'2018-01-11 18:45:39','2018-01-11 18:45:39'),
	(6,'I purchased an exam but when I log in I can’t get access to practice exams for the exam I purchased.','i-purchased-an-exam-but-when-i-log-in-i-can-t-get-access-to-practice-exams-for-the-exam-i-purchased','<p>There are two types of log ins:</p>\r\n\r\n<ul>\r\n	<li>Username and Password for Account Holders (Parent/Teacher)</li>\r\n	<li>&nbsp;Exam Key and Password for Candidates&nbsp;</li>\r\n</ul>\r\n\r\n<p>When you purchase an exam you receive an email containing the Exam Key and Password for that exam. The Candidate needs to log in from the home page by clicking on the &lsquo;Candidates&rsquo; link and entering this Exam Key and Password exactly as they appear in this email.&nbsp;</p>','active',1,'2018-01-11 18:47:27','2018-01-11 18:47:27'),
	(7,'I can’t find my Exam Key and Password.','i-can-t-find-my-exam-key-and-password','<p>When you purchased the exam you will have received an email confirming the purchase and confirming the registration details. The email will have come from the following address:</p>\r\n\r\n<p>&nbsp; sales@amebexams.edu.au</p>\r\n\r\n<p>and the Subject Line will have read:</p>\r\n\r\n<p>&nbsp; AMEB Online Exam Registration &ndash; [name of candidate]</p>\r\n\r\n<p>Try searching your emails for either of the above. Depending on your internet provider and your own email settings sometimes these emails are directed to a Junk or Spam folder, so check these also. If you are unable to find your Exam Key and Password you need to contact Technical Support. Technical Support is available on the Home Page by clicking on &lsquo;Contact Us&rsquo; at the top of the page and then clicking on &lsquo;Email Support.&rsquo;</p>','active',1,'2018-01-11 18:48:04','2018-01-11 18:48:04'),
	(8,'How long do I have to complete the exam I purchased?','how-long-do-i-have-to-complete-the-exam-i-purchased','<p>The exam will stay current on the system for 12 months from the time of purchase.</p>','active',1,'2018-01-11 18:48:24','2018-01-11 18:48:24'),
	(9,'Will I still receive a certificate?','will-i-still-receive-a-certificate','<p>Yes. Successful candidates will still receive a certificate from their state AMEB by post.</p>','active',1,'2018-01-11 18:49:05','2018-01-11 18:49:05'),
	(10,'How long will it take to receive my certificate?','how-long-will-it-take-to-receive-my-certificate','<p>Certificates are sent out by the State AMEB Offices with candidates generally receiving their certificates within 10 days of completing the exam.&nbsp;</p>\r\n\r\n<p>To follow up about exam certificates, please contact your&nbsp;<a href=\"http://stage.exams.ameb.edu.au/contact-us\">state office.</a></p>','active',1,'2018-01-11 18:56:53','2018-01-11 18:56:53'),
	(11,'Who can supervise the exam?','who-can-supervise-the-exam','<p>Any adult 18 years or older can supervise the exam. Normally we would expect it to be a parent or teacher but this is not a requirement. AMEB does randomly check supervisors to ensure they are 18 years or older and that they supervised the conduct of the exam appropriately.</p>\r\n\r\n<div>&nbsp;</div>','active',1,'2018-01-11 19:55:13','2018-01-11 19:55:13'),
	(12,'The slurs don’t work.','the-slurs-don-t-work','<p>Click on the slurs drawing tool and the cursor becomes a cross. Use the cross to highlight the notes that you want the slur to go over. We strongly recommend that you view the &lsquo;Adding Slurs In Scales&rsquo; tutorial to allow you to understand how to use this feature.</p>','active',1,'2018-01-11 19:55:40','2018-01-11 19:55:40'),
	(13,'Can I purchase an exam if I don’t have a credit card?','can-i-purchase-an-exam-if-i-don-t-have-a-credit-card','<p>At the moment the only way to purchase on line is with a credit card. If you don&rsquo;t have a credit card we recommend you discuss this further with your State Office.</p>','active',1,'2018-01-11 19:56:12','2018-01-11 19:56:12'),
	(14,'When I click on \'Start Exam\' it doesn’t work or I get an error message.','when-i-click-on-start-exam-it-doesn-t-work-or-i-get-an-error-message','<p>If the exam does not open up or you get a plugin error message, you may not have Adobe Shockwave Player installed on your computer. Go to www.adobe.com.au and on the right hand side of the page you will see &ldquo;Get Adobe Shockwave Player.&rdquo; Click on this link and follow the instructions to download Shockwave.</p>\r\n\r\n<p>You will then need to install it.&nbsp; Access the downloads in your browser and run the Shockwave Installer.</p>\r\n\r\n<p>If you are in a school you may need to get special permission to download Shockwave and you may need to discuss this with your IT department.</p>','active',1,'2018-01-11 19:56:36','2018-01-11 19:56:36'),
	(15,'I finished the exam but it won’t send.','i-finished-the-exam-but-it-won-t-send','<p>Most exams send instantly on completion. Occasionally an exam will fail to send immediately. The online exam program is designed to keep trying to send and it is recommended that you leave the exam window open as long as you can. In some instances it has taken up to 45 minutes but the exam has been successfully sent at this point.</p>\r\n\r\n<div>&nbsp;</div>','active',1,'2018-01-11 19:57:15','2018-01-11 19:57:15'),
	(16,'How do I know if my exam has been sent?','how-do-i-know-if-my-exam-has-been-sent','<p>You will receive a message in the exam window telling you that the exam has been sent.</p>\r\n\r\n<p>You can also refresh your candidate portal at www.amebexams.edu and if you took Grades 1 - 3 Theory of Music, Musicianship Grades 1 - 2 or Music Craft Preliminary to Grade 2 your results will be available immediately.&nbsp; If you took a higher grade exam you will see a message saying your results will be available within a couple of days.</p>','active',1,'2018-01-11 19:57:40','2018-01-11 19:57:40'),
	(17,'What if I close the exam window before the exam has sent?','what-if-i-close-the-exam-window-before-the-exam-has-sent','<p>In that instance the information will be lost, however the Exam Key will remain current and the candidate will be able to attempt the exam again at a convenient time.</p>\r\n\r\n<div>&nbsp;</div>','active',1,'2018-01-11 19:58:07','2018-01-11 19:58:07'),
	(18,'Will all written exams eventually be online?','will-all-written-exams-eventually-be-online','<p>Yes, eventually all written exams will be available online.</p>','active',1,'2018-01-11 19:58:39','2018-01-11 19:58:39'),
	(19,'Will the candidate receive a report?','will-the-candidate-receive-a-report','<p>Yes. After the examination has been completed the &lsquo;paper&rsquo; will be electronically marked and this will be available to the purchaser and the candidate along with the result so a candidate will be able to see any errors that they made.</p>','active',1,'2018-01-11 19:59:05','2018-01-11 19:59:05'),
	(20,'What web browser do I need to run the examination software?','what-web-browser-do-i-need-to-run-the-examination-software','<p>All online exam users will need to be using Mozilla Firefox as their browser.&nbsp; This can be downloaded for free&nbsp;<a href=\"https://www.mozilla.org/en-US/firefox/new/\">here</a>.</p>','active',1,'2018-01-11 20:01:58','2018-01-11 20:01:58'),
	(21,'How do I prepare for an exam?','how-do-i-prepare-for-an-exam','<p>The AMEB offers online theory courses to prepare students for a Grade 1 and 2 Theory of Music exam. For more information visit www.amebtheory.edu.au. You will need to register for the course site, your login details for the exam site will not give you access to the course site.</p>','active',1,'2018-01-11 20:02:52','2018-01-11 20:02:52'),
	(22,'How does a school white list the AMEB exam site?','how-does-a-school-white-list-the-ameb-exam-site','<p>The first thing to do is to make sure that you are using an up to date web browser and the latest copy of the Shockwave plugin for your exams.&nbsp;</p>\r\n\r\n<p>Once you have done this, if you are still experiencing problems then please have your IT staff add the domain name&nbsp;<a href=\"http://www.amebexams.edu.au/\" target=\"_parent\">www.amebexams.edu.au</a>&nbsp;to the white list or &ldquo;no-cache&rdquo; list of your school firewall and proxy servers. As the get statements are called from within shockwave, the no-cache meta tags cannot be used in the server response, so any&nbsp;well setup proxy server will cache the response and break the exams for the test takers by effectively hijacking their exam results before they reach the AMEB server.&nbsp;</p>','active',1,'2018-01-11 20:03:24','2018-01-11 20:03:24'),
	(23,'How do I add beams to notes?','how-do-i-add-beams-to-notes','<p>The beams are not dragged over to the stave like notes.&nbsp; Click on the beam icon once in the tool bar and your cursor will turn into a crosshair (the + symbol).&nbsp; You then use the crosshair to draw a grey box around the notes you wish to connect with a beam by placing it to the left of the first note, clicking and dragging the crosshair around it and and the second note.&nbsp; Ensure you&#39;re highlighting the entire note with the grey box - not just the stem.&nbsp; Whilst holding the click, the grey box will be apparent, then when you release the click the beam will appear.&nbsp;</p>','active',1,'2018-01-11 20:03:53','2018-01-11 20:03:53'),
	(24,'My exam froze.','my-exam-froze','<p>Try closing all other applications and browser windows/tabs prior to opening your online exam.</p>\r\n\r\n<p>We also recommend that online exam users double check that their cache is empty in Firefox and manually reset it by doing the following:<br />\r\n<br />\r\n1.&nbsp;&nbsp;&nbsp; Open Firefox<br />\r\n2.&nbsp;&nbsp;&nbsp; type in about:preferences into the address bar<br />\r\n3.&nbsp;&nbsp;&nbsp; Click on &ldquo;Advanced&rdquo; on the left hand side, then &ldquo;Network&quot; and clear your cache by clicking &ldquo;Clear now&rdquo; until the number goes down to 0.&nbsp; Then, override the automatic cache management by placing a tick in the box and type in 500 in the field provided.</p>','active',1,'2018-01-11 20:04:24','2018-01-11 20:04:24'),
	(25,'What will stop people from cheating?','what-will-stop-people-from-cheating','<p>AMEB takes the security of its examinations very seriously. An online examination can only be purchased by an adult and so, normally, this will be done by a parent or teacher. At the time of purchase the purchaser will have to sign an electronic declaration agreeing that, to the best of their ability, they will ensure the candidate will complete the examination unaided and under full supervision.</p>\r\n\r\n<p>Before the candidate can begin their examination a supervisor - 18 years old or older &ndash; has to sign off an electronic declaration agreeing to supervise the examination according to the terms of the On Line Examination Policy. The supervisor&rsquo;s role is to be present throughout the entire examination and to ensure the candidate does not have access to any person or other aids while completing the examination.</p>\r\n\r\n<p>The supervisor will have to supply their name and contact number and AMEB will randomly contact supervisors to ensure they&nbsp;fulfill&nbsp;their commitment according to the policy.</p>','active',2,'2018-01-11 20:04:49','2018-01-11 20:04:49'),
	(26,'Is on-line examining available for all AMEB examinations?','is-on-line-examining-available-for-all-ameb-examinations','<p>On-line examining will be available for written examinations in Theory, Musicianship, Music Craft and Speech &amp; Performance Theory.</p>\r\n\r\n<div>&nbsp;</div>','active',2,'2018-01-11 20:08:46','2018-01-11 20:08:46'),
	(27,'Will online examinations be available for all grades?','will-online-examinations-be-available-for-all-grades','<p>Yes. Higher grade exams are continually being released throughout the year.</p>','active',2,'2018-01-11 20:09:28','2018-01-11 20:09:28'),
	(28,'Will higher grades be available as well?','will-higher-grades-be-available-as-well','<p>In time on-line examining will be expanded to include as many grades as possible.</p>','active',2,'2018-01-11 20:09:59','2018-01-11 20:09:59'),
	(29,'Will Speech & Performance Theory Examinations be available?','will-speech-performance-theory-examinations-be-available','<p>Yes. They are currently in development in 2014.</p>','active',2,'2018-01-11 20:12:37','2018-01-11 20:12:37'),
	(30,'Can I still sit a \'pen and paper\' written theory exam?','can-i-still-sit-a-pen-and-paper-written-theory-exam','<p>Yes, for the time being written examinations will still be available in their traditional format. Please contact your&nbsp;<a href=\"https://www.ameb.edu.au/state-offices\">state office</a>&nbsp;for information about enrolling in a paper-based exam.&nbsp;</p>','active',2,'2018-01-11 20:14:22','2018-01-11 20:14:22'),
	(31,'Will I still receive a certificate?','will-i-still-receive-a-certificate-1','<p>Yes. Successful candidates will receive a certificate from their AMEB state office.&nbsp; To enquire about online exam certificates please contact your AMEB state office:&nbsp;<a href=\"http://www.ameb.edu.au/state-offices\">www.ameb.edu.au/state-offices</a></p>','active',2,'2018-01-11 20:16:27','2018-01-11 20:16:27'),
	(32,'What are the benefits of online examinations?','what-are-the-benefits-of-online-examinations','<ul>\r\n	<li>Online examinations are convenient &ndash; you can do them at a time that suits you.</li>\r\n	<li>Instant results &ndash; your results will be available almost immediately&nbsp;&nbsp;upon completing the examination.</li>\r\n	<li>Unlimited practice examinations &ndash; you will be able to do as many practice examinations as you like before you do the official examination.</li>\r\n	<li>Fun &ndash; many students enjoy using the computer to do theory.</li>\r\n</ul>','active',2,'2018-01-11 20:17:38','2018-01-11 20:17:38'),
	(33,'Can I enter more than one candidate at a time?','can-i-enter-more-than-one-candidate-at-a-time','<p>Yes you can enter 2 or more candidates to do different examinations or to do the same examination all in one easy transaction.</p>\r\n\r\n<p>When purchasing an exam the system will ask you the number of candidates you want to enter. If you enter a number greater than one in the field provided, the next page will ask you if you want to enter a number of candidates to do the same exam as a group, or enter a number of candidates to do exams individually. Choose the group option if you would like all the candidates to sit the same exam time. Choose the individual option if they are taking different grades or subjects, or if you would like candidates to sit their exam at different times.</p>','active',2,'2018-01-11 20:17:59','2018-01-11 20:17:59'),
	(34,'Can a class or a group of students do an identical examination?','can-a-class-or-a-group-of-students-do-an-identical-examination','<p>Yes. Normally each examination is randomly generated from the question bank but there is an option for a group of students to do an identical examination &ndash; just follow the options when you choose to enter more than one candidate.</p>','active',2,'2018-01-11 20:19:56','2018-01-11 20:19:56'),
	(35,'What is \'manually marked?','what-is-manually-marked','<p>Some AMEB online exams can be marked automatically and others need to be marked by an AMEB examiner. For those marked by a human, your results will be available 3-4 business days after you submit your exam. If you have any queries regarding your mark, just use the technical support feature of the site and we will review your exam. In addition, the practice exams will not be marked. If you have questions regarding the correct answer please consult your teacher, the FAQs or the AMEB Office.</p>','active',2,'2018-01-11 20:20:39','2018-01-11 20:20:39'),
	(36,'How long does it take to get my results?','how-long-does-it-take-to-get-my-results','<p>For exams that are automatically marked, you wil get your results as soon as you finish your exam. For exams that are manually marked, you will get an email 3-4 business days after you complete your exam notifying you that your results are available. If you are not sure whether your exam is automatically or manually marked, see the table on the homepage at&nbsp;<a href=\"http://www.amebexams.edu.au/\">www.amebexams.edu.au</a></p>','active',2,'2018-01-11 20:21:53','2018-01-11 20:21:53'),
	(37,'Manual marking vs. Computer marking','manual-marking-vs-computer-marking','<p>Higher-level AMEB exams (from Grade 3 Musicianship, Grade 3 Music Craft and Graft 4 Theory upwards) are marked by members of the AMEB Online Examining panel. Results for these exams are available 3-4 business days after they are submitted. Lower-grade AMEB exams are marked by the computer and results are available instantly after submission.</p>\r\n\r\n<p>Practice exams for higher-level AMEB exams are not marked. The candidate&#39;s answers are saved and candidates can go back and review their answers with a parent or teacher at any time.</p>\r\n\r\n<p>Practice exams for lower-grade AMEB exams are marked by the computer as the candidate completes the exam. Candidates&#39; answers will not be saved after they complete these practice exams.&nbsp;</p>','active',2,'2018-01-11 20:23:33','2018-01-11 20:23:33'),
	(38,'What is the passing grade for online exams?','what-is-the-passing-grade-for-online-exams','<p>To pass a graded written examination, candidates need to achieve 65%. They will receive &#39;credit&#39; at 75%, Honours at 85% and High Distinction at 95% and above. For diploma written examinations, a grade of 75% or higher is required to pass. For more information please see AMEB&#39;s Regulations at&nbsp;<a href=\"http://www.ameb.edu.au/content/regulations\">www.ameb.edu.au/content/regulations</a></p>','active',2,'2018-01-11 20:24:22','2018-01-11 20:24:22'),
	(39,'How long do I have to take the exam?','how-long-do-i-have-to-take-the-exam','<p>Online exams expire 12 months after the purchase date. In that time you can take unlimited practice exams and access your results as many times as you would like. You will also receive a 30 day notice before your exam is set to expire.&nbsp; Please note that the exams will be deactivated at 12am midnight on the day they expire.</p>','active',2,'2018-01-11 20:26:46','2018-01-11 20:26:46'),
	(40,'What operating system does my computer need to be running in order to run the online exams?','what-operating-system-does-my-computer-need-to-be-running-in-order-to-run-the-online-exams','<p>If you are using a Mac you will need to be running OSX 10.7 or higher.</p>\r\n\r\n<p>If you are using a PC you will need to be running Windows 7 or higher.</p>','active',2,'2018-01-11 20:27:18','2018-01-11 20:27:18'),
	(41,'I can\'t see my practice exam results.','i-can-t-see-my-practice-exam-results','<p>Practice exams for higher-level AMEB online exams (ie Theory Grade 4 - 5, Musicianship Grade 3 - 6, Music Craft Grade 2 -4) are not marked. The candidate&#39;s answers are saved and candidates can go back and review their answers with a parent or teacher at any time.</p>\r\n\r\n<p>Practice exams for the earlier AMEB online exams are marked by the computer as the candidate completes the exam. Refresh the practice exam page to view the overall result of a practice exam. Candidates&#39; answers will not be saved after they complete these practice exams.</p>','active',2,'2018-01-11 20:28:08','2018-01-11 20:28:08'),
	(42,'How do I register?','how-do-i-register','<p>Go to the home page and select &ldquo;register&rdquo; from the menu on the left and then complete the details as required.</p>','active',3,'2018-01-11 20:28:56','2018-01-11 20:28:56'),
	(43,'Does it cost money to register?','does-it-cost-money-to-register','<p>No. Registration is free.</p>','active',3,'2018-01-11 20:29:19','2018-01-11 20:29:19'),
	(44,'Why should I register?','why-should-i-register','<p>Once you register more information becomes available to you. The available examinations and costs will be displayed and you will have access to all tutorials and sample examinations.</p>','active',3,'2018-01-11 20:29:42','2018-01-11 20:29:42'),
	(45,'How much do the examinations cost?','how-much-do-the-examinations-cost','<p>When you register for the site and log in you will see a menu of available examinations and the costs.</p>','active',3,'2018-01-11 20:30:08','2018-01-11 20:30:08'),
	(46,'How do I buy an examination?','how-do-i-buy-an-examination','<p>You have to be 18 years or older to purchase an examination. To purchase an examination you have to register for the site, login via the &quot;Account holder (Parent / Teacher) link and then follow the links to &ldquo;Buy Examination.&rdquo;</p>','active',3,'2018-01-11 20:32:23','2018-01-11 20:32:23'),
	(47,'What information do I need to enter a candidate?','what-information-do-i-need-to-enter-a-candidate','<p>Entering online is very similar to entering traditional examinations with the AMEB. Information varies slightly from state to state but the mandatory information required is the candidate&rsquo;s first and last names, date of birth and gender.</p>','active',3,'2018-01-11 22:35:53','2018-01-11 22:35:53'),
	(48,'I don’t understand how to do an examination?','i-don-t-understand-how-to-do-an-examination','<p>There are a number of video tutorials concisely explaining and demonstrating how to do each part of the examination. We recommend that you view all these tutorials prior to undertaking the examination.</p>','active',3,'2018-01-11 22:36:29','2018-01-11 22:36:29'),
	(49,'Can a candidate do practice examinations?','can-a-candidate-do-practice-examinations','<p>Yes, purchase of an examination entitles the candidate to unlimited practice examinations. The purchaser will receive an Examination Key for each candidate that they enter and when the candidate logs in they will be given the options of tutorials and practice examinations before they begin their official examination.</p>','active',3,'2018-01-11 22:37:07','2018-01-11 22:37:07'),
	(50,'Can I see the candidate’s result?','can-i-see-the-candidate-s-result','<p>Both the Account Holder and the Candidate will have access to the results on line. If you are a teacher and enter multiple candidates you will have access to all the results for examinations you have purchased (once they are completed). Candidates will only have access to their own results.</p>','active',3,'2018-01-11 22:37:41','2018-01-11 22:37:41'),
	(51,'What happens if I can’t finish the examination?','what-happens-if-i-can-t-finish-the-examination','<p>The examinations are timed and once the candidate begins the examination it will be completed once the candidate clicks &ldquo;Send, Finish, Send&rdquo; or when the time allowed expires. If the candidate fails to complete the questions in the allocated time they will lose marks for the unanswered questions.</p>\r\n\r\n<p>If you are unable to take your exam by its expiry date, please contact your state office:&nbsp;<a href=\"http://www.ameb.edu.au/state-offices\">www.ameb.edu.au/state-offices</a></p>','active',3,'2018-01-11 22:38:13','2018-01-11 22:38:13'),
	(52,'What if external events mean I can’t complete an examination?','what-if-external-events-mean-i-can-t-complete-an-examination','<p>In the event of a computer failure or a power black out or other such occurrence while a candidate is undertaking an examination the data entered to that point will be lost. The Examination Key will remain current and the candidate will be able to begin a new randomly generated examination at a time of their choice.&nbsp;</p>','active',3,'2018-01-11 22:38:43','2018-01-11 22:38:43'),
	(53,'What if I think the marking is incorrect?','what-if-i-think-the-marking-is-incorrect','<p>Please send an email to online@ameb.edu.au with the following details:</p>\r\n\r\n<p>The candidate&#39;s name and exam key</p>\r\n\r\n<p>The subject and grade they undertook</p>\r\n\r\n<p>The specific question you&#39;d like reviewed and what aspect of the marking you think is incorrect</p>','active',3,'2018-01-11 22:39:14','2018-01-11 22:39:14'),
	(54,'Which internet browser should I use to sit an exam?','which-internet-browser-should-i-use-to-sit-an-exam','<p>All online exam candidates must use the&nbsp;<a href=\"https://www.mozilla.org/en-US/firefox/organizations/\">Extended Support Release (ESR) of Mozilla Firefox</a>&nbsp;as their browser. There is a version of this browser available for PC users and Mac users below. There have been recent changes to the browsers that support the Shockwave plugin, and currently the ESR of Firefox is the most universal browser that works across both PC and Mac to run the exams.</p>\r\n\r\n<p>PC users: please download the 32 bit version of the ESR of Firefox&nbsp;<a href=\"https://download.mozilla.org/?product=firefox-52.0.2esr-SSL&amp;os=win&amp;lang=en-GB\">here</a>.</p>\r\n\r\n<p>Mac users: please download the OSX version of the ESR of Firefox&nbsp;<a href=\"https://download.mozilla.org/?product=firefox-52.0.2esr-SSL&amp;os=osx&amp;lang=en-GB\">here</a>.</p>\r\n\r\n<p>Once Firefox has downloaded, please click on the installer that will be stored in your browser&#39;s downloads folder to install Firefox ESR.</p>','active',3,'2018-01-11 22:39:55','2018-01-11 22:39:55'),
	(55,'Can I enter students\' details and a bursar go in later to complete the payment?','can-i-enter-students-details-and-a-bursar-go-in-later-to-complete-the-payment','<p>Yes. Simply login as an Account Holder and enter the exams and student details. You can then give the Account Holder login details to another person such as a school bursar. When they login, they will see a list of purchases you have begun with a date next to each one. Simply click on the purchase to complete the payment process and tax invoices and login details will then be emailed to the Account Holder&#39;s email address.</p>\r\n\r\n<div>&nbsp;</div>','active',3,'2018-01-11 22:40:34','2018-01-11 22:40:34'),
	(56,'What is an LUI number?','what-is-an-lui-number','<p>An LUI number is a learner unique identifier (LUI) that is used exclusively in Queensland.&nbsp; In Year 10, schools register students with the&nbsp;<a href=\"https://www.qcaa.qld.edu.au/index.html\">Queensland Curriculum and Assessment Authority</a>&nbsp;and a learning account is opened for them. All eligible learning towards a Queensland Certificate of Education&nbsp;is recorded in student learning accounts, as well as where and when the learning took place, and the results achieved.&nbsp;</p>\r\n\r\n<p>When purchasing an exam this field is optional, so you can leave it blank if you wish (or if the student does not have an LUI number).</p>\r\n\r\n<p>For further information about how AMEB exams can be counted towards a candidate&#39;s LUI number, please contact&nbsp;<a href=\"http://ameb.qld.edu.au/Pages/home.aspx\">AMEB Queensland</a>&nbsp;or the&nbsp;<a href=\"https://www.qcaa.qld.edu.au/index.html\">QCAA</a>.</p>','active',3,'2018-01-11 22:41:27','2018-01-11 22:41:27'),
	(57,'Why do we need SAYG?','why-do-we-need-sayg','<p>Up until now if a candidate finishes or nearly finishes an exam and the exam freezes or fails to send they lose all their work up to that point. The only solution is for them to start again. SAYG will save student&rsquo;s work up until the point that the problem occurred and they should be able to complete their exam.</p>\r\n\r\n<div>&nbsp;</div>','active',4,'2018-01-11 22:42:03','2018-01-11 22:42:03'),
	(58,'How do I start my exam again?','how-do-i-start-my-exam-again','<p>You follow the same process to start your exam as you did previously and the supervisor will approve the restart of the exam.</p>','active',3,'2018-01-11 22:42:48','2018-01-11 22:42:48'),
	(59,'Will I get extra time?','will-i-get-extra-time','<p>No. The exam timer will start from the same point that it was at when the problem occurred.</p>','active',4,'2018-01-11 22:43:24','2018-01-11 22:43:24'),
	(60,'Can I review the answers I have already completed?','can-i-review-the-answers-i-have-already-completed','<p>Yes. You can go back and review and modify your answers until you send the exam or the time expires.</p>\r\n\r\n<div>&nbsp;</div>','active',4,'2018-01-11 22:43:50','2018-01-11 22:43:50'),
	(61,'Can the supervisor restart my exam whenever I like?','can-the-supervisor-restart-my-exam-whenever-i-like','<p>The supervisor will have 1 hour to restart your exam. After this time you will need to contact AMEB to allow the exam to be restarted.</p>','active',4,'2018-01-11 22:44:31','2018-01-11 22:44:31'),
	(62,'Why does it have to be done within one hour?','why-does-it-have-to-be-done-within-one-hour','<p>This gives an opportunity for the problem to be resolved. In the event that the problem cannot be resolved in this time frame we suggest you contact AMEB for further advice.</p>','active',4,'2018-01-11 22:45:10','2018-01-11 22:45:10'),
	(63,'How many times can I restart the exam?','how-many-times-can-i-restart-the-exam','<p>You can restart the exam as many times as needed to send it.&nbsp; Once you have clicked the &lsquo;Send&rsquo;, &lsquo;Finish&rsquo;, &lsquo;Send&rsquo; buttons your exam will be sent for marking and you will not be able to access it further.</p>','active',4,'2018-01-11 22:46:01','2018-01-11 22:46:01'),
	(64,'Do I need to have the same supervisor for each attempt?','do-i-need-to-have-the-same-supervisor-for-each-attempt','<p>No.&nbsp; Different supervisors can supervise each attempt.&nbsp; They just need to fill in their details on the supervisor page before the exam can be accessed.</p>','active',4,'2018-01-11 22:46:26','2018-01-11 22:46:26');

/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table footer_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `footer_settings`;

CREATE TABLE `footer_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `office` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `footer_settings_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `footer_settings` WRITE;
/*!40000 ALTER TABLE `footer_settings` DISABLE KEYS */;

INSERT INTO `footer_settings` (`id`, `office`, `location`, `phone`, `website`, `email`, `description`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'AMEB Federal Office','PO Box 12168 A’Beckett St VIC 8006','1300 725 709','https://exams.ameb.edu.au/','online@ameb.edu.au','<p>Supporting, inspiring &amp; advancing a life-long engagement with music in Australia. Australian Music Examinations Board</p>','active',NULL,'2018-01-11 23:32:16');

/*!40000 ALTER TABLE `footer_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grades
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grades`;

CREATE TABLE `grades` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_category_id` bigint(20) unsigned NOT NULL,
  `status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grades_sub_category_id_index` (`sub_category_id`),
  KEY `grades_status_index` (`status`),
  CONSTRAINT `grades_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;

INSERT INTO `grades` (`id`, `title`, `slug`, `code`, `sub_category_id`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'Grade 1','grade-1','PLACEAT',1,'active',NULL,NULL),
	(2,'Grade 2','grade-2','ET',1,'active',NULL,NULL),
	(3,'Grade 3','grade-3','AUT',1,'active',NULL,NULL),
	(4,'Grade 4','grade-4','FACILIS',1,'active',NULL,NULL),
	(5,'Grade 5','grade-5','TEMPORIBUS',1,'active',NULL,NULL),
	(6,'Grade 1','grade-1','QUIA',2,'active',NULL,NULL),
	(7,'Grade 2','grade-2','QUI',2,'active',NULL,NULL),
	(8,'Grade 3','grade-3','HIC',2,'active',NULL,NULL),
	(9,'Grade 4','grade-4','MOLESTIAE',2,'active',NULL,NULL),
	(10,'Grade 5','grade-5','CUM',2,'active',NULL,NULL),
	(11,'Grade 1','grade-1','VOLUPTATES',3,'active',NULL,NULL),
	(12,'Grade 2','grade-2','ET',3,'active',NULL,NULL),
	(13,'Grade 3','grade-3','ALIAS',3,'active',NULL,NULL),
	(14,'Grade 4','grade-4','ET',3,'active',NULL,NULL),
	(15,'Grade 5','grade-5','VOLUPTATEM',3,'active',NULL,NULL),
	(16,'Grade 6','grade-6','0006',1,'active','2017-12-25 18:02:35','2017-12-25 18:02:35'),
	(17,'Preliminary','preliminary','1540',2,'active','2017-12-25 18:08:30','2017-12-25 18:08:30'),
	(18,'Grade 6','grade-6-1','0026',3,'active','2017-12-25 18:22:52','2017-12-25 18:22:52');

/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table invoice_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `invoice_details`;

CREATE TABLE `invoice_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_amount` double(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_details_invoice_id_index` (`invoice_id`),
  CONSTRAINT `invoice_details_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `invoice_details` WRITE;
/*!40000 ALTER TABLE `invoice_details` DISABLE KEYS */;

INSERT INTO `invoice_details` (`id`, `invoice_id`, `type`, `item`, `unit_price`, `quantity`, `total_amount`, `created_at`, `updated_at`)
VALUES
	(1,1,'Exam','Music Craft - Preliminary','62.72727272727272',2,125.45,'2018-01-12 17:01:57','2018-01-12 17:01:57'),
	(2,2,'Exam','Music Craft - Grade 2','69.09090909090908',1,69.09,'2018-01-13 14:36:24','2018-01-13 14:36:24'),
	(3,3,'Exam','Music Craft - Grade 2 extension','10',1,9.00,'2018-01-13 15:06:32','2018-01-13 15:06:32'),
	(4,4,'Exam','Theory of Music - Grade 1','63.63636363636363',1,63.64,'2018-01-13 15:29:06','2018-01-13 15:29:06');

/*!40000 ALTER TABLE `invoice_details` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table invoices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `invoices`;

CREATE TABLE `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` double(15,2) NOT NULL,
  `total_gst` double(10,2) NOT NULL,
  `sub_total` double(13,2) NOT NULL,
  `gst_percentage` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;

INSERT INTO `invoices` (`id`, `name`, `address`, `email`, `payment_method`, `total_amount`, `total_gst`, `sub_total`, `gst_percentage`, `created_at`, `updated_at`)
VALUES
	(1,'Mr Mohammad Sarfaraz','4 Trevannion Street','sarfaraz.yelko@gmail.com','Paypal',138.00,12.55,125.45,10,'2018-01-12 17:01:57','2018-01-12 17:01:57'),
	(2,'Mr Bhoj Raj Bhatta','Sankhamul road, Kathmandu','bhojraj.bhatta99@gmail.com','Paypal',76.00,6.91,69.09,10,'2018-01-13 14:36:24','2018-01-13 14:36:24'),
	(3,'Mr Bhoj Raj Bhatta','Sankhamul road, Kathmandu','bhojraj.bhatta99@gmail.com','PayPal',10.00,1.00,9.00,10,'2018-01-13 15:06:32','2018-01-13 15:06:32'),
	(4,'Mr Mohammad Sarfaraz','4 Trevannion Street','sarfaraz.yelko@gmail.com','Paypal',70.00,6.36,63.64,10,'2018-01-13 15:29:06','2018-01-13 15:29:06');

/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table lessons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lessons`;

CREATE TABLE `lessons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_link` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rising_software_link` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `position` int(11) NOT NULL,
  `video_duration` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lessons_status_index` (`status`),
  KEY `lessons_course_id_index` (`course_id`),
  CONSTRAINT `lessons_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),
	(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),
	(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),
	(6,'2016_06_01_000004_create_oauth_clients_table',1),
	(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),
	(8,'2017_08_27_151236_create_category_table',1),
	(9,'2017_08_30_125317_create_states_table',1),
	(10,'2017_09_02_055847_create_venues_table',1),
	(11,'2017_09_03_110531_create_sub_categories_table',1),
	(12,'2017_09_03_113240_create_countries_table',1),
	(13,'2017_09_03_194513_create_grades_table',1),
	(14,'2017_09_05_220419_create_sessions_table',1),
	(15,'2017_09_05_223101_create_session_venue_table',1),
	(16,'2017_09_06_135640_create_online_examinations_table',1),
	(17,'2017_09_09_135235_create_account_holders_table',1),
	(18,'2017_09_10_085402_create_online_examination_state_table',1),
	(19,'2017_09_10_142406_create_course_table',1),
	(20,'2017_09_10_213318_create_online_examination_state_price_table',1),
	(21,'2017_09_10_225906_create_account_state_table',1),
	(22,'2017_09_10_233548_create_practice_examinations_table',1),
	(23,'2017_09_11_215910_create_account_holder_activation_tables',1),
	(24,'2017_09_11_220524_alter_account_holders_activated_col',1),
	(25,'2017_09_12_142114_create_lession_table',1),
	(26,'2017_09_13_205909_create_course_state_price_table',1),
	(27,'2017_09_14_140658_create_faq_categories_table',1),
	(28,'2017_09_14_141047_create_faqs_table',1),
	(29,'2017_09_14_194810_create_cms_parent_pages_table',1),
	(30,'2017_09_15_080547_create_banner_table',1),
	(31,'2017_09_18_143149_creaate_account_holders_update_approval_table',1),
	(32,'2017_09_19_114219_create_cms_pages_table',1),
	(33,'2017_09_20_164333_create_site_notice_table',1),
	(34,'2017_09_21_103722_create_email_settings_table',1),
	(35,'2017_09_21_160818_create_carts_table',1),
	(36,'2017_09_21_161302_create_purchase_details_table',1),
	(37,'2017_09_21_162618_create_purchase_candidates_table',1),
	(38,'2017_09_21_185858_create_email_template_table',1),
	(39,'2017_09_21_204625_create_site_maintenance_table',1),
	(40,'2017_09_22_150018_create_tickets_table',1),
	(41,'2017_09_22_150138_create_ticket_threads_table',1),
	(42,'2017_09_23_084149_create_options_table',1),
	(43,'2017_09_23_163700_add_practice_exams_to_candidates_table',1),
	(44,'2017_09_25_081148_add_expiry_date_purchases_tables',1),
	(45,'2017_09_30_181832_create_edit_candidates_temp_table',1),
	(46,'2017_10_02_232515_add_candidate_id_to_tickets_table',1),
	(47,'2017_10_13_053806_add_fields_to_purchase_candidates_table',1),
	(48,'2017_10_24_215419_create_footer_settings_table',1),
	(49,'2017_10_27_023031_create_account_holder_password_reset_table',1),
	(50,'2017_10_28_220134_create_syllabuses_table',1),
	(51,'2017_11_04_151942_add_type_in_carts_table',1),
	(52,'2017_11_04_155650_add_is_class_exam_in_purchase_details',1),
	(53,'2017_11_06_010538_add_status_to_purchase_details',1),
	(54,'2017_11_10_140331_create_invoices_table',1),
	(55,'2017_11_10_140401_create_invoice_details_table',1),
	(56,'2017_11_11_202546_add_invoice_id_to_carts_table',1),
	(57,'2017_11_11_211330_create_extension_requests_table',1),
	(58,'2017_11_16_125224_add_state_id_to_purchases_table',1),
	(59,'2017_11_21_023951_add_product_type_on_purchase_candidate_table',1),
	(60,'2017_12_07_174602_add_purchased_date_to_purchase_details',1),
	(61,'2017_12_08_172716_add_expiry_date_to_course_table',1),
	(62,'2017_12_12_022438_add_fields_to_candidates_table',1),
	(63,'2017_12_13_213027_add_stateid_to_users',1),
	(64,'2017_12_14_121929_create_exam_results_table',1),
	(65,'2017_12_14_142120_create_supervisor_lists',1),
	(66,'2017_12_14_143549_create_exam_remarkings',1),
	(67,'2017_12_15_022930_alter_exam_start_time_in_exam_results_table',1),
	(68,'2017_12_15_031603_make_exam_start_time_nullable_exam_results_table',1),
	(69,'2017_12_16_162251_create_zzz_candidate_list_table',1),
	(70,'2017_12_20_204741_create_appeal_time_in_result',1),
	(71,'2017_12_20_205808_make_supervisor_id_nullabe',1),
	(72,'2017_12_20_210051_create_exam_appeal_history',1),
	(73,'2017_12_21_011014_add_candidate_id_on_exam_result_table',1),
	(74,'2017_12_21_213754_add_result_status_on_exam_result_table',1),
	(75,'2017_12_22_135239_add_refund_extension_fields_to_purchase_details',1),
	(76,'2017_12_23_193837_drop_start_exam_as_in_exam_result_table',1),
	(77,'2017_12_23_193955_alter_start_exam_as_in_exam_result_table',1),
	(78,'2017_12_23_220849_add_class_identifier_in_exam_result_table',1),
	(79,'2017_12_24_194941_add_appeal_price_to_online_examination_table',1),
	(80,'2017_12_27_140718_change_status_field_candidates_table',1),
	(81,'2017_12_28_034329_modify_exam_results_table',1),
	(82,'2017_12_29_025747_modify_result_type_in_exam_result_table',1),
	(83,'2017_12_30_152925_add_taken_enrollment_status_on_canidate_table',1),
	(84,'2017_12_30_161538_add_api_identifier_accountholders',1),
	(85,'2017_12_30_181448_add_last_updated_by_in_exam_results',1),
	(86,'2017_12_31_143651_make_changes_to_edit_candidates_table',1),
	(87,'2018_01_05_141854_add_marked_fields_to_exam_status',1),
	(88,'2018_01_06_001944_add_api_url_in_exam_results_table',1),
	(89,'2018_01_06_153702_modify_enumvalues_instatus_candidates',1),
	(90,'2018_01_06_193426_add_test_type_position_course_table',1),
	(91,'2018_01_06_193557_add_position_lession_table',1),
	(92,'2018_01_08_012425_add_videoduration_lession_table',1),
	(93,'2018_01_08_141753_add_courseid_practicekey_course_productcode_online_examination',1),
	(94,'2018_01_10_180749_modify_other_phone_suburb_account_holders_table',1),
	(95,'2018_01_11_072156_modify_status_tickets_table',1),
	(96,'2018_01_11_091015_update_suburb_field_account_holders_update_approval',1),
	(97,'2018_01_11_091438_update_suburb_datatype_account_holders_update_approval',1),
	(98,'2018_01_11_091945_modify_phone_data_account_holders_update_approval',1),
	(99,'2018_01_11_125130_add_position_to_exams_table',1),
	(100,'2018_01_12_035753_add_externalId_on_results_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`)
VALUES
	('0e983cb668a702e74e59cc2b9e00b4d811b6d45e64000532a724db6ac1f1bcec4fd46352780ab674',4,1,NULL,'[]',0,'2018-01-13 16:00:33','2018-01-13 16:00:33','2019-01-13 16:00:33'),
	('363b3679641d41eab1dd6ffeae8a03948063af5c06c3c35260976db58837014a2c9c85a2a4a47e29',4,1,NULL,'[]',0,'2018-01-13 16:07:19','2018-01-13 16:07:19','2019-01-13 16:07:19'),
	('6f9de336151566ff17a117a229574cf1a3e896d8c0c939b865610033c6f975b42587702488d15f04',4,1,NULL,'[]',0,'2018-01-13 16:01:41','2018-01-13 16:01:41','2019-01-13 16:01:41'),
	('8f3a534c73a2ac7a5044123a1e2cc9c4a81c5d5040ee9033adbc36de8559470ec301e81020784cdd',4,1,NULL,'[]',0,'2018-01-13 16:04:48','2018-01-13 16:04:48','2019-01-13 16:04:48'),
	('c945e6a617fd7387df69d4778f99843d661a728db2b4a946aed4d19243a7111d25e3835651c4f5c6',4,1,NULL,'[]',0,'2018-01-13 16:30:58','2018-01-13 16:30:58','2019-01-13 16:30:58'),
	('c94f321591307778cd06982f350702275b379f670c73ed7154bd37049be4e3beed7fae18d3250df2',4,1,NULL,'[]',0,'2018-01-13 15:59:31','2018-01-13 15:59:31','2019-01-13 15:59:31'),
	('ebfe4a1ac384f8fb7a81f98353c557ce6d76467892af677d8a9a0792048c936e715f14afb63b04ba',4,1,NULL,'[]',0,'2018-01-13 16:06:18','2018-01-13 16:06:18','2019-01-13 16:06:18'),
	('f9847ee5fd49a3095bfa31f43c5bf95db33ce21210a8c1c3b3414623444f59093c580bca9dc18b6c',4,1,NULL,'[]',0,'2018-01-13 17:08:13','2018-01-13 17:08:13','2019-01-13 17:08:13');

/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_auth_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table oauth_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`)
VALUES
	(1,4,'Rising Software','HytPUUPj7plPDSbfCjnSaagZBsU5oAH8ctBaRMRy','http://localhost',0,1,0,'2018-01-13 15:51:08','2018-01-13 15:51:08'),
	(2,3,'AMEB Connect NSW','UuimoaM2PlG3kW01fU1WpT6xjhqEye5CXLUfkRlM','http://localhost',0,1,0,'2018-01-13 15:52:03','2018-01-13 15:52:03');

/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_personal_access_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table oauth_refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`)
VALUES
	('00914a380c1882f8bddada868023f5a3e72a3ae11d372b908010cf7d491b63032ce1787eb9d8ef43','363b3679641d41eab1dd6ffeae8a03948063af5c06c3c35260976db58837014a2c9c85a2a4a47e29',0,'2019-01-13 16:07:19'),
	('042c32b0d3400de9839f2c3a2eee9146d6f63a641f1dfa3cddf7276810461387192c8cd0c7aa2252','ebfe4a1ac384f8fb7a81f98353c557ce6d76467892af677d8a9a0792048c936e715f14afb63b04ba',0,'2019-01-13 16:06:18'),
	('18370e30d69cf51f2284a95d542c741125c2b7ce55b36d9a808b632534e27cd8abcad33013654531','6f9de336151566ff17a117a229574cf1a3e896d8c0c939b865610033c6f975b42587702488d15f04',0,'2019-01-13 16:01:41'),
	('2bfd394d89d05991fe1c91c66cc31c957eb9ceca89605714c7921739887b77d7d9d63f256e1aabaf','c94f321591307778cd06982f350702275b379f670c73ed7154bd37049be4e3beed7fae18d3250df2',0,'2019-01-13 15:59:31'),
	('604249ed74d873fe5822130450766f1463d99abe79eb6a5c4c9670336f880fcd7c0cc1446a86e287','c945e6a617fd7387df69d4778f99843d661a728db2b4a946aed4d19243a7111d25e3835651c4f5c6',0,'2019-01-13 16:30:58'),
	('6e0900123ad93ff9d8c20e6dced05885fdbea760dadd734b5c0a78216ecb03126dc24b946635969a','8f3a534c73a2ac7a5044123a1e2cc9c4a81c5d5040ee9033adbc36de8559470ec301e81020784cdd',0,'2019-01-13 16:04:48'),
	('85ded68b843740c1e9bbfa45ad97308e27ed744786a9db0fe0f5046501db253930aa178ea87cdeae','0e983cb668a702e74e59cc2b9e00b4d811b6d45e64000532a724db6ac1f1bcec4fd46352780ab674',0,'2019-01-13 16:00:33'),
	('d2b641b6fdab5921b16d7d5277a8ba20298b7d74b30d12703577cea8dcc11133f54b41dd02fce42a','f9847ee5fd49a3095bfa31f43c5bf95db33ce21210a8c1c3b3414623444f59093c580bca9dc18b6c',0,'2019-01-13 17:08:13');

/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table online_examination_state
# ------------------------------------------------------------

DROP TABLE IF EXISTS `online_examination_state`;

CREATE TABLE `online_examination_state` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `online_examination_id` bigint(20) unsigned NOT NULL,
  `state_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `online_examination_state_online_examination_id_index` (`online_examination_id`),
  KEY `online_examination_state_state_id_index` (`state_id`),
  CONSTRAINT `online_examination_state_online_examination_id_foreign` FOREIGN KEY (`online_examination_id`) REFERENCES `online_examinations` (`id`),
  CONSTRAINT `online_examination_state_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table online_examination_state_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `online_examination_state_price`;

CREATE TABLE `online_examination_state_price` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `online_examination_id` bigint(20) unsigned NOT NULL,
  `state_id` bigint(20) unsigned NOT NULL,
  `last_updated_by` int(10) unsigned NOT NULL,
  `price` double(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `online_examination_state_price_online_examination_id_index` (`online_examination_id`),
  KEY `online_examination_state_price_state_id_index` (`state_id`),
  KEY `online_examination_state_price_last_updated_by_index` (`last_updated_by`),
  CONSTRAINT `online_examination_state_price_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `online_examination_state_price_online_examination_id_foreign` FOREIGN KEY (`online_examination_id`) REFERENCES `online_examinations` (`id`),
  CONSTRAINT `online_examination_state_price_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table online_examinations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `online_examinations`;

CREATE TABLE `online_examinations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `expiry_months` int(10) unsigned NOT NULL COMMENT 'In Months',
  `renewable_fee_type` enum('default','custom','non-renewable') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `renewable_fee` double(15,2) DEFAULT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `sub_category_id` bigint(20) unsigned NOT NULL,
  `grade_id` bigint(20) unsigned NOT NULL,
  `exam_duration` int(10) unsigned NOT NULL COMMENT 'In Minutes',
  `marking_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_manual_marking` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL,
  `certificate_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_type` enum('online','offline') COLLATE utf8mb4_unicode_ci NOT NULL,
  `rising_software_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_price` double(15,2) NOT NULL,
  `state_price` enum('default','state') COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_updated_by` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_updated_by_user` int(10) unsigned NOT NULL,
  `status` enum('active','in-active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibility` enum('visible','not-visible') COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_practice_exams` int(11) NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `appeal_price` double(15,2) NOT NULL,
  `course_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `practice_exam_link` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `online_examinations_subject_code_unique` (`subject_code`),
  KEY `online_examinations_renewable_fee_type_index` (`renewable_fee_type`),
  KEY `online_examinations_category_id_index` (`category_id`),
  KEY `online_examinations_sub_category_id_index` (`sub_category_id`),
  KEY `online_examinations_grade_id_index` (`grade_id`),
  KEY `online_examinations_exam_type_index` (`exam_type`),
  KEY `online_examinations_state_price_index` (`state_price`),
  KEY `online_examinations_last_updated_by_user_index` (`last_updated_by_user`),
  KEY `online_examinations_status_index` (`status`),
  KEY `online_examinations_visibility_index` (`visibility`),
  CONSTRAINT `online_examinations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `online_examinations_grade_id_foreign` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`id`),
  CONSTRAINT `online_examinations_last_updated_by_user_foreign` FOREIGN KEY (`last_updated_by_user`) REFERENCES `users` (`id`),
  CONSTRAINT `online_examinations_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `online_examinations` WRITE;
/*!40000 ALTER TABLE `online_examinations` DISABLE KEYS */;

INSERT INTO `online_examinations` (`id`, `title`, `slug`, `subject_code`, `image`, `description`, `expiry_months`, `renewable_fee_type`, `renewable_fee`, `category_id`, `sub_category_id`, `grade_id`, `exam_duration`, `marking_type`, `is_manual_marking`, `certificate_type`, `exam_type`, `rising_software_key`, `default_price`, `state_price`, `last_updated_by`, `last_updated_by_user`, `status`, `visibility`, `no_of_practice_exams`, `created_at`, `updated_at`, `appeal_price`, `course_id`, `practice_exam_link`, `position`)
VALUES
	(1,'Theory of Music - Grade 1','theory-of-music-grade-1','0001','2d3efe603e25be3056a85c01010a38e48fe66e71.png','Theory of Music - Grade 1',12,'default',NULL,1,1,1,180,'[\"manual\",\"automated\"]','','[\"e-certificate\"]','online','theory_1_official',70.00,'default','AMEB Superadmin',1,'active','visible',2,'2017-12-25 17:54:51','2018-01-12 14:20:34',0.00,'NULL','theory_1_practice',1),
	(2,'Theory of Music - Grade 2','theory-of-music-grade-2','0002','4df85ae6df49189f1e4ac15954431990f818cb10.png','Theory of Music - Grade 2',12,'default',NULL,1,1,2,180,'[\"manual\",\"automated\"]','','[\"e-certificate\",\"hard-copy\"]','online','theory_2_official',74.00,'default','AMEB Superadmin',1,'active','visible',2,'2017-12-25 17:57:06','2018-01-12 14:20:38',0.00,'NULL','theory_2_practice',2),
	(3,'Theory of Music - Grade 3','theory-of-music-grade-3','0003','29787400bd8116a58d37c54e72f6bae0b7ab8379.png','Theory of Music - Grade 3',12,'default',NULL,1,1,3,180,'[\"manual\",\"automated\"]','','[\"e-certificate\",\"hard-copy\"]','online','theory_3_official',77.00,'default','AMEB Superadmin',1,'active','visible',2,'2017-12-25 17:58:26','2018-01-12 14:20:42',0.00,'NULL','theory_3_practice',3),
	(4,'Theory of Music - Grade 4','theory-of-music-grade-4','0004','ade9b73a1fc05c391f993aad122cd1b16b3c5ed3.png','Theory of Music - Grade 4',12,'default',NULL,1,1,4,180,'[\"manual\",\"automated\"]','','[\"e-certificate\",\"hard-copy\"]','online','theory_4_official',81.00,'default','AMEB Superadmin',1,'active','visible',2,'2017-12-25 17:59:50','2018-01-12 14:20:45',0.00,'NULL','theory_4_practice',4),
	(5,'Theory of Music - Grade 5','theory-of-music-grade-5','0005','dc18ebdded6d3b2ee5aa71ce7e21e05d29a53b53.png','Theory of Music - Grade 5',12,'default',NULL,1,1,5,180,'[\"manual\",\"automated\"]','','[\"e-certificate\",\"hard-copy\"]','online','theory_5_official',87.00,'default','AMEB Superadmin',1,'active','visible',2,'2017-12-25 18:04:33','2018-01-12 14:20:49',0.00,'NULL','theory_5_practice',5),
	(6,'Theory of Music - Grade 6','theory-of-music-grade-6','0006','a5278a6d8b53606cbd79b0cbfe1c4b0a62f7d27e.png','Theory of Music - Grade 6',12,'default',NULL,1,1,16,180,'[\"manual\",\"automated\"]','','[\"e-certificate\",\"hard-copy\"]','online','theory_6_official',90.00,'default','AMEB Superadmin',1,'active','visible',2,'2017-12-25 18:05:29','2018-01-12 14:20:52',0.00,'NULL','theory_6_practice',6),
	(7,'Music Craft - Preliminary','music-craft-grade-1','1540','abe2e44ce70225b21d4c508c9116b8dd925dbcee.png','Music Craft - Preliminary',12,'default',NULL,1,2,17,180,'[\"manual\",\"automated\"]','','[\"e-certificate\",\"hard-copy\"]','online','musiccraft_p_official',69.00,'default','AMEB Superadmin',1,'active','visible',2,'2017-12-25 18:09:33','2018-01-12 09:57:58',0.00,'NULL','musiccraft_p_practice',0),
	(8,'Music Craft - Grade 1','music-craft-grade-1-1','1541','ebb66fa309eab26f48492bba89cf1d6d5c78a27d.png','Music Craft - Grade 1',12,'default',NULL,1,2,6,180,'[\"manual\",\"automated\"]','','[\"e-certificate\",\"hard-copy\"]','online','musiccraft_1_official',73.00,'default','AMEB Superadmin',1,'active','visible',2,'2017-12-25 18:11:11','2018-01-12 14:21:33',0.00,'NULL','musiccraft_1_practice',1),
	(9,'Music Craft - Grade 2','music-craft-grade-2','1542','ae55d7270e9c992a6cf9668a222c09c38bddb0fe.png','Music Craft - Grade 2',12,'default',NULL,1,2,7,180,'[\"manual\",\"automated\"]','','[\"e-certificate\",\"hard-copy\"]','online','musiccraft_2_official',76.00,'default','AMEB Superadmin',1,'active','visible',2,'2017-12-25 18:12:09','2018-01-12 14:21:38',0.00,'NULL','musiccraft_2_practice',2),
	(10,'Music Craft - Grade 3','music-craft-grade-3','1543','2a866ca51857d401590a366564bed24ec3c2988c.png','Music Craft - Grade 3',12,'default',NULL,1,2,8,180,'[\"manual\",\"automated\"]','','[\"e-certificate\",\"hard-copy\"]','online','musiccraft_3_official',81.00,'default','AMEB Superadmin',1,'active','visible',2,'2017-12-25 18:13:03','2018-01-12 14:21:44',0.00,'NULL','musiccraft_3_practice',3),
	(11,'Music Craft - Grade 4','music-craft-grade-4','1544','7a41e084c1eed35080b109d365d07309ebad4f35.png','Music Craft - Grade 4',12,'default',NULL,1,2,9,180,'[\"manual\",\"automated\"]','','[\"e-certificate\",\"hard-copy\"]','online','musiccraft_4_official',86.00,'default','AMEB Superadmin',1,'active','visible',2,'2017-12-25 18:15:35','2018-01-12 14:21:48',0.00,'NULL','musiccraft_4_practice',4),
	(12,'Musicianship - Grade 1','musicianship-grade-1','0021','99158d847a87e925d317247e53f2a9e0e603d44b.png','Musicianship - Grade 1',12,'default',NULL,1,3,11,180,'[\"manual\",\"automated\"]','','[\"e-certificate\",\"hard-copy\"]','online','musicianship_1_official',70.00,'default','AMEB Superadmin',1,'active','visible',2,'2017-12-25 18:18:38','2018-01-12 14:22:06',0.00,'NULL','musicianship_1_practice',1),
	(13,'Musicianship - Grade 2','musicianship-grade-2','0022','c943b734ca04a5c60e7e6e6ce898b422e6412770.png','Musicianship - Grade 2',12,'default',NULL,1,3,12,180,'[\"manual\",\"automated\"]','','[\"e-certificate\",\"hard-copy\"]','online','musicianship_2_official',74.00,'default','AMEB Superadmin',1,'active','visible',2,'2017-12-25 18:19:45','2018-01-12 14:22:10',0.00,'NULL','musicianship_2_practice',2),
	(14,'Musicianship - Grade 3','musicianship-grade-3','0023','336858ad433e627a9c0ccffc20bcbe39a9811e24.png','Musicianship - Grade 3',12,'default',NULL,1,3,13,180,'[\"manual\",\"automated\"]','','[\"e-certificate\",\"hard-copy\"]','online','musicianship_3_official',76.00,'default','AMEB Superadmin',1,'active','visible',2,'2017-12-25 18:20:31','2018-01-12 14:22:15',0.00,'NULL','musicianship_3_practice',3),
	(15,'Musicianship - Grade 4','musicianship-grade-4','0024','1a44dfe4ba5fac9ea5e305a9171081a470d3e6f8.png','Musicianship - Grade 4',12,'default',NULL,1,3,14,180,'[\"manual\",\"automated\"]','','[\"e-certificate\",\"hard-copy\"]','online','musicianship_4_official',87.00,'default','AMEB Superadmin',1,'active','visible',2,'2017-12-25 18:22:10','2018-01-12 14:22:19',0.00,'NULL','musicianship_4_practice',4),
	(16,'Musicianship - Grade 5','musicianship-grade-5','0025','502678879c685fe12887abbdec0b7c5fb73d4ca2.png','Musicianship - Grade 5',12,'default',NULL,1,3,15,180,'[\"manual\",\"automated\"]','','[\"e-certificate\",\"hard-copy\"]','online','musicianship_5_official',92.00,'default','AMEB Superadmin',1,'active','visible',2,'2017-12-25 18:24:09','2018-01-12 14:22:23',0.00,'NULL','musicianship_5_practice',5),
	(17,'Musicianship - Grade 6','musicianship-grade-6','0026','0d1da0d1e13fcf0bf04de6dfc2939f410aa76700.png','Musicianship - Grade 6',12,'default',NULL,1,3,18,180,'[\"manual\",\"automated\"]','','[\"e-certificate\",\"hard-copy\"]','online','musicianship_6_official',97.00,'default','AMEB Superadmin',1,'active','visible',2,'2017-12-25 18:25:26','2018-01-12 14:22:30',0.00,'NULL','musicianship_6_practice',6);

/*!40000 ALTER TABLE `online_examinations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `options`;

CREATE TABLE `options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;

INSERT INTO `options` (`id`, `name`, `value`, `deleted_at`, `created_at`, `updated_at`)
VALUES
	(1,'company_name','AMEB Ltd.',NULL,'2017-12-30 23:36:21','2017-12-30 23:36:21'),
	(2,'email','online@ameb.edu.au',NULL,'2017-12-30 23:36:21','2017-12-30 23:36:21'),
	(3,'contact_number','1300 725 709',NULL,'2017-12-30 23:36:21','2017-12-30 23:36:21'),
	(4,'date_format','F j, Y',NULL,'2017-12-30 23:36:21','2017-12-30 23:36:21'),
	(5,'no_of_practice_exams','2',NULL,'2017-12-30 23:36:21','2017-12-30 23:36:21'),
	(6,'renewable_fee','10',NULL,'2017-12-30 23:36:21','2017-12-30 23:36:21'),
	(7,'gst','10',NULL,'2017-12-30 23:36:21','2017-12-30 23:36:21'),
	(8,'extension_period','365',NULL,'2017-12-30 23:36:21','2018-01-13 15:05:14');

/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table practice_examinations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `practice_examinations`;

CREATE TABLE `practice_examinations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_id` bigint(20) unsigned NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `expiry_months` int(10) unsigned NOT NULL COMMENT 'In Months',
  `expiry_date` date NOT NULL COMMENT 'Should be calculated from expiry_months',
  `allowed_number` int(10) unsigned NOT NULL,
  `price` double(15,2) NOT NULL,
  `last_updated_by` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_updated_by_user` int(10) unsigned NOT NULL,
  `status` enum('active','in-active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibility` enum('visible','not-visible') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `practice_examinations_exam_id_index` (`exam_id`),
  KEY `practice_examinations_allowed_number_index` (`allowed_number`),
  KEY `practice_examinations_last_updated_by_user_index` (`last_updated_by_user`),
  KEY `practice_examinations_status_index` (`status`),
  KEY `practice_examinations_visibility_index` (`visibility`),
  CONSTRAINT `practice_examinations_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `online_examinations` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `practice_examinations_last_updated_by_user_foreign` FOREIGN KEY (`last_updated_by_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table purchase_candidates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_candidates`;

CREATE TABLE `purchase_candidates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exam_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_pin` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('male','female','other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `ameb_candidate_no` int(11) NOT NULL,
  `lui_number` int(11) DEFAULT NULL,
  `registration_year` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exam_id` bigint(20) NOT NULL,
  `account_holder_id` bigint(20) unsigned NOT NULL,
  `is_class_exam` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `class_identifier` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_detail_id` bigint(20) unsigned NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `no_of_practice_exams` int(11) NOT NULL DEFAULT '2',
  `expiry_date` date DEFAULT NULL,
  `type` enum('exam','course') COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchased_date` date DEFAULT NULL,
  `extension_requested` tinyint(1) NOT NULL DEFAULT '0',
  `refund_requested` tinyint(1) NOT NULL DEFAULT '0',
  `enrollment_status` enum('active','expired','inactive','cancelled','taken') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('not_submitted','pending','error','completed','marked') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_candidates_exam_key_index` (`exam_key`),
  KEY `purchase_candidates_account_holder_id_index` (`account_holder_id`),
  KEY `purchase_candidates_purchase_detail_id_index` (`purchase_detail_id`),
  KEY `purchase_candidates_type_index` (`type`),
  CONSTRAINT `purchase_candidates_account_holder_id_foreign` FOREIGN KEY (`account_holder_id`) REFERENCES `account_holders` (`id`),
  CONSTRAINT `purchase_candidates_purchase_detail_id_foreign` FOREIGN KEY (`purchase_detail_id`) REFERENCES `purchase_details` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `purchase_candidates` WRITE;
/*!40000 ALTER TABLE `purchase_candidates` DISABLE KEYS */;

INSERT INTO `purchase_candidates` (`id`, `exam_key`, `exam_pin`, `first_name`, `middle_name`, `last_name`, `gender`, `date_of_birth`, `ameb_candidate_no`, `lui_number`, `registration_year`, `remember_token`, `exam_id`, `account_holder_id`, `is_class_exam`, `class_identifier`, `purchase_detail_id`, `transaction_id`, `created_at`, `updated_at`, `no_of_practice_exams`, `expiry_date`, `type`, `purchased_date`, `extension_requested`, `refund_requested`, `enrollment_status`, `status`)
VALUES
	(1,'QLD7922009','2P2I','Sailendra','','Mizar','male','2003-07-06',123123,231231,'2018',NULL,7,1,'yes','LN6QS1',1,0,'2018-01-12 16:59:09','2018-01-12 17:01:57',2,'2019-01-12','exam','2018-01-12',0,0,'active','not_submitted'),
	(2,'QLD1181621','CPEC','Prabha','','Bhatta','male','2001-07-15',123123123,0,NULL,NULL,7,1,'yes','LN6QS1',1,0,'2018-01-12 16:59:09','2018-01-12 17:01:57',2,'2019-01-12','exam','2018-01-12',0,0,'active','not_submitted'),
	(3,'NT99972738','TZAB','Bhoj','Raj','Bhatta','male','1990-03-30',234234,0,NULL,NULL,9,2,'no',NULL,2,0,'2018-01-13 14:35:32','2018-01-13 15:06:33',2,'2019-02-12','exam','2018-01-13',1,0,'active','not_submitted'),
	(4,'QLD6266616','02VC','Bhoj','Raj','Bhatta','male','2006-01-01',123123,0,NULL,'FWjSoY1LgzASs02XbkP6cO1esX8J3p1jwLogIJepsTEBCJk9a9UEokfnVkwK',1,1,'no',NULL,3,0,'2018-01-13 15:27:11','2018-01-13 15:30:31',2,'2019-01-13','exam','2018-01-13',0,0,'taken','not_submitted');

/*!40000 ALTER TABLE `purchase_candidates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table purchase_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_details`;

CREATE TABLE `purchase_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `type` enum('course','exam') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_class_exam` tinyint(1) NOT NULL DEFAULT '1',
  `account_holder_id` bigint(20) unsigned NOT NULL,
  `price` double(15,2) NOT NULL,
  `candidate_number` int(11) NOT NULL,
  `total` double(15,2) NOT NULL,
  `gst` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `is_complete` tinyint(1) NOT NULL DEFAULT '0',
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `is_refund_requested` tinyint(1) NOT NULL DEFAULT '0',
  `is_extension_requested` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `purchase_details_account_holder_id_index` (`account_holder_id`),
  KEY `purchase_details_cart_id_index` (`cart_id`),
  KEY `purchase_details_state_id_index` (`state_id`),
  CONSTRAINT `purchase_details_account_holder_id_foreign` FOREIGN KEY (`account_holder_id`) REFERENCES `account_holders` (`id`),
  CONSTRAINT `purchase_details_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `purchase_details` WRITE;
/*!40000 ALTER TABLE `purchase_details` DISABLE KEYS */;

INSERT INTO `purchase_details` (`id`, `product_id`, `type`, `is_class_exam`, `account_holder_id`, `price`, `candidate_number`, `total`, `gst`, `cart_id`, `created_at`, `updated_at`, `expiry_date`, `is_complete`, `state_id`, `is_refund_requested`, `is_extension_requested`)
VALUES
	(1,7,'exam',1,1,69.00,2,138.00,'',1,'2018-01-12 16:59:09','2018-01-12 17:01:57','2019-01-12',1,4,0,0),
	(2,9,'exam',0,2,76.00,1,76.00,'',2,'2018-01-13 14:35:32','2018-01-13 14:36:24','2019-01-13',1,8,0,0),
	(3,1,'exam',0,1,70.00,1,70.00,'',3,'2018-01-13 15:27:11','2018-01-13 15:29:06','2019-01-13',1,4,0,0);

/*!40000 ALTER TABLE `purchase_details` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table session_venue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `session_venue`;

CREATE TABLE `session_venue` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `venue_id` bigint(20) unsigned NOT NULL,
  `session_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `session_venue_venue_id_index` (`venue_id`),
  KEY `session_venue_session_id_index` (`session_id`),
  CONSTRAINT `session_venue_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`),
  CONSTRAINT `session_venue_venue_id_foreign` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('active','in-active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table site_maintenance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `site_maintenance`;

CREATE TABLE `site_maintenance` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in_active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_maintenance_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `site_maintenance` WRITE;
/*!40000 ALTER TABLE `site_maintenance` DISABLE KEYS */;

INSERT INTO `site_maintenance` (`id`, `title`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'Site Maintenance Mode','in_active',NULL,NULL);

/*!40000 ALTER TABLE `site_maintenance` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table site_notices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `site_notices`;

CREATE TABLE `site_notices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_link` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('administrator','finance/account','customer_support','accountholder','candidate','supervisor','all') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_notices_role_index` (`role`),
  KEY `site_notices_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table states
# ------------------------------------------------------------

DROP TABLE IF EXISTS `states`;

CREATE TABLE `states` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notification_email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint(20) unsigned NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person_phone` bigint(20) unsigned NOT NULL,
  `contact_person_email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT 'NULL',
  `redirection` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notification` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `authority` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `api` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'NULL',
  `key` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'NULL',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `states_name_unique` (`name`),
  UNIQUE KEY `states_slug_unique` (`slug`),
  KEY `states_notification_index` (`notification`),
  KEY `states_authority_index` (`authority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;

INSERT INTO `states` (`id`, `name`, `slug`, `prefix`, `notification_email`, `contact_email`, `phone`, `address`, `contact_person`, `contact_person_phone`, `contact_person_email`, `website`, `redirection`, `notification`, `authority`, `api`, `key`, `created_at`, `updated_at`)
VALUES
	(1,'Victoria','vic','VIC','smohammad@ameb.edu.au','smohammad@ameb.edu.au',398823233,'259 Auburn Road, Hawthorn 3122','Mr Alwyn Mott, General Manager AMEB (VIC Limited)',406551602,'smohammad@ameb.edu.au','https://bosho.boardofstudies.nsw.edu.au/cgi-bin/LANSAWEB?PROCFUN+WAMEB00+WAC0000+MVP','yes','enabled','enabled','http://ameb.unimelb.edu.au/','NULL',NULL,'2018-01-12 09:31:21'),
	(2,'New South Wales','nsw','NSW','smohammad@ameb.edu.au','smohammad@ameb.edu.au',293678456,'Level 6, 117 Clarence Street, Sydney 2000','Ms Maree Lucas, State Manager AMEB',406551602,'smohammad@ameb.edu.au','https://bosho.boardofstudies.nsw.edu.au/cgi-bin/LANSAWEB?PROCFUN+WAMEB00+WAC0000+MBP','yes','enabled','enabled','http://www.ameb.nsw.edu.au/','NULL',NULL,'2018-01-12 09:18:39'),
	(3,'Australian Capital Territory','act','ACT','smohammad@ameb.edu.au','smohammad@ameb.edu.au',293678456,'Level 6, 117 Clarence Street, Sydney 2000','Ms Maree Lucas, State Manager AMEB',406551602,'smohammad@ameb.edu.au','https://bosho.boardofstudies.nsw.edu.au/cgi-bin/LANSAWEB?PROCFUN+WAMEB00+WAC0000+MBP','yes','enabled','enabled','http://www.ameb.nsw.edu.au/','NULL',NULL,'2018-01-12 09:18:23'),
	(4,'Queensland','qld','QLD','smohammad@ameb.edu.au','smohammad@ameb.edu.au',1800175515,'9 Nathan Avenue, Ashgrove 4060','Ms Lauren Thorne, State Manager AMEB (QLD)',406551602,'smohammad@ameb.edu.au','#','no','enabled','enabled','http://ameb.qld.edu.au/Pages/home.aspx','NULL',NULL,'2018-01-12 09:21:03'),
	(5,'Western Australia','wa','WA','smohammad@ameb.edu.au','smohammad@ameb.edu.au',864883059,'M421, 35 Stirling Highway, Crawley 6009','Ms Rosslyn Feast, State Manager AMEB (WA)',864883059,'smohammad@ameb.edu.au','#','no','enabled','enabled','http://www.ameb.uwa.edu.au/','NULL',NULL,'2018-01-12 09:32:07'),
	(6,'Tasmania','tas','TAS','smohammad@ameb.edu.au','smohammad@ameb.edu.au',362267317,'Tasmanian Conservatorium of Music, Private Bag 63, Hobart 7001','Mrs Marita Crothers, State Manager AMEB (TAS)',362267317,'smohammad@ameb.edu.au','https://tas.ameb.edu.au','no','enabled','enabled','http://www.utas.edu.au/australian-music-examinations-board','NULL',NULL,'2018-01-12 09:28:58'),
	(7,'South Australia','sa','ACT','smohammad@ameb.edu.au','smohammad@ameb.edu.au',883138088,'The University of Adelaide, 1st Floor, Hartley Building, Kintore Avenue, South Australia 5005','Ms Julie Cranswick, State Manager AMEB (SA & NT)',883138088,'smohammad@ameb.edu.au','#','no','enabled','enabled','https://ameb.adelaide.edu.au/','NULL',NULL,'2018-01-12 09:33:09'),
	(8,'Northern Territory','nt','NT','smohammad@ameb.edu.au','smohammad@ameb.edu.au',883138088,'The University of Adelaide, 1st Floor, Hartley Building, Kintore Avenue, South Australia 5005','Ms Julie Cranswick, State Manager AMEB (SA & NT)',883138088,'smohammad@ameb.edu.au','3','no','enabled','enabled','https://ameb.adelaide.edu.au/','NULL',NULL,'2018-01-12 09:33:06');

/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sub_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sub_categories`;

CREATE TABLE `sub_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `visibility` enum('visible','not_visible') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `availability` enum('available','not_available') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_categories_category_id_index` (`category_id`),
  KEY `sub_categories_visibility_index` (`visibility`),
  KEY `sub_categories_status_index` (`status`),
  KEY `sub_categories_availability_index` (`availability`),
  CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;

INSERT INTO `sub_categories` (`id`, `name`, `slug`, `description`, `image`, `category_id`, `visibility`, `status`, `availability`, `created_at`, `updated_at`)
VALUES
	(1,'Theory of Music','theory-of-music','','test',1,'visible','active','available',NULL,NULL),
	(2,'Music Craft','music-craft','','test',1,'visible','active','available',NULL,NULL),
	(3,'Musicianship','musicianship','','test',1,'visible','active','available',NULL,NULL);

/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table supervisor_lists
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supervisor_lists`;

CREATE TABLE `supervisor_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorisation_time` datetime NOT NULL,
  `type` enum('individual','class') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'individual',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `supervisor_lists` WRITE;
/*!40000 ALTER TABLE `supervisor_lists` DISABLE KEYS */;

INSERT INTO `supervisor_lists` (`id`, `full_name`, `phone`, `authorisation_time`, `type`, `created_at`, `updated_at`)
VALUES
	(2,'Mohammad Sarfaraz','0404444444','2018-01-13 16:48:25','individual','2018-01-13 16:48:25','2018-01-13 16:48:25');

/*!40000 ALTER TABLE `supervisor_lists` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table syllabuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `syllabuses`;

CREATE TABLE `syllabuses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `syllabuses_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `syllabuses` WRITE;
/*!40000 ALTER TABLE `syllabuses` DISABLE KEYS */;

INSERT INTO `syllabuses` (`id`, `title`, `slug`, `file`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'Music craft','music-craft','e58c30ab7a151367784e3d8d7b45c8c4dceed0de.pdf','active','2018-01-11 07:47:27','2018-01-11 07:47:27'),
	(2,'Theory of Music','theory-of-music','fe87d312ffd77f2997f5c80ae7bc990e369993ca.pdf','active','2018-01-11 07:48:32','2018-01-11 07:48:32'),
	(3,'Musicianship','musicianship','0ce92248373866ec280dd1a0d7a34ad70941b3ce.pdf','active','2018-01-11 07:51:16','2018-01-11 07:51:16');

/*!40000 ALTER TABLE `syllabuses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table temp_candidate_lists
# ------------------------------------------------------------

DROP TABLE IF EXISTS `temp_candidate_lists`;

CREATE TABLE `temp_candidate_lists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_holder_id` bigint(20) unsigned NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('male','female','other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `ameb_candidate_no` int(11) NOT NULL,
  `lui_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_year` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zzz_candidate_lists_account_holder_id_index` (`account_holder_id`),
  CONSTRAINT `zzz_candidate_lists_account_holder_id_foreign` FOREIGN KEY (`account_holder_id`) REFERENCES `account_holders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ticket_threads
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ticket_threads`;

CREATE TABLE `ticket_threads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint(20) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_updated_date` date DEFAULT NULL,
  `last_updated_by` int(10) unsigned DEFAULT NULL,
  `user_type` enum('accountholder','admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_threads_ticket_id_index` (`ticket_id`),
  KEY `ticket_threads_last_updated_by_index` (`last_updated_by`),
  KEY `ticket_threads_user_type_index` (`user_type`),
  CONSTRAINT `ticket_threads_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `ticket_threads_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table tickets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tickets`;

CREATE TABLE `tickets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_holder_id` bigint(20) unsigned NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_type` enum('general','refund','extension') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `isExtended` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `extension_comments` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_general` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `general_comments` text COLLATE utf8mb4_unicode_ci,
  `purchase_id` bigint(20) DEFAULT NULL,
  `examkey` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closed_by` int(10) unsigned DEFAULT NULL,
  `closed_comments` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'NULL',
  `closed_date` date DEFAULT NULL,
  `approved_by` int(10) unsigned DEFAULT NULL,
  `approved_comments` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'NULL',
  `approved_date` text COLLATE utf8mb4_unicode_ci,
  `isApproved` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `extend_date` date DEFAULT NULL,
  `extended_date` date DEFAULT NULL,
  `extended_by` int(10) unsigned DEFAULT NULL,
  `extended_comments` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'NULL',
  `replied_by` int(10) unsigned DEFAULT NULL,
  `replied_date` date DEFAULT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isRefunded` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `refunded_by` int(10) unsigned DEFAULT NULL,
  `refund_comments` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'NULL',
  `refunded_date` date DEFAULT NULL,
  `is_read_stf` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `is_read_acc` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `candidate_id` bigint(20) unsigned DEFAULT NULL,
  `status` enum('active','in_active','closed','reopen','refunded','resolved','extended','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `tickets_examkey_foreign` (`examkey`),
  KEY `tickets_account_holder_id_index` (`account_holder_id`),
  KEY `tickets_support_type_index` (`support_type`),
  KEY `tickets_isextended_index` (`isExtended`),
  KEY `tickets_is_general_index` (`is_general`),
  KEY `tickets_closed_by_index` (`closed_by`),
  KEY `tickets_approved_by_index` (`approved_by`),
  KEY `tickets_isapproved_index` (`isApproved`),
  KEY `tickets_extended_by_index` (`extended_by`),
  KEY `tickets_replied_by_index` (`replied_by`),
  KEY `tickets_isrefunded_index` (`isRefunded`),
  KEY `tickets_refunded_by_index` (`refunded_by`),
  KEY `tickets_is_read_stf_index` (`is_read_stf`),
  KEY `tickets_is_read_acc_index` (`is_read_acc`),
  KEY `tickets_candidate_id_index` (`candidate_id`),
  KEY `tickets_status_index` (`status`),
  CONSTRAINT `tickets_account_holder_id_foreign` FOREIGN KEY (`account_holder_id`) REFERENCES `account_holders` (`id`),
  CONSTRAINT `tickets_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`),
  CONSTRAINT `tickets_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `purchase_candidates` (`id`),
  CONSTRAINT `tickets_closed_by_foreign` FOREIGN KEY (`closed_by`) REFERENCES `users` (`id`),
  CONSTRAINT `tickets_examkey_foreign` FOREIGN KEY (`examkey`) REFERENCES `purchase_candidates` (`exam_key`),
  CONSTRAINT `tickets_extended_by_foreign` FOREIGN KEY (`extended_by`) REFERENCES `users` (`id`),
  CONSTRAINT `tickets_refunded_by_foreign` FOREIGN KEY (`refunded_by`) REFERENCES `users` (`id`),
  CONSTRAINT `tickets_replied_by_foreign` FOREIGN KEY (`replied_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_logged_in` timestamp NULL DEFAULT NULL,
  `last_logged_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` enum('superadmin','account','customer_support','supervisor','state') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer_support',
  `status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_user_type_index` (`user_type`),
  KEY `users_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `full_name`, `phone`, `username`, `email`, `address`, `password`, `last_logged_in`, `last_logged_from`, `user_type`, `status`, `remember_token`, `created_at`, `updated_at`, `state_id`)
VALUES
	(1,'AMEB Superadmin','','superadmin','superadmin@gmail.com','','$2y$10$6JBOQh/jcSjQ0sZlaWBAZuWQNan8OHzWPMhD35g2BtGphjWuAMV.a',NULL,NULL,'superadmin','active','Fvab99IWcwJ0tDsjNecAm2vkxomjk2xT58J9p1Re1u54HRe5EVqDLlKUrpkL',NULL,NULL,NULL),
	(2,'Deborah Johnston','0404444444','deb','deb@stage.ameb.edu.au','21 Victoria Street','$2y$10$X9mTc1FWRIC.3WT4bfScPedjRF9cmPoIMjm0fDKtvhtlRGbFXl9V.','2018-01-10 20:03:25',NULL,'account','active','UySo6BdQ9F6GGOxiY7YVj91LRYAOvk4TcRRIA0Qb1pNyttA2IaGw37ou8O7t',NULL,'2018-01-10 20:03:25',NULL),
	(3,'VIC AMEB','0404490454','amebvic','viaameb@ameb.edu.au','4 Trevannion Street, Glenroy','$2y$10$lzDeaPPKjkPw3V82GFlSzODxbC1sOU31MGuYFduY/nmsaFdD9kguG','2017-12-27 00:21:11',NULL,'state','active','E63vQAkgAtoD4XKf0CoNJ7eMXoOxII2iS0wPNmE0eo4g5U9g5zetdeDjDJgh','2017-12-27 00:21:11','2017-12-27 00:21:11',1),
	(4,'Matthew Lorenzon','0406551602','matthew','smohammad@ameb.edu.au','VIC','$2y$10$S9U9FluN3UEve7q5VS4TUeet6WsEbcQJOFy93mqIEJVXEsdZlgSbm','2017-12-28 19:12:58',NULL,'customer_support','active',NULL,'2017-12-28 19:12:58','2017-12-28 19:12:58',NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table venues
# ------------------------------------------------------------

DROP TABLE IF EXISTS `venues`;

CREATE TABLE `venues` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seats` int(10) unsigned NOT NULL,
  `venue` enum('private','group') COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` date NOT NULL,
  `till` date NOT NULL,
  `status` enum('active','in_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venues_venue_index` (`venue`),
  KEY `venues_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
