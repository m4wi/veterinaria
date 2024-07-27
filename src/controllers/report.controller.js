import model from '../models/report.model.js'

const controller = {}

controller.sabanas = async (req, res) => {
  const actions = {
    macho: model.sabanaMacho,
    hembra: model.sabanaHembra,
    general: model.sabanaGeneral
  }
  try {
    const { type } = req.params
    const action = actions[type]
    if (action) {
      const result = await action()

      if (result) return res.status(200).json(result)
      else return res.status(404).send({ error: 'Error al obtener la sabana' })
    } else {
      res.status(400).send({ error: 'Invalid type parameter' })
    }
  } catch (error) {
    res.status(500).send({ error: error.message })
  }
}

controller.report = async (req, res) => {
  const { arete, first_date, last_date, type } = req.body
  const actions = {
    biometrica: model.getBiometricaTable,
    muestra: model.getMuestraTable,
    dosificacion: model.getDosificacionTable,
    vellon: model.getVellonTable,
    reproduccion: model.getReproduccionTable
  }

  try {
    const action = actions[type]
    if (action) {
      const data = { arete, first_date, last_date }
      const result = await action(data)
      if (result) res.status(200).json(result)
      else return res.status(404).send({ error: 'Problems with get some tables ' })
    } else {
      res.status(400).send({ error: 'Invalid type parameter' })
    }
  } catch (error) {
    res.status(500).send({ error: error.message })
  }
}

controller.animalCount = async (req, res) => {
  try {
    const result = await model.getAnimalCount()
    res.status(200).json(result)
  } catch (error) {
    res.status(500).send({ error: error.message })
  }
}

controller.initialAnimalTable = async (req, res) => {
  try {
    const result = await model.getInitialAnimalTable()
    res.status(200).json(result)
  } catch (error) {
    res.status(500).send({ error: error.message })
  }
}

export default controller
