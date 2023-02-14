var { Pool } = require('pg')

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'online_test', 
    password: 'erkin2002'
})

async function fetchAll (SQL, params=[]) {
    const client = await pool.connect()
    try {
        const {rows} = await client.query(SQL, params)
        return rows;
    } catch (error) {
        console.log('db error: ' , error.message);
    }finally{
        client.release()
    }
}

module.exports = {
    fetchAll
}