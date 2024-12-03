import 'mata_kuliah.dart';
import 'mahasiswa.dart';

class Nilai {
  MataKuliah mataKuliah;
  double nilai;

  Nilai(this.mataKuliah, this.nilai);

  double get nilaiAngka {
    if (nilai >= 80) return 4.0; // A
    if (nilai >= 70) return 3.0; // B
    if (nilai >= 60) return 2.0; // C
    if (nilai >= 50) return 1.0; // D
    return 0.0; // E
  }
}

class Transkrip {
  Mahasiswa mahasiswa;
  List<Nilai> daftarNilai = [];

  Transkrip(this.mahasiswa);

  void tambahNilai(Nilai nilai) {
    daftarNilai.add(nilai);
    print('Nilai untuk mata kuliah ${nilai.mataKuliah.nama} ditambahkan.');
  }

  double hitungIPK() {
    if (daftarNilai.isEmpty) return 0.0;

    double totalNilai = 0.0;
    int totalSKS = 0;

    for (var n in daftarNilai) {
      totalNilai += n.nilaiAngka * n.mataKuliah.sks;
      totalSKS += n.mataKuliah.sks;
    }

    return totalNilai / totalSKS;
  }

  void cetakTranskrip() {
    print('\nTranskrip Nilai ${mahasiswa.nama} (${mahasiswa.nim}):');
    for (var n in daftarNilai) {
      print(
          '- ${n.mataKuliah.nama} (${n.mataKuliah.kode}): ${n.nilai} (${n.nilaiAngka.toStringAsFixed(2)})');
    }
  }
}
