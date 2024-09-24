from django.db import models
from django.conf import settings
from django.contrib.auth.models import AbstractUser

class CustomUser(AbstractUser):
    # Campos adicionales si es necesario
    email = models.EmailField(unique=True)  # Hacemos el email único
    phone_number = models.CharField(max_length=15, blank=True, null=True)  # Campo opcional
    

    def __str__(self):
        return self.username

class Citas(models.Model):
    Usuario = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    Fecha = models.DateTimeField()
    Servicio = models.CharField(max_length=255)
    Nombre_mascota = models.CharField(max_length=255)

    def __str__(self):
        return f"Citas for {self.Nombre_mascota} on {self.Fecha}"

class Mascota(models.Model):
    OPCIONES_ANIMAL = [
        ('Perro', 'Perro'),
        ('Gato', 'Gato'),
    ]
    nombre = models.CharField(max_length=100)
    raza = models.CharField(max_length=100)
    edad = models.IntegerField()
    tipo = models.CharField(choices=OPCIONES_ANIMAL, max_length=5)
    propietario = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)  # Relación con CustomUser

    def __str__(self):
        return f'{self.nombre} ({self.tipo})'