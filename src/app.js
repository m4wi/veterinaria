import express from 'express'
import dotenv from 'dotenv'
import morgan from 'morgan'
import routes from 'routes/index.routes.js'

dotenv.config()

const app = express()
app.use(morgan("dev"))
app.use(express.json())
app.use(routes)

app.set('port', PORT)

export default app