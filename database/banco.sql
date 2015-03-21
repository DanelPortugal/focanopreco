SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `focanopreco` DEFAULT CHARACTER SET utf8 ;
USE `focanopreco` ;

-- -----------------------------------------------------
-- Table `focanopreco`.`perfil`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `focanopreco`.`perfil` (
  `cod_perfil` INT NOT NULL AUTO_INCREMENT ,
  `nom_perfil` VARCHAR(45) NOT NULL ,
  `des_perfil` VARCHAR(45) NULL ,
  PRIMARY KEY (`cod_perfil`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focanopreco`.`usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `focanopreco`.`usuario` (
  `cod_usuario` INT NOT NULL AUTO_INCREMENT ,
  `nom_usuario` VARCHAR(45) NOT NULL ,
  `sob_nom_usuario` VARCHAR(45) NULL ,
  `ind_usuario` INT NOT NULL DEFAULT 0 ,
  `cod_perfil` INT NOT NULL ,
  `cod_usu_pai` INT NULL ,
  `co_usuario_pai` INT NULL ,
  PRIMARY KEY (`cod_usuario`) ,
  INDEX `fk_usuario_perfil_idx` (`cod_perfil` ASC) ,
  INDEX `fk_usuario_usuario1` (`co_usuario_pai` ASC) ,
  CONSTRAINT `fk_usuario_perfil`
    FOREIGN KEY (`cod_perfil` )
    REFERENCES `focanopreco`.`perfil` (`cod_perfil` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_usuario1`
    FOREIGN KEY (`co_usuario_pai` )
    REFERENCES `focanopreco`.`usuario` (`cod_usuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focanopreco`.`categora`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `focanopreco`.`categora` (
  `cod_categoria` INT NOT NULL AUTO_INCREMENT ,
  `nom_categora` VARCHAR(45) NOT NULL ,
  `des_categoria` VARCHAR(45) NULL ,
  PRIMARY KEY (`cod_categoria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focanopreco`.`produto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `focanopreco`.`produto` (
  `cod_produto` INT NOT NULL AUTO_INCREMENT ,
  `nom_produto` VARCHAR(45) NULL ,
  `des_produto` VARCHAR(45) NULL ,
  `cod_usuario` INT NOT NULL ,
  `cod_categoria` INT NOT NULL ,
  `pre_produto` DECIMAL(10,2) NULL ,
  PRIMARY KEY (`cod_produto`) ,
  INDEX `fk_produto_usuario1_idx` (`cod_usuario` ASC) ,
  INDEX `fk_produto_categora1_idx` (`cod_categoria` ASC) ,
  CONSTRAINT `fk_produto_usuario1`
    FOREIGN KEY (`cod_usuario` )
    REFERENCES `focanopreco`.`usuario` (`cod_usuario` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_produto_categora1`
    FOREIGN KEY (`cod_categoria` )
    REFERENCES `focanopreco`.`categora` (`cod_categoria` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focanopreco`.`pessoa_juridica`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `focanopreco`.`pessoa_juridica` (
  `cod_pessoa_juridica` INT NOT NULL AUTO_INCREMENT ,
  `num_cnpj` INT NOT NULL ,
  `cod_usuario` INT NOT NULL ,
  PRIMARY KEY (`cod_pessoa_juridica`) ,
  INDEX `fk_pessoa_juridica_usuario1_idx` (`cod_usuario` ASC) ,
  CONSTRAINT `fk_pessoa_juridica_usuario1`
    FOREIGN KEY (`cod_usuario` )
    REFERENCES `focanopreco`.`usuario` (`cod_usuario` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focanopreco`.`pessoa_fisica`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `focanopreco`.`pessoa_fisica` (
  `cod_pessoa_fisica` INT NOT NULL AUTO_INCREMENT ,
  `num_cpf` INT NOT NULL ,
  `cod_usuario` INT NOT NULL ,
  PRIMARY KEY (`cod_pessoa_fisica`) ,
  INDEX `fk_pessoa_fisica_usuario1_idx` (`cod_usuario` ASC) ,
  CONSTRAINT `fk_pessoa_fisica_usuario1`
    FOREIGN KEY (`cod_usuario` )
    REFERENCES `focanopreco`.`usuario` (`cod_usuario` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focanopreco`.`sub_categoria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `focanopreco`.`sub_categoria` (
  `cod_sub_categoria` INT NOT NULL AUTO_INCREMENT ,
  `nom_sub_categoria` VARCHAR(45) NOT NULL ,
  `des_sub_categoria` VARCHAR(45) NULL ,
  `cod_categoria` INT NOT NULL ,
  PRIMARY KEY (`cod_sub_categoria`) ,
  INDEX `fk_sub_categoria_categora1_idx` (`cod_categoria` ASC) ,
  CONSTRAINT `fk_sub_categoria_categora1`
    FOREIGN KEY (`cod_categoria` )
    REFERENCES `focanopreco`.`categora` (`cod_categoria` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focanopreco`.`avaliacao`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `focanopreco`.`avaliacao` (
  `cod_avaliacao` INT NOT NULL ,
  `des_avaliacao` TEXT NOT NULL ,
  `cod_tipo_avalicao` INT NOT NULL ,
  `ind_status` INT NOT NULL ,
  PRIMARY KEY (`cod_avaliacao`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focanopreco`.`avaliacao_produto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `focanopreco`.`avaliacao_produto` (
  `cod_avaliacao` INT NOT NULL ,
  `cod_produto` INT NOT NULL ,
  INDEX `fk_avaliacao_produto_avaliacao1_idx` (`cod_avaliacao` ASC) ,
  INDEX `fk_avaliacao_produto_produto1_idx` (`cod_produto` ASC) ,
  PRIMARY KEY (`cod_avaliacao`, `cod_produto`) ,
  CONSTRAINT `fk_avaliacao_produto_avaliacao1`
    FOREIGN KEY (`cod_avaliacao` )
    REFERENCES `focanopreco`.`avaliacao` (`cod_avaliacao` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_avaliacao_produto_produto1`
    FOREIGN KEY (`cod_produto` )
    REFERENCES `focanopreco`.`produto` (`cod_produto` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focanopreco`.`avalicao_usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `focanopreco`.`avalicao_usuario` (
  `cod_avaliacao` INT NOT NULL ,
  `cod_usuario` INT NULL ,
  INDEX `fk_avalicao_usuario_avaliacao1_idx` (`cod_avaliacao` ASC) ,
  INDEX `fk_avalicao_usuario_usuario1_idx` (`cod_usuario` ASC) ,
  PRIMARY KEY (`cod_avaliacao`) ,
  CONSTRAINT `fk_avalicao_usuario_avaliacao1`
    FOREIGN KEY (`cod_avaliacao` )
    REFERENCES `focanopreco`.`avaliacao` (`cod_avaliacao` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_avalicao_usuario_usuario1`
    FOREIGN KEY (`cod_usuario` )
    REFERENCES `focanopreco`.`usuario` (`cod_usuario` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
