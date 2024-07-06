from django.shortcuts import render,  get_object_or_404, redirect# type: ignore
from django.contrib.auth.decorators import login_required
from website.decorators import ijinkan_pengguna
from administrator.models import *
from .forms import MapelForm, JadwalUjianForm, JadwalJagaForm, UserUpdateForm, PasswordChangeForm
from django.contrib.auth import update_session_auth_hash
from django.contrib import messages

@login_required(login_url='loginPage')
@ijinkan_pengguna(yang_diizinkan=['panitia'])
def beranda_panitia(request):
    context = {
        'judul': 'Halaman Beranda',
        'menu': 'beranda_panitia',
    }
    return render(request, 'beranda_panitia.html', context)

@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
def kelolajadwal(request):
    context = {
        'judul': 'Halaman kelola jadwal',
        'menu': 'kelolajadwal',
    }
    return render(request, 'jadwaljaga.html', context)

@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
def lihatsoal(request):
    context = {
        'judul': 'Halaman lihat soal',
        'menu': 'lihatsoal',
    }
    return render(request, 'lihatsoal.html', context)

@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
def cetaksoal(request):
    context = {
        'judul': 'Halaman cetak soal',
        'menu': 'cetaksoal',
    }
    return render(request, 'cetaksoal.html', context)


def mapel_list(request):
    mapels = Mapel.objects.all()
    return render(request, 'mapel_list.html', {'mapels': mapels})

def mapel_create(request):
    if request.method == 'POST':
        form = MapelForm(request.POST)
        if form.is_valid():
            nama_mapel = form.cleaned_data['nama_mapel']
            # Simpan data ke dalam tabel administrator_mapel
            mapel = Mapel.objects.create(nama_mapel=nama_mapel)
            return redirect('mapel_list')
    else:
        form = MapelForm()
    return render(request, 'mapel_form.html', {'form': form})

def mapel_update(request, pk):
    mapel = get_object_or_404(Mapel, pk=pk)
    if request.method == "POST":
        form = MapelForm(request.POST, instance=mapel)
        if form.is_valid():
            form.save()
            return redirect('mapel_list')
    else:
        form = MapelForm(instance=mapel)
    return render(request, 'mapel_form.html', {'form': form})

def mapel_delete(request, pk):
    mapel = get_object_or_404(Mapel, pk=pk)
    if request.method == "POST":
        mapel.delete()
        return redirect('mapel_list')
    return render(request, 'mapel_confirm_delete.html', {'mapel': mapel})


#input jadwal ujian
def jadwal_ujian(request):
    jadwal = JadwalUjian.objects.all()
    return render(request, 'jadwal_ujian.html', {'jadwal': jadwal})

def jadwal_ujian_create(request):
    if request.method == 'POST':
        form = JadwalUjianForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('jadwal_ujian')
    else:
        form = JadwalUjianForm()
    return render(request, 'jadwal_ujian_form.html', {'form': form})

def jadwal_ujian_update(request, pk):
    jadwal = get_object_or_404(JadwalUjian, pk=pk)
    if request.method == 'POST':
        form = JadwalUjianForm(request.POST, request.FILES, instance=jadwal)
        if form.is_valid():
            form.save()
            return redirect('jadwal_ujian')
    else:
        form = JadwalUjianForm(instance=jadwal)
    return render(request, 'jadwal_ujian_form.html', {'form': form})

def jadwal_ujian_delete(request, pk):
    jadwal = get_object_or_404(JadwalUjian, pk=pk)
    if request.method == 'POST':
        jadwal.delete()
        return redirect('jadwal_ujian')
    return render(request, 'jadwal_ujian_confirm_delete.html', {'jadwal': jadwal})


#input jadwal ujian
def jadwal_jaga(request):
    jadwal = JadwalJaga.objects.all()
    return render(request, 'jadwal_jaga.html', {'jadwal': jadwal})

def jadwal_jaga_create(request):
    if request.method == 'POST':
        form = JadwalJagaForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('jadwal_jaga')
    else:
        form = JadwalJagaForm()
    return render(request, 'jadwal_jaga_form.html', {'form': form})

def jadwal_jaga_update(request, pk):
    jadwal = get_object_or_404(JadwalJaga, pk=pk)
    if request.method == 'POST':
        form = JadwalJagaForm(request.POST, request.FILES, instance=jadwal)
        if form.is_valid():
            form.save()
            return redirect('jadwal_jaga')
    else:
        form = JadwalJagaForm(instance=jadwal)
    return render(request, 'jadwal_jaga_form.html', {'form': form})

def jadwal_jaga_delete(request, pk):
    jadwal = get_object_or_404(JadwalJaga, pk=pk)
    if request.method == 'POST':
        jadwal.delete()
        return redirect('jadwal_jaga')
    return render(request, 'jadwal_jaga_confirm_delete.html', {'jadwal': jadwal})



@login_required
def panitia_settings(request):
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