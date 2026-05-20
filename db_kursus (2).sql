-- MySQL dump 10.13  Distrib 8.0.46, for macos15 (arm64)
--
-- Host: localhost    Database: db_pelajaran
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `instruktur`
--

DROP TABLE IF EXISTS `instruktur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instruktur` (
  `id_instruktur` int NOT NULL AUTO_INCREMENT,
  `nama_instruktur` varchar(100) DEFAULT NULL,
  `bidang_keahlian` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_instruktur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruktur`
--

LOCK TABLES `instruktur` WRITE;
/*!40000 ALTER TABLE `instruktur` DISABLE KEYS */;
INSERT INTO `instruktur` (`id_instruktur`, `nama_instruktur`, `bidang_keahlian`) VALUES (1,'4','Robotic'),(2,'Komang Bayu','Programming'),(3,'Budi','Game');
/*!40000 ALTER TABLE `instruktur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jadwal`
--

DROP TABLE IF EXISTS `jadwal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jadwal` (
  `id_jadwal` int NOT NULL AUTO_INCREMENT,
  `id_kursus` int DEFAULT NULL,
  `id_siswa` int DEFAULT NULL,
  PRIMARY KEY (`id_jadwal`),
  KEY `fk_kursus_jadwal` (`id_kursus`),
  KEY `fk_siswa_jadwal` (`id_siswa`),
  CONSTRAINT `fk_kursus_jadwal` FOREIGN KEY (`id_kursus`) REFERENCES `kursus` (`id_kursus`) ON UPDATE CASCADE,
  CONSTRAINT `fk_siswa_jadwal` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jadwal`
--

LOCK TABLES `jadwal` WRITE;
/*!40000 ALTER TABLE `jadwal` DISABLE KEYS */;
INSERT INTO `jadwal` (`id_jadwal`, `id_kursus`, `id_siswa`) VALUES (1,2,4),(2,3,4),(3,2,5),(4,4,5),(5,4,6);
/*!40000 ALTER TABLE `jadwal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kursus`
--

DROP TABLE IF EXISTS `kursus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kursus` (
  `id_kursus` int NOT NULL AUTO_INCREMENT,
  `nama_kursus` varchar(100) DEFAULT NULL,
  `id_instruktur` int DEFAULT NULL,
  PRIMARY KEY (`id_kursus`),
  KEY `fk_instruktur` (`id_instruktur`),
  CONSTRAINT `fk_instruktur` FOREIGN KEY (`id_instruktur`) REFERENCES `instruktur` (`id_instruktur`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kursus`
--

LOCK TABLES `kursus` WRITE;
/*!40000 ALTER TABLE `kursus` DISABLE KEYS */;
INSERT INTO `kursus` (`id_kursus`, `nama_kursus`, `id_instruktur`) VALUES (2,'Robotic for Beginners',1),(3,'Programming',2),(4,'Game Dev',3);
/*!40000 ALTER TABLE `kursus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siswa`
--

DROP TABLE IF EXISTS `siswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siswa` (
  `id_siswa` int NOT NULL AUTO_INCREMENT,
  `nama_siswa` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id_kursus` int DEFAULT NULL,
  PRIMARY KEY (`id_siswa`),
  KEY `fk_kursus` (`id_kursus`),
  CONSTRAINT `fk_kursus` FOREIGN KEY (`id_kursus`) REFERENCES `kursus` (`id_kursus`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siswa`
--

LOCK TABLES `siswa` WRITE;
/*!40000 ALTER TABLE `siswa` DISABLE KEYS */;
INSERT INTO `siswa` (`id_siswa`, `nama_siswa`, `email`, `id_kursus`) VALUES (4,'Ega','ega@gmail.com',2),(5,'Nimas','nimas@gmail.com',2),(6,'Sheira','sheira@gmail.com',4);
/*!40000 ALTER TABLE `siswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_jadwal`
--

DROP TABLE IF EXISTS `v_jadwal`;
/*!50001 DROP VIEW IF EXISTS `v_jadwal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_jadwal` AS SELECT 
 1 AS `nama_siswa`,
 1 AS `email`,
 1 AS `nama_kursus`,
 1 AS `id_instruktur`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_jadwal`
--

/*!50001 DROP VIEW IF EXISTS `v_jadwal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_jadwal` AS select `b`.`nama_siswa` AS `nama_siswa`,`b`.`email` AS `email`,`c`.`nama_kursus` AS `nama_kursus`,`c`.`id_instruktur` AS `id_instruktur` from ((`jadwal` `a` join `siswa` `b` on((`a`.`id_siswa` = `b`.`id_siswa`))) join `kursus` `c` on((`a`.`id_kursus` = `c`.`id_kursus`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-20 14:10:30
