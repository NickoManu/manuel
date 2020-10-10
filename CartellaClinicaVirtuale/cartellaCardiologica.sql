-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema CartellaCardiologica
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `CartellaCardiologica` ;

-- -----------------------------------------------------
-- Schema CartellaCardiologica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CartellaCardiologica` DEFAULT CHARACTER SET utf8 ;
USE `CartellaCardiologica` ;

-- -----------------------------------------------------
-- Table `CartellaCardiologica`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CartellaCardiologica`.`user` ;

CREATE TABLE IF NOT EXISTS `CartellaCardiologica`.`user` (
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `ruolo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CartellaCardiologica`.`persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CartellaCardiologica`.`persona` ;

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
  `persona_codiceFiscale` VARCHAR(45) NOT NULL,
  `user_username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codiceFiscale`, `persona_codiceFiscale`, `user_username`),
  INDEX `fk_persona_persona1_idx` (`persona_codiceFiscale` ASC),
  INDEX `fk_persona_user1_idx` (`user_username` ASC),
  CONSTRAINT `fk_persona_persona1`
    FOREIGN KEY (`persona_codiceFiscale`)
    REFERENCES `CartellaCardiologica`.`persona` (`codiceFiscale`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_user1`
    FOREIGN KEY (`user_username`)
    REFERENCES `CartellaCardiologica`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CartellaCardiologica`.`cartella`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CartellaCardiologica`.`cartella` ;

CREATE TABLE IF NOT EXISTS `CartellaCardiologica`.`cartella` (
  `idCartella` VARCHAR(45) NULL,
  `persona_codiceFiscale` VARCHAR(45) NOT NULL,
  `persona_persona_codiceFiscale` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCartella`, `persona_codiceFiscale`, `persona_persona_codiceFiscale`),
  INDEX `fk_cartella_persona1_idx` (`persona_codiceFiscale` ASC, `persona_persona_codiceFiscale` ASC),
  CONSTRAINT `fk_cartella_persona1`
    FOREIGN KEY (`persona_codiceFiscale` , `persona_persona_codiceFiscale`)
    REFERENCES `CartellaCardiologica`.`persona` (`codiceFiscale` , `persona_codiceFiscale`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CartellaCardiologica`.`visita`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CartellaCardiologica`.`visita` ;

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
  `persona_codiceFiscale` VARCHAR(45) NOT NULL,
  `cartella_idCartella` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVisita`, `persona_codiceFiscale`, `cartella_idCartella`),
  INDEX `fk_visita_persona1_idx` (`persona_codiceFiscale` ASC),
  INDEX `fk_visita_cartella1_idx` (`cartella_idCartella` ASC),
  CONSTRAINT `fk_visita_persona1`
    FOREIGN KEY (`persona_codiceFiscale`)
    REFERENCES `CartellaCardiologica`.`persona` (`codiceFiscale`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_visita_cartella1`
    FOREIGN KEY (`cartella_idCartella`)
    REFERENCES `CartellaCardiologica`.`cartella` (`idCartella`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CartellaCardiologica`.`referto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CartellaCardiologica`.`referto` ;

CREATE TABLE IF NOT EXISTS `CartellaCardiologica`.`referto` (
  `idReferto` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NULL,
  `descrizione` VARCHAR(100) NULL,
  `file` BLOB NULL,
  `persona_codiceFiscale` VARCHAR(45) NOT NULL,
  `persona_persona_codiceFiscale` VARCHAR(45) NOT NULL,
  `cartella_idCartella` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idReferto`, `persona_codiceFiscale`, `persona_persona_codiceFiscale`, `cartella_idCartella`),
  INDEX `fk_referto_persona1_idx` (`persona_codiceFiscale` ASC, `persona_persona_codiceFiscale` ASC),
  INDEX `fk_referto_cartella1_idx` (`cartella_idCartella` ASC),
  CONSTRAINT `fk_referto_persona1`
    FOREIGN KEY (`persona_codiceFiscale` , `persona_persona_codiceFiscale`)
    REFERENCES `CartellaCardiologica`.`persona` (`codiceFiscale` , `persona_codiceFiscale`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_referto_cartella1`
    FOREIGN KEY (`cartella_idCartella`)
    REFERENCES `CartellaCardiologica`.`cartella` (`idCartella`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CartellaCardiologica`.`configurazioneRischio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CartellaCardiologica`.`configurazioneRischio` ;

CREATE TABLE IF NOT EXISTS `CartellaCardiologica`.`configurazioneRischio` (
  `idRischio` VARCHAR(45) NOT NULL,
  `sesso` VARCHAR(5) NULL,
  `etaMin` INT NULL,
  `etaMax` INT NULL,
  `diabete` TINYINT NULL,
  `fumo` TINYINT NULL,
  `pressioneMin` INT NULL,
  `pressioneMax` INT NULL,
  `colesteroloMin` INT NULL,
  `colesteroloMax` INT NULL,
  `percentuale` INT NULL,
  PRIMARY KEY (`idRischio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CartellaCardiologica`.`rischioCardiovascolare`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CartellaCardiologica`.`rischioCardiovascolare` ;

CREATE TABLE IF NOT EXISTS `CartellaCardiologica`.`rischioCardiovascolare` (
  `idRischioC` VARCHAR(45) NOT NULL,
  `colore` TINYINT NULL,
  `configurazioneRischio_idRischio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRischioC`, `configurazioneRischio_idRischio`),
  INDEX `fk_rischioCardiovascolare_configurazioneRischio1_idx` (`configurazioneRischio_idRischio` ASC),
  CONSTRAINT `fk_rischioCardiovascolare_configurazioneRischio1`
    FOREIGN KEY (`configurazioneRischio_idRischio`)
    REFERENCES `CartellaCardiologica`.`configurazioneRischio` (`idRischio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CartellaCardiologica`.`rischioCardiovascolare_has_cartella`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CartellaCardiologica`.`rischioCardiovascolare_has_cartella` ;

CREATE TABLE IF NOT EXISTS `CartellaCardiologica`.`rischioCardiovascolare_has_cartella` (
  `rischioCardiovascolare_idRischioC` VARCHAR(45) NOT NULL,
  `cartella_idCartella` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`rischioCardiovascolare_idRischioC`, `cartella_idCartella`),
  INDEX `fk_rischioCardiovascolare_has_cartella_cartella1_idx` (`cartella_idCartella` ASC),
  INDEX `fk_rischioCardiovascolare_has_cartella_rischioCardiovascola_idx` (`rischioCardiovascolare_idRischioC` ASC),
  CONSTRAINT `fk_rischioCardiovascolare_has_cartella_rischioCardiovascolare1`
    FOREIGN KEY (`rischioCardiovascolare_idRischioC`)
    REFERENCES `CartellaCardiologica`.`rischioCardiovascolare` (`idRischioC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rischioCardiovascolare_has_cartella_cartella1`
    FOREIGN KEY (`cartella_idCartella`)
    REFERENCES `CartellaCardiologica`.`cartella` (`idCartella`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `CartellaCardiologica`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `CartellaCardiologica`;
INSERT INTO `CartellaCardiologica`.`user` (`username`, `password`, `ruolo`) VALUES ('admin2', 'admin', 'admin');
INSERT INTO `CartellaCardiologica`.`user` (`username`, `password`, `ruolo`) VALUES ('luca_rossi', 'lucarossi01', 'paziente');
INSERT INTO `CartellaCardiologica`.`user` (`username`, `password`, `ruolo`) VALUES ('angelo_bianchi', 'angelobianchi', 'medico');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CartellaCardiologica`.`persona`
-- -----------------------------------------------------
START TRANSACTION;
USE `CartellaCardiologica`;
INSERT INTO `CartellaCardiologica`.`persona` (`codiceFiscale`, `nome`, `cognome`, `dataNascita`, `specializzazione`, `ospedale`, `indirizzo`, `telefono`, `e-mail`, `note`, `persona_codiceFiscale`, `user_username`) VALUES ('rsslca98t06h204s', 'Luca', 'Rossi', '1/1/1998', NULL, NULL, 'via dei Platani 2, Cesano Boscone (MI)', '3332220099', 'luca.rossi@prova.it', NULL, 'rsslca98t06h204s', 'luca_rossi');
INSERT INTO `CartellaCardiologica`.`persona` (`codiceFiscale`, `nome`, `cognome`, `dataNascita`, `specializzazione`, `ospedale`, `indirizzo`, `telefono`, `e-mail`, `note`, `persona_codiceFiscale`, `user_username`) VALUES ('bncngl68t06f354s', 'Angelo', 'Bianchi', '3/5/1968', 'cardiologia', 'San Carlo', 'via Verdi 45, Corsico (MI)', '1234567890', 'a.bianchi@sancarlo.it', NULL, 'bncngl68t06f354s', 'angelo_bianchi');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CartellaCardiologica`.`cartella`
-- -----------------------------------------------------
START TRANSACTION;
USE `CartellaCardiologica`;
INSERT INTO `CartellaCardiologica`.`cartella` (`idCartella`, `persona_codiceFiscale`, `persona_persona_codiceFiscale`) VALUES ('lr1', 'rsslca98t06h204s', 'rsslca98t06h204s');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CartellaCardiologica`.`visita`
-- -----------------------------------------------------
START TRANSACTION;
USE `CartellaCardiologica`;
INSERT INTO `CartellaCardiologica`.`visita` (`idVisita`, `data`, `anamnesi`, `motivoVisita`, `pressione`, `frequenzaCardiaca`, `peso`, `altezza`, `circonferenzaVita`, `persona_codiceFiscale`, `cartella_idCartella`) VALUES ('v1', '8/10/2020', 'familiare', 'visita cardiologica', 120, 20, 70, 1.70, 70, 'bncngl68t06f354s', 'lr1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CartellaCardiologica`.`referto`
-- -----------------------------------------------------
START TRANSACTION;
USE `CartellaCardiologica`;
INSERT INTO `CartellaCardiologica`.`referto` (`idReferto`, `nome`, `descrizione`, `file`, `persona_codiceFiscale`, `persona_persona_codiceFiscale`, `cartella_idCartella`) VALUES ('ref1', 'esame cuore', 'esame al cuore', NULL, 'bncngl68t06f354s', 'bncngl68t06f354s', 'lr1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CartellaCardiologica`.`configurazioneRischio`
-- -----------------------------------------------------
START TRANSACTION;
USE `CartellaCardiologica`;
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r1', 'donna', 60, 69, 1, 0, 170, 200, 130, 173, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r2', 'donna', 60, 69, 1, 0, 170, 200, 174, 212, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r3', 'donna', 60, 69, 1, 0, 170, 200, 213, 251, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r4', 'donna', 60, 69, 1, 0, 170, 200, 252, 290, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r5', 'donna', 60, 69, 1, 0, 170, 200, 291, 320, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r6', 'donna', 60, 69, 1, 0, 150, 169, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r7', 'donna', 60, 69, 1, 0, 150, 169, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r8', 'donna', 60, 69, 1, 0, 150, 169, 213, 251, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r9', 'donna', 60, 69, 1, 0, 150, 169, 252, 290, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r10', 'donna', 60, 69, 1, 0, 150, 169, 291, 320, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r11', 'donna', 60, 69, 1, 0, 130, 149, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r12', 'donna', 60, 69, 1, 0, 130, 149, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r13', 'donna', 60, 69, 1, 0, 130, 149, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r14', 'donna', 60, 69, 1, 0, 130, 149, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r15', 'donna', 60, 69, 1, 0, 130, 149, 291, 320, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r16', 'donna', 60, 69, 1, 0, 90, 129, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r17', 'donna', 60, 69, 1, 0, 90, 129, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r18', 'donna', 60, 69, 1, 0, 90, 129, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r19', 'donna', 60, 69, 1, 0, 90, 129, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r20', 'donna', 60, 69, 1, 0, 90, 129, 291, 320, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r21', 'donna', 50, 59, 1, 0, 170, 200, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r22', 'donna', 50, 59, 1, 0, 170, 200, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r23', 'donna', 50, 50, 1, 0, 170, 200, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r24', 'donna', 50, 59, 1, 0, 170, 200, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r25', 'donna', 50, 59, 1, 0, 170, 200, 291, 320, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r26', 'donna', 50, 59, 1, 0, 150, 169, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r27', 'donna', 50, 59, 1, 0, 150, 169, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r28', 'donna', 50, 59, 1, 0, 150, 169, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r29', 'donna', 50, 59, 1, 0, 150, 169, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r30', 'donna', 50, 59, 1, 0, 150, 169, 291, 320, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r31', 'donna', 50, 59, 1, 0, 130, 149, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r32', 'donna', 50, 59, 1, 0, 130, 149, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r33', 'donna', 50, 59, 1, 0, 130, 149, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r34', 'donna', 50, 59, 1, 0, 130, 149, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r35', 'donna', 50, 59, 1, 0, 130, 149, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r36', 'donna', 50, 59, 1, 0, 90, 129, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r37', 'donna', 50, 59, 1, 0, 90, 129, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r38', 'donna', 50, 59, 1, 0, 90, 129, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r39', 'donna', 50, 59, 1, 0, 90, 129, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r40', 'donna', 50, 59, 1, 0, 90, 129, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r41', 'donna', 40, 49, 1, 0, 170, 200, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r42', 'donna', 40, 49, 1, 0, 170, 200, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r43', 'donna', 40, 49, 1, 0, 170, 200, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r44', 'donna', 40, 49, 1, 0, 170, 200, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r45', 'donna', 40, 49, 1, 0, 170, 200, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r46', 'donna', 40, 49, 1, 0, 150, 169, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r47', 'donna', 40, 49, 1, 0, 150, 169, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r48', 'donna', 40, 49, 1, 0, 150, 169, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r49', 'donna', 40, 49, 1, 0, 150, 169, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r50', 'donna', 40, 49, 1, 0, 150, 169, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r51', 'donna', 40, 49, 1, 0, 130, 149, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r52', 'donna', 40, 49, 1, 0, 130, 149, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r53', 'donna', 40, 49, 1, 0, 130, 149, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r54', 'donna', 40, 49, 1, 0, 130, 149, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r55', 'donna', 40, 49, 1, 0, 130, 149, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r56', 'donna', 40, 49, 1, 0, 90, 129, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r57', 'donna', 40, 49, 1, 0, 90, 129, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r58', 'donna', 40, 49, 1, 0, 90, 129, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r59', 'donna', 40, 49, 1, 0, 90, 129, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r60', 'donna', 40, 49, 1, 0, 90, 129, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r61', 'donna', 60, 69, 1, 1, 170, 200, 130, 173, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r62', 'donna', 60, 69, 1, 1, 170, 200, 174, 212, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r63', 'donna', 60, 69, 1, 1, 170, 200, 213, 251, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r64', 'donna', 60, 69, 1, 1, 170, 200, 252, 290, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r65', 'donna', 60, 69, 1, 1, 170, 200, 291, 320, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r66', 'donna', 60, 69, 1, 1, 150, 169, 130, 173, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r67', 'donna', 60, 69, 1, 1, 150, 169, 174, 212, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r68', 'donna', 60, 69, 1, 1, 150, 169, 213, 251, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r69', 'donna', 60, 69, 1, 1, 150, 169, 252, 290, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r70', 'donna', 60, 69, 1, 1, 150, 169, 291, 320, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r71', 'donna', 60, 69, 1, 1, 130, 149, 130, 173, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r72', 'donna', 60, 69, 1, 1, 130, 149, 174, 212, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r73', 'donna', 60, 69, 1, 1, 130, 149, 213, 251, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r74', 'donna', 60, 69, 1, 1, 130, 149, 252, 290, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r75', 'donna', 60, 69, 1, 1, 130, 149, 291, 320, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r76', 'donna', 60, 69, 1, 1, 90, 129, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r77', 'donna', 60, 69, 1, 1, 90, 129, 174, 212, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r78', 'donna', 60, 69, 1, 1, 90, 129, 213, 251, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r79', 'donna', 60, 69, 1, 1, 90, 129, 252, 290, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r80', 'donna', 60, 69, 1, 1, 90, 129, 291, 320, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r81', 'donna', 50, 59, 1, 1, 170, 200, 130, 173, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r82', 'donna', 50, 59, 1, 1, 170, 200, 174, 212, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r83', 'donna', 50, 50, 1, 1, 170, 200, 213, 251, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r84', 'donna', 50, 59, 1, 1, 170, 200, 252, 290, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r85', 'donna', 50, 59, 1, 1, 170, 200, 291, 320, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r86', 'donna', 50, 59, 1, 1, 150, 169, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r87', 'donna', 50, 59, 1, 1, 150, 169, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r88', 'donna', 50, 59, 1, 1, 150, 169, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r89', 'donna', 50, 59, 1, 1, 150, 169, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r90', 'donna', 50, 59, 1, 1, 150, 169, 291, 320, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r91', 'donna', 50, 59, 1, 1, 130, 149, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r92', 'donna', 50, 59, 1, 1, 130, 149, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r93', 'donna', 50, 59, 1, 1, 130, 149, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r94', 'donna', 50, 59, 1, 1, 130, 149, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r95', 'donna', 50, 59, 1, 1, 130, 149, 291, 320, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r96', 'donna', 50, 59, 1, 1, 90, 129, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r97', 'donna', 50, 59, 1, 1, 90, 129, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r98', 'donna', 50, 59, 1, 1, 90, 129, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r99', 'donna', 50, 59, 1, 1, 90, 129, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r100', 'donna', 50, 59, 1, 1, 90, 129, 291, 320, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r101', 'donna', 40, 49, 1, 1, 170, 200, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r102', 'donna', 40, 49, 1, 1, 170, 200, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r103', 'donna', 40, 49, 1, 1, 170, 200, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r104', 'donna', 40, 49, 1, 1, 170, 200, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r105', 'donna', 40, 49, 1, 1, 170, 200, 291, 320, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r106', 'donna', 40, 49, 1, 1, 150, 169, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r107', 'donna', 40, 49, 1, 1, 150, 169, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r108', 'donna', 40, 49, 1, 1, 150, 169, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r109', 'donna', 40, 49, 1, 1, 150, 169, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r110', 'donna', 40, 49, 1, 1, 150, 169, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r111', 'donna', 40, 49, 1, 1, 130, 149, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r112', 'donna', 40, 49, 1, 1, 130, 149, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r113', 'donna', 40, 49, 1, 1, 130, 149, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r114', 'donna', 40, 49, 1, 1, 130, 149, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r115', 'donna', 40, 49, 1, 1, 130, 149, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r116', 'donna', 40, 49, 1, 1, 90, 129, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r117', 'donna', 40, 49, 1, 1, 90, 129, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r118', 'donna', 40, 49, 1, 1, 90, 129, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r119', 'donna', 40, 49, 1, 1, 90, 129, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r120', 'donna', 40, 49, 1, 1, 90, 129, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r121', 'donna', 60, 69, 0, 0, 170, 200, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r122', 'donna', 60, 69, 0, 0, 170, 200, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r123', 'donna', 60, 69, 0, 0, 170, 200, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r124', 'donna', 60, 69, 0, 0, 170, 200, 252, 290, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r125', 'donna', 60, 69, 0, 0, 170, 200, 291, 320, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r126', 'donna', 60, 69, 0, 0, 150, 169, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r127', 'donna', 60, 69, 0, 0, 150, 169, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r128', 'donna', 60, 69, 0, 0, 150, 169, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r129', 'donna', 60, 69, 0, 0, 150, 169, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r130', 'donna', 60, 69, 0, 0, 150, 169, 291, 320, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r131', 'donna', 60, 69, 0, 0, 130, 149, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r132', 'donna', 60, 69, 0, 0, 130, 149, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r133', 'donna', 60, 69, 0, 0, 130, 149, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r134', 'donna', 60, 69, 0, 0, 130, 149, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r135', 'donna', 60, 69, 0, 0, 130, 149, 291, 320, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r136', 'donna', 60, 69, 0, 0, 90, 129, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r137', 'donna', 60, 69, 0, 0, 90, 129, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r138', 'donna', 60, 69, 0, 0, 90, 129, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r139', 'donna', 60, 69, 0, 0, 90, 129, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r140', 'donna', 60, 69, 0, 0, 90, 129, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r141', 'donna', 50, 59, 0, 0, 170, 200, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r142', 'donna', 50, 59, 0, 0, 170, 200, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r143', 'donna', 50, 50, 0, 0, 170, 200, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r144', 'donna', 50, 59, 0, 0, 170, 200, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r145', 'donna', 50, 59, 0, 0, 170, 200, 291, 320, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r146', 'donna', 50, 59, 0, 0, 150, 169, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r147', 'donna', 50, 59, 0, 0, 150, 169, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r148', 'donna', 50, 59, 0, 0, 150, 169, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r149', 'donna', 50, 59, 0, 0, 150, 169, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r150', 'donna', 50, 59, 0, 0, 150, 169, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r151', 'donna', 50, 59, 0, 0, 130, 149, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r152', 'donna', 50, 59, 0, 0, 130, 149, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r153', 'donna', 50, 59, 0, 0, 130, 149, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r154', 'donna', 50, 59, 0, 0, 130, 149, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r155', 'donna', 50, 59, 0, 0, 130, 149, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r156', 'donna', 50, 59, 0, 0, 90, 129, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r157', 'donna', 50, 59, 0, 0, 90, 129, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r158', 'donna', 50, 59, 0, 0, 90, 129, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r159', 'donna', 50, 59, 0, 0, 90, 129, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r160', 'donna', 50, 59, 0, 0, 90, 129, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r161', 'donna', 40, 49, 0, 0, 170, 200, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r162', 'donna', 40, 49, 0, 0, 170, 200, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r163', 'donna', 40, 49, 0, 0, 170, 200, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r164', 'donna', 40, 49, 0, 0, 170, 200, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r165', 'donna', 40, 49, 0, 0, 170, 200, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r166', 'donna', 40, 49, 0, 0, 150, 169, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r167', 'donna', 40, 49, 0, 0, 150, 169, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r168', 'donna', 40, 49, 0, 0, 150, 169, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r169', 'donna', 40, 49, 0, 0, 150, 169, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r170', 'donna', 40, 49, 0, 0, 150, 169, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r171', 'donna', 40, 49, 0, 0, 130, 149, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r172', 'donna', 40, 49, 0, 0, 130, 149, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r173', 'donna', 40, 49, 0, 0, 130, 149, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r174', 'donna', 40, 49, 0, 0, 130, 149, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r175', 'donna', 40, 49, 0, 0, 130, 149, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r176', 'donna', 40, 49, 0, 0, 90, 129, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r177', 'donna', 40, 49, 0, 0, 90, 129, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r178', 'donna', 40, 49, 0, 0, 90, 129, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r179', 'donna', 40, 49, 0, 0, 90, 129, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r180', 'donna', 40, 49, 0, 0, 90, 129, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r181', 'donna', 60, 69, 0, 1, 170, 200, 130, 173, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r182', 'donna', 60, 69, 0, 1, 170, 200, 174, 212, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r183', 'donna', 60, 69, 0, 1, 170, 200, 213, 251, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r184', 'donna', 60, 69, 0, 1, 170, 200, 252, 290, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r185', 'donna', 60, 69, 0, 1, 170, 200, 291, 320, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r186', 'donna', 60, 69, 0, 1, 150, 169, 130, 173, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r187', 'donna', 60, 69, 0, 1, 150, 169, 174, 212, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r188', 'donna', 60, 69, 0, 1, 150, 169, 213, 251, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r189', 'donna', 60, 69, 0, 1, 150, 169, 252, 290, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r190', 'donna', 60, 69, 0, 1, 150, 169, 291, 320, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r191', 'donna', 60, 69, 0, 1, 130, 149, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r192', 'donna', 60, 69, 0, 1, 130, 149, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r193', 'donna', 60, 69, 0, 1, 130, 149, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r194', 'donna', 60, 69, 0, 1, 130, 149, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r195', 'donna', 60, 69, 0, 1, 130, 149, 291, 320, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r196', 'donna', 60, 69, 0, 1, 90, 129, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r197', 'donna', 60, 69, 0, 1, 90, 129, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r198', 'donna', 60, 69, 0, 1, 90, 129, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r199', 'donna', 60, 69, 0, 1, 90, 129, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r200', 'donna', 60, 69, 0, 1, 90, 129, 291, 320, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r201', 'donna', 50, 59, 0, 1, 170, 200, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r202', 'donna', 50, 59, 0, 1, 170, 200, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r203', 'donna', 50, 50, 0, 1, 170, 200, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r204', 'donna', 50, 59, 0, 1, 170, 200, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r205', 'donna', 50, 59, 0, 1, 170, 200, 291, 320, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r206', 'donna', 50, 59, 0, 1, 150, 169, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r207', 'donna', 50, 59, 0, 1, 150, 169, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r208', 'donna', 50, 59, 0, 1, 150, 169, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r209', 'donna', 50, 59, 0, 1, 150, 169, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r210', 'donna', 50, 59, 0, 1, 150, 169, 291, 320, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r211', 'donna', 50, 59, 0, 1, 130, 149, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r212', 'donna', 50, 59, 0, 1, 130, 149, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r213', 'donna', 50, 59, 0, 1, 130, 149, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r214', 'donna', 50, 59, 0, 1, 130, 149, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r215', 'donna', 50, 59, 0, 1, 130, 149, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r216', 'donna', 50, 59, 0, 1, 90, 129, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r217', 'donna', 50, 59, 0, 1, 90, 129, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r218', 'donna', 50, 59, 0, 1, 90, 129, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r219', 'donna', 50, 59, 0, 1, 90, 129, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r220', 'donna', 50, 59, 0, 1, 90, 129, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r221', 'donna', 40, 49, 0, 1, 170, 200, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r222', 'donna', 40, 49, 0, 1, 170, 200, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r223', 'donna', 40, 49, 0, 1, 170, 200, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r224', 'donna', 40, 49, 0, 1, 170, 200, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r225', 'donna', 40, 49, 0, 1, 170, 200, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r226', 'donna', 40, 49, 0, 1, 150, 169, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r227', 'donna', 40, 49, 0, 1, 150, 169, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r228', 'donna', 40, 49, 0, 1, 150, 169, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r229', 'donna', 40, 49, 0, 1, 150, 169, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r230', 'donna', 40, 49, 0, 1, 150, 169, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r231', 'donna', 40, 49, 0, 1, 130, 149, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r232', 'donna', 40, 49, 0, 1, 130, 149, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r233', 'donna', 40, 49, 0, 1, 130, 149, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r234', 'donna', 40, 49, 0, 1, 130, 149, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r235', 'donna', 40, 49, 0, 1, 130, 149, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r236', 'donna', 40, 49, 0, 1, 90, 129, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r237', 'donna', 40, 49, 0, 1, 90, 129, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r238', 'donna', 40, 49, 0, 1, 90, 129, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r239', 'donna', 40, 49, 0, 1, 90, 129, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r240', 'donna', 40, 49, 0, 1, 90, 129, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r241', 'uomo', 60, 69, 1, 0, 170, 200, 130, 173, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r242', 'uomo', 60, 69, 1, 0, 170, 200, 174, 212, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r243', 'uomo', 60, 69, 1, 0, 170, 200, 213, 251, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r244', 'uomo', 60, 69, 1, 0, 170, 200, 252, 290, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r245', 'uomo', 60, 69, 1, 0, 170, 200, 291, 320, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r246', 'uomo', 60, 69, 1, 0, 150, 169, 130, 173, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r247', 'uomo', 60, 69, 1, 0, 150, 169, 174, 212, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r248', 'uomo', 60, 69, 1, 0, 150, 169, 213, 251, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r249', 'uomo', 60, 69, 1, 0, 150, 169, 252, 290, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r250', 'uomo', 60, 69, 1, 0, 150, 169, 291, 320, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r251', 'uomo', 60, 69, 1, 0, 130, 149, 130, 173, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r252', 'uomo', 60, 69, 1, 0, 130, 149, 174, 212, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r253', 'uomo', 60, 69, 1, 0, 130, 149, 213, 251, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r254', 'uomo', 60, 69, 1, 0, 130, 149, 252, 290, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r255', 'uomo', 60, 69, 1, 0, 130, 149, 291, 320, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r256', 'uomo', 60, 69, 1, 0, 90, 129, 130, 173, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r257', 'uomo', 60, 69, 1, 0, 90, 129, 174, 212, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r258', 'uomo', 60, 69, 1, 0, 90, 129, 213, 251, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r259', 'uomo', 60, 69, 1, 0, 90, 129, 252, 290, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r260', 'uomo', 60, 69, 1, 0, 90, 129, 291, 320, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r261', 'uomo', 50, 59, 1, 0, 170, 200, 130, 173, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r262', 'uomo', 50, 59, 1, 0, 170, 200, 174, 212, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r263', 'uomo', 50, 50, 1, 0, 170, 200, 213, 251, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r264', 'uomo', 50, 59, 1, 0, 170, 200, 252, 290, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r265', 'uomo', 50, 59, 1, 0, 170, 200, 291, 320, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r266', 'uomo', 50, 59, 1, 0, 150, 169, 130, 173, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r267', 'uomo', 50, 59, 1, 0, 150, 169, 174, 212, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r268', 'uomo', 50, 59, 1, 0, 150, 169, 213, 251, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r269', 'uomo', 50, 59, 1, 0, 150, 169, 252, 290, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r270', 'uomo', 50, 59, 1, 0, 150, 169, 291, 320, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r271', 'uomo', 50, 59, 1, 0, 130, 149, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r272', 'uomo', 50, 59, 1, 0, 130, 149, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r273', 'uomo', 50, 59, 1, 0, 130, 149, 213, 251, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r274', 'uomo', 50, 59, 1, 0, 130, 149, 252, 290, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r275', 'uomo', 50, 59, 1, 0, 130, 149, 291, 320, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r276', 'uomo', 50, 59, 1, 0, 90, 129, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r277', 'uomo', 50, 59, 1, 0, 90, 129, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r278', 'uomo', 50, 59, 1, 0, 90, 129, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r279', 'uomo', 50, 59, 1, 0, 90, 129, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r280', 'uomo', 50, 59, 1, 0, 90, 129, 291, 320, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r281', 'uomo', 40, 49, 1, 0, 170, 200, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r282', 'uomo', 40, 49, 1, 0, 170, 200, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r283', 'uomo', 40, 49, 1, 0, 170, 200, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r284', 'uomo', 40, 49, 1, 0, 170, 200, 252, 290, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r285', 'uomo', 40, 49, 1, 0, 170, 200, 291, 320, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r286', 'uomo', 40, 49, 1, 0, 150, 169, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r287', 'uomo', 40, 49, 1, 0, 150, 169, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r288', 'uomo', 40, 49, 1, 0, 150, 169, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r289', 'uomo', 40, 49, 1, 0, 150, 169, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r290', 'uomo', 40, 49, 1, 0, 150, 169, 291, 320, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r291', 'uomo', 40, 49, 1, 0, 130, 149, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r292', 'uomo', 40, 49, 1, 0, 130, 149, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r293', 'uomo', 40, 49, 1, 0, 130, 149, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r294', 'uomo', 40, 49, 1, 0, 130, 149, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r295', 'uomo', 40, 49, 1, 0, 130, 149, 291, 320, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r296', 'uomo', 40, 49, 1, 0, 90, 129, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r297', 'uomo', 40, 49, 1, 0, 90, 129, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r298', 'uomo', 40, 49, 1, 0, 90, 129, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r299', 'uomo', 40, 49, 1, 0, 90, 129, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r300', 'uomo', 40, 49, 1, 0, 90, 129, 291, 320, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r301', 'uomo', 60, 69, 1, 1, 170, 200, 130, 173, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r302', 'uomo', 60, 69, 1, 1, 170, 200, 174, 212, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r303', 'uomo', 60, 69, 1, 1, 170, 200, 213, 251, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r304', 'uomo', 60, 69, 1, 1, 170, 200, 252, 290, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r305', 'uomo', 60, 69, 1, 1, 170, 200, 291, 320, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r306', 'uomo', 60, 69, 1, 1, 150, 169, 130, 173, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r307', 'uomo', 60, 69, 1, 1, 150, 169, 174, 212, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r038', 'uomo', 60, 69, 1, 1, 150, 169, 213, 251, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r309', 'uomo', 60, 69, 1, 1, 150, 169, 252, 290, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r310', 'uomo', 60, 69, 1, 1, 150, 169, 291, 320, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r311', 'uomo', 60, 69, 1, 1, 130, 149, 130, 173, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r312', 'uomo', 60, 69, 1, 1, 130, 149, 174, 212, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r313', 'uomo', 60, 69, 1, 1, 130, 149, 213, 251, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r314', 'uomo', 60, 69, 1, 1, 130, 149, 252, 290, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r315', 'uomo', 60, 69, 1, 1, 130, 149, 291, 320, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r316', 'uomo', 60, 69, 1, 1, 90, 129, 130, 173, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r317', 'uomo', 60, 69, 1, 1, 90, 129, 174, 212, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r318', 'uomo', 60, 69, 1, 1, 90, 129, 213, 251, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r319', 'uomo', 60, 69, 1, 1, 90, 129, 252, 290, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r320', 'uomo', 60, 69, 1, 1, 90, 129, 291, 320, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r321', 'uomo', 50, 59, 1, 1, 170, 200, 130, 173, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r322', 'uomo', 50, 59, 1, 1, 170, 200, 174, 212, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r323', 'uomo', 50, 50, 1, 1, 170, 200, 213, 251, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r324', 'uomo', 50, 59, 1, 1, 170, 200, 252, 290, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r325', 'uomo', 50, 59, 1, 1, 170, 200, 291, 320, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r326', 'uomo', 50, 59, 1, 1, 150, 169, 130, 173, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r327', 'uomo', 50, 59, 1, 1, 150, 169, 174, 212, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r328', 'uomo', 50, 59, 1, 1, 150, 169, 213, 251, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r329', 'uomo', 50, 59, 1, 1, 150, 169, 252, 290, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r330', 'uomo', 50, 59, 1, 1, 150, 169, 291, 320, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r331', 'uomo', 50, 59, 1, 1, 130, 149, 130, 173, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r332', 'uomo', 50, 59, 1, 1, 130, 149, 174, 212, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r333', 'uomo', 50, 59, 1, 1, 130, 149, 213, 251, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r334', 'uomo', 50, 59, 1, 1, 130, 149, 252, 290, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r335', 'uomo', 50, 59, 1, 1, 130, 149, 291, 320, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r336', 'uomo', 50, 59, 1, 1, 90, 129, 130, 173, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r337', 'uomo', 50, 59, 1, 1, 90, 129, 174, 212, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r338', 'uomo', 50, 59, 1, 1, 90, 129, 213, 251, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r339', 'uomo', 50, 59, 1, 1, 90, 129, 252, 290, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r340', 'uomo', 50, 59, 1, 1, 90, 129, 291, 320, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r341', 'uomo', 40, 49, 1, 1, 170, 200, 130, 173, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r342', 'uomo', 40, 49, 1, 1, 170, 200, 174, 212, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r343', 'uomo', 40, 49, 1, 1, 170, 200, 213, 251, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r344', 'uomo', 40, 49, 1, 1, 170, 200, 252, 290, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r345', 'uomo', 40, 49, 1, 1, 170, 200, 291, 320, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r346', 'uomo', 40, 49, 1, 1, 150, 169, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r3047', 'uomo', 40, 49, 1, 1, 150, 169, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r348', 'uomo', 40, 49, 1, 1, 150, 169, 213, 251, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r349', 'uomo', 40, 49, 1, 1, 150, 169, 252, 290, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r350', 'uomo', 40, 49, 1, 1, 150, 169, 291, 320, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r351', 'uomo', 40, 49, 1, 1, 130, 149, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r352', 'uomo', 40, 49, 1, 1, 130, 149, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r353', 'uomo', 40, 49, 1, 1, 130, 149, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r354', 'uomo', 40, 49, 1, 1, 130, 149, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r355', 'uomo', 40, 49, 1, 1, 130, 149, 291, 320, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r356', 'uomo', 40, 49, 1, 1, 90, 129, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r357', 'uomo', 40, 49, 1, 1, 90, 129, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r358', 'uomo', 40, 49, 1, 1, 90, 129, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r359', 'uomo', 40, 49, 1, 1, 90, 129, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r360', 'uomo', 40, 49, 1, 1, 90, 129, 291, 320, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r361', 'uomo', 60, 69, 0, 0, 170, 200, 130, 173, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r362', 'uomo', 60, 69, 0, 0, 170, 200, 174, 212, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r363', 'uomo', 60, 69, 0, 0, 170, 200, 213, 251, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r364', 'uomo', 60, 69, 0, 0, 170, 200, 252, 290, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r365', 'uomo', 60, 69, 0, 0, 170, 200, 291, 320, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r366', 'uomo', 60, 69, 0, 0, 150, 169, 130, 173, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r367', 'uomo', 60, 69, 0, 0, 150, 169, 174, 212, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r368', 'uomo', 60, 69, 0, 0, 150, 169, 213, 251, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r369', 'uomo', 60, 69, 0, 0, 150, 169, 252, 290, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r370', 'uomo', 60, 69, 0, 0, 150, 169, 291, 320, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r371', 'uomo', 60, 69, 0, 0, 130, 149, 130, 173, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r372', 'uomo', 60, 69, 0, 0, 130, 149, 174, 212, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r373', 'uomo', 60, 69, 0, 0, 130, 149, 213, 251, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r374', 'uomo', 60, 69, 0, 0, 130, 149, 252, 290, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r375', 'uomo', 60, 69, 0, 0, 130, 149, 291, 320, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r376', 'uomo', 60, 69, 0, 0, 90, 129, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r377', 'uomo', 60, 69, 0, 0, 90, 129, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r378', 'uomo', 60, 69, 0, 0, 90, 129, 213, 251, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r379', 'uomo', 60, 69, 0, 0, 90, 129, 252, 290, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r380', 'uomo', 60, 69, 0, 0, 90, 129, 291, 320, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r381', 'uomo', 50, 59, 0, 0, 170, 200, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r382', 'uomo', 50, 59, 0, 0, 170, 200, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r383', 'uomo', 50, 50, 0, 0, 170, 200, 213, 251, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r384', 'uomo', 50, 59, 0, 0, 170, 200, 252, 290, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r385', 'uomo', 50, 59, 0, 0, 170, 200, 291, 320, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r386', 'uomo', 50, 59, 0, 0, 150, 169, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r387', 'uomo', 50, 59, 0, 0, 150, 169, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r388', 'uomo', 50, 59, 0, 0, 150, 169, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r389', 'uomo', 50, 59, 0, 0, 150, 169, 252, 290, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r390', 'uomo', 50, 59, 0, 0, 150, 169, 291, 320, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r391', 'uomo', 50, 59, 0, 0, 130, 149, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r392', 'uomo', 50, 59, 0, 0, 130, 149, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r393', 'uomo', 50, 59, 0, 0, 130, 149, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r394', 'uomo', 50, 59, 0, 0, 130, 149, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r395', 'uomo', 50, 59, 0, 0, 130, 149, 291, 320, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r396', 'uomo', 50, 59, 0, 0, 90, 129, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r397', 'uomo', 50, 59, 0, 0, 90, 129, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r398', 'uomo', 50, 59, 0, 0, 90, 129, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r399', 'uomo', 50, 59, 0, 0, 90, 129, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r400', 'uomo', 50, 59, 0, 0, 90, 129, 291, 320, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r401', 'uomo', 40, 49, 0, 0, 170, 200, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r402', 'uomo', 40, 49, 0, 0, 170, 200, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r403', 'uomo', 40, 49, 0, 0, 170, 200, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r404', 'uomo', 40, 49, 0, 0, 170, 200, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r405', 'uomo', 40, 49, 0, 0, 170, 200, 291, 320, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r406', 'uomo', 40, 49, 0, 0, 150, 169, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r407', 'uomo', 40, 49, 0, 0, 150, 169, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r408', 'uomo', 40, 49, 0, 0, 150, 169, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r409', 'uomo', 40, 49, 0, 0, 150, 169, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r410', 'uomo', 40, 49, 0, 0, 150, 169, 291, 320, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r411', 'uomo', 40, 49, 0, 0, 130, 149, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r412', 'uomo', 40, 49, 0, 0, 130, 149, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r413', 'uomo', 40, 49, 0, 0, 130, 149, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r414', 'uomo', 40, 49, 0, 0, 130, 149, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r415', 'uomo', 40, 49, 0, 0, 130, 149, 291, 320, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r416', 'uomo', 40, 49, 0, 0, 90, 129, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r417', 'uomo', 40, 49, 0, 0, 90, 129, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r418', 'uomo', 40, 49, 0, 0, 90, 129, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r419', 'uomo', 40, 49, 0, 0, 90, 129, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r420', 'uomo', 40, 49, 0, 0, 90, 129, 291, 320, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r421', 'uomo', 60, 69, 0, 1, 170, 200, 130, 173, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r422', 'uomo', 60, 69, 0, 1, 170, 200, 174, 212, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r423', 'uomo', 60, 69, 0, 1, 170, 200, 213, 251, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r424', 'uomo', 60, 69, 0, 1, 170, 200, 252, 290, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r425', 'uomo', 60, 69, 0, 1, 170, 200, 291, 320, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r426', 'uomo', 60, 69, 0, 1, 150, 169, 130, 173, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r427', 'uomo', 60, 69, 0, 1, 150, 169, 174, 212, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r428', 'uomo', 60, 69, 0, 1, 150, 169, 213, 251, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r429', 'uomo', 60, 69, 0, 1, 150, 169, 252, 290, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r430', 'uomo', 60, 69, 0, 1, 150, 169, 291, 320, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r431', 'uomo', 60, 69, 0, 1, 130, 149, 130, 173, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r432', 'uomo', 60, 69, 0, 1, 130, 149, 174, 212, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r433', 'uomo', 60, 69, 0, 1, 130, 149, 213, 251, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r434', 'uomo', 60, 69, 0, 1, 130, 149, 252, 290, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r435', 'uomo', 60, 69, 0, 1, 130, 149, 291, 320, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r436', 'uomo', 60, 69, 0, 1, 90, 129, 130, 173, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r437', 'uomo', 60, 69, 0, 1, 90, 129, 174, 212, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r438', 'uomo', 60, 69, 0, 1, 90, 129, 213, 251, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r439', 'uomo', 60, 69, 0, 1, 90, 129, 252, 290, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r440', 'uomo', 60, 69, 0, 1, 90, 129, 291, 320, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r441', 'uomo', 50, 59, 0, 1, 170, 200, 130, 173, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r442', 'uomo', 50, 59, 0, 1, 170, 200, 174, 212, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r443', 'uomo', 50, 50, 0, 1, 170, 200, 213, 251, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r444', 'uomo', 50, 59, 0, 1, 170, 200, 252, 290, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r445', 'uomo', 50, 59, 0, 1, 170, 200, 291, 320, 31);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r446', 'uomo', 50, 59, 0, 1, 150, 169, 130, 173, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r447', 'uomo', 50, 59, 0, 1, 150, 169, 174, 212, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r448', 'uomo', 50, 59, 0, 1, 150, 169, 213, 251, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r449', 'uomo', 50, 59, 0, 1, 150, 169, 252, 290, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r450', 'uomo', 50, 59, 0, 1, 150, 169, 291, 320, 30);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r451', 'uomo', 50, 59, 0, 1, 130, 149, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r452', 'uomo', 50, 59, 0, 1, 130, 149, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r453', 'uomo', 50, 59, 0, 1, 130, 149, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r454', 'uomo', 50, 59, 0, 1, 130, 149, 252, 290, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r455', 'uomo', 50, 59, 0, 1, 130, 149, 291, 320, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r456', 'uomo', 50, 59, 0, 1, 90, 129, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r457', 'uomo', 50, 59, 0, 1, 90, 129, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r458', 'uomo', 50, 59, 0, 1, 90, 129, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r459', 'uomo', 50, 59, 0, 1, 90, 129, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r460', 'uomo', 50, 59, 0, 1, 90, 129, 291, 320, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r461', 'uomo', 40, 49, 0, 1, 170, 200, 130, 173, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r462', 'uomo', 40, 49, 0, 1, 170, 200, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r463', 'uomo', 40, 49, 0, 1, 170, 200, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r464', 'uomo', 40, 49, 0, 1, 170, 200, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r465', 'uomo', 40, 49, 0, 1, 170, 200, 291, 320, 20);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r466', 'uomo', 40, 49, 0, 1, 150, 169, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r467', 'uomo', 40, 49, 0, 1, 150, 169, 174, 212, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r468', 'uomo', 40, 49, 0, 1, 150, 169, 213, 251, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r469', 'uomo', 40, 49, 0, 1, 150, 169, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r470', 'uomo', 40, 49, 0, 1, 150, 169, 291, 320, 15);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r471', 'uomo', 40, 49, 0, 1, 130, 149, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r472', 'uomo', 40, 49, 0, 1, 130, 149, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r473', 'uomo', 40, 49, 0, 1, 130, 149, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r474', 'uomo', 40, 49, 0, 1, 130, 149, 252, 290, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r475', 'uomo', 40, 49, 0, 1, 130, 149, 291, 320, 10);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r476', 'uomo', 40, 49, 0, 1, 90, 129, 130, 173, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r477', 'uomo', 40, 49, 0, 1, 90, 129, 174, 212, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r478', 'uomo', 40, 49, 0, 1, 90, 129, 213, 251, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r479', 'uomo', 40, 49, 0, 1, 90, 129, 252, 290, 5);
INSERT INTO `CartellaCardiologica`.`configurazioneRischio` (`idRischio`, `sesso`, `etaMin`, `etaMax`, `diabete`, `fumo`, `pressioneMin`, `pressioneMax`, `colesteroloMin`, `colesteroloMax`, `percentuale`) VALUES ('r480', 'uomo', 40, 49, 0, 1, 90, 129, 291, 320, 10);

COMMIT;

