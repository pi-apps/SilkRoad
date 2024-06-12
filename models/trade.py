# trade.py
from django.db import models
from silkroad.utils import generate_unique_id

class Trade(models.Model):
    id = models.CharField(max_length=32, primary_key=True, default=generate_unique_id)
    user = models.ForeignKey('User', on_delete=models.CASCADE)
    symbol = models.CharField(max_length=10)  # e.g. BTCUSD, ETHUSD, etc.
    type = models.CharField(max_length=10, choices=[
        ('buy', 'Buy'),
        ('sell', 'Sell'),
    ])
    amount = models.DecimalField(max_digits=18, decimal_places=8)
    price = models.DecimalField(max_digits=18, decimal_places=8)
    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Trade {self.id} - {self.user.username} - {self.symbol} {self.type} {self.amount} at {self.price}"

    def get_profit(self):
        # calculate profit based on trade type and price
        if self.type == 'buy':
            return self.price - self.amount
        elif self.type == 'sell':
            return self.amount - self.price
