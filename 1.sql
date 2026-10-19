--soal no 1--
--tabel induk yang dipilih tabel mahasiswa,tabel ruang dan transaksinya  tabel pengajuan ruang-- 
--Tabel Mahasiswa(Induk)--
CREATE TABLE mahasiswa (
  nim VARCHAR(15) NOT NULL,
  nama_mahasiswa VARCHAR(100)
  kelas(20) NULL
  CONSTRAINT pk_mahasiswa PRIMARY KEY (nim)
) ENGINE=InnoDB;
--Tabel Ruang(Induk)
CREATE TABLE ruang (
  no_ruang     VARCHAR(10) NOT NULL,
  jenis_ruang  VARCHAR(20) NOT NULL,
  id_lokasi    VARCHAR(10) NOT NULL,
  CONSTRAINT pk_ruang PRIMARY KEY (no_ruang),
  CONSTRAINT ck_ruang_jenis CHECK (jenis_ruang IN ('Ruang Kelas', 'Laboratorium')),
  CONSTRAINT fk_ruang_lokasi FOREIGN KEY (id_lokasi)
    REFERENCES lokasi_kampus (id_lokasi)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE pengajuan_ruang (
  nomor_pengajuan     VARCHAR(20)  NOT NULL,
  nim                 VARCHAR(15)  NOT NULL,
  no_ruang            VARCHAR(10)  NOT NULL,
  id_admin            VARCHAR(10)  NULL,
  tanggal_penggunaan  DATE         NOT NULL,
  jam_mulai           TIME         NOT NULL,
  jam_selesai         TIME         NOT NULL,
  tujuan_penggunaan   VARCHAR(150) NOT NULL,
  status_pengajuan    VARCHAR(12)  NOT NULL DEFAULT 'Menunggu',
  alasan              VARCHAR(150) NULL,
  CONSTRAINT pk_pengajuan_ruang PRIMARY KEY (nomor_pengajuan),
  CONSTRAINT ck_pengajuan_waktu  CHECK (jam_selesai > jam_mulai),
  CONSTRAINT ck_pengajuan_status CHECK (status_pengajuan IN
    ('Menunggu', 'Disetujui', 'Ditolak', 'Dibatalkan')),
  CONSTRAINT fk_pengajuan_mahasiswa FOREIGN KEY (nim)
    REFERENCES mahasiswa (nim)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_pengajuan_ruang FOREIGN KEY (no_ruang)
    REFERENCES ruang (no_ruang)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_pengajuan_admin FOREIGN KEY (id_admin)
    REFERENCES admin_lokasi (id_admin)
    ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB;
