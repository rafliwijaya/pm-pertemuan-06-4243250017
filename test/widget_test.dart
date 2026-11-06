import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pm_p6_4243250017/halaman_destinasi.dart';
import 'package:pm_p6_4243250017/main.dart';

void main() {
  testWidgets('Uji Navigasi Ponsel (<840dp): Menggunakan NavigationBar',
      (tester) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const WisataSumutApp());
    await tester.pumpAndSettle();

    // Verifikasi ada NavigationBar di bawah dan tidak ada NavigationRail di samping
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.byType(NavigationRail), findsNothing);

    // Verifikasi kartu destinasi tampil
    expect(find.byType(KartuDestinasi), findsWidgets);
  });

  testWidgets(
      'Uji Navigasi Tablet/Desktop (≥840dp): Menggunakan NavigationRail',
      (tester) async {
    tester.view.physicalSize = const Size(1000, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const WisataSumutApp());
    await tester.pumpAndSettle();

    // Verifikasi ada NavigationRail di samping dan tidak ada NavigationBar di bawah
    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);
  });

  testWidgets('Uji Buka Detail Destinasi dan Cek Stack Badge',
      (tester) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const WisataSumutApp());
    await tester.pumpAndSettle();

    // Tap kartu destinasi pertama (Danau Toba)
    final kartuPertama = find.byType(KartuDestinasi).first;
    expect(kartuPertama, findsOneWidget);
    await tester.tap(kartuPertama);
    await tester.pumpAndSettle();

    // Verifikasi masuk ke halaman detail
    expect(find.text('Tentang Destinasi'), findsOneWidget);
    expect(find.byType(Stack), findsWidgets); // Stack badge terpasang
    expect(find.byType(BackButton), findsOneWidget); // Ada tombol kembali
  });
}