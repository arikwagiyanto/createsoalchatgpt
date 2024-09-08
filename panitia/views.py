import os
from django.shortcuts import render,  get_object_or_404, redirect# type: ignore
from django.contrib.auth.decorators import login_required
from website.decorators import ijinkan_pengguna
from administrator.models import *
from .forms import *
from django.contrib.auth import update_session_auth_hash
from django.contrib import messages
from django.http import HttpResponse
from django.template.loader import get_template
import openai
from django.conf import settings
from io import BytesIO
from xhtml2pdf import pisa

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
def buatsoal_panitia(request):
    context = {
        'judul': 'Halaman lihat soal',
        'menu': 'lihatsoal',
    }
    return render(request, 'buatsoal_panitia.html', context)

@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
def print_soal(request):
    fileName = DokumenSoal.objects.all()
    processed_soals = []
    for soal in fileName:
        parts = soal.file_name.split('_')
        processed_soals.append({
            'id': soal.id,
            'mapel': parts[1].capitalize(),
            'kelas': parts[2].upper() +' '+ parts[3].upper(),
            'guru': parts[4].capitalize(),
            'filename': soal.file_path
        })
    context = {
        'judul': 'Halaman cetak soal',
        'menu': 'cetaksoal',
        'dokumen': processed_soals
    }
    return render(request, 'cetaksoal.html', context)
@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
def print_pdf(request, id):
    soal = get_object_or_404(DokumenSoal, id=id)
    file_path = soal.file_path

    with open(file_path, 'rb') as pdf:
        response = HttpResponse(pdf.read(), content_type='application/pdf')
        response['Content-Disposition'] = f'inline;filename={soal.file_name}.pdf'
        return response
@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
def mapel_list(request):
    mapels = Mapel.objects.all()
    return render(request, 'mapel_list.html', {'mapels': mapels})

@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
def mapel_create(request):
    if request.method == 'POST':
        form = MapelForm(request.POST)
        if form.is_valid():
            nama_mapel = form.cleaned_data['nama_mapel']
            mapel = Mapel.objects.create(nama_mapel=nama_mapel)
            return redirect('mapel_list')
    else:
        form = MapelForm()
    return render(request, 'mapel_form.html', {'form': form})

@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
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

@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
def mapel_delete(request, pk):
    mapel = get_object_or_404(Mapel, pk=pk)
    if request.method == "POST":
        mapel.delete()
        return redirect('mapel_list')
    return render(request, 'mapel_confirm_delete.html', {'mapel': mapel})


#input jadwal ujian
@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
def jadwal_ujian(request):
    jadwal = JadwalUjian.objects.all()
    return render(request, 'jadwal_ujian.html', {'jadwal': jadwal})

@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
def jadwal_ujian_create(request):
    if request.method == 'POST':
        form = JadwalUjianForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('jadwal_ujian')
    else:
        form = JadwalUjianForm()
    return render(request, 'jadwal_ujian_form.html', {'form': form})

@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
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

@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
def jadwal_ujian_delete(request, pk):
    jadwal = get_object_or_404(JadwalUjian, pk=pk)
    if request.method == 'POST':
        jadwal.delete()
        return redirect('jadwal_ujian')
    return render(request, 'jadwal_ujian_confirm_delete.html', {'jadwal': jadwal})


#input jadwal Jaga
@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
def jadwal_jaga(request):
    jadwal = JadwalJaga.objects.all()
    return render(request, 'jadwal_jaga.html', {'jadwal': jadwal})

@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
def jadwal_jaga_create(request):
    if request.method == 'POST':
        form = JadwalJagaForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('jadwal_jaga')
    else:
        form = JadwalJagaForm()
    return render(request, 'jadwal_jaga_form.html', {'form': form})

@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
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

@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
def jadwal_jaga_delete(request, pk):
    jadwal = get_object_or_404(JadwalJaga, pk=pk)
    if request.method == 'POST':
        jadwal.delete()
        return redirect('jadwal_jaga')
    return render(request, 'jadwal_jaga_confirm_delete.html', {'jadwal': jadwal})


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

