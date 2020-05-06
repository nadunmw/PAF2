-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 05:28 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `healthcare`
--
CREATE DATABASE IF NOT EXISTS `healthcare` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `healthcare`;

-- --------------------------------------------------------

--
-- Table structure for table `abc`
--

CREATE TABLE `abc` (
  `pk` int(10) NOT NULL,
  `id` varchar(10) DEFAULT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `app_doc_id` int(11) NOT NULL,
  `app_patient_id` int(11) NOT NULL,
  `app_session_id` int(11) NOT NULL,
  `app_patient_name` varchar(50) NOT NULL,
  `app_hospital_name` varchar(50) NOT NULL,
  `app_book_date` varchar(20) NOT NULL,
  `app_patient_contact_no` int(10) NOT NULL,
  `app_price` double NOT NULL,
  `app_payment_status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`app_doc_id`, `app_patient_id`, `app_session_id`, `app_patient_name`, `app_hospital_name`, `app_book_date`, `app_patient_contact_no`, `app_price`, `app_payment_status`) VALUES
(10000, 202, 500001, 'nimal a.b.c', 'Colombo hospital,Colombo', '2020-04-09', 770741235, 1500, 'pending'),
(1020, 2065, 500003, 'nimal a.b.c', 'kandy', '2020-04-09', 770741235, 5000, '');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doc_id` int(5) NOT NULL,
  `doc_reg_no` varchar(5) NOT NULL,
  `doc_first_name` varchar(150) NOT NULL,
  `doc_last_name` varchar(150) NOT NULL,
  `doc_address_no` varchar(10) NOT NULL,
  `doc_address_lane1` varchar(100) NOT NULL,
  `doc_address_lane2` varchar(100) NOT NULL,
  `doc_address_lane3` varchar(100) DEFAULT NULL,
  `doc_city` varchar(80) DEFAULT NULL,
  `doc_tp1` varchar(15) NOT NULL,
  `doc_tp2` varchar(15) DEFAULT NULL,
  `doc_tp3` varchar(15) DEFAULT NULL,
  `doc_email` varchar(50) NOT NULL,
  `doc_status_id` int(5) NOT NULL,
  `doc_specification_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doc_id`, `doc_reg_no`, `doc_first_name`, `doc_last_name`, `doc_address_no`, `doc_address_lane1`, `doc_address_lane2`, `doc_address_lane3`, `doc_city`, `doc_tp1`, `doc_tp2`, `doc_tp3`, `doc_email`, `doc_status_id`, `doc_specification_id`) VALUES
(10000, 'D1000', 'Saman', 'Kumara', '214/33', 'Manakndana', 'Madapatha', 'Piliyanadala', 'Piliyanadala', '755784266', '112707676', NULL, 'google@gmail.com', 123, 1),
(10001, 'D2000', 'Akalanka', 'Nayanajith', '214/33', 'Manakndana', 'Madapatha', 'Piliyanadala', 'Piliyanadala', '755784266', '112707676', NULL, 'google@gmail.com', 123, 3),
(10002, 'D3000', 'Nipun', 'Akarshana', '214/33', 'Manakndana', 'Madapatha', 'Piliyanadala', 'Piliyanadala', '755784266', '112707676', NULL, 'google@gmail.com', 123, 4),
(10003, 'D4000', 'kamal', 'amal', '214/33', 'Manakndana', 'Madapatha', 'Piliyanadala', 'Piliyanadala', '755784266', '112707676', NULL, 'google@gmail.com', 123, 1),
(10004, 'D5000', 'Supun', 'dilshan', '214/33', 'Manakndana', 'Madapatha', 'Piliyanadala', 'Piliyanadala', '755784266', '112707676', NULL, 'google@gmail.com', 123, 1),
(10005, 'D6000', 'Supun', 'dilshan', '214/33', 'Manakndana', 'Madapatha', 'Piliyanadala', 'Piliyanadala', '755784266', '112707676', NULL, 'google@gmail.com', 123, 5),
(10007, 'D8000', 'Supun', 'dilshan', '214/33', 'Manakndana', 'Madapatha', 'Piliyanadala', 'Piliyanadala', '755784266', '112707676', NULL, 'google@gmail.com', 123, 5);

-- --------------------------------------------------------

--
-- Table structure for table `doc_hospital`
--

