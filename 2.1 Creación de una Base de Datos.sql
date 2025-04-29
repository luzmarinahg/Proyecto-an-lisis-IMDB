SELECT * FROM proyecto2_equipo1.Oscars;

CREATE SCHEMA proyecto2_equipo1_v2;

USE `proyecto2_equipo1_v2` ;

-- -----------------------------------------------------
-- Table `proyecto2_equipo1_v2`.`film_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto2_equipo1_v2`.`film_details` (
  `id_details` INT NOT NULL AUTO_INCREMENT,
  `idOwner` VARCHAR(25) NOT NULL,
  `imdb_rating` VARCHAR(45) NULL DEFAULT NULL,
  `direction` VARCHAR(500) NULL DEFAULT NULL,
  `writers` VARCHAR(500) NULL DEFAULT NULL,
  `plot` VARCHAR(500) NULL DEFAULT NULL,
  `length` VARCHAR(100) NULL DEFAULT NULL,
  `name` VARCHAR(200) NULL DEFAULT NULL,
  `year` VARCHAR(25) NULL DEFAULT NULL,
  PRIMARY KEY (`id_details`))
ENGINE = InnoDB
AUTO_INCREMENT = 28
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `proyecto2_equipo1_v2`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto2_equipo1_v2`.`film` (
  `id_film` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(50) NULL DEFAULT NULL,
  `year` VARCHAR(45) NULL DEFAULT NULL,
  `genre` VARCHAR(40) NULL DEFAULT NULL,
  `idOwner` VARCHAR(25) NOT NULL,
  `title` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id_film`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `proyecto2_equipo1_v2`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto2_equipo1_v2`.`actor` (
	`id_actor` INT NOT NULL AUTO_INCREMENT,
  `actor_id` VARCHAR(50) NOT NULL DEFAULT ' ',
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `year_birthday` VARCHAR(100) NULL DEFAULT NULL,
  `films_done` VARCHAR(500) NULL DEFAULT NULL,
  `jobs` VARCHAR(500) NULL DEFAULT NULL,
  `awards` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`id_actor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX idx_actor_id ON `proyecto2_equipo1_v2`.`actor` (`actor_id`);

-- -----------------------------------------------------
-- Table `proyecto2_equipo1_v2`.`Movie_actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto2_equipo1_v2`.`Movie_actor` (
  `id_pelicula` INT NOT NULL,
  `actor_id` VARCHAR(50) NOT NULL DEFAULT ' ',
  INDEX `film_actor_idx` (`id_pelicula` ASC) VISIBLE,
  INDEX `movie_actor_actor _idx` (`actor_id` ASC) VISIBLE,
  CONSTRAINT `film_actor`
    FOREIGN KEY (`id_pelicula`)
    REFERENCES `proyecto2_equipo1_v2`.`film` (`id_film`),
  CONSTRAINT `movie_actor_actor `
    FOREIGN KEY (`actor_id`)
    REFERENCES `proyecto2_equipo1_v2`.`actor` (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `proyecto2_equipo1_v2`.`Oscars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto2_equipo1_v2`.`Oscars` (
  `oscar_id` INT NOT NULL AUTO_INCREMENT,
  `gala_date` VARCHAR(45) NULL DEFAULT NULL,
  `best_movie` VARCHAR(45) NULL DEFAULT NULL,
  `best_director` VARCHAR(45) NULL DEFAULT NULL,
  `best_actor` VARCHAR(45) NULL DEFAULT NULL,
  `best_actress` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`oscar_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 49
DEFAULT CHARACTER SET = utf8mb4;

DROP TABLE Movie_actor;

ALTER TABLE actor
MODIFY COLUMN actor_id VARCHAR(50) NOT NULL;


