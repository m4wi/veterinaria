import { Router } from 'express'
import controller from '../controllers/forms.controller.js'

const router = Router()

router.post('/animals', controller.formSaveAnimal)
router.post('/biometria', controller.formSaveBiometria)

export default router