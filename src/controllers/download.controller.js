import model from '../models/report.model.js'
import generator from '../lib/excel.js'
import headers from '../lib/headers.js'

const downloader = {}

downloader.downloadSabana = async (req, res) => {
  const actions = {
    Hembra: model.sabanaHembra,
    Macho: model.sabanaMacho,
    General: model.sabanaGeneral
  }
  // add validation
  try {
    const { sabana } = req.params
    const action = actions[sabana]
    const header = headers[sabana]

    const data = await action()
    const file = await generator(data, header)

    res.writeHead(200, {
      'Content-Type': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
      'Content-Disposition': `attachment; filename=reporte-${sabana}.xlsx`
    })

    res.end(file)
  } catch (error) {
    res.status(500).send({ error: error.message })
  }
}

export default downloader
