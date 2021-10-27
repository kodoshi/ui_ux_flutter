//const config = require("./config/config.js");
const express = require('express');
const app = express();
require('dotenv').config();
const mongoose = require("mongoose");
const morgan = require("morgan");
const bodyParser = require("body-parser");
const cookieParser = require("cookie-parser");
const expressValidator = require("express-validator");
const cors = require("cors");

// Mongoose DB connection
mongoose.connect(process.env.DB_ADDRESS, {
    useUnifiedTopology: true,
    useNewUrlParser: true,
    useFindAndModify: false,
});

let db = mongoose.connection;

//Check connection
db.once("open", function () {
    console.log("Connection to MongoDB successful");
});

//Check DB errors
db.on("error", function (err) {
    console.log(err);
});

const authRoutes = require("./routes/auth"); //authentication routing
const userRoutes = require("./routes/user"); //user routing

//middlewares
app.use(morgan("dev"));
app.use(bodyParser.json()); //express is depress-ion
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(cookieParser());
app.use(expressValidator());
app.use(cors());
app.use("/", authRoutes);
app.use("/", userRoutes);


//custom middleware to give cleaner missing auth error
app.use(function (err, req, res, next) {
    if (err.name === "UnauthorizedError") {
        res.status(401).json({ error: "Unauthorized" });
    }
});

app.listen(process.env.SERVER_PORT, () => {
    console.log(`Node server active on port ${process.env.SERVER_PORT}`);
});