CREATE TABLE `doc_hospital` (
  `doc_id` int(8) NOT NULL,
  `hostpital_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doc_hospital`
--

INSERT INTO `doc_hospital` (`doc_id`, `hostpital_id`) VALUES
(10000, 100),
(10000, 101),
(10002, 100),
(10002, 101),
(10003, 100),
(10003, 101),
(10004, 100),
(10005, 100),
(10007, 100);

-- --------------------------------------------------------

--
-- Table structure for table `doc_session`
--

CREATE TABLE `doc_session` (
  `session_id` int(6) NOT NULL,
  `hostpital_id` int(5) NOT NULL,
  `doc_id` int(5) NOT NULL,
  `available_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `isEveryday` int(1) NOT NULL,
  `isActive` int(1) NOT NULL,
  `patient_limit` int(3) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doc_session`
--

INSERT INTO `doc_session` (`session_id`, `hostpital_id`, `doc_id`, `available_date`, `start_time`, `end_time`, `isEveryday`, `isActive`, `patient_limit`, `price`) VALUES
(500001, 100, 10000, '2020-04-24', '08:00:00', '10:00:00', 0, 1, 30, 1500),
(500003, 101, 10003, '2020-04-18', '08:30:00', '11:30:00', 0, 1, 30, 12500),
(500028, 101, 10003, '2020-04-15', '17:00:00', '21:00:00', 1, 1, 20, 5000),
(500029, 100, 10004, '2020-04-15', '17:00:00', '21:00:00', 1, 1, 20, 5000),
(500030, 100, 10005, '2020-04-15', '17:00:00', '21:00:00', 1, 1, 20, 5000),
(500031, 101, 10002, '2020-04-15', '17:00:00', '21:00:00', 1, 1, 20, 5000),
(500034, 101, 10003, '2020-04-15', '17:00:00', '21:00:00', 0, 1, 20, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `doc_specification`
--

CREATE TABLE `doc_specification` (
  `specification_id` int(5) NOT NULL,
  `specification_name` varchar(255) NOT NULL,
  `specification_dis` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doc_specification`
--

INSERT INTO `doc_specification` (`specification_id`, `specification_name`, `specification_dis`) VALUES
(1, 'Podiatrist', 'Podiatrists are specialists in the feet and the lower limbs. They treat and manage pain and diseases, as well as injuries, to help keep people active and pain free. A lot of common issues are treatable by podiatrists, such as bunions. They can also help with ongoing issues or injuries.'),
(2, 'General Practitioner', 'A general practitioner is trained to provide healthcare to patients of any sex or age. General practitioners often work as primary care physicians (PCPs), see their patients regularly, and are familiar with their medical backgrounds. Most people do (or should) see a PCP at least once a year. When you suspect something else is going on, your first stop is a PCP since they\'re responsible for your overall care and well-being. They can then refer you to the right specialist.'),
(3, 'Pediatrician', 'A pediatrician is a doctor that specializes in childhood medicine, or those under 18. Some pediatricians will see their patients until they are 21. Pediatricians oversee the health and development of babies and children. They administer vaccines. keep track of a child\'s growth, and are the first contact when a child a sick.'),
(4, 'Endocrinologist', 'Endocrinologists specialize in glands and all the hormones they produce. Endocrinologists commonly treat diabetes, thyroid dysfunction, and reproductive health. You may see an endocrinologist for any of the above, and will usually be referred by your PCP if you report symptoms or have related discrepancies in your blood work. Some endocrinologists do focus specifically on one area of the body. For example, a reproductive endocrinologists focuses on the reproductive system, and people often work with these doctors when seeking fertility'),
(5, 'Neurologist', 'A neurologist focuses on the anatomy, functions, and disorders of the nerves and nervous systems. Neurologists work with people who have had strokes and those with degenerative diseases of the nervous system, like multiple sclerosis. If you exhibit loss of motor of cognitive function, you could be referred to a neurologist.'),
(6, 'Rheumatologist', 'A rheumatologist is a specialist in internal medicine of joints, muscles, and bones. Another specialist on our list, an orthopedist, also works with the joints, muscles, and bones, but a rheumatologist is unique because they focus on the origin of the problem, and the body\'s overall movement and health. Orthopedists tend to focus on more acute areas of pain and injury. We\'ll get into more about orthopedists later. One of the main reasons to see a rheumatologist is because of arthritis, but they also work with patients who have tendinitis, lupus, gout, and more, to manage chronic pain.'),
(7, 'Psychiatrist', 'Psychiatrists focus exclusively on mental health. You may see a psychiatrist if you believe you have symptoms of mental illness. People usually seek out psychiatrists themselves, but some PCP\'s now are adding mental health screenings to yearly checkups, and may provide a referral. Psychiatrists can specialize in more than one mental illness, and can also specialize in treating substance abuse. Psychiatrists can informally specialize in specific age groups, though some informally prefer to work with different ages and on different illnesses as they gain experience with patients.'),
(8, 'Nephrologist', 'Nephrology is a specialty that focuses on diseases of the kidneys. Nephrologists deal with failure and serious chronic conditions of the kidneys. If your PCP suspects you have a kidney specific disease, they will refer you to a nephrologist.'),
(9, 'OB/GYN', 'An obstetrician/gynecologist, this title is commonly shortened to OB/GYN. Gynecologists specialize in diseases of the female reproductive organs, and obstetricians specialize in pregnancy and childbirth. Doctors often specialize in both so that they can help patients with a full range of reproductive medicine. Common reasons for visiting an OB/GYN are: you\'re seeking a contraceptive method, are experience irregular period symptoms or pelvic pain, or are seeking prenatal care. It\'s also recommended that patients with female reproductive organs have an exam by the OB/GYN once per year.'),
(10, 'Pulmonologist', 'Pulmonologists focus on the the respiratory organs — the lungs, airway and respiratory muscles. the A PCP will refer you to a pulmonologist if you have a respiratory infection or a chronic issue, like COPD or sleep apnea.'),
(11, 'Surgeon', 'A surgeon\'s primary function is to perform surgery. They analyze a patient\'s health and history, and create a surgical plan that prioritize the patient\'s safety and recovery. They also coordinate other staff that participates in surgery, and work with other physicians post-op.\r\n\r\nYou might see a surgeon for a variety of reasons. Surgeries are typically scheduled in advance, except emergency surgery. Surgeries can be major or minor, and have varying recovering times. Surgeons can specialize in many areas of medicine. Common specializations are cardiac surgeons, orthopedic surgeons, and emergency surgeons.'),
(12, 'Emergency Physician', 'Emergency physicians are trained as physicians, and then go through additional training to master their skills in acute diagnosis in illness and injury. You will see an emergency physician if experiencing a medical emergency and in the emergency room in a hospital. Medical professionals assess a condition in order to determine the immediacy of a medical emergency, and then doctors diagnose, prescribe treatment, and decide whether or not a patient needs to be admitted to the hospital.'),
(13, 'Ophthalmologist', 'An ophthalmologist is a type of eye doctor who is trained and certified to provide eye care and perform oral surgery. You would see an ophthalmologist if your PCP or optometrist suspects you have a more serious eye disease, or might need surgery. Some people choose to see ophthalmologists for annual eye exams as well.'),
(14, 'Oncologist', 'Oncologists are doctors that deal with the prevention, diagnosis, and treatment of cancer. You will see an oncologist if your usual doctor suspects you have cancer. Your oncologist will order tests, confirm, diagnose, and stage your cancer. They will also develop and oversee your treatment plan. Many other people will be involved in a cancer care team, but an oncologist is the leader of that team.'),
(15, 'Urologist', 'A urologist specializes in function and treatment of the urinary system. If your PCP thinks thinks you have symptoms a urinary disease, such as excessive urinating, they will refer you to a urologist. Urologists often work with other doctors to treat illnesses; for example, a urologist may be involved in treating prostate of bladder cancer alongside an oncologist.'),
(16, 'Otolaryngologist', 'Otolaryngologists are often referred to as ENTs, for Ear, Nose, and Throat. ENTs work with diseases of the ear, nose, and throat, hence the nickname. You may see an ENT for infections or for chronic issues like a deviated septum.');

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `hospital_id` int(100) NOT NULL,
  `hospital_name` varchar(225) NOT NULL,
  `hospital_location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`hospital_id`, `hospital_name`, `hospital_location`) VALUES
(100, 'Colombo hospital', 'Colombo'),
(101, 'Asiri Central Hospital', 'Piliyandal');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_users`
--

CREATE TABLE `hospital_users` (
  `host_user_id` int(5) NOT NULL,
  `host_user_name` varchar(100) NOT NULL,
  `hospital_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital_users`
--

INSERT INTO `hospital_users` (`host_user_id`, `host_user_name`, `hospital_id`) VALUES
(30, 'Chamal Lakshitha', 100);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `Token` text NOT NULL,
  `generate_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `log_count` int(225) NOT NULL,
  `ipAddress` varchar(100) NOT NULL,
  `hostname` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `user_id`, `Token`, `generate_date`, `log_count`, `ipAddress`, `hostname`) VALUES
(29, 201, 'xas6Ao31hJqaB0jbHE27UetkN7B/RfKkW4J02x9IXwsEKmATJxA+HyGM+gOaXUQA0OjeKfxBMXbv9U6xRi2vCpKm9aVqkwksSQzomMDyyriQVkEjIqSNnYENWGXhjiuZ', '2020-04-17 15:15:40', 1, '169.254.143.19', 'DESKTOP-087450S/169.254.143.19'),
(30, 202, 'yFo6tU/8HvlVZhknim9WNR7Kr3d2yAYHq8W5XF2KrEfoIwVTQxzESrZw52mvBg/oprF+t8z67SUbZIal7ijkybWA1qlgTeRJjA4hpi/15nV1sEortxAJSvtooqIYctPT', '2020-04-17 18:00:27', 1, '169.254.143.19', 'DESKTOP-087450S/169.254.143.19');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `NIC` varchar(20) NOT NULL,
  `DOB` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `first_name`, `last_name`, `NIC`, `DOB`, `Password`, `time`) VALUES
(215, 'dilshan', 'tharaka', '942563981', '03/2002/24', 'dilshan1234', '2020-04-21 16:20:18'),
(223, 'a', 'a', 'a', 'a', 'a', '2020-05-06 14:31:29'),
(224, 'a', 'a', 'a', 'a', 'a', '2020-05-06 14:37:17'),
(225, 's', 'd', 's', 'a', 'd', '2020-05-06 14:43:23'),
(228, 'a', 'a', 'a', 'a', 'a', '2020-05-06 15:19:25');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `test_id` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `userprofile`
--

CREATE TABLE `userprofile` (
  `user_id` int(5) NOT NULL,
  `username` varchar(225) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userprofile`
--

INSERT INTO `userprofile` (`user_id`, `username`, `user_email`, `user_password`, `user_role`) VALUES
(1, 'nayanajit', 'nayanajit@gmail.com', 'admin', 'patient'),
(202, 'akalanka', 'akalanka@gmail.com', 'admin', 'patient'),
(8080, 'admin', 'admin', 'admin ', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abc`
--
ALTER TABLE `abc`
  ADD PRIMARY KEY (`pk`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`app_patient_id`,`app_session_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doc_id`),
  ADD UNIQUE KEY `reg_no` (`doc_reg_no`),
  ADD KEY `doc_spec_FK` (`doc_specification_id`);

--
-- Indexes for table `doc_hospital`
--
ALTER TABLE `doc_hospital`
  ADD PRIMARY KEY (`doc_id`,`hostpital_id`);

--
-- Indexes for table `doc_session`
--
ALTER TABLE `doc_session`
  ADD PRIMARY KEY (`session_id`),
  ADD UNIQUE KEY `doc_id` (`doc_id`,`available_date`,`start_time`,`end_time`,`isEveryday`),
  ADD KEY `doc_ses_FK` (`doc_id`);

--
-- Indexes for table `doc_specification`
--
ALTER TABLE `doc_specification`
  ADD PRIMARY KEY (`specification_id`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`hospital_id`);

--
-- Indexes for table `hospital_users`
--
ALTER TABLE `hospital_users`
  ADD PRIMARY KEY (`host_user_id`),
  ADD KEY `user_host_fk` (`hospital_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`),
  ADD UNIQUE KEY `Token` (`Token`) USING HASH;

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `userprofile`
--
ALTER TABLE `userprofile`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abc`
--
ALTER TABLE `abc`
  MODIFY `pk` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doc_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10008;

--
-- AUTO_INCREMENT for table `doc_session`
--
ALTER TABLE `doc_session`
  MODIFY `session_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500037;

--
-- AUTO_INCREMENT for table `doc_specification`
--
ALTER TABLE `doc_specification`
  MODIFY `specification_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `hospital_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `hospital_users`
--
ALTER TABLE `hospital_users`
  MODIFY `host_user_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doc_spec_FK` FOREIGN KEY (`doc_specification_id`) REFERENCES `doc_specification` (`specification_id`);

--
-- Constraints for table `doc_hospital`
--
ALTER TABLE `doc_hospital`
  ADD CONSTRAINT `doc_host_FK` FOREIGN KEY (`doc_id`) REFERENCES `doctors` (`doc_id`);

--
-- Constraints for table `doc_session`
--
ALTER TABLE `doc_session`
  ADD CONSTRAINT `doc_ses_FK` FOREIGN KEY (`doc_id`) REFERENCES `doctors` (`doc_id`);

--
-- Constraints for table `hospital_users`
--
ALTER TABLE `hospital_users`
  ADD CONSTRAINT `user_host_fk` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`hospital_id`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"healthcare\",\"table\":\"patients\"},{\"db\":\"healthcare\",\"table\":\"userprofile\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'healthcare', 'patients', '[]', '2020-04-18 18:21:46');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2020-05-06 15:28:08', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
