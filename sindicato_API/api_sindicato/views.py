#from django.shortcuts import render

from django.http.response import JsonResponse
from django.utils.decorators import method_decorator
from django.views import View
from django.views.decorators.csrf import csrf_exempt
import json
#from rest_framework.generics import GenericAPIView

from .models import *

# Create your views here.

#CRUD Secciones sindicales
class SeccionView(View):

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request, id=0):

        if(id>0):

            secciones=list(SeccionSindical.objects.filter(id=id).values())

            if len(secciones) > 0:
                seccion=secciones[0]
                datos = {'message': "Exito", 'secciones': seccion}
            else:
                datos={'message':"Seccion no encontrada"}
            return JsonResponse(datos)

        else:
            secciones=list(SeccionSindical.objects.values())
            if len(secciones)>0:
                datos={'message':"Exito", 'secciones': secciones}
            else:
                datos={'message':"Secciones no encontradas"}

            return JsonResponse(datos)

    def post(self, request):
        #print(request.body)
        jd=json.loads(request.body)
        #print(jd)
        SeccionSindical.objects.create(nombre=jd['nombre'])
        datos = {'message': "Exito"}
        return JsonResponse(datos)


    def put(self, request, id):
        jd = json.loads(request.body)
        secciones = list(SeccionSindical.objects.filter(id=id).values())
        if len(secciones) > 0:
            seccion=SeccionSindical.objects.get(id=id)
            seccion.nombre = jd['nombre']
            seccion.save()
            datos = {'message': "Exito"}
        else:
            datos = {'message': "Seccion no encontrada"}
        return JsonResponse(datos)


    def delete(self, request, id):
        secciones = list(SeccionSindical.objects.filter(id=id).values())
        if len(secciones) > 0:
            SeccionSindical.objects.filter(id=id).delete()
            datos = {'message': "Exito"}
        else:
            datos = {'message': "Seccion no encontrada"}
        return JsonResponse(datos)

#CRUD Area Laboral
class AreaView(View):

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request, id=0):
        if(id>0):
            areas=list(AreaLaboral.objects.filter(id=id).values())
            if len(areas) > 0:
                area=areas[0]
                datos = {'message': "Exito", 'areas': area}
            else:
                datos={'message':"Area Laboral no encontrada"}
            return JsonResponse(datos)
        else:
            areas=list(AreaLaboral.objects.values())
            if len(areas)>0:
                datos={'message':"Exito", 'areas': areas}
            else:
                datos={'message':"Areas Laborales no encontradas"}

            return JsonResponse(datos)

    def post(self, request):
        #print(request.body)
        jd=json.loads(request.body)
        #print(jd)
        AreaLaboral.objects.create(nombre=jd['nombre'])
        datos = {'message': "Exito"}
        return JsonResponse(datos)


    def put(self, request, id):
        jd = json.loads(request.body)
        areas = list(AreaLaboral.objects.filter(id=id).values())
        if len(areas) > 0:
            area=AreaLaboral.objects.get(id=id)
            area.nombre = jd['nombre']
            area.save()
            datos = {'message': "Exito"}
        else:
            datos = {'message': "Area Laboral no encontrada"}
        return JsonResponse(datos)


    def delete(self, request, id):
        areas = list(AreaLaboral.objects.filter(id=id).values())
        if len(areas) > 0:
            AreaLaboral.objects.filter(id=id).delete()
            datos = {'message': "Exito"}
        else:
            datos = {'message': "Area Laboral no encontrada"}
        return JsonResponse(datos)


# CRUD Trabajador
class TrabajadorView(View):

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

# Funcion para obtener trabajadores
"""Si id = 0 devuelve todos los trabajadores, si id > 0 entonces va a devolver el trabajador con 
id igual al valor que se le pasa por parametros"""

    def get_trabajadores(self, request, id=0):
        if(id>0):
            trabajadores=list(Trabajador.objects.filter(id=id).values())
            if len(trabajadores) > 0:
                trabajador=trabajadores[0]
                datos = {'message': "Exito", 'trabajadores': trabajador}
            else:
                datos={'message':"Trabajador no encontrado"}
            return JsonResponse(datos)
        else:
            trabajadores=list(Trabajador.objects.values())
            if len(trabajadores)>0:
                datos={'message':"Exito", 'trabajadores': trabajadores}
            else:
                datos={'message':"Trabajadores no encontrados"}

            return JsonResponse(datos)

# Funcion para añadir trabajadores
    def post_trabajadores(self, request):
        #print(request.body)
        jd=json.loads(request.body)
        print(jd)
        area=AreaLaboral.objects.get(id=jd['area_laboral_id'])
        Trabajador.objects.create(nombre=jd['nombre'], carnet_ID=jd['carnet_ID'], correo=jd['correo'], salario=jd['salario'], area_laboral=area)
        datos = {'message': "Exito"}
        return JsonResponse(datos)

# Funcion para modificar trabajadores
    def put(self, request, id):
        jd = json.loads(request.body)
        trabajadores = list(Trabajador.objects.filter(id=id).values())
        if len(trabajadores) > 0:
            trabajador=Trabajador.objects.get(id=id)
            area = AreaLaboral.objects.get(id=jd['area_laboral_id'])
            trabajador.nombre = jd['nombre']
            trabajador.carnet_ID = jd['carnet_ID']
            trabajador.correo = jd['correo']
            trabajador.salario = jd['salario']
            trabajador.area_laboral = area
            trabajador.save()
            datos = {'message': "Exito"}
        else:
            datos = {'message': "Trabajador no encontrado"}
        return JsonResponse(datos)

