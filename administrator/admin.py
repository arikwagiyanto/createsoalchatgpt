# from django.contrib import admin
# from .models import Penjual, Konsumen, Kategori, Barang

# class DataKategoriAdmin(admin.ModelAdmin):
#     list_display = ("nama", "aktif","banner_satu","banner_dua",)
#     prepopulated_fields = {"slug": ("nama",)}
# class DataBarangAdmin(admin.ModelAdmin):
#     list_display = ("nama_barang", "gambar","harga","no_whatsup",)
#     prepopulated_fields = {"slug": ("nama_barang",)} 

# admin.site.register(Barang,DataBarangAdmin) 
# admin.site.register(Kategori,DataKategoriAdmin)
# admin.site.register(Penjual)
# admin.site.register(Konsumen)

from django.contrib import admin
from .models import *

admin.site.register(Guru)
admin.site.register(Mapel)
admin.site.register(JadwalJaga)
admin.site.register(JadwalUjian)
admin.site.register(Panitia)
admin.site.register(DokumenSoal)