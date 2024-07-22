import express from 'express'
import controllers from './controllers/auth.controller.js'
// import controllers2 from './controllers/sabana.controller.js'

const app = express()

app.use(express.json())

app.get("/",(req, res) => {
  res.send("Welcome to the API")
})

app.get("/animal/status", controllers.validAnimal)

app. get("/animal/:arete",(req,res) => {res.send("not implemented")})

// app.get("/sabana/:type", controllers2.sabanas)

app.listen(3000, () => {
  console.log(`Example app listening on port 3000`)
})