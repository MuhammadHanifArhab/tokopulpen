import 'package:flutter/material.dart';

/// Model produk pulpen.
class Product {
  final int id;
  final String name;
  final int price; // dalam Rupiah
  final String description;
  final double rating;
  final String imagePath;
  final bool isAsset; // true = asset lokal, false = URL network
  final String nibSize;
  final String inkColor;
  final Color accentColor; // dipakai untuk placeholder bila gambar gagal dimuat

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.rating,
    required this.imagePath,
    required this.isAsset,
    required this.nibSize,
    required this.inkColor,
    required this.accentColor,
  });

  /// Contoh: 12000 -> "Rp 12.000"
  String get formattedPrice => formatRupiah(price);

  static String formatRupiah(int value) {
    final s = value.toString();
    final buffer = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buffer.write('.');
      buffer.write(s[i]);
    }
    return 'Rp $buffer';
  }
}

/// Dummy data: tepat 6 pulpen.
/// File gambar belum tersedia -> widget ProductImage otomatis memakai fallback.
const List<Product> dummyProducts = [
  Product(
    id: 1,
    name: 'Midnight Gel Pen',
    price: 12000,
    description:
        'Pulpen gel dengan tinta hitam pekat yang mengalir halus. Cepat kering, '
        'tidak mudah luntur, dan nyaman dipakai menulis berjam-jam.',
    rating: 4.8,
    imagePath: 'assets/images/pen1.png',
    isAsset: true,
    nibSize: '0.5 mm',
    inkColor: 'Hitam',
    accentColor: Color(0xFF1F2937),
  ),
  Product(
    id: 2,
    name: 'Ocean Fine Liner',
    price: 15000,
    description:
        'Fine liner berujung presisi untuk catatan rapi, sketsa, dan '
        'journaling. Warna biru lautnya tajam dan tahan air.',
    rating: 4.6,
    imagePath: 'assets/images/pen2.jpg',
    isAsset: true,
    nibSize: '0.4 mm',
    inkColor: 'Biru',
    accentColor: Color(0xFF2563EB),
  ),
  Product(
    id: 3,
    name: 'Classic Ballpoint',
    price: 8500,
    description:
        'Ballpoint klasik serbaguna untuk sekolah dan kantor. Ringan, '
        'awet, dan harganya bersahabat.',
    rating: 4.4,
    imagePath: 'assets/images/pen3.jpg',
    isAsset: true,
    nibSize: '0.7 mm',
    inkColor: 'Biru',
    accentColor: Color(0xFF3B82F6),
  ),
  Product(
    id: 4,
    name: 'Ruby Rollerball',
    price: 22000,
    description:
        'Rollerball dengan tinta cair berwarna merah rubi. Tulisan tegas '
        'dan mulus, cocok untuk koreksi maupun tanda tangan.',
    rating: 4.7,
    imagePath: 'assets/images/pen4.jpg',
    isAsset: true,
    nibSize: '0.5 mm',
    inkColor: 'Merah',
    accentColor: Color(0xFFDC2626),
  ),
  Product(
    id: 5,
    name: 'Emerald Fountain Pen',
    price: 45000,
    description:
        'Pulpen tinta klasik dengan badan hijau zamrud. Pengalaman menulis '
        'yang anggun dan berkelas, lengkap dengan cartridge tinta.',
    rating: 4.9,
    imagePath: 'assets/images/pen5.jpg',
    isAsset: true,
    nibSize: '0.38 mm',
    inkColor: 'Hijau',
    accentColor: Color(0xFF059669),
  ),
  Product(
    id: 6,
    name: 'Sunset Brush Pen',
    price: 18500,
    description:
        'Brush pen fleksibel untuk lettering dan kaligrafi modern. '
        'Warna oranye senja yang hangat dan mudah dibuat gradasi.',
    rating: 4.5,
    imagePath: 'assets/images/pen6.jpg',
    isAsset: true,
    nibSize: 'Brush 2 mm',
    inkColor: 'Oranye',
    accentColor: Color(0xFFEA580C),
  ),
];
