const User = require("../models/user");
const Card = require("../models/bank_card");
const Wallet = require("../models/crypto_wallet");
const Payment = require("../models/payment");

 
/**
 * Make payment method
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 * @returns {json} res.json
 */
exports.makePayment = async (req, res) => {
    const sender = await User.findById(req.body.sender).exec();
    const receiver = await User.findById(req.body.receiver).exec();
    let payment;
    let card;
    let wallet
    if (req.body.cryptoPayment) {
        wallet = await Wallet.findById(sender.crypto_wallet).exec();
        payment = new Payment({
            sender: req.body.sender,
            receiver: req.body.receiver,
            holding_wallet: sender.crypto_wallet,
            value: req.body.value,
            currency: "BTC",
            context_message: req.body.message,
        })
        wallet.payments_sent.push(payment);
        wallet.absolute_balance -= req.body.value;
        await wallet.save();
    } else {
        card = await Card.findById(req.body.card).exec();
        payment = new Payment({
            sender: req.body.sender,
            receiver: req.body.receiver,
            holding_card: req.body.card,
            value: req.body.value,
            currency: card.details.currency,
            context_message: req.body.message,
        })
        card.payments_sent.push(payment);
        card.relative_balance -= req.body.value;
        await card.save();
    }
    if (receiver.active_preferences.isCryptoPreferred === true) {
        const receiver_wallet = await Wallet.findById(receiver.crypto_wallet).exec();
        receiver_wallet.payments_received.push(payment);
        receiver_wallet.absolute_balance += Number(req.body.value);
        await receiver_wallet.save();
    } else {
        const receiver_card = await Card.findById(receiver.active_preferences.card_destination).exec();
        receiver_card.payments_received.push(payment);
        receiver_card.relative_balance += Number(req.body.value);
        await receiver_card.save();
    }
    await payment.save();

    res.status(200).json({ message: "Payment done" });
};