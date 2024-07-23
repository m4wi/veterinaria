import { Sequelize } from 'sequelize'

const sequelize = new Sequelize("postgresql://postgres.vzwysynqcqjenrhrsfyo:oon3wRJYvYwZQl8x@aws-0-us-east-1.pooler.supabase.com:6543/postgres")

sequelize.authenticate()
  .then(() => {
    console.log('Connect success')
  })
  .catch((error) => {
    console.log('Failed to connect: ', error)
  })

export default sequelize