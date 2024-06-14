from django.urls import path # type: ignore
from .import views
urlpatterns = [
    path('', views.beranda, name='beranda'),
    path('pengguna/', views.pengguna, name='pengguna'),
    path('cekjadwal/', views.cekjadwal, name='cekjadwal'),
    path('ceksoal/', views.ceksoal, name='ceksoal'),

    path('add_panitia', views.panitia_add, name='panitia_add'),
    path('add_guru', views.guru_add, name='guru_add'),
    
    path('panitia/edit/<int:id>/', views.panitia_edit, name='panitia_edit'),
    path('panitia/delete/<int:id>/', views.panitia_delete, name='panitia_delete'),
    
    path('guru/edit/<int:id>/', views.guru_edit, name='guru_edit'),
    path('guru/delete/<int:id>/', views.guru_delete, name='guru_delete'),
    
    path('jadwal_ujian_admin/', views.jadwal_ujian_admin, name='jadwal_ujian_admin'),
    path('jadwal_jaga_admin/', views.jadwal_jaga_admin, name='jadwal_jaga_admin'),
    
    path('reset_password/<int:user_id>/', views.reset_password, name='reset_password'),
]
