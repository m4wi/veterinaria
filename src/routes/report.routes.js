import { Router } from 'express'
import controller from '../controllers/report.controller.js'

const router = Router()

router.get('/sabana/:type', controller.sabanas)
router.post('/report', controller.report)

router.get('/download/hembra', controller.download)
export default router