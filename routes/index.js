const express = require('express');
const router = express.Router();
const db = require("../db/index.js");

router.get("/", (req, res) => {
    db.query("SELECT * FROM hikes;", (err, dbRes) => {
        if (err) {
            console.log(err)
        }
        let hikes = dbRes.rows
        res.render("home", { hikes: hikes })
    })
})

module.exports = router