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

model.authUser = async (data) => {
  try {
    const { username, password } = data;
    const result = await sequelize.query(
      `SELECT count(*) as state FROM Tbl_usuario WHERE username = :user AND password = :pass;`,
      {
        replacements: {
          user: username,
          pass: password
        },
        raw: true
      }
    )
    return result[0]
  } catch (error) {
    console.error('Error executing authUser query:', error);
    throw error
  }
}

export default model;