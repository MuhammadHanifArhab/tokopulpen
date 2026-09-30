import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tokopulpen/main.dart';

void main() {
  testWidgets('Alur Home -> Daftar Produk -> Detail Produk',
      (WidgetTester tester) async {
    // Saat tes, Google Fonts tidak bisa mengunduh font (tanpa jaringan).
    // Abaikan error terkait google_fonts agar tes tidak gagal karenanya.
    final originalOnError = FlutterError.onError;
    FlutterError.onError = (details) {
      if (details.exceptionAsString().contains('google_fonts')) return;
      originalOnError?.call(details);
    };
    addTearDown(() => FlutterError.onError = originalOnError);

    // Ukuran layar seperti ponsel agar semua elemen muat.
    tester.view.physicalSize = const Size(800, 1600);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const PulpenKitaApp());
    await tester.pumpAndSettle();

    // 1. Home screen
    expect(find.text('Pulpen Kita'), findsOneWidget);
    expect(find.text('Jelajahi Koleksi'), findsOneWidget);

    // 2. Navigasi ke daftar produk
    await tester.tap(find.text('Jelajahi Koleksi'));
    await tester.pumpAndSettle();

    expect(find.text('Koleksi Pulpen'), findsOneWidget);
    expect(find.text('Midnight Gel Pen'), findsOneWidget);

    // 3. Navigasi ke detail produk
    await tester.tap(find.text('Midnight Gel Pen'));
    await tester.pumpAndSettle();

    expect(find.text('Detail Produk'), findsOneWidget);
    expect(find.text('Beli Sekarang'), findsOneWidget);

    // 4. Selector kuantitas
    expect(find.text('1'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add_rounded));
    await tester.pump();
    expect(find.text('2'), findsOneWidget);
    expect(find.text('Rp 24.000'), findsWidgets); // total = 2 x Rp 12.000
  });
}