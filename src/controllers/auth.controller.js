import model from '../models/auth.model.js'

const controller = {}

controller.validAnimal = async (req, res) => {
  try {
    const { arete } = req.body
    const animalState = await model.isValidArete(arete)
    res.status(200).json(animalState)
  } catch (error) {
    res.status(500).send({ error: error.message })
  }
}

controller.authUser = async (req, res) => {
  try {
    const result = await model.authUser(req.body)
    res.status(200).json(result)
  } catch (error) {
    res.status(500).send({ error: error.message })
  }
}

export default controller
