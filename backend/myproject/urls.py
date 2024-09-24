"""
URL configuration for myproject project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path, include
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from accounts.views import RegisterView, CitasViewSet, MascotaViewSet, CurrentUserView
from tienda.views import ProductoViewSet

urlpatterns = [
    path('api/register/', RegisterView.as_view(), name='register'),
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('api/citas/', CitasViewSet.as_view({'get': 'list', 'post': 'create'}), name='citas'),  # Agrega esta línea
    path('api/mascota/', MascotaViewSet.as_view({'get': 'list', 'post': 'create'}), name='Mascota'),  # Agrega esta línea
    path('api/productos/', ProductoViewSet.as_view({'get': 'list', 'post': 'create'}), name='productos'),  # Agrega esta línea para productos
    path('api/current-user/', CurrentUserView.as_view(), name='current-user'),
]

