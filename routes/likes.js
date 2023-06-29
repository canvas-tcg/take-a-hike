const express = require('express');
const router = express.Router();
const db = require("../db/index.js");
const checkLogin = require('../middlewares/check_login.js')

router.get("/likes", checkLogin, (req, res) => {
    db.query(`SELECT * FROM likes WHERE user_id = ${req.session.userId};`, (err, dbRes) => {
        if (err){
            console.log(err);
        }
        let likes = dbRes.rows
        let hikes = dbRes.rows
        let userId = req.session.userId
        res.render("likes", {likes: likes, hikes: hikes, userId: userId })
    })
    
})


// saving a new like
router.post("/likes", checkLogin, (req, res, err) => {
    if (err) {
        console.log(err);
    }
    
    let hikeId = req.body.hike_id
    const sql = `
    INSERT INTO likes (user_id, hike_id)
    VALUES ($1, $2)
    RETURNING id;`

    console.log(sql);

    db.query(sql, [req.session.userId, hikeId], (err, dbRes) => {
        if (err){
            console.log(err)
        }
        console.log("saved")
        res.redirect(`/hikes/${hikeId}`)
    })
})

//removing a like
router.delete("/:id", checkLogin, (req, res) => {
    db.query(`DELETE FROM likes WHERE id = $1;`, [req.params.id], (err, dbRes) => {
        res.redirect("/likes")
    })
})

module.exports = router