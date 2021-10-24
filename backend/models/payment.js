const mongoose = require("mongoose");

const paymentSchema = new mongoose.Schema({
  sender: {
    type: mongoose.Schema.ObjectId,
    ref: "User",
  },

  holding_card: {
    type: mongoose.Schema.ObjectId,
    ref: "BankCard",
  },

  holding_wallet: {
    type: mongoose.Schema.ObjectId,
    ref: "CryptoWallet",
  },

  receiver: {
    type: mongoose.Schema.ObjectId,
    ref: "User",
  },

  value: { type: Number },
  currency: { type: String }, // can be EUR, USD, BTC
  sent_at: { type: Date, default: Date.now },
  context_message: { type: String, maxlength: 250 }, // a payment can also have a message with it
});

module.exports = mongoose.model("Payment", paymentSchema);
