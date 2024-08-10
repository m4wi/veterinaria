-- Active: 1722809100314@@127.0.0.1@5432@postgres
-- PostgreSQL script generated from MySQL Workbench script

-- Set constraints
SET CONSTRAINTS ALL DEFERRED;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS veterinaria;

SET search_path TO veterinaria;

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
  FK_animal_padre VARCHAR(20) NULL,
  FK_animal_madre VARCHAR(20) NULL,
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
  dsf_observacion TEXT,
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
  bio_isquiones NUMERIC(5,3),
  bio_comisuraVulvar NUMERIC(5,3),
  FK_animal VARCHAR(20) NOT NULL,
  bio_cantDentaria VARCHAR(50),
  bio_caninos VARCHAR(100),
  bio_observacion TEXT,
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

ALTER TABLE Tbl_muestra ADD COLUMN muestra_ph NUMERIC(5,3);
ALTER TABLE Tbl_muestra ADD COLUMN muestra_filancia NUMERIC(5,3);

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_vellon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_vellon (
  PK_vellon SERIAL PRIMARY KEY,
  vellon_densidad VARCHAR(10) CHECK (vellon_densidad IN ('Bueno', 'Alto', 'Media', 'Baja')),
  vellon_definicion VARCHAR(10) CHECK (vellon_definicion IN ('Alto', 'Media', 'Baja')),
  vellon_longitudMecha NUMERIC(5,2),
  vellon_calce VARCHAR(10) CHECK (vellon_calce IN ('Alto', 'Media', 'Baja')),
  vellon_uniformidad BOOLEAN,
  vellon_tuco BOOLEAN,
  vellon_color VARCHAR(45),
  vellon_clase VARCHAR(1) CHECK (vellon_clase IN ('A', 'B', 'C')),
  vellon_observacion VARCHAR(400),
  FK_animal VARCHAR(20) NOT NULL,
  vellon_fecha DATE,
  vellon_diametro NUMERIC(5,2),
  FOREIGN KEY (FK_animal) REFERENCES Tbl_animal(ID_Arete) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_animal_fecha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_animal_fecha (
  PK_ingreso SERIAL PRIMARY KEY,
  ingreso_tipo VARCHAR(50),
  fecha_ingreso DATE,
  fk_arete VARCHAR(20) NOT NULL,
  ingreso_edad NUMERIC(5,2),
  FOREIGN KEY (fk_arete) REFERENCES Tbl_animal(ID_Arete) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Reset constraints
SET CONSTRAINTS ALL IMMEDIATE;


CREATE OR REPLACE FUNCTION saveAnimal(
    p_arete VARCHAR(20),
    p_sexo VARCHAR(10),
    p_especie INT,
    p_raza INT,
    p_padre VARCHAR(20),
    p_madre VARCHAR(20),
    p_tipo_ingreso VARCHAR(50),
    p_fecha_ingreso DATE,
    p_edad_aproximada NUMERIC DEFAULT 0
)
RETURNS VOID AS $$
BEGIN
    -- Insertar en Tbl_animal
    INSERT INTO Tbl_animal (id_arete, sexo, fk_especie, fk_raza, fk_animal_padre, fk_animal_madre)
    VALUES (p_arete, p_sexo, p_especie, p_raza, p_padre, p_madre);

    -- Insertar en Tbl_animal_fecha
    INSERT INTO Tbl_animal_fecha (ingreso_tipo, fecha_ingreso, ingreso_edad, fk_arete)
    VALUES (p_tipo_ingreso, p_fecha_ingreso, p_edad_aproximada , p_arete);

    -- No es necesario usar COMMIT; PostgreSQL maneja la transacción automáticamente en funciones
END;
$$ LANGUAGE plpgsql;


/* DATOS BIOMETRICOS */

CREATE OR REPLACE FUNCTION savebiometria(
    p_bio_fecha DATE,
    p_bio_peso NUMERIC(5,2),
    p_bio_condicionCorporal NUMERIC(5,2),
    p_bio_largoCabeza NUMERIC(5,2),
    p_bio_anchoCabeza NUMERIC(5,2),
    p_bio_largoOrejas NUMERIC(5,2),
    p_bio_largoCuello NUMERIC(5,2),
    p_bio_largoCuerpo NUMERIC(5,2),
    p_bio_alturaCruz NUMERIC(5,2),
    p_bio_anchoGrupa NUMERIC(5,2),
    p_bio_altoGrupa NUMERIC(5,2),
    p_bio_amplitudPecho NUMERIC(5,2),
    p_bio_circunferenciaCuerpo NUMERIC(5,2),
    p_bio_aplomoAnterior VARCHAR(10),
    p_bio_aplomoPosterior VARCHAR(10),
    p_bio_tde_ancho NUMERIC(5,3),
    p_bio_tde_largo NUMERIC(5,3),
    p_bio_tiz_ancho NUMERIC(5,3),
    p_bio_tiz_largo NUMERIC(5,3),
    p_bio_comisuraVulvar NUMERIC(5,3),
    p_FK_animal VARCHAR(20),
    p_bio_cantDentaria VARCHAR(50),
    p_bio_caninos VARCHAR(100),
    p_isquiones NUMERIC(5,2),
    p_obs TEXT
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Tbl_biometria(
        bio_fecha,
        bio_peso,
        bio_condicionCorporal,
        bio_largoCabeza,
        bio_anchoCabeza,
        bio_largoOrejas,
        bio_largoCuello,
        bio_largoCuerpo,
        bio_alturaCruz,
        bio_anchoGrupa,
        bio_altoGrupa,
        bio_amplitudPecho,
        bio_circunferenciaCuerpo,
        bio_aplomoAnterior,
        bio_aplomoPosterior,
        bio_tde_ancho,
        bio_tde_largo,
        bio_tiz_ancho,
        bio_tiz_largo,
        bio_comisuraVulvar,
        FK_animal,
        bio_cantDentaria,
        bio_caninos,
        bio_isquiones,
        bio_observacion
    ) VALUES (
        p_bio_fecha,
        p_bio_peso,
        p_bio_condicionCorporal,
        p_bio_largoCabeza,
        p_bio_anchoCabeza,
        p_bio_largoOrejas,
        p_bio_largoCuello,
        p_bio_largoCuerpo,
        p_bio_alturaCruz,
        p_bio_anchoGrupa,
        p_bio_altoGrupa,
        p_bio_amplitudPecho,
        p_bio_circunferenciaCuerpo,
        p_bio_aplomoAnterior,
        p_bio_aplomoPosterior,
        p_bio_tde_ancho,
        p_bio_tde_largo,
        p_bio_tiz_ancho,
        p_bio_tiz_largo,
        p_bio_comisuraVulvar,
        p_FK_animal,
        p_bio_cantDentaria,
        p_bio_caninos,
        p_isquiones,
        p_obs
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION saveReproduccion(
    p_rep_snd_gurural VARCHAR(10),
    p_rep_impetu NUMERIC,
    p_rep_derribo NUMERIC,
    p_rep_tiempo_copula NUMERIC,
    p_rep_observacion VARCHAR(400),
    p_rep_fecha DATE,
    p_FK_macho VARCHAR(20),
    p_rep_nderribo INT,
    p_FK_hembra VARCHAR(20)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Tbl_reproduccion(
        rep_snd_gurural,
        rep_impetu,
        rep_derribo,
        rep_tiempo_copula,
        rep_observacion,
        rep_fecha,
        FK_macho,
        rep_nderribo,
        FK_hembra
    ) VALUES (
        p_rep_snd_gurural,
        p_rep_impetu,
        p_rep_derribo,
        p_rep_tiempo_copula,
        p_rep_observacion,
        p_rep_fecha,
        p_FK_macho,
        p_rep_nderribo,
        p_FK_hembra
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION saveMuestra(
    p_rep_fecha DATE,
    p_rep_hora_inicio VARCHAR(8),
    p_rep_hora_fin VARCHAR(8),
    p_tem_inicio NUMERIC(5,2),
    p_temp_final NUMERIC(5,2),
    p_muestra_volumen NUMERIC(5,2),
    p_muestra_color VARCHAR(60),
    p_observacion VARCHAR(400),
    p_FK_animal VARCHAR(20),
    p_num_maniqui INT,
    p_filancia NUMERIC,
    p_ph NUMERIC
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Tbl_muestra(
        rep_fecha,
        rep_hora_inicio,
        rep_hora_fin,
        tem_inicio,
        temp_final,
        muestra_volumen,
        muestra_color,
        observacion,
        FK_animal,
        num_maniqui,
        muestra_filancia,
        muestra_ph
    ) VALUES (
        p_rep_fecha,
        p_rep_hora_inicio,
        p_rep_hora_fin,
        p_tem_inicio,
        p_temp_final,
        p_muestra_volumen,
        p_muestra_color,
        p_observacion,
        p_FK_animal,
        p_num_maniqui,
        p_filancia,
        p_ph
    );
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION saveVellon(
    p_vellon_densidad VARCHAR(10),
    p_vellon_definicion VARCHAR(10),
    p_vellon_longitudMecha NUMERIC(5,2),
    p_vellon_calce VARCHAR(10),
    p_vellon_uniformidad BOOLEAN,
    p_vellon_tuco BOOLEAN,
    p_vellon_color VARCHAR(45),
    p_vellon_clase VARCHAR(1),
    p_vellon_observacion VARCHAR(400),
    p_FK_animal VARCHAR(20),
    p_vellon_fecha DATE,
    p_vellon_diametro NUMERIC
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Tbl_vellon(
        vellon_densidad,
        vellon_definicion,
        vellon_longitudMecha,
        vellon_calce,
        vellon_uniformidad,
        vellon_tuco,
        vellon_color,
        vellon_clase,
        vellon_observacion,
        FK_animal,
        vellon_fecha,
        vellon_diametro
    ) VALUES (
        p_vellon_densidad,
        p_vellon_definicion,
        p_vellon_longitudMecha,
        p_vellon_calce,
        p_vellon_uniformidad,
        p_vellon_tuco,
        p_vellon_color,
        p_vellon_clase,
        p_vellon_observacion,
        p_FK_animal,
        p_vellon_fecha,
        p_vellon_diametro
    );
END;
$$ LANGUAGE plpgsql;

INSERT INTO Tbl_usuario(username, password)
VALUES('Usuario01', '123456789');


INSERT INTO tbl_producto(producto_nombre, producto_tipo)
VALUES('Antiparasitario', 'Marca 1'),
('Vitaminas', 'Marca 2');


DROP VIEW IF EXISTS vw_sabana_general;

CREATE VIEW vw_sabana_general AS
SELECT
  sb_0.id_arete,
  sb_0.sexo,
  sb_0.raza_tipo,
  sb_0.Especie_tipo,
    CONCAT(
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, sb_0.fecha_ingreso)) + FLOOR(sb_0.ingreso_edad / 12), ' años, ',
    EXTRACT(MONTH FROM AGE(CURRENT_DATE, sb_0.fecha_ingreso)) + ROUND(sb_0.ingreso_edad % 12,0), ' meses'
  ) AS fmdate,
  sb_1.bio_peso,
  sb_1.bio_condicionCorporal,
  sb_1.bio_largoCabeza,
  sb_1.bio_anchoCabeza,
  sb_1.bio_largoOrejas,
  sb_1.bio_largoCuello,
  sb_1.bio_largoCuerpo,
  sb_1.bio_alturaCruz,
  sb_1.bio_anchoGrupa,
  sb_1.bio_altoGrupa,
  sb_1.bio_amplitudPecho,
  sb_1.bio_circunferenciaCuerpo,
  sb_1.bio_aplomoAnterior,
  sb_1.bio_aplomoPosterior,
  sb_1.bio_cantDentaria,
  sb_1.bio_comisuravulvar,
  sb_1.bio_caninos,
  CASE 
    WHEN sb_1.bio_isquiones = 0.0 THEN 'No se registro'
    ELSE  to_char(sb_1.bio_isquiones, 'FM999999999.00')
  END AS bio_isquiones,
  CONCAT('A: ', ROUND(sb_1.bio_tde_ancho, 2), ', cm L: ', ROUND(sb_1.bio_tde_largo,2), ' cm') AS tes_derecho,
  CONCAT('A: ', ROUND(sb_1.bio_tiz_ancho), 2, ', cm L: ', ROUND(sb_1.bio_tiz_largo,2), ' cm') AS tes_izquierdo,
  sb_4.vellon_calce,
  sb_4.vellon_clase,
  sb_4.vellon_color,
  sb_4.vellon_definicion,
  sb_4.vellon_densidad,
  sb_4.vellon_longitudmecha,
  CASE 
    WHEN sb_4.vellon_tuco THEN 'Si'
    ELSE  'No'
  END AS vellon_tuco,
  CASE 
    WHEN sb_4.vellon_uniformidad THEN 'Si'
    ELSE  'No'
  END AS vellon_uniformidad,
  sb_4.vellon_diametro,
  sb_2.rep_hora_inicio,
  sb_2.rep_hora_fin,
  sb_2.tem_inicio,
  sb_2.temp_final,
  sb_2.muestra_volumen,
  sb_2.muestra_color,
  sb_2.observacion,
  sb_2.num_maniqui,
  sb_2.rep_fecha,
  sb_2.muestra_filancia,
  sb_2.muestra_ph,
  sb_3.rep_snd_gurural,
  CONCAT(
    ROUND(sb_3.rep_impetu / 60, 0), ' min, ',
    ROUND(sb_3.rep_impetu % 60,0), ' seg'
  ) AS rep_impetu,
  CONCAT(
    ROUND(sb_3.rep_derribo / 3600,0), ' hr, ',
    ROUND((sb_3.rep_derribo % 3600) / 60, 0), ' min, ',
    ROUND(sb_3.rep_derribo % 60,0), ' seg'
    ) AS rep_derribo,
  CONCAT(
    ROUND(sb_3.rep_tiempo_copula / 3600,0), ' hr, ',
    ROUND((sb_3.rep_tiempo_copula % 3600) / 60, 0), ' min, ',
    ROUND(sb_3.rep_tiempo_copula % 60,0), ' seg'
    ) AS rep_tiempo_copula,
  sb_3.FK_hembra
FROM (
  SELECT
    ta.id_arete,
    ta.sexo,
    tr.raza_tipo,
    te.Especie_tipo,
    tef.ingreso_edad,
    tef.fecha_ingreso
  FROM Tbl_animal ta
  INNER JOIN Tbl_especie te
    ON te.PK_especie = ta.FK_especie
  INNER JOIN Tbl_animal_raza tr
    ON tr.PK_raza = ta.FK_raza
  INNER JOIN tbl_animal_fecha tef
    ON tef.fk_arete = ta.id_arete
) AS sb_0
LEFT JOIN (
  WITH maxBiometricRow AS (
      SELECT
        tb.FK_animal AS bio_fk_animal,
        tb.bio_peso,
        tb.bio_condicionCorporal,
        tb.bio_largoCabeza,
        tb.bio_anchoCabeza,
        tb.bio_largoOrejas,
        tb.bio_largoCuello,
        tb.bio_largoCuerpo,
        tb.bio_alturaCruz,
        tb.bio_anchoGrupa,
        tb.bio_altoGrupa,
        tb.bio_amplitudPecho,
        tb.bio_circunferenciaCuerpo,
        tb.bio_aplomoAnterior,
        tb.bio_aplomoPosterior,
        tb.bio_comisuravulvar,
        tb.bio_tde_ancho,
        tb.bio_tde_largo,
        tb.bio_tiz_ancho,
        tb.bio_tiz_largo,
        tb.bio_cantDentaria,
        tb.bio_caninos,
        tb.bio_isquiones,
        ROW_NUMBER() OVER(PARTITION BY tb.fk_animal ORDER BY tb.bio_fecha DESC, tb.pk_historial DESC) as rn
      FROM
        Tbl_biometria tb
    ) SELECT * FROM maxBiometricRow WHERE rn = 1
) AS sb_1
ON sb_0.id_arete = sb_1.bio_fk_animal
LEFT JOIN (
  WITH maxSampleRow AS (
    SELECT
      tm.FK_animal AS muestra_fk_animal,
      tm.rep_hora_inicio,
      tm.rep_hora_fin,
      tm.tem_inicio,
      tm.temp_final,
      tm.muestra_volumen,
      tm.muestra_color,
      tm.observacion,
      tm.num_maniqui,
      tm.rep_fecha,
      tm.muestra_filancia,
      tm.muestra_ph,
      ROW_NUMBER() OVER(PARTITION BY tm.fk_animal ORDER BY tm.rep_fecha DESC, tm.pk_muestra DESC) AS rn
    FROM
      Tbl_muestra tm
) SELECT * FROM maxSampleRow WHERE rn = 1
) AS sb_2
ON sb_1.bio_fk_animal = sb_2.muestra_fk_animal
LEFT JOIN (
  WITH maxReproductionRow AS (
    SELECT
      tb.rep_snd_gurural,
      tb.rep_impetu,
      tb.rep_nderribo,
      tb.rep_derribo,
      tb.rep_tiempo_copula,
      tb.FK_macho AS reproduction_fk_animal,
      tb.FK_hembra,
      tb.rep_observacion,
      ROW_NUMBER() OVER (PARTITION BY tb.fk_macho ORDER BY tb.rep_fecha DESC, tb.pk_reproduccion DESC) AS rn
    FROM Tbl_reproduccion tb
  ) SELECT * FROM maxReproductionRow WHERE rn = 1
) AS sb_3
ON sb_2.muestra_fk_animal = sb_3.reproduction_fk_animal
LEFT JOIN
(
  WITH maxVellonRow AS
  (
    SELECT
      tv.pk_vellon,
      tv.vellon_calce,
      tv.vellon_clase,
      tv.vellon_color,
      tv.vellon_definicion,
      tv.vellon_densidad,
      tv.vellon_longitudmecha,
      tv.vellon_observacion,
      tv.vellon_tuco,
      tv.vellon_diametro,
      tv.vellon_uniformidad,
      tv.fk_animal AS vellon_fk_animal,
      ROW_NUMBER() OVER(PARTITION BY fk_animal ORDER BY vellon_fecha DESC, pk_vellon DESC) AS rn
    FROM
      tbl_vellon tv
  ) SELECT * FROM maxVellonRow WHERE rn = 1
) AS sb_4
ON sb_1.bio_fk_animal = sb_4.vellon_fk_animal;

DROP VIEW IF EXISTS vw_sabana_hembra;

CREATE VIEW vw_sabana_hembra AS
SELECT
  sb_0.id_arete,
  sb_0.sexo,
  sb_0.raza_tipo,
  sb_0.Especie_tipo,
  sb_0.fecha_ingreso,
  CONCAT(
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, sb_0.fecha_ingreso)) + FLOOR(sb_0.ingreso_edad / 12), ' años, ',
    EXTRACT(MONTH FROM AGE(CURRENT_DATE, sb_0.fecha_ingreso)) + ROUND(sb_0.ingreso_edad % 12,0), ' meses'
  ) AS fmdate,
  sb_1.bio_peso,
  sb_1.bio_condicionCorporal,
  sb_1.bio_largoCabeza,
  sb_1.bio_anchoCabeza,
  sb_1.bio_largoOrejas,
  sb_1.bio_largoCuello,
  sb_1.bio_largoCuerpo,
  sb_1.bio_alturaCruz,
  sb_1.bio_anchoGrupa,
  sb_1.bio_altoGrupa,
  sb_1.bio_amplitudPecho,
  sb_1.bio_circunferenciaCuerpo,
  sb_1.bio_aplomoAnterior,
  sb_1.bio_aplomoPosterior,
  sb_1.bio_comisuraVulvar,
  sb_1.bio_cantDentaria,
  sb_1.bio_caninos,
  CASE 
    WHEN sb_1.bio_isquiones = 0.0 THEN 'No se registro'
    ELSE  to_char(sb_1.bio_isquiones, 'FM999999999.00')
  END AS bio_isquiones,
  sb_2.vellon_calce,
  sb_2.vellon_clase,
  sb_2.vellon_color,
  sb_2.vellon_definicion,
  sb_2.vellon_densidad,
  sb_2.vellon_longitudmecha,
  sb_2.vellon_observacion,
  CASE 
    WHEN sb_2.vellon_tuco THEN 'Si'
    ELSE  'No'
  END AS vellon_tuco,
  CASE 
    WHEN sb_2.vellon_uniformidad THEN 'Si'
    ELSE  'No'
  END AS vellon_uniformidad,
  sb_2.vellon_diametro
FROM (
  SELECT
    ta.id_arete,
    ta.sexo,
    tr.raza_tipo,
    te.Especie_tipo,
    tef.ingreso_edad,
    tef.fecha_ingreso
  FROM Tbl_animal ta
  INNER JOIN Tbl_especie te
    ON te.PK_especie = ta.FK_especie
  INNER JOIN Tbl_animal_raza tr
    ON tr.PK_raza = ta.FK_raza
  INNER JOIN tbl_animal_fecha tef
    ON tef.fk_arete = ta.id_arete
  WHERE
    sexo = 'Hembra'  -- Corrección aquí, usamos comillas simples para valores literales
) AS sb_0
LEFT JOIN (
  WITH maxBiometricRow AS (
    SELECT
      tb.FK_animal AS bio_fk_animal,
      tb.bio_peso,
      tb.bio_condicionCorporal,
      tb.bio_largoCabeza,
      tb.bio_anchoCabeza,
      tb.bio_largoOrejas,
      tb.bio_largoCuello,
      tb.bio_largoCuerpo,
      tb.bio_alturaCruz,
      tb.bio_anchoGrupa,
      tb.bio_altoGrupa,
      tb.bio_amplitudPecho,
      tb.bio_circunferenciaCuerpo,
      tb.bio_aplomoAnterior,
      tb.bio_aplomoPosterior,
      tb.bio_comisuraVulvar,
      tb.bio_cantDentaria,
      tb.bio_caninos,
      tb.bio_isquiones,
      ROW_NUMBER() OVER(PARTITION BY tb.fk_animal ORDER BY tb.bio_fecha DESC, tb.pk_historial DESC) as rn
    FROM
      Tbl_biometria tb
  ) SELECT * FROM maxBiometricRow WHERE rn = 1
) AS sb_1
ON sb_0.id_arete = sb_1.bio_fk_animal
LEFT JOIN(    -- vellon
  WITH maxVellonRow AS
  (
    SELECT
      tv.pk_vellon,
      tv.vellon_calce,
      tv.vellon_clase,
      tv.vellon_color,
      tv.vellon_definicion,
      tv.vellon_densidad,
      tv.vellon_longitudmecha,
      tv.vellon_observacion,
      tv.vellon_tuco,
      tv.vellon_diametro,
      tv.vellon_uniformidad,
      tv.fk_animal AS vellon_fk_animal,
      ROW_NUMBER() OVER(PARTITION BY fk_animal ORDER BY vellon_fecha DESC, pk_vellon DESC) AS rn
    FROM
      tbl_vellon tv
  ) SELECT * FROM maxVellonRow WHERE rn = 1
) AS sb_2
ON sb_1.bio_fk_animal = sb_2.vellon_fk_animal;


DROP VIEW IF EXISTS vw_sabana_macho;

CREATE VIEW vw_sabana_macho AS
SELECT
  sb_0.id_arete,
  sb_0.sexo,
  sb_0.raza_tipo,
  sb_0.Especie_tipo,
    CONCAT(
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, sb_0.fecha_ingreso)) + FLOOR(sb_0.ingreso_edad / 12), ' años, ',
    EXTRACT(MONTH FROM AGE(CURRENT_DATE, sb_0.fecha_ingreso)) + ROUND(sb_0.ingreso_edad % 12,0), ' meses'
  ) AS fmdate,
  sb_1.bio_peso,
  sb_1.bio_condicionCorporal,
  sb_1.bio_largoCabeza,
  sb_1.bio_anchoCabeza,
  sb_1.bio_largoOrejas,
  sb_1.bio_largoCuello,
  sb_1.bio_largoCuerpo,
  sb_1.bio_alturaCruz,
  sb_1.bio_anchoGrupa,
  sb_1.bio_altoGrupa,
  sb_1.bio_amplitudPecho,
  sb_1.bio_circunferenciaCuerpo,
  sb_1.bio_aplomoAnterior,
  sb_1.bio_aplomoPosterior,
  sb_1.bio_cantDentaria,
  sb_1.bio_caninos,
  CASE 
    WHEN sb_1.bio_isquiones = 0.0 THEN 'No se registro'
    ELSE  to_char(sb_1.bio_isquiones, 'FM999999999.00')
  END AS bio_isquiones,
  CONCAT('A: ', ROUND(sb_1.bio_tde_ancho, 2), ', cm L: ', ROUND(sb_1.bio_tde_largo,2), ' cm') AS tes_derecho,
  CONCAT('A: ', ROUND(sb_1.bio_tiz_ancho, 2), ', cm L: ', ROUND(sb_1.bio_tiz_largo,2), ' cm') AS tes_izquierdo,
  sb_4.vellon_calce,
  sb_4.vellon_clase,
  sb_4.vellon_color,
  sb_4.vellon_definicion,
  sb_4.vellon_densidad,
  sb_4.vellon_longitudmecha,
  CASE 
    WHEN sb_4.vellon_tuco THEN 'Si'
    ELSE  'No'
  END AS vellon_tuco,
  CASE 
    WHEN sb_4.vellon_uniformidad THEN 'Si'
    ELSE  'No'
  END AS vellon_uniformidad,
  sb_4.vellon_diametro,
  sb_2.rep_hora_inicio,
  sb_2.rep_hora_fin,
  sb_2.tem_inicio,
  sb_2.temp_final,
  sb_2.muestra_volumen,
  sb_2.muestra_color,
  sb_2.observacion,
  sb_2.num_maniqui,
  sb_2.rep_fecha,
  sb_2.muestra_filancia,
  sb_2.muestra_ph,
  sb_3.rep_snd_gurural,
  CONCAT(
    ROUND(sb_3.rep_impetu / 60, 0), ' min, ',
    ROUND(sb_3.rep_impetu % 60,0), ' seg'
  ) AS rep_impetu,
  CONCAT(
    ROUND(sb_3.rep_derribo / 3600,0), ' hr, ',
    ROUND((sb_3.rep_derribo % 3600) / 60, 0), ' min, ',
    ROUND(sb_3.rep_derribo % 60,0), ' seg'
    ) AS rep_derribo,
  CONCAT(
    ROUND(sb_3.rep_tiempo_copula / 3600,0), ' hr, ',
    ROUND((sb_3.rep_tiempo_copula % 3600) / 60, 0), ' min, ',
    ROUND(sb_3.rep_tiempo_copula % 60,0), ' seg'
    ) AS rep_tiempo_copula,
  sb_3.FK_hembra
FROM (
  SELECT
    ta.id_arete,
    ta.sexo,
    tr.raza_tipo,
    te.Especie_tipo,
    tef.ingreso_edad,
    tef.fecha_ingreso
  FROM Tbl_animal ta
  INNER JOIN Tbl_especie te
    ON te.PK_especie = ta.FK_especie
  INNER JOIN Tbl_animal_raza tr
    ON tr.PK_raza = ta.FK_raza
  INNER JOIN tbl_animal_fecha tef
    ON tef.fk_arete = ta.id_arete
  WHERE
    ta.sexo = 'Macho'  -- Corrección aquí, usamos comillas simples para valores literales
) AS sb_0
LEFT JOIN (
  WITH maxBiometricRow AS (
      SELECT
        tb.FK_animal AS bio_fk_animal,
        tb.bio_peso,
        tb.bio_condicionCorporal,
        tb.bio_largoCabeza,
        tb.bio_anchoCabeza,
        tb.bio_largoOrejas,
        tb.bio_largoCuello,
        tb.bio_largoCuerpo,
        tb.bio_alturaCruz,
        tb.bio_anchoGrupa,
        tb.bio_altoGrupa,
        tb.bio_amplitudPecho,
        tb.bio_circunferenciaCuerpo,
        tb.bio_aplomoAnterior,
        tb.bio_aplomoPosterior,
        tb.bio_tde_ancho,
        tb.bio_tde_largo,
        tb.bio_tiz_ancho,
        tb.bio_tiz_largo,
        tb.bio_cantDentaria,
        tb.bio_caninos,
        tb.bio_isquiones,
        ROW_NUMBER() OVER(PARTITION BY tb.fk_animal ORDER BY tb.bio_fecha DESC, tb.pk_historial DESC) as rn
      FROM
        Tbl_biometria tb
    ) SELECT * FROM maxBiometricRow WHERE rn = 1
) AS sb_1
ON sb_0.id_arete = sb_1.bio_fk_animal
LEFT JOIN (
  WITH maxSampleRow AS (
    SELECT
      tm.FK_animal AS muestra_fk_animal,
      tm.rep_hora_inicio,
      tm.rep_hora_fin,
      tm.tem_inicio,
      tm.temp_final,
      tm.muestra_volumen,
      tm.muestra_color,
      tm.observacion,
      tm.num_maniqui,
      tm.rep_fecha,
      tm.muestra_filancia,
      tm.muestra_ph,
      ROW_NUMBER() OVER(PARTITION BY tm.fk_animal ORDER BY tm.rep_fecha DESC, tm.pk_muestra DESC) AS rn
    FROM
      Tbl_muestra tm
) SELECT * FROM maxSampleRow WHERE rn = 1
) AS sb_2
ON sb_1.bio_fk_animal = sb_2.muestra_fk_animal
LEFT JOIN (
  WITH maxReproductionRow AS (
    SELECT
      tb.rep_snd_gurural,
      tb.rep_impetu,
      tb.rep_nderribo,
      tb.rep_derribo,
      tb.rep_tiempo_copula,
      tb.FK_macho AS reproduction_fk_animal,
      tb.FK_hembra,
      tb.rep_observacion,
      ROW_NUMBER() OVER (PARTITION BY tb.fk_macho ORDER BY tb.rep_fecha DESC, tb.pk_reproduccion DESC) AS rn
    FROM Tbl_reproduccion tb
  ) SELECT * FROM maxReproductionRow WHERE rn = 1
) AS sb_3
ON sb_2.muestra_fk_animal = sb_3.reproduction_fk_animal
LEFT JOIN
(
  WITH maxVellonRow AS
  (
    SELECT
      tv.pk_vellon,
      tv.vellon_calce,
      tv.vellon_clase,
      tv.vellon_color,
      tv.vellon_definicion,
      tv.vellon_densidad,
      tv.vellon_longitudmecha,
      tv.vellon_observacion,
      tv.vellon_tuco,
      tv.vellon_diametro,
      tv.vellon_uniformidad,
      tv.fk_animal AS vellon_fk_animal,
      ROW_NUMBER() OVER(PARTITION BY fk_animal ORDER BY vellon_fecha DESC, pk_vellon DESC) AS rn
    FROM
      tbl_vellon tv
  ) SELECT * FROM maxVellonRow WHERE rn = 1
) AS sb_4
ON sb_1.bio_fk_animal = sb_4.vellon_fk_animal;


/* #################### INITAL TABLE ################# */
DROP VIEW IF EXISTS initial_table;
CREATE VIEW initial_table AS
SELECT
  tb2.id_arete,
  tb1.fmdate,
  tb2.especie_tipo,
  tb2.raza_tipo,
  tb3.ultimo_peso,
  tb3.penultimo_peso,
  tb3.diferencia_peso,
  tb4.rep_fecha,
  tb4.fecha_futura,
  tb2.sexo,
  CASE 
    WHEN tb3.diferencia_peso > 0 AND tb3.penultimo_peso IS NULL THEN  1
    ELSE  0
  END AS peso_state
FROM
  (
    SELECT
      tf.fk_arete,
      CONCAT(
      EXTRACT(YEAR FROM AGE(CURRENT_DATE, tf.fecha_ingreso)) + FLOOR(tf.ingreso_edad / 12), ' : ',
      EXTRACT(MONTH FROM AGE(CURRENT_DATE, tf.fecha_ingreso)) + ROUND(tf.ingreso_edad % 12,0)
      ) AS fmdate
    FROM
      tbl_animal_fecha tf
  ) AS tb1
INNER JOIN
  (
    SELECT
      ta.id_arete,
      ta.sexo,
      te.especie_tipo,
      tr.raza_tipo
    FROM tbl_animal ta
      INNER JOIN tbl_animal_raza tr
      ON ta.fk_raza = tr.pk_raza
      INNER JOIN tbl_especie te
      ON ta.fk_especie = te.pk_especie
  ) AS tb2
  ON tb1.fk_arete = tb2.id_arete
LEFT JOIN
  (
    WITH BiometriaOrdenada AS (
      SELECT
        FK_animal,
        bio_peso,
        ROW_NUMBER() OVER (PARTITION BY FK_animal ORDER BY bio_fecha DESC) AS rn,
        COUNT(*) OVER (PARTITION BY FK_animal) AS total_registros
      FROM
        Tbl_biometria
    )
    SELECT
      b1.FK_animal,
      b1.bio_peso AS ultimo_peso,
      b2.bio_peso AS penultimo_peso,
      CASE
        WHEN b1.total_registros > 1 AND b2.bio_peso IS NOT NULL THEN b1.bio_peso - b2.bio_peso
        ELSE b1.bio_peso
      END AS diferencia_peso
    FROM
      BiometriaOrdenada b1
    LEFT JOIN
      BiometriaOrdenada b2
    ON
      b1.FK_animal = b2.FK_animal
      AND b1.rn = 1
      AND b2.rn = 2
    WHERE
      b1.rn = 1
  ) AS tb3
  ON tb2.id_arete = tb3.fk_animal
LEFT JOIN
  (
    SELECT
      tu.fk_animal,
      tu.rep_fecha,
      (tu.rep_fecha + '7 days'::INTERVAL)::DATE AS fecha_futura
    FROM
      tbl_muestra tu
    INNER JOIN
    (
      SELECT
        fk_animal,
        MAX(rep_fecha) AS max_fecha
      FROM
        Tbl_muestra
      GROUP BY
        FK_animal
    ) AS mx
    ON tu.fk_animal = mx.fk_animal
    AND tu.rep_fecha = mx.max_fecha
  ) AS tb4
  ON tb3.fk_animal = tb4.fk_animal;
