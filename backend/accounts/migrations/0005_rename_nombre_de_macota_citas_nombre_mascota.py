# Generated by Django 5.1.1 on 2024-09-21 02:24

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0004_rename_servicio_citas_servicio'),
    ]

    operations = [
        migrations.RenameField(
            model_name='citas',
            old_name='Nombre_de_macota',
            new_name='Nombre_mascota',
        ),
    ]
