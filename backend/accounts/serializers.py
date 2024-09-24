from rest_framework import serializers
from django.contrib.auth.models import User
from .models import CustomUser, Citas, Mascota

class CustomUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ['id', 'username', 'email', 'password', 'phone_number']  # Agrega los campos que desees

    def create(self, validated_data):
        user = CustomUser(
            username=validated_data['username'],
            email=validated_data['email'],
            phone_number=validated_data.get('phone_number', ''),
            is_superuser=validated_data.get('is_superuser', False)
        )
        user.set_password(validated_data['password'])  # Asegúrate de encriptar la contraseña
        user.save()
        return user

class CitasSerializer(serializers.ModelSerializer):
    class Meta:
        model = Citas
        fields = ['id', 'Usuario', 'Fecha', 'Servicio', 'Nombre_mascota']

class MascotaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Mascota
        fields = ['id', 'nombre', 'raza', 'edad', 'tipo', 'propietario']