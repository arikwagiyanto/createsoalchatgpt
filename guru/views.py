from django.shortcuts import render, get_object_or_404, redirect # type: ignore
from django.contrib.auth.decorators import login_required
from website.decorators import ijinkan_pengguna
from administrator.models import *
from .forms import UserUpdateForm, PasswordChangeForm
from django.contrib.auth import update_session_auth_hash
from django.contrib import messages
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

@login_required
def user_settings(request):
    if request.method == 'POST':
        user_form = UserUpdateForm(request.POST, instance=request.user)
        password_form = PasswordChangeForm(request.POST)

        if user_form.is_valid() and password_form.is_valid():
            user_form.save()

            old_password = password_form.cleaned_data.get('old_password')
            new_password = password_form.cleaned_data.get('new_password1')
            if request.user.check_password(old_password):
                request.user.set_password(new_password)
                request.user.save()
                update_session_auth_hash(request, request.user)  # Keep the user logged in after password change
                messages.success(request, 'Your profile and password have been updated!')
                return redirect('user_settings')
            else:
                messages.error(request, 'Old password is incorrect')
    else:
        user_form = UserUpdateForm(instance=request.user)
        password_form = PasswordChangeForm()

    context = {
        'user_form': user_form,
        'password_form': password_form,
    }

    return render(request, 'settings.html', context)