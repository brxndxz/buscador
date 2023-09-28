CREATE DATABASE  IF NOT EXISTS `lab_bd` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lab_bd`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lab_bd
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'hematological');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hemograms`
--

DROP TABLE IF EXISTS `hemograms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hemograms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hemoglobin` int DEFAULT NULL,
  `hematocric` float DEFAULT NULL,
  `r_blood_cells` int DEFAULT NULL,
  `w_blood_cells` int DEFAULT NULL,
  `category_id` int unsigned NOT NULL,
  `created_at` varchar(45) DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_hemograms_category1_idx` (`category_id`),
  KEY `fk_hemograms_users1_idx` (`user_id`),
  CONSTRAINT `fk_hemograms_category1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_hemograms_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hemograms`
--

LOCK TABLES `hemograms` WRITE;
/*!40000 ALTER TABLE `hemograms` DISABLE KEYS */;
INSERT INTO `hemograms` VALUES (1,11,35,4290000,NULL,1,'2023-09-26 00:57:18','2023-09-26 16:40:30',3),(3,12,39,4290000,NULL,1,'2023-09-26 11:03:58','2023-09-26 11:03:58',5),(4,13,42,4620000,NULL,1,'2023-09-26 17:32:29','2023-09-26 17:32:29',5),(5,13,35,4620000,NULL,1,'2023-09-26 21:07:30','2023-09-26 21:07:30',2);
/*!40000 ALTER TABLE `hemograms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leukocyte_formula`
--

DROP TABLE IF EXISTS `leukocyte_formula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leukocyte_formula` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `w_blood_cells` int DEFAULT NULL,
  `neutrophils` int DEFAULT NULL,
  `lymphocytes` int DEFAULT NULL,
  `monocytes` int DEFAULT NULL,
  `eosinophils` int DEFAULT NULL,
  `basophils` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `category_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_leukocyte_formula_categories1_idx` (`category_id`),
  KEY `fk_leukocyte_formula_users1_idx` (`user_id`),
  CONSTRAINT `fk_leukocyte_formula_categories1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_leukocyte_formula_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leukocyte_formula`
--

LOCK TABLES `leukocyte_formula` WRITE;
/*!40000 ALTER TABLE `leukocyte_formula` DISABLE KEYS */;
/*!40000 ALTER TABLE `leukocyte_formula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'patient');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `age` int DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `role_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_users_roles1_idx` (`role_id`),
  CONSTRAINT `fk_users_roles1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Brenda','H',NULL,'bren@gmail.com','$2b$12$0oUtgaj.z8gu86PiDbYnvu3wRqG4rPOnGzAH1/DPN9VMkQB0hZmRK','2023-09-24 12:38:07','2023-09-24 12:38:07',1),(3,'Luigi','Caramelo',22,'luigi@gmail.com','$2b$12$6VJZ/NKrkYH4QgjsbHJB2O19mN9NQqWijas/cLHy1RgdMX0qc9ZEy','2023-09-24 16:15:28','2023-09-24 16:15:28',2),(4,'Paul','Caramelo',25,'paul@gmail.com','$2b$12$.fw4yDOkbpwFMlKG0IZHE.4zfH41sHZKU/hWHf5sLZPfZS1MuOtay','2023-09-24 18:28:20','2023-09-24 18:28:20',2),(5,'Jessy','Armoa',23,'jessy@gmail.com','$2b$12$eaNF3EkOJF7BN2esYd2otu1iAaxPnp.HUmn7ti3rjYkcTwRxOSuj2','2023-09-26 10:07:40','2023-09-26 10:07:40',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-28 13:45:56
