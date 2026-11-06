import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'data.dart';

class HalamanDetailDestinasi extends StatelessWidget {
  const HalamanDetailDestinasi({super.key, required this.destinasi});

  final Destinasi? destinasi;

  @override
  Widget build(BuildContext context) {
    final d = destinasi;
    if (d == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Destinasi Tidak Ditemukan')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.explore_off, size: 72, color: Colors.grey),
              const SizedBox(height: 16),
              const Text('Destinasi yang Anda cari tidak tersedia.'),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () => context.go('/'),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali ke Daftar'),
              ),
            ],
          ),
        ),
      );
    }

    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;
    final visualBanner = AspectRatio(
      aspectRatio: 16 / 10,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: 'destinasi-hero-${d.id}',
            child: Container(
              color: d.warnaAksen.withValues(alpha: 0.15),
              child: Image.asset(
                d.gambar,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(d.ikon, size: 100, color: d.warnaAksen),
                  );
                },
              ),
            ),
          ),

          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.5),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          Positioned(
            top: 16,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.65),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(d.ikon, size: 16, color: Colors.white),
                  const SizedBox(width: 6),
                  Text(
                    d.kategori,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 16,
            left: 16,
            child: Row(
              children: [
                const Icon(Icons.location_on, color: Colors.white, size: 18),
                const SizedBox(width: 4),
                Text(
                  d.kabupatenKota,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    final infoPanel = Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            d.nama,
            style: teks.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(
                avatar: const Icon(
                  Icons.confirmation_number_outlined,
                  size: 18,
                ),
                label: Text('Tiket: ${d.hargaTiket}'),
                backgroundColor: skema.secondaryContainer,
              ),
              Chip(
                avatar: const Icon(Icons.map_outlined, size: 18),
                label: Text(d.kabupatenKota),
              ),
            ],
          ),
          const Divider(height: 32),
          Text(
            'Tentang Destinasi',
            style: teks.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(d.deskripsi, style: teks.bodyLarge?.copyWith(height: 1.6)),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Menyimpan ${d.nama} ke rencana perjalanan Anda.',
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.bookmark_add),
              label: const Text('Simpan ke Rencana Wisata'),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(d.nama)),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 720) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: visualBanner),
                Expanded(
                  flex: 6,
                  child: SingleChildScrollView(child: infoPanel),
                ),
              ],
            );
          }
          return ListView(children: [visualBanner, infoPanel]);
        },
      ),
    );
  }
}
