const mysql = require('mysql2');

//MySQL details
const mysqlPool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'infoportal',
});

module.exports = mysqlPool;