import sequelize from '../config/db.js'

const model = {}

model.isValidArete = async (arete) => {
  return sequelize.query(`SELECT sexo FROM Tbl_animal WHERE id_arete = '${arete}';`, { raw: true})
  .then(([result, metadata]) => {
    return result
  })
  .catch((error) => {
    throw error
  })
}

export default model;