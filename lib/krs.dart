import 'mahasiswa.dart';
import 'mata_kuliah.dart';

class KRS {
  Mahasiswa mahasiswa;
  List<MataKuliah> daftarMataKuliah = [];

  KRS(this.mahasiswa);

  void tambahMataKuliah(MataKuliah mk) {
    daftarMataKuliah.add(mk);
    print('Mata Kuliah ${mk.nama} ditambahkan ke KRS ${mahasiswa.nama}');
  }

  void cetakKRS() {
    if (daftarMataKuliah.isEmpty) {
      print('Tidak ada mata kuliah dalam KRS.');
      return;
    }
    print('\nKRS ${mahasiswa.nama} (${mahasiswa.nim}):');
    for (var mk in daftarMataKuliah) {
      print('- ${mk.nama} (${mk.kode}, ${mk.sks} SKS)');
    }
  }
}
