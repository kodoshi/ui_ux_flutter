const mongoose = require("mongoose");

const walletSchema = new mongoose.Schema({
  //by default it only accepts BTC
  owner: {
    type: mongoose.Schema.ObjectId,
    ref: "User",
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

  absolute_balance: {
    type: Number,
    default: 0,
  },
});

module.exports = mongoose.model("CryptoWallet", walletSchema);
