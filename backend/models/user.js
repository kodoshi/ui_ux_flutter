const mongoose = require("mongoose");
//const uuidv1 = require("uuid/v1");  deprecated?
const { v1: uuidv1 } = require("uuid");
const crypto = require("crypto");

const userSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
    minlength: 3,
    maxlength: 50,
  },

  email: {
    type: String,
    required: true,
    minlength: 3,
    maxlength: 150,
  },

  resetPasswordLink: {
    data: String,
    default: "",
  },

  hashed_password: {
    type: String,
    required: true,
  },

  salt: {
    type: String,
  },

  created_at: {
    type: Date,
    default: Date.now,
  },

  updated_at: {
    type: Date,
  },

  photo: {
    data: Buffer,
    contentType: String,
  },

  about: {
    type: String,
    trim: true,
  },

  //a bank card will also hold payments made/received into it
  bank_cards: [{ type: mongoose.Schema.ObjectId, ref: "BankCard" }],

  //crypto wallet will also hold payments made/received into it
  crypto_wallet: { type: mongoose.Schema.ObjectId, ref: "CryptoWallet" }, // only 1

  //preferred values, when receiving money user can pick to get his funds
  //automatically converted to a pre-selected currency/crypto, based on active card picked
  active_preferences: {
    card_destination: { type: mongoose.Schema.ObjectId, ref: "BankCard" },
    //since user can have multiple cards but only 1 crypto wallet,
    //the selection will be based on a boolean, & crypto wallet can only hold BTC for now
    isCryptoPreferred: { type: Boolean, default: false },
  },

  contacts: [{ type: mongoose.Schema.ObjectId, ref: "User" }],

  // payments_received: [{ type: mongoose.Schema.ObjectId, ref: "Payment" }],
  // payments_sent: [{ type: mongoose.Schema.ObjectId, ref: "Payment" }],

  //used for authentication, can be subscriber or admin
  role: {
    type: String,
    default: "subscriber",
  },

  //first char can be B (beginner {0-5}), I (intermediate {6-20}), E (experienced {21+})
  //first char designation is based on number of transfers made/received
  //second char can be:
  // 1 (has sent/received less than 200 eur in total)
  // 2 (has sent/received less than 1000 eur in total)
  // 3 (has sent/received less than 3000 eur in total)
  user_category: {
    type: String,
    default: "B-1",
  },

  notifications: [
    {
      type: String,
    },
  ],
});

/**
 * Virtual fields are additional fields that don't get persisted in the DB,
 * they only exist logically and have pre-defined capabilities
 */

userSchema
  .virtual("password")
  .set(function (password) {
    this._password = password; //temp var to hold the current password
    this.salt = uuidv1(); //salt based on timestamp
    this.hashed_password = this.encryptPassword(password); //encrypting and logging passw as hashed_passw in DB
  })
  .get(function () {
    return this._password;
  });

/**
 * Methods of User model, Authenticate function that compares plaintext password to hashed password,
 * Encrypt password function that encrypts the given plaintext with sha1 + salt
 */
userSchema.methods = {
  authenticate: function (plainText) {
    return this.encryptPassword(plainText) === this.hashed_password;
  },

  encryptPassword: function (password) {
    if (!password) {
      return "";
    }
    try {
      return crypto
        .createHmac("sha1", this.salt)
        .update(password)
        .digest("hex");
    } catch (err) {
      return "";
    }
  },
};

module.exports = mongoose.model("User", userSchema);
