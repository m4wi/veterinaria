-- Active: 1721516370294@@localhost@3306@veterinaria2
SELECT * FROM `Tbl_animal`;

/* Insertando datos parametrizados */
INSERT INTO `Tbl_especie`(`Especie_tipo`) VALUES 
("Alpaca"),
("Llama");

INSERT INTO `Tbl_animal_raza`(raza_tipo) VALUES
("Suri"),
("Huacaya")
("chaku")
("k'ara Warizo");

CALL saveAnimal("HS-4", "Macho", 1, 1, NULL, NULL, "Trazlado", "20-05-01");

/* Datos de los animales */
INSERT INTO Tbl_animal(id_arete,sexo,FK_especie,FK_raza,FK_animal_madre,FK_animal_padre)
VALUES('HS-1','Macho',1 ,1 ,NULL, NULL);







DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS saveAnimal
(
  IN p_arete VARCHAR(20),
  IN p_sexo VARCHAR(10),
  IN p_especie VARCHAR(20),
  IN p_raza VARCHAR(20),
  IN p_padre VARCHAR(20),
  IN p_madre VARCHAR(20),
  IN p_tipo_ingreso VARCHAR(50),
  IN p_fecha_ingreso DATE
)
BEGIN
  START TRANSACTION;
  -- tabla animal
  INSERT INTO `Tbl_animal`(`PK_animal`,sexo,`FK_especie`,`FK_raza` ,`FK_animal_madre`, `FK_animal_padre`)
  VALUES(p_arete, p_sexo, p_especie, p_raza, p_padre, p_madre);
  --tabla fecha-animal
  INSERT INTO `Tbl_animal_fecha`(ingreso_tipo, fecha_ingreso, ingreso_edad, `Tbl_animal_ID_Arete`)
  VALUES(p_tipo_ingreso, p_fecha_ingreso, 0.0, p_arete);
  COMMIT; 
END$$
DELIMITER ;;


DELIMITER $$
CREATE PROCEDURE saveBiometrica(
    IN p_peso FLOAT(5,2),
    In p_condicionCorporal FLOAT(5,2),
    IN p_largoCabeza FLOAT(5,3),
    IN p_anchoCabeza FLOAT(5,3),
	  IN p_largoOrejas FLOAT(5,3),
    IN p_largoCuello FLOAT(5,3),
    IN p_largoCuerpo FLOAT(5,3),
    IN p_alturaCruz FLOAT(5,3),
    IN p_anchoGrupa FLOAT(5,3),
    IN p_amplitudPecho FLOAT(5,3),
    IN p_cirCuerpo FLOAT(5,3),
    IN p_aplomoAnterior VARCHAR(20),
    IN p_aplomoPosterior VARCHAR(20),
    IN p_tde_ancho FLOAT(5,3),
    IN p_tde_largo FLOAT(5,3),
    IN p_tiz_ancho FLOAT(5,3),
    IN p_tiz_largo FLOAT(5,3),
    IN p_comisuraVulvar FLOAT(5,3),
    IN p_FK_animal VARCHAR(20),
    IN p_canDentaria VARCHAR(50),
    IN p_caninos VARCHAR(100)
)
BEGIN
	INSERT INTO Tbl_biometria(bio_fecha, bio_peso, `bio_condicionCorporal`, `bio_largoCabeza`, `bio_anchoCabeza`, `bio_largoOrejas`, `bio_largoCuello`, `bio_largoCuerpo`, `bio_alturaCruz`, `bio_anchoGrupa`, `bio_altoGrupa`, `bio_amplitudPecho`, `bio_circunferenciaCuerpo`, `bio_aplomoAnterior`, `bio_aplomoPosterior`, bio_tde_ancho, bio_tde_largo, bio_tiz_ancho, bio_tde_largo, `bio_comisuraVulvar`, `FK_animal`, `bio_cantDentaria`, bio_caninos)
  VALUES
  (CURDATE(),p_peso, p_condicionCorporal, p_largoCabeza, p_anchoCabeza, p_largoOrejas, p_largoCuello, p_largoCuerpo, p_alturaCruz, p_anchoGrupa, p_amplitudPecho, p_cirCuerpo, p_aplomoAnterior, p_aplomoPosterior, p_tde_ancho, p_tde_largo, p_tiz_ancho, p_tiz_largo, p_comisuraVulvar, p_FK_animal, p_canDentaria, p_caninos)
