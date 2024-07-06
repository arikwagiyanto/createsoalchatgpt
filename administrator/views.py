from django.shortcuts import render, get_object_or_404, redirect # type: ignore
from django.contrib.auth.decorators import login_required
from website.decorators import ijinkan_pengguna, pilihan_login
from .models import *
from .forms import *
from django.contrib.auth.models import User, Group
from django.contrib import messages
 
@login_required(login_url='loginPage')
@pilihan_login
def beranda(request):
    context = {
        'judul': 'Halaman Beranda',
        'menu': 'beranda',
    }
    return render(request, 'beranda.html', context)

@ijinkan_pengguna(yang_diizinkan=['administrator'])
@login_required(login_url='loginPage')
def pengguna(request):
    data_panitia = Panitia.objects.all()
    data_guru = Guru.objects.all()
    ar = {
        'panitia':data_panitia,
        'guru':data_guru
    }
    return render(request, 'pengguna.html', ar)

@ijinkan_pengguna(yang_diizinkan=['administrator'])
@login_required(login_url='loginPage')
def panitia_add(request):
    user_form = UserForm()
    panitia_form = PanitiaForm()

    if request.method == "POST":
        user_form = UserForm(request.POST)
        panitia_form = PanitiaForm(request.POST, request.FILES)
        
        if user_form.is_valid() and panitia_form.is_valid():
            user = user_form.save(commit=False)
            user.set_password(user_form.cleaned_data['password'])
            user.save()
            # Add user to Panitia group
            panitia_group, created = Group.objects.get_or_create(name='Panitia')
            user.groups.add(panitia_group)
            # Save Panitia data
            panitia = panitia_form.save(commit=False)
            panitia.user = user
            panitia.save()
            
            return redirect("pengguna")

    context = {
        'judul': 'Halaman Tambah',
        'menu': 'panitia_add',
        'user_form': user_form,
        'panitia_form': panitia_form
    }
    
    return render(request, 'panitia_add.html', context)

@ijinkan_pengguna(yang_diizinkan=['administrator'])
@login_required(login_url='loginPage')
def guru_add(request):
    user_form = UserForm()
    guru_form = GuruForm()

    if request.method == "POST":
        user_form = UserForm(request.POST)
        guru_form = GuruForm(request.POST, request.FILES)
        
        if user_form.is_valid() and guru_form.is_valid():
            user = user_form.save(commit=False)
            user.set_password(user_form.cleaned_data['password'])
            user.save()
            # Add user to Guru group
            guru_group, created = Group.objects.get_or_create(name='Guru')
            user.groups.add(guru_group)
            # Save Guru data
            guru = guru_form.save(commit=False)
            guru.user = user
            guru.save()
            
            return redirect("pengguna")

    context = {
        'judul': 'Halaman Tambah',
        'menu': 'guru_add',
        'user_form': user_form,
        'panitia_form': guru_form
    }
    
    return render(request, 'guru_add.html', context)

#Panitia Edit Delete
@ijinkan_pengguna(yang_diizinkan=['administrator'])
@login_required(login_url='loginPage')
def panitia_edit(request, id):
    panitia = get_object_or_404(Panitia, id=id)
    if request.method == 'POST':
       # user_form = UserForm(request.POST, instance=panitia.user)
        panitia_form = PanitiaForm(request.POST, instance=panitia)
        if panitia_form.is_valid():
           # user_form.save()
            panitia_form.save()
            return redirect('pengguna')  # Update this with the correct URL name
    else:
        #user_form = UserForm(instance=panitia.user)
        panitia_form = PanitiaForm(instance=panitia)

    return render(request, 'panitia_edit.html', {
        #'user_form': user_form,
        'panitia_form': panitia_form,
    })

@ijinkan_pengguna(yang_diizinkan=['administrator'])
@login_required(login_url='loginPage')
def panitia_delete(request, id):
    panitia = get_object_or_404(Panitia, id=id)
    if request.method == 'POST':
        panitia.user.delete()  # Deleting the associated user
        panitia.delete()
        return redirect('pengguna')  # Update this with the correct URL name

    return render(request, 'panitia_confirm_delete.html', {'panitia': panitia})

@ijinkan_pengguna(yang_diizinkan=['administrator'])
@login_required(login_url='loginPage')
def guru_edit(request, id):
    guru = get_object_or_404(Guru, id=id)
    if request.method == 'POST':
        #user_form = UserForm(request.POST, instance=guru.user)
        panitia_form = GuruForm(request.POST, instance=guru)
        if panitia_form.is_valid():
            #user_form.save()
            panitia_form.save()
            return redirect('pengguna')
    else:
        #user_form = UserForm(instance=guru.user)
        panitia_form = GuruForm(instance=guru)
    return render(request, 'guru_edit.html', {
        #'user_form': user_form, 
        'panitia_form': panitia_form
    })

@ijinkan_pengguna(yang_diizinkan=['administrator'])
@login_required(login_url='loginPage')
def guru_delete(request, id):
    guru = get_object_or_404(Guru, id=id)
    if request.method == 'POST':
        guru.user.delete()
        guru.delete()
        return redirect('pengguna')
    return render(request, 'guru_confirm_delete.html', {'guru': guru})

#tampilkan jadwal
@ijinkan_pengguna(yang_diizinkan=['administrator'])
@login_required(login_url='loginPage')
def jadwal_ujian_admin(request):
    jadwal_ujian = JadwalUjian.objects.all()
    return render(request, 'jadwal_ujian_admin.html', {'jadwal_ujian': jadwal_ujian})

@ijinkan_pengguna(yang_diizinkan=['administrator'])
@login_required(login_url='loginPage')
def jadwal_jaga_admin(request):
    jadwal_jaga = JadwalJaga.objects.all()
    return render(request, 'jadwal_jaga_admin.html', {'jadwal_jaga': jadwal_jaga})

@ijinkan_pengguna(yang_diizinkan=['administrator'])
@login_required(login_url='loginPage')
def reset_password(request, user_id):
    if request.method == 'POST':
        user = get_object_or_404(User, id=user_id)
        user.set_password('password123')
        user.save()
        messages.success(request, f'Password untuk {user.username} berhasil direset.')
        return redirect('pengguna')  # Ganti dengan URL yang sesuai setelah reset password
    else:
        return redirect('beranda')  # Ganti dengan URL yang sesuai jika metode bukan POST