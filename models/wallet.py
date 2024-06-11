# wallet.py
from django.db import models
from silkroad.utils import generate_unique_id

class Wallet(models.Model):
    id = models.CharField(max_length=32, primary_key=True, default=generate_unique_id)
    user = models.OneToOneField('User', on_delete=models.CASCADE)
    btc_address = models.CharField(max_length=34, unique=True)
    eth_address = models.CharField(max_length=42, unique=True)
    ltc_address = models.CharField(max_length=34, unique=True)
    balance = models.DecimalField(max_digits=18, decimal_places=8, default=0)

    def __str__(self):
        return f"Wallet {self.id} - {self.user.username}"

    def update_balance(self, amount, crypto):
        if crypto == 'btc':
            self.balance += amount
        elif crypto == 'eth':
            self.balance += amount
        elif crypto == 'ltc':
            self.balance += amount
        self.save()
