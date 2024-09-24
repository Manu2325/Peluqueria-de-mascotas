from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import CustomUserViewSet, CitasViewSet, RegisterView, MascotaViewSet, CurrentUserView

router = DefaultRouter()
router.register(r'users', CustomUserViewSet)  # Ruta para manejar usuarios
router.register(r'Citas', CitasViewSet)  # Ruta para manejar citas
router.register(r'Mascota', MascotaViewSet, basename='Mascota')



urlpatterns = [
    path('', include(router.urls)),  # Incluir las rutas del router
    path('current-user/', CurrentUserView.as_view(), name='current-user'),
]
