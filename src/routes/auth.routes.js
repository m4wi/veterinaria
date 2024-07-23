import { Router } from 'express'
import controller from '../controllers/auth.controller.js'

const router = Router()

router.get('/animal/status',controller.validAnimal)
router.get('/user/state', controller.authUser)

export default router