import model from '../models/report.model.js'
import downloader from '../lib/excel.js'

const controller = {}


controller.sabanas = async (req, res) => {
  const actions = {
    "macho" : model.sabanaMacho,
    "hembra" : model.sabanaHembra,
    "general" : model.sabanaGeneral
  }
  try {
    const { type } = req.params
    const action = actions[type];
    if (action) {
      const result = await action();

      if (result) return res.status(200).json(result)
      else return res.status(404).send({ error: "Error al obtener la sabana" })

    } else {
      res.status(400).send({ error: 'Invalid type parameter' });
    }

  } catch {
    res.status(500).send({ error: error.message })
  }
}

controller.report = async (req, res) => {
  const { arete, first_date, last_date, type } = req.body
  const actions = {
    "biometrica": model.getBiometricaTable,
    "muestra": model.getMuestraTable,
    "dosificacion": model.getDosificacionTable,
    "vellon": model.getVellonTable,
    "reproduccion": model.getReproduccionTable,
  }

  try {
    const action = actions[type]
    if (action) {
      const data = { arete, first_date, last_date }
      const result = await action(data)
      if (result) res.status(200).json(result)
      else return res.status(404).send({ error : "Problems with get some tables "})
    } else {
      res.status(400).send({ error: 'Invalid type parameter' });
    }
  } catch (error) {
    res.status(500).send({ error: error.message })
  }
}

controller.download = async (req, res) => {
  try {
    const data = await model.sabanaHembra()
    const file = await downloader(data)

    res.writeHead(200, {
      "Content-Type": "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
      "Content-Disposition": "attachment; filename=hembra.xlsx"
    })

    res.end(file)

  } catch (error) {
    res.status(500).send({ error: error.message })
  }
}

export default controller