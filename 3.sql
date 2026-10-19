--1.Select
--2.Join
--3.Where
--4.Group By

SELECT
    m.nama_mahasiswa,
    COUNT(p.nomor_pengajuan) AS total_pengajuan
FROM mahasiswa AS m
JOIN pengajuan_ruang AS p
    ON p.nim = m.nim
WHERE p.tanggal_penggunaan BETWEEN '2026-11-01' AND '2026-11-30'
GROUP BY
    m.nim,
    m.nama_mahasiswa;
