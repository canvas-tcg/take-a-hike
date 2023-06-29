require('dotenv').config()
const db = require('./index.js')
const bcrypt = require('bcrypt');

let username = 'mim'
let email = 'mim@mim.com'
let plainTextPassword = 'parks'
let saltRounds = 10;

bcrypt.genSalt(saltRounds, (err, salt) => {
    bcrypt.hash(plainTextPassword, salt, (err, hash) => {
        let sql = `
        INSERT INTO users (email, username, password_digest)
        VALUES ('${email}', '${username}', '${hash}');`
        console.log(sql)
        db.query(sql, (err, res) => {
            if (err) {
                console.log(err)
            } else {
                console.log("new user created")
            }
        })

    })
})