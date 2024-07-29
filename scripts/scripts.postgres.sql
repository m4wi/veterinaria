-- Active: 1721540523074@@127.0.0.1@5432@postgres@public

/* GUARDAR ANIMALES ........ */
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

SELECT saveAnimal('HS-15', 'Hembra', 1, 1, 'HS-2', 'HS-4', 'Nacimiento', '2021-12-04', 2.5);


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

SELECT insertBiometria(
    CURRENT_DATE,
    40.2,
    4.5,
    10.2,
    10.2,
    4.5,
    7.6,
    25.6,
    5.6,
    45.6,
    45.6,
    47.6,
    74.6,
    'Normal',
    'Normal',
    2.4,
    3.5,
    6.5,
    4.5,
    4.6,
    'HS-3',
    'Llena',
    '2 caninos (1 arriba, 1 abajo)',
    12.5
);

/* Reproduccion */
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

SELECT insertReproduccion(
    'No',               -- rep_snd_gurural
    4.5,                -- rep_impetu
    3.5,                -- rep_derribo
    4.8,                -- rep_tiempo_copula
    'ninguna',          -- rep_observacion
    CURRENT_DATE,       -- rep_fecha
    'HS-1',             -- FK_macho
    2,                  -- rep_nderribo
    'HS-3'              -- FK_hembra
);


/* Muestra extraccion */

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


SELECT muestra_ph FROM tbl_muestra;

SELECT saveMuestra(
    CURRENT_DATE,        -- rep_fecha
    '10:41',            -- rep_hora_inicio
    '10:42',            -- rep_hora_fin
    78.5,               -- tem_inicio
    77.5,               -- temp_final
    3.4,                -- muestra_volumen
    'Blanco',           -- muestra_color
    'Ninguna',          -- observacion
    'HS-1',             -- FK_animal
    1,                   -- num_maniqui
    1.5,
    1.5
);

/* SAVE VELLON */

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

SELECT saveVellon(
    'Bueno',            -- vellon_densidad
    'Alto',             -- vellon_definicion
    4.5,                -- vellon_longitudMecha
    'Alto',             -- vellon_calce
    'Alto',             -- vellon_uniformidad
    'Alto',             -- vellon_tuco
    'Color',            -- vellon_color
    'A',                -- vellon_clase
    'ninguna',          -- vellon_observacion
    'HS-3',             -- FK_animal
    CURRENT_DATE        -- vellon_fecha
);


INSERT INTO Tbl_usuario(username, password)
VALUES('Jimmy', '123456789');

SELECT
  count(*) as state
FROM
  Tbl_usuario
WHERE
  username = 'Jimmy'
  AND
  password = '123456789';


INSERT INTO Tbl_dosificacion(dsf_fecha, FK_producto, FK_animal, dsf_observacion)
VALUES
(CURRENT_DATE, 2, 'HS-1', 'ninguna');

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
  sb_1.bio_isquiones,
  CONCAT('A: ', ROUND(sb_1.bio_tde_ancho, 2), ', cm L: ', ROUND(sb_1.bio_tde_largo,2), ' cm') AS tes_derecho,
  CONCAT('A: ', ROUND(sb_1.bio_tiz_ancho), 2, ', cm L: ', ROUND(sb_1.bio_tiz_largo,2), ' cm') AS tes_izquierdo,
  sb_4.vellon_calce,
  sb_4.vellon_clase,
  sb_4.vellon_color,
  sb_4.vellon_definicion,
  sb_4.vellon_densidad,
  sb_4.vellon_longitudmecha,
  sb_4.vellon_tuco,
  sb_4.vellon_uniformidad,
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
  sb_3.rep_impetu,
  sb_3.rep_nderribo,
  sb_3.rep_derribo,
  sb_3.rep_tiempo_copula,
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

SELECT * FROM vw_sabana_general;

DROP VIEW IF EXISTS vw_sabana_hembra;

SELECT * FROM vw_sabana_hembra;


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
  sb_1.bio_isquiones,
  sb_2.vellon_calce,
  sb_2.vellon_clase,
  sb_2.vellon_color,
  sb_2.vellon_definicion,
  sb_2.vellon_densidad,
  sb_2.vellon_longitudmecha,
  sb_2.vellon_observacion,
  sb_2.vellon_tuco,
  sb_2.vellon_uniformidad,
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
      tb.bio_tde_ancho,
      tb.bio_tde_largo,
      tb.bio_tiz_ancho,
      tb.bio_tiz_largo,
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



-- Consultar la vista
SELECT * FROM vw_sabana_hembra;


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
  sb_1.bio_isquiones,
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
  sb_3.rep_impetu,
  sb_3.rep_nderribo,
  sb_3.rep_derribo,
  sb_3.rep_tiempo_copula,
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

-- Consultar la vista
SELECT * FROM vw_sabana_macho;





/* ######################################################################################## */


