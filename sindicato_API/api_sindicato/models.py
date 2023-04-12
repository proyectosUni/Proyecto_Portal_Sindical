from django.db import models

# Create your models here.

class AreaLaboral(models.Model):
    nombre = models.CharField(max_length=100)

class SeccionSindical(models.Model):
    nombre = models.CharField(max_length=100)

class Trabajador(models.Model):
    nombre = models.CharField(max_length=100)
    carnet_ID = models.CharField(max_length=11)
    correo = models.EmailField()
    salario = models.FloatField()
    area_laboral = models.ForeignKey(AreaLaboral, on_delete=models.CASCADE)

class Cargo(models.Model):
    nombre = models.CharField(max_length=100)

class CompromisoAfiliacion(models.Model):
    id_trabajador_comprometido = models.OneToOneField(Trabajador, on_delete=models.CASCADE)
    id_seccion_sindical = models.ForeignKey(SeccionSindical, on_delete=models.CASCADE)
    comprometido = models.BooleanField(default=True)
    fecha_alta = models.DateField()
    fecha_baja = models.DateField()
    cuota_sindical = models.FloatField()
    salario =  models.FloatField()
    motivo = models.CharField(max_length=100, blank=True)
    cargo = models.ForeignKey(Cargo, on_delete=models.CASCADE)


