# crypto_integration_views.py
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from silkroad.models import Wallet, Trade
from silkroad.utils import get_crypto_prices, get_user_wallet_balance

@login_required
def crypto_dashboard(request):
    user_wallet = Wallet.objects.get(user=request.user)
    crypto_prices = get_crypto_prices()
    balance = get_user_wallet_balance(user_wallet)
    return render(request, 'crypto_dashboard.html', {'balance': balance, 'crypto_prices': crypto_prices})

@login_required
def buy_crypto(request):
    if request.method == 'POST':
        symbol = request.POST.get('symbol')
        amount = float(request.POST.get('amount'))
        user_wallet = Wallet.objects.get(user=request.user)
        if user_wallet.balance >= amount:
            trade = Trade(user=request.user, symbol=symbol, type='buy', amount=amount)
            trade.save()
            user_wallet.balance -= amount
            user_wallet.save()
            return redirect('crypto_dashboard')
    return JsonResponse({'error': 'Insufficient balance'})

@login_required
def sell_crypto(request):
    if request.method == 'POST':
        symbol = request.POST.get('symbol')
        amount = float(request.POST.get('amount'))
        user_wallet = Wallet.objects.get(user=request.user)
        if user_wallet.balance >= amount:
            trade = Trade(user=request.user, symbol=symbol, type='sell', amount=amount)
            trade.save()
            user_wallet.balance += amount
            user_wallet.save()
            return redirect('crypto_dashboard')
    return JsonResponse({'error': 'Insufficient balance'})

@login_required
def get_crypto_prices_ajax(request):
    crypto_prices = get_crypto_prices()
    return JsonResponse({'crypto_prices': crypto_prices})
