-- MySQL Script generated by MySQL Workbench
-- Sun 21 Jul 2024 06:23:45 PM -05
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema veterinaria2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema veterinaria2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `veterinaria2` DEFAULT CHARACTER SET utf8 ;
USE `veterinaria2`;

-- -----------------------------------------------------
-- Table `veterinaria2`.`Tbl_especie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria2`.`Tbl_especie` (
  `PK_especie` INT NOT NULL AUTO_INCREMENT,
  `Especie_tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`PK_especie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `veterinaria2`.`Tbl_animal_raza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria2`.`Tbl_animal_raza` (
  `PK_raza` INT NOT NULL AUTO_INCREMENT,
  `raza_tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`PK_raza`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `veterinaria2`.`Tbl_animal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria2`.`Tbl_animal` (
  `ID_Arete` VARCHAR(20) NOT NULL,
  `sexo` ENUM("M,H") NOT NULL,
  `FK_especie` INT NOT NULL,
  `FK_raza` INT NOT NULL,
  `FK_animal_padre` VARCHAR(20) NULL,
  `FK_animal_madre` VARCHAR(20) NULL,
  PRIMARY KEY (`ID_Arete`, `FK_especie`, `FK_raza`),
  INDEX `fk_Tbl_animal_Tbl_especie1_idx` (`FK_especie` ASC),
  INDEX `fk_Tbl_animal_Tbl_animal_raza1_idx` (`FK_raza` ASC),
  INDEX `fk_Tbl_animal_Tbl_animal1_idx` (`FK_animal_padre` ASC),
  INDEX `fk_Tbl_animal_Tbl_animal2_idx` (`FK_animal_madre` ASC),
  CONSTRAINT `fk_Tbl_animal_Tbl_especie1`
    FOREIGN KEY (`FK_especie`)
    REFERENCES `veterinaria2`.`Tbl_especie` (`PK_especie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_animal_Tbl_animal_raza1`
    FOREIGN KEY (`FK_raza`)
    REFERENCES `veterinaria2`.`Tbl_animal_raza` (`PK_raza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_animal_Tbl_animal1`
    FOREIGN KEY (`FK_animal_padre`)
    REFERENCES `veterinaria2`.`Tbl_animal` (`ID_Arete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_animal_Tbl_animal2`
    FOREIGN KEY (`FK_animal_madre`)
    REFERENCES `veterinaria2`.`Tbl_animal` (`ID_Arete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `veterinaria2`.`Tbl_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria2`.`Tbl_usuario` (
  `PK_user` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`PK_user`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `veterinaria2`.`Tbl_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria2`.`Tbl_producto` (
  `PK_producto` INT NOT NULL AUTO_INCREMENT,
  `producto_nombre` VARCHAR(45) NULL,
  `producto_tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`PK_producto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `veterinaria2`.`Tbl_dosificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria2`.`Tbl_dosificacion` (
  `PK_dosificacion` INT NOT NULL AUTO_INCREMENT,
  `dsf_fecha` VARCHAR(45) NULL,
  `FK_producto` INT NOT NULL,
  `FK_animal` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PK_dosificacion`, `FK_producto`, `FK_animal`),
  INDEX `fk_Tbl_dosificacion_Tbl_producto_idx` (`FK_producto` ASC),
  INDEX `fk_Tbl_dosificacion_Animal1_idx` (`FK_animal` ASC),
  CONSTRAINT `fk_Tbl_dosificacion_Tbl_producto`
    FOREIGN KEY (`FK_producto`)
    REFERENCES `veterinaria2`.`Tbl_producto` (`PK_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_dosificacion_Animal1`
    FOREIGN KEY (`FK_animal`)
    REFERENCES `veterinaria2`.`Tbl_animal` (`ID_Arete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `veterinaria2`.`Tbl_biometria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria2`.`Tbl_biometria` (
  `PK_historial` INT NOT NULL AUTO_INCREMENT,
  `bio_fecha` DATE NULL,
  `bio_edadTemporal` FLOAT(5,2) NULL,
  `bio_peso` FLOAT(5,2) NULL,
  `bio_condicionCorporal` FLOAT(5,2) NULL,
  `bio_largoCabeza` FLOAT(5,2) NULL,
  `bio_anchoCabeza` FLOAT(5,2) NULL,
  `bio_largoOrejas` FLOAT(5,2) NULL,
  `bio_largoCuello` FLOAT(5,2) NULL,
  `bio_largoCuerpo` FLOAT(5,2) NULL,
  `bio_alturaCruz` FLOAT(5,2) NULL,
  `bio_anchoGrupa` FLOAT(5,2) NULL,
  `bio_altoGrupa` FLOAT(5,2) NULL,
  `bio_amplitudPecho` FLOAT(5,2) NULL,
  `bio_circunferenciaCuerpo` FLOAT(5,2) NULL,
  `bio_aplomoAnterior` ENUM("Normal", "Patizambo", "Cerrado", "Abierto") NULL,
  `bio_aplomoPosterior` ENUM("Normal", "Patizambo", "Cerrado", "Abierto") NULL,
  `bio_tde_ancho` FLOAT(5,3) NULL,
  `bio_tde_largo` FLOAT(5,3) NULL,
  `bio_tiz_ancho` FLOAT(5,3) NULL,
  `bio_tiz_largo` FLOAT(5,3) NULL,
  `bio_comisuraVulvar` FLOAT(5,3) NULL,
  `FK_animal` VARCHAR(20) NOT NULL,
  `bio_cantDentaria` VARCHAR(50) NULL,
  `bio_caninos` VARCHAR(100) NULL,
  PRIMARY KEY (`PK_historial`, `FK_animal`),
  INDEX `fk_Tbl_biometria_Tbl_animal1_idx` (`FK_animal` ASC),
  CONSTRAINT `fk_Tbl_biometria_Tbl_animal1`
    FOREIGN KEY (`FK_animal`)
    REFERENCES `veterinaria2`.`Tbl_animal` (`ID_Arete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `veterinaria2`.`Tbl_reproduccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria2`.`Tbl_reproduccion` (
  `PK_reproduccion` INT NOT NULL AUTO_INCREMENT,
  `rep_snd_gurural` ENUM("Alto", "Medio", "Bajo", "No") NULL,
  `rep_impetu` INT NULL,
  `rep_derribo` INT NULL,
  `rep_tiempo_copula` FLOAT NULL,
  `rep_observacion` VARCHAR(400) NULL,
  `rep_fecha` DATE NULL,
  `FK_macho` VARCHAR(20) NOT NULL,
  `rep_nderribo` INT NULL,
  `FK_hembra` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`PK_reproduccion`, `FK_macho`, `FK_hembra`),
  INDEX `fk_Tbl_muestra_Tbl_animal1_idx` (`FK_macho` ASC),
  INDEX `fk_Tbl_muestra_Tbl_animal2_idx` (`FK_hembra` ASC),
  CONSTRAINT `fk_Tbl_muestra_Tbl_animal1`
    FOREIGN KEY (`FK_macho`)
    REFERENCES `veterinaria2`.`Tbl_animal` (`ID_Arete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_muestra_Tbl_animal2`
    FOREIGN KEY (`FK_hembra`)
    REFERENCES `veterinaria2`.`Tbl_animal` (`ID_Arete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `veterinaria2`.`Tbl_muestra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria2`.`Tbl_muestra` (
  `PK_muestra` INT NOT NULL AUTO_INCREMENT,
  `rep_fecha` DATE NULL,
  `rep_hora_inicio` VARCHAR(8) NULL,
  `rep_hora_fin` VARCHAR(8) NULL,
  `tem_inicio` FLOAT(5,2) NULL,
  `temp_final` FLOAT(5,2) NULL,
  `muestra_volumen` FLOAT(5,2) NULL,
  `muestra_color` VARCHAR(60) NULL,
  `observacion` VARCHAR(400) NULL,
  `FK_animal` VARCHAR(20) NOT NULL,
  `num_maniqui` INT NULL,
  PRIMARY KEY (`PK_muestra`, `FK_animal`),
  INDEX `fk_Tbl_reproduccion_Tbl_animal1_idx` (`FK_animal` ASC),
  CONSTRAINT `fk_Tbl_reproduccion_Tbl_animal1`
    FOREIGN KEY (`FK_animal`)
    REFERENCES `veterinaria2`.`Tbl_animal` (`ID_Arete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `veterinaria2`.`Tbl_vellon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria2`.`Tbl_vellon` (
  `PK_vellon` INT NOT NULL AUTO_INCREMENT,
  `vellon_densidad` ENUM("Bueno", "Alto", "Media", "Baja") NULL,
  `vellon_definicion` ENUM("Alto", "Media", "Baja") NULL,
  `vellon_longitudMecha` FLOAT(5,2) NULL,
  `vellon_calce` ENUM("Alto", "Media", "Baja") NULL,
  `vellon_uniformidad` ENUM("Alto", "Media", "Baja") NULL,
  `vellon_tuco` ENUM("Alto", "Media", "Baja") NULL,
  `vellon_color` VARCHAR(45) NULL,
  `vellon_clase` ENUM("A", "B", "C") NULL,
  `vellon_observacion` VARCHAR(400) NULL,
  `FK_animal` VARCHAR(20) NOT NULL,
  `vellon_fecha` DATE NULL,
  PRIMARY KEY (`PK_vellon`, `FK_animal`),
  INDEX `fk_Tbl_vellon_Tbl_animal1_idx` (`FK_animal` ASC),
  CONSTRAINT `fk_Tbl_vellon_Tbl_animal1`
    FOREIGN KEY (`FK_animal`)
    REFERENCES `veterinaria2`.`Tbl_animal` (`ID_Arete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `veterinaria2`.`Tbl_animal_fecha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria2`.`Tbl_animal_fecha` (
  `PK_ingreso` INT NOT NULL AUTO_INCREMENT,
  `ingreso_tipo` VARCHAR(50) NULL,
  `fecha_ingreso` DATE NULL,
  `Tbl_animal_ID_Arete` VARCHAR(20) NOT NULL,
  `ingreso_edad` FLOAT(5,2) NULL,
  PRIMARY KEY (`PK_ingreso`, `Tbl_animal_ID_Arete`),
  INDEX `fk_Tbl_animal_fecha_Tbl_animal1_idx` (`Tbl_animal_ID_Arete` ASC),
  CONSTRAINT `fk_Tbl_animal_fecha_Tbl_animal1`
    FOREIGN KEY (`Tbl_animal_ID_Arete`)
    REFERENCES `veterinaria2`.`Tbl_animal` (`ID_Arete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;