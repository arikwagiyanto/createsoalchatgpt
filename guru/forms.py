from django import forms
from administrator.models import Soal_pg

class SoalForm(forms.ModelForm):
    class Meta:
        model = Soal_pg
        fields = ['kelas', 'jurusan', 'soal_pg', 'pilihan_a', 'pilihan_b', 'pilihan_c', 'pilihan_d', 'pilihan_e', 'jawaban']
        labels = {
            'kelas': 'Kelas',
            'jurusan': 'Jurusan',
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
            'jurusan': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan Jurusan'}),
            'soal_pg': forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'Masukkan Pertanyaan'}),
            'pilihan_a': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan Pilihan A'}),
            'pilihan_b': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan Pilihan B'}),
            'pilihan_c': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan Pilihan C'}),
            'pilihan_d': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan Pilihan D'}),
            'pilihan_e': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan Pilihan E'}),
            'jawaban': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan Jawaban Benar'}),
        }
