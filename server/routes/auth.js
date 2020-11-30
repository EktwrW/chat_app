
//     path: api/login

const { Router } = require('express');
const { check } = require('express-validator');
const { crearUsuario, login, renewToken } = require('../controllers/auth');
const { validarCampos } = require('../middlewares/validar-campos');
const { validarJWT } = require('../middlewares/validar-jwt');


const router = Router();


router.post('/new', [
    check('nombre', 'El nombre es requerido').not().isEmpty(),
    check('email', 'El email es requerido').isEmail(),
    check('password', 'El password es requerido').not().isEmpty(),
    validarCampos
], crearUsuario);

router.post('/', [
    
    check('email', 'El email es requerido').isEmail(),
    check('password', 'El password es requerido').not().isEmpty()
], login);

router.get('/renew', 
   validarJWT, renewToken
);


module.exports = router;