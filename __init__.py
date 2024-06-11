# __init__.py
from django.core.wsgi import get_wsgi_application

application = get_wsgi_application()

import os
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'silkroad.settings')

from silkroad.settings import *

from django.core.management.commands.runserver import run_server
from django.core.management.commands.runserver import staticfiles_serve

def run_dev_server():
    run_server(default_addr='0.0.0.0', default_port='8000', use_reloader=True, use_debugger=True, use_runserver=True)

def run_prod_server():
    staticfiles_serve(default_addr='0.0.0.0', default_port='8000', use_reloader=False, use_debugger=False, use_runserver=False)
