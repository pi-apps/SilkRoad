# ai_trader_views.py
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from silkroad.models import Trade
from silkroad.ai_trader import AI_Trader

@login_required
def ai_trader_dashboard(request):
    ai_trader = AI_Trader(request.user)
    trades = Trade.objects.filter(user=request.user)
    return render(request, 'ai_trader_dashboard.html', {'trades': trades, 'ai_trader': ai_trader})

@login_required
def start_ai_trader(request):
    ai_trader = AI_Trader(request.user)
    ai_trader.start_trading()
    return redirect('ai_trader_dashboard')

@login_required
def stop_ai_trader(request):
    ai_trader = AI_Trader(request.user)
    ai_trader.stop_trading()
    return redirect('ai_trader_dashboard')

@login_required
def get_ai_trader_status_ajax(request):
    ai_trader = AI_Trader(request.user)
    status = ai_trader.get_status()
    return JsonResponse({'status': status})
