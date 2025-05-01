const mongoose = require('mongoose');

const connection = mongoose.createConnection('mongodb://localhost:27017/nexarDB').on('open',()=>{
    console.log("MongoDB connected");
}).on('error',()=>{
    console.log("Error connection");
});

module.exports = connection;


