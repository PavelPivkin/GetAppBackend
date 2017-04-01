SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Client` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `clientId` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NULL,
  `patronomyc` VARCHAR(45) NULL,
  `email` VARCHAR(60) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `address` VARCHAR(120) NULL,
  `photo` BINARY NULL,
  PRIMARY KEY (`clientId`),
  UNIQUE INDEX `UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Card`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Card` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Card` (
  `cardId` INT NOT NULL,
  `clientId` INT NOT NULL,
  `balance` INT NULL,
  `holderName` VARCHAR(80) NULL,
  `expireDate` DATETIME NULL,
  `openDate` DATETIME NULL,
  `pan` VARCHAR(45) NULL,
  `paymentSystem` VARCHAR(45) NULL,
  `product` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`cardId`),
  INDEX `fk_Card_1_idx` (`clientId` ASC),
  CONSTRAINT `fk_Card_1`
    FOREIGN KEY (`clientId`)
    REFERENCES `mydb`.`Client` (`clientId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Operation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Operation` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Operation` (
  `operationId` INT NOT NULL,
  `clientId` INT NOT NULL,
  `odate` DATETIME NULL,
  `type` VARCHAR(45) NULL,
  `amount` INT NULL,
  `description` VARCHAR(80) NULL,
  PRIMARY KEY (`operationId`),
  INDEX `fk_Operation_1_idx` (`clientId` ASC),
  CONSTRAINT `fk_Operation_1`
    FOREIGN KEY (`clientId`)
    REFERENCES `mydb`.`Client` (`clientId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GroupOperations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`GroupOperations` ;

CREATE TABLE IF NOT EXISTS `mydb`.`GroupOperations` (
  `groupOperationsId` INT NOT NULL,
  `groupId` INT NOT NULL,
  PRIMARY KEY (`groupOperationsId`),
  INDEX `fk_GroupOperations_1_idx` (`groupId` ASC),
  CONSTRAINT `fk_GroupOperations_1`
    FOREIGN KEY (`groupId`)
    REFERENCES `mydb`.`Group` (`groupId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Group` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Group` (
  `groupId` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(80) NULL,
  `status` VARCHAR(20) NULL,
  `openDate` DATETIME NULL,
  `closeDate` DATETIME NULL,
  PRIMARY KEY (`groupId`),
  CONSTRAINT `fk_Group_1`
    FOREIGN KEY (`groupId`)
    REFERENCES `mydb`.`GroupOperations` (`groupOperationsId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ClientGroup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ClientGroup` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ClientGroup` (
  `clientGroupId` INT NOT NULL,
  `clientId` INT NULL,
  `groupId` INT NULL,
  PRIMARY KEY (`clientGroupId`),
  INDEX `fk_ClientGroup_1_idx` (`clientId` ASC),
  INDEX `fk_ClientGroup_2_idx` (`groupId` ASC),
  CONSTRAINT `fk_ClientGroup_1`
    FOREIGN KEY (`clientId`)
    REFERENCES `mydb`.`Client` (`clientId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ClientGroup_2`
    FOREIGN KEY (`groupId`)
    REFERENCES `mydb`.`Group` (`groupId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
