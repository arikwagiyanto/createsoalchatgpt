from django.db import models
from django.contrib.auth.models import User

class Mapel(models.Model):
    nama_mapel = models.CharField(max_length=50)

    def __str__(self):
        return self.nama_mapel

class Panitia(models.Model):
    Jk = (
        ('Laki-laki', 'Laki-laki'),
        ('Perempuan', 'Perempuan')
    )

    user = models.OneToOneField(User, null=True, on_delete=models.CASCADE)
    nama_pengguna = models.CharField(max_length=200, blank=True, null=True)
    alamat = models.TextField(blank=True, null=True, verbose_name='Alamat Panitia')
    mapel1 = models.ForeignKey(Mapel, related_name='panitia_mapel1', on_delete=models.CASCADE)
    mapel2 = models.ForeignKey(Mapel, related_name='panitia_mapel2', on_delete=models.CASCADE, blank=True, null=True)
    no_hp = models.CharField(max_length=100, blank=True, null=True)
    email = models.EmailField(max_length=100, blank=True, null=True)
    jenis_kelamin = models.CharField(max_length=10, choices=Jk, blank=True, null=True)

    def __str__(self):
        return self.nama_pengguna

    class Meta:
        verbose_name_plural = "Panitia"


class Guru(models.Model):
    Jk = (
        ('Laki-laki', 'Laki-laki'),
        ('Perempuan', 'Perempuan')
    )

    user = models.OneToOneField(User, null=True, on_delete=models.CASCADE)
    nama_pengguna = models.CharField(max_length=200, blank=True, null=True)
    alamat = models.TextField(blank=True, null=True, verbose_name='Alamat Panitia')
    mapel1 = models.ForeignKey(Mapel, blank=True, null=True, related_name='guru_mapel1', on_delete=models.CASCADE)
    mapel2 = models.ForeignKey(Mapel, related_name='guru_mapel2', on_delete=models.CASCADE, blank=True, null=True)
    no_hp = models.CharField(max_length=100, blank=True, null=True)
    email = models.EmailField(max_length=100, blank=True, null=True)
    jenis_kelamin = models.CharField(max_length=10, choices=Jk, blank=True, null=True)

    def __str__(self):
        return self.nama_pengguna

    class Meta:
        verbose_name_plural = "Guru"

class JadwalJaga(models.Model):
    tanggal = models.DateField()
    file_jadwal = models.FileField()

    def __str__(self):
        return f"{self.tanggal}"
    
class JadwalUjian(models.Model):
    tanggal = models.DateField()
    file_jadwal = models.FileField()

    def __str__(self):
        return f"{self.tanggal}"

class Soal_pg(models.Model):
    id_pg = models.AutoField(primary_key=True)
    mapel = models.ForeignKey(Mapel, on_delete=models.CASCADE)
    kelas = models.CharField(max_length=100)
    jurusan_rpl = models.BooleanField(default=False)
    jurusan_tkr = models.BooleanField(default=False)
    soal_pg = models.TextField(blank=True, null=True)
    pilihan_a = models.TextField()
    pilihan_b = models.TextField()
    pilihan_c = models.TextField()
    pilihan_d = models.TextField()
    pilihan_e = models.TextField()
    jawaban = models.CharField(max_length=1)
    nomor_soal = models.IntegerField(blank=True, null=True)
    pengguna = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True)
    
    def __str__(self):
        return f"Soal {self.id_pg} - {self.mapel.nama_mapel}"

def get_default_mapel():
    return Mapel.objects.first().id

class SoalEsai(models.Model):
    soal_esai = models.CharField(max_length=255)
    jawaban_esai = models.TextField()
    mapel = models.ForeignKey(Mapel, on_delete=models.CASCADE, default=get_default_mapel)
    kelas = models.CharField(blank=True, null=True, max_length=100)
    jurusan_rpl = models.BooleanField(default=False)
    jurusan_tkr = models.BooleanField(default=False)
    pengguna = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True)
    nomor_soal = models.IntegerField(blank=True, null=True)

    def __str__(self):
        return f"Soal Esai {self.id}"
