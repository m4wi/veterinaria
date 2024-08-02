import { Sequelize } from 'sequelize'
import { PSQL_URL } from './config.js'

const sequelize = new Sequelize(PSQL_URL)

sequelize.authenticate()
  .then(() => {
    console.log('Connect success')
  })
  .catch((error) => {
    console.log('Failed to connect: ', error)
  })

export default sequelize
