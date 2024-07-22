import model from '../models/auth.model.js'

const controller = {}


controller.validAnimal = async (req, res) => {
  try {
    const { arete } = req.body
    const animalState = await model.isValidArete(arete);
    res.status(200).send({ isValid: animalState}) 
  } catch {
    res.status(500).send({ error: error.message })
  }
}

controller.getAnimal = async (req, res) => {

}

export default controller