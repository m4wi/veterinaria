-- Active: 1721516370294@@localhost@3306@veterinaria2
SELECT * FROM `Tbl_animal`;

/* Insertando datos parametrizados */
INSERT INTO `Tbl_especie`(`Especie_tipo`) VALUES 
("Alpaca"),
("Llama");

INSERT INTO `Tbl_animal_raza`(raza_tipo) VALUES
("Suri"),
("Huacaya");


/* Datos de los animales */
INSERT INTO `Tbl_animal`(`PK_animal`,sexo,`FK_especie`,`FK_raza` ,`FK_animal_madre`, `FK_animal_padre`)
VALUES
("HS-1","Macho" ,"12-12-12" ,1 ,1 ,NULL, NULL);


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

INSERT INTO Tbl_biometria (
  bio_fecha, bio_peso,bio_edadTemporal, bio_condicionCorporal, bio_largoCabeza, bio_anchoCabeza,
  bio_largoOrejas, bio_largoCuello, bio_largoCuerpo, bio_alturaCruz, bio_anchoGrupa,
  bio_altoGrupa, bio_amplitudPecho, bio_circunferenciaCuerpo, bio_aplomoAnterior,
  bio_aplomoPosterior, bio_tde_ancho, bio_tde_largo, bio_tiz_ancho, bio_tiz_largo,
  bio_comisuraVulvar, FK_animal, bio_cantDentaria, bio_caninos
) VALUES (
  CURDATE(), 40.2, 11.5,4.5, 10.2, 10.2,
  4.5, 7.6, 25.6, 5.6, 45.6,
  45.6, 47.6, 'Normal', 'Normal',
  2.4, 3.5, 6.5, 4.5, 4.6,
  'HS-8', 'Llena', '2 caninos (1 arriba, 1 abajo)'
);