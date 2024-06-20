const express = require("express");
const bodyParser = require("body-parser");
const sqlite3 = require("sqlite3").verbose();
const axios = require("axios");
const dotenv = require("dotenv");

dotenv.config();

const app = express();
app.use(bodyParser.json());

const db = new sqlite3.Database("payment_gateway.db", (err) => {
  if (err) {
    console.error(err.message);
  }
  console.log("Connected to the payment_gateway database.");
});

db.serialize(() => {
  db.run("CREATE TABLE IF NOT EXISTS payments (id INTEGER PRIMARY KEY AUTOINCREMENT, order_id TEXT, amount REAL, currency TEXT, payment_status TEXT, pi_wallet_payment_id TEXT)");
});

app.post("/create_payment", async (req, res) => {
  const { order_id, amount, currency } = req.body;

  try {
    const piWalletPaymentId = await createPiWalletPayment(order_id, amount, currency);
    db.run("INSERT INTO payments (order_id, amount, currency, payment_status, pi_wallet_payment_id) VALUES (?, ?, ?, 'pending', ?)", [order_id, amount, currency, piWalletPaymentId], function (err) {
      if (err) {
        return res.status(500).json({ error: err.message });
      }
      res.json({ payment_id: this.lastID });
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to create Pi Wallet payment." });
  }
});

app.post("/webhook", async (req, res) => {
  const { payment_id, payment_status } = req.body;

  try {
    db.run("UPDATE payments SET payment_status = ? WHERE pi_wallet_payment_id = ?", [payment_status, payment_id], function (err) {
      if (err) {
        return res.status(500).json({ error: err.message });
      }

      if (this.changes === 0) {
        return res.status(404).json({ error: "Payment not found." });
      }

      if (payment_status === "success") {
        await updateSilkRoadOrderStatus(payment.order_id, "paid");
      }

      res.json({ success: true });
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to process Pi Wallet webhook." });
  }
});

const createPiWalletPayment = async (order_id, amount, currency) => {
  const piWalletApiKey = process.env.PI_WALLET_API_KEY;
  const piWalletApiSecret = process.env.PI_WALLET_API_SECRET;

  const headers = {
    "Authorization": `Bearer ${piWalletApiKey}`,
    "Content-Type": "application/json"
  };

  const data = {
    amount,
    currency,
    order_id
  };

  const response = await axios.post("https://api.pi-wallet.com/v1/payments", data, { headers });
  return response.data.payment_id;
};

const updateSilkRoadOrderStatus = async (order_id, status) => {
  const silkRoadApiKey = process.env.SILKROAD_API_KEY;
  const silkRoadApiSecret = process.env.SILKROAD_API_SECRET;

  const headers = {
    "Authorization": `Bearer ${silkRoadApiKey}`,
    "Content-Type": "application/json"
  };

  const data = {
order_id,
    status
  };

  await axios.patch("https://api.silkroad.com/v1/orders", data, { headers });
};

app.listen(3000, () => {
  console.log("Payment gateway server listening on port 3000.");
});
