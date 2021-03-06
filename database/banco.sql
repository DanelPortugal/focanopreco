-- MySQL dump 10.13  Distrib 5.6.19, for Win32 (x86)
--
-- Host: localhost    Database: focanopreco
-- ------------------------------------------------------
-- Server version	5.6.23-enterprise-commercial-advanced-log

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
  KEY `cod_produto_imagem` (`cod_produto`),
  CONSTRAINT `cod_produto_imagem` FOREIGN KEY (`cod_produto`) REFERENCES `produto` (`cod_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagem`
--

LOCK TABLES `imagem` WRITE;
/*!40000 ALTER TABLE `imagem` DISABLE KEYS */;
INSERT INTO `imagem` VALUES ('image_repository/thumb/notebook.jpg','image_repository/thumb/notebook.jpg',21),('image_repository/thumb/notebook.jpg','image_repository/thumb/notebook.jpg',22),('image_repository/thumb/memoria-ram-ddr1-1gb.jpg','image_repository/thumb/memoria-ram-ddr1-1gb.jpg',23),('image_repository/thumb/notebook.jpg','image_repository/thumb/notebook.jpg',24),('image_repository/thumb/Tulips.jpg','image_repository/thumb/Tulips.jpg',25),('image_repository/thumb/Penguins.jpg','image_repository/thumb/Penguins.jpg',26),('image_repository/thumb/Lighthouse.jpg','image_repository/thumb/Lighthouse.jpg',27),('image_repository/thumb/Jellyfish.jpg','image_repository/thumb/Jellyfish.jpg',28);
/*!40000 ALTER TABLE `imagem` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'ADMINISTRADOR','ADMINISTRADOR SISTEMA'),(2,'ANUNCIANTE','ANUNCIANTE DE PRODUTO'),(3,'USUÁRIO REDE SOCIAL','USUÁRIO LOGIN REDE SOCIAL');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
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
  `pre_produto` varchar(25) DEFAULT NULL,
  `cod_sub_categoria` int(11) NOT NULL,
  PRIMARY KEY (`cod_produto`),
  KEY `fk_produto_usuario1_idx` (`cod_usuario`),
  KEY `fk_produto_categora1_idx` (`cod_categoria`),
  KEY `fk_sub_categoria` (`cod_sub_categoria`),
  CONSTRAINT `fk_produto_categora1` FOREIGN KEY (`cod_categoria`) REFERENCES `categoria` (`cod_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_produto_usuario1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sub_categoria` FOREIGN KEY (`cod_sub_categoria`) REFERENCES `sub_categoria` (`cod_sub_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (21,'Note Book','Excel&ecirc;nte note, aprovado',1,2,'1200.00',2),(22,'Note Book','Excel&ecirc;nte note, aprovado',1,2,'1200.00',2),(23,'Mem&oacute;ria Ram','&Oacute;tima oportunidade',1,1,'120.00',1),(24,'teste','teste',1,2,'10.00',2),(25,'Tul&iacute;pa','asdasd',1,1,'100.00',1),(26,'teste lendo','qweqwe',1,1,'100.00',1),(27,'teste 3','321321',1,1,'100.00',1),(28,'Teste dam dam','hahah',1,2,'10.00',2);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
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
  `cod_usuario_pai` int(11) DEFAULT NULL,
  `nom_login` varchar(200) NOT NULL,
  `des_senha` varchar(45) NOT NULL,
  `des_email_usuario` varchar(200) DEFAULT NULL,
  `ind_network_usuario` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_usuario`),
  KEY `fk_usuario_perfil_idx` (`cod_perfil`),
  KEY `fk_usuario_usuario1` (`cod_usuario_pai`),
  CONSTRAINT `fk_usuario_perfil` FOREIGN KEY (`cod_perfil`) REFERENCES `perfil` (`cod_perfil`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_usuario1` FOREIGN KEY (`cod_usuario_pai`) REFERENCES `usuario` (`cod_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Administrador','Admin',1,1,NULL,'admin','admin',NULL,0),(16,'Thiago','Bloomfield',1,3,NULL,'777022582366598','usuario_network','thiagobloomfield@oi.com.br',1),(17,'Déborah','Guedes',1,3,NULL,'615937951874944','usuario_network','deborah.guedes94@hotmail.com',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_produto`(
	IN codProduto INT,
	IN nomProduto VARCHAR(45),
    IN desProduto VARCHAR(45)
)
BEGIN
	UPDATE produto SET
		nom_produto = nomProduto,
		des_produto = desProduto
	WHERE cod_produto = codProduto;
END ;;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserir_imagem_produto`(
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

END ;;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserir_produto_usuario`(
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserir_usuario_network` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserir_usuario_network`(
    IN nomUsuario VARCHAR(45),
    IN sobNomUsuario VARCHAR(45),
    IN nomLogin VARCHAR(200),
    IN emailUsuario VARCHAR(200)
)
BEGIN
    INSERT INTO `focanopreco`.`usuario`
    (
    `nom_usuario`,
    `sob_nom_usuario`,
    `ind_usuario`,
    `cod_perfil`,
    `nom_login`,
    `des_senha`,
    `des_email_usuario`,
    `ind_network_usuario`
    )
    VALUES
    (
    nomUsuario,
    sobNomUsuario,
    1,
    3,
    nomLogin,
    'usuario_network',
    emailUsuario,
    1
    );
END ;;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_categoria`()
BEGIN
SELECT * FROM categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_produto_comparacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_produto_comparacao`(
	IN codProduto1 INT,
    IN codProduto2 INT
)
BEGIN
	SELECT 
        prod.cod_produto,
        prod.nom_produto,
        prod.des_produto,
        prod.cod_usuario,
        prod.cod_categoria,
        prod.pre_produto,
        cat.nom_categoria,
        img.produto_img_peq,
        usu.nom_usuario
    FROM produto prod
    LEFT JOIN usuario usu ON usu.cod_usuario = prod.cod_usuario
    LEFT JOIN categoria cat ON cat.cod_categoria = prod.cod_categoria
    LEFT JOIN imagem img ON img.cod_produto = prod.cod_produto
    WHERE prod.cod_produto in (codProduto1, codProduto2);
END ;;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_produto_destaque_index`(
	IN codCategoria INT
)
BEGIN
	SELECT * FROM produto prod
    LEFT JOIN imagem img on img.cod_produto = prod.cod_produto
    WHERE prod.cod_categoria = codCategoria
    LIMIT 11;
END ;;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_produto_inserido_usuario`(
    IN codUsuario INT
)
BEGIN
    SELECT MAX(cod_produto) as cod_produto  FROM produto
    WHERE cod_usuario = codUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_produto_pesquisa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_produto_pesquisa`(
    IN nomProduto VARCHAR(45)
)
BEGIN
    SELECT 
        prod.cod_produto,
        prod.nom_produto,
        prod.des_produto,
        prod.cod_usuario,
        prod.cod_categoria,
        prod.pre_produto,
        cat.nom_categoria,
        img.produto_img_peq,
        usu.nom_usuario
    FROM produto prod
    LEFT JOIN usuario usu ON usu.cod_usuario = prod.cod_usuario
    LEFT JOIN categoria cat ON cat.cod_categoria = prod.cod_categoria
    LEFT JOIN imagem img ON img.cod_produto = prod.cod_produto
    WHERE prod.nom_produto like nomProduto;
END ;;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_produto_selecionado`(
	IN codProduto INT
)
BEGIN
	SELECT * FROM produto prod
    INNER JOIN categoria cat on cat.cod_categoria = prod.cod_categoria
    LEFT JOIN imagem img on img.cod_produto = prod.cod_produto
    WHERE prod.cod_produto = codProduto;
END ;;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_produto_usuario`(
	IN codUsuario INT
)
BEGIN
	SELECT * FROM produto prod
    INNER JOIN categoria cat on cat.cod_categoria = prod.cod_categoria
    LEFT JOIN imagem img on img.cod_produto = prod.cod_produto
    WHERE prod.cod_usuario = codUsuario;
END ;;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_sub_categoria`(
    IN codCategoria INT
)
BEGIN
    SELECT * FROM sub_categoria
    WHERE cod_categoria = codCategoria;
END ;;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `logar_usuario`(
	in nomLogin VARCHAR(45),
    in nomSenha VARCHAR(45)
)
BEGIN
	SELECT * FROM usuario 
    where nom_login = nomLogin
    and nomSenha = nomSenha;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `logar_usuario_network` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `logar_usuario_network`(
    IN nomLogin VARCHAR(45),
    IN desEmail VARCHAR(45)
)
BEGIN
    SELECT * FROM usuario
    WHERE nom_login = nomLogin
    AND des_senha = 'usuario_network'
    AND des_email_usuario = desEmail;
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

-- Dump completed on 2015-04-09 14:03:45
