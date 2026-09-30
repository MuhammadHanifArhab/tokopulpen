import 'package:flutter/material.dart';

import '../constants/app_fonts.dart';
import '../models/product_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/product_image.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;
  bool _isAdding = false;

  Product get product => widget.product;

  void _increment() => setState(() => _quantity++);

  void _decrement() {
    if (_quantity > 1) setState(() => _quantity--);
  }

  Future<void> _addToCart() async {
    setState(() => _isAdding = true);
    await Future.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;
    setState(() => _isAdding = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$_quantity x ${product.name} ditambahkan ke keranjang'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _buyNow() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Pesanan ${product.name} (x$_quantity) - ${Product.formatRupiah(product.price * _quantity)}'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        title: Text('Detail Produk', style: AppTextStyles.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: Hero(
                  tag: 'product-image-${product.id}',
                  child: ProductImage(product: product, iconSize: 96),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(product.name, style: AppTextStyles.title),
                ),
                const SizedBox(width: 12),
                _RatingBadge(rating: product.rating),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              product.formattedPrice,
              style: AppTextStyles.price.copyWith(fontSize: 22),
            ),
            const SizedBox(height: 20),
            Text('Deskripsi', style: AppTextStyles.subtitle),
            const SizedBox(height: 6),
            Text(product.description, style: AppTextStyles.body),
            const SizedBox(height: 20),
            Text('Spesifikasi', style: AppTextStyles.subtitle),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 8,
              children: [
                _SpecChip(
                  icon: Icons.edit_rounded,
                  label: 'Nib: ${product.nibSize}',
                ),
                _SpecChip(
                  icon: Icons.circle,
                  iconColor: product.accentColor,
                  label: 'Tinta: ${product.inkColor}',
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Text('Jumlah', style: AppTextStyles.subtitle),
                const Spacer(),
                _QuantitySelector(
                  quantity: _quantity,
                  onIncrement: _increment,
                  onDecrement: _decrement,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.surface,
          boxShadow: [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 12,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text('Total', style: AppTextStyles.caption),
                    const Spacer(),
                    Text(
                      Product.formatRupiah(product.price * _quantity),
                      style: AppTextStyles.price,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: CustomTonalButton(
                        text: 'Keranjang',
                        icon: Icons.add_shopping_cart_rounded,
                        isLoading: _isAdding,
                        onPressed: _addToCart,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomGoogleButton(
                        text: 'Beli Sekarang',
                        onPressed: _isAdding ? null : _buyNow,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RatingBadge extends StatelessWidget {
  final double rating;

  const _RatingBadge({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF3C7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star_rounded, size: 18, color: AppColors.accent),
          const SizedBox(width: 4),
          Text(
            rating.toStringAsFixed(1),
            style: AppTextStyles.subtitle.copyWith(fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _SpecChip extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String label;

  const _SpecChip({required this.icon, required this.label, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 16, color: iconColor ?? AppColors.primary),
      label: Text(label, style: AppTextStyles.caption.copyWith(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w500,
      )),
      backgroundColor: AppColors.surface,
      side: const BorderSide(color: AppColors.border),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}

class _QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const _QuantitySelector({
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove_rounded),
            color: quantity > 1 ? AppColors.primary : AppColors.disabled,
            onPressed: quantity > 1 ? onDecrement : null,
          ),
          SizedBox(
            width: 32,
            child: Text(
              '$quantity',
              textAlign: TextAlign.center,
              style: AppTextStyles.subtitle,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add_rounded),
            color: AppColors.primary,
            onPressed: onIncrement,
          ),
        ],
      ),
    );
  }
}
