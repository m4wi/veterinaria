import sequelize from '../config/db.js'

const model = {}

/*
    p_arete VARCHAR(20),
    p_sexo VARCHAR(10),
    p_especie INT,
    p_raza INT,
    p_padre VARCHAR(20),
    p_madre VARCHAR(20),
    p_tipo_ingreso VARCHAR(50),
    p_fecha_ingreso DATE,
    p_edad_aproximada NUMERIC DEFAULT 0

*/
model.formAnimal = async (data) => {
  const { arete, sexo, especie, raza, padre, madre, tipo_ingreso, fecha_ingreso, edad } = data
  try {
    const metadata = await sequelize.query(
      `SELECT saveAnimal(:arete, :sexo, :especie, :raza, :padre, :madre, :type, :fecha, :edad)`, 
      {
        replacements: {
          arete: arete || null,
          sexo: sexo,
          especie: especie,
          raza: raza,
          padre: padre || null,
          madre: madre || null,
          type: tipo_ingreso,
          fecha: fecha_ingreso,
          edad: edad || 0.0
        },
        type: sequelize.QueryTypes.INSERT,
        raw: true
      }
    )
    return !(metadata >= 1)

  } catch ( error ) {
    console.error('Error executing saveAnimal query:', error);
    throw error
  }
}

model.formBiometria = async (data) => {
  const { peso, Ccorporal, Lcabeza, Acabeza, Loreja, Lcuello, Lcuerpo, ALcruz, ANgrupa, ALgrupa, AMpecho, CIcuerpo, APanterior, APposterior, TDEancho, TDElargo, TIZancho, TIZlargo, COvulvar, arete, CNdiente, canino, isquiones } = data
  try {
    const metadata = await sequelize.query(
      `SELECT savebiometria( CURRENT_DATE, :peso, :Ccorporal, :Lcabeza, :Acabeza, :Loreja, :Lcuello, :Lcuerpo, :ALcruz, :ANgrupa, :ALgrupa, :AMpecho, :CIcuerpo, :APanterior, :APposterior, :TDEancho, :TDElargo, :TIZancho, :TIZlargo, :COvulvar, :arete, :CNdiente, :canino, :isquiones)`, 
      {
        replacements: {
          peso: peso,
          Ccorporal: Ccorporal,
          Lcabeza: Lcabeza,
          Acabeza: Acabeza,
          Loreja : Loreja,
          Lcuello : Lcuello,
          Lcuerpo : Lcuerpo,
          ALcruz : ALcruz,
          ANgrupa : ANgrupa,
          ALgrupa : ALgrupa,
          AMpecho : AMpecho,
          CIcuerpo : CIcuerpo,
          APanterior : APanterior,
          APposterior : APposterior,
          TDEancho : TDEancho,
          TDElargo : TDElargo,
          TIZancho : TIZancho,
          TIZlargo : TIZlargo,
          COvulvar : COvulvar,
          arete : arete,
          CNdiente : CNdiente,
          canino : canino,
          isquiones : isquiones
        },
        type: sequelize.QueryTypes.INSERT,
        raw: true
      }
    )
    return !(metadata)

  } catch ( error ) {
    console.error('Error executing saveBiometria query:', error);
    throw error
  }


}
/*
    p_vellon_densidad VARCHAR(10),
    p_vellon_definicion VARCHAR(10),
    p_vellon_longitudMecha NUMERIC(5,2),
    p_vellon_calce VARCHAR(10),
    p_vellon_uniformidad VARCHAR(10),
    p_vellon_tuco VARCHAR(10),
    p_vellon_color VARCHAR(45),
    p_vellon_clase VARCHAR(1),
    p_vellon_observacion VARCHAR(400),
    p_FK_animal VARCHAR(20),
    p_vellon_fecha DATE

*/
model.formVellon = async (data) => {
  const { densidad, definicion, LONmecha, calce, uniformidad,tuco,color,clase,observacion, arete } = data
  try {
    const metadata = await sequelize.query(
      `SELECT saveVellon( :densidad, :definicion, :LONmecha, :calce, :uniformidad, :tuco, :color, :clase, :observacion, :arete, CURRENT_DATE)`,
      {
        replacements: {
          densidad : densidad,
          definicion : definicion,
          LONmecha : LONmecha,
          calce : calce,
          uniformidad : uniformidad,
          tuco : tuco,
          color : color,
          clase : clase,
          observacion : observacion,
          arete : arete
        },
        type: sequelize.QueryTypes.INSERT,
        raw: true
      }
    )

    return !(metadata)

  } catch (error) {
    console.error('Error executing saveVellon query:', error);
    throw error
  }
}

