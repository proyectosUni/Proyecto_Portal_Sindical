# Generated by Django 4.1.7 on 2023-04-12 00:15

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='AreaLaboral',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Cargo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='SeccionSindical',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Trabajador',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100)),
                ('carnet_ID', models.CharField(max_length=11)),
                ('correo', models.EmailField(max_length=254)),
                ('salario', models.FloatField()),
                ('area_laboral', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api_sindicato.arealaboral')),
            ],
        ),
        migrations.CreateModel(
            name='CompromisoAfiliacion',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('comprometido', models.BooleanField(default=True)),
                ('fecha_alta', models.DateField()),
                ('fecha_baja', models.DateField()),
                ('cuota_sindical', models.FloatField()),
                ('salario', models.FloatField()),
                ('motivo', models.CharField(blank=True, max_length=100)),
                ('cargo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api_sindicato.cargo')),
                ('id_seccion_sindical', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api_sindicato.seccionsindical')),
                ('id_trabajador_comprometido', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='api_sindicato.trabajador')),
            ],
        ),
    ]
