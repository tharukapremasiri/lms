-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2024 at 02:43 PM
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
-- Database: `gis_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminID` varchar(100) NOT NULL,
  `adminNo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`, `adminNo`) VALUES
('a1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `assignmentID` int(11) NOT NULL,
  `materialID` int(11) NOT NULL,
  `studentID` varchar(100) NOT NULL,
  `assignmentName` text NOT NULL,
  `assignmentSize` float NOT NULL,
  `assignmentType` varchar(50) NOT NULL,
  `uploadDate` datetime NOT NULL DEFAULT current_timestamp(),
  `marks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`assignmentID`, `materialID`, `studentID`, `assignmentName`, `assignmentSize`, `assignmentType`, `uploadDate`, `marks`) VALUES
(1, 7, 's1', 'aasa.pdf', 67168, 'application/pdf', '2024-07-21 13:24:22', 50),
(6, 7, 's2', 'aa112sa3ed3.docx', 84569, 'application/vnd.openxmlformats-officedocument.word', '2024-07-21 13:54:26', 33),
(7, 10, 's3', 'asaedwe.docx', 13557, 'application/vnd.openxmlformats-officedocument.word', '2024-07-21 17:52:01', 12);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL,
  `categoryName` char(50) NOT NULL,
  `grade` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `categoryName`, `grade`) VALUES
(1, 'Excellent', 'A'),
(2, 'Good', 'B'),
(3, 'Average', 'C'),
(4, 'Bad', 'F');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `classID` int(11) NOT NULL,
  `gradeID` int(11) DEFAULT NULL,
  `teacherID` varchar(100) DEFAULT NULL,
  `className` varchar(50) NOT NULL,
  `noOfStudents` int(11) NOT NULL,
  `calendarYear` year(4) NOT NULL,
  `status` char(50) NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`classID`, `gradeID`, `teacherID`, `className`, `noOfStudents`, `calendarYear`, `status`) VALUES
(1, 1, 't1', '5-A', 10, '2024', 'Active'),
(2, 1, 't2', '5-C', 11, '2024', 'Active'),
(5, NULL, NULL, '10-B', 0, '2024', 'Active'),
(6, 7, 't3', '1-A', 0, '2024', 'Active'),
(7, 1, 't4', '5-F', 0, '2024', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `gradeID` int(11) NOT NULL,
  `grade` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`gradeID`, `grade`) VALUES
(1, '5'),
(2, '4'),
(7, '1');

-- --------------------------------------------------------

--
-- Table structure for table `grade_subject`
--

CREATE TABLE `grade_subject` (
  `gradeID` int(11) NOT NULL,
  `subjectID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grade_subject`
--

INSERT INTO `grade_subject` (`gradeID`, `subjectID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(7, 1),
(7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `material_category`
--

CREATE TABLE `material_category` (
  `materialID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `material_category`
--

INSERT INTO `material_category` (`materialID`, `categoryID`) VALUES
(6, 1),
(7, 2),
(7, 3),
(8, 1),
(9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `parentID` varchar(255) NOT NULL,
  `parentNo` int(11) DEFAULT NULL,
  `contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`parentID`, `parentNo`, `contact`) VALUES
('p1', 1, '0776542211'),
('p2', 2, '0776542211'),
('p3', 3, '0773212211'),
('p4', 4, '0776532211'),
('p5', 5, '0776542211');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentID` varchar(100) NOT NULL,
  `classID` int(11) DEFAULT NULL,
  `gradeID` int(11) NOT NULL,
  `parentID` varchar(100) DEFAULT NULL,
  `studentNo` int(11) NOT NULL,
  `address` text DEFAULT NULL,
  `addedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentID`, `classID`, `gradeID`, `parentID`, `studentNo`, `address`, `addedDate`) VALUES
('s1', 1, 1, 'p1', 1, 'Ja-ela', '2024-06-18 12:58:31'),
('s2', 1, 1, 'p2', 2, 'Mawanella', '2024-06-18 14:22:03'),
('s3', 1, 1, 'p3', 3, 'Colombo', '2024-06-18 22:25:11'),
('s4', 5, 4, 'p4', 4, 'Negombo', '2024-06-23 18:52:58'),
('s5', 6, 7, 'p5', 5, 'Ja ela', '2024-07-21 11:01:23');

-- --------------------------------------------------------

--
-- Table structure for table `student_category`
--

CREATE TABLE `student_category` (
  `studentID` varchar(100) NOT NULL,
  `subjectID` int(11) NOT NULL,
  `categoryID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_category`
--

INSERT INTO `student_category` (`studentID`, `subjectID`, `categoryID`) VALUES
('s1', 2, 1),
('s4', 2, 1),
('s4', 5, 1),
('s1', 1, 2),
('s1', 3, 2),
('s3', 1, 2),
('s3', 2, 2),
('s3', 3, 2),
('s4', 3, 2),
('s2', 1, 3),
('s2', 2, 3),
('s4', 1, 3),
('s2', 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `student_test_marks`
--

CREATE TABLE `student_test_marks` (
  `studentID` varchar(100) NOT NULL,
  `subjectID` int(11) NOT NULL,
  `testID` int(11) NOT NULL,
  `marks` int(11) NOT NULL,
  `grade` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_test_marks`
--

INSERT INTO `student_test_marks` (`studentID`, `subjectID`, `testID`, `marks`, `grade`) VALUES
('s1', 1, 7, 90, 'A'),
('s1', 1, 9, 67, 'B'),
('s1', 2, 7, 90, 'A'),
('s1', 2, 9, 90, 'A'),
('s1', 3, 7, 90, 'A'),
('s1', 3, 9, 73, 'B'),
('s2', 1, 7, 85, 'A'),
('s2', 1, 9, 54, 'C'),
('s2', 2, 7, 76, 'B'),
('s2', 2, 9, 55, 'C'),
('s2', 3, 7, 63, 'B'),
('s2', 3, 9, 21, 'F'),
('s3', 1, 7, 77, 'B'),
('s3', 2, 7, 65, 'B'),
('s3', 3, 7, 77, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `study_material`
--

CREATE TABLE `study_material` (
  `materialID` int(11) NOT NULL,
  `classID` int(11) DEFAULT NULL,
  `studentID` varchar(100) DEFAULT NULL,
  `topicID` int(11) NOT NULL,
  `teacherID` varchar(100) NOT NULL,
  `materialName` text NOT NULL,
  `materialSize` float DEFAULT NULL,
  `materialType` varchar(50) DEFAULT NULL,
  `uploadDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `study_material`
--

INSERT INTO `study_material` (`materialID`, `classID`, `studentID`, `topicID`, `teacherID`, `materialName`, `materialSize`, `materialType`, `uploadDate`) VALUES
(6, 1, NULL, 6, 't1', 'database_design_and_development_13.pdf.pdf', 1738600, 'applicatio', '2024-06-18 11:28:15'),
(7, 1, NULL, 7, 't1', 'Steps to create relational database (1).docx', 84569, 'applicatio', '2024-06-18 11:29:40'),
(8, 1, NULL, 8, 't1', 'plan.pdf', 107500, 'applicatio', '2024-06-18 11:36:03'),
(9, 2, NULL, 9, 't1', 'Intern - PHP Backend Assesmet.pdf', 163951, 'application/pdf', '2024-06-24 08:17:40'),
(10, 1, 's3', 10, 't1', 'Interview Questions.docx', 13557, 'application/vnd.openxmlformats-officedocument.word', '2024-06-24 08:19:37');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subjectID` int(11) NOT NULL,
  `subjectName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subjectID`, `subjectName`) VALUES
(1, 'Maths'),
(2, 'Science'),
(3, 'English'),
(5, 'Sinhala');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacherID` varchar(100) NOT NULL,
  `teacherNo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacherID`, `teacherNo`) VALUES
('t1', 1),
('t2', 2),
('t3', 3),
('t4', 4);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_subject`
--

CREATE TABLE `teacher_subject` (
  `subjectID` int(11) NOT NULL,
  `classID` int(11) NOT NULL,
  `teacherID` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher_subject`
--

INSERT INTO `teacher_subject` (`subjectID`, `classID`, `teacherID`) VALUES
(1, 1, 't1'),
(1, 2, 't1');

-- --------------------------------------------------------

--
-- Table structure for table `term_test`
--

CREATE TABLE `term_test` (
  `testID` int(11) NOT NULL,
  `gradeID` int(11) NOT NULL,
  `term` int(11) NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `term_test`
--

INSERT INTO `term_test` (`testID`, `gradeID`, `term`, `year`) VALUES
(7, 1, 1, '2024'),
(8, 2, 1, '2024'),
(9, 1, 2, '2024'),
(11, 7, 1, '2024');

-- --------------------------------------------------------

--
-- Table structure for table `test_subject`
--

CREATE TABLE `test_subject` (
  `testID` int(11) NOT NULL,
  `subjectID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test_subject`
--

INSERT INTO `test_subject` (`testID`, `subjectID`) VALUES
(7, 1),
(7, 2),
(7, 3),
(8, 3),
(9, 1),
(9, 2),
(9, 3);

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `topicID` int(11) NOT NULL,
  `unitID` int(11) NOT NULL,
  `topicName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`topicID`, `unitID`, `topicName`) VALUES
(6, 6, 'Quadratic Equations'),
(7, 7, 'Quadratic Equations'),
(8, 8, 'Shapes'),
(9, 9, 'Operators'),
(10, 10, 'Boolean');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `unitID` int(11) NOT NULL,
  `subjectID` int(11) NOT NULL,
  `unitName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`unitID`, `subjectID`, `unitName`) VALUES
(6, 1, 'Algebra'),
(7, 1, 'Algebra'),
(8, 1, 'Geomety'),
(9, 1, 'Boolean Algebra'),
(10, 1, 'Boolean Algebra');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` varchar(100) NOT NULL,
  `fName` char(100) NOT NULL,
  `lName` char(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `role` char(50) NOT NULL DEFAULT 'Student',
  `imageurl` text DEFAULT NULL,
  `status` char(50) NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `fName`, `lName`, `email`, `password`, `role`, `imageurl`, `status`) VALUES
('a1', 'Amal', 'Admin', 'admin@gmail.com', '123', 'Admin', NULL, 'Active'),
('p1', 'Nimali', 'Perera', 'nimali@gmail.com', '123', 'Parent', NULL, 'Active'),
('p2', 'Ajith', 'Premasiri', 'ajith@gmail.com', 'dIio04dd', 'Parent', NULL, 'Active'),
('p3', 'Sarath', 'Mendis', 'sarath@gmail.com', 'Ayd1HQvl', 'Parent', NULL, 'Active'),
('p4', 'Ravi', 'Fernando', 'ravi@gmail.com', 'g8zML45n', 'Parent', NULL, 'Active'),
('p5', 'Nishekala', 'Rajapaksha', 'nish@gmail.com', '4CWONIeX', 'Parent', NULL, 'Active'),
('s1', 'Ashane', 'Lakshitha', 'ashane@gmail.com', '123', 'Student', NULL, 'Active'),
('s2', 'Tharuka', 'Premasiri', 'tharuka@gmail.com', 'hfhnCJjw', 'Student', 'IMG-66714ab3a749e0.96715590.jpg', 'Active'),
('s3', 'Kusal', 'Mendis', 'kusal@gmail.com', 'hmzTijL3', 'Student', 'IMG-6671bbef46bae7.34001279.jpg', 'Active'),
('s4', 'Anuhas', 'Fernando', 'anuhas@gmail.com', 'xtFm2iaa', 'Student', 'IMG-667821b2d65e13.44378129.jpg', 'Active'),
('s5', 'Samanthabadra', 'Perera', 'samanthabadra@gmail.com', 'RSKkflSf', 'Student', 'IMG-669c9d2b2c9ba1.77342143.jpg', 'Active'),
('t1', 'Chandima', 'Perera', 'chandimaperera@gmail.com', '123', 'Teacher', 'IMG-6678d5e40b1b19.17140459.jpg', 'Active'),
('t2', 'Mrunal', 'Thakur', 'mrunal@gmail.com', '123', 'Teacher', 'IMG-6676fff7c4d7e7.53060651.jpg', 'Active'),
('t3', 'Michelle', 'Perera', 'michelle@gmail.com', '123', 'Teacher', 'IMG-66770c63aa38e3.12747727.jpg', 'Active'),
('t4', 'Samadhi', 'Peiris', 'samadhi@gmail.com', '4NtxuwVj', 'Teacher', 'IMG-6679af6eb47a31.26357012.jpg', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminID`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`assignmentID`),
  ADD KEY `fk_matID` (`materialID`),
  ADD KEY `fk_stuID` (`studentID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`classID`),
  ADD KEY `fk_gradeID` (`gradeID`),
  ADD KEY `fk_userID2` (`teacherID`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`gradeID`);

--
-- Indexes for table `grade_subject`
--
ALTER TABLE `grade_subject`
  ADD PRIMARY KEY (`gradeID`,`subjectID`),
  ADD KEY `fk_su2` (`subjectID`);

--
-- Indexes for table `material_category`
--
ALTER TABLE `material_category`
  ADD PRIMARY KEY (`materialID`,`categoryID`),
  ADD KEY `fk_materialID` (`categoryID`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`parentID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentID`),
  ADD KEY `fk_userID5` (`parentID`),
  ADD KEY `fk_classID` (`classID`);

--
-- Indexes for table `student_category`
--
ALTER TABLE `student_category`
  ADD PRIMARY KEY (`studentID`,`subjectID`),
  ADD KEY `fk_subjectID` (`subjectID`),
  ADD KEY `fk_categoryID` (`categoryID`);

--
-- Indexes for table `student_test_marks`
--
ALTER TABLE `student_test_marks`
  ADD PRIMARY KEY (`studentID`,`subjectID`,`testID`),
  ADD KEY `fk_su` (`subjectID`),
  ADD KEY `fk_te` (`testID`);

--
-- Indexes for table `study_material`
--
ALTER TABLE `study_material`
  ADD PRIMARY KEY (`materialID`),
  ADD KEY `fk_studentID3` (`studentID`),
  ADD KEY `fk_teacherID` (`teacherID`),
  ADD KEY `fk_classID2` (`classID`),
  ADD KEY `fk_topicID` (`topicID`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subjectID`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacherID`);

--
-- Indexes for table `teacher_subject`
--
ALTER TABLE `teacher_subject`
  ADD PRIMARY KEY (`subjectID`,`classID`),
  ADD KEY `fk_teacherID3` (`teacherID`),
  ADD KEY `fk_subjectID6` (`classID`);

--
-- Indexes for table `term_test`
--
ALTER TABLE `term_test`
  ADD PRIMARY KEY (`testID`),
  ADD KEY `fk_gradeID4` (`gradeID`);

--
-- Indexes for table `test_subject`
--
ALTER TABLE `test_subject`
  ADD PRIMARY KEY (`testID`,`subjectID`),
  ADD KEY `fk_subjectID7` (`subjectID`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`topicID`),
  ADD KEY `fk_unitID` (`unitID`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`unitID`),
  ADD KEY `fk_subjectID5` (`subjectID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `assignmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `classID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `gradeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `study_material`
--
ALTER TABLE `study_material`
  MODIFY `materialID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `term_test`
--
ALTER TABLE `term_test`
  MODIFY `testID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `topicID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `unitID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_userID` FOREIGN KEY (`adminID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `fk_matID` FOREIGN KEY (`materialID`) REFERENCES `study_material` (`materialID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_stuID` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `fk_gradeID` FOREIGN KEY (`gradeID`) REFERENCES `grade` (`gradeID`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_userID2` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `grade_subject`
--
ALTER TABLE `grade_subject`
  ADD CONSTRAINT `fk_gr` FOREIGN KEY (`gradeID`) REFERENCES `grade` (`gradeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_su2` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `material_category`
--
ALTER TABLE `material_category`
  ADD CONSTRAINT `fk_categoryID6` FOREIGN KEY (`materialID`) REFERENCES `study_material` (`materialID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_materialID` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `parent`
--
ALTER TABLE `parent`
  ADD CONSTRAINT `fk_userID3` FOREIGN KEY (`parentID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_classID` FOREIGN KEY (`classID`) REFERENCES `class` (`classID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_userID4` FOREIGN KEY (`studentID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_userID5` FOREIGN KEY (`parentID`) REFERENCES `parent` (`parentID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_category`
--
ALTER TABLE `student_category`
  ADD CONSTRAINT `fk_categoryID` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_studentID` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_subjectID` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_test_marks`
--
ALTER TABLE `student_test_marks`
  ADD CONSTRAINT `fk_st` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_su` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_te` FOREIGN KEY (`testID`) REFERENCES `term_test` (`testID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `study_material`
--
ALTER TABLE `study_material`
  ADD CONSTRAINT `fk_classID2` FOREIGN KEY (`classID`) REFERENCES `class` (`classID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_studentID3` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_teacherID` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_topicID` FOREIGN KEY (`topicID`) REFERENCES `topic` (`topicID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `fk_userID6` FOREIGN KEY (`teacherID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacher_subject`
--
ALTER TABLE `teacher_subject`
  ADD CONSTRAINT `fk_classID4` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_subjectID6` FOREIGN KEY (`classID`) REFERENCES `class` (`classID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_teacherID3` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `term_test`
--
ALTER TABLE `term_test`
  ADD CONSTRAINT `fk_gradeID4` FOREIGN KEY (`gradeID`) REFERENCES `grade` (`gradeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `test_subject`
--
ALTER TABLE `test_subject`
  ADD CONSTRAINT `fk_subjectID7` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_testID7` FOREIGN KEY (`testID`) REFERENCES `term_test` (`testID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `topic`
--
ALTER TABLE `topic`
  ADD CONSTRAINT `fk_unitID` FOREIGN KEY (`unitID`) REFERENCES `unit` (`unitID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `fk_subjectID5` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
