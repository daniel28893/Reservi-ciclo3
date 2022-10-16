-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Reservi
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Reservi
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Reservi` DEFAULT CHARACTER SET utf8 ;
USE `Reservi` ;

-- -----------------------------------------------------
-- Table `Reservi`.`estado_habitación`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Reservi`.`estado_habitación` (
  `codigo_esthab` INT NOT NULL AUTO_INCREMENT,
  `nombre_esthab` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo_esthab`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Reservi`.`Habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Reservi`.`Habitacion` (
  `numero_habi` INT NOT NULL AUTO_INCREMENT,
  `tipo_habi` VARCHAR(45) NOT NULL,
  `ubicacion` VARCHAR(45) NOT NULL,
  `codigo_esthab` INT NOT NULL,
  PRIMARY KEY (`numero_habi`),
  INDEX `fk_Habitacion_estado_habitación1_idx` (`codigo_esthab` ASC) VISIBLE,
  CONSTRAINT `fk_Habitacion_estado_habitación1`
    FOREIGN KEY (`codigo_esthab`)
    REFERENCES `Reservi`.`estado_habitación` (`codigo_esthab`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Reservi`.`Huesped`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Reservi`.`Huesped` (
  `id_hue` INT NOT NULL AUTO_INCREMENT,
  `nombre_hue` VARCHAR(45) NOT NULL,
  `telefono_hue` VARCHAR(45) NOT NULL,
  `email_hue` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_hue`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Reservi`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Reservi`.`Usuario` (
  `id_usuario` INT NOT NULL,
  `nombre_usu` VARCHAR(45) NOT NULL,
  `contraseña_usu` VARCHAR(45) NOT NULL,
  `tipo_usu` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Reservi`.`estado_Reseva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Reservi`.`estado_Reseva` (
  `codigo_estReser` INT NOT NULL AUTO_INCREMENT,
  `nombre_estReser` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo_estReser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Reservi`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Reservi`.`Reserva` (
  `codigo_rese` INT NOT NULL AUTO_INCREMENT,
  `numero_habi` INT NOT NULL,
  `id_hue` INT NOT NULL,
  `fecha_reserva` DATETIME NOT NULL,
  `id_usuario` INT NOT NULL,
  `codigo_estReser` INT NOT NULL,
  PRIMARY KEY (`codigo_rese`),
  INDEX `reserva_habitacion_idx` (`numero_habi` ASC) VISIBLE,
  INDEX `reserva_huesped_idx` (`id_hue` ASC) VISIBLE,
  INDEX `reserva_usuario_idx` (`id_usuario` ASC) VISIBLE,
  INDEX `fk_Reserva_estado_Reseva1_idx` (`codigo_estReser` ASC) VISIBLE,
  CONSTRAINT `reserva_habitacion`
    FOREIGN KEY (`numero_habi`)
    REFERENCES `Reservi`.`Habitacion` (`numero_habi`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `reserva_huesped`
    FOREIGN KEY (`id_hue`)
    REFERENCES `Reservi`.`Huesped` (`id_hue`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `reserva_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `Reservi`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_estado_Reseva1`
    FOREIGN KEY (`codigo_estReser`)
    REFERENCES `Reservi`.`estado_Reseva` (`codigo_estReser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
