from django.urls import path # type: ignore
from .import views
from .views import jadwal_ujian_guru, jadwal_jaga_guru

urlpatterns = [
    path('', views.beranda_guru, name='beranda_guru'),
    path('lihatjadwal/', views.lihatjadwal, name='lihatjadwal'),
    path('buatsoal/', views.buatsoal, name='buatsoal'),
    
    path('jadwal_ujian_guru/', jadwal_ujian_guru, name='jadwal_ujian_guru'),
    path('jadwal_jaga_guru/', jadwal_jaga_guru, name='jadwal_jaga_guru'),
    
    path('input-soal/<int:pk>', views.input_soal_pg, name='input_soal_pg'),
    
    path('settings/', views.user_settings, name='user_settings'),
]