import 'package:material_ui/material_ui.dart';

import 'data.dart';
import 'halaman_destinasi.dart';

class HalamanKategori extends StatefulWidget {
  const HalamanKategori({super.key});

  @override
  State<HalamanKategori> createState() => _HalamanKategoriState();
}

class _HalamanKategoriState extends State<HalamanKategori> {
  String? _kategoriTerpilih;

  List<String> get _semuaKategori {
    final list = daftarDestinasi.map((d) => d.kategori).toSet().toList();
    list.sort();
    return list;
  }

  List<Destinasi> get _hasilFilter {
    if (_kategoriTerpilih == null) return daftarDestinasi;
    return daftarDestinasi
        .where((d) => d.kategori == _kategoriTerpilih)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori Wisata'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: const Text('Semua Kategori'),
                    selected: _kategoriTerpilih == null,
                    onSelected: (selected) {
                      setState(() => _kategoriTerpilih = null);
                    },
                  ),
                ),
                for (final k in _semuaKategori)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(k),
                      selected: _kategoriTerpilih == k,
                      onSelected: (selected) {
                        setState(() {
                          _kategoriTerpilih = selected ? k : null;
                        });
                      },
                    ),
                  ),
              ],
            ),
          ),
          const Divider(height: 1),

          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final kolom = switch (constraints.maxWidth) {
                  < 600 => 2,
                  < 900 => 3,
                  _ => 4,
                };
                final list = _hasilFilter;

                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: kolom,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.78,
                  ),
                  itemCount: list.length,
                  itemBuilder: (context, i) => KartuDestinasi(destinasi: list[i]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}