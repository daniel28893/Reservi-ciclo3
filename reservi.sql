-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema reservi
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema reservi
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `reservi` DEFAULT CHARACTER SET utf8 ;
USE `reservi` ;

-- -----------------------------------------------------
-- Table `reservi`.`habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservi`.`habitacion` (
  `numero_habi` INT NOT NULL AUTO_INCREMENT,
  `tipo_habi` VARCHAR(45) NULL,
  `ubicacion` VARCHAR(45) NULL,
  `codigo_esthab` VARCHAR(45) NULL,
  `nombre_esthab` VARCHAR(45) NULL,
  PRIMARY KEY (`numero_habi`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reservi`.`Huesped`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservi`.`Huesped` (
  `id_hue` INT NOT NULL AUTO_INCREMENT,
  `nombre_hue` VARCHAR(45) NULL,
  `telefono_hue` VARCHAR(45) NULL,
  `email_hue` VARCHAR(45) NULL,
  PRIMARY KEY (`id_hue`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reservi`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservi`.`usuario` (
  `id_usuario` INT NOT NULL,
  `nombre_usu` VARCHAR(45) NULL,
  `contraseña_usu` VARCHAR(45) NULL,
  `tipo_usu` VARCHAR(45) NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reservi`.`reservar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservi`.`reservar` (
  `codigo_rese` INT NOT NULL,
  `numero_habi` INT NULL,
  `id_hue` INT NULL,
  `fecha_reserva` DATETIME NULL,
  `codigo_estReser` VARCHAR(45) NULL,
  `nombre_estRese` VARCHAR(45) NULL,
  `id_usuario` INT NULL,
  PRIMARY KEY (`codigo_rese`),
  INDEX `reserva_habitacion_idx` (`numero_habi` ASC) VISIBLE,
  INDEX `reserva_huesped_idx` (`id_hue` ASC) VISIBLE,
  INDEX `reserva_usuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `reserva_habitacion`
    FOREIGN KEY (`numero_habi`)
    REFERENCES `reservi`.`habitacion` (`numero_habi`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `reserva_huesped`
    FOREIGN KEY (`id_hue`)
    REFERENCES `reservi`.`Huesped` (`id_hue`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `reserva_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `reservi`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
