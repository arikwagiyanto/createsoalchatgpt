from django.shortcuts import render, get_object_or_404, redirect # type: ignore
from django.contrib.auth.decorators import login_required
from website.decorators import ijinkan_pengguna
from administrator.models import *
from .forms import SoalForm


@login_required(login_url='loginPage')
@ijinkan_pengguna(yang_diizinkan=['guru'])
def beranda_guru(request):
    context = {
        'judul': 'Halaman beranda guru',
        'menu': 'beranda_guru',
    }
    return render(request, 'beranda_guru.html', context)

@ijinkan_pengguna(yang_diizinkan=['guru'])
@login_required(login_url='loginPage')
def lihatjadwal(request):
    context = {
        'judul': 'Halaman lihat jadwal',
        'menu': 'lihatjadwal',
    }
    return render(request, 'lihatjadwal.html', context)

@ijinkan_pengguna(yang_diizinkan=['guru'])
@login_required(login_url='loginPage')
def buatsoal(request):
    context = {
        'judul': 'Halaman buat soal',
        'menu': 'buatsoal',
    }
    return render(request, 'buatsoal.html', context)


#tampilkan jadwal
@ijinkan_pengguna(yang_diizinkan=['guru'])
@login_required(login_url='loginPage')
def jadwal_ujian_guru(request):
    jadwal_ujian = JadwalUjian.objects.all()
    return render(request, 'jadwal_ujian_guru.html', {'jadwal_ujian': jadwal_ujian})

@ijinkan_pengguna(yang_diizinkan=['guru'])
@login_required(login_url='loginPage')
def jadwal_jaga_guru(request):
    jadwal_jaga = JadwalJaga.objects.all()
    return render(request, 'jadwal_jaga_guru.html', {'jadwal_jaga': jadwal_jaga})

@ijinkan_pengguna(yang_diizinkan=['guru'])
@login_required(login_url='loginPage')
def input_soal_pg(request, pk):
    mapel = get_object_or_404(Mapel, id=pk)

    # Cari soal terakhir berdasarkan mapel yang sesuai dengan id mapel (PK)
    last_soal = Soal_pg.objects.filter(mapel=mapel).order_by('nomor_soal').last()
    next_nomor_soal = 1 if not last_soal else last_soal.nomor_soal + 1

    if request.method == 'POST':
        form = SoalForm(request.POST)
        if form.is_valid():
            soal = form.save(commit=False)
            soal.mapel = mapel  # Set the mapel field before saving
            soal.nomor_soal = next_nomor_soal
            soal.save()
            return redirect('input_soal_pg', pk=pk)
    else:
        form = SoalForm()

    return render(request, 'input_soal_pg.html', {'form': form, 'nomor_soal': next_nomor_soal, 'mapel': mapel})
