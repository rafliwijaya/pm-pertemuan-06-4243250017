import 'package:material_ui/material_ui.dart';

class HalamanTentang extends StatelessWidget {
  const HalamanTentang({super.key});

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: ListView(
        children: [
          SizedBox(
            height: 180,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ColoredBox(color: skema.primaryContainer),
                ),
                Positioned(
                  right: -10,
                  bottom: -20,
                  child: Icon(
                    Icons.explore,
                    size: 170,
                    color: skema.primary.withValues(alpha: 0.2),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'CeritaDestinasi',
                        style: teks.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: skema.onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Jelajahi Cerita Wisata Sumatera Utara',
                        style: teks.bodyMedium?.copyWith(
                          color: skema.onPrimaryContainer.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'INFORMASI PENGEMBANG',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                letterSpacing: 1.1,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Nama Mahasiswa'),
            subtitle: Text('Muhammad Rafli Wijaya (4243250017)'),
          ),
          const ListTile(
            leading: Icon(Icons.school_outlined),
            title: Text('Program Studi Ilmu Komputer'),
            subtitle: Text('FMIPA — Universitas Negeri Medan (UNIMED)'),
          ),
          const ListTile(
            leading: Icon(Icons.laptop_chromebook),
            title: Text('Mata Kuliah'),
            subtitle: Text('Pemrograman Mobile — Tugas Rutin 6 (Pertemuan 6)'),
          ),

          const Divider(),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              'FITUR DESAIN RESPONSIF',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                letterSpacing: 1.1,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.view_quilt_outlined),
            title: Text('Grid Adaptif'),
            subtitle: Text('2 Kolom (<600dp), 3 Kolom (600-899dp), 4 Kolom (≥900dp)'),
          ),
          const ListTile(
            leading: Icon(Icons.swap_horizontal_circle_outlined),
            title: Text('Navigasi Adaptif'),
            subtitle: Text('NavigationBar (<840dp) bertukar ke NavigationRail (≥840dp)'),
          ),
        ],
      ),
    );
  }
}