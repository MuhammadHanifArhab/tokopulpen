import 'package:flutter/material.dart';

import '../models/product_model.dart';

/// Menampilkan gambar produk dengan fallback aman:
/// bila asset/network gagal dimuat, tampil placeholder berwarna + ikon pulpen.
class ProductImage extends StatelessWidget {
  final Product product;
  final BoxFit fit;
  final double iconSize;

  const ProductImage({
    super.key,
    required this.product,
    this.fit = BoxFit.cover,
    this.iconSize = 56,
  });

  @override
  Widget build(BuildContext context) {
    if (product.imagePath.isEmpty) return _placeholder();

    if (product.isAsset) {
      return Image.asset(
        product.imagePath,
        fit: fit,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) => _placeholder(),
      );
    }

    return Image.network(
      product.imagePath,
      fit: fit,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) => _placeholder(),
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return _placeholder();
      },
    );
  }

  Widget _placeholder() {
    final Color bg = Color.lerp(product.accentColor, Colors.white, 0.82)!;
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: bg,
      alignment: Alignment.center,
      child: Icon(Icons.edit_rounded, size: iconSize, color: product.accentColor),
    );
  }
}
