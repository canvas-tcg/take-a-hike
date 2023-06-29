const express = require('express');
const router = express.Router();
const db = require("../db/index.js");
const bcrypt = require('bcrypt');
const checkLogin = require('../middlewares/check_login.js')

router.get("/signup", (req, res) => {
    res.render("signup")
})

router.post("/signup", (req, res) => {
    let username = req.body.username
    let email = req.body.email
    let plainTextPassword = req.body.password
    let saltRounds = 10

    bcrypt.genSalt(saltRounds, (err, salt) => {
        bcrypt.hash(plainTextPassword, salt, (err, hash) => {
            let sql = `INSERT INTO users (username, email, password_digest)
            values ('${username}','${email}', '${hash}');`
            console.log(sql)
            db.query(sql, (err, res) => {
                if (err) {
                    console.log(err)
                } else {
                    console.log('new user created')
                }
            })

        })
    })
    res.redirect("/login")
})

module.exports = router