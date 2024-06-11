# social_trading.py
import django.contrib.auth.models as auth_models
from silkroad.models import User, Trade

class SocialTrading:
    def __init__(self, user_id):
        self.user_id = user_id
        self.user = User.objects.get(id=user_id)

    def follow_trader(self, trader_id):
        trader = User.objects.get(id=trader_id)
        self.user.following.add(trader)

    def unfollow_trader(self, trader_id):
        trader = User.objects.get(id=trader_id)
        self.user.following.remove(trader)

    def get_following_trades(self):
        trades = Trade.objects.filter(user__in=self.user.following.all())
        return trades

    def get_trade_feed(self):
        trades = Trade.objects.filter(user=self.user)
        return trades
