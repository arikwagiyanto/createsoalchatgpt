# Panitia/forms.py
from django import forms
from administrator.models import *

class MapelForm(forms.ModelForm):
    class Meta:
        model = Mapel
        fields = ['nama_mapel']
        widgets = {
            'nama_mapel': forms.TextInput(attrs={'class': 'form-control'}),
        }
        labels = {
            'nama_mapel': 'Nama mapel',
        }
        
class JadwalUjianForm(forms.ModelForm):
    class Meta:
        model = JadwalUjian
        fields = ['tanggal', 'file_jadwal']
        widgets = {
            'tanggal': forms.DateInput(attrs={'type': 'date','class': 'form-control'}),
            'file_jadwal': forms.FileInput(attrs={'class': 'form-control'}),
        }
        labels = {
            'tanggal': 'Tanggal',
            'file_jadwal': 'File Jadwal',
        }
        
class JadwalJagaForm(forms.ModelForm):
    class Meta:
        model = JadwalJaga
        fields = ['tanggal', 'file_jadwal']
        widgets = {
            'tanggal': forms.DateInput(attrs={'type': 'date','class': 'form-control'}),
            'file_jadwal': forms.FileInput(attrs={'class': 'form-control'}),
        }
        labels = {
            'tanggal': 'Tanggal',
            'file_jadwal': 'File Jadwal',
        }
        
class UserUpdateForm(forms.ModelForm):
    nama_pengguna = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}), required=False)

    class Meta:
        model = User
        fields = ['username', 'nama_pengguna']
        widgets = {
            'username': forms.TextInput(attrs={'class': 'form-control'}),
        }

    def __init__(self, *args, **kwargs):
        super(UserUpdateForm, self).__init__(*args, **kwargs)
        if self.instance:
            self.fields['nama_pengguna'].initial = self.instance.panitia.nama_pengguna

    def save(self, commit=True):
        user = super(UserUpdateForm, self).save(commit=False)
        user.panitia.nama_pengguna = self.cleaned_data['nama_pengguna']
        if commit:
            user.save()
            user.panitia.save()
        return user

class PasswordChangeForm(forms.Form):
    password_lama = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    password_baru = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    konfirmasi_password = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control'}))

    def clean(self):
        cleaned_data = super().clean()
        password_baru = cleaned_data.get("Password Baru")
        konfirmasi_password = cleaned_data.get("Konfirmasi Password")

        if password_baru and password_baru and password_baru != konfirmasi_password:
            raise forms.ValidationError("Passwords do not match")

        return cleaned_data