CREATE OR REPLACE FUNCTION getReproductionTable(
  p_macho VARCHAR DEFAULT NULL,
  p_start_date DATE DEFAULT NULL,
  p_end_date DATE DEFAULT NULL
)
RETURNS TABLE(
  rep_snd_gurural VARCHAR,
  rep_impetu INT,
  rep_nderribo INT,
  rep_derribo INT,
  rep_tiempo_copula NUMERIC,
  FK_macho VARCHAR,
  FK_hembra VARCHAR,
  rep_observacion VARCHAR,
  rep_fecha DATE
) AS $$
BEGIN
  RETURN QUERY
  SELECT
    ex.rep_snd_gurural,
    ex.rep_impetu,
    ex.rep_nderribo,
    ex.rep_derribo,
    ex.rep_tiempo_copula,
    ex.FK_macho,
    ex.FK_hembra,
    ex.rep_observacion,
    ex.rep_fecha
  FROM
    Tbl_reproduccion ex
  WHERE
    (ex.FK_macho = p_macho OR p_macho IS NULL)
    AND
    (ex.rep_fecha >= p_start_date OR p_start_date IS NULL)
    AND
    (ex.rep_fecha <= p_end_date OR p_end_date IS NULL);
END;
$$ LANGUAGE plpgsql;


SELECT * FROM getReproductionTable();

/* ********************************************* */

CREATE OR REPLACE FUNCTION getMuestraTable(
  p_animal VARCHAR DEFAULT NULL,
  p_start_date DATE DEFAULT NULL,
  p_end_date DATE DEFAULT NULL
)
RETURNS TABLE(
  rep_fecha DATE,
  rep_hora_inicio VARCHAR,
  rep_hora_fin VARCHAR,
  tem_inicio NUMERIC(5,2),
  temp_final NUMERIC(5,2),
  muestra_volumen NUMERIC(5,2),
  muestra_color VARCHAR(60),
  observacion VARCHAR(400),
  FK_animal VARCHAR(20),
  num_maniqui INTEGER
) AS $$
BEGIN
  RETURN QUERY
  SELECT
    mu.rep_fecha,
    mu.rep_hora_inicio,
    mu.rep_hora_fin,
    mu.tem_inicio,
    mu.temp_final,
    mu.muestra_volumen,
    mu.muestra_color,
    mu.observacion,
    mu.FK_animal,
    mu.num_maniqui
  FROM
    Tbl_muestra mu
  WHERE
    (mu.FK_animal = p_animal OR p_animal IS NULL)
    AND
    (mu.rep_fecha >= p_start_date OR p_start_date IS NULL)
    AND
    (mu.rep_fecha <= p_end_date OR p_end_date IS NULL);
END;
$$ LANGUAGE plpgsql;

SELECT * FROM getMuestraTable(NULL , '2024-07-21', '2024-07-22');



CREATE OR REPLACE FUNCTION getVellonTable(
  p_animal VARCHAR DEFAULT NULL,
  p_start_date DATE DEFAULT NULL,
  p_end_date DATE DEFAULT NULL
)
RETURNS TABLE(
  id_arete VARCHAR,
  vellon_fecha DATE,
  sexo VARCHAR,
  vellon_densidad VARCHAR,
  vellon_definicion VARCHAR,
  vellon_longitudMecha NUMERIC,
  vellon_calce VARCHAR,
  vellon_uniformidad VARCHAR,
  vellon_tuco VARCHAR,
  vellon_color VARCHAR,
  vellon_clase VARCHAR,
  vellon_observacion VARCHAR
) AS $$
BEGIN
  RETURN QUERY
  SELECT
    an.id_arete,
    ve.vellon_fecha,
    an.sexo,
    ve.vellon_densidad,
    ve.vellon_definicion,
    ve.vellon_longitudMecha,
    ve.vellon_calce,
    ve.vellon_uniformidad,
    ve.vellon_tuco,
    ve.vellon_color,
    ve.vellon_clase,
    ve.vellon_observacion
  FROM
    Tbl_vellon ve
  INNER JOIN
    Tbl_animal an
  ON
    an.id_arete = ve.FK_animal
  WHERE
    (ve.FK_animal = p_animal OR p_animal IS NULL)
    AND
    (ve.vellon_fecha >= p_start_date OR p_start_date IS NULL)
    AND
    (ve.vellon_fecha <= p_end_date OR p_end_date IS NULL);
END;
$$ LANGUAGE plpgsql;

SELECT * FROM getVellonTable('HS-1', '2024-07-21', '2024-07-22');





CREATE OR REPLACE FUNCTION getDosificacionTable(
  p_animal VARCHAR DEFAULT NULL,
  p_start_date DATE DEFAULT NULL,
  p_end_date DATE DEFAULT NULL
)
RETURNS TABLE(
  PK_dosificacion INT,
  dsf_fecha DATE,
  FK_animal VARCHAR,
  producto_nombre VARCHAR,
  producto_tipo VARCHAR
) AS $$
BEGIN
  RETURN QUERY
  SELECT
    tb.PK_dosificacion,
    tb.dsf_fecha,
    tb.FK_animal,
    po.producto_nombre,
    po.producto_tipo
  FROM
    Tbl_dosificacion tb
  INNER JOIN
    Tbl_producto po
  ON
    po.PK_producto = tb.FK_producto
  WHERE
    (tb.FK_animal = p_animal OR p_animal IS NULL)
    AND
    (tb.dsf_fecha >= p_start_date OR p_start_date IS NULL)
    AND
    (tb.dsf_fecha <= p_end_date OR p_end_date IS NULL);
