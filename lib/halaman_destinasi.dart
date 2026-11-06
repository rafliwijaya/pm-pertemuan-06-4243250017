import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'data.dart';

class HalamanDestinasi extends StatelessWidget {
  const HalamanDestinasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CeritaDestinasi'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final kolom = switch (constraints.maxWidth) {
            < 600 => 2, // hp
            < 900 => 3, // tablet
            _ => 4,     // dekstop
          };

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: kolom,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.78,
            ),
            itemCount: daftarDestinasi.length,
            itemBuilder: (context, i) =>
                KartuDestinasi(destinasi: daftarDestinasi[i]),
          );
        },
      ),
    );
  }
}

class KartuDestinasi extends StatelessWidget {
  const KartuDestinasi({super.key, required this.destinasi});

  final Destinasi destinasi;

  @override
  Widget build(BuildContext context) {
    final teks = Theme.of(context).textTheme;
    final skema = Theme.of(context).colorScheme;

    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.go('/destinasi/${destinasi.id}'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Hero(
                tag: 'destinasi-hero-${destinasi.id}',
                child: Container(
                  width: double.infinity,
                  color: destinasi.warnaAksen.withValues(alpha: 0.15),
                  child: Image.asset(
                    destinasi.gambar,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(
                          destinasi.ikon,
                          size: 52,
                          color: destinasi.warnaAksen,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destinasi.nama,
                          style: teks.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 14, color: skema.outline),
                            const SizedBox(width: 2),
                            Expanded(
                              child: Text(
                                destinasi.kabupatenKota,
                                style: teks.bodySmall?.copyWith(
                                  color: skema.outline,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: destinasi.hargaTiket == 'Gratis'
                            ? Colors.green.shade100
                            : skema.primaryContainer,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        destinasi.hargaTiket,
                        style: teks.labelSmall?.copyWith(
                          color: destinasi.hargaTiket == 'Gratis'
                              ? Colors.green.shade900
                              : skema.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}