const headers = {
  Macho: {
    tableName: 'REGISTRO DE DATOS ALPACAS MACHOS',
    text1: 'PROPIETARIO: UNIVERSIDAD JORGE BASADRE GROHMANN',
    text2: 'UBICACIÓN DEL PREDIO: FUNDO PICHONES SUR II DE LA UNJBG             DISTRITO: TACNA  PROVINCIA: TACNA    REGIÓN: TACNA     FECHA:',
    categories: [
      {
        name: 'DATOS GENERALES',
        fields: {
          ARETE: 'id_arete',
          EDAD: 'fmdate',
          PESO: 'bio_peso',
          ESPECIE: 'especie_tipo',
          RAZA: 'raza_tipo'
        }
      },
      {
        name: 'BIOMETRIA',
        fields: {
          'C.CORPORAL': 'bio_condicioncorporal',
          'ALTURA DE CRUZ': 'bio_alturacruz',
          'ALTURA DE GRUPA': 'bio_altogrupa',
          'LONGITUD DE CUERPO': 'bio_largocuerpo',
          'ANCHO DE GRUPA': 'bio_anchogrupa',
          'CIRCUNFERENCIA DE CUERPO': 'bio_circunferenciacuerpo',
          'AMPLITUD DE PECHO': 'bio_circunferenciacuerpo',
          'ANCHO DE CABEZA': 'bio_anchocabeza',
          'LARGO DE CABEZA': 'bio_largocabeza',
          ISQUIONES: 'bio_isquiones',
          'LARGO DE OREJAS': 'bio_largoorejas',
          'LARGO DE CUELLO': 'bio_largocuello',
          'TREN ANTERIOR': 'bio_aplomoanterior',
          'TREN POSTERIOR': 'bio_aplomoposterior',
          'C. DENTARIA': 'bio_cantdentaria',
          CANINOS: 'bio_caninos',
          'TESTÍCULO DERECHO': 'tes_derecho',
          'TESTÍCULO IZQUIERDO': 'tes_izquierdo'
        }
      },
      {
        name: 'CLASIFICACIÓN DE FIBRA',
        fields: {
          'DENSIDAD VELLÓN': 'vellon_densidad',
          'DEFINICION VELLÓN': 'vellon_definicion',
          'LONGITUD DE MECHA': 'vellon_longitudmecha',
          CALCE: 'vellon_calce',
          UNIFORMIDAD: 'vellon_uniformidad',
          TUCO: 'vellon_tuco',
          COLOR: 'vellon_color',
          CLASE: 'vellon_clase',
          'DIAMETRO VELLÓN': 'vellon_diametro'
        }
      },
      {
        name: 'MUESTRA DE SEMEN',
        fields: {
          'HORA DE INICIO': 'rep_hora_inicio',
          'HORA DE FIN': 'rep_hora_fin',
          'TEMPERATURA INICIO': 'tem_inicio',
          'TEMPERATURA FIN': 'temp_final',
          VOLUMEN: 'muestra_volumen',
          ' COLOR': 'muestra_color',
          MANIQUI: 'num_maniqui',
          FECHA: 'rep_fecha',
          FILANCIA: 'muestra_filancia',
          PH: 'muestra_ph'
        }
      },
      {
        name: 'CAPACIDAD REPRODUCTIVA',
        fields: {
          'SONIDO GUTURAL': 'rep_snd_gurural',
          IMPETU: 'rep_impetu',
          DERRIBO: 'rep_derribo',
          'TIEMPO DE COPULA': 'rep_tiempo_copula',
          HEMBRA: 'FK_hembra'
        }
      }
    ]
  },
  Hembra: {
    tableName: 'REGISTRO DE DATOS ALPACAS HEMBRAS',
    text1: 'PROPIETARIO: UNIVERSIDAD JORGE BASADRE GROHMANN',
    text2: 'UBICACIÓN DEL PREDIO: FUNDO PICHONES SUR II DE LA UNJBG             DISTRITO: TACNA  PROVINCIA: TACNA    REGIÓN: TACNA     FECHA:',
    categories: [
      {
        name: 'DATOS GENERALES',
        fields: {
          ARETE: 'id_arete',
          EDAD: 'fmdate',
          PESO: 'bio_peso',
          ESPECIE: 'especie_tipo',
          RAZA: 'raza_tipo'
        }
      },
      {
        name: 'BIOMETRIA',
        fields: {
          'CONDICION CORPORAL': 'bio_condicioncorporal',
          'ALTURA DE CRUZ': 'bio_alturacruz',
          'ALTURA DE GRUPA': 'bio_altogrupa',
          'LONGITUD DE CUERPO': 'bio_largocuerpo',
          'ANCHO DE GRUPA': 'bio_anchogrupa',
          'CIRCUNFERENCIA DE CUERPO': 'bio_circunferenciacuerpo',
          'AMPLITUD DE PECHO': 'bio_circunferenciacuerpo',
          'ANCHO DE CABEZA': 'bio_anchocabeza',
          'LARGO DE CABEZA': 'bio_largocabeza',
          ISQUIONES: 'bio_isquiones',
          'LARGO DE OREJAS': 'bio_largoorejas',
          'LARGO DE CUELLO': 'bio_largocuello',
          'TREN ANTERIOR': 'bio_aplomoanterior',
          'TREN POSTERIOR': 'bio_aplomoposterior',
          'COMISURA VULVAR': 'bio_comisuravulvar',
          'C. DENTARIA': 'bio_cantdentaria',
          CANINOS: 'bio_caninos'
        }
      },
      {
        name: 'CLASIFICACIÓN DE FIBRA',
        fields: {
          'DENSIDAD VELLÓN': 'vellon_densidad',
          'DEFINICION VELLÓN': 'vellon_definicion',
          'LONGITUD DE MECHA': 'vellon_longitudmecha',
          CALCE: 'vellon_calce',
          UNIFORMIDAD: 'vellon_uniformidad',
          TUCO: 'vellon_tuco',
          COLOR: 'vellon_color',
          CLASE: 'vellon_clase',
          'DIAMETRO VELLÓN': 'vellon_diametro'
        }
      }
    ]
  },
  General: {
    tableName: 'REGISTRO DE DATOS ALPACAS EN GENERAL',
    text1: 'PROPIETARIO: UNIVERSIDAD JORGE BASADRE GROHMANN',
    text2: 'UBICACIÓN DEL PREDIO: FUNDO PICHONES SUR II DE LA UNJBG             DISTRITO: TACNA  PROVINCIA: TACNA    REGIÓN: TACNA     FECHA:',
    categories: [
      {
        name: 'DATOS GENERALES',
        fields: {
          ARETE: 'id_arete',
          EDAD: 'fmdate',
          PESO: 'bio_peso',
          ESPECIE: 'especie_tipo',
          RAZA: 'raza_tipo'
        }
      },
      {
        name: 'BIOMETRIA',
        fields: {
          'C.CORPORAL': 'bio_condicioncorporal',
          'ALTURA DE CRUZ': 'bio_alturacruz',
          'ALTURA DE GRUPA': 'bio_altogrupa',
          'LONGITUD DE CUERPO': 'bio_largocuerpo',
          'ANCHO DE GRUPA': 'bio_anchogrupa',
          'CIRCUNFERENCIA DE CUERPO': 'bio_circunferenciacuerpo',
          'AMPLITUD DE PECHO': 'bio_circunferenciacuerpo',
          'ANCHO DE CABEZA': 'bio_anchocabeza',
          'LARGO DE CABEZA': 'bio_largocabeza',
          ISQUIONES: 'bio_isquiones',
          'LARGO DE OREJAS': 'bio_largoorejas',
          'TESTÍCULO DERECHO': 'tes_derecho',
          'TESTÍCULO IZQUIERDO': 'tes_izquierdo',
          'LARGO DE CUELLO': 'bio_largocuello',
          'TREN ANTERIOR': 'bio_aplomoanterior',
          'TREN POSTERIOR': 'bio_aplomoposterior',
          'C. DENTARIA': 'bio_cantdentaria',
          CANINOS: 'bio_caninos'
        }
      },
      {
        name: 'CLASIFICACIÓN DE FIBRA',
        fields: {
          'DENSIDAD VELLÓN': 'vellon_densidad',
          'DEFINICION VELLÓN': 'vellon_definicion',
          'LONGITUD DE MECHA': 'vellon_longitudmecha',
          CALCE: 'vellon_calce',
          UNIFORMIDAD: 'vellon_uniformidad',
          TUCO: 'vellon_tuco',
          COLOR: 'vellon_color',
          CLASE: 'vellon_clase',
          'DIAMETRO VELLÓN': 'vellon_diametro'
        }
      },
      {
        name: 'MUESTRA DE SEMEN',
        fields: {
          'HORA DE INICIO': 'rep_hora_inicio',
          'HORA DE FIN': 'rep_hora_fin',
          'TEMPERATURA INICIO': 'tem_inicio',
          'TEMPERATURA FIN': 'temp_final',
          VOLUMEN: 'muestra_volumen',
          ' COLOR': 'muestra_color',
          MANIQUI: 'num_maniqui',
          FECHA: 'rep_fecha',
          FILANCIA: 'muestra_filancia',
          PH: 'muestra_ph'
        }
      },
      {
        name: 'CAPACIDAD REPRODUCTIVA',
        fields: {
          'SONIDO GUTURAL': 'rep_snd_gurural',
          IMPETU: 'rep_impetu',
          DERRIBO: 'rep_derribo',
          'TIEMPO DE COPULA': 'rep_tiempo_copula',
          HEMBRA: 'FK_hembra'
        }
      }
    ]
  }
}

export default headers
