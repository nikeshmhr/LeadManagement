-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2016 at 06:35 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lead_management`
--
CREATE DATABASE IF NOT EXISTS `lead_management` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `lead_management`;

-- --------------------------------------------------------

--
-- Table structure for table `counsellor`
--

CREATE TABLE IF NOT EXISTS `counsellor` (
  `id` varchar(255) NOT NULL,
  `no_of_current_leads` int(11) NOT NULL,
  `max_no_of_leads` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `faculty_id` (`faculty_id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `counsellor`
--

INSERT INTO `counsellor` (`id`, `no_of_current_leads`, `max_no_of_leads`, `faculty_id`) VALUES
('ST102', 7, 8, 1),
('ST103', 6, 8, 2),
('ST104', 4, 8, 3),
('ST105', 6, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE IF NOT EXISTS `faculty` (
  `faculty_id` int(11) NOT NULL,
  `facutly_name` varchar(255) NOT NULL,
  PRIMARY KEY (`faculty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `facutly_name`) VALUES
(1, 'Computing'),
(2, 'Networking'),
(3, 'Multimedia'),
(4, 'BBA_Management'),
(5, 'MSC_IT'),
(6, 'Not Applicable');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_text` text NOT NULL,
  `lead_id` int(11) NOT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `lead_email_id` (`lead_id`),
  KEY `lead_id` (`lead_id`),
  KEY `lead_id_2` (`lead_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `feedback_text`, `lead_id`) VALUES
(2, 'This is the first test feedback.', 28),
(15, 'sfsdf\r\n', 28);

-- --------------------------------------------------------

--
-- Table structure for table `lead_info`
--

CREATE TABLE IF NOT EXISTS `lead_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `date_of_entry` date NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `student_status_id` int(4) NOT NULL,
  `followup_count` int(11) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `counsellor_id` varchar(255) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `next_followup` date NOT NULL,
  `is_old` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_id` (`email_id`),
  KEY `faculty_id` (`faculty_id`,`student_status_id`),
  KEY `counsellor_email_id` (`counsellor_id`),
  KEY `student_status_id` (`student_status_id`),
  KEY `counsellor_id` (`counsellor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `lead_info`
--

INSERT INTO `lead_info` (`id`, `email_id`, `name`, `phone`, `date_of_birth`, `date_of_entry`, `faculty_id`, `student_status_id`, `followup_count`, `semester`, `counsellor_id`, `gender`, `next_followup`, `is_old`) VALUES
(28, 'suresh@gmail.com', 'Suresh Shrestha', '1232131231', '1997-01-01', '2016-01-20', 2, 1, 2, 'S2', 'ST103', 1, '2016-01-27', 1),
(29, 'malik@gmail.com', 'Malik Waters', '62324234234234', '1991-09-14', '2016-01-20', 3, 1, 0, 'A1', 'ST103', 0, '2016-01-20', 1),
(32, 'a@a', 'R', '1', '2016-01-20', '2016-01-20', 4, 1, 0, 'S1', 'ST103', 0, '2016-01-21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `login_info`
--

CREATE TABLE IF NOT EXISTS `login_info` (
  `id` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` int(11) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_id` (`email_id`),
  KEY `roles` (`role`),
  KEY `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_info`
--

INSERT INTO `login_info` (`id`, `password`, `role`, `email_id`) VALUES
('ST101', '21232f297a57a5a743894a0e4a801fc3', 1, 'admin@gmail.com'),
('ST102', 'd93bea4c204c506cd3825c16020d3f10', 2, 'bip@gmail.com'),
('ST103', '1158f5f8d240a731d28068742adea0fd', 2, 'sus@gmail.com'),
('ST104', 'ba432ee0753bdd9128d2a05a0481d871', 2, 'aj@gmail.com'),
('ST105', '1f0c281a1508da2c1f19165ad4a592fb', 2, 'nks@gmail.com'),
('ST106', '4af5cab77c62eaec5f87b570f2d2b127', 3, 'mona@darling.com');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'Administrator'),
(4, 'Admission Officer'),
(2, 'Counsellor'),
(3, 'Receptionist'),
(5, 'Top Management');

-- --------------------------------------------------------

--
-- Table structure for table `sample`
--

CREATE TABLE IF NOT EXISTS `sample` (
  `name` varchar(20) NOT NULL,
  `dob` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sample`
--

INSERT INTO `sample` (`name`, `dob`) VALUES
('nikesh', '2015-12-01'),
('nikesh', '2015-12-25');

-- --------------------------------------------------------

--
-- Table structure for table `staff_info`
--

CREATE TABLE IF NOT EXISTS `staff_info` (
  `id` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_info`
--

INSERT INTO `staff_info` (`id`, `name`, `gender`, `role_id`) VALUES
('ST101', 'Nikesh Maharjan', 1, 1),
('ST102', 'Bipal Shakya', 1, 2),
('ST103', 'Sushant Lal', 1, 2),
('ST104', 'Ajeeja', 1, 2),
('ST105', 'Nikesh', 1, 2),
('ST106', 'Mona Lisa', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `student_status`
--

CREATE TABLE IF NOT EXISTS `student_status` (
  `student_status_id` int(4) NOT NULL AUTO_INCREMENT,
  `student_status` varchar(25) NOT NULL,
  PRIMARY KEY (`student_status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `student_status`
--

INSERT INTO `student_status` (`student_status_id`, `student_status`) VALUES
(1, 'Interested'),
(2, 'Dismissed'),
(3, 'Postponed'),
(4, 'Expired'),
(5, 'Pending'),
(6, 'Admitted');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `counsellor`
--
ALTER TABLE `counsellor`
  ADD CONSTRAINT `counsellor_ibfk_2` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `counsellor_ibfk_3` FOREIGN KEY (`id`) REFERENCES `login_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`lead_id`) REFERENCES `lead_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lead_info`
--
ALTER TABLE `lead_info`
  ADD CONSTRAINT `lead_info_ibfk_2` FOREIGN KEY (`student_status_id`) REFERENCES `student_status` (`student_status_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_info_ibfk_3` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_info_ibfk_4` FOREIGN KEY (`counsellor_id`) REFERENCES `counsellor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login_info`
--
ALTER TABLE `login_info`
  ADD CONSTRAINT `login_info_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff_info`
--
ALTER TABLE `staff_info`
  ADD CONSTRAINT `staff_info_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_info_ibfk_2` FOREIGN KEY (`id`) REFERENCES `login_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
