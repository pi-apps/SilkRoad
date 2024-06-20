import os
import json
import requests
from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///payment_gateway.db"
db = SQLAlchemy(app)

class Payment(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    order_id = db.Column(db.String(255), nullable=False)
    amount = db.Column(db.Float, nullable=False)
    currency = db.Column(db.String(3), nullable=False)
    payment_status = db.Column(db.String(20), default="pending")

@app.route("/create_payment", methods=["POST"])
def create_payment():
    data = request.get_json()
    order_id = data["order_id"]
    amount = data["amount"]
    currency = data["currency"]

    payment = Payment(order_id=order_id, amount=amount, currency=currency)
    db.session.add(payment)
    db.session.commit()

    pi_wallet_payment_id = create_pi_wallet_payment(order_id, amount, currency)
    payment.pi_wallet_payment_id = pi_wallet_payment_id
    db.session.commit()

    return jsonify({"payment_id": payment.id})

@app.route("/webhook", methods=["POST"])
def webhook_handler():
    data = request.get_json()
    payment_id = data["payment_id"]
    payment_status = data["payment_status"]

    payment = Payment.query.get(payment_id)
    if payment:
        payment.payment_status = payment_status
        db.session.commit()

        if payment_status == "success":
            # Update order status in SilkRoad
            update_silkroad_order_status(payment.order_id, "paid")

    return jsonify({"success": True})

def create_pi_wallet_payment(order_id, amount, currency):
    pi_wallet_api_key = os.environ["PI_WALLET_API_KEY"]
    pi_wallet_api_secret = os.environ["PI_WALLET_API_SECRET"]

    headers = {
        "Authorization": f"Bearer {pi_wallet_api_key}",
        "Content-Type": "application/json"
    }

    data = {
        "amount": amount,
        "currency": currency,
        "order_id": order_id
    }

    response = requests.post("https://api.pi-wallet.com/v1/payments", headers=headers, json=data)
    return response.json()["payment_id"]

def update_silkroad_order_status(order_id, status):
    silkroad_api_key = os.environ["SILKROAD_API_KEY"]
    silkroad_api_secret = os.environ["SILKROAD_API_SECRET"]

    headers = {
        "Authorization": f"Bearer {silkroad_api_key}",
        "Content-Type": "application/json"
    }

    data = {
        "order_id": order_id,
        "status": status
    }

    response = requests.patch("https://api.silkroad.com/v1/orders", headers=headers, json=data)
    return response.json()

if __name__ == "__main__":
    app.run(debug=True)
