-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2014 at 04:59 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `university_alumni`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE IF NOT EXISTS `administrator` (
  `person_id` varchar(32) NOT NULL,
  `department` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

CREATE TABLE IF NOT EXISTS `alumni` (
  `person_id` varchar(32) NOT NULL,
  `facebook_id` varchar(100) DEFAULT NULL,
  `linkedin_id` varchar(100) DEFAULT NULL,
  `twitter_id` varchar(100) DEFAULT NULL,
  `sports_played` varchar(200) DEFAULT NULL,
  `college_committees` varchar(200) DEFAULT NULL,
  `alumni_type` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alumni`
--

INSERT INTO `alumni` (`person_id`, `facebook_id`, `linkedin_id`, `twitter_id`, `sports_played`, `college_committees`, `alumni_type`) VALUES
('1', 'trinadh@fb', 'trinadh@linkedin', '', '', '', 'student alumni'),
('2', '', '', '', '', '', 'faculty alumni'),
('3', 'Teja@FB.com', 'teja@linkedin', '', '', '', 'student alumni'),
('4', 'rohan@uncc.edu', 'rohan@linkedin', '', 'Cricket', 'Inramural committe', 'faculty alumni');

-- --------------------------------------------------------

--
-- Table structure for table `alumni_donations`
--

CREATE TABLE IF NOT EXISTS `alumni_donations` (
`donation_id` int(11) NOT NULL,
  `person_id` varchar(32) NOT NULL,
  `donation_type` varchar(50) NOT NULL,
  `donation_towards` varchar(100) NOT NULL,
  `donation_amount` double NOT NULL,
  `donation_made_on` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `alumni_donations`
--

INSERT INTO `alumni_donations` (`donation_id`, `person_id`, `donation_type`, `donation_towards`, `donation_amount`, `donation_made_on`) VALUES
(23, '1', 'dd', 'sports', 100, '2014-12-06'),
(24, '2', 'card', 'internships', 10265, '2014-12-06'),
(25, '1', 'card', 'infrastructure', 150, '2014-12-06'),
(26, '4', 'dd', 'infrastructure', 10560, '2014-12-06'),
(27, '4', 'dd', 'infrastructure', 1025, '2014-12-06'),
(28, '4', 'card', 'sports', 1000, '2014-12-06');

-- --------------------------------------------------------

--
-- Table structure for table `alumni_request`
--

CREATE TABLE IF NOT EXISTS `alumni_request` (
  `date_of_brith` date NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `sid_eid` varchar(32) DEFAULT NULL,
  `grad_year` year(4) DEFAULT NULL,
  `person_id` varchar(32) DEFAULT NULL,
  `major` varchar(32) DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alumni_request`
--

INSERT INTO `alumni_request` (`date_of_brith`, `lastname`, `firstname`, `sid_eid`, `grad_year`, `person_id`, `major`, `status`) VALUES
('1991-08-16', 'Roy', 'Naga Bijesh ', NULL, 2015, NULL, 'CS', 'approved'),
('1992-06-18', 'Bindre', 'Rohan', NULL, 2015, NULL, 'CS', 'approved'),
('1991-04-29', 'Tippareddy', 'Sabari Trinadh Reddy', NULL, 2015, NULL, 'CS', 'approved'),
('1991-12-06', 'Chary', 'Teja', NULL, 2015, NULL, 'DSBA', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `photo_id` int(11) NOT NULL,
  `commented_by` varchar(32) NOT NULL,
  `commented_on` date NOT NULL,
  `comment_description` varchar(500) NOT NULL,
`comment_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`photo_id`, `commented_by`, `commented_on`, `comment_description`, `comment_id`) VALUES
(14, '1', '2014-12-06', 'Good Pic Bijesh !!', 28),
(14, '2', '2014-12-06', 'Thanks Trinadh :)', 29),
(15, '3', '2014-12-06', 'Is it @California ?', 30),
(15, '2', '2014-12-06', 'It was an amazing Trip!!', 31),
(15, '1', '2014-12-06', '@Teja : Yup.. It is !!', 32),
(15, '1', '2014-12-06', '@Bijesh : Most memorable days they were :)', 33),
(17, '4', '2014-12-06', 'A pic @ Arabian Desert !!', 34);

-- --------------------------------------------------------

--
-- Table structure for table `connections`
--

CREATE TABLE IF NOT EXISTS `connections` (
  `connected_to` varchar(32) NOT NULL,
  `connected_by` varchar(32) NOT NULL,
  `connection_date` date NOT NULL,
  `connection_status` varchar(16) NOT NULL,
  `person_id` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `connections`
--

INSERT INTO `connections` (`connected_to`, `connected_by`, `connection_date`, `connection_status`, `person_id`) VALUES
('1', '2', '2014-12-06', 'active', '2'),
('1', '3', '2014-12-06', 'active', '3'),
('2', '3', '2014-12-06', 'active', '3'),
('3', '4', '2014-12-07', 'active', '4');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
`event_id` int(11) NOT NULL,
  `event_date` date NOT NULL,
  `event_location` varchar(200) NOT NULL,
  `event_description` varchar(1000) DEFAULT NULL,
  `event_type` varchar(100) NOT NULL,
  `targetted_audience` varchar(100) DEFAULT NULL,
  `event_start_time` time NOT NULL,
  `event_end_time` time NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `event_created_by` varchar(32) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `event_date`, `event_location`, `event_description`, `event_type`, `targetted_audience`, `event_start_time`, `event_end_time`, `url`, `event_created_by`) VALUES
(1, '2014-12-31', 'Charlotte Down Town', 'New Year Eve with Poor', 'Social Responsibility', 'Poor kids', '07:00:00', '19:00:00', 'WWW.newyear.com', '1'),
(2, '2015-01-14', 'UNCC', 'Festival Celebration', 'Festival Celebration @UNCC', 'students', '10:00:00', '16:00:00', 'www.uncc.edu', '2');

-- --------------------------------------------------------

--
-- Table structure for table `event_member`
--

CREATE TABLE IF NOT EXISTS `event_member` (
  `event_id` int(11) NOT NULL,
  `person_id` varchar(32) NOT NULL,
  `organizer` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE IF NOT EXISTS `faculty` (
  `department` varchar(32) NOT NULL,
  `person_id` varchar(32) NOT NULL,
  `designation` varchar(32) DEFAULT NULL,
  `specialization` varchar(50) NOT NULL,
  `awards` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faculty_alumni`
--

CREATE TABLE IF NOT EXISTS `faculty_alumni` (
  `person_id` varchar(32) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `achievements` varchar(200) DEFAULT NULL,
  `date_of_joining` date NOT NULL,
  `date_of_leaving` date NOT NULL,
  `department` varchar(100) NOT NULL,
  `research_area` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty_alumni`
--

INSERT INTO `faculty_alumni` (`person_id`, `specialization`, `achievements`, `date_of_joining`, `date_of_leaving`, `department`, `research_area`) VALUES
('2', '', 'Top Tutor', '0000-00-00', '0000-00-00', 'CS', 'DB'),
('4', 'Data Science', '', '0000-00-00', '0000-00-00', 'CS', 'Big Data');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE IF NOT EXISTS `gallery` (
`photo_id` int(11) NOT NULL,
  `photo_posted_on` date NOT NULL,
  `photo_posted_by` varchar(32) NOT NULL,
  `photo_description` varchar(500) DEFAULT NULL,
  `photo_url` varchar(200) NOT NULL,
  `person_id` varchar(32) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`photo_id`, `photo_posted_on`, `photo_posted_by`, `photo_description`, `photo_url`, `person_id`) VALUES
(14, '2014-12-06', '2', 'Desert!!', 'uploads/2/Desert.jpg', '2'),
(15, '2014-12-06', '1', 'LightHouse', 'uploads/1/Lighthouse.jpg', '1'),
(16, '2014-12-06', '3', 'Jelly', 'uploads/3/16Jellyfish.jpg', '3'),
(17, '2014-12-06', '4', 'California Desert', 'uploads/4/Desert.jpg', '4');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `person_id` varchar(32) NOT NULL,
  `usertype` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`email`, `password`, `person_id`, `usertype`) VALUES
('', 'trinadh', '1', 'student alumni'),
('', 'bijesh', '2', 'faculty alumni'),
('', 'teja', '3', 'student alumni'),
('', 'rohan', '4', 'faculty alumni'),
('admin@uncc.edu', 'admin', '800800800', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
`message_id` int(11) NOT NULL,
  `sent_on` date NOT NULL,
  `message_subject` varchar(200) NOT NULL,
  `person_id` varchar(32) NOT NULL,
  `sent_to_user` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newsfeed`
--

CREATE TABLE IF NOT EXISTS `newsfeed` (
  `article_id` varchar(32) NOT NULL,
  `article_name` varchar(100) NOT NULL,
  `article_description` varchar(1000) NOT NULL,
  `posted_by` varchar(32) NOT NULL,
  `eid` varchar(32) NOT NULL,
  `category` varchar(50) NOT NULL,
  `posted_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `person_id` varchar(32) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `middlename` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `date_of_birth` date NOT NULL,
  `phone` varchar(15) NOT NULL,
  `apt_number` varchar(50) NOT NULL,
  `street name` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `photo` varchar(500) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_id`, `firstname`, `middlename`, `lastname`, `email`, `gender`, `date_of_birth`, `phone`, `apt_number`, `street name`, `city`, `state`, `zip`, `photo`, `type`) VALUES
('1', 'Sabari Trinadh Reddy', '', 'Tippareddy', 'trinadh@gmail.com', 'Male', '1991-04-29', '9378139229', 'E', '9509 University Terrace Dr', 'Charlotte', 'NC', '28262', 'uploads/1/Chrysanthemum.jpg', 'alumni'),
('2', 'Naga Bijesh ', '', 'Roy', 'bijesh@uncc.edu', 'Male', '1991-08-16', '987654321', 'A', 'University Terrace North', 'Charlotte', 'NC', '28262', 'uploads/2/2014-12-04 00.26.07.jpg', 'alumni'),
('3', 'Teja', '', 'Chary', 'teja@uncc.edu', 'Male', '1991-12-06', '789456123', 'H', 'Concord Road', 'Raleigh', 'NC', '28659', 'uploads/3/Hydrangeas.jpg', 'alumni'),
('4', 'Rohan', '', 'Bindre', 'rohan@uncc.edu', 'Male', '1992-06-18', '987456321', 'Apt#E', 'Colonial Grand', 'Charlotte', 'NC', '28216', 'uploads/4/10295284_10152981214329155_3987670556693733262_o.jpg', 'alumni'),
('800800800', 'Admin', NULL, 'administrator', '', '', '2014-12-17', '', '', '', '', '', '', NULL, 'administrator');

-- --------------------------------------------------------

--
-- Table structure for table `recruitment_event`
--

CREATE TABLE IF NOT EXISTS `recruitment_event` (
  `company_name` varchar(100) NOT NULL,
  `recruitment_date` date NOT NULL,
  `recruited_by` varchar(32) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `search_dept_view`
--
CREATE TABLE IF NOT EXISTS `search_dept_view` (
`firstname` varchar(32)
,`lastname` varchar(32)
,`city` varchar(100)
,`state` varchar(100)
,`department` varchar(100)
,`person_id` varchar(32)
);
-- --------------------------------------------------------

--
-- Table structure for table `sports_event`
--

CREATE TABLE IF NOT EXISTS `sports_event` (
  `guest_name` varchar(32) NOT NULL,
  `sport_name` varchar(32) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_alumni`
--

CREATE TABLE IF NOT EXISTS `student_alumni` (
  `person_id` varchar(32) NOT NULL,
  `grad_year` varchar(10) NOT NULL,
  `major_advisor` varchar(50) NOT NULL,
  `major_dept` varchar(50) NOT NULL,
  `awards` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_alumni`
--

INSERT INTO `student_alumni` (`person_id`, `grad_year`, `major_advisor`, `major_dept`, `awards`) VALUES
('1', '', '', '', ''),
('3', '2015', 'Mahesh', 'DSBA', 'High Performer');

-- --------------------------------------------------------

--
-- Table structure for table `technical_event`
--

CREATE TABLE IF NOT EXISTS `technical_event` (
  `reg_start_date` date NOT NULL,
  `reg_end_date` date NOT NULL,
  `name_of_resource_person` varchar(32) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `work_info`
--

CREATE TABLE IF NOT EXISTS `work_info` (
  `person_id` varchar(32) NOT NULL,
  `company_name` varchar(32) NOT NULL,
  `worked_from` varchar(30) NOT NULL,
  `worked_till` varchar(30) NOT NULL,
  `worked_at` varchar(100) NOT NULL,
  `current_employment` varchar(100) NOT NULL,
  `current_work_location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `search_dept_view`
--
DROP TABLE IF EXISTS `search_dept_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `search_dept_view` AS select `p`.`firstname` AS `firstname`,`p`.`lastname` AS `lastname`,`p`.`city` AS `city`,`p`.`state` AS `state`,`fa`.`department` AS `department`,`p`.`person_id` AS `person_id` from ((`person` `p` join `faculty_alumni` `fa`) join `student_alumni` `sa`) where ((`p`.`type` = 'alumni') and (`fa`.`department` = `sa`.`major_dept`));

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
 ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `alumni`
--
ALTER TABLE `alumni`
 ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `alumni_donations`
--
ALTER TABLE `alumni_donations`
 ADD PRIMARY KEY (`donation_id`), ADD KEY `donuser` (`person_id`);

--
-- Indexes for table `alumni_request`
--
ALTER TABLE `alumni_request`
 ADD PRIMARY KEY (`firstname`,`lastname`), ADD KEY `username` (`person_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`comment_id`), ADD KEY `photo_id` (`photo_id`), ADD KEY `commented_by` (`commented_by`);

--
-- Indexes for table `connections`
--
ALTER TABLE `connections`
 ADD PRIMARY KEY (`connected_to`,`connected_by`), ADD UNIQUE KEY `connected_to` (`connected_to`,`connected_by`), ADD KEY `username` (`person_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
 ADD PRIMARY KEY (`event_id`), ADD KEY `event_created_by` (`event_created_by`);

--
-- Indexes for table `event_member`
--
ALTER TABLE `event_member`
 ADD KEY `event_member_fk1` (`event_id`), ADD KEY `event_member_fk2` (`person_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
 ADD PRIMARY KEY (`person_id`), ADD KEY `username` (`person_id`);

--
-- Indexes for table `faculty_alumni`
--
ALTER TABLE `faculty_alumni`
 ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
 ADD PRIMARY KEY (`photo_id`), ADD KEY `username` (`person_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
 ADD PRIMARY KEY (`person_id`), ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
 ADD PRIMARY KEY (`message_id`), ADD KEY `username` (`person_id`), ADD KEY `sent_to_user` (`sent_to_user`);

--
-- Indexes for table `newsfeed`
--
ALTER TABLE `newsfeed`
 ADD PRIMARY KEY (`article_id`), ADD KEY `posted_by` (`posted_by`), ADD KEY `eid` (`eid`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
 ADD PRIMARY KEY (`person_id`), ADD KEY `person_id` (`person_id`,`firstname`,`lastname`);

--
-- Indexes for table `recruitment_event`
--
ALTER TABLE `recruitment_event`
 ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `sports_event`
--
ALTER TABLE `sports_event`
 ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `student_alumni`
--
ALTER TABLE `student_alumni`
 ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `technical_event`
--
ALTER TABLE `technical_event`
 ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `work_info`
--
ALTER TABLE `work_info`
 ADD PRIMARY KEY (`person_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alumni_donations`
--
ALTER TABLE `alumni_donations`
MODIFY `donation_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrator`
--
ALTER TABLE `administrator`
ADD CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `alumni`
--
ALTER TABLE `alumni`
ADD CONSTRAINT `alumni_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `alumni_donations`
--
ALTER TABLE `alumni_donations`
ADD CONSTRAINT `donuser` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
ADD CONSTRAINT `commented_by` FOREIGN KEY (`commented_by`) REFERENCES `person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`photo_id`) REFERENCES `gallery` (`photo_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `connections`
--
ALTER TABLE `connections`
ADD CONSTRAINT `connections_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`event_created_by`) REFERENCES `person` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `event_member`
--
ALTER TABLE `event_member`
ADD CONSTRAINT `event_member_fk1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`),
ADD CONSTRAINT `event_member_fk2` FOREIGN KEY (`person_id`) REFERENCES `alumni` (`person_id`);

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `faculty_alumni`
--
ALTER TABLE `faculty_alumni`
ADD CONSTRAINT `faculty_alumni_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `alumni` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`sent_to_user`) REFERENCES `person` (`person_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `newsfeed`
--
ALTER TABLE `newsfeed`
ADD CONSTRAINT `newsfeed_ibfk_1` FOREIGN KEY (`posted_by`) REFERENCES `person` (`person_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `newsfeed_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `administrator` (`person_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `person`
--
ALTER TABLE `person`
ADD CONSTRAINT `alumniuser` FOREIGN KEY (`person_id`) REFERENCES `login` (`person_id`);

--
-- Constraints for table `recruitment_event`
--
ALTER TABLE `recruitment_event`
ADD CONSTRAINT `recruitment_event_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sports_event`
--
ALTER TABLE `sports_event`
ADD CONSTRAINT `sports_event_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_alumni`
--
ALTER TABLE `student_alumni`
ADD CONSTRAINT `student_alumni_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `alumni` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `technical_event`
--
ALTER TABLE `technical_event`
ADD CONSTRAINT `technical_event_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `work_info`
--
ALTER TABLE `work_info`
ADD CONSTRAINT `work_info_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `alumni` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
