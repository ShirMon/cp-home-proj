from django.db import models

class Person(models.Model):
    name = models.CharField("Name", max_length=240)
    age = models.IntegerField("Age")
    email = models.EmailField()
    created = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.name