from django.urls import path
from .views import *

urlpatterns=[
    path('secciones/', SeccionView.as_view(), name='lista_secciones'),
    path('secciones/<int:id>', SeccionView.as_view(), name='procesos_secciones'),

    path('areas/', AreaView.as_view(), name='lista_areas'),
    path('areas/<int:id>', AreaView.as_view(), name='procesos_areas'),

    path('trabajadores/', TrabajadorView.as_view(), name='lista_trabajadores'),
    path('trabajadores/<int:id>', TrabajadorView.as_view(), name='procesos_trabajadores'),

    path('cargos/', CargoView.as_view(), name='lista_cargos'),
    path('cargos/<int:id>', CargoView.as_view(), name='procesos_cargos'),

    path('compromisos/', CompromisoAfiliacionView.as_view(), name='lista_compromisos'),
    path('compromisos/<int:id>', CompromisoAfiliacionView.as_view(), name='procesos_compromisos')
]

