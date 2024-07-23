import express from 'express'
import cors from 'cors'

// import other routes
import authRoutes from '../routes/auth.routes.js'
import reportRoutes from '../routes/report.routes.js'
import formRoutes from '../routes/forms.routes.js'

const app = express()

app.use(cors({
  origin: 'https://veterinaria-production-b14c.up.railway.app/',
  credentials: true
}))

app.get('/', (req, res) => {
  res.status(200).send("veterinaria API");
})

const apiVersion = "/api/v1"

// import routes
app.use(apiVersion, authRoutes)
app.use(apiVersion, reportRoutes)
app.use(apiVersion, formRoutes)

app.use("*", (req, res) => {
  res.send("route not found")
})

export default app