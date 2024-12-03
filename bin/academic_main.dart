import '../lib/mahasiswa.dart';
import '../lib/mata_kuliah.dart';
import '../lib/krs.dart';
import '../lib/nilai.dart';
import 'dart:io';

void main() {
  // Membaca input mahasiswa
  stdout.write('Masukkan nama mahasiswa: ');
  var nama = stdin.readLineSync() ?? '';
  stdout.write('Masukkan NIM mahasiswa: ');
  var nim = stdin.readLineSync() ?? '';
  stdout.write('Masukkan semester mahasiswa: ');
  var semester = int.tryParse(stdin.readLineSync() ?? '');

  // Pastikan semester valid
  if (semester == null || semester <= 0) {
    print('Semester tidak valid!');
    return;
  }

  // Membuat mahasiswa
  var mhs1 = Mahasiswa(nama, nim, semester);

  // Membuat mata kuliah
  print('=== Membuat Mata Kuliah ===');
  var mk1 = MataKuliah('MK001', 'Pemrograman Dart', 3);
  var mk2 = MataKuliah('MK002', 'Basis Data', 4);
  var mk3 = MataKuliah('MK003', 'Sistem Operasi', 3);

  // Mengisi KRS
  print('=== Membuat KRS ===');
  var krs = KRS(mhs1);
  krs.tambahMataKuliah(mk1);
  krs.tambahMataKuliah(mk2);
  krs.tambahMataKuliah(mk3);

  // Menampilkan KRS
  print('=== Menampilkan KRS ===');
  krs.cetakKRS();

  // Mengisi nilai mahasiswa dengan input dari pengguna
  print('=== Mengisi Nilai Mahasiswa ===');
  var transkrip = Transkrip(mhs1);
  for (var mk in krs.daftarMataKuliah) {
    double? nilaiInput;
    do {
      stdout.write('Masukkan nilai untuk mata kuliah ${mk.nama} (${mk.kode}): ');
      var input = stdin.readLineSync();
      nilaiInput = double.tryParse(input ?? '');
      if (nilaiInput == null || nilaiInput < 0 || nilaiInput > 100) {
        print('Input tidak valid! Masukkan angka antara 0-100.');
      }
    } while (nilaiInput == null || nilaiInput < 0 || nilaiInput > 100);

    transkrip.tambahNilai(Nilai(mk, nilaiInput));
  }

  // Menampilkan transkrip nilai dan IPK
  print('=== Menampilkan Transkrip Nilai dan IPK ===');
  transkrip.cetakTranskrip();

  // Menampilkan IPK
  print('\nIPK: ${transkrip.hitungIPK().toStringAsFixed(2)}');
}
