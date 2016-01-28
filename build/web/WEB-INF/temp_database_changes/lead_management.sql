-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2016 at 08:09 AM
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
('ST102', 8, 8, 1),
('ST103', 8, 8, 2),
('ST104', 8, 8, 3),
('ST105', 8, 8, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `feedback_text`, `lead_id`) VALUES
(2, 'This is the first test feedback.', 28),
(15, 'sfsdf\r\n', 28),
(16, 'not interested re\r\n', 32),
(17, 'sdfbn', 29),
(18, 'ds', 32),
(19, 'sd', 29),
(20, 'ds', 28);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=86 ;

--
-- Dumping data for table `lead_info`
--

INSERT INTO `lead_info` (`id`, `email_id`, `name`, `phone`, `date_of_birth`, `date_of_entry`, `faculty_id`, `student_status_id`, `followup_count`, `semester`, `counsellor_id`, `gender`, `next_followup`, `is_old`) VALUES
(28, 'suresh@gmail.com', 'Suresh Shrestha', '1232131231', '1997-01-01', '2016-01-20', 2, 5, 3, 'S', 'ST103', 1, '2016-01-21', 1),
(29, 'malik@gmail.com', 'Malik Waters', '62324234234234', '1991-09-14', '2016-01-20', 3, 5, 2, 'A', 'ST103', 0, '2016-01-22', 1),
(32, 'a@a', 'R', '1', '2016-01-20', '2016-01-20', 4, 6, 2, 'S', 'ST103', 0, '2016-01-21', 1),
(57, 'neeks@gmail.com', 'Nick', '98193948372', '1994-07-27', '2016-01-23', 1, 1, 0, 'S', 'ST105', 1, '2016-01-23', 0),
(58, 'beep@gmail.com', 'Beep', '87686875557', '1994-07-28', '2016-01-21', 2, 1, 0, 'A', 'ST102', 0, '2016-01-28', 1),
(59, 'ajaja@gmail.com', 'Ajaja', '77179802742', '1994-07-29', '2016-01-23', 1, 5, 0, 'S', 'ST105', 0, '2016-01-23', 0),
(60, 'sasa@gmail.com', 'Sasa', '66672729927', '1994-07-30', '2016-01-21', 3, 1, 0, 'A', 'ST102', 1, '2016-01-28', 1),
(61, 'nnsk@gmail.com', 'NNsk', '56165657112', '1994-07-31', '2016-01-21', 1, 1, 0, 'S', 'ST102', 1, '2016-01-28', 1),
(62, 'jfk@gmail.com', 'JFKd', '45658584297', '1994-08-01', '2016-01-21', 4, 1, 0, 'A', 'ST102', 0, '2016-01-28', 1),
(63, 'cooly@gmail.com', 'cooly', '35151511482', '1994-08-02', '2016-01-21', 5, 1, 0, 'S', 'ST104', 0, '2016-01-28', 0),
(64, 'sweety@gmail.com', 'Sweety', '24644438667', '1994-08-03', '2016-01-21', 6, 1, 0, 'A', 'ST104', 1, '2016-01-28', 0),
(65, 'piedpier@gmail.com', 'Piedpier', '14137365852', '1994-08-04', '2016-01-21', 5, 6, 0, 'S', 'ST102', 1, '2016-01-22', 1),
(66, 'hendrix@gmail.com', 'Richar', '3630293037', '1994-08-05', '2016-01-21', 6, 1, 0, 'A', 'ST102', 0, '2016-01-28', 1),
(67, 'simon@gmail.com', 'Simon', '1231231231', '1994-08-06', '2016-01-23', 2, 1, 0, 'S', 'ST105', 0, '2016-01-28', 0),
(68, 'alvin@gmail.com', 'Alvin', '32435345345', '1994-08-07', '2016-01-21', 2, 5, 0, 'A', 'ST105', 1, '2016-01-23', 0),
(81, 'bipalxs@hotmail', 'sushant', '12345', '2016-01-21', '2016-01-22', 1, 1, 0, 'S', 'ST104', 1, '2016-01-29', 0),
(82, 'aa@aa.com', 'A', '123123213', '2016-01-05', '2016-01-22', 1, 5, 0, 'S', 'ST103', 1, '2016-01-29', 1),
(84, 'formsub@gmail.com', 'Form Sub', '1', '2000-12-29', '2016-01-22', 1, 1, 0, 'S', 'ST102', 1, '2016-01-29', 0),
(85, 'nilu@nikeshbahadurpandey.com', 'nilu', '9812049385', '1994-01-02', '2016-01-22', 2, 1, 0, 'S', 'ST104', 0, '2016-01-29', 0);

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
('ST106', '4af5cab77c62eaec5f87b570f2d2b127', 3, 'mona@darling.com'),
('ST107', 'd31d86d0de8dd34fc535c67e480deaa2', 4, 'officer@gmail.com'),
('ST108', 'b28354b543375bfa94dabaeda722927f', 5, 'top@gmail.com');

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
('ST106', 'Mona Lisa', 0, 3),
('ST107', 'Officer', 1, 4),
('ST108', 'Management', 1, 5);

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
