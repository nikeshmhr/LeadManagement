-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 14, 2016 at 05:09 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 7.0.1

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
  `id` varchar(255) NOT NULL,
  `no_of_current_leads` int(11) NOT NULL,
  `max_no_of_leads` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `counsellor`
--

INSERT INTO `counsellor` (`id`, `no_of_current_leads`, `max_no_of_leads`, `faculty_id`) VALUES
('ST103', 8, 8, 1),
('ST106', 3, 8, 3),
('ST107', 1, 8, 3),
('ST108', 0, 8, 4),
('ST109', 6, 8, 4);

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
(4, 'BBA_Management'),
(5, 'MSC_IT'),
(6, 'Not Applicable');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `feedback_text` text NOT NULL,
  `lead_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lead_info`
--

CREATE TABLE `lead_info` (
  `id` int(11) NOT NULL,
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
  `is_old` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lead_info`
--

INSERT INTO `lead_info` (`id`, `email_id`, `name`, `phone`, `date_of_birth`, `date_of_entry`, `faculty_id`, `student_status_id`, `followup_count`, `semester`, `counsellor_id`, `gender`, `is_old`) VALUES
(4, 'bissp@gmail.com', 'Testtttt', '12345678', '2016-12-31', '2016-01-14', 1, 1, 0, 'S1', 'ST103', 1, 0),
(5, 'cajemy@hotmail.com', 'Ciaran Figueroa', '65', '1981-10-25', '2016-01-14', 3, 1, 0, 'Ex perferendis neque ex est ut omnis', 'ST103', 0, 0),
(6, 'cacalyduq@gmail.com', 'Ivana Gilbert', '89', '1978-03-23', '2016-01-14', 5, 1, 0, '1', 'ST103', 0, 0),
(7, 'hunyhif@hotmail.com', 'Hillary Walls', '21', '1988-10-03', '2016-01-14', 1, 1, 0, '1', 'ST103', 0, 0),
(8, 'necyfilaz@hotmail.com', 'Samantha Dillon', '2', '1996-11-18', '2016-01-14', 1, 1, 0, 'S1', 'ST107', 0, 0),
(9, 'hemypal@gmail.com', 'Phillip Stuart', '98', '2003-07-12', '2016-01-14', 2, 1, 0, '2', 'ST103', 0, 0),
(10, 'rywotewiqe@hotmail.com', 'Calista Richards', '18', '1982-12-21', '2016-01-14', 3, 1, 0, '2', 'ST106', 0, 0),
(11, 'xuhydo@hotmail.com', 'Regan Bryan', '10', '2008-09-14', '2016-01-14', 5, 1, 0, '2', 'ST109', 1, 0),
(12, 'muhifugo@hotmail.com', 'Ferris Harvey', '50', '2014-06-26', '2016-01-14', 1, 1, 0, '2', 'ST109', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `login_info`
--

CREATE TABLE `login_info` (
  `id` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` int(11) NOT NULL,
  `email_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_info`
--

INSERT INTO `login_info` (`id`, `password`, `role`, `email_id`) VALUES
('ST101', '2edd8267a9481a190cf116bef013336f', 1, 'admin@gmail.com'),
('ST102', 'd93bea4c204c506cd3825c16020d3f10', 3, 'bip@gmail.com'),
('ST103', '1158f5f8d240a731d28068742adea0fd', 2, 'sus@gmail.com'),
('ST104', '24419964c7563ed4c4ee267859a2462b', 4, 'aj@gmail.com'),
('ST105', '7ce03b7eac3957eb8ea7b77fc6b7529a', 5, 'some@gmail.com'),
('ST106', 'fc2f463ec5f5becc14e81701a22f2710', 2, 'foluxynu@hotmail.com'),
('ST107', '9d37dc3cd857929f87db572de54f0554', 2, 'cydyni@yahoo.com'),
('ST108', '6cb735f992c7f6a06182442c74cce67f', 2, 'xodu@yahoo.com'),
('ST109', 'd0e7d0221ef4e0f98dc9aaf3300b99e5', 2, 'xebu@yahoo.com');

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
(3, 'Receptionist'),
(5, 'Top Management');

-- --------------------------------------------------------

--
-- Table structure for table `sample`
--

CREATE TABLE `sample` (
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

CREATE TABLE `staff_info` (
  `id` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_info`
--

INSERT INTO `staff_info` (`id`, `name`, `gender`, `role_id`) VALUES
('ST101', 'Nikesh Maharjan', 1, 1),
('ST102', 'Bipal Woman Shakya', 0, 3),
('ST103', 'Chushant Maharjan', 1, 2),
('ST104', 'Ajeeja Limbhu', 1, 4),
('ST105', 'Someone', 1, 5),
('ST106', 'Cheryl Odom', 0, 2),
('ST107', 'Murphy Barr', 0, 2),
('ST108', 'McKenzie Warren', 1, 2),
('ST109', 'Serina Franks', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `student_status`
--

CREATE TABLE `student_status` (
  `student_status_id` int(4) NOT NULL,
  `student_status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `faculty_id` (`faculty_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

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
  ADD KEY `lead_email_id` (`lead_id`),
  ADD KEY `lead_id` (`lead_id`),
  ADD KEY `lead_id_2` (`lead_id`);

--
-- Indexes for table `lead_info`
--
ALTER TABLE `lead_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_id` (`email_id`),
  ADD KEY `faculty_id` (`faculty_id`,`student_status_id`),
  ADD KEY `counsellor_email_id` (`counsellor_id`),
  ADD KEY `student_status_id` (`student_status_id`),
  ADD KEY `counsellor_id` (`counsellor_id`);

--
-- Indexes for table `login_info`
--
ALTER TABLE `login_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_id` (`email_id`),
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `id` (`id`);

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
-- AUTO_INCREMENT for table `lead_info`
--
ALTER TABLE `lead_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `student_status`
--
ALTER TABLE `student_status`
  MODIFY `student_status_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
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
