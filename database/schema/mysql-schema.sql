/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `tblCategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblCategoria` (
  `id` varchar(2) NOT NULL,
  `tpFolhaCategoria` char(2) NOT NULL,
  `isColorido` bit(1) NOT NULL DEFAULT b'0',
  `isMultifuncional` bit(1) NOT NULL DEFAULT b'0',
  `vlAluguel` decimal(10,2) NOT NULL,
  `nuContrato` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tpFolhaCategoria_UNIQUE` (`tpFolhaCategoria`) /*!80000 INVISIBLE */,
  KEY `fk_tbl_categoria_tbl_contrato_idx` (`nuContrato`),
  CONSTRAINT `fk_tbl_categoria_tbl_contrato` FOREIGN KEY (`nuContrato`) REFERENCES `tblContrato` (`nuContrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tblContrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblContrato` (
  `nuContrato` varchar(12) NOT NULL,
  `dtInicioValidade` varchar(45) NOT NULL,
  `dtFimValidade` varchar(45) DEFAULT NULL,
  `nmEmpresa` varchar(45) NOT NULL,
  PRIMARY KEY (`nuContrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tblEquipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblEquipamento` (
  `id` varchar(10) NOT NULL,
  `nuIpv4` varchar(15) DEFAULT NULL,
  `nuIpv6` varchar(45) DEFAULT NULL,
  `idModelo` int NOT NULL,
  `isEmRede` bit(1) NOT NULL DEFAULT b'0',
  `nuSerie` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nu_serie_UNIQUE` (`nuSerie`),
  KEY `fk_tbl_equipamento_tbl_modelo1_idx` (`idModelo`),
  CONSTRAINT `fk_tbl_equipamento_tbl_modelo1` FOREIGN KEY (`idModelo`) REFERENCES `tblModelo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tblLocalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblLocalidade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nmLocalidade` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tblMarca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblMarca` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nmMarca` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tblModelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblModelo` (
  `id` int NOT NULL,
  `nmModelo` varchar(20) NOT NULL,
  `idCategoria` varchar(2) NOT NULL,
  `idMarca` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tbl_modelo_tbl_categoria1_idx` (`idCategoria`),
  KEY `fk_tbl_modelo_tbl_marca1_idx` (`idMarca`),
  CONSTRAINT `fk_tblModelo_tblCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `tblCategoria` (`id`),
  CONSTRAINT `fk_tblModelo_tblMarca` FOREIGN KEY (`idMarca`) REFERENCES `tblMarca` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tblPostoImpressao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblPostoImpressao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idSublocalidade` int NOT NULL,
  `dsCaminhoSala` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tbPostoImpressao_tblSublocalidade_idx` (`idSublocalidade`),
  CONSTRAINT `fk_tbPostoImpressao_tblSublocalidade` FOREIGN KEY (`idSublocalidade`) REFERENCES `tblSublocalidade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tblPostoImpressaoTblEquipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblPostoImpressaoTblEquipamento` (
  `idPostoImpressao` int NOT NULL,
  `idEquipamento` varchar(10) NOT NULL,
  `dtInstalacao` datetime NOT NULL,
  `dtDesinstalacao` datetime DEFAULT NULL,
  PRIMARY KEY (`idPostoImpressao`,`idEquipamento`),
  KEY `fk_tblPostoImpressaoTblEquipamento_tblEquipamento1_idx` (`idEquipamento`),
  CONSTRAINT `fk_tblPostoImpressaoTblEquipamento_tblEquipamento` FOREIGN KEY (`idEquipamento`) REFERENCES `tblEquipamento` (`id`),
  CONSTRAINT `fk_tblPostoImpressaoTblEquipamento_tblPostoImpressao` FOREIGN KEY (`idPostoImpressao`) REFERENCES `tblPostoImpressao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tblSublocalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblSublocalidade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nmSublocalidade` varchar(45) NOT NULL,
  `idLocalidade` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tblSublocalidade_tblLocalidade_idx` (`idLocalidade`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_tblSublocalidade_tblLocalidade` FOREIGN KEY (`idLocalidade`) REFERENCES `tblLocalidade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

