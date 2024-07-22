import model from '../models/sabana.model.js'

const controller = {}


controller.sabanas = async (req, res) => {
  const actions = {
    Macho : sabanaMacho(),
    Hembra : sabanaHembra(),
    general : sabanaGeneral()
  }
  try {
    const { type } = req.params
    const action = actions[type];

    if (action) {
      const result = await action();

      if (result) return res.status(200).json(result[0])
      else return res.status(404).send({ error: "Error al obtener la sabana" })

    } else {
      res.status(400).send({ error: 'Invalid type parameter' });
    }

  } catch {
    res.status(500).send({ error: error.message })
  }
}

export default controller