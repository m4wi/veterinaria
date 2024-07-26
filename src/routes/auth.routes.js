import { Router } from 'express'
import controller from '../controllers/auth.controller.js'

const router = Router()

router.post('/animal/status', controller.validAnimal)
router.post('/user/state', controller.authUser)

export default router