END;
$$ LANGUAGE plpgsql;

SELECT * FROM getDosificacionTable('HS-1', '2024-07-21', '2024-07-21');


CREATE OR REPLACE FUNCTION getDosificacionTable(
  p_animal VARCHAR DEFAULT NULL,
  p_start_date DATE DEFAULT NULL,
  p_end_date DATE DEFAULT NULL
)
RETURNS TABLE(
  PK_dosificacion INT,
  dsf_fecha DATE,
  FK_animal VARCHAR,
  producto_nombre VARCHAR,
  producto_tipo VARCHAR
) AS $$
BEGIN
  RETURN QUERY
  SELECT
    tb.PK_dosificacion,
    tb.dsf_fecha,
    tb.FK_animal,
    po.producto_nombre,
    po.producto_tipo
  FROM
    Tbl_dosificacion tb
  INNER JOIN
    Tbl_producto po
  ON
    po.PK_producto = tb.FK_producto
  WHERE
    (tb.FK_animal = p_animal OR p_animal IS NULL)
    AND
    (p_start_date IS NULL OR tb.dsf_fecha >= p_start_date)
    AND
    (p_end_date IS NULL OR tb.dsf_fecha <= p_end_date);
END;
$$ LANGUAGE plpgsql;
SELECT * FROM getDosificacionTable('HS-1', '2024-07-21', '2024-07-22');


/* #################### FN GET BIOMETRIA TABLE ################# */
CREATE OR REPLACE FUNCTION getAnimalBiometria(
  p_animal_id VARCHAR,
  p_start_date DATE,
  p_end_date DATE
)
RETURNS TABLE(
  PK_historial INT,
  FK_animal VARCHAR,
  sexo VARCHAR,
  edad_temporal NUMERIC,
  bio_cantDentaria VARCHAR,
  bio_caninos VARCHAR,
  bio_fecha DATE,
  bio_peso NUMERIC,
  bio_condicionCorporal NUMERIC,
  bio_largoCabeza NUMERIC,
  bio_anchoCabeza NUMERIC,
  bio_largoOrejas NUMERIC,
  bio_largoCuello NUMERIC,
  bio_largoCuerpo NUMERIC,
  bio_alturaCruz NUMERIC,
  bio_anchoGrupa NUMERIC,
  bio_altoGrupa NUMERIC,
  bio_amplitudPecho NUMERIC,
  bio_circunferenciaCuerpo NUMERIC,
  bio_aplomoAnterior VARCHAR,
  bio_aplomoPosterior VARCHAR,
  bio_tde_ancho NUMERIC,
  bio_tde_largo NUMERIC,
  bio_tiz_ancho NUMERIC,
  bio_tiz_largo NUMERIC,
  bio_isquiones NUMERIC,
  bio_comisuraVulvar NUMERIC
) AS $$
BEGIN
  RETURN QUERY
  SELECT
    tb.PK_historial,
    tb.FK_animal,
    ta.sexo,
    ROUND(EXTRACT(EPOCH FROM (tb.bio_fecha::timestamp - tf.fecha_ingreso::timestamp)) / (365.25 * 24 * 3600), 2) AS edad_temporal,
    tb.bio_cantDentaria,
    tb.bio_caninos,
    tb.bio_fecha,
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
    tb.bio_isquiones,
    tb.bio_comisuraVulvar
  FROM
    Tbl_biometria tb
  INNER JOIN
    Tbl_animal_fecha tf
    ON tf.fk_arete = tb.FK_animal
  INNER JOIN
    Tbl_animal ta
    ON ta.id_arete = tb.FK_animal
  WHERE
    (tb.FK_animal = p_animal_id OR p_animal_id IS NULL)
    AND
    (p_start_date IS NULL OR tb.bio_fecha >= p_start_date)
    AND
    (p_end_date IS NULL OR tb.bio_fecha <= p_end_date);
END;
$$ LANGUAGE plpgsql;
SELECT * FROM getAnimalBiometria(NULL, NULL, NULL);
/* ################################################## */


/* #################### INITAL TABLE ################# */
DROP VIEW initial_table;
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

SELECT * FROM initial_table;

/* ################################################## */


SELECT
  *
FROM (
    SELECT
        tb.pk_historial,
        tb.FK_animal,
        tb.bio_fecha,
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
        ROW_NUMBER() OVER (PARTITION BY FK_animal ORDER BY bio_fecha DESC, pk_historial DESC) AS rn
    FROM
        Tbl_biometria tb
) AS subquery
WHERE
    rn = 1;