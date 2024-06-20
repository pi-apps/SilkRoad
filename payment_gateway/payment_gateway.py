import requests

# SilkRoad API endpoint
silkroad_api = "https://api.silkroad.com/v1/orders"

# Pi Wallet API endpoint
pi_wallet_api = "https://api.pi-wallet.com/v1/payments"

# Create payment request on SilkRoad
response = requests.post(silkroad_api, json={"order_id": "ORDER_ID", "amount": 10.99, "currency": "USD"})
order_id = response.json()["order_id"]

# Create payment request on Pi Wallet
response = requests.post(pi_wallet_api, json={"amount": 10.99, "currency": "USD", "order_id": order_id})
payment_id = response.json()["payment_id"]

# Redirect user to Pi Wallet payment page
payment_url = f"https://api.pi-wallet.com/v1/payments/{payment_id}"
print(f"Redirect to: {payment_url}")

# Handle payment callback from Pi Wallet
def handle_payment_callback(payment_id, payment_status):
    if payment_status == "success":
        # Update order status in SilkRoad
        response = requests.patch(silkroad_api, json={"order_id": order_id, "status": "paid"})
        print(f"Order {order_id} paid successfully!")
    else:
        print(f"Payment failed for order {order_id}")

# Verify payment status
response = requests.get(pi_wallet_api, params={"payment_id": payment_id})
payment_status = response.json()["status"]
handle_payment_callback(payment_id, payment_status)