END$$

DELIMITER ;
DELIMITER $$
CREATE TRIGGER generarEdad BEFORE INSERT ON Tbl_biometria FOR EACH ROW
BEGIN
  SELECT
    fe.ingreso_edad
  FROM `Tbl_animal` AS an
  INNER JOIN `Tbl_animal_fecha` fe
    ON fe.`Tbl_animal_ID_Arete` = an.`ID_Arete`
  WHERE
    an.`ID_Arete` = NEW.FK_animal;

  SET NEW.bio_edadTemporal = SELECT
END$$
DELIMITER ;

SELECT
  fe.ingreso_edad
FROM `Tbl_animal` AS an
INNER JOIN `Tbl_animal_fecha` fe
  ON fe.`Tbl_animal_ID_Arete` = an.`ID_Arete`
WHERE
  an.`ID_Arete` = "HS-1";






/* */

INSERT INTO `Tbl_biometria`(`PK_historial`,bio_fecha, `bio_edadTemporal`, bio_peso, `bio_condicionCorporal`, `bio_largoCabeza`, `bio_anchoCabeza`, `bio_largoOrejas`, `bio_largoCuello`, `bio_largoCuerpo`, `bio_alturaCruz`, `bio_anchoGrupa`, `bio_altoGrupa`,`bio_amplitudPecho`, `bio_circunferenciaCuerpo`, `bio_aplomoAnterior`, `bio_aplomoPosterior`,bio_tde_ancho,bio_tde_largo,bio_tiz_ancho,bio_tiz_largo, `FK_animal`, `bio_cantDentaria`, bio_caninos)
VALUES
(1,"12-12-20", 1.5, 40.2, 4.5, 10.2, 10.2, 4.5, 7.6, 25.6, 5.6, 45.6, 45.6, 45.6, 47.6, "Normal", "Normal", 2.4, 3.5, 6.5, 4.5,"HS-1", "Llena", "2 caninos (1 arriba, 1 abajo)"),
(2,"30-01-21", 1.5, 40.2, 4.5, 10.2, 10.2, 4.5, 7.6, 25.6, 5.6, 45.6, 45.6, 45.6, 47.6, "Normal", "Normal", 2.4, 3.5, 6.5, 4.5,"HS-1", "Llena", "2 caninos (1 arriba, 1 abajo)"),
(3,"12-12-20", 1.5, 40.2, 4.5, 10.2, 10.2, 4.5, 7.6, 25.6, 5.6, 45.6, 45.6, 45.6, 47.6, "Normal", "Normal", 2.4, 3.5, 6.5, 4.5,"HX-10", "Llena", "2 caninos (1 arriba, 1 abajo)"),
(4,"12-12-20", 1.5, 40.2, 4.5, 10.2, 10.2, 4.5, 7.6, 25.6, 5.6, 45.6, 45.6, 45.6, 47.6, "Normal", "Normal", 2.4, 3.5, 6.5, 4.5,"HX-13", "Llena", "2 caninos (1 arriba, 1 abajo)"),
(5,"12-12-20", 1.5, 40.2, 4.5, 10.2, 10.2, 4.5, 7.6, 25.6, 5.6, 45.6, 45.6, 45.6, 47.6, "Normal", "Normal", 2.4, 3.5, 6.5, 4.5,"HS-1", "Llena", "2 caninos (1 arriba, 1 abajo)");



SELECT * FROM `Tbl_biometria` WHERE `FK_animal` = "HS-1";


INSERT INTO `Tbl_vellon`(`PK_vellon`, vellon_densidad, vellon_definicion, `vellon_longitudMecha`, vellon_calce, vellon_uniformidad, vellon_tuco, vellon_color, vellon_clase, vellon_observacion, `FK_animal`, vellon_fecha)
VALUES
(2, "Alto", "Alto", 5.2, "Alto", "Alto", "Alto", "C", "A", "ninguna","HS-1","30-12-12");