# Funcion para eliminar trabajadores
    def delete(self, request, id):
        trabajadores = list(Trabajador.objects.filter(id=id).values())
        if len(trabajadores) > 0:
            Trabajador.objects.filter(id=id).delete()
            datos = {'message': "Exito"}
        else:
            datos = {'message': "Trabajador no encontrado"}
        return JsonResponse(datos)

#CRUD Cargo
class CargoView(View):

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request, id=0):
        if(id>0):
            cargos=list(Cargo.objects.filter(id=id).values())
            if len(cargos) > 0:
                cargo=cargos[0]
                datos = {'message': "Exito", 'areas': cargo}
            else:
                datos={'message':"Cargo no encontrado"}
            return JsonResponse(datos)
        else:
            cargos=list(Cargo.objects.values())
            if len(cargos)>0:
                datos={'message':"Exito", 'areas': cargos}
            else:
                datos={'message':"Areas Laborales no encontradas"}

            return JsonResponse(datos)

    def post(self, request):
        #print(request.body)
        jd=json.loads(request.body)
        #print(jd)
        Cargo.objects.create(nombre=jd['nombre'])
        datos = {'message': "Exito"}
        return JsonResponse(datos)


    def put(self, request, id):
        jd = json.loads(request.body)
        cargos = list(Cargo.objects.filter(id=id).values())
        if len(cargos) > 0:
            cargo=Cargo.objects.get(id=id)
            cargo.nombre = jd['nombre']
            cargo.save()
            datos = {'message': "Exito"}
        else:
            datos = {'message': "Cargo no encontrado"}
        return JsonResponse(datos)


    def delete(self, request, id):
        cargos = list(Cargo.objects.filter(id=id).values())
        if len(cargos) > 0:
            Cargo.objects.filter(id=id).delete()
            datos = {'message': "Exito"}
        else:
            datos = {'message': "Cargo no encontrado"}
        return JsonResponse(datos)


#CRUD Compromiso Afiliacion
class CompromisoAfiliacionView(View):

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request, id=0):
        if(id>0):
            trabajadores_afiliados=list(CompromisoAfiliacion.objects.filter(id=id).values())
            if len(trabajadores_afiliados) > 0:
                trabajador_afiliado=trabajadores_afiliados[0]
                datos = {'message': "Exito", 'trabajadores afiliados': trabajador_afiliado}
            else:
                datos={'message':"Trabajador afiliado no encontrado"}
            return JsonResponse(datos)
        else:
            trabajadores_afiliados=list(CompromisoAfiliacion.objects.values())
            if len(trabajadores_afiliados)>0:
                datos={'message':"Exito", 'trabajadores afiliados': trabajadores_afiliados}
            else:
                datos={'message':"Trabajadores afiliados no encontrados"}

            return JsonResponse(datos)

    def post(self, request):
        #print(request.body)
        jd=json.loads(request.body)
        print(jd)
        trabajador = Trabajador.objects.get(id=jd['id_trabajador_comprometido'])
        seccion=SeccionSindical.objects.get(id=jd['id_seccion_sindical'])
        cargo = Cargo.objects.get(id=jd['id_cargo'])
        CompromisoAfiliacion.objects.create(id_trabajador_comprometido=trabajador, id_seccion=seccion, id_cargo=cargo,
                                            es_comprometido=jd['comprometido'], fecha_alta=jd['fecha_alta'], fecha_baja=jd['fecha_baja'],
                                            cuota_sindical=jd['cuota_sindical'], motivo=jd['motivo'], anno=jd['anno'])
        datos = {'message': "Exito"}
        return JsonResponse(datos)

    def put(self, request, id):
        jd = json.loads(request.body)
        trabajadores_afiliados = list(CompromisoAfiliacion.objects.filter(id=id).values())
        if len(trabajadores_afiliados) > 0:
            trabajador_afiliado=CompromisoAfiliacion.objects.get(id=id)

            trabajador = Trabajador.objects.get(id=jd['id_trabajador_comprometido'])
            seccion = SeccionSindical.objects.get(id=jd['id_seccion_sindical'])
            cargo = Cargo.objects.get(id=jd['id_cargo'])

            trabajador_afiliado.id_trabajador_comprometido = trabajador
            trabajador_afiliado.id_seccion = seccion
            trabajador_afiliado.id_cargo = cargo

            trabajador_afiliado.es_comprometido = jd['comprometido']
            trabajador_afiliado.fecha_alta = jd['fecha_alta']
            trabajador_afiliado.fecha_baja = jd['fecha_baja']
            trabajador_afiliado.cuota_sindical = jd['cuota_sindical']
            trabajador_afiliado.motivo = jd['motivo']
            trabajador_afiliado.anno = jd['anno']

            trabajador_afiliado.save()
            datos = {'message': "Exito"}
        else:
            datos = {'message': "Trabajador Afiliado no encontrado"}
        return JsonResponse(datos)


    def delete(self, request, id):
        trabajadores_afiliados = list(CompromisoAfiliacion.objects.filter(id=id).values())
        if len(trabajadores_afiliados) > 0:
            CompromisoAfiliacion.objects.filter(id=id).delete()
            datos = {'message': "Exito"}
        else:
            datos = {'message': "Trabajador afiliado no encontrado"}
        return JsonResponse(datos)