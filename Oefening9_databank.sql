-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Mutaties`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mutaties` (
  `idMutaties` INT NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `chromosome` VARCHAR(45) NULL,
  `start` INT NULL,
  `end` INT NULL,
  `Beschrijving_gen` TEXT NULL,
  PRIMARY KEY (`idMutaties`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `idPatient` INT NOT NULL,
  `Patient_name` VARCHAR(45) NULL,
  `Patient_syndrome` VARCHAR(45) NULL,
  `Geslacht` ENUM('Man', 'Vrouw') NULL,
  `Patient_leeftijd` INT NULL,
  `Beschrijving_syndroom` TEXT NULL,
  PRIMARY KEY (`idPatient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient_mutaties`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient_mutaties` (
  `idPatient_mutaties` INT NOT NULL,
  `idPatient` INT NULL,
  `idMutaties` INT NULL,
  PRIMARY KEY (`idPatient_mutaties`),
  INDEX `fk_Patient_mutaties_1_idx` (`idMutaties` ASC),
  INDEX `fk_Patient_mutaties_2_idx` (`idPatient` ASC),
  CONSTRAINT `fk_Patient_mutaties_1`
    FOREIGN KEY (`idMutaties`)
    REFERENCES `mydb`.`Mutaties` (`idMutaties`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_mutaties_2`
    FOREIGN KEY (`idPatient`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
