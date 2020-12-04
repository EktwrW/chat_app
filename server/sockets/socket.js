const { comprobarJWT } = require('../helpers/jwt');
const { io } = require('../index');
const { usuarioConectado, usuarioDesconectado } = require('../controllers/socket');


// Mensajes de Sockets
io.on('connection',  (client) => {
    console.log('Cliente conectado');
    
    const [ valido, uid ] = comprobarJWT(client.handshake.headers['x-token']);
    
    // Verificar autenticacion:
    if(!valido){ return client.disconnect(); }

    //Cliente autenticado:
    usuarioConectado( uid );

    // ingresar al usuario a una sala específica:
    client.join( uid );

    // escuchar del cliente, el mensaje-personal:
    client.on('mensaje-personal', ( payload ) => {
        console.log(payload) 
    });

    client.on('disconnect', () => {
        usuarioDesconectado( uid );
    });

    /* client.on('mensaje', ( payload ) => {
        console.log('Mensaje', payload);

        io.emit( 'mensaje', { admin: 'Nuevo mensaje' } );

    }); */


});
