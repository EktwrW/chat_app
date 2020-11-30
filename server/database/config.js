const mongoose = require('mongoose');

const dbConnection = async() => {
    try {
        await mongoose.connect(process.env.DB_CNN, {
            useNewUrlParser: true,
            useUnifiedTopology: true, 
            useCreateIndex: true,
        });

        console.log('DB online');

    } catch (error) {
        console.log(error);
        throw new Error('Error en base de datos - Consulte al admin');
    }
}

module.exports = {
    dbConnection
}