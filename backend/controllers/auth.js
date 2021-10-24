const User = require("../models/user");
const jwt = require("jsonwebtoken");
const express_jwt = require("express-jwt");
const _ = require("lodash");
const { sendEmail } = require("../validation/helper");
// load env
const dotenv = require("dotenv");
dotenv.config();

/**
 * Sign Up method, queries and selections to/from db are made here with standart MongoDB methods, json response is being returned
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 * @returns {string} res.json
 */
exports.signup = async (req, res) => {
    const userExists = await User.findOne({ email: req.body.email });
    if (userExists) {
        return res.status(403).json({
            //403 http code
            error: "Email is already in use",
        });
    }
    const user = await new User(req.body);
    await user.save();
    res.status(200).json({ message: "Sign-up successful" });
};

/**
 * Sign in method, queries and selections to/from db are made here with standart MongoDB methods, json response is being returned
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 * @returns {string} res.json
 */
exports.signin = (req, res) => {
    const { email, password } = req.body;
    User.findOne({ email }, (err, user) => {
        //if email does not exists
        if (err || !user) {
            return res.status(401).json({
                error: "This email does not exist",
            });
        }
        //if the password is not same as the hashed version
        if (!user.authenticate(password)) {
            return res.status(401).json({
                error: "Password is incorrect",
            });
        }

        const token = jwt.sign(
            { _id: user._id, role: user.role },
            process.env.JWT_SECRET
        ); //token being generated with user id and JWT secret
        res.cookie("monedhe", token, { expire: new Date() + 604800 }); //1 week remember me cookie
        const { _id, name, email, role } = user;
        return res.json({ token, user: { _id, email, name, role } }); //sending the user and his token to frontend
    });
};

/**
 * Logout method, to log out we just clear the cookie that holds the token
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 * @returns {string} res.json
 */
exports.signout = (req, res) => {
    res.clearCookie("monedhe"); //to log out we clear the token
    return res.json({ message: "Sign out successful" });
};

/**
 * Require Signin method, if json web token is valid, express jwt adds the verified id in an auth key to the request object
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 */
exports.requireSignin = express_jwt({ secret: process.env.JWT_SECRET, userProperty: "auth" });


// add forgotPassword and resetPassword methods
exports.forgotPassword = (req, res) => {
    if (!req.body) return res.status(400).json({ message: "No request body" });
    if (!req.body.email)
        return res.status(400).json({ message: "No Email in request body" });

    console.log("forgot password finding user with that email");
    const { email } = req.body;
    console.log("signin req.body", email);
    // find the user based on email
    User.findOne({ email }, (err, user) => {
        // if err or no user
        if (err || !user)
            return res.status("401").json({
                error: "User with that email does not exist!"
            });

        // generate a token with user id and secret
        const token = jwt.sign(
            { _id: user._id, role: user.role },
            process.env.JWT_SECRET
        );

        // email data
        const emailData = {
            from: "noreply@node-react.com",
            to: email,
            subject: "Password Reset Instructions",
            text: `Please use the following link to reset your password: ${process.env.CLIENT_URL
                }/reset-password/${token}`,
            html: `<p>Please use the following link to reset your password:</p> <p>${process.env.CLIENT_URL
                }/reset-password/${token}</p>`
        };

        return user.updateOne({ resetPasswordLink: token }, (err, success) => {
            if (err) {
                return res.json({ message: err });
            } else {
                sendEmail(emailData);
                return res.status(200).json({
                    message: `Email has been sent to ${email}. Follow the instructions to reset your password.`
                });
            }
        });
    });
};

// to allow user to reset password
// first you will find the user in the database with user's resetPasswordLink
// user model's resetPasswordLink's value must match the token
// if the user's resetPasswordLink(token) matches the incoming req.body.resetPasswordLink(token)
// then we got the right user

exports.resetPassword = (req, res) => {
    const { resetPasswordLink, newPassword } = req.body;

    User.findOne({ resetPasswordLink }, (err, user) => {
        // if err or no user
        if (err || !user)
            return res.status("401").json({
                error: "Invalid Link!"
            });

        const updatedFields = {
            password: newPassword,
            resetPasswordLink: ""
        };

        user = _.extend(user, updatedFields);
        user.updated = Date.now();

        user.save((err, result) => {
            if (err) {
                return res.status(400).json({
                    error: err
                });
            }
            res.json({
                message: `Great! Now you can login with your new password.`
            });
        });
    });
};