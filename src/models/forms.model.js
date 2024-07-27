import sequelize from '../config/db.js'

const model = {}

model.formAnimal = async (data) => {
  const { arete, sexo, especie, raza, padre, madre, tipo_ingreso, fecha_ingreso, edad } = data
  try {
    const metadata = await sequelize.query(
      'SELECT saveAnimal(:arete, :sexo, :especie, :raza, :padre, :madre, :type, :fecha, :edad)',
      {
        replacements: {
          arete: arete || null,
          sexo,
          especie,
          raza,
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
    return metadata
  } catch (error) {
    console.error('Error executing saveAnimal query:', error)
    throw error
  }
}

model.formBiometria = async (data) => {
  const { peso, Ccorporal, Lcabeza, Acabeza, Loreja, Lcuello, Lcuerpo, ALcruz, ANgrupa, ALgrupa, AMpecho, CIcuerpo, APanterior, APposterior, TDEancho, TDElargo, TIZancho, TIZlargo, COvulvar, arete, CNdiente, canino, isquiones } = data
  try {
    const metadata = await sequelize.query(
      'SELECT savebiometria( CURRENT_DATE, :peso, :Ccorporal, :Lcabeza, :Acabeza, :Loreja, :Lcuello, :Lcuerpo, :ALcruz, :ANgrupa, :ALgrupa, :AMpecho, :CIcuerpo, :APanterior, :APposterior, :TDEancho, :TDElargo, :TIZancho, :TIZlargo, :COvulvar, :arete, :CNdiente, :canino, :isquiones)',
      {
        replacements: {
          peso,
          Ccorporal,
          Lcabeza,
          Acabeza,
          Loreja,
          Lcuello,
          Lcuerpo,
          ALcruz,
          ANgrupa,
          ALgrupa,
          AMpecho,
          CIcuerpo,
          APanterior,
          APposterior,
          TDEancho,
          TDElargo,
          TIZancho,
          TIZlargo,
          COvulvar,
          arete,
          CNdiente,
          canino,
          isquiones
        },
        type: sequelize.QueryTypes.INSERT,
        raw: true
      }
    )
    return metadata
  } catch (error) {
    console.error('Error executing saveBiometria query:', error)
    throw error
  }
}

model.formVellon = async (data) => {
  const { densidad, definicion, LONmecha, calce, uniformidad, tuco, color, clase, observacion, arete, diametro } = data
  try {
    const metadata = await sequelize.query(
      'SELECT saveVellon( :densidad, :definicion, :LONmecha, :calce, :uniformidad, :tuco, :color, :clase, :observacion, :arete, CURRENT_DATE, :diametro)',
      {
        replacements: {
          densidad,
          definicion,
          LONmecha,
          calce,
          uniformidad,
          tuco,
          color,
          clase,
          observacion,
          arete,
          diametro
        },
        type: sequelize.QueryTypes.INSERT,
        raw: true
      }
    )

    return metadata
  } catch (error) {
    console.error('Error executing saveVellon query:', error)
    throw error
  }
}

model.formReproduccion = async (data) => {
  try {
    const { snd_gutural, impetu, derribo, t_copula, obs, macho, hembra, n_derribo } = data
    const metadata = await sequelize.query(
      'SELECT saveReproduccion(:sndg, :im, :derr , :tcop, :obs,CURRENT_DATE, :macho, :nderr,:hembra)',
      {
        replacements: {
          sndg: snd_gutural,
          im: impetu,
          derr: derribo,
          tcop: t_copula,
          obs,
          macho,
          nderr: n_derribo,
          hembra
        },
        type: sequelize.QueryTypes.INSERT,
        raw: true
      }
    )

    return metadata
  } catch (error) {
    console.error('Error executing saveReproduccion query:', error)
    throw error
  }
}

model.formMuestra = async (data) => {
  try {
    const { h_inicio, h_fin, t_inicio, t_fin, volumen, color, obs, arete, maniqui, pH, filancia } = data
    const metadata = await sequelize.query(
      'SELECT saveMuestra(CURRENT_DATE, :Hinicio, :Hfin, :Tinicio, :Tfin, :volumen, :color, :obs, :arete, :maniqui, :pH, :filancia )',
      {
        replacements: {
          Hinicio: h_inicio,
          Hfin: h_fin,
          Tinicio: t_inicio,
          Tfin: t_fin,
          volumen,
          color,
          obs,
          arete,
          maniqui,
          pH,
          filancia
        },
        type: sequelize.QueryTypes.INSERT,
        raw: true
      }
    )
    return metadata
  } catch (error) {
    console.error('Error executing saveMuestra query:', error)
    throw error
  }
}

model.formDosificacion = async (data) => {
  try {
    const { arete, producto, obs } = data
    const metadata = await sequelize.query(
      'INSERT INTO Tbl_dosificacion(dsf_fecha, FK_producto, FK_animal, dsf_observacion) VALUES(CURRENT_DATE, :numprod , :arete, :obs);',
      {
        replacements: {
          numprod: producto,
          arete,
          obs
        },
        type: sequelize.QueryTypes.INSERT,
        raw: true
      }
    )
    return metadata
  } catch (error) {
    console.error('Error executing saveDosificacion query:', error)
    throw error
  }
}
export default model
