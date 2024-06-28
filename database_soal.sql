-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Jun 2024 pada 15.24
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_soal`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `administrator_guru`
--

CREATE TABLE `administrator_guru` (
  `id` bigint(20) NOT NULL,
  `nama_pengguna` varchar(200) DEFAULT NULL,
  `alamat` longtext DEFAULT NULL,
  `no_hp` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL,
  `mapel1_id` bigint(20) DEFAULT NULL,
  `mapel2_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `administrator_guru`
--

INSERT INTO `administrator_guru` (`id`, `nama_pengguna`, `alamat`, `no_hp`, `email`, `user_id`, `jenis_kelamin`, `mapel1_id`, `mapel2_id`) VALUES
(1, 'Guru Satu', 'Jalan Guru Satu', '0989', 'gu@gmail.com', 3, 'Perempuan', 2, NULL),
(6, 'Guru Dua', 'Jalan Guru Dua', '98765555', 'guru2@gmail.com', 14, 'Perempuan', 3, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `administrator_jadwaljaga`
--

CREATE TABLE `administrator_jadwaljaga` (
  `id` bigint(20) NOT NULL,
  `tanggal` date NOT NULL,
  `file_jadwal` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `administrator_jadwaljaga`
--

INSERT INTO `administrator_jadwaljaga` (`id`, `tanggal`, `file_jadwal`) VALUES
(1, '2024-06-10', 'JADWAL_UJIAN_DAN_PENGAWAS_USP__PAT_Xc9WInm.pdf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `administrator_jadwalujian`
--

CREATE TABLE `administrator_jadwalujian` (
  `id` bigint(20) NOT NULL,
  `tanggal` date NOT NULL,
  `file_jadwal` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `administrator_jadwalujian`
--

INSERT INTO `administrator_jadwalujian` (`id`, `tanggal`, `file_jadwal`) VALUES
(1, '2024-06-11', 'JADWAL_UJIAN_USP__PAT_Pk3WaUo.pdf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `administrator_mapel`
--

CREATE TABLE `administrator_mapel` (
  `id` bigint(20) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `administrator_mapel`
--

INSERT INTO `administrator_mapel` (`id`, `nama_mapel`) VALUES
(1, 'BAHASA DAERAH'),
(2, 'INFORMATIKA'),
(3, 'SEJARAH');

-- --------------------------------------------------------

--
-- Struktur dari tabel `administrator_panitia`
--

CREATE TABLE `administrator_panitia` (
  `id` bigint(20) NOT NULL,
  `nama_pengguna` varchar(200) DEFAULT NULL,
  `alamat` longtext DEFAULT NULL,
  `no_hp` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL,
  `mapel1_id` bigint(20) NOT NULL,
  `mapel2_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `administrator_panitia`
--

INSERT INTO `administrator_panitia` (`id`, `nama_pengguna`, `alamat`, `no_hp`, `email`, `jenis_kelamin`, `mapel1_id`, `mapel2_id`, `user_id`) VALUES
(1, 'Panitia Satu', 'jalan Panitia 1', '09887', 'pn@gmail.com', 'Laki-laki', 2, NULL, 2),
(7, 'Panitia Dua', 'Jalan Panitia Dua', '0863', 'pn2@gmail.com', 'Perempuan', 2, 1, 13),
(8, 'Coba', 'Cobacoba', '08756', 'coba@gmail.com', 'Laki-laki', 2, 3, 15);

-- --------------------------------------------------------

--
-- Struktur dari tabel `administrator_soalesai`
--

CREATE TABLE `administrator_soalesai` (
  `id` bigint(20) NOT NULL,
  `soal_esai` varchar(255) NOT NULL,
  `jawaban_esai` longtext NOT NULL,
  `mapel_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `administrator_soal_pg`
--

CREATE TABLE `administrator_soal_pg` (
  `id_pg` int(11) NOT NULL,
  `kelas` varchar(100) NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  `soal_pg` longtext NOT NULL,
  `pilihan_a` longtext NOT NULL,
  `pilihan_b` longtext NOT NULL,
  `pilihan_c` longtext NOT NULL,
  `pilihan_d` longtext NOT NULL,
  `pilihan_e` longtext NOT NULL,
  `jawaban` varchar(1) NOT NULL,
  `mapel_id` bigint(20) NOT NULL,
  `nomor_soal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `administrator_soal_pg`
--

INSERT INTO `administrator_soal_pg` (`id_pg`, `kelas`, `jurusan`, `soal_pg`, `pilihan_a`, `pilihan_b`, `pilihan_c`, `pilihan_d`, `pilihan_e`, `jawaban`, `mapel_id`, `nomor_soal`) VALUES
(1, 'X', 'RPL', 'Tag html apa yang digunakan untuk membuat paragraf', 'p', 'b', 'th', 'br', 'a', 'a', 3, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'administrator'),
(3, 'guru'),
(2, 'panitia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 1, 33),
(34, 1, 34),
(35, 1, 35),
(36, 1, 36),
(37, 1, 37),
(38, 1, 38),
(39, 1, 39),
(40, 1, 40),
(41, 1, 41),
(42, 1, 42),
(43, 1, 43),
(44, 1, 44),
(45, 1, 45),
(46, 1, 46),
(47, 1, 47),
(48, 1, 48),
(49, 1, 49),
(50, 1, 50),
(51, 1, 51),
(52, 1, 52),
(53, 1, 53),
(54, 1, 54),
(55, 1, 55),
(56, 1, 56);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can view permission', 1, 'view_permission'),
(5, 'Can add group', 2, 'add_group'),
(6, 'Can change group', 2, 'change_group'),
(7, 'Can delete group', 2, 'delete_group'),
(8, 'Can view group', 2, 'view_group'),
(9, 'Can add user', 3, 'add_user'),
(10, 'Can change user', 3, 'change_user'),
(11, 'Can delete user', 3, 'delete_user'),
(12, 'Can view user', 3, 'view_user'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add jadwal jaga', 5, 'add_jadwaljaga'),
(18, 'Can change jadwal jaga', 5, 'change_jadwaljaga'),
(19, 'Can delete jadwal jaga', 5, 'delete_jadwaljaga'),
(20, 'Can view jadwal jaga', 5, 'view_jadwaljaga'),
(21, 'Can add jadwal ujian', 6, 'add_jadwalujian'),
(22, 'Can change jadwal ujian', 6, 'change_jadwalujian'),
(23, 'Can delete jadwal ujian', 6, 'delete_jadwalujian'),
(24, 'Can view jadwal ujian', 6, 'view_jadwalujian'),
(25, 'Can add mapel', 7, 'add_mapel'),
(26, 'Can change mapel', 7, 'change_mapel'),
(27, 'Can delete mapel', 7, 'delete_mapel'),
(28, 'Can view mapel', 7, 'view_mapel'),
(29, 'Can add guru', 8, 'add_guru'),
(30, 'Can change guru', 8, 'change_guru'),
(31, 'Can delete guru', 8, 'delete_guru'),
(32, 'Can view guru', 8, 'view_guru'),
(33, 'Can add panitia', 9, 'add_panitia'),
(34, 'Can change panitia', 9, 'change_panitia'),
(35, 'Can delete panitia', 9, 'delete_panitia'),
(36, 'Can view panitia', 9, 'view_panitia'),
(37, 'Can add soal_pg', 10, 'add_soal_pg'),
(38, 'Can change soal_pg', 10, 'change_soal_pg'),
(39, 'Can delete soal_pg', 10, 'delete_soal_pg'),
(40, 'Can view soal_pg', 10, 'view_soal_pg'),
(41, 'Can add soal esai', 11, 'add_soalesai'),
(42, 'Can change soal esai', 11, 'change_soalesai'),
(43, 'Can delete soal esai', 11, 'delete_soalesai'),
(44, 'Can view soal esai', 11, 'view_soalesai'),
(45, 'Can add log entry', 12, 'add_logentry'),
(46, 'Can change log entry', 12, 'change_logentry'),
(47, 'Can delete log entry', 12, 'delete_logentry'),
(48, 'Can view log entry', 12, 'view_logentry'),
(49, 'Can add session', 13, 'add_session'),
(50, 'Can change session', 13, 'change_session'),
(51, 'Can delete session', 13, 'delete_session'),
(52, 'Can view session', 13, 'view_session'),
(53, 'Can add mapel', 14, 'add_mapel'),
(54, 'Can change mapel', 14, 'change_mapel'),
(55, 'Can delete mapel', 14, 'delete_mapel'),
(56, 'Can view mapel', 14, 'view_mapel');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$AR36T1T9aD3HRFsb25aAhd$WhsNyrhzCc0f7sljz0wXJDRPflXaT39yuuSkJLdHpzE=', '2024-06-14 07:01:54.203627', 1, 'ardesign', '', '', 'ar@gmail.com', 1, 1, '2024-06-05 03:46:59.000000'),
(2, 'pbkdf2_sha256$720000$QywzvFh4q5n3KrqCaQasAP$rSY+Q5l/dnghXwkr4bTlxdlWgZJeIzOKVanEV05nIBs=', '2024-06-14 06:58:26.547083', 0, 'panitia', '', '', '', 0, 1, '2024-06-05 03:52:15.829981'),
(3, 'pbkdf2_sha256$720000$BHl9zip7OYU01uRdl4La31$+iKvAYnzApcXUp1XkZaB2TTc9YZB6NWS0FPsHHrQcVg=', '2024-06-14 07:05:16.224789', 0, 'guru', '', '', '', 0, 1, '2024-06-05 04:27:25.235571'),
(4, 'pbkdf2_sha256$720000$f7AZA6yodbI8tjF55cf5DA$RyeRXrnutXI44vlCwfpahZ9w+x7BtVP0F3a1iTnkdgQ=', NULL, 0, 'guru2', '', '', '', 0, 1, '2024-06-05 04:27:54.884211'),
(5, 'pbkdf2_sha256$720000$kL2NUMBorUdC01haNG35sF$WbdlMRe6rMpezRN6a6AeeYid6pDuwQ4n3uoRns0l+Nk=', NULL, 0, 'panitia2', '', '', '', 0, 1, '2024-06-09 17:16:41.457523'),
(6, 'pbkdf2_sha256$720000$9JXKbORVsYpCZifKUFlrhq$QSsZgSZkwuCy8xPiqbXMf6//zi/m5twElr/Pky1P0tE=', NULL, 0, 'panitia_2', '', '', '', 0, 1, '2024-06-09 17:23:50.280966'),
(7, 'pbkdf2_sha256$720000$ERhjER71ksLA5tSSoK78GU$rkUXFCHPvcJRB4oLcU+FYQJJfeEWu/XDLmIVTKRlENs=', NULL, 0, 'panitia_3', '', '', '', 0, 1, '2024-06-09 17:29:18.106182'),
(8, 'pbkdf2_sha256$720000$y2eplTCR5ZozJzsH6VqEeB$ymd+cldz82068kJuY9bD9wYtGXsTVXlraKSM8R7+Mho=', NULL, 0, 'panitialagi', '', '', '', 0, 1, '2024-06-09 17:42:45.129333'),
(9, 'pbkdf2_sha256$720000$ab66RmJXLo87wWZ6uGITY5$EeXhJJLdwK6X71FyKLvl0XWe+dtDzQP0zWcHKapCjkg=', NULL, 0, 'guru_2', '', '', '', 0, 1, '2024-06-09 17:44:17.031350'),
(10, 'pbkdf2_sha256$720000$8fnwbNPYZYpc9Y7OYC4gQh$vIqIgx9VUwHL27yAbnWMtNkvPY/wxBXwTwbMrw/TqYs=', NULL, 0, 'guru_3', '', '', '', 0, 1, '2024-06-09 17:46:13.182195'),
(13, 'pbkdf2_sha256$720000$GJDnnxIrlDM014GF7nRFv1$NW3q3MdZSrNuIwC6JKgaw8d7Y6ZsC9jg2ECcyjNX4ms=', '2024-06-13 16:49:23.501772', 0, 'panitia-2', '', '', '', 0, 1, '2024-06-10 15:38:48.718590'),
(14, 'pbkdf2_sha256$720000$fPYXu5YuBRGWcedFLzz9oC$76/sD/qnWt6Rix+0craBUzIcneJ2tXnsS0ZfhCUzXUE=', '2024-06-14 07:03:21.254356', 0, 'guru-2', '', '', '', 0, 1, '2024-06-10 15:39:40.349226'),
(15, 'pbkdf2_sha256$720000$cbYBoOFzju5MoFIBpVYyOv$Exc/30W6r28nHjxdLZy0FPtTEfS8Fm/EHagOWwEW9QQ=', '2024-06-13 16:50:03.132519', 0, 'panitia-coba2', '', '', 'panitiacoba@gmail.com', 0, 1, '2024-06-12 05:09:14.856729');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 3),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2),
(8, 8, 2),
(9, 9, 3),
(10, 10, 3),
(13, 13, 2),
(14, 14, 3),
(15, 15, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-06-05 03:49:28.733139', '1', 'administrator', 1, '[{\"added\": {}}]', 2, 1),
(2, '2024-06-05 03:49:56.773449', '2', 'panitia', 1, '[{\"added\": {}}]', 2, 1),
(3, '2024-06-05 03:50:03.876127', '3', 'guru', 1, '[{\"added\": {}}]', 2, 1),
(4, '2024-06-05 03:50:23.037254', '1', 'ardesign', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 3, 1),
(5, '2024-06-05 03:51:34.911114', '1', 'BAHASA DAERAH', 1, '[{\"added\": {}}]', 7, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(12, 'admin', 'logentry'),
(8, 'administrator', 'guru'),
(5, 'administrator', 'jadwaljaga'),
(6, 'administrator', 'jadwalujian'),
(7, 'administrator', 'mapel'),
(9, 'administrator', 'panitia'),
(11, 'administrator', 'soalesai'),
(10, 'administrator', 'soal_pg'),
(2, 'auth', 'group'),
(1, 'auth', 'permission'),
(3, 'auth', 'user'),
(4, 'contenttypes', 'contenttype'),
(14, 'panitia', 'mapel'),
(13, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-06-05 03:42:52.254128'),
(2, 'auth', '0001_initial', '2024-06-05 03:42:53.504040'),
(3, 'administrator', '0001_initial', '2024-06-05 03:42:54.785200'),
(4, 'admin', '0001_initial', '2024-06-05 03:46:22.606100'),
(5, 'admin', '0002_logentry_remove_auto_add', '2024-06-05 03:46:22.621706'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2024-06-05 03:46:22.637349'),
(7, 'contenttypes', '0002_remove_content_type_name', '2024-06-05 03:46:22.778021'),
(8, 'auth', '0002_alter_permission_name_max_length', '2024-06-05 03:46:22.918559'),
(9, 'auth', '0003_alter_user_email_max_length', '2024-06-05 03:46:22.981059'),
(10, 'auth', '0004_alter_user_username_opts', '2024-06-05 03:46:23.012308'),
(11, 'auth', '0005_alter_user_last_login_null', '2024-06-05 03:46:23.168581'),
(12, 'auth', '0006_require_contenttypes_0002', '2024-06-05 03:46:23.168581'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2024-06-05 03:46:23.199794'),
(14, 'auth', '0008_alter_user_username_max_length', '2024-06-05 03:46:23.246663'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2024-06-05 03:46:23.293540'),
(16, 'auth', '0010_alter_group_name_max_length', '2024-06-05 03:46:23.324858'),
(17, 'auth', '0011_update_proxy_permissions', '2024-06-05 03:46:23.356036'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2024-06-05 03:46:23.387280'),
(19, 'panitia', '0001_initial', '2024-06-05 03:46:23.434189'),
(20, 'sessions', '0001_initial', '2024-06-05 03:46:23.512270'),
(21, 'administrator', '0002_remove_guru_mapel_guru_jenis_kelamin_guru_mapel1_and_more', '2024-06-05 04:12:30.988737');

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9a36nhqm8et46jy40592tfxdn9tjny1f', '.eJxVjMsOwiAQRf-FtSFAebp07zeQGRikaiAp7cr479qkC93ec859sQjbWuM2aIlzZmcmDTv9jgjpQW0n-Q7t1nnqbV1m5LvCDzr4tWd6Xg7376DCqN9aJx_KZLTLITlUGgFcoYwefDG2lGxgSgIEBFUsWgwKvfDOS5IgaFLs_QEuojjN:1sHnet:RqtRD8Hs4tw8aJx6pr_UaankEoaiXexwHHI95dfM4qk', '2024-06-27 16:50:43.343061'),
('dildglyf1erhg74m9q5ois2bbizcr5b4', '.eJxVjDsOwjAQBe_iGln-fyjpOYO167VxADlSnFSIu0OkFNC-mXkvlmBbW9pGWdJE7MwUO_1uCPlR-g7oDv028zz3dZmQ7wo_6ODXmcrzcrh_Bw1G-9YSlNMxyCKQhLLog7Y2GuGiR2Oqr2A0yZC1NRFFjQWthIDOGwGOKLD3B7gFNxs:1sGhKg:oe3zpNb-69g3_48Z-AORk-KeTNT1-kULhe0MfcmIvig', '2024-06-24 15:53:18.161412'),
('nb5har7tzzhaz6d6o7arwyo9lcdj9egr', '.eJxVjDsOwjAQBe_iGln-fyjpOYO167VxADlSnFSIu0OkFNC-mXkvlmBbW9pGWdJE7MwUO_1uCPlR-g7oDv028zz3dZmQ7wo_6ODXmcrzcrh_Bw1G-9YSlNMxyCKQhLLog7Y2GuGiR2Oqr2A0yZC1NRFFjQWthIDOGwGOKLD3B7gFNxs:1sGLxk:5XJvO1eHf7pP3ZLDculgsH0los_Lxy1N6HhQi0fSKh0', '2024-06-23 17:04:12.056439'),
('nmyk7qgvrb4v2ha4k7ltxic9tsrt9n6x', '.eJxVjDsOwjAQBe_iGln-fyjpOYO167VxADlSnFSIu0OkFNC-mXkvlmBbW9pGWdJE7MwUO_1uCPlR-g7oDv028zz3dZmQ7wo_6ODXmcrzcrh_Bw1G-9YSlNMxyCKQhLLog7Y2GuGiR2Oqr2A0yZC1NRFFjQWthIDOGwGOKLD3B7gFNxs:1sHoL8:SPUQFslPkZqFcdpcsfaB5gG9qk6LQ-feAgymcKONVeA', '2024-06-27 17:34:22.710144'),
('qbzvgc1d2u6ry8fpesa4g0t7ve9io1ze', '.eJxVjEEOwiAQRe_C2hApDFCX7nuGZpiZStVAUtqV8e7apAvd_vfef6kRtzWPW5NlnFldlFGn3y0hPaTsgO9YblVTLesyJ70r-qBND5XleT3cv4OMLX_rnkPoDLMJXqxxBtHL5EmgxyTeAVMEQLIGrKN4JsJoHXQOgVOKblLvD-l3OC4:1sHFqY:8ONXv0EVtzO3scVHUidTBC-rZhKfoZMzEvTOtt_tb3g', '2024-06-26 04:44:30.376450'),
('u1aisad8mhodbudkxhnltasc62yvi7eo', '.eJxVjDsOwjAQBe_iGllex5-Ykp4zWOvdNQmgRIqTCnF3iJQC2jcz76UybuuQtyZLHlmdFTh1-h0L0kOmnfAdp9usaZ7WZSx6V_RBm77OLM_L4f4dDNiGbx0ogDUSgayLBWJI4jqT0ApT7CvayJKgFM_WCbHF2nuAzpPnCjEZ9f4A_cc4AQ:1sHHVy:fJ5y5rUS8uPQTwFRULp3AxAKX8RfoLhODWdYyTzBbsE', '2024-06-26 06:31:22.124457'),
('zgzrale2q7vqto5lontbrwsbs8srwr6x', '.eJxVjEEOwiAQRe_C2pACpUxduvcMZKYzSNVAUtqV8e7apAvd_vfef6mI25rj1mSJM6uzcur0uxFODyk74DuWW9VTLesyk94VfdCmr5XleTncv4OMLX_rIZCFJDAATs5RH4iFR4MpJICeg2eklGw3GC_B08hWxCXjIFhhwE69PwNHOK4:1sI0zs:rcpPbOdWuA-LR-W1IFG1ZuO5ledq81P90PEMuVNKvKw', '2024-06-28 07:05:16.230213');

-- --------------------------------------------------------

--
-- Struktur dari tabel `panitia_mapel`
--

CREATE TABLE `panitia_mapel` (
  `id` bigint(20) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `administrator_guru`
--
ALTER TABLE `administrator_guru`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `administrator_guru_mapel1_id_cf290b00_fk_administrator_mapel_id` (`mapel1_id`),
  ADD KEY `administrator_guru_mapel2_id_9378c561_fk_administrator_mapel_id` (`mapel2_id`);

--
-- Indeks untuk tabel `administrator_jadwaljaga`
--
ALTER TABLE `administrator_jadwaljaga`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `administrator_jadwalujian`
--
ALTER TABLE `administrator_jadwalujian`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `administrator_mapel`
--
ALTER TABLE `administrator_mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `administrator_panitia`
--
ALTER TABLE `administrator_panitia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `administrator_paniti_mapel1_id_d6ca13fe_fk_administr` (`mapel1_id`),
  ADD KEY `administrator_paniti_mapel2_id_79848367_fk_administr` (`mapel2_id`);

--
-- Indeks untuk tabel `administrator_soalesai`
--
ALTER TABLE `administrator_soalesai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `administrator_soales_mapel_id_0c7d219f_fk_administr` (`mapel_id`);

--
-- Indeks untuk tabel `administrator_soal_pg`
--
ALTER TABLE `administrator_soal_pg`
  ADD PRIMARY KEY (`id_pg`),
  ADD KEY `administrator_soal_p_mapel_id_56702e9d_fk_administr` (`mapel_id`);

--
-- Indeks untuk tabel `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indeks untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indeks untuk tabel `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indeks untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indeks untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indeks untuk tabel `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indeks untuk tabel `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indeks untuk tabel `panitia_mapel`
--
ALTER TABLE `panitia_mapel`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `administrator_guru`
--
ALTER TABLE `administrator_guru`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `administrator_jadwaljaga`
--
ALTER TABLE `administrator_jadwaljaga`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `administrator_jadwalujian`
--
ALTER TABLE `administrator_jadwalujian`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `administrator_mapel`
--
ALTER TABLE `administrator_mapel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `administrator_panitia`
--
ALTER TABLE `administrator_panitia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `administrator_soalesai`
--
ALTER TABLE `administrator_soalesai`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `administrator_soal_pg`
--
ALTER TABLE `administrator_soal_pg`
  MODIFY `id_pg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `panitia_mapel`
--
ALTER TABLE `panitia_mapel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `administrator_guru`
--
ALTER TABLE `administrator_guru`
  ADD CONSTRAINT `administrator_guru_mapel1_id_cf290b00_fk_administrator_mapel_id` FOREIGN KEY (`mapel1_id`) REFERENCES `administrator_mapel` (`id`),
  ADD CONSTRAINT `administrator_guru_mapel2_id_9378c561_fk_administrator_mapel_id` FOREIGN KEY (`mapel2_id`) REFERENCES `administrator_mapel` (`id`),
  ADD CONSTRAINT `administrator_guru_user_id_271bcdaa_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `administrator_panitia`
--
ALTER TABLE `administrator_panitia`
  ADD CONSTRAINT `administrator_paniti_mapel1_id_d6ca13fe_fk_administr` FOREIGN KEY (`mapel1_id`) REFERENCES `administrator_mapel` (`id`),
  ADD CONSTRAINT `administrator_paniti_mapel2_id_79848367_fk_administr` FOREIGN KEY (`mapel2_id`) REFERENCES `administrator_mapel` (`id`),
  ADD CONSTRAINT `administrator_panitia_user_id_aae18235_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `administrator_soalesai`
--
ALTER TABLE `administrator_soalesai`
  ADD CONSTRAINT `administrator_soales_mapel_id_0c7d219f_fk_administr` FOREIGN KEY (`mapel_id`) REFERENCES `administrator_mapel` (`id`);

--
-- Ketidakleluasaan untuk tabel `administrator_soal_pg`
--
ALTER TABLE `administrator_soal_pg`
  ADD CONSTRAINT `administrator_soal_p_mapel_id_56702e9d_fk_administr` FOREIGN KEY (`mapel_id`) REFERENCES `administrator_mapel` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
