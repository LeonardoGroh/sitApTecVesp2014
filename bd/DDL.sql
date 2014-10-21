SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`User` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`User` (
  `login` VARCHAR(45) NOT NULL ,
  `nome` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(100) NOT NULL ,
  `senha` VARCHAR(45) NOT NULL ,
  `imagem` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`login`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Artigo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Artigo` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Artigo` (
  `idArtigo` INT NOT NULL AUTO_INCREMENT ,
  `titulo` VARCHAR(45) NOT NULL ,
  `login` VARCHAR(45) NOT NULL ,
  `data` DATETIME NOT NULL ,
  PRIMARY KEY (`idArtigo`) ,
  INDEX `fk_Artigo_User` (`login` ASC) ,
  CONSTRAINT `fk_Artigo_User`
    FOREIGN KEY (`login` )
    REFERENCES `mydb`.`User` (`login` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`coment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`coment` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`coment` (
  `login` VARCHAR(45) NOT NULL ,
  `idArtigo` INT NOT NULL ,
  `texto` TEXT NOT NULL ,
  `data` DATETIME NOT NULL ,
  INDEX `fk_User_has_Artigo_Artigo1` (`idArtigo` ASC) ,
  INDEX `fk_User_has_Artigo_User1` (`login` ASC) ,
  CONSTRAINT `fk_User_has_Artigo_User1`
    FOREIGN KEY (`login` )
    REFERENCES `mydb`.`User` (`login` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Artigo_Artigo1`
    FOREIGN KEY (`idArtigo` )
    REFERENCES `mydb`.`Artigo` (`idArtigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fotos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Fotos` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Fotos` (
  `idFotos` INT NOT NULL AUTO_INCREMENT ,
  `imagem` VARCHAR(45) NOT NULL ,
  `idArtigo` INT NOT NULL ,
  PRIMARY KEY (`idFotos`) ,
  INDEX `fk_fotos_Artigo1` (`idArtigo` ASC) ,
  CONSTRAINT `fk_fotos_Artigo1`
    FOREIGN KEY (`idArtigo` )
    REFERENCES `mydb`.`Artigo` (`idArtigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tags` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tags` (
  `idtags` VARCHAR(20) NOT NULL ,
  `titulo` VARCHAR(45) NOT NULL ,
  `descricao` VARCHAR(100) NULL ,
  PRIMARY KEY (`idtags`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Artigo_has_tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Artigo_has_tags` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Artigo_has_tags` (
  `idArtigo` INT NOT NULL ,
  `idtags` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`idArtigo`, `idtags`) ,
  INDEX `fk_Artigo_has_tags_tags1` (`idtags` ASC) ,
  INDEX `fk_Artigo_has_tags_Artigo1` (`idArtigo` ASC) ,
  CONSTRAINT `fk_Artigo_has_tags_Artigo1`
    FOREIGN KEY (`idArtigo` )
    REFERENCES `mydb`.`Artigo` (`idArtigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Artigo_has_tags_tags1`
    FOREIGN KEY (`idtags` )
    REFERENCES `mydb`.`tags` (`idtags` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
