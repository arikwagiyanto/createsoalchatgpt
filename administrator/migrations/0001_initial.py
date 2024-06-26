# Generated by Django 5.0.6 on 2024-06-05 03:40

import administrator.models
import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='JadwalJaga',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tanggal', models.DateField()),
                ('file_jadwal', models.FileField(upload_to='')),
            ],
        ),
        migrations.CreateModel(
            name='JadwalUjian',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tanggal', models.DateField()),
                ('file_jadwal', models.FileField(upload_to='')),
            ],
        ),
        migrations.CreateModel(
            name='Mapel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nama_mapel', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Guru',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nama_pengguna', models.CharField(blank=True, max_length=200, null=True)),
                ('alamat', models.TextField(blank=True, null=True, verbose_name='Alamat Guru')),
                ('no_hp', models.CharField(blank=True, max_length=100, null=True)),
                ('email', models.EmailField(blank=True, max_length=100, null=True)),
                ('user', models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('mapel', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='administrator.mapel')),
            ],
            options={
                'verbose_name_plural': 'Guru',
            },
        ),
        migrations.CreateModel(
            name='Panitia',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nama_pengguna', models.CharField(blank=True, max_length=200, null=True)),
                ('alamat', models.TextField(blank=True, null=True, verbose_name='Alamat Panitia')),
                ('no_hp', models.CharField(blank=True, max_length=100, null=True)),
                ('email', models.EmailField(blank=True, max_length=100, null=True)),
                ('jenis_kelamin', models.CharField(blank=True, choices=[('Laki-laki', 'Laki-laki'), ('Perempuan', 'Perempuan')], max_length=10, null=True)),
                ('mapel1', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='panitia_mapel1', to='administrator.mapel')),
                ('mapel2', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='panitia_mapel2', to='administrator.mapel')),
                ('user', models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name_plural': 'Panitia',
            },
        ),
        migrations.CreateModel(
            name='Soal_pg',
            fields=[
                ('id_pg', models.AutoField(primary_key=True, serialize=False)),
                ('kelas', models.CharField(max_length=100)),
                ('jurusan', models.CharField(max_length=100)),
                ('soal_pg', models.TextField()),
                ('pilihan_a', models.TextField()),
                ('pilihan_b', models.TextField()),
                ('pilihan_c', models.TextField()),
                ('pilihan_d', models.TextField()),
                ('pilihan_e', models.TextField()),
                ('jawaban', models.CharField(max_length=1)),
                ('mapel', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='administrator.mapel')),
            ],
        ),
        migrations.CreateModel(
            name='SoalEsai',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('soal_esai', models.CharField(max_length=255)),
                ('jawaban_esai', models.TextField()),
                ('mapel', models.ForeignKey(default=administrator.models.get_default_mapel, on_delete=django.db.models.deletion.CASCADE, to='administrator.mapel')),
            ],
        ),
    ]
