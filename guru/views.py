import os
from django.conf import settings
from django.shortcuts import render, get_object_or_404, redirect # type: ignore
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from website.decorators import ijinkan_pengguna
from administrator.models import *
from django.contrib.auth import update_session_auth_hash
from django.contrib import messages
from .forms import *
from io import BytesIO
from xhtml2pdf import pisa
from django.template.loader import get_template


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
    last_soal = Soal_pg.objects.filter(mapel=mapel, pengguna=request.user).order_by('-nomor_soal').first()
    next_nomor_soal = 1 if not last_soal else last_soal.nomor_soal + 1

    if next_nomor_soal > 10:
        messages.info(request, 'Anda telah selesai membuat 10 soal pilihan ganda. Silahkan lanjut membuat soal essai.')
        return redirect('input_soal_essai', pk=pk)

    initial_data = {}
    if last_soal:
        initial_data.update({
            'kelas': last_soal.kelas,
            'jurusan_rpl': last_soal.jurusan_rpl,
            'jurusan_tkr': last_soal.jurusan_tkr
        })

    if request.method == 'POST':
        form = SoalForm(request.POST, initial=initial_data)
        if form.is_valid():
            soal = form.save(commit=False)
            soal.mapel = mapel
            soal.nomor_soal = next_nomor_soal
            soal.pengguna = request.user
            soal.save()
            return redirect('input_soal_pg', pk=pk)
    else:
        form = SoalForm(initial=initial_data)

    return render(request, 'input_soal_pg.html', {
        'form': form,
        'nomor_soal': next_nomor_soal,
        'mapel': mapel
    })
    

@ijinkan_pengguna(yang_diizinkan=['guru'])
@login_required(login_url='loginPage')
def input_soal_essai(request, pk):
    mapel = get_object_or_404(Mapel, id=pk)
    jumlah_soal_esai = SoalEsai.objects.filter(
        mapel=mapel, pengguna=request.user).count()
    
    # Jika jumlah soal esai sudah mencapai 5, arahkan ke halaman generate dokumen soal
    if jumlah_soal_esai >= 5:
        return redirect('cek_hasil_soal', pk=pk)
    
    last_soal_pg = Soal_pg.objects.filter(
        mapel=mapel, pengguna=request.user).order_by('-nomor_soal').first()
    last_soal_esai = SoalEsai.objects.filter(
        mapel=mapel, pengguna=request.user).order_by('-nomor_soal').first()
    next_nomor_soal = (last_soal_esai.nomor_soal + 1) if last_soal_esai else 1

    initial_data = {'nomor_soal': next_nomor_soal}
    if last_soal_pg:
        initial_data.update({
            'kelas': last_soal_pg.kelas,
            'jurusan_rpl': last_soal_pg.jurusan_rpl,
            'jurusan_tkr': last_soal_pg.jurusan_tkr
        })

    if request.method == 'POST':
        form = SoalEsaiForm(request.POST, initial=initial_data)
        if form.is_valid():
            soal_esai = form.save(commit=False)
            soal_esai.mapel = mapel
            soal_esai.nomor_soal = next_nomor_soal
            soal_esai.pengguna = request.user
            soal_esai.save()
            return redirect('input_soal_essai', pk=pk)
    else:
        form = SoalEsaiForm(initial=initial_data)

    return render(request, 'input_soal_essai.html', {
        'form': form,
        'mapel': mapel,
        'nomor_soal': next_nomor_soal
    })

@ijinkan_pengguna(yang_diizinkan=['guru'])
@login_required(login_url='loginPage')
def cek_hasil_soal(request, pk):
    # Logika untuk generate dokumen soal
    mapel = get_object_or_404(Mapel, id=pk)
    soal_pg = Soal_pg.objects.filter(mapel=mapel, pengguna=request.user)
    soal_esai = SoalEsai.objects.filter(mapel=mapel, pengguna=request.user)
    return render(request, 'generate_dokument_soal.html', {
        'soal_pg': soal_pg,
        'soal_esai': soal_esai,
        'mapel': mapel
    })
    

