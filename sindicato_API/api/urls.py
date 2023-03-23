from django.urls import path
from .views import WorkerView

urlpatterns=[
    path('workers/', WorkerView.as_view(), name='workers_list'),
    path('workers/<int:id>', WorkerView.as_view(), name='workers_process')
]