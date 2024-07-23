import { Router } from 'express'
import controller from '../controllers/report.controller.js'

const router = Router()

router.get('/sabana/:type', controller.sabanas)
router.get('/report', controller.report)

export default router