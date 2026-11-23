/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - barterskill
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`barterskill` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `barterskill`;

/*Table structure for table `barter_proposals` */

DROP TABLE IF EXISTS `barter_proposals`;

CREATE TABLE `barter_proposals` (
  `proposal_id` int(11) NOT NULL AUTO_INCREMENT,
  `requester_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `status` varchar(20) DEFAULT 'PENDING',
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`proposal_id`),
  KEY `requester_id` (`requester_id`),
  KEY `owner_id` (`owner_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `barter_proposals_ibfk_1` FOREIGN KEY (`requester_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `barter_proposals_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `barter_proposals_ibfk_3` FOREIGN KEY (`post_id`) REFERENCES `skill_posts` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `barter_proposals` */

/*Table structure for table `skill_posts` */

DROP TABLE IF EXISTS `skill_posts`;

CREATE TABLE `skill_posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `post_type` enum('OFFER','REQUEST') NOT NULL,
  `status` varchar(20) DEFAULT 'OPEN',
  `experience_years` int(11) DEFAULT 0,
  `portfolio_link` varchar(255) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `urgency_level` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `skill_posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `skill_posts` */

/*Table structure for table `transaksi` */

DROP TABLE IF EXISTS `transaksi`;

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postingan_id` int(11) NOT NULL,
  `peminat_id` int(11) NOT NULL,
  `status` varchar(20) DEFAULT 'PENDING',
  `tanggal` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `postingan_id` (`postingan_id`),
  KEY `peminat_id` (`peminat_id`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`postingan_id`) REFERENCES `skill_posts` (`post_id`) ON DELETE CASCADE,
  CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`peminat_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `transaksi` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `role` varchar(20) DEFAULT 'USER',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/* Data demo (bukan data asli). Password demo: demo123 */
INSERT INTO `users` (`user_id`,`username`,`password`,`full_name`,`role`) VALUES
(1,'nafis','demo123','Nafis Putra','STUDENT'),
(2,'rina','demo123','Rina Aulia','STUDENT'),
(3,'dimas','demo123','Dimas Pratama','STUDENT'),
(4,'salsa','demo123','Salsabila Noor','STUDENT');

INSERT INTO `skill_posts` (`post_id`,`user_id`,`title`,`description`,`post_type`,`status`,`experience_years`,`portfolio_link`,`deadline`,`urgency_level`) VALUES
(1,2,'Jasa Desain Logo & Poster','Membuat logo, poster acara, dan feed Instagram untuk organisasi kampus. Bisa ditukar dengan les pemrograman.','OFFER','OPEN',3,'behance.net/rinaaulia',NULL,NULL),
(2,1,'Les Pemrograman Java Dasar','Mengajar OOP Java dari nol: class, inheritance, interface, sampai koneksi database MySQL.','OFFER','OPEN',2,'github.com/MuhammadNafisPutra',NULL,NULL),
(3,3,'Butuh Editor Video Dokumentasi','Mencari yang bisa mengedit video dokumentasi PKKMB berdurasi 5 menit. Saya bisa bantu fotografi acara.','REQUEST','OPEN',0,NULL,'2025-12-20','High'),
(4,4,'Terjemahan Abstrak ke Bahasa Inggris','Menerjemahkan abstrak laporan atau jurnal ke bahasa Inggris akademik.','OFFER','OPEN',2,'linkedin.com/in/salsabilanoor',NULL,NULL),
(5,2,'Belajar Excel untuk Laporan Keuangan','Ingin belajar pivot table dan rumus dasar untuk laporan bendahara himpunan.','REQUEST','OPEN',0,NULL,'2025-12-28','Medium'),
(6,3,'Fotografi Acara Kampus','Foto dokumentasi seminar, wisuda, dan kegiatan organisasi, lengkap dengan editing warna.','OFFER','OPEN',4,'instagram.com/dimas.frame',NULL,NULL);

INSERT INTO `transaksi` (`id`,`postingan_id`,`peminat_id`,`status`,`tanggal`) VALUES
(1,2,2,'PENDING','2025-12-18'),
(2,6,1,'ACCEPTED','2025-12-15');
