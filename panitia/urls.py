from django.urls import path # type: ignore
from .import views
urlpatterns = [
    path('', views.beranda_panitia, name='beranda_panitia'),
    path('buatsoal_panitia/', views.buatsoal_panitia, name='buatsoal_panitia'),
    path('settings/', views.panitia_settings, name='panitia_settings'),
    
    #mapel
    path('mapels/', views.mapel_list, name='mapel_list'),
    path('mapels/new/', views.mapel_create, name='mapel_create'),
    path('mapels/<int:pk>/edit/', views.mapel_update, name='mapel_update'),
    path('mapels/<int:pk>/delete/', views.mapel_delete, name='mapel_delete'),
    
    #jadwalujian dan jadwaljaga
    path('jadwal_ujian/', views.jadwal_ujian, name='jadwal_ujian'),
    path('jadwal_ujian/new/', views.jadwal_ujian_create, name='jadwal_ujian_create'),
    path('jadwal_ujian/<int:pk>/edit/', views.jadwal_ujian_update, name='jadwal_ujian_update'),
    path('jadwal_ujian/<int:pk>/delete/', views.jadwal_ujian_delete, name='jadwal_ujian_delete'),

    path('jadwal_jaga/', views.jadwal_jaga, name='jadwal_jaga'),
    path('jadwal_jaga/new/', views.jadwal_jaga_create, name='jadwal_jaga_create'),
    path('jadwal_jaga/<int:pk>/edit/', views.jadwal_jaga_update, name='jadwal_jaga_update'),
    path('jadwal_jaga/<int:pk>/delete/', views.jadwal_jaga_delete, name='jadwal_jaga_delete'),
    
    #Cetak soal
    path('cetak_soal/', views.print_soal, name='soal_cetak'),
    path('cetak_soal/<int:id>', views.print_pdf, name='pdf_cetak'),
    
    #Panitia Input Soal
    path('panitia_soal/<int:pk>', views.panitia_soal_pg, name='panitia_soal_pg'),
    path('panitia_soal_essai/<int:pk>/', views.panitia_soal_essai, name='panitia_soal_essai'),
    path('cek-hasil-soal-panitia/<int:pk>/', views.cek_hasil_soal_panitia, name='cek_hasil_soal_panitia'),
    path('buat-dokumen-soal-panitia/<int:pk>/', views.generate_dokumen_panitia, name='buat_dokumen_panitia'),
]