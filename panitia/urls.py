from django.urls import path # type: ignore
from .import views
urlpatterns = [
    path('', views.beranda_panitia, name='beranda_panitia'),
    path('kelolajadwal/', views.kelolajadwal, name='kelolajadwal'),
    path('lihatsoal/', views.lihatsoal, name='lihatsoal'),
    
    #mapel
    path('mapels/', views.mapel_list, name='mapel_list'),
    path('mapels/new/', views.mapel_create, name='mapel_create'),
    path('mapels/<int:pk>/edit/', views.mapel_update, name='mapel_update'),
    path('mapels/<int:pk>/delete/', views.mapel_delete, name='mapel_delete'),
    
    #jadwalujian
    path('jadwal_ujian/', views.jadwal_ujian, name='jadwal_ujian'),
    path('jadwal_ujian/new/', views.jadwal_ujian_create, name='jadwal_ujian_create'),
    path('jadwal_ujian/<int:pk>/edit/', views.jadwal_ujian_update, name='jadwal_ujian_update'),
    path('jadwal_ujian/<int:pk>/delete/', views.jadwal_ujian_delete, name='jadwal_ujian_delete'),
    
    #jadwaljaga
    path('jadwal_jaga/', views.jadwal_jaga, name='jadwal_jaga'),
    path('jadwal_jaga/new/', views.jadwal_jaga_create, name='jadwal_jaga_create'),
    path('jadwal_jaga/<int:pk>/edit/', views.jadwal_jaga_update, name='jadwal_jaga_update'),
    path('jadwal_jaga/<int:pk>/delete/', views.jadwal_jaga_delete, name='jadwal_jaga_delete'),
    
    path('cetak_soal/', views.print_soal, name='soal_cetak'),
    path('cetak_soal/<int:id>', views.print_pdf, name='pdf_cetak'),
    path('settings/', views.panitia_settings, name='panitia_settings'),
]