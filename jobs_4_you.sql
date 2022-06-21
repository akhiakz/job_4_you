-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2022 at 08:59 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobs_4_you`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_candidates_applied`
--

CREATE TABLE `app_candidates_applied` (
  `id` int(11) NOT NULL,
  `candidates_resume` varchar(100) DEFAULT NULL,
  `candidate_status` int(11) DEFAULT NULL,
  `candidates_placed` int(11) DEFAULT NULL,
  `candidates_id_id` int(11) DEFAULT NULL,
  `candidates_job_id_id` int(11) DEFAULT NULL,
  `candidates_employer_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_candidates_applied`
--

INSERT INTO `app_candidates_applied` (`id`, `candidates_resume`, `candidate_status`, `candidates_placed`, `candidates_id_id`, `candidates_job_id_id`, `candidates_employer_id_id`) VALUES
(1, 'images/weekly_on_october_25_0T79DIr.docx', 0, NULL, 1, 1, NULL),
(2, 'images/weekly_on_october_25_pWZkQlT.docx', 0, NULL, 1, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_company_registration`
--

CREATE TABLE `app_company_registration` (
  `id` int(11) NOT NULL,
  `company_name` varchar(50) DEFAULT NULL,
  `company_address` longtext DEFAULT NULL,
  `company_description` longtext DEFAULT NULL,
  `company_city` varchar(50) DEFAULT NULL,
  `company_website` varchar(200) DEFAULT NULL,
  `company_email` varchar(254) DEFAULT NULL,
  `company_contact` int(11) DEFAULT NULL,
  `company_logo` varchar(100) DEFAULT NULL,
  `company_password` varchar(50) DEFAULT NULL,
  `company_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_company_registration`
--

INSERT INTO `app_company_registration` (`id`, `company_name`, `company_address`, `company_description`, `company_city`, `company_website`, `company_email`, `company_contact`, `company_logo`, `company_password`, `company_status`) VALUES
(1, 'infox', 'kakkanad', 'it company', 'kochi', 'www.infox.com', 'akhilmtl8943@gmail.com', 2147483647, 'images/WhatsApp_Image_2022-05-13_at_11.42.18_AM.jpeg', '123', 1),
(2, 'wipro', 'kochi', 'Wipro is an organization with a strong technology DNA and takes pride in its craftsmanship. I am looking forward to executing 3 C\'s to accomplish such a transformation.', 'kochi', 'https://www.wipro.com/', 'wipro@gmail.com', 1234567893, 'images/OIP.jpg', '123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_employer_feedback`
--

CREATE TABLE `app_employer_feedback` (
  `id` int(11) NOT NULL,
  `employer_feedback_name` varchar(50) DEFAULT NULL,
  `employer_feedback_email` varchar(254) DEFAULT NULL,
  `employer_feedback_type` varchar(50) DEFAULT NULL,
  `employer_feedback_message` longtext DEFAULT NULL,
  `employer_feedback_reply` varchar(200) DEFAULT NULL,
  `employer_feedback_status` int(11) DEFAULT NULL,
  `employer_feedback_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_employer_feedback`
--

INSERT INTO `app_employer_feedback` (`id`, `employer_feedback_name`, `employer_feedback_email`, `employer_feedback_type`, `employer_feedback_message`, `employer_feedback_reply`, `employer_feedback_status`, `employer_feedback_id_id`) VALUES
(2, 'akhil', 'akhilmtl8943@gmail.com', 'it', 'message', 'replayed', 1, 1),
(3, 'wipro', 'wipro@gmail.com', 'https://www.wipro.com/', 'message', 'reply', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `app_employer_post_vacency`
--

CREATE TABLE `app_employer_post_vacency` (
  `id` int(11) NOT NULL,
  `employer_job_title` varchar(70) DEFAULT NULL,
  `employer_email` varchar(254) DEFAULT NULL,
  `employer_contact` varchar(50) DEFAULT NULL,
  `employer_experience` varchar(50) DEFAULT NULL,
  `employer_graduation` varchar(100) DEFAULT NULL,
  `employer_skill` varchar(50) DEFAULT NULL,
  `employer_description` longtext NOT NULL,
  `employer_jobstatus` int(11) NOT NULL,
  `employer_date` date DEFAULT NULL,
  `employer_vacency_number` varchar(50) DEFAULT NULL,
  `employer_enddate` date DEFAULT NULL,
  `employer_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_employer_post_vacency`
--

INSERT INTO `app_employer_post_vacency` (`id`, `employer_job_title`, `employer_email`, `employer_contact`, `employer_experience`, `employer_graduation`, `employer_skill`, `employer_description`, `employer_jobstatus`, `employer_date`, `employer_vacency_number`, `employer_enddate`, `employer_id_id`) VALUES
(1, 'python developer', 'akhilmtl8943@gmail.com', '9045131828', '2 year', 'diploma in computer engineering', 'skill', 'description', 0, '2022-05-13', '50', '2022-05-27', 1),
(2, 'Junior Developer', 'wipro@gmail.com', '1234567893', '1year', 'diploma', 'skill', 'At Cobblestone Energy we are on a mission to build the most advanced European electricity trading and analytics platform, with our technology being used by our teams of commercial traders to create significant value. We are looking for enthusiastic and resourceful developers who are passionate about building exceptionally reliable and performance data processing solutions.', 0, '2022-05-13', '20', '2022-05-19', 2);

-- --------------------------------------------------------

--
-- Table structure for table `app_user_feedback`
--

CREATE TABLE `app_user_feedback` (
  `id` int(11) NOT NULL,
  `user_feedback_name` varchar(50) DEFAULT NULL,
  `user_feedback_email` varchar(254) DEFAULT NULL,
  `user_feedback_profession` varchar(50) DEFAULT NULL,
  `user_feedback_message` longtext DEFAULT NULL,
  `user_feedback_reply` varchar(200) DEFAULT NULL,
  `user_feedback_status` int(11) DEFAULT NULL,
  `user_feedback_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_user_feedback`
--

INSERT INTO `app_user_feedback` (`id`, `user_feedback_name`, `user_feedback_email`, `user_feedback_profession`, `user_feedback_message`, `user_feedback_reply`, `user_feedback_status`, `user_feedback_id`) VALUES
(1, 'amal', 'amal@gmail.com', 'developer', 'message', 'replayed', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_user_registration`
--

CREATE TABLE `app_user_registration` (
  `id` int(11) NOT NULL,
  `user_fullname` varchar(70) DEFAULT NULL,
  `user_age` int(11) DEFAULT NULL,
  `user_education` varchar(50) DEFAULT NULL,
  `user_experience` varchar(50) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_contact` int(11) DEFAULT NULL,
  `user_gender` varchar(20) DEFAULT NULL,
  `user_city` varchar(30) DEFAULT NULL,
  `user_photo` varchar(100) DEFAULT NULL,
  `user_resume` varchar(100) DEFAULT NULL,
  `user_password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_user_registration`
--

INSERT INTO `app_user_registration` (`id`, `user_fullname`, `user_age`, `user_education`, `user_experience`, `user_email`, `user_contact`, `user_gender`, `user_city`, `user_photo`, `user_resume`, `user_password`) VALUES
(1, 'amal', 20, 'diploma', '2 year', 'amal@gmail.com', 2147483647, 'male', 'kochi', 'images/face8.jpg', 'images/weekly_on_october_25.docx', '123');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add company_registration', 7, 'add_company_registration'),
(26, 'Can change company_registration', 7, 'change_company_registration'),
(27, 'Can delete company_registration', 7, 'delete_company_registration'),
(28, 'Can view company_registration', 7, 'view_company_registration'),
(29, 'Can add user_registration', 8, 'add_user_registration'),
(30, 'Can change user_registration', 8, 'change_user_registration'),
(31, 'Can delete user_registration', 8, 'delete_user_registration'),
(32, 'Can view user_registration', 8, 'view_user_registration'),
(33, 'Can add user_feedback', 9, 'add_user_feedback'),
(34, 'Can change user_feedback', 9, 'change_user_feedback'),
(35, 'Can delete user_feedback', 9, 'delete_user_feedback'),
(36, 'Can view user_feedback', 9, 'view_user_feedback'),
(37, 'Can add employer_post_vacency', 10, 'add_employer_post_vacency'),
(38, 'Can change employer_post_vacency', 10, 'change_employer_post_vacency'),
(39, 'Can delete employer_post_vacency', 10, 'delete_employer_post_vacency'),
(40, 'Can view employer_post_vacency', 10, 'view_employer_post_vacency'),
(41, 'Can add employer_feedback', 11, 'add_employer_feedback'),
(42, 'Can change employer_feedback', 11, 'change_employer_feedback'),
(43, 'Can delete employer_feedback', 11, 'delete_employer_feedback'),
(44, 'Can view employer_feedback', 11, 'view_employer_feedback'),
(45, 'Can add candidates_applied', 12, 'add_candidates_applied'),
(46, 'Can change candidates_applied', 12, 'change_candidates_applied'),
(47, 'Can delete candidates_applied', 12, 'delete_candidates_applied'),
(48, 'Can view candidates_applied', 12, 'view_candidates_applied');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$Ah2nBTPyPtcRFnF1TAgsyI$OsqAZ+9FWKI9umAeHKbCqlUDPEOX1dSm6VbSatWO1cM=', NULL, 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2022-05-13 06:08:20.318014');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(12, 'app', 'candidates_applied'),
(7, 'app', 'company_registration'),
(11, 'app', 'employer_feedback'),
(10, 'app', 'employer_post_vacency'),
(9, 'app', 'user_feedback'),
(8, 'app', 'user_registration'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-05-13 06:07:13.648576'),
(2, 'auth', '0001_initial', '2022-05-13 06:07:14.640796'),
(3, 'admin', '0001_initial', '2022-05-13 06:07:14.865531'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-05-13 06:07:14.898464'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-05-13 06:07:14.928836'),
(6, 'app', '0001_initial', '2022-05-13 06:07:15.052351'),
(7, 'app', '0002_company_registration_company_status', '2022-05-13 06:07:15.099366'),
(8, 'app', '0003_user_feedback', '2022-05-13 06:07:15.170066'),
(9, 'app', '0004_employer_post_vacency', '2022-05-13 06:07:15.230313'),
(10, 'app', '0005_employer_post_vacency_employer_date', '2022-05-13 06:07:15.283346'),
(11, 'app', '0006_employer_feedback_user_feedback_user_feedback_reply_and_more', '2022-05-13 06:07:15.393075'),
(12, 'app', '0007_employer_post_vacency_employer_vacency_number', '2022-05-13 06:07:15.419085'),
(13, 'app', '0008_rename_employer_skill1_employer_post_vacency_employer_skill_and_more', '2022-05-13 06:07:15.532631'),
(14, 'app', '0009_alter_employer_post_vacency_employer_date_and_more', '2022-05-13 06:07:15.710606'),
(15, 'app', '0010_employer_post_vacency_employer_id', '2022-05-13 06:07:15.813038'),
(16, 'app', '0011_candidates_applied', '2022-05-13 06:07:15.933900'),
(17, 'app', '0012_candidates_applied_candidates_job_id', '2022-05-13 06:07:16.092367'),
(18, 'app', '0013_candidates_applied_candidates_employer_id', '2022-05-13 06:07:16.204578'),
(19, 'app', '0014_alter_candidates_applied_candidates_employer_id', '2022-05-13 06:07:22.678381'),
(20, 'app', '0015_alter_user_registration_user_photo_and_more', '2022-05-13 06:07:22.699339'),
(21, 'app', '0016_alter_candidates_applied_candidates_resume', '2022-05-13 06:07:22.716637'),
(22, 'app', '0017_alter_candidates_applied_candidates_resume_and_more', '2022-05-13 06:07:22.766174'),
(23, 'app', '0018_employer_feedback_employer_feedback_id_and_more', '2022-05-13 06:07:22.959762'),
(24, 'app', '0019_alter_candidates_applied_candidates_resume_and_more', '2022-05-13 06:07:23.008676'),
(25, 'app', '0020_alter_user_registration_user_photo_and_more', '2022-05-13 06:07:23.031886'),
(26, 'app', '0021_alter_user_registration_user_photo_and_more', '2022-05-13 06:07:23.057313'),
(27, 'app', '0022_alter_user_registration_user_photo_and_more', '2022-05-13 06:07:23.084962'),
(28, 'app', '0023_alter_user_registration_user_photo_and_more', '2022-05-13 06:07:23.137217'),
(29, 'contenttypes', '0002_remove_content_type_name', '2022-05-13 06:07:23.292022'),
(30, 'auth', '0002_alter_permission_name_max_length', '2022-05-13 06:07:23.458537'),
(31, 'auth', '0003_alter_user_email_max_length', '2022-05-13 06:07:23.517220'),
(32, 'auth', '0004_alter_user_username_opts', '2022-05-13 06:07:23.534155'),
(33, 'auth', '0005_alter_user_last_login_null', '2022-05-13 06:07:23.595756'),
(34, 'auth', '0006_require_contenttypes_0002', '2022-05-13 06:07:23.601492'),
(35, 'auth', '0007_alter_validators_add_error_messages', '2022-05-13 06:07:23.623411'),
(36, 'auth', '0008_alter_user_username_max_length', '2022-05-13 06:07:23.656762'),
(37, 'auth', '0009_alter_user_last_name_max_length', '2022-05-13 06:07:23.688584'),
(38, 'auth', '0010_alter_group_name_max_length', '2022-05-13 06:07:23.741864'),
(39, 'auth', '0011_update_proxy_permissions', '2022-05-13 06:07:23.783428'),
(40, 'auth', '0012_alter_user_first_name_max_length', '2022-05-13 06:07:23.832408'),
(41, 'sessions', '0001_initial', '2022-05-13 06:07:23.901874');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4tabonu5va0xqdvclwwvaoy1bob6d8up', '.eJyrVkrNLYjPTFGyMtJRCnZMyQWzDXWUSotTi1DYqSl5SlZKKZkFOfm5iUq1AAlwEnI:1npPBM:ZHwI_ueN7fZ1yUOkfeQroTH1_08pzk1tzcr2mI4bLno', '2022-05-27 06:53:48.790295');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_candidates_applied`
--
ALTER TABLE `app_candidates_applied`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_candidates_appli_candidates_id_id_0f194f33_fk_app_user_` (`candidates_id_id`),
  ADD KEY `app_candidates_appli_candidates_job_id_id_e195d168_fk_app_emplo` (`candidates_job_id_id`),
  ADD KEY `app_candidates_appli_candidates_employer__92867f1f_fk_app_compa` (`candidates_employer_id_id`);

--
-- Indexes for table `app_company_registration`
--
ALTER TABLE `app_company_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_employer_feedback`
--
ALTER TABLE `app_employer_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_employer_feedbac_employer_feedback_id_874e3650_fk_app_compa` (`employer_feedback_id_id`);

--
-- Indexes for table `app_employer_post_vacency`
--
ALTER TABLE `app_employer_post_vacency`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_employer_post_va_employer_id_id_28a07514_fk_app_compa` (`employer_id_id`);

--
-- Indexes for table `app_user_feedback`
--
ALTER TABLE `app_user_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_user_feedback_user_feedback_id_b1debc95_fk_app_user_` (`user_feedback_id`);

--
-- Indexes for table `app_user_registration`
--
ALTER TABLE `app_user_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_candidates_applied`
--
ALTER TABLE `app_candidates_applied`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_company_registration`
--
ALTER TABLE `app_company_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_employer_feedback`
--
ALTER TABLE `app_employer_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `app_employer_post_vacency`
--
ALTER TABLE `app_employer_post_vacency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_user_feedback`
--
ALTER TABLE `app_user_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app_user_registration`
--
ALTER TABLE `app_user_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_candidates_applied`
--
ALTER TABLE `app_candidates_applied`
  ADD CONSTRAINT `app_candidates_appli_candidates_employer__92867f1f_fk_app_compa` FOREIGN KEY (`candidates_employer_id_id`) REFERENCES `app_company_registration` (`id`),
  ADD CONSTRAINT `app_candidates_appli_candidates_id_id_0f194f33_fk_app_user_` FOREIGN KEY (`candidates_id_id`) REFERENCES `app_user_registration` (`id`),
  ADD CONSTRAINT `app_candidates_appli_candidates_job_id_id_e195d168_fk_app_emplo` FOREIGN KEY (`candidates_job_id_id`) REFERENCES `app_employer_post_vacency` (`id`);

--
-- Constraints for table `app_employer_feedback`
--
ALTER TABLE `app_employer_feedback`
  ADD CONSTRAINT `app_employer_feedbac_employer_feedback_id_874e3650_fk_app_compa` FOREIGN KEY (`employer_feedback_id_id`) REFERENCES `app_company_registration` (`id`);

--
-- Constraints for table `app_employer_post_vacency`
--
ALTER TABLE `app_employer_post_vacency`
  ADD CONSTRAINT `app_employer_post_va_employer_id_id_28a07514_fk_app_compa` FOREIGN KEY (`employer_id_id`) REFERENCES `app_company_registration` (`id`);

--
-- Constraints for table `app_user_feedback`
--
ALTER TABLE `app_user_feedback`
  ADD CONSTRAINT `app_user_feedback_user_feedback_id_b1debc95_fk_app_user_` FOREIGN KEY (`user_feedback_id`) REFERENCES `app_user_registration` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
