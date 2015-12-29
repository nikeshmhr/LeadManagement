-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2015 at 10:09 AM
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
  `email_id` varchar(255) NOT NULL,
  `no_of_current_leads` int(11) NOT NULL,
  `max_no_of_leads` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  PRIMARY KEY (`email_id`),
  KEY `faculty_id` (`faculty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `counsellor`
--

INSERT INTO `counsellor` (`email_id`, `no_of_current_leads`, `max_no_of_leads`, `faculty_id`) VALUES
('counsellor@gmail.com', 1, 8, 2);

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
  `lead_email_id` varchar(255) NOT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `lead_email_id` (`lead_email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lead_info`
--

CREATE TABLE IF NOT EXISTS `lead_info` (
  `email_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `date_of_entry` date NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `student_status_id` int(4) NOT NULL,
  `followup_count` int(11) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `counsellor_email_id` varchar(255) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  PRIMARY KEY (`email_id`),
  KEY `faculty_id` (`faculty_id`,`student_status_id`),
  KEY `counsellor_email_id` (`counsellor_email_id`),
  KEY `student_status_id` (`student_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lead_info`
--

INSERT INTO `lead_info` (`email_id`, `name`, `phone`, `date_of_birth`, `date_of_entry`, `faculty_id`, `student_status_id`, `followup_count`, `semester`, `counsellor_email_id`, `gender`) VALUES
('nick@gmail.com', 'Nikesh Maharjan', '91349829384', '1995-02-28', '2015-12-29', 1, 1, 0, 'S16', 'counsellor@gmail.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `login_info`
--

CREATE TABLE IF NOT EXISTS `login_info` (
  `email_id` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`email_id`),
  KEY `roles` (`role`),
  KEY `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_info`
--

INSERT INTO `login_info` (`email_id`, `password`, `role`) VALUES
('admin_example@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 1),
('admission@gmail.com', '281edb7c3cf81e3b67aaa09df4e313f5', 4),
('counsellor@gmail.com', '03b8462409f387fad11237e39025e1e3', 2),
('receptionist@gmail.com', '0a9b3767c8b9b69cea129110e8daeda2', 3),
('top@gmail.com', 'd10af457daa1deed54e2c36b5f295e7e', 5);

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
  `email_id` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`email_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_info`
--

INSERT INTO `staff_info` (`email_id`, `name`, `gender`, `role_id`) VALUES
('admin_example@gmail.com', 'Administrator', 1, 1);

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
  ADD CONSTRAINT `counsellor_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `login_info` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `counsellor_ibfk_2` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`lead_email_id`) REFERENCES `lead_info` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lead_info`
--
ALTER TABLE `lead_info`
  ADD CONSTRAINT `lead_info_ibfk_1` FOREIGN KEY (`counsellor_email_id`) REFERENCES `counsellor` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_info_ibfk_2` FOREIGN KEY (`student_status_id`) REFERENCES `student_status` (`student_status_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_info_ibfk_3` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `staff_info_ibfk_2` FOREIGN KEY (`email_id`) REFERENCES `login_info` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
