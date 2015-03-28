CREATE DATABASE  IF NOT EXISTS `focanopreco` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `focanopreco`;
-- MySQL dump 10.13  Distrib 5.1.40, for Win32 (ia32)
--
-- Host: localhost    Database: focanopreco
-- ------------------------------------------------------
-- Server version	5.1.59-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `cod_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nom_categoria` varchar(45) NOT NULL,
  `des_categoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Memória','Memória RAM'),(2,'Computadores','PC, NoteBook e Etc');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagem`
--

DROP TABLE IF EXISTS `imagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagem` (
  `produto_img_peq` text,
  `produto_img_grd` text,
  `cod_produto` int(11) DEFAULT NULL,
  `cod_imagem` varchar(45) NOT NULL,
  KEY `cod_produto_imagem` (`cod_produto`),
  CONSTRAINT `cod_produto_imagem` FOREIGN KEY (`cod_produto`) REFERENCES `produto` (`cod_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagem`
--

LOCK TABLES `imagem` WRITE;
/*!40000 ALTER TABLE `imagem` DISABLE KEYS */;
INSERT INTO `imagem` VALUES ('image_repository/thumb/39717054.jpg','image_repository/thumb/39717054.jpg',1,'1'),('image_repository/thumb/39717054.jpg','image_repository/thumb/39717054.jpg',2,'2'),('image_repository/thumb/notebook.jpg','image_repository/thumb/notebook.jpg',3,'3'),('image_repository/thumb/39717054.jpg','image_repository/thumb/39717054.jpg',9,'4'),('image_repository/thumb/39717054.jpg','image_repository/thumb/39717054.jpg',10,'5'),('image_repository/thumb/39717054.jpg','image_repository/thumb/39717054.jpg',11,'6'),('image_repository/thumb/Lighthouse.jpg','image_repository/thumb/Lighthouse.jpg',12,'7');
/*!40000 ALTER TABLE `imagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categoria`
--

DROP TABLE IF EXISTS `sub_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_categoria` (
  `cod_sub_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nom_sub_categoria` varchar(45) NOT NULL,
  `des_sub_categoria` varchar(45) DEFAULT NULL,
  `cod_categoria` int(11) NOT NULL,
  PRIMARY KEY (`cod_sub_categoria`),
  KEY `fk_sub_categoria_categora1_idx` (`cod_categoria`),
  CONSTRAINT `fk_sub_categoria_categora1` FOREIGN KEY (`cod_categoria`) REFERENCES `categoria` (`cod_categoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categoria`
--

LOCK TABLES `sub_categoria` WRITE;
/*!40000 ALTER TABLE `sub_categoria` DISABLE KEYS */;
INSERT INTO `sub_categoria` VALUES (1,'Memórias RAM','Ram Teste',1),(2,'Notebooks','PC',2);
/*!40000 ALTER TABLE `sub_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_juridica`
--

DROP TABLE IF EXISTS `pessoa_juridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa_juridica` (
  `cod_pessoa_juridica` int(11) NOT NULL AUTO_INCREMENT,
  `num_cnpj` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  PRIMARY KEY (`cod_pessoa_juridica`),
  KEY `fk_pessoa_juridica_usuario1_idx` (`cod_usuario`),
  CONSTRAINT `fk_pessoa_juridica_usuario1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_juridica`
--

LOCK TABLES `pessoa_juridica` WRITE;
/*!40000 ALTER TABLE `pessoa_juridica` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa_juridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `cod_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nom_usuario` varchar(45) NOT NULL,
  `sob_nom_usuario` varchar(45) DEFAULT NULL,
  `ind_usuario` int(11) NOT NULL DEFAULT '0',
  `cod_perfil` int(11) NOT NULL,
  `co_usuario_pai` int(11) DEFAULT NULL,
  `nom_login` varchar(45) NOT NULL,
  `des_senha` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_usuario`),
  KEY `fk_usuario_perfil_idx` (`cod_perfil`),
  KEY `fk_usuario_usuario1` (`co_usuario_pai`),
  CONSTRAINT `fk_usuario_perfil` FOREIGN KEY (`cod_perfil`) REFERENCES `perfil` (`cod_perfil`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_usuario1` FOREIGN KEY (`co_usuario_pai`) REFERENCES `usuario` (`cod_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Administrador','Admin',1,1,NULL,'admin','admin');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `cod_produto` int(11) NOT NULL AUTO_INCREMENT,
  `nom_produto` varchar(45) DEFAULT NULL,
  `des_produto` varchar(45) DEFAULT NULL,
  `cod_usuario` int(11) NOT NULL,
  `cod_categoria` int(11) NOT NULL,
  `pre_produto` decimal(10,2) DEFAULT NULL,
  `cod_sub_categoria` int(11) NOT NULL,
  PRIMARY KEY (`cod_produto`),
  KEY `fk_produto_usuario1_idx` (`cod_usuario`),
  KEY `fk_produto_categora1_idx` (`cod_categoria`),
  KEY `fk_sub_categoria` (`cod_sub_categoria`),
  CONSTRAINT `fk_sub_categoria` FOREIGN KEY (`cod_sub_categoria`) REFERENCES `sub_categoria` (`cod_sub_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_categora1` FOREIGN KEY (`cod_categoria`) REFERENCES `categoria` (`cod_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_produto_usuario1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Teste 123 deh','Teste ',1,1,'100.20',1),(2,'Moméria Ram 3','Lorem Ipsun',1,1,'200.00',1),(3,'Asus Teste','PC Asus',1,2,'1000.20',2),(9,'teste imagem','teste',1,1,'3211.00',1),(10,'123','123',1,1,'1211.00',1),(11,'teste jsjsj','qweq',1,1,'31.00',1),(12,'1231','123123',1,1,'123.00',1);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao_produto`
--

DROP TABLE IF EXISTS `avaliacao_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avaliacao_produto` (
  `cod_avaliacao` int(11) NOT NULL,
  `cod_produto` int(11) NOT NULL,
  PRIMARY KEY (`cod_avaliacao`,`cod_produto`),
  KEY `fk_avaliacao_produto_avaliacao1_idx` (`cod_avaliacao`),
  KEY `fk_avaliacao_produto_produto1_idx` (`cod_produto`),
  CONSTRAINT `fk_avaliacao_produto_avaliacao1` FOREIGN KEY (`cod_avaliacao`) REFERENCES `avaliacao` (`cod_avaliacao`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_avaliacao_produto_produto1` FOREIGN KEY (`cod_produto`) REFERENCES `produto` (`cod_produto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao_produto`
--

LOCK TABLES `avaliacao_produto` WRITE;
/*!40000 ALTER TABLE `avaliacao_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacao_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `cod_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `nom_perfil` varchar(45) NOT NULL,
  `des_perfil` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'ADMINISTRADOR','ADMINISTRADOR SISTEMA'),(2,'ANUNCIANTE','ANUNCIANTE DE PRODUTO');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avalicao_usuario`
--

DROP TABLE IF EXISTS `avalicao_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avalicao_usuario` (
  `cod_avaliacao` int(11) NOT NULL,
  `cod_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_avaliacao`),
  KEY `fk_avalicao_usuario_avaliacao1_idx` (`cod_avaliacao`),
  KEY `fk_avalicao_usuario_usuario1_idx` (`cod_usuario`),
  CONSTRAINT `fk_avalicao_usuario_avaliacao1` FOREIGN KEY (`cod_avaliacao`) REFERENCES `avaliacao` (`cod_avaliacao`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_avalicao_usuario_usuario1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avalicao_usuario`
--

LOCK TABLES `avalicao_usuario` WRITE;
/*!40000 ALTER TABLE `avalicao_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `avalicao_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_fisica`
--

DROP TABLE IF EXISTS `pessoa_fisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa_fisica` (
  `cod_pessoa_fisica` int(11) NOT NULL AUTO_INCREMENT,
  `num_cpf` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  PRIMARY KEY (`cod_pessoa_fisica`),
  KEY `fk_pessoa_fisica_usuario1_idx` (`cod_usuario`),
  CONSTRAINT `fk_pessoa_fisica_usuario1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_fisica`
--

LOCK TABLES `pessoa_fisica` WRITE;
/*!40000 ALTER TABLE `pessoa_fisica` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa_fisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avaliacao` (
  `cod_avaliacao` int(11) NOT NULL,
  `des_avaliacao` text NOT NULL,
  `cod_tipo_avalicao` int(11) NOT NULL,
  `ind_status` int(11) NOT NULL,
  PRIMARY KEY (`cod_avaliacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'focanopreco'
--
/*!50003 DROP PROCEDURE IF EXISTS `editar_produto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `editar_produto`(
	IN codProduto INT,
	IN nomProduto VARCHAR(45),
    IN desProduto VARCHAR(45)
)
BEGIN
	UPDATE produto SET
		nom_produto = nomProduto,
		des_produto = desProduto
	WHERE cod_produto = codProduto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserir_imagem_produto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `inserir_imagem_produto`(
    IN imgPeg TEXT,
    IN imgGrd TEXT,
    IN codProduto INT
)
BEGIN
    INSERT INTO `focanopreco`.`imagem`
    (`produto_img_peq`,
    `produto_img_grd`,
    `cod_produto`)
    VALUES
    (
    imgPeg,
    imgGrd,
    codProduto
    );

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserir_produto_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `inserir_produto_usuario`(
    IN nomProduto VARCHAR(45),
    IN desProduto VARCHAR(45),
    IN codUsuario INT,
    IN codCategoria INT,
    IN preProduto DECIMAL(10,2),
    IN codSubCategoria INT
)
BEGIN
    INSERT INTO `focanopreco`.`produto`
    (
        `nom_produto`,
        `des_produto`,
        `cod_usuario`,
        `cod_categoria`,
        `pre_produto`,
        `cod_sub_categoria`
    )
    VALUES
    (
        nomProduto,
        desProduto,
        codUsuario,
        codCategoria,
        preProduto,
        codSubCategoria
    );

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `listar_categoria`()
BEGIN
SELECT * FROM categoria;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_produto_destaque_index` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `listar_produto_destaque_index`(
	IN codCategoria INT
)
BEGIN
	SELECT * FROM produto prod
    LEFT JOIN imagem img on img.cod_produto = prod.cod_produto
    WHERE prod.cod_categoria = codCategoria
    LIMIT 11;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_produto_inserido_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `listar_produto_inserido_usuario`(
    IN codUsuario INT
)
BEGIN
    SELECT MAX(cod_produto) as cod_produto  FROM produto
    WHERE cod_usuario = codUsuario;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_produto_selecionado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `listar_produto_selecionado`(
	IN codProduto INT
)
BEGIN
	SELECT * FROM produto prod
    INNER JOIN categoria cat on cat.cod_categoria = prod.cod_categoria
    LEFT JOIN imagem img on img.cod_produto = prod.cod_produto
    WHERE prod.cod_produto = codProduto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_produto_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `listar_produto_usuario`(
	IN codUsuario INT
)
BEGIN
	SELECT * FROM produto prod
    INNER JOIN categoria cat on cat.cod_categoria = prod.cod_categoria
    LEFT JOIN imagem img on img.cod_produto = prod.cod_produto
    WHERE prod.cod_usuario = codUsuario;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_sub_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `listar_sub_categoria`(
    IN codCategoria INT
)
BEGIN
    SELECT * FROM sub_categoria
    WHERE cod_categoria = codCategoria;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `logar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `logar_usuario`(
	in nomLogin VARCHAR(45),
    in nomSenha VARCHAR(45)
)
BEGIN
	SELECT * FROM usuario 
    where nom_login = nomLogin
    and nomSenha = nomSenha;
END */;;
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

-- Dump completed on 2015-03-28 16:56:28
