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