@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
def panitia_soal_pg(request, pk):
    mapel = get_object_or_404(Mapel, id=pk)
    last_soal = Soal_pg.objects.filter(mapel=mapel, pengguna=request.user).order_by('-nomor_soal').first()
    next_nomor_soal = 1 if not last_soal else last_soal.nomor_soal + 1

    if next_nomor_soal > 35:
        messages.info(request, 'Anda telah selesai membuat 35 soal pilihan ganda. Silahkan lanjut membuat soal essai.')
        return redirect('panitia_soal_essai', pk=pk)

    initial_data = {}
    if last_soal:
        initial_data.update({
            'kelas': last_soal.kelas,
            'jurusan_rpl': last_soal.jurusan_rpl,
            'jurusan_tkr': last_soal.jurusan_tkr
        })

    if request.method == 'POST':
        form = SoalPgPanitia(request.POST, initial=initial_data)
        if form.is_valid():
            soal = form.save(commit=False)
            soal.mapel = mapel
            soal.nomor_soal = next_nomor_soal
            soal.pengguna = request.user
            soal.save()
            return redirect('panitia_soal_pg', pk=pk)
    else:
        form = SoalPgPanitia(initial=initial_data)

    if request.method == 'POST' and 'generate_from_chatgpt' in request.POST:
        prompt = request.POST.get('chatgpt_prompt')
        generated_soal = generate_soal_from_chatgpt(prompt)
        form = SoalPgPanitia(initial={
            'soal_pg': generated_soal,
            'kelas': initial_data.get('kelas'),
            'jurusan_rpl': initial_data.get('jurusan_rpl'),
            'jurusan_tkr': initial_data.get('jurusan_tkr')
        })

    return render(request, 'soal_pg.html', {
        'form': form,
        'nomor_soal': next_nomor_soal,
        'mapel': mapel
    })
    

@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
def panitia_soal_essai(request, pk):
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
        form = SoalEsaiPanitia(request.POST, initial=initial_data)
        if form.is_valid():
            soal_esai = form.save(commit=False)
            soal_esai.mapel = mapel
            soal_esai.nomor_soal = next_nomor_soal
            soal_esai.pengguna = request.user
            soal_esai.save()
            return redirect('panitia_soal_essai', pk=pk)
    else:
        form = SoalEsaiPanitia(initial=initial_data)

    if request.method == 'POST' and 'generate_from_chatgpt' in request.POST:
        prompt = request.POST.get('chatgpt_prompt')
        generated_soal = generate_soal_from_chatgpt(prompt)
        form = SoalEsaiPanitia(initial={
            'soal_esai': generated_soal,
            'kelas': initial_data.get('kelas'),
            'jurusan_rpl': initial_data.get('jurusan_rpl'),
            'jurusan_tkr': initial_data.get('jurusan_tkr')
        })

    return render(request, 'soal_essai.html', {
        'form': form,
        'mapel': mapel,
        'nomor_soal': next_nomor_soal
    })


@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
def cek_hasil_soal_panitia(request, pk):
    # Logika untuk generate dokumen soal
    mapel = get_object_or_404(Mapel, id=pk)
    soal_pg = Soal_pg.objects.filter(mapel=mapel, pengguna=request.user)
    soal_esai = SoalEsai.objects.filter(mapel=mapel, pengguna=request.user)
    return render(request, 'generate_dokument_soal_panitia.html', {
        'soal_pg': soal_pg,
        'soal_esai': soal_esai,
        'mapel': mapel
    })
    

@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
def render_to_pdf(template_src, context_dict={}):
    template = get_template(template_src)
    html  = template.render(context_dict)
    result = BytesIO()
    pdf = pisa.pisaDocument(BytesIO(html.encode("UTF-8")), result, link_callback=link_callback, encoding='UTF-8')
    if not pdf.err:
        return HttpResponse(result.getvalue(), content_type='application/pdf')
    return None

@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
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
    
    
@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
def generate_dokumen_panitia(request, pk):
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

    pdf = render_to_pdf('create_pdf_panitia.html', context)

    if pdf:
        # Tentukan path untuk menyimpan file PDF
        pdf_filename = f"soal_{mapel}_{kelas}_{jurusan}_{request.user.panitia.nama_pengguna}.pdf"
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


@ijinkan_pengguna(yang_diizinkan=['panitia'])
@login_required(login_url='loginPage')
def panitia_settings(request):
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
                return redirect('beranda_panitia')
            else:
                password_form.add_error('password_lama', 'Old password is incorrect')
        else:
            messages.error(request, 'Please correct the error below.')
    else:
        user_form = UserUpdateForm(instance=request.user)
        password_form = PasswordChangeForm()

    return render(request, 'settings.html', {'user_form': user_form, 'password_form': password_form})

