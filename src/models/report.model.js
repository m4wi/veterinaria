import sequelize from '../config/db.js'

const model = {}

model.sabanaGeneral = async () => {
  return sequelize.query(`SELECT * FROM vw_sabana_general`, { raw: true})
  .then(([result, metadata]) => {
    return result.length === 0 ? null : result
  })
  .catch((error) => {
    throw error
  })
}

model.sabanaHembra = async () => {
  return sequelize.query(`SELECT * FROM vw_sabana_hembra`, { raw: true})
  .then(([result, metadata]) => {
    return result.length === 0 ? null : result
  })
  .catch((error) => {
    throw error
  })
}

model.sabanaMacho = async () => {
  return sequelize.query(`SELECT * FROM vw_sabana_macho`, { raw: true})
  .then(([result, metadata]) => {
    return result.length === 0 ? null : result
  })
  .catch((error) => {
    throw error
  })
}

model.getBiometricaTable = async (data) => {
  const { arete, first_date, last_date} = data
  try {
    const result = await sequelize.query(
      `SELECT * FROM getanimalbiometria(:arete, :first_date, :last_date)`, 
      {
        replacements: {
          arete: arete || null,
          first_date: first_date || null,
          last_date: last_date || null
        },
        type: sequelize.QueryTypes.SELECT,
        raw: true
      }
    )
    return result.length === 0 ? null : result;
  } catch (error) {
    throw error
  }
}

model.getMuestraTable = async (data) => {
  const { arete, first_date, last_date} = data
  try {
    const result = await sequelize.query(
      `SELECT * FROM getMuestraTable(:arete, :first_date, :last_date)`, 
      {
        replacements: {
          arete: arete || null,
          first_date: first_date || null,
          last_date: last_date || null
        },
        type: sequelize.QueryTypes.SELECT,
        raw: true
      }
    )
    return result.length === 0 ? null : result;
  } catch (error) {
    throw error
  }
}

model.getDosificacionTable = async (data) => {
  const { arete, first_date, last_date} = data
  try {
    const result = await sequelize.query(
      `SELECT * FROM getDosificacionTable(:arete, :first_date, :last_date)`, 
      {
        replacements: {
          arete: arete || null,
          first_date: first_date || null,
          last_date: last_date || null
        },
        type: sequelize.QueryTypes.SELECT,
        raw: true
      }
    )
    return result.length === 0 ? null : result;
  } catch (error) {
    throw error
  }
}

model.getVellonTable = async (data) => {
  const { arete, first_date, last_date} = data
  try {
    const result = await sequelize.query(
      `SELECT * FROM getVellonTable(:arete, :first_date, :last_date)`, 
      {
        replacements: {
          arete: arete || null,
          first_date: first_date || null,
          last_date: last_date || null
        },
        type: sequelize.QueryTypes.SELECT,
        raw: true
      }
    )
    return result.length === 0 ? null : result;
  } catch (error) {
    throw error
  }
}

model.getReproduccionTable = async (data) => {
  const { arete, first_date, last_date} = data
  try {
    const result = await sequelize.query(
      `SELECT * FROM getReproductionTable(:arete, :first_date, :last_date)`, 
      {
        replacements: {
          arete: arete || null,
          first_date: first_date || null,
          last_date: last_date || null
        },
        type: sequelize.QueryTypes.SELECT,
        raw: true
      }
    )
    return result.length === 0 ? null : result;
  } catch (error) {
    throw error
  }
}



export default model