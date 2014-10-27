SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `sitap` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `sitap` ;

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

START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`User` (`login`, `nome`, `email`, `senha`, `imagem`) VALUES ('Whory1987', 'Ana Oliveira Dias', 'AnaOliveiraDias@dayrep.com', 'teste', 'http://lorempixel.com/output/people-q-c-640-480-9.jpg');
INSERT INTO `sitap`.`User` (`login`, `nome`, `email`, `senha`, `imagem`) VALUES ('Whitu1966', 'Felipe Castro Santos', 'FelipeCastroSantos@jourrapide.com', 'teste', 'http://lorempixel.com/output/people-q-c-640-480-8.jpg');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sitap`.`Artigo`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`Artigo` (`idArtigo`, `titulo`, `login`, `data`, `texto`, `like`) VALUES (1, 'Teste', 'Whitu1966', '2014-10-24 16:44:50', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 13);
INSERT INTO `sitap`.`Artigo` (`idArtigo`, `titulo`, `login`, `data`, `texto`, `like`) VALUES (2, 'Teste02', 'Whory1987', '2014-10-27 16:44:50', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 50);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sitap`.`coment`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`coment` (`login`, `idArtigo`, `texto`, `data`) VALUES ('Whory1987', 1, '<p>Blablabla</p>', '2014-10-27 16:50:59');
INSERT INTO `sitap`.`coment` (`login`, `idArtigo`, `texto`, `data`) VALUES ('Whitu1966', 2, '<p>Mimimi</p>', '2014-10-27 16:50:59');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sitap`.`Fotos`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`Fotos` (`idFotos`, `imagem`, `idArtigo`) VALUES (1, 'http://vidasustentavel.perus.com/img/latinha-ecologica.jpg', 1);
INSERT INTO `sitap`.`Fotos` (`idFotos`, `imagem`, `idArtigo`) VALUES (2, 'http://www.camparigroup.com/sites/default/files/brand/skyy_vodka.png', 2);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sitap`.`tags`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`tags` (`idtags`, `titulo`, `descricao`) VALUES ('1', 'pizza', 'comida');
INSERT INTO `sitap`.`tags` (`idtags`, `titulo`, `descricao`) VALUES ('0', 'refrigerante', 'bebida');
INSERT INTO `sitap`.`tags` (`idtags`, `titulo`, `descricao`) VALUES ('2', 'jogos', 'é isso');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sitap`.`Artigo_has_tags`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`Artigo_has_tags` (`idArtigo`, `idtags`) VALUES (1, '1');
INSERT INTO `sitap`.`Artigo_has_tags` (`idArtigo`, `idtags`) VALUES (1, '2');
INSERT INTO `sitap`.`Artigo_has_tags` (`idArtigo`, `idtags`) VALUES (2, '1');
INSERT INTO `sitap`.`Artigo_has_tags` (`idArtigo`, `idtags`) VALUES (2, '2');

COMMIT;
