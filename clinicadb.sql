-- MySQL dump 10.13  Distrib 8.0.45, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: clinicabd
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `Consulta`
--

DROP TABLE IF EXISTS `Consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Consulta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_hora` datetime NOT NULL,
  `estado` varchar(20) DEFAULT NULL CHECK (`estado` in ('Agendada','Realizada','Cancelada')),
  `id_paciente` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `id_servico` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_medico` (`id_medico`),
  KEY `id_servico` (`id_servico`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `Paciente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `Medico` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `consulta_ibfk_3` FOREIGN KEY (`id_servico`) REFERENCES `Servico` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Consulta`
--

LOCK TABLES `Consulta` WRITE;
/*!40000 ALTER TABLE `Consulta` DISABLE KEYS */;
INSERT INTO `Consulta` VALUES (1,'2026-06-01 10:00:00','Agendada',1,1,1),(2,'2026-06-01 11:30:00','Agendada',2,2,1),(3,'2026-05-18 15:00:00','Realizada',3,3,2),(4,'2026-05-19 09:00:00','Cancelada',4,4,3),(5,'2026-06-02 14:00:00','Agendada',5,5,5),(6,'2026-06-02 16:15:00','Agendada',6,6,7),(7,'2026-05-15 11:00:00','Realizada',7,7,4),(8,'2026-05-16 10:30:00','Realizada',8,8,15),(9,'2026-06-03 09:30:00','Agendada',9,9,7),(10,'2026-06-03 15:00:00','Agendada',10,10,1),(11,'2026-05-14 17:00:00','Realizada',11,11,11),(12,'2026-05-12 14:30:00','Cancelada',12,12,7),(13,'2026-06-04 11:00:00','Agendada',13,13,17),(14,'2026-06-04 12:00:00','Agendada',14,14,16),(15,'2026-05-10 09:00:00','Realizada',15,15,6),(16,'2026-05-11 16:00:00','Realizada',16,16,4),(17,'2026-06-05 10:00:00','Agendada',17,17,12),(18,'2026-06-05 14:30:00','Agendada',18,18,7),(19,'2026-05-08 11:15:00','Cancelada',19,19,3),(20,'2026-05-09 15:30:00','Realizada',20,20,1),(21,'2026-06-08 09:00:00','Agendada',21,21,19),(22,'2026-06-08 10:30:00','Agendada',22,22,21),(23,'2026-05-07 14:00:00','Realizada',23,23,7),(24,'2026-05-06 16:45:00','Realizada',24,24,24),(25,'2026-06-09 11:30:00','Agendada',25,25,1),(26,'2026-06-09 15:15:00','Agendada',26,26,9),(27,'2026-05-05 10:00:00','Cancelada',27,27,27),(28,'2026-05-04 11:00:00','Realizada',28,28,23),(29,'2026-06-10 14:00:00','Agendada',29,29,28),(30,'2026-06-10 16:30:00','Agendada',30,30,30);
/*!40000 ALTER TABLE `Consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Especialidade`
--

DROP TABLE IF EXISTS `Especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Especialidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Especialidade`
--

LOCK TABLES `Especialidade` WRITE;
/*!40000 ALTER TABLE `Especialidade` DISABLE KEYS */;
INSERT INTO `Especialidade` VALUES (1,'Clinica Geral'),(2,'Pediatria'),(3,'Cardiologia'),(4,'Dermatologia'),(5,'Ortopedia'),(6,'Ginecologia'),(7,'Neurologia'),(8,'Psiquiatria'),(9,'Oftalmologia'),(10,'Otorrinolaringologia'),(11,'Urologia'),(12,'Endocrinologia'),(13,'Gastroenterologia'),(14,'Pneumologia'),(15,'Nefrologia'),(16,'Hematologia'),(17,'Oncologia'),(18,'Reumatologia'),(19,'Infecciologia'),(20,'Medicina Interna'),(21,'Cirurgia Geral'),(22,'Cirurgia Plastica'),(23,'Cirurgia Vascular'),(24,'Medicina Desportiva'),(25,'Medicina do Trabalho'),(26,'Anestesiologia'),(27,'Radiologia'),(28,'Fisiatria'),(29,'Geriatria'),(30,'Alergologia');
/*!40000 ALTER TABLE `Especialidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medico`
--

DROP TABLE IF EXISTS `Medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Medico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `id_especialidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`),
  KEY `id_especialidade` (`id_especialidade`),
  CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`id_especialidade`) REFERENCES `Especialidade` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medico`
--

LOCK TABLES `Medico` WRITE;
/*!40000 ALTER TABLE `Medico` DISABLE KEYS */;
INSERT INTO `Medico` VALUES (1,'Dr. Carlos Silva','M10001',1),(2,'Dra. Ana Santos','M10002',2),(3,'Dr. Rui Oliveira','M10003',3),(4,'Dra. Marta Costa','M10004',4),(5,'Dr. Pedro Pinto','M10005',5),(6,'Dra. Sofia Martins','M10006',6),(7,'Dr. Joao Pereira','M10007',7),(8,'Dra. Catarina Rodrigues','M10008',8),(9,'Dr. Miguel Almeida','M10009',9),(10,'Dra. Ines Carvalho','M10010',10),(11,'Dr. Tiago Ferreira','M10011',11),(12,'Dra. Beatria Ribeiro','M10012',12),(13,'Dr. Goncalo Sousa','M10013',13),(14,'Dra. Matilde Gomes','M10014',14),(15,'Dr. Afonso Lopes','M10015',15),(16,'Dra. Mariana Marques','M10016',16),(17,'Dr. Ricardo Soares','M10017',17),(18,'Dra. Leonor Fernandes','M10018',18),(19,'Dr. Bruno Teixeira','M10019',19),(20,'Dra. Joana Coimbra','M10020',20),(21,'Dr. Hugo Mendes','M10021',21),(22,'Dra. Francisca Antunes','M10022',22),(23,'Dr. Diogo Ramos','M10023',23),(24,'Dra. Rita Simoes','M10024',24),(25,'Dr. Nuno Fonseca','M10025',25),(26,'Dra. Barbara Cruz','M10026',26),(27,'Dr. Andre Rocha','M10027',27),(28,'Dra. Diana Castro','M10028',28),(29,'Dr. Manuel Neves','M10029',29),(30,'Dra. Sara Borges','M10030',30);
/*!40000 ALTER TABLE `Medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paciente`
--

DROP TABLE IF EXISTS `Paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Paciente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `nascimento` date NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `cc` varchar(20) NOT NULL,
  `num_saude` varchar(20) NOT NULL,
  `seguro` varchar(50) DEFAULT NULL,
  `telefone_extra` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc` (`cc`),
  UNIQUE KEY `num_saude` (`num_saude`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paciente`
