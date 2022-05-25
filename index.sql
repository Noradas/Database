

-- -----------------------------------------------------
-- Table `movies`.`Cat-Films`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`Cat-Films` ;

CREATE TABLE IF NOT EXISTS `movies`.`Cat-Films` (
  `idCat-Films` INT NOT NULL AUTO_INCREMENT,
  `Action` VARCHAR(45) NOT NULL,
  `Comedie` VARCHAR(45) NOT NULL,
  `Aventure` VARCHAR(45) NOT NULL,
  `Drame` VARCHAR(45) NOT NULL,
  `Horreur` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCat-Films`));


-- -----------------------------------------------------
-- Table `movies`.`clients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`clients` ;

CREATE TABLE IF NOT EXISTS `movies`.`clients` (
  `idClients` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(20) NOT NULL,
  `prenom` VARCHAR(20) NOT NULL,
  `email` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`idClients`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `movies`.`Payments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`Payments` ;

CREATE TABLE IF NOT EXISTS `movies`.`Payments` (
  `idPayments` INT NOT NULL AUTO_INCREMENT,
  `Date-payment` DATETIME NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  `Montant` DECIMAL(5,0) NOT NULL,
  `clients_idClients1` INT NOT NULL,
  PRIMARY KEY (`idPayments`),
  INDEX `fk_Payments_clients1_idx` (`clients_idClients1` ASC) VISIBLE,
  CONSTRAINT `fk_Payments_clients1`
    FOREIGN KEY (`clients_idClients1`)
    REFERENCES `movies`.`clients` (`idClients`));


-- -----------------------------------------------------
-- Table `movies`.`Films`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`Films` ;

CREATE TABLE IF NOT EXISTS `movies`.`Films` (
  `idFilms` INT NOT NULL AUTO_INCREMENT,
  `Titre` VARCHAR(45) NOT NULL,
  `Date-sortie` DATETIME NOT NULL,
  `Durée` VARCHAR(20) NOT NULL,
  `Réalisateur` VARCHAR(45) NOT NULL,
  `Cat-Films_idCat-Films` INT NOT NULL,
  `Payments_idPayments` INT NOT NULL,
  PRIMARY KEY (`idFilms`),
  INDEX `fk_Films_Cat-Films1_idx` (`Cat-Films_idCat-Films` ASC) VISIBLE,
  INDEX `fk_Films_Payments1_idx` (`Payments_idPayments` ASC) VISIBLE,
  CONSTRAINT `fk_Films_Cat-Films1`
    FOREIGN KEY (`Cat-Films_idCat-Films`)
    REFERENCES `movies`.`Cat-Films` (`idCat-Films`),
  CONSTRAINT `fk_Films_Payments1`
    FOREIGN KEY (`Payments_idPayments`)
    REFERENCES `movies`.`Payments` (`idPayments`));


-- -----------------------------------------------------
-- Table `movies`.`Films_has_clients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`Films_has_clients` ;

CREATE TABLE IF NOT EXISTS `movies`.`Films_has_clients` (
  `Date-création` DATETIME NOT NULL,
  `Derniére date-modif-entrées` DATETIME NOT NULL,
  `Date-location` DATETIME NOT NULL,
  `Date-retour` DATETIME NOT NULL,
  `clients_idClients` INT NOT NULL,
  `Films_idFilms` INT NOT NULL,
  `id` VARCHAR(45) NULL DEFAULT NULL,
  INDEX `fk_Films_has_clients_clients1_idx` (`clients_idClients` ASC) VISIBLE,
  INDEX `fk_Films_has_clients_Films1_idx` (`Films_idFilms` ASC) VISIBLE,
  CONSTRAINT `fk_Films_has_clients_clients1`
    FOREIGN KEY (`clients_idClients`)
    REFERENCES `movies`.`clients` (`idClients`),
  CONSTRAINT `fk_Films_has_clients_Films1`
    FOREIGN KEY (`Films_idFilms`)
    REFERENCES `movies`.`Films` (`idFilms`));


