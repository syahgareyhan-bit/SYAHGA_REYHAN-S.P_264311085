--soal no 2--
-- Insert tabel mahasiswa--
INSERT INTO mahasiswa(nim, nama, kelas) 
  VALUES
(264311001, 'Joko susilo', 'TRPL 1C')
('230101002', 'Dewi Lestari',  'TI-2B'),
('230101003', 'Rizky Ramadhan', 'SI-2A');
--Insert tabel ruang--
INSERT INTO ruang (no_ruang, jenis_ruang, id_lokasi) 
  VALUES
('A-101', 'Ruang Kelas',  'LOK01'),
('B-201', 'Ruang Kelas',  'LOK02'),
('LAB-01', 'Laboratorium', 'LOK03');
--Insert tabel pengajuan Reuang--
INSERT INTO pengajuan_ruang
(nomor_pengajuan, nim, no_ruang, id_admin, tanggal_penggunaan, jam_mulai, jam_selesai, tujuan_penggunaan, status_pengajuan, alasan) 
  VALUES
('PRJ-2026-001', '230101001', 'A-101',  'ADM01', '2026-10-26', '08:00:00', '10:00:00', 'Rapat organisasi HMTI',        'Disetujui', NULL),
('PRJ-2026-002', '230101002', 'LAB-01', NULL,    '2026-10-27', '13:00:00', '15:30:00', 'Praktikum pengganti basis data', 'Menunggu',  NULL),
('PRJ-2026-003', '230101003', 'B-201',  'ADM02', '2026-10-28', '09:00:00', '11:00:00', 'Seminar proposal kelompok',      'Ditolak',   'Ruang sudah dipakai kegiatan perkuliahan');

INSERT INTO pengajuan_ruang (
    nomor_pengajuan,
    nim,
    no_ruang,
    tanggal_penggunaan,
    jam_mulai,
    jam_selesai,
    tujuan_penggunaan,
    status_pengajuan,
    alasan
)
VALUES
    (
        'P101',
        'M101',
        'R301',
        '2026-11-01',
        '08:00:00',
        '10:00:00',
        'Kuliah Basis Data',
        'Menunggu',
        NULL
    ),
    (
        'P102',
        'M102',
        'LAB03',
        '2026-11-02',
        '10:00:00',
        '12:00:00',
        'Praktikum Jaringan',
        'Menunggu',
        NULL
    ),
    (
        'P103',
        'M103',
        'R401',
        '2026-11-03',
        '13:00:00',
        '15:00:00',
        'Rapat Kelompok',
        'Disetujui',
        NULL
    );

--2.Read
SELECT *
FROM mahasiswa;

--3.Update
UPDATE pengajuan_ruang
SET
    status_pengajuan = 'Ditolak',
    alasan = 'Jadwal laboratorium tidak tersedia'
WHERE nomor_pengajuan = 'P102';

--4.Delete
DELETE FROM pengajuan_ruang
WHERE nomor_pengajuan = 'P103';