INSERT INTO `Tbl_muestra`(`PK_muestra`, rep_snd_gurural, rep_impetu, rep_derribo, rep_tiempo_copula, rep_observacion, rep_fecha, `FK_macho`, rep_nderribo, `FK_hembra`) VALUES
(2, "Bajo", 15, 15, 1.5, "ninguna", "21-02-01","HS-1",2 , "HX-10");


INSERT INTO `Tbl_reproduccion`(`PK_reproduccion`, rep_fecha, rep_hora_inicio, rep_hora_fin, tem_inicio, temp_final, muestra_volumen, muestra_color, observacion, `FK_animal`, num_maniqui) VALUES
(1, "30-12-12","14:25","14:30",44.5,35.6,2.5,"BT","ninguna","HS-1",1);



SELECT
  ar.`PK_animal`,
  ar.sexo,
  rar.raza_tipo,
  es.`Especie_tipo`,
  bt.bio_fecha,
  bt.`bio_edadTemporal`,
  bt.bio_peso,
  bt.`bio_condicionCorporal`,
  bt.`bio_largoCabeza`,
  bt.`bio_anchoCabeza`,
  bt.`bio_largoOrejas`,
  bt.`bio_largoCuello`,
  bt.`bio_largoCuerpo`,
  bt.`bio_alturaCruz`,
  bt.`bio_anchoGrupa`,
  bt.`bio_altoGrupa`,
  bt.`bio_amplitudPecho`,
  bt.`bio_circunferenciaCuerpo`,
  bt.`bio_aplomoAnterior`,
  bt.`bio_aplomoPosterior`,
  bt.bio_tde_ancho,
  bt.bio_tde_largo,
  bt.bio_tiz_ancho,
  bt.bio_tiz_largo,
  bt.`FK_animal`,
  bt.`bio_cantDentaria`,
  bt.bio_caninos
FROM
  `Tbl_animal` AS ar
  INNER JOIN `Tbl_animal_raza` AS rar
  ON rar.`PK_raza` = ar.`FK_raza`
  INNER JOIN `Tbl_especie` AS es
  ON es.`PK_especie` = ar.`FK_especie`
  RIGHT JOIN `Tbl_biometria` AS bt
  ON bt.`FK_animal` = ar.`PK_animal`;


SELECT
  ve.`PK_vellon`,
  ve.vellon_densidad,
  ve.vellon_definicion,
  ve.`vellon_longitudMecha`,
  ve.vellon_calce,
  ve.vellon_uniformidad,
  ve.vellon_tuco,
  ve.vellon_color,
  ve.vellon_clase,
  ve.vellon_observacion,
  ve.`FK_animal`,
  ve.vellon_fecha
FROM
  `Tbl_vellon` AS ve;




SELECT
  mu.rep_snd_gurural,
  mu.rep_nderribo,
  mu.rep_derribo,
  mu.rep_fecha,
  mu.rep_impetu,
  mu.rep_tiempo_copula,
  mu.`FK_hembra`,
  rep.num_maniqui,
  rep.rep_hora_inicio,
  rep.rep_hora_fin,
  rep.tem_inicio,
  rep.temp_final,
  rep.muestra_volumen,
  rep.muestra_color
FROM
  `Tbl_muestra` AS mu
  INNER JOIN `Tbl_reproduccion` AS rep
  ON mu.`FK_macho` = rep.`FK_animal`
;


/* Functions */
/*
DROP FUNCTION IF EXISTS `validarAnimal`;
CREATE FUNCTION ``*/

SELECT
  COUNT(*) AS state
FROM
  `Tbl_animal`
WHERE
  `PK_animal` = "HS-1";








DROP PROCEDURE

CALL saveBiometrica(40.2, 4.5, 10.2, 10.2, 4.5, 7.6, 25.6, 5.6, 45.6, 45.6, 47.6, "Normal", "Normal", 2.4, 3.5, 6.5, 4.5, 4.6,"HS-1", "Llena", "2 caninos (1 arriba, 1 abajo)");

