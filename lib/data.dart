import 'package:material_ui/material_ui.dart';

class Destinasi {
  const Destinasi({
    required this.id,
    required this.nama,
    required this.kabupatenKota,
    required this.kategori,
    required this.hargaTiket,
    required this.deskripsi,
    required this.gambar,
    required this.ikon,
    required this.warnaAksen,
  });

  final int id;
  final String nama;
  final String kabupatenKota;
  final String kategori;
  final String hargaTiket;
  final String deskripsi;
  final String gambar;
  final IconData ikon;
  final Color warnaAksen;
}

const daftarDestinasi = <Destinasi>[
  Destinasi(
    id: 1,
    nama: 'Danau Toba & Samosir',
    kabupatenKota: 'Kab. Samosir',
    kategori: 'Wisata Alam',
    hargaTiket: 'Gratis',
    deskripsi:
        'Danau vulkanik terbesar di dunia dengan keindahan panorama bukit hijau '
        'dan Pulau Samosir di tengahnya yang kental dengan budaya Batak.',
    gambar: 'assets/images/danau_toba.jpg',
    ikon: Icons.landscape,
    warnaAksen: Color(0xFF006D3B),
  ),
  Destinasi(
    id: 2,
    nama: 'Istana Maimun',
    kabupatenKota: 'Kota Medan',
    kategori: 'Sejarah & Budaya',
    hargaTiket: 'Rp10.000',
    deskripsi:
        'Istana peninggalan Kesultanan Deli yang megah dengan perpaduan arsitektur '
        'Melayu, Islam, Spanyol, dan Italia yang didominasi warna kuning keemasan.',
    gambar: 'assets/images/istana_maimun.jpg',
    ikon: Icons.account_balance,
    warnaAksen: Color(0xFFB78103),
  ),
  Destinasi(
    id: 3,
    nama: 'Ekowisata Bukit Lawang',
    kabupatenKota: 'Kab. Langkat',
    kategori: 'Ekowisata',
    hargaTiket: 'Rp25.000',
    deskripsi:
        'Pintu gerbang Taman Nasional Gunung Leuser yang terkenal sebagai habitat alami '
        'Orangutan Sumatera serta wisata arung jeram (tubing) di Sungai Bahorok.',
    gambar: 'assets/images/bukit_lawang.jpg',
    ikon: Icons.forest,
    warnaAksen: Color(0xFF2E7D32),
  ),
  Destinasi(
    id: 4,
    nama: 'Air Terjun Sipiso-piso',
    kabupatenKota: 'Kab. Karo',
    kategori: 'Wisata Alam',
    hargaTiket: 'Rp10.000',
    deskripsi:
        'Air terjun dengan ketinggian 120 meter yang jatuh menghujam jurang curam '
        'dengan pemandangan spektakuler sudut utara Danau Toba.',
    gambar: 'assets/images/sipiso_piso.jpg',
    ikon: Icons.waves,
    warnaAksen: Color(0xFF00796B),
  ),
  Destinasi(
    id: 5,
    nama: 'Bukit Gundaling Berastagi',
    kabupatenKota: 'Kab. Karo',
    kategori: 'Wisata Alam',
    hargaTiket: 'Rp10.000',
    deskripsi:
        'Kawasan puncak berhawa sejuk dengan pemandangan langsung ke Gunung Sibayak '
        'dan Sinabung, lengkap dengan wisata kuda dan pasar buah segar.',
    gambar: 'assets/images/berastagi.jpg',
    ikon: Icons.terrain,
    warnaAksen: Color(0xFF388E3C),
  ),
  Destinasi(
    id: 6,
    nama: 'The Kaldera',
    kabupatenKota: 'Kab. Toba',
    kategori: 'Wisata Alam',
    hargaTiket: 'Rp5.000',
    deskripsi:
        'Menyajikan panorama langsung ke arah Danau Toba dan Pulau Samosir yang megah dari sudut pandang atas bukit. ',
    gambar: 'assets/images/kaldera.jpg',
    ikon: Icons.church,
    warnaAksen: Color(0xFF455A64),
  ),
  Destinasi(
    id: 7,
    nama: 'Candi Bahal Portibi',
    kabupatenKota: 'Kab. Padang Lawas Utara',
    kategori: 'Sejarah & Budaya',
    hargaTiket: 'Gratis',
    deskripsi:
        'Kompleks candi bata merah kuno peninggalan Kerajaan Pannai abad ke-11 '
        'bercorak Buddha Vajrayana yang sarat nilai arkeologis.',
    gambar: 'assets/images/candi_bahal.jpg',
    ikon: Icons.temple_buddhist,
    warnaAksen: Color(0xFF8D6E63),
  ),
  Destinasi(
    id: 8,
    nama: 'Tangkahan The Hidden Paradise',
    kabupatenKota: 'Kab. Langkat',
    kategori: 'Ekowisata',
    hargaTiket: 'Rp30.000',
    deskripsi:
        'Surga tersembunyi yang dikenal dengan pengalaman memandikan gajah liar di sungai jernih '
        'serta air terjun alami di pedalaman hutan tropis.',
    gambar: 'assets/images/tangkahan.jpg',
    ikon: Icons.pets,
    warnaAksen: Color(0xFF1B5E20),
  ),
];

Destinasi? cariDestinasi(int id) {
  for (final d in daftarDestinasi) {
    if (d.id == id) return d;
  }
  return null;
}