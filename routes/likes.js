const express = require('express');
const router = express.Router();
const db = require("../db/index.js");
const checkLogin = require('../middlewares/check_login.js')

router.get("/likes", checkLogin, (req, res) => {
    db.query(`SELECT * FROM hikes
    INNER JOIN likes
    ON hikes.id = likes.hike_id
    WHERE likes.user_id = ${req.session.userId};`, (err, dbRes) => {
        if (err) {
            console.log(err);
        }
        let hikes = dbRes.rows
        res.render("likes", { hikes: hikes })
    })
})

router.post("/likes", checkLogin, (req, res, err) => {
    if (err) {
        console.log(err);
    }

    db.query(`SELECT * FROM likes WHERE hike_id = $1  AND user_id = $2;`, [req.body.hike_id, req.session.userId], (err, dbRes) => {
        if (err) {
            console.log(err);
        }
        let hikeId = req.body.hike_id
        if (dbRes.rows.length != 0) {
            console.log('already exists in like table')
            res.redirect(`/hikes/${hikeId}`)
            return
        } else {
            let hikeId = req.body.hike_id
            const sql = `INSERT INTO likes (user_id, hike_id)
                    VALUES ($1, $2)
                    RETURNING id;`
            console.log(sql);

            db.query(sql, [req.session.userId, hikeId], (err, dbRes) => {
                if (err) {
                    console.log(err)
                }
                console.log("saved")
                res.redirect(`/hikes/${hikeId}`)
            })
        }

    })
})

router.delete("/:id", checkLogin, (req, res) => {
    db.query(`DELETE FROM likes WHERE id = $1 AND user_id = $2;`, [req.params.id, req.session.userId], (err, dbRes) => {
        console.log(req.params.id);
        if (err) {
            console.log(err)
        }
        res.redirect("/likes")
    })
})

module.exports = router