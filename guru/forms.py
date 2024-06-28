from django import forms
from administrator.models import *

class SoalForm(forms.ModelForm):
    class Meta:
        model = Soal_pg
        fields = ['kelas', 'jurusan_rpl', 'jurusan_tkr', 'soal_pg', 'pilihan_a', 'pilihan_b', 'pilihan_c', 'pilihan_d', 'pilihan_e', 'jawaban']
        labels = {
            'kelas': 'Kelas',
            'jurusan_rpl': 'Jurusan RPL',
            'jurusan_tkr': 'Jurusan TKR',
            'soal_pg': 'Pertanyaan',
            'pilihan_a': 'Pilihan A',
            'pilihan_b': 'Pilihan B',
            'pilihan_c': 'Pilihan C',
            'pilihan_d': 'Pilihan D',
            'pilihan_e': 'Pilihan E',
            'jawaban': 'Jawaban Benar',
        }
        widgets = {
            'kelas': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan Kelas'}),
            'jurusan_rpl': forms.CheckboxInput(attrs={'class': 'form-check-input', 'type': 'checkbox', 'style': 'margin-left:10px; margin-top:7px'}),
            'jurusan_tkr': forms.CheckboxInput(attrs={'class': 'form-check-input', 'type': 'checkbox', 'style': 'margin-left:10px; margin-top:7px'}),
            'soal_pg': forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'Masukkan Pertanyaan'}),
            'pilihan_a': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan Pilihan A'}),
            'pilihan_b': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan Pilihan B'}),
            'pilihan_c': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan Pilihan C'}),
            'pilihan_d': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan Pilihan D'}),
            'pilihan_e': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan Pilihan E'}),
            'jawaban': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan Jawaban Benar'}),
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
            self.fields['nama_pengguna'].initial = self.instance.guru.nama_pengguna

    def save(self, commit=True):
        user = super(UserUpdateForm, self).save(commit=False)
        user.guru.nama_pengguna = self.cleaned_data['nama_pengguna']
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
