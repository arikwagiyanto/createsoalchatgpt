# panitia/models.py
from django.db import models

class Mapel(models.Model):
    nama_mapel = models.CharField(max_length=50)

    def __str__(self):
        return self.nama_mapel
