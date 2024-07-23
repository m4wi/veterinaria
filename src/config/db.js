import { Sequelize } from 'sequelize'
import { POST_URL } from 'config.js'

const sequelize = new Sequelize(`${POST_URL}`)

sequelize.authenticate()
  .then(() => {
    console.log('Connect success')
  })
  .catch((error) => {
    console.log('Failed to connect: ', error)
  })

export default sequelize