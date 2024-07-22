-- Active: 1721540523074@@127.0.0.1@5432@postgres@public
-- PostgreSQL script generated from MySQL Workbench script

-- Set constraints
SET CONSTRAINTS ALL DEFERRED;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS mydb;
SET search_path TO public;

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_especie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_especie (
  PK_especie SERIAL PRIMARY KEY,
  Especie_tipo VARCHAR(45)
);

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_animal_raza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_animal_raza (
  PK_raza SERIAL PRIMARY KEY,
  raza_tipo VARCHAR(45)
);

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_animal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_animal (
  ID_Arete VARCHAR(20) PRIMARY KEY,
  sexo VARCHAR(15) CHECK (sexo IN ('Macho', 'Hembra')),
  FK_especie INT NOT NULL,
  FK_raza INT NOT NULL,
  FK_animal_padre VARCHAR(20) NOT NULL,
  FK_animal_madre VARCHAR(20) NOT NULL,
  FOREIGN KEY (FK_especie) REFERENCES Tbl_especie(PK_especie) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (FK_raza) REFERENCES Tbl_animal_raza(PK_raza) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (FK_animal_padre) REFERENCES Tbl_animal(ID_Arete) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (FK_animal_madre) REFERENCES Tbl_animal(ID_Arete) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_usuario (
  PK_user SERIAL PRIMARY KEY,
  username VARCHAR(45),
  password VARCHAR(45)
);

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_producto (
  PK_producto SERIAL PRIMARY KEY,
  producto_nombre VARCHAR(45),
  producto_tipo VARCHAR(45)
);

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_dosificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_dosificacion (
  PK_dosificacion SERIAL PRIMARY KEY,
  dsf_fecha VARCHAR(45),
  FK_producto INT NOT NULL,
  FK_animal VARCHAR(20) NOT NULL,
  FOREIGN KEY (FK_producto) REFERENCES Tbl_producto(PK_producto) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (FK_animal) REFERENCES Tbl_animal(ID_Arete) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_biometria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_biometria (
  PK_historial SERIAL PRIMARY KEY,
  bio_fecha DATE,
  bio_edadTemporal NUMERIC(5,2),
  bio_peso NUMERIC(5,2),
  bio_condicionCorporal NUMERIC(5,2),
  bio_largoCabeza NUMERIC(5,2),
  bio_anchoCabeza NUMERIC(5,2),
  bio_largoOrejas NUMERIC(5,2),
  bio_largoCuello NUMERIC(5,2),
  bio_largoCuerpo NUMERIC(5,2),
  bio_alturaCruz NUMERIC(5,2),
  bio_anchoGrupa NUMERIC(5,2),
  bio_altoGrupa NUMERIC(5,2),
  bio_amplitudPecho NUMERIC(5,2),
  bio_circunferenciaCuerpo NUMERIC(5,2),
  bio_aplomoAnterior VARCHAR(10) CHECK (bio_aplomoAnterior IN ('Normal', 'Patizambo', 'Cerrado', 'Abierto')),
  bio_aplomoPosterior VARCHAR(10) CHECK (bio_aplomoPosterior IN ('Normal', 'Patizambo', 'Cerrado', 'Abierto')),
  bio_tde_ancho NUMERIC(5,3),
  bio_tde_largo NUMERIC(5,3),
  bio_tiz_ancho NUMERIC(5,3),
  bio_tiz_largo NUMERIC(5,3),
  bio_comisuraVulvar NUMERIC(5,3),
  FK_animal VARCHAR(20) NOT NULL,
  bio_cantDentaria VARCHAR(50),
  bio_caninos VARCHAR(100),
  FOREIGN KEY (FK_animal) REFERENCES Tbl_animal(ID_Arete) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_reproduccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_reproduccion (
  PK_reproduccion SERIAL PRIMARY KEY,
  rep_snd_gurural VARCHAR(10) CHECK (rep_snd_gurural IN ('Alto', 'Medio', 'Bajo', 'No')),
  rep_impetu INT,
  rep_derribo INT,
  rep_tiempo_copula NUMERIC,
  rep_observacion VARCHAR(400),
  rep_fecha DATE,
  FK_macho VARCHAR(20) NOT NULL,
  rep_nderribo INT,
  FK_hembra VARCHAR(20) NOT NULL,
  FOREIGN KEY (FK_macho) REFERENCES Tbl_animal(ID_Arete) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (FK_hembra) REFERENCES Tbl_animal(ID_Arete) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_muestra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_muestra (
  PK_muestra SERIAL PRIMARY KEY,
  rep_fecha DATE,
  rep_hora_inicio VARCHAR(8),
  rep_hora_fin VARCHAR(8),
  tem_inicio NUMERIC(5,2),
  temp_final NUMERIC(5,2),
  muestra_volumen NUMERIC(5,2),
  muestra_color VARCHAR(60),
  observacion VARCHAR(400),
  FK_animal VARCHAR(20) NOT NULL,
  num_maniqui INT,
  FOREIGN KEY (FK_animal) REFERENCES Tbl_animal(ID_Arete) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_vellon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_vellon (
  PK_vellon SERIAL PRIMARY KEY,
  vellon_densidad VARCHAR(10) CHECK (vellon_densidad IN ('Bueno', 'Alto', 'Media', 'Baja')),
  vellon_definicion VARCHAR(10) CHECK (vellon_definicion IN ('Alto', 'Media', 'Baja')),
  vellon_longitudMecha NUMERIC(5,2),
  vellon_calce VARCHAR(10) CHECK (vellon_calce IN ('Alto', 'Media', 'Baja')),
  vellon_uniformidad VARCHAR(10) CHECK (vellon_uniformidad IN ('Alto', 'Media', 'Baja')),
  vellon_tuco VARCHAR(10) CHECK (vellon_tuco IN ('Alto', 'Media', 'Baja')),
  vellon_color VARCHAR(45),
  vellon_clase VARCHAR(1) CHECK (vellon_clase IN ('A', 'B', 'C')),
  vellon_observacion VARCHAR(400),
  FK_animal VARCHAR(20) NOT NULL,
  vellon_fecha DATE,
  FOREIGN KEY (FK_animal) REFERENCES Tbl_animal(ID_Arete) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_animal_fecha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_animal_fecha (
  PK_ingreso SERIAL PRIMARY KEY,
  ingreso_tipo VARCHAR(50),
  fecha_ingreso DATE,
  Tbl_animal_ID_Arete VARCHAR(20) NOT NULL,
  ingreso_edad NUMERIC(5,2),
  FOREIGN KEY (Tbl_animal_ID_Arete) REFERENCES Tbl_animal(ID_Arete) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Reset constraints
SET CONSTRAINTS ALL IMMEDIATE;