/*

    p_rep_snd_gurural VARCHAR(10),
    p_rep_impetu NUMERIC,
    p_rep_derribo NUMERIC,
    p_rep_tiempo_copula NUMERIC,
    p_rep_observacion VARCHAR(400),
    p_rep_fecha DATE,
    p_FK_macho VARCHAR(20),
    p_rep_nderribo INT,
    p_FK_hembra VARCHAR(20)
*/

model.formReproduccion = async (data) => {
  try {
    const { snd_gutural, impetu, derribo, t_copula, obs, macho, hembra, n_derribo} = data
    const metadata = await sequelize.query(
      `SELECT saveReproduccion(:sndg, :im, :derr , :tcop, :obs,CURRENT_DATE, :macho, :nderr,:hembra)`,
      {
        replacements: {
          sndg: snd_gutural,
          im: impetu,
          derr: derribo,
          tcop: t_copula,
          obs: obs,
          macho: macho,
          nderr: n_derribo,
          hembra: hembra
        },
        type: sequelize.QueryTypes.INSERT,
        raw: true
      }
    )

    return !(metadata)

  } catch (error) {
    console.error('Error executing saveReproduccion query:', error);
    throw error
  }
}

/*
    p_rep_fecha DATE,
    p_rep_hora_inicio VARCHAR(8),
    p_rep_hora_fin VARCHAR(8),
    p_tem_inicio NUMERIC(5,2),
    p_temp_final NUMERIC(5,2),
    p_muestra_volumen NUMERIC(5,2),
    p_muestra_color VARCHAR(60),
    p_observacion VARCHAR(400),
    p_FK_animal VARCHAR(20),
    p_num_maniqui INT

*/
model.formMuestra = async (data) => {
  try {
    const { h_inicio, h_fin, t_inicio, t_fin, volumen, color, obs, arete, maniqui} = data
    const metadata = await sequelize.query(
      `SELECT saveMuestra(CURRENT_DATE, :Hinicio, :Hfin, :Tinicio, :Tfin, :volumen, :color, :obs, :arete, :maniqui)`,
      {
        replacements: {
          Hinicio: h_inicio,
          Hfin: h_fin,
          Tinicio: t_inicio,
          Tfin: t_fin,
          volumen: volumen,
          color: color,
          obs: obs,
          arete: arete,
          maniqui: maniqui
        },
        type: sequelize.QueryTypes.INSERT,
        raw: true
      }
    )
    return !(metadata)

  } catch (error) {
    console.error('Error executing saveMuestra query:', error);
    throw error
  }
}

model.formDosificacion = async (data) => {
  try {
    const { arete, producto} = data
    const metadata = await sequelize.query(
      `INSERT INTO Tbl_dosificacion(dsf_fecha, FK_producto, FK_animal) VALUES(CURRENT_DATE, :numprod , :arete);`,
      {
        replacements: {
          numprod: producto,
          arete: arete
        },
        type: sequelize.QueryTypes.INSERT,
        raw: true
      }
    )
    return !(metadata)

  } catch (error) {
    console.error('Error executing saveDosificacion query:', error);
    throw error
  }
}
export default model