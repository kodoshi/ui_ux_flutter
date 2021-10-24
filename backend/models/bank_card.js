const mongoose = require("mongoose");

const cardSchema = new mongoose.Schema({
  owner: {
    type: mongoose.Schema.ObjectId,
    ref: "User",
  },

  details: {
    name: { //holds short description, e.g Online shopping card 
      type: String,
      required: true,
      minlength: 3,
      maxlength: 100,
    },
    type: {
      //visa, mastercard etc
      type: String,
      required: true,
      minlength: 2,
      maxlength: 30,
    },
    iban: {
      type: String,
      required: true,
      minlength: 3,
      maxlength: 100,
    },
    expiration_date: {
      type: String,
      required: true,
      minlength: 2,
      maxlength: 10,
    },
    cvv_code: {
      type: String,
      required: true,
      minlength: 3,
      maxlength: 4,
    },
    spending_limit: {
      type: Number,
      required: true,
      //if 0, there is no spending limit
    },
    currency: {
      type: String,
      required: true,
    },
  },

  created_at: {
    type: Date,
    default: Date.now,
  },

  payments_received: [
    {
      type: mongoose.Schema.ObjectId,
      ref: "Payment",
    },
  ],

  payments_sent: [
    {
      type: mongoose.Schema.ObjectId,
      ref: "Payment",
    },
  ],

  //will keep in mind the incoming money, and the outgoing money
  //this is not the real balance of the card, it only considers funds that affect our app
  relative_balance: { 
    type: Number,
    default: 0,
  },
});

module.exports = mongoose.model("BankCard", cardSchema);
