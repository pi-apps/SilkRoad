# crypto_integration.py
import requests
import json
from silkroad.models import User, Wallet

class CryptoIntegration:
    def __init__(self, api_key, api_secret):
        self.api_key = api_key
        self.api_secret = api_secret
        self.btc_client = requests.Session()
        self.eth_client = requests.Session()
        self.ltc_client = requests.Session()

    def get_balances(self, user_id):
        user = User.objects.get(id=user_id)
        wallet = Wallet.objects.get(user=user)
        btc_balance = self.btc_client.get(f'https://api.bitcoinapi.io/v1/balance/{wallet.btc_address}', headers={'Authorization': f'Bearer {self.api_key}'}).json()
        eth_balance = self.eth_client.get(f'https://api.ethereumapi.io/v1/balance/{wallet.eth_address}', headers={'Authorization': f'Bearer {self.api_key}'}).json()
        ltc_balance = self.ltc_client.get(f'https://api.litecoinapi.io/v1/balance/{wallet.ltc_address}', headers={'Authorization': f'Bearer {self.api_key}'}).json()
        return {'btc': btc_balance['balance'], 'eth': eth_balance['balance'], 'ltc': ltc_balance['balance']}

    def send_transaction(self, user_id, crypto, amount, recipient):
        user = User.objects.get(id=user_id)
        wallet = Wallet.objects.get(user=user)
        if crypto == 'btc':
            response = self.btc_client.post(f'https://api.bitcoinapi.io/v1/transaction/{wallet.btc_address}', headers={'Authorization': f'Bearer {self.api_key}'}, json={'amount': amount, 'ecipient': recipient})
        elif crypto == 'eth':
            response = self.eth_client.post(f'https://api.ethereumapi.io/v1/transaction/{wallet.eth_address}', headers={'Authorization': f'Bearer {self.api_key}'}, json={'amount': amount, 'ecipient': recipient})
        elif crypto == 'ltc':
            response = self.ltc_client.post(f'https://api.litecoinapi.io/v1/transaction/{wallet.ltc_address}', headers={'Authorization': f'Bearer {self.api_key}'}, json={'amount': amount, 'ecipient': recipient})
        return response.json()
