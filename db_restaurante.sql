-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `tb_cardapio`
--

DROP TABLE IF EXISTS `tb_cardapio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cardapio` (
  `id_item` int NOT NULL,
  `nome_prato` varchar(45) NOT NULL,
  `descricao_prato` tinytext NOT NULL,
  `preco_prato` decimal(10,2) NOT NULL,
  `categoria_prato` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cardapio`
--

LOCK TABLES `tb_cardapio` WRITE;
/*!40000 ALTER TABLE `tb_cardapio` DISABLE KEYS */;
INSERT INTO `tb_cardapio` VALUES (1,'Salada Caesar','Salada fresca com molho caesar, croutons e queijo parmesão.',19.90,'Entrada'),(2,'Sopa de Cebola','Sopa cremosa de cebola com queijo gratinado.',14.50,'Entrada'),(3,'Picanha na Chapa','Picanha suculenta servida com farofa, arroz e vinagrete.',79.90,'Principal'),(4,'Spaghetti Carbonara','Massa italiana com molho cremoso de ovos, queijo e bacon.',39.90,'Principal'),(5,'Petit Gâteau','Bolo de chocolate servido quente com sorvete de baunilha.',24.90,'Sobremesa'),(6,'Torta de Limão','Torta com creme de limão e cobertura de merengue.',17.50,'Sobremesa'),(7,'Coca-Cola 350ml','Refrigerante tradicional.',5.90,'Bebida'),(8,'Suco de Laranja','Suco natural de laranja.',7.50,'Bebida');
/*!40000 ALTER TABLE `tb_cardapio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cliente` (
  `id_cliente` int NOT NULL,
  `nome_completo` varchar(100) NOT NULL,
  `numero_telefone` varchar(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `numero_telefone` (`numero_telefone`),
  KEY `idx_nome_completo` (`nome_completo`),
  KEY `idx_nome_email` (`nome_completo`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (1,'Ana Beatriz Souza','52170974000','ana.souza@gmail.com'),(2,'João Pedro Martins','21965437890','joao.martins@yahoo.com'),(3,'Maria Clara Ribeiro','31912345678','maria.ribeiro@hotmail.com'),(4,'Carlos Eduardo Silva','11987654322','carlos.silva@outlook.com'),(5,'Fernanda Alves Costa','41987654323','fernanda.costa@gmail.com'),(6,'Gabriel Henrique Lima','51976543210','gabriel.lima@gmail.com'),(7,'Juliana Pereira Nogueira','21987654324','juliana.nogueira@yahoo.com'),(8,'Rafael Almeida Barbosa','31998765432','rafael.almeida@outlook.com'),(9,'Larissa Fernandes Rocha','11965437891','larissa.rocha@gmail.com'),(10,'Thiago Moura Santos','21976543211','thiago.santos@hotmail.com');
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_forma_pagamento`
--

DROP TABLE IF EXISTS `tb_forma_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_forma_pagamento` (
  `id_forma_pagamento` int NOT NULL,
  `descricao_forma_pagamento` varchar(15) NOT NULL,
  PRIMARY KEY (`id_forma_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_forma_pagamento`
--

LOCK TABLES `tb_forma_pagamento` WRITE;
/*!40000 ALTER TABLE `tb_forma_pagamento` DISABLE KEYS */;
INSERT INTO `tb_forma_pagamento` VALUES (1,'Debito'),(2,'Credito'),(3,'Pix');
/*!40000 ALTER TABLE `tb_forma_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_item_pedido`
--

DROP TABLE IF EXISTS `tb_item_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_item_pedido` (
  `id_item_pedido` int NOT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  `id_pedido` int NOT NULL,
  `id_item` int NOT NULL,
  PRIMARY KEY (`id_item_pedido`),
  KEY `fk_t_pedido_t_prato_pedido_idx` (`id_pedido`),
  KEY `fk_t_cardapio_t_prato_pedido_idx` (`id_item`),
  CONSTRAINT `fk_t_cardapio_t_prato_pedido12` FOREIGN KEY (`id_item`) REFERENCES `tb_cardapio` (`id_item`),
  CONSTRAINT `fk_t_pedido_t_prato_pedido78` FOREIGN KEY (`id_pedido`) REFERENCES `tb_pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_item_pedido`
--

LOCK TABLES `tb_item_pedido` WRITE;
/*!40000 ALTER TABLE `tb_item_pedido` DISABLE KEYS */;
INSERT INTO `tb_item_pedido` VALUES (1,2,39.90,1,3),(2,1,79.90,1,4),(3,4,5.90,2,7),(4,3,14.50,3,2),(5,1,24.90,3,5),(6,6,7.50,5,8),(7,1,19.90,7,1),(8,2,17.50,8,6),(9,3,14.50,10,2),(10,1,39.90,10,3);
/*!40000 ALTER TABLE `tb_item_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_mesa`
--

DROP TABLE IF EXISTS `tb_mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_mesa` (
  `id_mesa` int NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `id_forma_pagamento` int NOT NULL,
  `id_status_pagamento` int NOT NULL,
  `id_pedido` int NOT NULL,
  PRIMARY KEY (`id_mesa`),
  KEY `fk_t_pedido_t_pagamento_idx` (`id_pedido`),
  KEY `fk_t_forma_pagamento_idx` (`id_forma_pagamento`),
  KEY `fk_t_status_pagamento_idx` (`id_status_pagamento`),
  CONSTRAINT `fk_t_forma_pagamento5` FOREIGN KEY (`id_forma_pagamento`) REFERENCES `tb_forma_pagamento` (`id_forma_pagamento`),
  CONSTRAINT `fk_t_pedido_t_pagamento2` FOREIGN KEY (`id_pedido`) REFERENCES `tb_pedido` (`id_pedido`),
  CONSTRAINT `fk_t_status_pagamento6` FOREIGN KEY (`id_status_pagamento`) REFERENCES `tb_status_pagamento` (`id_status_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_mesa`
--

LOCK TABLES `tb_mesa` WRITE;
/*!40000 ALTER TABLE `tb_mesa` DISABLE KEYS */;
INSERT INTO `tb_mesa` VALUES (1,150.00,1,1,1),(2,75.50,2,2,2),(3,200.00,1,1,3),(4,0.00,3,3,3),(5,125.75,3,1,5),(6,89.90,1,1,6),(7,110.00,3,1,7),(8,300.00,1,1,8),(9,60.00,2,3,3),(10,175.00,3,1,10);
/*!40000 ALTER TABLE `tb_mesa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_pagamento_mesa_update` AFTER UPDATE ON `tb_mesa` FOR EACH ROW BEGIN
    -- Verifica se houve alteração no status do pagamento
    IF OLD.id_status_pagamento <> NEW.id_status_pagamento THEN
        -- Insere o registro de histórico na tabela tb_pagamento_mesa_log
        INSERT INTO tb_pagamento_mesa_log (mesa_id, anterior_status_pagamento_id, novo_status_pagamento_id)
        VALUES (OLD.id_mesa, OLD.id_status_pagamento, NEW.id_status_pagamento);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_pagamento_mesa_log`
--

DROP TABLE IF EXISTS `tb_pagamento_mesa_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pagamento_mesa_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mesa_id` int DEFAULT NULL,
  `anterior_status_pagamento_id` int DEFAULT NULL,
  `novo_status_pagamento_id` int DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `mesa_id` (`mesa_id`),
  KEY `anterior_status_pagamento_id` (`anterior_status_pagamento_id`),
  KEY `novo_status_pagamento_id` (`novo_status_pagamento_id`),
  CONSTRAINT `tb_pagamento_mesa_log_ibfk_1` FOREIGN KEY (`mesa_id`) REFERENCES `tb_mesa` (`id_mesa`),
  CONSTRAINT `tb_pagamento_mesa_log_ibfk_2` FOREIGN KEY (`anterior_status_pagamento_id`) REFERENCES `tb_status_pagamento` (`id_status_pagamento`),
  CONSTRAINT `tb_pagamento_mesa_log_ibfk_3` FOREIGN KEY (`novo_status_pagamento_id`) REFERENCES `tb_status_pagamento` (`id_status_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pagamento_mesa_log`
--

LOCK TABLES `tb_pagamento_mesa_log` WRITE;
/*!40000 ALTER TABLE `tb_pagamento_mesa_log` DISABLE KEYS */;
INSERT INTO `tb_pagamento_mesa_log` VALUES (1,6,2,1,'2024-12-03 13:24:02');
/*!40000 ALTER TABLE `tb_pagamento_mesa_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pedido`
--

DROP TABLE IF EXISTS `tb_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pedido` (
  `id_pedido` int NOT NULL,
  `data_pedido` date NOT NULL,
  `hora_pedido` time NOT NULL,
  `id_status_pedido` int NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_t_status_pedido_idx` (`id_status_pedido`),
  CONSTRAINT `fk_t_status_pedido` FOREIGN KEY (`id_status_pedido`) REFERENCES `tb_status_pedido` (`id_status_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pedido`
--

LOCK TABLES `tb_pedido` WRITE;
/*!40000 ALTER TABLE `tb_pedido` DISABLE KEYS */;
INSERT INTO `tb_pedido` VALUES (1,'2024-12-03','19:10:00',1),(2,'2024-12-03','20:15:00',2),(3,'2024-12-04','18:45:00',1),(4,'2024-12-04','21:15:00',3),(5,'2024-12-05','19:40:00',1),(6,'2024-12-05','20:30:00',2),(7,'2024-12-06','18:55:00',1),(8,'2024-12-06','19:25:00',1),(9,'2024-12-07','20:10:00',2),(10,'2024-12-07','20:45:00',1);
/*!40000 ALTER TABLE `tb_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_reserva`
--

DROP TABLE IF EXISTS `tb_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_reserva` (
  `id_reserva` int NOT NULL,
  `data_reserva` date NOT NULL,
  `hora_reserva` time NOT NULL,
  `qtd_pessoa` int NOT NULL,
  `id_status_reserva` int NOT NULL,
  `id_cliente` int NOT NULL,
  `id_mesa` int NOT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `fk_t_cadastro_cliente_t_reserva_idx` (`id_cliente`),
  KEY `fk_t_mesa_t_reserva_idx` (`id_mesa`),
  KEY `fk_t_status_reserva_idx` (`id_status_reserva`),
  CONSTRAINT `fk_t_cadastro_cliente_t9_reserva` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`),
  CONSTRAINT `fk_t_mesa_t_reserva6` FOREIGN KEY (`id_mesa`) REFERENCES `tb_mesa` (`id_mesa`),
  CONSTRAINT `fk_t_status_reserva0` FOREIGN KEY (`id_status_reserva`) REFERENCES `tb_status_reserva` (`id_status_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_reserva`
--

LOCK TABLES `tb_reserva` WRITE;
/*!40000 ALTER TABLE `tb_reserva` DISABLE KEYS */;
INSERT INTO `tb_reserva` VALUES (1,'2024-12-03','19:00:00',2,1,1,5),(2,'2024-12-03','20:00:00',4,2,2,8),(3,'2024-12-04','18:30:00',3,1,3,6),(4,'2024-12-04','21:00:00',5,1,4,7),(5,'2024-12-05','19:30:00',2,3,5,4),(6,'2024-12-05','20:15:00',6,1,6,9),(7,'2024-12-06','18:45:00',2,2,7,3),(8,'2024-12-06','19:15:00',4,1,8,2),(9,'2024-12-07','20:00:00',1,3,9,1),(10,'2024-12-07','20:30:00',3,2,10,10);
/*!40000 ALTER TABLE `tb_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_status_pagamento`
--

DROP TABLE IF EXISTS `tb_status_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_status_pagamento` (
  `id_status_pagamento` int NOT NULL,
  `descricao_status_pagamento` varchar(15) NOT NULL,
  PRIMARY KEY (`id_status_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_status_pagamento`
--

LOCK TABLES `tb_status_pagamento` WRITE;
/*!40000 ALTER TABLE `tb_status_pagamento` DISABLE KEYS */;
INSERT INTO `tb_status_pagamento` VALUES (1,'Efetuado'),(2,'Pendente'),(3,'Cancelado');
/*!40000 ALTER TABLE `tb_status_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_status_pedido`
--

DROP TABLE IF EXISTS `tb_status_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_status_pedido` (
  `id_status_pedido` int NOT NULL,
  `descricao_status_pedido` varchar(15) NOT NULL,
  PRIMARY KEY (`id_status_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_status_pedido`
--

LOCK TABLES `tb_status_pedido` WRITE;
/*!40000 ALTER TABLE `tb_status_pedido` DISABLE KEYS */;
INSERT INTO `tb_status_pedido` VALUES (1,'Efetuado'),(2,'Pendente'),(3,'Cancelado');
/*!40000 ALTER TABLE `tb_status_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_status_reserva`
--

DROP TABLE IF EXISTS `tb_status_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_status_reserva` (
  `id_status_reserva` int NOT NULL AUTO_INCREMENT,
  `descricao_status_reserva` varchar(15) NOT NULL,
  PRIMARY KEY (`id_status_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_status_reserva`
--

LOCK TABLES `tb_status_reserva` WRITE;
/*!40000 ALTER TABLE `tb_status_reserva` DISABLE KEYS */;
INSERT INTO `tb_status_reserva` VALUES (1,'Confirmado'),(2,'Pendente'),(3,'Cancelado');
/*!40000 ALTER TABLE `tb_status_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `atualizar_telefone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_telefone`(
    IN p_cliente_id INT,
    IN p_novo_telefone VARCHAR(11),
    OUT p_sucesso BOOLEAN
)
BEGIN
    DECLARE telefone_existe INT;
    
    SELECT COUNT(*) INTO telefone_existe FROM tb_cliente WHERE numero_telefone = p_novo_telefone;
    
    IF telefone_existe = 0 THEN
        UPDATE tb_cliente SET numero_telefone = p_novo_telefone WHERE id_cliente = p_cliente_id;
        SET p_sucesso = TRUE;
    ELSE
        SET p_sucesso = FALSE;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-03 11:28:32
