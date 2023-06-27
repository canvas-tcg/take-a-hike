require('dotenv').config()

const express = require("express")
const app = express()
const port = 3000
const expressLayouts = require("express-ejs-layouts")
const requestLogger = require("./middlewares/request_logger")
const methodOverride = require('method-override')
const setUser = require('./middlewares/set_user')
const session = require('express-session')
const checkLogin = require('./middlewares/check_login')

const db = require("./db/index.js");
const bcrypt = require('bcrypt');

const indexRouter = require('./routes/index')
const hikesRouter = require('./routes/hikes')

app.set("view engine", "ejs")

app.use(express.static("public"))

app.use(express.urlencoded({ extended: true }))

app.use(methodOverride(function (req, res) {
    if (req.body && typeof req.body === 'object' && '_method' in req.body) {
        var method = req.body._method
        delete req.body._method
        return method
    }
}))

app.use(requestLogger);

app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true
}))

app.use(setUser)

app.use(expressLayouts)

app.use("/", indexRouter)
app.use("/hikes", hikesRouter)

app.listen(port, () => {
    console.log(`listening on port ${port}`)
})