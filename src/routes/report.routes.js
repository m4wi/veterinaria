import { Router } from 'express'
import controller from '../controllers/report.controller.js'
import downloader from '../controllers/download.controller.js'

const router = Router()

router.get('/sabana/:type', controller.sabanas)
router.post('/report', controller.report)

// agregar count

router.get('/download/:sabana', downloader.downloadSabana)
router.get('/animal/count', controller.animalCount)
router.get('/animal/initial', controller.initialAnimalTable)
export default router
