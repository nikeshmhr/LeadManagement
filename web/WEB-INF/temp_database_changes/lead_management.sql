-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Dec 26, 2015 at 07:28 AM
-- Server version: 5.5.42
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lead_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `counsellor`
--

CREATE TABLE `counsellor` (
  `email_id` varchar(255) NOT NULL,
  `no_of_current_leads` int(11) NOT NULL,
  `max_no_of_leads` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` int(11) NOT NULL,
  `facutly_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `facutly_name`) VALUES
(1, 'Computing'),
(2, 'Networking'),
(3, 'Multimedia'),
(4, 'bba_management'),
(5, 'msc_it'),
(6, 'not_applicable');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `feedback_text` text NOT NULL,
  `lead_email_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lead_info`
--

CREATE TABLE `lead_info` (
  `email_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `date_of_entry` date NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `student_status_id` int(4) NOT NULL,
  `followup_count` int(11) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `counsellor_email_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login_info`
--

CREATE TABLE `login_info` (
  `email_id` varchar(255) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_info`
--

INSERT INTO `login_info` (`email_id`, `username`, `password`, `role`) VALUES
('admin_example@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'Administrator'),
(4, 'Admission Officer'),
(2, 'Counsellor'),
(5, 'Management'),
(3, 'Receptionist');

-- --------------------------------------------------------

--
-- Table structure for table `staff_info`
--

CREATE TABLE `staff_info` (
  `email_id` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_status`
--

CREATE TABLE `student_status` (
  `student_status_id` int(4) NOT NULL,
  `student_status` varchar(25) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

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
-- Indexes for dumped tables
--

--
-- Indexes for table `counsellor`
--
ALTER TABLE `counsellor`
  ADD PRIMARY KEY (`email_id`),
  ADD KEY `faculty_id` (`faculty_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `lead_email_id` (`lead_email_id`);

--
-- Indexes for table `lead_info`
--
ALTER TABLE `lead_info`
  ADD PRIMARY KEY (`email_id`),
  ADD KEY `faculty_id` (`faculty_id`,`student_status_id`),
  ADD KEY `counsellor_email_id` (`counsellor_email_id`),
  ADD KEY `student_status_id` (`student_status_id`);

--
-- Indexes for table `login_info`
--
ALTER TABLE `login_info`
  ADD PRIMARY KEY (`email_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `roles` (`role`),
  ADD KEY `role` (`role`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `staff_info`
--
ALTER TABLE `staff_info`
  ADD PRIMARY KEY (`email_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `student_status`
--
ALTER TABLE `student_status`
  ADD PRIMARY KEY (`student_status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_status`
--
ALTER TABLE `student_status`
  MODIFY `student_status_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
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
