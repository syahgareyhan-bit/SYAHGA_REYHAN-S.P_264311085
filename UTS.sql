CREATE TABLE Lokasi_Kampus (
    id_lokasi    VARCHAR(10)  NOT NULL,
    nama_lokasi  VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_lokasi)
);

CREATE TABLE Admin_Lokasi (
    id_admin    VARCHAR(10)  NOT NULL,
    nama_admin  VARCHAR(100) NOT NULL,
    id_lokasi   VARCHAR(10)  NOT NULL,
    PRIMARY KEY (id_admin),
    FOREIGN KEY (id_lokasi) REFERENCES Lokasi_Kampus (id_lokasi)
);

CREATE TABLE mahasiswa (
  nim VARCHAR(15) NOT NULL,
  nama_mahasiswa VARCHAR(100)
  kelas(20) NULL
  CONSTRAINT pk_mahasiswa PRIMARY KEY (nim)
) ENGINE=InnoDB;

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

CREATE TABLE fasilitas (
  id_fasilitas   VARCHAR(10) NOT NULL,
  nama_fasilitas VARCHAR(50) NOT NULL,
  stok_total     SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  id_lokasi      VARCHAR(10) NOT NULL,
  CONSTRAINT pk_fasilitas PRIMARY KEY (id_fasilitas),
  CONSTRAINT ck_fasilitas_stok CHECK (stok_total >= 0),
  CONSTRAINT fk_fasilitas_lokasi FOREIGN KEY (id_lokasi)
    REFERENCES lokasi_kampus (id_lokasi)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE detail_fasilitas (
  nomor_pengajuan VARCHAR(20) NOT NULL,
  id_fasilitas    VARCHAR(10) NOT NULL,
  jumlah_pinjam   SMALLINT UNSIGNED NOT NULL DEFAULT 1,
  CONSTRAINT pk_detail_fasilitas PRIMARY KEY (nomor_pengajuan, id_fasilitas),
  CONSTRAINT ck_detail_jumlah CHECK (jumlah_pinjam > 0),
  CONSTRAINT fk_detail_pengajuan FOREIGN KEY (nomor_pengajuan)
    REFERENCES pengajuan_ruang (nomor_pengajuan)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_detail_fasilitas FOREIGN KEY (id_fasilitas)
    REFERENCES fasilitas (id_fasilitas)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;
