import model from '../models/forms.model.js'

const controller = {}

controller.formSaveAnimal = async (req, res) => {
  try {
    const result = await model.formAnimal(req.body)
    if (result) res.status(200).send({ message: 'Data saved' })
    else res.status(422).send({ error: 'Data could not be processed' })
  } catch (error) {
    res.status(500).send({ error: error.message })
  }
}

controller.formSaveBiometria = async (req, res) => {
  try {
    const result = await model.formBiometria(req.body)
    if (result) res.status(200).send({ message: 'Data saved' })
    else res.status(422).send({ error: 'Data could not be processed' })
  } catch (error) {
    res.status(500).send({ error: error.message })
  }
}

controller.formSaveVellon = async (req, res) => {
  try {
    const result = await model.formVellon(req.body)
    if (result) res.status(200).send({ message: 'Data saved' })
    else res.status(422).send({ error: 'Data could not be processed' })
  } catch (error) {
    res.status(500).send({ error: error.message })
  }
}

controller.formSaveMuestra = async (req, res) => {
  try {
    const result = await model.formMuestra(req.body)
    if (result) res.status(200).send({ message: 'Data saved' })
    else res.status(422).send({ error: 'Data could not be processed' })
  } catch (error) {
    res.status(500).send({ error: error.message })
  }
}

controller.formSaveReproduccion = async (req, res) => {
  try {
    const result = await model.formReproduccion(req.body)
    if (result) res.status(200).send({ message: 'Data saved' })
    else res.status(422).send({ error: 'Data could not be processed' })
  } catch (error) {
    res.status(500).send({ error: error.message })
  }
}

controller.formSaveDosificacion = async (req, res) => {
  try {
    const result = await model.formDosificacion(req.body)
    if (result) res.status(200).send({ message: 'Data saved' })
    else res.status(422).send({ error: 'Data could not be processed' })
  } catch (error) {
    res.status(500).send({ error: error.message })
  }
}

export default controller
