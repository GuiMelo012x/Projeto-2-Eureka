# Generated by Django 5.1.3 on 2024-11-24 17:13

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Mesa',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('localizacao', models.CharField(max_length=100)),
                ('numero_mesa', models.IntegerField()),
                ('numero_cadeiras', models.IntegerField()),
                ('status', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Pessoa',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=100)),
                ('sobrenome', models.CharField(max_length=100)),
                ('cpf', models.CharField(max_length=11, unique=True)),
                ('email', models.EmailField(max_length=254)),
                ('telefone', models.CharField(max_length=15)),
                ('endereco', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='Cliente',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pessoa', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='crud.pessoa')),
            ],
        ),
        migrations.CreateModel(
            name='Reserva',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('data_hora', models.DateTimeField()),
                ('cliente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='crud.cliente')),
                ('mesa', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='crud.mesa')),
            ],
        ),
    ]
