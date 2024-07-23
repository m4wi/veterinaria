import express from 'express'
import dotenv from 'dotenv'
import morgan from 'morgan'
import routes from './routes/index.routes.js'

const port = 3000

dotenv.config()

const app = express()
app.use(morgan("dev"))
app.use(express.json())
app.use(routes)

export default app