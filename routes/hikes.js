const express = require('express');
const router = express.Router();
const db = require("../db/index.js");
const checkLogin = require('../middlewares/check_login.js')
// ADD checkLogin after new, 
router.get("/new", (req, res) => {
    res.render("new")
})


// Add checkLogin after "/",
router.post("/", (req, res) => {
    let name = req.body.name
    let image_url = req.body.image_url
    let location = req.body.location
    let length = req.body.length
    let days = req.body.days

    const sql = `INSERT INTO hikes
    (name, image_url, location, length, days, user_id)
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING id;`

    db.query(sql, [name, image_url, location, length, days, req.session.userId], (err, dbRes) => {
        if (err){
            console.log(err)
        }
        res.redirect(`/hikes/${dbRes.rows[0].id}`)
    })
})

router.get("/:id", (req, res) => {
    let sql = `SELECT * FROM hikes WHERE id = $1;`
    db.query(sql, [req.params.id], (err, dbRes) => {
        if (err) {
            console.log(err)
        }
        let hike = dbRes.rows[0]
        res.render("show", { hike: hike })
    })
})

// Add checkLogin after edis in router.get function 
router.get("/:id/edit", (req, res) => {
    db.query(`SELECT * FROM hikes WHERE id = $1;`, [req.params.id], (err, dbRes) => {
        if (err) {
            console.log(err)
        }
        let hike = dbRes.rows[0]
        res.render("edit", { hike: hike})
    })
})

router.put("/:id", (req, res)  => {
    let name = req.body.name
    let image_url = req.body.image_url
    let location = req.body.location
    let length = req.body.length
    let days = req.body.days

    const sql = `
    UPDATE hikes
    SET
    name = $1,
    image_url = $2,
    location = $3,
    length = $4,
    days = $5
    WHERE id = $6;`

    db.query(sql, [name, image_url, location, length, days, req.params.id], (err, dbRes) => {
        if (err) {
            console.log(err)
        }
        res.redirect(`/hikes/${req.params.id}`)
    })

})

// ADD checkLogin after id
router.delete("/:id", (req, res) => {
    db.query(`DELETE FROM hikes WHERE id = $1;`, [req.params.id], (err, dbRes) => {
        res.redirect("/")
    })
})


module.exports = router