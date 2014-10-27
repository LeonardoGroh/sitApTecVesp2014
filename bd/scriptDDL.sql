SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


-- -----------------------------------------------------
-- Table `sitap`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sitap`.`User` ;

CREATE  TABLE IF NOT EXISTS `sitap`.`User` (
  `login` VARCHAR(45) NOT NULL ,
  `nome` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(100) NOT NULL ,
  `senha` VARCHAR(45) NOT NULL ,
  `imagem` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`login`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`Artigo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sitap`.`Artigo` ;

CREATE  TABLE IF NOT EXISTS `sitap`.`Artigo` (
  `idArtigo` INT NOT NULL AUTO_INCREMENT ,
  `titulo` VARCHAR(45) NOT NULL ,
  `login` VARCHAR(45) NOT NULL ,
  `data` DATETIME NOT NULL ,
  `texto` TEXT NOT NULL ,
  `like` INT NULL ,
  PRIMARY KEY (`idArtigo`) ,
  INDEX `fk_Artigo_User` (`login` ASC) ,
  CONSTRAINT `fk_Artigo_User`
    FOREIGN KEY (`login` )
    REFERENCES `sitap`.`User` (`login` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`coment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sitap`.`coment` ;

CREATE  TABLE IF NOT EXISTS `sitap`.`coment` (
  `login` VARCHAR(45) NOT NULL ,
  `idArtigo` INT NOT NULL ,
  `texto` TEXT NOT NULL ,
  `data` DATETIME NOT NULL ,
  INDEX `fk_User_has_Artigo_Artigo1` (`idArtigo` ASC) ,
  INDEX `fk_User_has_Artigo_User1` (`login` ASC) ,
  CONSTRAINT `fk_User_has_Artigo_User1`
    FOREIGN KEY (`login` )
    REFERENCES `sitap`.`User` (`login` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Artigo_Artigo1`
    FOREIGN KEY (`idArtigo` )
    REFERENCES `sitap`.`Artigo` (`idArtigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`Fotos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sitap`.`Fotos` ;

CREATE  TABLE IF NOT EXISTS `sitap`.`Fotos` (
  `idFotos` INT NOT NULL AUTO_INCREMENT ,
  `imagem` VARCHAR(45) NOT NULL ,
  `idArtigo` INT NOT NULL ,
  PRIMARY KEY (`idFotos`) ,
  INDEX `fk_fotos_Artigo1` (`idArtigo` ASC) ,
  CONSTRAINT `fk_fotos_Artigo1`
    FOREIGN KEY (`idArtigo` )
    REFERENCES `sitap`.`Artigo` (`idArtigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sitap`.`tags` ;

CREATE  TABLE IF NOT EXISTS `sitap`.`tags` (
  `idtags` VARCHAR(20) NOT NULL ,
  `titulo` VARCHAR(45) NOT NULL ,
  `descricao` VARCHAR(100) NULL ,
  PRIMARY KEY (`idtags`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`Artigo_has_tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sitap`.`Artigo_has_tags` ;

CREATE  TABLE IF NOT EXISTS `sitap`.`Artigo_has_tags` (
  `idArtigo` INT NOT NULL ,
  `idtags` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`idArtigo`, `idtags`) ,
  INDEX `fk_Artigo_has_tags_tags1` (`idtags` ASC) ,
  INDEX `fk_Artigo_has_tags_Artigo1` (`idArtigo` ASC) ,
  CONSTRAINT `fk_Artigo_has_tags_Artigo1`
    FOREIGN KEY (`idArtigo` )
    REFERENCES `sitap`.`Artigo` (`idArtigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Artigo_has_tags_tags1`
    FOREIGN KEY (`idtags` )
    REFERENCES `sitap`.`tags` (`idtags` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