--

LOCK TABLES `Paciente` WRITE;
/*!40000 ALTER TABLE `Paciente` DISABLE KEYS */;
INSERT INTO `Paciente` VALUES (1,'Maria Joao Sousa','1985-04-12','912345678','CC0001','NS0001','Multicare','919998877'),(2,'Pedro Miguel Silva','2018-09-23','934567890','CC0002','NS0002',NULL,NULL),(3,'Ana Rita Pereira','1972-11-30','965432109','CC0003','NS0003','Medis','210000000'),(4,'Jose Carlos Couto','1960-01-15','921112223','CC0004','NS0004','Sams',NULL),(5,'Carla Sofia Dias','1993-07-08','915554433','CC0005','NS0005',NULL,'915554434'),(6,'Luis Filipe Neto','1955-05-20','938887766','CC0006','NS0006','AdvanceCare',NULL),(7,'Beatriz Maria Lima','2002-03-14','963334455','CC0007','NS0007','Multicare',NULL),(8,'Antonio Jose Cruz','1980-12-05','910001122','CC0008','NS0008',NULL,NULL),(9,'Patricia Isabel Reis','1988-06-25','932223344','CC0009','NS0009','Medis','932223345'),(10,'Fernando Jorge Vaz','1967-08-19','961119988','CC0010','NS0010','Allianz',NULL),(11,'Sonia Cristina Brás','1979-02-02','924445566','CC0011','NS0011',NULL,NULL),(12,'Daniel Augusto Mota','1995-10-10','917778899','CC0012','NS0012','Multicare',NULL),(13,'Helena Isabel Leal','1948-11-11','939990011','CC0013','NS0013','Sams','229990011'),(14,'Rui Manuel Tavares','1975-03-31','960002233','CC0014','NS0014',NULL,NULL),(15,'Teresa de Jesus Vale','1963-09-09','912228899','CC0015','NS0015','AdvanceCare',NULL),(16,'Vitor Hugo Santos','1990-05-17','935551122','CC0016','NS0016','Medis',NULL),(17,'Isabel Maria Rocha','1982-01-22','964449988','CC0017','NS0017',NULL,'964449989'),(18,'Jorge Alexandre Fi','2010-07-04','928883344','CC0018','NS0018',NULL,NULL),(19,'Paula Alexandra Gil','1974-04-28','919994455','CC0019','NS0019','Allianz',NULL),(20,'Ricardo Joao Ramos','1987-12-12','931115566','CC0020','NS0020','Multicare',NULL),(21,'Filipe Andre Matos','2005-08-03','967772233','CC0021','NS0021',NULL,NULL),(22,'Silvia Margarida Sa','1991-11-20','923336677','CC0022','NS0022','Medis',NULL),(23,'Carlos Alberto Vaz','1959-06-13','918880011','CC0023','NS0023','Sams',NULL),(24,'Cristina Maria Rosa','1983-10-02','936660022','CC0024','NS0024',NULL,'936660023'),(25,'Nuno Miguel Bastos','1977-05-29','962227788','CC0025','NS0025','AdvanceCare',NULL),(26,'Sandra Marisa Lobo','1986-02-14','914441133','CC0026','NS0026','Multicare',NULL),(27,'Diogo Jose Guerra','2015-01-25','930004455','CC0027','NS0027',NULL,NULL),(28,'Andreia Sofia Neto','1994-03-18','969993311','CC0028','NS0028','Medis',NULL),(29,'Joao Pedro Guedes','1968-07-07','925558822','CC0029','NS0029','Allianz',NULL),(30,'Marta Sofia Araujo','1999-09-09','911110033','CC0030','NS0030',NULL,NULL);
/*!40000 ALTER TABLE `Paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Servico`
--

DROP TABLE IF EXISTS `Servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Servico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Servico`
--

LOCK TABLES `Servico` WRITE;
/*!40000 ALTER TABLE `Servico` DISABLE KEYS */;
INSERT INTO `Servico` VALUES (1,'Consulta de Rotina',50.00),(2,'Eletrocardiograma (ECG)',35.00),(3,'Consulta de Urgencia',80.00),(4,'Analises Clinicas',25.00),(5,'Ecografia Abdominal',70.00),(6,'Raio-X Torax',40.00),(7,'Consulta de Especialidade',75.00),(8,'Penso/Curativo',15.00),(9,'Administracao Injetaveis',10.00),(10,'Sutura de Ferida',45.00),(11,'Ressonancia Magnetica',250.00),(12,'Tomografia (TC)',150.00),(13,'Teste de Esforço',90.00),(14,'Audiograma',30.00),(15,'Exame de Refracao',40.00),(16,'Espirometria',45.00),(17,'Endoscopia Digestiva',180.00),(18,'Colonoscopia',220.00),(19,'Pequena Cirurgia',130.00),(20,'Infiltracao Articular',65.00),(21,'Tratamento Dermatologico',55.00),(22,'Crioterapia',40.00),(23,'Sessao de Fisioterapia',35.00),(24,'Avaliacao Psicologica',60.00),(25,'Ecocardiograma',85.00),(26,'Holter 24h',70.00),(27,'Mamografia',65.00),(28,'Densitometria Ossea',60.00),(29,'Citologia',30.00),(30,'Remocao de Sinais',95.00);
/*!40000 ALTER TABLE `Servico` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-10 15:36:50