INSERT INTO Tbl_biometria(bio_fecha, bio_peso, `bio_condicionCorporal`, `bio_largoCabeza`, `bio_anchoCabeza`, `bio_largoOrejas`, `bio_largoCuello`, `bio_largoCuerpo`, `bio_alturaCruz`, `bio_anchoGrupa`, `bio_altoGrupa`, `bio_amplitudPecho`, `bio_circunferenciaCuerpo`, `bio_aplomoAnterior`, `bio_aplomoPosterior`, bio_tde_ancho, bio_tde_largo, bio_tiz_ancho, bio_tde_largo, `bio_comisuraVulvar`, `FK_animal`, `bio_cantDentaria`, bio_caninos)
VALUES
(CURDATE(),40.2, 4.5, 10.2, 10.2, 4.5, 7.6, 25.6, 5.6, 45.6, 45.6, 47.6, "Normal", "Normal", 2.4, 3.5, 6.5, 4.5, 4.6,"HS-8", "Llena", "2 caninos (1 arriba, 1 abajo)");

DROP TRIGGER generarEdad;

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
  Isquiones
) VALUES (
  CURDATE(),
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

INSERT INTO Tbl_reproduccion(rep_snd_gurural, rep_impetu, rep_derribo, rep_tiempo_copula, rep_observacion, rep_fecha, FK_macho, rep_nderribo, FK_hembra)
VALUES("No", 4.5, 3.5, 4.8, "ninguna", CURDATE(), "HS-3",2,"HS-3");

INSERT INTO Tbl_muestra(rep_fecha, rep_hora_inicio, rep_hora_fin, tem_inicio, temp_final, muestra_volumen, muestra_color, observacion, FK_animal, num_maniqui)
VALUES(CURDATE(), "10:41", "10:42", 78.5, 77.5, 3.4, "Blanco", "Ninguna","HS-3",1);

INSERT INTO Tbl_vellon(vellon_densidad, vellon_definicion, vellon_longitudMecha, vellon_calce, vellon_uniformidad, vellon_tuco, vellon_color, vellon_clase, vellon_observacion, FK_animal, vellon_fecha)
VALUES
("Bueno", "Alto", 4.5, "Alto", "Alto", "Alto", "Color", "A", "ninguna", "HS-2", CURDATE());


INSERT INTO Tbl_usuario(username, password)
VALUES("Jimmy", "123456789");

SELECT
  COUNT(*)
FROM
  Tbl_usuario u
WHERE
  u.username = "Jimmy"
  AND
  u.password = "123456789";


/* Todo : parametrizar la tabla*/
INSERT INTO Tbl_producto(producto_nombre, producto_tipo)
VALUES
("Antiparasitario", "Marca 1"),
("Vitamina", "Marca 2");

INSERT INTO Tbl_dosificacion(dsf_fecha, FK_producto, FK_animal)
VALUES
(CURDATE(), 1, "HS-1");

  SELECT
    ta.ID_Arete,
    ta.sexo,
    tr.raza_tipo,
    te.Especie_tipo
  FROM Tbl_animal ta
  INNER JOIN Tbl_especie te
    ON te.PK_especie = ta.FK_especie
  INNER JOIN Tbl_animal_raza tr
    ON tr.PK_raza = ta.FK_raza;

/* Sabanero */
CREATE VIEW vw_sabana_general AS
SELECT
  *
FROM (
  SELECT
    ta.ID_Arete,
    ta.sexo,
    tr.raza_tipo,
    te.Especie_tipo
  FROM Tbl_animal ta
  INNER JOIN Tbl_especie te
    ON te.PK_especie = ta.FK_especie
  INNER JOIN Tbl_animal_raza tr
    ON tr.PK_raza = ta.FK_raza
) AS sb_0
LEFT JOIN(
  SELECT
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
    tb.bio_comisuraVulvar,
    tb.FK_animal,
    tb.bio_cantDentaria,
    tb.bio_caninos
  FROM
    Tbl_biometria tb
  INNER JOIN (
    SELECT
      FK_animal,
      MAX(bio_fecha) AS mxfecha
    FROM Tbl_biometria
    GROUP BY
      FK_animal
  ) AS rx
    ON rx.FK_animal = tb.FK_animal
    AND rx.mxfecha = tb.bio_fecha
) AS sb_1
ON sb_0.ID_Arete = sb_1.FK_animal
LEFT JOIN(
  SELECT
    tm.FK_animal AS sb_2_id,
    tm.rep_hora_inicio,
    tm.rep_hora_fin,
    tm.tem_inicio,
    tm.temp_final,
    tm.muestra_volumen,
    tm.muestra_color,
    tm.observacion,
    tm.num_maniqui,
    tm.rep_fecha
  FROM
    Tbl_muestra tm
    INNER JOIN (
      SELECT
        FK_animal,
        MAX(rep_fecha) AS max_fecha
      FROM
        Tbl_muestra
      GROUP BY
        FK_animal
    ) AS max_dates
    ON tm.FK_animal = max_dates.FK_animal
    AND tm.rep_fecha = max_dates.max_fecha
) AS sb_2
ON sb_1.FK_animal = sb_2.sb_2_id
LEFT JOIN(
  SELECT
    tb.rep_snd_gurural,
    tb.rep_impetu,
    tb.rep_nderribo,
    tb.rep_derribo,
    tb.rep_tiempo_copula,
    tb.FK_macho,
    tb.FK_hembra,
    tb.rep_observacion
  FROM Tbl_reproduccion tb
  INNER JOIN (
    SELECT
      FK_macho,
      MAX(rep_fecha) AS mxfecha
    FROM Tbl_reproduccion
    GROUP BY
      FK_macho
  ) AS rx
    ON tb.FK_macho = rx.FK_macho AND
    tb.rep_fecha = rx.mxfecha
) AS sb_3
ON sb_2.sb_2_id = sb_3.FK_macho;

SELECT * FROM vw_sabana_general;
/* Para macho y hembras solo es un select nomas */




DROP VIEW IF EXISTS vw_sabana_hembra;
CREATE VIEW vw_sabana_hembra AS
SELECT
  *
FROM (
  SELECT
    ta.ID_Arete,
    ta.sexo,
    tr.raza_tipo,
    te.Especie_tipo
  FROM Tbl_animal ta
  INNER JOIN Tbl_especie te
    ON te.PK_especie = ta.FK_especie
  INNER JOIN Tbl_animal_raza tr
    ON tr.PK_raza = ta.FK_raza
  WHERE
    sexo = "Hembra"
) AS sb_0
LEFT JOIN(
  SELECT
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
    tb.bio_comisuraVulvar,
    tb.FK_animal,
    tb.bio_cantDentaria,
    tb.bio_caninos,
    tb.Isquiones
  FROM
    Tbl_biometria tb
  INNER JOIN (
    SELECT
      FK_animal,
      MAX(bio_fecha) AS mxfecha
    FROM Tbl_biometria
    GROUP BY
      FK_animal
  ) AS rx
    ON rx.FK_animal = tb.FK_animal
    AND rx.mxfecha = tb.bio_fecha
) AS sb_1
ON sb_0.ID_Arete = sb_1.FK_animal;

SELECT * FROM vw_sabana_hembra;



DROP VIEW vw_sabana_macho;
CREATE VIEW vw_sabana_macho AS
SELECT
  *
FROM (
  SELECT
    ta.ID_Arete,
    ta.sexo,
    tr.raza_tipo,
    te.Especie_tipo
  FROM Tbl_animal ta
  INNER JOIN Tbl_especie te
    ON te.PK_especie = ta.FK_especie
  INNER JOIN Tbl_animal_raza tr
    ON tr.PK_raza = ta.FK_raza
  WHERE
    sexo = "Macho"
) AS sb_0
LEFT JOIN(
  SELECT
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
    tb.FK_animal,
    tb.bio_cantDentaria,
    tb.bio_caninos,
    tb.Isquiones
  FROM
    Tbl_biometria tb
  INNER JOIN (
    SELECT
      FK_animal,
      MAX(bio_fecha) AS mxfecha
    FROM Tbl_biometria
    GROUP BY
      FK_animal
  ) AS rx
    ON rx.FK_animal = tb.FK_animal
    AND rx.mxfecha = tb.bio_fecha
) AS sb_1
ON sb_0.ID_Arete = sb_1.FK_animal
LEFT JOIN(
  SELECT
    tm.FK_animal AS sb_2_id,
    tm.rep_hora_inicio,
    tm.rep_hora_fin,
    tm.tem_inicio,
    tm.temp_final,
    tm.muestra_volumen,
    tm.muestra_color,
    tm.observacion,
    tm.num_maniqui,
    tm.rep_fecha
  FROM
    Tbl_muestra tm
    INNER JOIN (
      SELECT
        FK_animal,
        MAX(rep_fecha) AS max_fecha
      FROM
        Tbl_muestra
      GROUP BY
        FK_animal
    ) AS max_dates
    ON tm.FK_animal = max_dates.FK_animal
    AND tm.rep_fecha = max_dates.max_fecha
) AS sb_2
ON sb_1.FK_animal = sb_2.sb_2_id
LEFT JOIN(
  SELECT
    tb.rep_snd_gurural,
    tb.rep_impetu,
    tb.rep_nderribo,
    tb.rep_derribo,
    tb.rep_tiempo_copula,
    tb.FK_macho,
    tb.FK_hembra,
    tb.rep_observacion
  FROM Tbl_reproduccion tb
  INNER JOIN (
    SELECT
      FK_macho,
      MAX(rep_fecha) AS mxfecha
    FROM Tbl_reproduccion
    GROUP BY
      FK_macho
  ) AS rx
    ON tb.FK_macho = rx.FK_macho AND
    tb.rep_fecha = rx.mxfecha
) AS sb_3
ON sb_2.sb_2_id = sb_3.FK_macho;

SELECT * FROM vw_sabana_macho;

















SELECT
  tb.PK_historial,
  tb.FK_animal,
  ta.sexo,
  tb.bio_cantDentaria,
  tb.bio_caninos,
  ROUND(TIMESTAMPDIFF(SECOND, tf.fecha_ingreso, tb.bio_fecha) / (365.25 * 24 * 3600),2) AS edad_temporal,
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
  tb.Isquiones,
  tb.bio_comisuraVulvar
FROM
  Tbl_biometria tb
INNER JOIN
  Tbl_animal_fecha tf
  ON tf.Tbl_animal_ID_Arete = tb.FK_animal
INNER JOIN
  Tbl_animal ta
  ON ta.ID_Arete = tb.FK_animal
WHERE
  FK_animal = "HS-1"
  AND
  tb.bio_fecha >= "2024-07-21"
  AND
  tb.bio_fecha <= "2024-07-21";


SELECT * FROM `Tbl_animal_fecha`;


SELECT
  PK_dosificacion,
  dsf_fecha,
  FK_animal,
  producto_nombre,
  producto_tipo
FROM
  Tbl_dosificacion tb
  INNER JOIN Tbl_producto po
  ON po.PK_producto = tb.FK_producto
WHERE
  FK_animal = "HS-1"
  AND
  tb.dsf_fecha >= "2024-07-21"
  AND
  tb.dsf_fecha <= "2024-07-21";


SELECT
  *
FROM
  Tbl_vellon ve
  INNER JOIN
  Tbl_animal an
  ON an.ID_Arete = ve.FK_animal
WHERE
  (ve.FK_animal = "HS-1" OR "HS-1" IS NULL)
  AND
  (ve.vellon_fecha >= "2024-07-21" OR "2024-07-22" IS NULL)
  AND
  (ve.vellon_fecha <= "2024-07-22" OR "2024-07-22" IS NULL);



SELECT
  *
FROM
  Tbl_muestra mu
WHERE
  (mu.FK_animal = "HS-1" OR "HS-1" IS NULL)
  AND
  (mu.rep_fecha>= "2024-07-21" OR "2024-07-22" IS NULL)
  AND
  (mu.rep_fecha <= "2024-07-22" OR "2024-07-22" IS NULL);

SELECT
  *
FROM
  Tbl_reproduccion ex
WHERE
  (ex.FK_macho = "HS-1" OR "HS-1" IS NULL)
  AND
  (ex.rep_fecha>= "2024-07-21" OR "2024-07-22" IS NULL)
  AND
  (ex.rep_fecha <= "2024-07-22" OR "2024-07-22" IS NULL);