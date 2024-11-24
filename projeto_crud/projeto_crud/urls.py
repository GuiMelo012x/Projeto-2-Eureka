from django.contrib import admin
from django.urls import path
from crud.views import pagina_inicial  # Importe a view da página inicial

urlpatterns = [
    path('admin/', admin.site.urls),  # Admin do Django
    path('', pagina_inicial, name='pagina_inicial'),  # Página inicial
]
