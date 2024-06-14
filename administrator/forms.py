from django import forms
from django.contrib.auth.models import User
from .models import *


class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['username', 'password']
        widgets = {
            'username': forms.TextInput(attrs={'class': 'form-control'}),
            'password': forms.PasswordInput(attrs={'class': 'form-control'})
        }
        labels = {
            'username': 'Username',
            'password': 'Password',
        }


class PanitiaForm(forms.ModelForm):
    class Meta:
        model = Panitia
        fields = ['nama_pengguna', 'alamat', 'mapel1', 'mapel2', 'no_hp', 'email', 'jenis_kelamin']
        widgets = {
            'nama_pengguna': forms.TextInput(attrs={'class': 'form-control'}),
            'alamat': forms.Textarea(attrs={'class': 'form-control'}),
            'mapel1': forms.Select(attrs={'class': 'form-control'}),
            'mapel2': forms.Select(attrs={'class': 'form-control'}),
            'no_hp': forms.TextInput(attrs={'class': 'form-control'}),
            'email': forms.EmailInput(attrs={'class': 'form-control'}),
            'jenis_kelamin': forms.Select(attrs={'class': 'form-control'})
        }
        labels = {
            'user': 'User',
            'nama_pengguna': 'Nama',
            'alamat': 'Alamat',
            'mapel1': 'Mapel 1',
            'mapel2': 'Mapel 2',
            'no_hp': 'No Hp',
            'email': 'Email',
            'jenis_kelamin': 'Jenis Kelamin',
        }
        

class GuruForm(forms.ModelForm):
    class Meta:
        model = Guru
        fields = ['nama_pengguna', 'alamat', 'mapel1', 'mapel2', 'no_hp', 'email', 'jenis_kelamin']
        widgets = {
            'nama_pengguna': forms.TextInput(attrs={'class': 'form-control'}),
            'alamat': forms.Textarea(attrs={'class': 'form-control'}),
            'mapel1': forms.Select(attrs={'class': 'form-control'}),
            'mapel2': forms.Select(attrs={'class': 'form-control'}),
            'no_hp': forms.TextInput(attrs={'class': 'form-control'}),
            'email': forms.EmailInput(attrs={'class': 'form-control'}),
            'jenis_kelamin': forms.Select(attrs={'class': 'form-control'})
        }
        labels = {
            'user': 'User',
            'nama_pengguna': 'Nama',
            'alamat': 'Alamat',
            'mapel1': 'Mapel 1',
            'mapel2': 'Mapel 2',
            'no_hp': 'No Hp',
            'email': 'Email',
            'jenis_kelamin': 'Jenis Kelamin',
        }