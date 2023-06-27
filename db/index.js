// require('dotenv').config()
const pg = require("pg")

console.log(process.env.DATABASE_URL)
const db = new pg.Pool({
    connectionString: process.env.DATABASE_URL,
})

module.exports = db