def render_to_pdf(template_src, context_dict={}):
    template = get_template(template_src)
    html  = template.render(context_dict)
    result = BytesIO()
    pdf = pisa.pisaDocument(BytesIO(html.encode("UTF-8")), result, link_callback=link_callback, encoding='UTF-8')
    if not pdf.err:
        return HttpResponse(result.getvalue(), content_type='application/pdf')
    return None

def link_callback(uri, rel):
    # use short variable names
    s_url = settings.STATIC_URL      # Typically /static/
    s_dirs = settings.STATICFILES_DIRS    # Typically /home/userX/project_static/
    m_url = settings.MEDIA_URL       # Typically /static/media/
    m_root = settings.MEDIA_ROOT     # Typically /home/userX/project_static/media/

    # convert URIs to absolute system paths
    if uri.startswith(m_url):
        path = os.path.join(m_root, uri.replace(m_url, ""))
    elif uri.startswith(s_url):
        path = os.path.join(next(iter(s_dirs)), uri.replace(s_url, ""))
    else:
        return uri  # handle absolute uri (ie: http://some.tld/foo.png)

    # make sure that file exists
    if not os.path.isfile(path):
            raise Exception(
                'media URI must start with %s or %s' % (s_url, m_url)
            )
    return path
    
    
@ijinkan_pengguna(yang_diizinkan=['guru'])
@login_required(login_url='loginPage')
def generate_dokumen(request, pk):
    mapel = get_object_or_404(Mapel, id=pk)
    soal_pg = Soal_pg.objects.filter(mapel=mapel, pengguna=request.user)
    soal_esai = SoalEsai.objects.filter(mapel=mapel, pengguna=request.user)

    if soal_pg.exists():
        kelas = soal_pg.first().kelas
        jurusan_rpl = soal_pg.first().jurusan_rpl
        jurusan_tkr = soal_pg.first().jurusan_tkr
    else:
        kelas = "undefined"
        jurusan_rpl = False
        jurusan_tkr = False

    jurusan = "RPL" if jurusan_rpl else "TKR" if jurusan_tkr else "undefined"

    context = {
        'soal_pg': soal_pg,
        'soal_esai': soal_esai,
        'mapel': mapel
    }

    pdf = render_to_pdf('create_pdf.html', context)

    if pdf:
        # Tentukan path untuk menyimpan file PDF
        pdf_filename = f"soal_{mapel}_{kelas}_{jurusan}_{request.user.username}.pdf"
        pdf_directory = os.path.join('dokumen_soal')

        # Pastikan direktori ada
        os.makedirs(pdf_directory, exist_ok=True)

        # Buat path file PDF
        pdf_filepath = os.path.join(pdf_directory, pdf_filename)

        # Simpan PDF ke dalam filesystem
        with open(pdf_filepath, "wb") as f:
            f.write(pdf.getvalue())

        # Update atau buat dokumen soal
        dokumen_soal, created = DokumenSoal.objects.update_or_create(
            mapel=mapel,
            pengguna=request.user,
            defaults={
                'file_name': pdf_filename,
                'file_path': f'dokumen_soal/{pdf_filename}'
            }
        )

        return redirect('buatsoal')

    return HttpResponse("PDF generation error", status=500)


@login_required
def user_settings(request):
    if request.method == 'POST':
        user_form = UserUpdateForm(request.POST, instance=request.user)
        password_form = PasswordChangeForm(request.POST)

        if user_form.is_valid() and password_form.is_valid():
            new_password = password_form.cleaned_data.get('new_password1')
            if request.user.check_password(password_form.cleaned_data.get('old_password')):
                request.user.set_password(new_password)
                request.user.save()
                update_session_auth_hash(request, request.user)
                messages.success(request, 'Your profile and password have been updated!')
            else:
                password_form.add_error('old_password', 'Old password is incorrect')
        else:
            password_form.add_error(None, 'Form is invalid')
    else:
        user_form = UserUpdateForm(instance=request.user)
        password_form = PasswordChangeForm()

    return render(request, 'settings.html', {'user_form': user_form, 'password_form': password_form})
