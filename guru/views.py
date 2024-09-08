import os
from django.shortcuts import render, get_object_or_404, redirect # type: ignore
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from website.decorators import ijinkan_pengguna
from administrator.models import *
from django.contrib.auth import update_session_auth_hash
from django.contrib import messages
from .forms import *
#generate pdf
from io import BytesIO
from xhtml2pdf import pisa
from django.template.loader import get_template
from django.conf import settings
import openai

@login_required(login_url='loginPage')
@ijinkan_pengguna(yang_diizinkan=['guru'])
def beranda_guru(request):
    context = {
        'judul': 'Halaman beranda guru',
        'menu': 'beranda_guru',
    }
    return render(request, 'beranda_guru.html', context)

def generate_soal_from_chatgpt(prompt):
    openai.api_key = settings.OPENAI_API_KEY
    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[
            {"role": "system", 
             "content": "You are a helpful assistant for creating exam questions."},
            {"role": "user", 
             "content": prompt}
        ],
        max_tokens=150  
    )
    return response.choices[0].message['content'].strip()

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

    if next_nomor_soal > 35:
        messages.info(request, 'Anda telah selesai membuat 35 soal pilihan ganda. Silahkan lanjut membuat soal essai.')
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

    if request.method == 'POST' and 'generate_from_chatgpt' in request.POST:
        prompt = request.POST.get('chatgpt_prompt')
        generated_soal = generate_soal_from_chatgpt(prompt)
        form = SoalForm(initial={
            'soal_pg': generated_soal,
            'kelas': initial_data.get('kelas'),
            'jurusan_rpl': initial_data.get('jurusan_rpl'),
            'jurusan_tkr': initial_data.get('jurusan_tkr')
        })

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
    
    last_soal_pg = Soal_pg.objects.filter(mapel=mapel, pengguna=request.user).order_by('-nomor_soal').first()
    last_soal_esai = SoalEsai.objects.filter(mapel=mapel, pengguna=request.user).order_by('-nomor_soal').first()
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

    if request.method == 'POST' and 'generate_from_chatgpt' in request.POST:
        prompt = request.POST.get('chatgpt_prompt')
        generated_soal = generate_soal_from_chatgpt(prompt)
        form = SoalEsaiForm(initial={
            'soal_esai': generated_soal,
            'kelas': initial_data.get('kelas'),
            'jurusan_rpl': initial_data.get('jurusan_rpl'),
            'jurusan_tkr': initial_data.get('jurusan_tkr')
        })

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
        return uri 

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
        pdf_filename = f"soal_{mapel}_{kelas}_{jurusan}_{request.user.guru.nama_pengguna}.pdf"
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


@ijinkan_pengguna(yang_diizinkan=['guru'])
@login_required(login_url='loginPage')
def user_settings(request):
    if request.method == 'POST':
        user_form = UserUpdateForm(request.POST, instance=request.user)
        password_form = PasswordChangeForm(request.POST)

        if user_form.is_valid() and password_form.is_valid():
            new_password = password_form.cleaned_data.get('password_baru')
            if request.user.check_password(password_form.cleaned_data.get('password_lama')):
                user_form.save()
                request.user.set_password(new_password)
                request.user.save()
                update_session_auth_hash(request, request.user)
                messages.success(request, 'Your profile and password have been updated!')
                return redirect('beranda_guru')  
            else:
                password_form.add_error('password_lama', 'Old password is incorrect')
        else:
            messages.error(request, 'Please correct the error below.')
    else:
        user_form = UserUpdateForm(instance=request.user)
        password_form = PasswordChangeForm()

    return render(request, 'settings.html', {'user_form': user_form, 'password_form': password_form})