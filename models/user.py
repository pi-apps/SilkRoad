# user.py
from django.db import models
from django.contrib.auth.models import AbstractUser
from silkroad.utils import generate_unique_id

class User(AbstractUser):
    id = models.CharField(max_length=32, primary_key=True, default=generate_unique_id)
    email = models.EmailField(unique=True)
    phone_number = models.CharField(max_length=20, blank=True)
    country = models.CharField(max_length=50, blank=True)
    language = models.CharField(max_length=5, choices=[
        ('en', 'English'),
        ('es', 'Spanish'),
        ('fr', 'French'),
        ('zh', 'Chinese'),
    ], default='en')

    def __str__(self):
        return self.username

    def get_full_name(self):
        return f"{self.first_name} {self.last_name}"

    def get_short_name(self):
        return self.username
