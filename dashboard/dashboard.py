# dashboard.py
import django.contrib.auth.models as auth_models
from silkroad.models import User, Widget

class Dashboard:
    def __init__(self, user_id):
        self.user_id = user_id
        self.user = User.objects.get(id=user_id)

    def get_widgets(self):
        return Widget.objects.filter(user=self.user)

    def add_widget(self, widget_type):
        widget = Widget(user=self.user, type=widget_type)
        widget.save()
        return widget

    defremove_widget(self, widget_id):
        Widget.objects.get(id=widget_id).delete()
