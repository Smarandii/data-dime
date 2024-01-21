from django.contrib.auth.models import AbstractUser
from django.db import models

class CustomUser(AbstractUser):
    SUBSCRIPTION_CHOICES = [
        ('free', 'Free'),
        ('paid', 'Paid')
    ]

    subscription_status = models.CharField(max_length=20, choices=SUBSCRIPTION_CHOICES, default='free')

    def __str__(self):
        return self.username
