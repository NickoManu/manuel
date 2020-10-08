-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema CartellaCardiologica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CartellaCardiologica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CartellaCardiologica` DEFAULT CHARACTER SET utf8 ;
USE `CartellaCardiologica` ;

-- -----------------------------------------------------
-- Table `CartellaCardiologica`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CartellaCardiologica`.`user` (
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `ruolo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CartellaCardiologica`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CartellaCardiologica`.`persona` (
  `codiceFiscale` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cognome` VARCHAR(45) NOT NULL,
  `dataNascita` DATE NULL,
  `specializzazione` VARCHAR(45) NULL,
  `ospedale` VARCHAR(45) NULL,
  `indirizzo` VARCHAR(100) NULL,
  `telefono` VARCHAR(20) NULL,
  `e-mail` VARCHAR(100) NULL,
  `note` VARCHAR(200) NULL,
  PRIMARY KEY (`codiceFiscale`),
  CONSTRAINT `username`
    FOREIGN KEY ()
    REFERENCES `CartellaCardiologica`.`user` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CartellaCardiologica`.`cartella`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CartellaCardiologica`.`cartella` (
  `idCartella` VARCHAR(45) NULL,
  PRIMARY KEY (`idCartella`),
  CONSTRAINT `codiceFiscale`
    FOREIGN KEY ()
    REFERENCES `CartellaCardiologica`.`persona` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CartellaCardiologica`.`visita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CartellaCardiologica`.`visita` (
  `idVisita` VARCHAR(45) NOT NULL,
  `data` DATE NULL,
  `anamnesi` VARCHAR(45) NULL,
  `motivoVisita` VARCHAR(100) NULL,
  `pressione` DOUBLE NULL,
  `frequenzaCardiaca` DOUBLE NULL,
  `peso` DOUBLE NULL,
  `altezza` DOUBLE NULL,
  `circonferenzaVita` DOUBLE NULL,
  PRIMARY KEY (`idVisita`),
  CONSTRAINT `codiceFiscale`
    FOREIGN KEY ()
    REFERENCES `CartellaCardiologica`.`persona` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCartella`
    FOREIGN KEY ()
    REFERENCES `CartellaCardiologica`.`cartella` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CartellaCardiologica`.`referto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CartellaCardiologica`.`referto` (
  `idReferto` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NULL,
  `descrizione` VARCHAR(100) NULL,
  `file` BLOB NULL,
  PRIMARY KEY (`idReferto`),
  CONSTRAINT `codiceFiscale`
    FOREIGN KEY ()
    REFERENCES `CartellaCardiologica`.`persona` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCartella`
    FOREIGN KEY ()
    REFERENCES `CartellaCardiologica`.`cartella` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CartellaCardiologica`.`configurazioneRischio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CartellaCardiologica`.`configurazioneRischio` (
  `idRischio` VARCHAR(45) NOT NULL,
  `eta` INT NULL,
  `pressioneArteriosaSitolica` INT NULL,
  `colesterolemiaTotale` INT NULL,
  `colesterolemiaHDL` INT NULL,
  `LDL` INT NULL,
  `glicemia` INT NULL,
  `indiceMassaCorporea` INT NULL,
  `circonferenzaVita` INT NULL,
  `ipertensione` INT NULL,
  `ipercolesterolemia` INT NULL,
  `diabete` INT NULL,
  `abitudineAlFumo` INT NULL,
  `sovrappeso` INT NULL,
  `obesita` INT NULL,
  `inattivitaFisicaTempoLibero` INT NULL,
  `inattivitaFisicaAlLavoro` INT NULL,
  `rischioCardiovascolare10_19` INT NULL,
  `rischioCardiovascolare20` INT NULL,
  PRIMARY KEY (`idRischio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CartellaCardiologica`.`rischioCardiovascolare`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CartellaCardiologica`.`rischioCardiovascolare` (
  `idRischioC` VARCHAR(45) NOT NULL,
  `colore` TINYINT NULL,
  PRIMARY KEY (`idRischioC`),
  CONSTRAINT `idRischio`
    FOREIGN KEY ()
    REFERENCES `CartellaCardiologica`.`configurazioneRischio` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCartella`
    FOREIGN KEY ()
    REFERENCES `CartellaCardiologica`.`cartella` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
