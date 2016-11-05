SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Pending_User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pending_User` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pending_User` (
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `email_address` VARCHAR(45) NOT NULL,
  `phone` BIGINT NOT NULL,
  `admin` INT NULL,
  `lessor` INT NULL,
  `seller` INT NULL,
  `tenant` INT NULL,
  `buyer` INT NULL,
  `visitor` INT NULL,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  PRIMARY KEY (`username`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Confirmed_User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Confirmed_User` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Confirmed_User` (
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `email_address` VARCHAR(45) NOT NULL,
  `phone` BIGINT NOT NULL,
  `admin` INT NULL,
  `lessor` INT NULL,
  `seller` INT NULL,
  `tenant` INT NULL,
  `buyer` INT NULL,
  `visitor` INT NULL,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  PRIMARY KEY (`username`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pending_User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pending_User` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pending_User` (
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `email_address` VARCHAR(45) NOT NULL,
  `phone` BIGINT NOT NULL,
  `admin` INT NULL,
  `lessor` INT NULL,
  `seller` INT NULL,
  `tenant` INT NULL,
  `buyer` INT NULL,
  `visitor` INT NULL,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  PRIMARY KEY (`username`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`house_sale`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`house_sale` ;

CREATE TABLE IF NOT EXISTS `mydb`.`house_sale` (
  `idhouse_sale` INT NOT NULL,
  `price` INT NOT NULL,
  `place` VARCHAR(45) NOT NULL,
  `area_size` INT NOT NULL,
  `house_or_appartment` INT NOT NULL,
  `shared` INT NOT NULL,
  `year` INT NOT NULL,
  `none_central_or_self` INT NOT NULL,
  `description` LONGTEXT NULL,
  `Confirmed_User_username` VARCHAR(45) NOT NULL,
  `lng` DOUBLE NOT NULL,
  `lat` DOUBLE NOT NULL,
  `info` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`idhouse_sale`),
  UNIQUE INDEX `idhouse_sale_UNIQUE` (`idhouse_sale` ASC),
  INDEX `fk_house_sale_Confirmed_User1_idx` (`Confirmed_User_username` ASC),
  CONSTRAINT `fk_house_sale_Confirmed_User1`
    FOREIGN KEY (`Confirmed_User_username`)
    REFERENCES `mydb`.`Confirmed_User` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`house_rent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`house_rent` ;

CREATE TABLE IF NOT EXISTS `mydb`.`house_rent` (
  `idhouse_rent` INT NOT NULL,
  `price` INT NOT NULL,
  `place` VARCHAR(45) NOT NULL,
  `area_size` INT NOT NULL,
  `house_or_appartment` INT NOT NULL,
  `shared` INT NOT NULL,
  `year` INT NOT NULL,
  `none_central_or_self` INT NOT NULL,
  `description` LONGTEXT NULL,
  `Confirmed_User_username` VARCHAR(45) NOT NULL,
  `lng` DOUBLE NOT NULL,
  `lat` DOUBLE NOT NULL,
  `info` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`idhouse_rent`),
  UNIQUE INDEX `idhouse_sale_UNIQUE` (`idhouse_rent` ASC),
  INDEX `fk_house_rent_Confirmed_User1_idx` (`Confirmed_User_username` ASC),
  CONSTRAINT `fk_house_rent_Confirmed_User1`
    FOREIGN KEY (`Confirmed_User_username`)
    REFERENCES `mydb`.`Confirmed_User` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Algorithm`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Algorithm` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Algorithm` (
  `id` VARCHAR(45) NOT NULL,
  `Topsis` VARCHAR(45) NOT NULL,
  `Saw` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Email_sale`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Email_sale` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Email_sale` (
  `idEmail_sale` INT NOT NULL,
  `email_address` VARCHAR(45) NOT NULL,
  `question` LONGTEXT NOT NULL,
  `house_sale_idhouse_sale` INT NOT NULL,
  PRIMARY KEY (`idEmail_sale`),
  INDEX `fk_Email_sale_house_sale1_idx` (`house_sale_idhouse_sale` ASC),
  CONSTRAINT `fk_Email_sale_house_sale1`
    FOREIGN KEY (`house_sale_idhouse_sale`)
    REFERENCES `mydb`.`house_sale` (`idhouse_sale`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Email_rent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Email_rent` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Email_rent` (
  `idEmail_rent` INT NOT NULL,
  `email_address` VARCHAR(45) NOT NULL,
  `question` LONGTEXT NOT NULL,
  `house_rent_idhouse_rent` INT NOT NULL,
  PRIMARY KEY (`idEmail_rent`),
  INDEX `fk_Email_rent_house_rent1_idx` (`house_rent_idhouse_rent` ASC),
  CONSTRAINT `fk_Email_rent_house_rent1`
    FOREIGN KEY (`house_rent_idhouse_rent`)
    REFERENCES `mydb`.`house_rent` (`idhouse_rent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
