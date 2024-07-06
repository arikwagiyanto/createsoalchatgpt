-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Jul 2024 pada 05.37
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
-- Database: `soal_chatgpt`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `administrator_dokumensoal`
--

CREATE TABLE `administrator_dokumensoal` (
  `id` bigint(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `mapel_id` bigint(20) NOT NULL,
  `pengguna_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `administrator_dokumensoal`
--

INSERT INTO `administrator_dokumensoal` (`id`, `file_name`, `file_path`, `created_at`, `mapel_id`, `pengguna_id`) VALUES
(22, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-01 22:57:26.791904', 1, 6),
(23, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-01 23:05:53.233779', 1, 6),
(24, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-02 00:42:50.053459', 1, 6),
(25, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-02 01:10:46.615217', 1, 6),
(26, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-02 01:13:35.414921', 1, 6),
(27, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-02 01:16:28.676003', 1, 6),
(28, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-02 01:17:36.807653', 1, 6),
(29, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-06 02:03:02.137427', 1, 6),
(30, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-06 02:11:47.004313', 1, 6),
(31, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-06 02:13:41.469304', 1, 6),
(32, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-06 02:15:33.057101', 1, 6),
(33, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-06 02:24:15.560646', 1, 6),
(34, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-06 02:26:52.220947', 1, 6),
(35, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-06 02:39:54.062910', 1, 6),
(36, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-06 02:45:06.440851', 1, 6),
(37, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-06 02:55:05.633493', 1, 6),
(38, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-06 02:55:11.116437', 1, 6),
(39, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-06 02:59:04.060852', 1, 6),
(40, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-06 03:01:28.454466', 1, 6),
(41, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-06 03:12:09.456643', 1, 6),
(42, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-06 03:14:13.926734', 1, 6),
(43, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-06 03:19:11.434729', 1, 6),
(44, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-06 03:22:12.175448', 1, 6),
(45, 'soal_Bahasa Indonesia_guru2.pdf', 'dokumen_soal/soal_Bahasa Indonesia_guru2.pdf', '2024-07-06 03:22:12.276144', 1, 6);

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
(2, 'Guru Dua', 'jalan gurudua', '08555', 'guru2@gmail.com', 6, 'Laki-laki', 1, 3),
(3, 'Rizky Maulana', 'jalan kemana', '085', 'rm@gmail.com', 7, 'Laki-laki', 4, 2);

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
(1, '2024-07-01', 'JADWAL_UJIAN_DAN_PENGAWAS_USP__PAT_HXXTovW.pdf');

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
(2, '2024-07-01', 'JADWAL_UJIAN_USP__PAT_VdQ3CEw.pdf');

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
(1, 'Bahasa Indonesia'),
(2, 'Sejarah'),
(3, 'Informatika'),
(4, 'IPA');

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
(1, 'Panitia Satu', 'jalan panitia', '085333', 'panitia@gmail.com', 'Laki-laki', 1, 2, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `administrator_soalesai`
--

CREATE TABLE `administrator_soalesai` (
  `id` bigint(20) NOT NULL,
  `soal_esai` varchar(255) NOT NULL,
  `jawaban_esai` longtext NOT NULL,
  `mapel_id` bigint(20) NOT NULL,
  `jurusan_rpl` tinyint(1) NOT NULL,
  `jurusan_tkr` tinyint(1) NOT NULL,
  `kelas` varchar(100) DEFAULT NULL,
  `pengguna_id` int(11) DEFAULT NULL,
  `nomor_soal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `administrator_soalesai`
--

INSERT INTO `administrator_soalesai` (`id`, `soal_esai`, `jawaban_esai`, `mapel_id`, `jurusan_rpl`, `jurusan_tkr`, `kelas`, `pengguna_id`, `nomor_soal`) VALUES
(6, 'sbnd snb', 'sdjfj', 1, 0, 1, 'XIA', 6, 1),
(7, 'sdnjhfb', 'nsdbfb', 1, 0, 1, 'XIA', 6, 2),
(8, 'sncasjb', 'sdnjks', 1, 0, 1, 'XIA', 6, 3),
(9, 'sdncbsab', 'sabdh', 1, 0, 1, 'XIA', 6, 4),
(10, 'sdbcj', 'dsb', 1, 0, 1, 'XIA', 6, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `administrator_soal_pg`
--

CREATE TABLE `administrator_soal_pg` (
  `id_pg` int(11) NOT NULL,
  `kelas` varchar(100) NOT NULL,
  `soal_pg` longtext DEFAULT NULL,
  `pilihan_a` longtext NOT NULL,
  `pilihan_b` longtext NOT NULL,
  `pilihan_c` longtext NOT NULL,
  `pilihan_d` longtext NOT NULL,
  `pilihan_e` longtext NOT NULL,
  `jawaban` varchar(1) NOT NULL,
  `mapel_id` bigint(20) NOT NULL,
  `jurusan_rpl` tinyint(1) NOT NULL,
  `jurusan_tkr` tinyint(1) NOT NULL,
  `nomor_soal` int(11) DEFAULT NULL,
  `pengguna_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `administrator_soal_pg`
--

INSERT INTO `administrator_soal_pg` (`id_pg`, `kelas`, `soal_pg`, `pilihan_a`, `pilihan_b`, `pilihan_c`, `pilihan_d`, `pilihan_e`, `jawaban`, `mapel_id`, `jurusan_rpl`, `jurusan_tkr`, `nomor_soal`, `pengguna_id`) VALUES
(1, 'X', 'kasdl', 'dksaj', 'dsa', 'dksja', 'dasjkl', 'aksldj', 'A', 3, 1, 0, 1, 6),
(13, 'XIA', 'asdaklsndkanskdasndanjk', 'jasdkna', 'akjsndjkasnk', 'kdajsnkdnk', 'asdnjkasndjk', 'afsndjkn', 'A', 1, 0, 1, 1, 6),
(14, 'XIA', 'sdbnjhasdb', 'asdjnas', 'asndksjk', 'asjkdnsn', 'dansdjn', 'fasnjn', 'B', 1, 0, 1, 2, 6),
(15, 'XIA', 'asbdhaj', 'andjkn', 'adjksndjk', 'aknsn', 'anksn', 'aksn', 'C', 1, 0, 1, 3, 6),
(16, 'XIA', 'sajndjh', 'asdnkjn', 'aksndjk', 'dnakj', 'askdn', 'kakq', 'D', 1, 0, 1, 4, 6),
(17, 'XIA', 'smdnj', 'askndjk', 'ajsndk', 'ajkn', 'daksjn', 'dakn', 'E', 1, 0, 1, 5, 6),
(18, 'XIA', 'sjdbjh', 'asjdnjk', 'asdnjk', 'adkjk', 'skdnk', 'jandjk', 'B', 1, 0, 1, 6, 6),
(19, 'XIA', 'sdmbjha', 'sdn', 'skdkq', 'fsk', 'kandq', 'sdk', 'A', 1, 0, 1, 7, 6),
(20, 'XIA', 'sdjhbjsh', 'sjdnj', 'sjdnfjqsjbf', 'sjkfn', 'sjdq', 'sfsf', 'C', 1, 0, 1, 8, 6),
(21, 'XIA', 'sjdjk', 'skdnk', 'skdj', 'dsnk', 'skdnfj', 'B', 'B', 1, 0, 1, 9, 6),
(22, 'XIA', 'sjhdbhjb', 'sdjnj', 'sjdnfj', 'fsdj', 'sjdnb', 'sjhdjh', 'C', 1, 0, 1, 10, 6);

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
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add jadwal jaga', 7, 'add_jadwaljaga'),
(26, 'Can change jadwal jaga', 7, 'change_jadwaljaga'),
(27, 'Can delete jadwal jaga', 7, 'delete_jadwaljaga'),
(28, 'Can view jadwal jaga', 7, 'view_jadwaljaga'),
(29, 'Can add jadwal ujian', 8, 'add_jadwalujian'),
(30, 'Can change jadwal ujian', 8, 'change_jadwalujian'),
(31, 'Can delete jadwal ujian', 8, 'delete_jadwalujian'),
(32, 'Can view jadwal ujian', 8, 'view_jadwalujian'),
(33, 'Can add mapel', 9, 'add_mapel'),
(34, 'Can change mapel', 9, 'change_mapel'),
(35, 'Can delete mapel', 9, 'delete_mapel'),
(36, 'Can view mapel', 9, 'view_mapel'),
(37, 'Can add guru', 10, 'add_guru'),
(38, 'Can change guru', 10, 'change_guru'),
(39, 'Can delete guru', 10, 'delete_guru'),
(40, 'Can view guru', 10, 'view_guru'),
(41, 'Can add panitia', 11, 'add_panitia'),
(42, 'Can change panitia', 11, 'change_panitia'),
(43, 'Can delete panitia', 11, 'delete_panitia'),
(44, 'Can view panitia', 11, 'view_panitia'),
(45, 'Can add soal_pg', 12, 'add_soal_pg'),
(46, 'Can change soal_pg', 12, 'change_soal_pg'),
(47, 'Can delete soal_pg', 12, 'delete_soal_pg'),
(48, 'Can view soal_pg', 12, 'view_soal_pg'),
(49, 'Can add soal esai', 13, 'add_soalesai'),
(50, 'Can change soal esai', 13, 'change_soalesai'),
(51, 'Can delete soal esai', 13, 'delete_soalesai'),
(52, 'Can view soal esai', 13, 'view_soalesai'),
(53, 'Can add mapel', 14, 'add_mapel'),
(54, 'Can change mapel', 14, 'change_mapel'),
(55, 'Can delete mapel', 14, 'delete_mapel'),
(56, 'Can view mapel', 14, 'view_mapel'),
(57, 'Can add dokumen soal', 15, 'add_dokumensoal'),
(58, 'Can change dokumen soal', 15, 'change_dokumensoal'),
(59, 'Can delete dokumen soal', 15, 'delete_dokumensoal'),
(60, 'Can view dokumen soal', 15, 'view_dokumensoal');

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
(1, 'pbkdf2_sha256$720000$dG2G4byj5WgJuPuSkm676z$7N8fG/hKabLdfofRuoa8bud9WW3kKCkhDFPz4OzC09M=', '2024-07-04 17:12:24.586892', 1, 'ardesign', '', '', 'ar@gmail.com', 1, 1, '2024-06-28 02:40:04.000000'),
(4, 'pbkdf2_sha256$720000$R9RcpBOOrH18eRN3mW54i3$QeyS8wLYpODvrOnGpJh/YMuKO/gRaybv3EJj/XnU5aA=', '2024-07-06 03:23:59.978346', 0, 'panitia', '', '', '', 0, 1, '2024-06-28 03:04:56.899567'),
(6, 'pbkdf2_sha256$720000$8mvsAfxnrcFiKMmlE3ohdr$uoyXM1OfotlIFUawdQ+ffL+FEXEacy3dAR8KP7f7xIg=', '2024-07-06 02:01:34.571486', 0, 'guru2', '', '', '', 0, 1, '2024-06-28 03:07:40.405440'),
(7, 'pbkdf2_sha256$720000$ZFwAkeqmoMRqDn8bqdUnFG$ZlGyxnEOQy80MIshBOXGnptd8ya2JyOxh/R0XgVNJiQ=', '2024-07-01 23:16:01.057999', 0, 'rizky', '', '', '', 0, 1, '2024-07-01 23:11:26.873484');

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
(2, 4, 2),
(4, 6, 3),
(5, 7, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
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
(1, '2024-06-28 02:43:52.769573', '1', 'administrator', 1, '[{\"added\": {}}]', 3, 1),
(2, '2024-06-28 02:45:46.761348', '2', 'guru', 1, '[{\"added\": {}}]', 4, 1),
(3, '2024-06-28 02:46:07.848605', '3', 'panitia', 1, '[{\"added\": {}}]', 4, 1),
(4, '2024-06-28 02:46:32.994644', '2', 'panitia', 1, '[{\"added\": {}}]', 3, 1),
(5, '2024-06-28 02:46:39.238870', '3', 'guru', 1, '[{\"added\": {}}]', 3, 1),
(6, '2024-06-28 02:48:37.536112', '2', 'guru', 3, '', 4, 1),
(7, '2024-06-28 02:48:37.536112', '3', 'panitia', 3, '', 4, 1),
(8, '2024-06-28 02:48:59.525582', '1', 'ardesign', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"User permissions\"]}}]', 4, 1),
(9, '2024-06-28 03:03:45.366858', '1', 'Bahasa Indonesia', 1, '[{\"added\": {}}]', 9, 1),
(10, '2024-06-28 03:03:51.268389', '2', 'Sejarah', 1, '[{\"added\": {}}]', 9, 1),
(11, '2024-06-28 03:03:56.813449', '3', 'Informatika', 1, '[{\"added\": {}}]', 9, 1),
(12, '2024-06-28 03:04:04.528527', '4', 'IPA', 1, '[{\"added\": {}}]', 9, 1);

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
(1, 'admin', 'logentry'),
(15, 'administrator', 'dokumensoal'),
(10, 'administrator', 'guru'),
(7, 'administrator', 'jadwaljaga'),
(8, 'administrator', 'jadwalujian'),
(9, 'administrator', 'mapel'),
(11, 'administrator', 'panitia'),
(13, 'administrator', 'soalesai'),
(12, 'administrator', 'soal_pg'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(14, 'panitia', 'mapel'),
(6, 'sessions', 'session');

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
(1, 'contenttypes', '0001_initial', '2024-06-28 02:30:22.712510'),
(2, 'auth', '0001_initial', '2024-06-28 02:30:23.223316'),
(3, 'admin', '0001_initial', '2024-06-28 02:30:23.323052'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-06-28 02:30:23.338677'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-06-28 02:30:23.354302'),
(6, 'administrator', '0001_initial', '2024-06-28 02:30:23.881703'),
(7, 'administrator', '0002_remove_guru_mapel_guru_jenis_kelamin_guru_mapel1_and_more', '2024-06-28 02:30:24.686414'),
(8, 'administrator', '0003_remove_soal_pg_jurusan_soal_pg_jurusan_rpl_and_more', '2024-06-28 02:30:24.800366'),
(9, 'contenttypes', '0002_remove_content_type_name', '2024-06-28 02:30:24.882740'),
(10, 'auth', '0002_alter_permission_name_max_length', '2024-06-28 02:30:24.945824'),
(11, 'auth', '0003_alter_user_email_max_length', '2024-06-28 02:30:24.961449'),
(12, 'auth', '0004_alter_user_username_opts', '2024-06-28 02:30:24.981107'),
(13, 'auth', '0005_alter_user_last_login_null', '2024-06-28 02:30:25.043611'),
(14, 'auth', '0006_require_contenttypes_0002', '2024-06-28 02:30:25.043611'),
(15, 'auth', '0007_alter_validators_add_error_messages', '2024-06-28 02:30:25.059235'),
(16, 'auth', '0008_alter_user_username_max_length', '2024-06-28 02:30:25.074859'),
(17, 'auth', '0009_alter_user_last_name_max_length', '2024-06-28 02:30:25.094514'),
(18, 'auth', '0010_alter_group_name_max_length', '2024-06-28 02:30:25.110144'),
(19, 'auth', '0011_update_proxy_permissions', '2024-06-28 02:30:25.129631'),
(20, 'auth', '0012_alter_user_first_name_max_length', '2024-06-28 02:30:25.145262'),
(21, 'panitia', '0001_initial', '2024-06-28 02:30:25.160893'),
(22, 'sessions', '0001_initial', '2024-06-28 02:30:25.192136'),
(23, 'administrator', '0004_soal_pg_pengguna', '2024-06-28 04:16:17.537063'),
(24, 'administrator', '0005_soalesai_jurusan_rpl_soalesai_jurusan_tkr_and_more', '2024-06-29 13:58:27.201714'),
(25, 'administrator', '0006_soalesai_nomor_soal', '2024-06-29 14:09:34.711698'),
(26, 'administrator', '0007_dokumensoal', '2024-07-01 09:14:34.961795');

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
('97qkewn14fz1oakoj9445v9vn4wsakg9', '.eJxVjEEOwiAQRe_C2pAywJS6dO8ZGmBmpGpoUtqV8e7apAvd_vfef6kxbmsZt8bLOJE6K6dOv1uK-cF1B3SP9TbrPNd1mZLeFX3Qpq8z8fNyuH8HJbbyrRnAZjEo1ovx4BICgukdoTeShACGBKEjtuiH3rIgmgAk7LsuZCL1_gDLhzd4:1sPw1n:LvY3v53jEZF4B01wqBBIAub3xJIbVNcdtyjwZL6200k', '2024-07-20 03:23:59.985345'),
('9rnkuk7f18hm4fa3ynfru54g0cwnf2do', '.eJxVjEEOwiAQRe_C2pAywJS6dO8ZGmBmpGpoUtqV8e7apAvd_vfef6kxbmsZt8bLOJE6K6dOv1uK-cF1B3SP9TbrPNd1mZLeFX3Qpq8z8fNyuH8HJbbyrRnAZjEo1ovx4BICgukdoTeShACGBKEjtuiH3rIgmgAk7LsuZCL1_gDLhzd4:1sO9H2:QAVG8xTincUZEiip9A7sh5fCyRGgM3BLi-eiE66U4Bo', '2024-07-15 05:08:20.172240'),
('b6staxdc10778ibq1bzzw5gpf7pqfvf3', '.eJxVjEsOwiAUAO_C2hA-hUdduu8ZyAMeUjWQlHZlvLsh6UK3M5N5M4_HXvzRafNrYldm2eWXBYxPqkOkB9Z747HVfVsDHwk_bedLS_S6ne3foGAvY-s0qEnlTCQ0RQjZAaAES0ZYGQGMUzagIanTLJRGg5NKwmB0Os9Zs88X1es3fg:1sOKSn:vv89LAXGk-StVIeCnI6iY6R2Uyd9TZjM3hAW6MErkTc', '2024-07-15 17:05:13.874186'),
('e0m4pfqtfete33crzfcum4vrw4xjnlus', '.eJxVjEEOwiAQRe_C2hDKMAIu3fcMZMpMpWpoUtqV8e7apAvd_vfef6lE21rS1mRJE6uL6tTpdxsoP6TugO9Ub7POc12XadC7og_adD-zPK-H-3dQqJVv7aUDlGgJI4IXZskA5MhYCugkRGNHxwEzggU0EQM7cRQtj4zn7NX7A9UgN4M:1sPQ0O:aznvi7rscqAdKuK4psyAtQJYPUXX8ofXjj4QSObshvI', '2024-07-18 17:12:24.621306'),
('fjlo6c6l0b4d4nnvm2710vmzn3o4omhl', '.eJxVjEsOwiAUAO_C2hA-hUdduu8ZyAMeUjWQlHZlvLsh6UK3M5N5M4_HXvzRafNrYldm2eWXBYxPqkOkB9Z747HVfVsDHwk_bedLS_S6ne3foGAvY-s0qEnlTCQ0RQjZAaAES0ZYGQGMUzagIanTLJRGg5NKwmB0Os9Zs88X1es3fg:1sNaYq:0ERMriu3zUBonwwDeM7uKeIqxtV5R8yiSmVYV8puroM', '2024-07-13 16:04:24.909601'),
('lvdah28h1361hmncw4eqwzydm60mbbc6', '.eJxVjEEOwiAQRe_C2hAoUMCle89AhplRqgaS0q6Md7dNutDtf-_9t0iwLiWtnec0kTgLJ06_WwZ8ct0BPaDem8RWl3nKclfkQbu8NuLX5XD_Dgr0stUA9uZ0iHmICMSaotec2UAwBE45jdFm8GoIYcRNNl5biqNFH7UCReLzBfq0N_k:1sOBPj:fZdH5P5CC-ElLimBO0F-5xpn1Qsiyziu4inJp8O30X0', '2024-07-15 07:25:27.148680'),
('o74nrgo673iaf8chfjj63g9jxweg43d2', '.eJxVjEEOwiAQRe_C2hDKMAIu3fcMZMpMpWpoUtqV8e7apAvd_vfef6lE21rS1mRJE6uL6tTpdxsoP6TugO9Ub7POc12XadC7og_adD-zPK-H-3dQqJVv7aUDlGgJI4IXZskA5MhYCugkRGNHxwEzggU0EQM7cRQtj4zn7NX7A9UgN4M:1sOhe6:08McEO2YcHHUBEobnS9iFq8hw6q7SryiyXNyTPlScHU', '2024-07-16 17:50:26.315736'),
('p7gjut82er9sof0svk3v6sow04ezf6i9', '.eJxVjEEOwiAQRe_C2pAywJS6dO8ZGmBmpGpoUtqV8e7apAvd_vfef6kxbmsZt8bLOJE6K6dOv1uK-cF1B3SP9TbrPNd1mZLeFX3Qpq8z8fNyuH8HJbbyrRnAZjEo1ovx4BICgukdoTeShACGBKEjtuiH3rIgmgAk7LsuZCL1_gDLhzd4:1sN1zR:MLrYCaXK7Edw1ZSaFZ5DhSB2iuG83h6s1IKfckC1_PU', '2024-07-12 03:09:33.420791'),
('tyv1le0g7nzmppcihrbdl4ocacr764oj', '.eJxVjEsOwiAUAO_C2hA-hUdduu8ZyAMeUjWQlHZlvLsh6UK3M5N5M4_HXvzRafNrYldm2eWXBYxPqkOkB9Z747HVfVsDHwk_bedLS_S6ne3foGAvY-s0qEnlTCQ0RQjZAaAES0ZYGQGMUzagIanTLJRGg5NKwmB0Os9Zs88X1es3fg:1sN2qv:fRNUHJPZdWmJ5s_yc92XIg5pj3El0ayIQ4CSCuSIOwY', '2024-07-12 04:04:49.902421'),
('vytj5gi27mdznsazlf9qtee6df4jq9u0', '.eJxVjEEOwiAQRe_C2hAoUMCle89AhplRqgaS0q6Md7dNutDtf-_9t0iwLiWtnec0kTgLJ06_WwZ8ct0BPaDem8RWl3nKclfkQbu8NuLX5XD_Dgr0stUA9uZ0iHmICMSaotec2UAwBE45jdFm8GoIYcRNNl5biqNFH7UCReLzBfq0N_k:1sNKBg:vsxgysmZlJDresFdhiYS0rSmmulj3nwn7GIm_NnGopk', '2024-07-12 22:35:24.886041'),
('yis4nf2su21tx2xat5j5kg3u74u8mlza', '.eJxVjEsOwiAUAO_C2hA-hUdduu8ZyAMeUjWQlHZlvLsh6UK3M5N5M4_HXvzRafNrYldm2eWXBYxPqkOkB9Z747HVfVsDHwk_bedLS_S6ne3foGAvY-s0qEnlTCQ0RQjZAaAES0ZYGQGMUzagIanTLJRGg5NKwmB0Os9Zs88X1es3fg:1sPuk2:ErPTQHaD67Tx9qj7Gqc1fPDxpvFIKVANKX0VRX7A8-s', '2024-07-20 02:01:34.605338');

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
-- Indeks untuk tabel `administrator_dokumensoal`
--
ALTER TABLE `administrator_dokumensoal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `administrator_dokume_mapel_id_5f30ff65_fk_administr` (`mapel_id`),
  ADD KEY `administrator_dokumensoal_pengguna_id_9540f9df_fk_auth_user_id` (`pengguna_id`);

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
  ADD KEY `administrator_soales_mapel_id_0c7d219f_fk_administr` (`mapel_id`),
  ADD KEY `administrator_soalesai_pengguna_id_06de546d_fk_auth_user_id` (`pengguna_id`);

--
-- Indeks untuk tabel `administrator_soal_pg`
--
ALTER TABLE `administrator_soal_pg`
  ADD PRIMARY KEY (`id_pg`),
  ADD KEY `administrator_soal_p_mapel_id_56702e9d_fk_administr` (`mapel_id`),
  ADD KEY `administrator_soal_pg_pengguna_id_7d2edea3_fk_auth_user_id` (`pengguna_id`);

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
-- AUTO_INCREMENT untuk tabel `administrator_dokumensoal`
--
ALTER TABLE `administrator_dokumensoal`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `administrator_guru`
--
ALTER TABLE `administrator_guru`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `administrator_panitia`
--
ALTER TABLE `administrator_panitia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `administrator_soalesai`
--
ALTER TABLE `administrator_soalesai`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `administrator_soal_pg`
--
ALTER TABLE `administrator_soal_pg`
  MODIFY `id_pg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT untuk tabel `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `panitia_mapel`
--
ALTER TABLE `panitia_mapel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `administrator_dokumensoal`
--
ALTER TABLE `administrator_dokumensoal`
  ADD CONSTRAINT `administrator_dokume_mapel_id_5f30ff65_fk_administr` FOREIGN KEY (`mapel_id`) REFERENCES `administrator_mapel` (`id`),
  ADD CONSTRAINT `administrator_dokumensoal_pengguna_id_9540f9df_fk_auth_user_id` FOREIGN KEY (`pengguna_id`) REFERENCES `auth_user` (`id`);

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
  ADD CONSTRAINT `administrator_soales_mapel_id_0c7d219f_fk_administr` FOREIGN KEY (`mapel_id`) REFERENCES `administrator_mapel` (`id`),
  ADD CONSTRAINT `administrator_soalesai_pengguna_id_06de546d_fk_auth_user_id` FOREIGN KEY (`pengguna_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `administrator_soal_pg`
--
ALTER TABLE `administrator_soal_pg`
  ADD CONSTRAINT `administrator_soal_p_mapel_id_56702e9d_fk_administr` FOREIGN KEY (`mapel_id`) REFERENCES `administrator_mapel` (`id`),
  ADD CONSTRAINT `administrator_soal_pg_pengguna_id_7d2edea3_fk_auth_user_id` FOREIGN KEY (`pengguna_id`) REFERENCES `auth_user` (`id`);

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
