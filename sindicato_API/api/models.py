from django.db import models

# Create your models here.
class Worker(models.Model):
    name = models.CharField(max_length=100)
    identity_card = models.CharField(max_length=11)
    email = models.EmailField()

    def __str__(self):
        return self.name
