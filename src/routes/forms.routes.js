import { Router } from 'express'
import controller from '../controllers/forms.controller.js'

const router = Router()

router.post('/form/animals', controller.formSaveAnimal)
router.post('/form/biometria', controller.formSaveBiometria)
router.post('/form/muestra', controller.formSaveMuestra)
router.post('/form/reproduccion', controller.formSaveReproduccion)
router.post('/form/dosificacion', controller.formSaveDosificacion)
router.post('/form/vellon', controller.formSaveVellon)

export default router
