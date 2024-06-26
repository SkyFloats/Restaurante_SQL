-- MySQL Script generated by MySQL Workbench
-- Thu May  9 12:24:31 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tb_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_cliente` (
  `nome_cliente` VARCHAR(45) NOT NULL,
  `sobrenome_cliente` VARCHAR(45) NOT NULL,
  `email_cliente` VARCHAR(200) NOT NULL,
  `cpf_cliente` INT(8) NOT NULL,
  PRIMARY KEY (`cpf_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_reserva` (
  `cpf_cliente` INT(8) NOT NULL,
  `data_reserva` DATE NOT NULL,
  `numero_pessoas` INT(2) NOT NULL,
  `id_reserva` INT(4) NOT NULL,
  PRIMARY KEY (`cpf_cliente`, `id_reserva`),
  CONSTRAINT `id_cliente`
    FOREIGN KEY (`cpf_cliente`)
    REFERENCES `mydb`.`tb_cliente` (`cpf_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_pedido` (
  `cpf_cliente` INT(8) NOT NULL,
  `id_pedido` INT(12) NOT NULL,
  `data_pedido` DATE NOT NULL,
  PRIMARY KEY (`cpf_cliente`, `id_pedido`),
  CONSTRAINT `id_cliente`
    FOREIGN KEY (`cpf_cliente`)
    REFERENCES `mydb`.`tb_cliente` (`cpf_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_item_cardapio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_item_cardapio` (
  `nome_item` VARCHAR(45) NOT NULL,
  `descricao_item` VARCHAR(200) NOT NULL,
  `preco_item` FLOAT(8) NOT NULL,
  `id_item` INT(4) NOT NULL,
  `id_pedido` INT(12) NOT NULL,
  PRIMARY KEY (`id_item`, `id_pedido`),
  INDEX `id_pedido_idx` (`id_pedido` ASC) VISIBLE,
  CONSTRAINT `id_pedido`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `mydb`.`tb_pedido` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_telefone_pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_telefone_pessoa` (
  `codigo_discagem` INT(2) NOT NULL,
  `numero_telefone_cliente` INT(9) NOT NULL,
  `cpf_cliente` INT(8) NOT NULL,
  PRIMARY KEY (`cpf_cliente`),
  CONSTRAINT `cpf_cliente`
    FOREIGN KEY (`cpf_cliente`)
    REFERENCES `mydb`.`tb_cliente` (`cpf_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_item_cardapio_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_item_cardapio_categoria` (
  `id_item` INT(4) NOT NULL,
  `categoria_item_entrada` INT(1) NOT NULL,
  `categoria_item_pratoprincipal` INT(1) NOT NULL,
  `categoria_item_sobremesa` INT(1) NOT NULL,
  `categoria_item_bebidas` INT(1) NOT NULL,
  PRIMARY KEY (`id_item`),
  CONSTRAINT `id_item`
    FOREIGN KEY (`id_item`)
    REFERENCES `mydb`.`tb_item_cardapio` (`id_item`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_status_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_status_pedido` (
  `status_pedido_preparando` INT(1) NOT NULL,
  `status_pedido_pronto` INT(1) NOT NULL,
  `status_pedido_entregue` INT(1) NOT NULL,
  `status_pedido_cancelado` INT(1) NOT NULL,
  `id_pedido` INT(12) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  CONSTRAINT `id_pedido`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `mydb`.`tb_pedido` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_status_reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_status_reserva` (
  `id_reserva` INT(4) NOT NULL,
  `status_reserva_confirmada` INT(1) NOT NULL,
  `status_reserva_pendente` INT(1) NOT NULL,
  `status_reserva_cancelada` INT(1) NOT NULL,
  PRIMARY KEY (`id_reserva`),
  CONSTRAINT `id_reserva`
    FOREIGN KEY (`id_reserva`)
    REFERENCES `mydb`.`tb_reserva` (`id_reserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
