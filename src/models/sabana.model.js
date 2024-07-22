import sequelize from '../config/db.js'

const model = {}

model.sabanaGeneral() = async () => {
  return sequelize.query(`SELECT * FROM vw_sabana_general`, { raw: true})
  .then(([result, metadata]) => {
    return result.length === 0 ? null : result
  })
  .catch((error) => {
    throw error
  })
}

model.sabanaHembra() = async () => {
  return sequelize.query(`SELECT * FROM vw_sabana_hembra`, { raw: true})
  .then(([result, metadata]) => {
    return result.length === 0 ? null : result
  })
  .catch((error) => {
    throw error
  })
}

model.sabanaMacho() = async () => {
  return sequelize.query(`SELECT * FROM vw_sabana_macho`, { raw: true})
  .then(([result, metadata]) => {
    return result.length === 0 ? null : result
  })
  .catch((error) => {
    throw error
  })
}