import 'package:cerci_online/core/theme/app_colors.dart';
import 'package:cerci_online/features/product/presentation/store/product_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductImageSection extends StatelessWidget {
  final String imageUrl;
  final String productId;
  const ProductImageSection({
    super.key,
    required this.imageUrl,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imageUrl,
          height: 300.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 16,
          right: 16,
          child: Consumer<ProductStore>(
            builder: (context, store, child) {
              final isFav = store.isFavorite(productId);
              return CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.9),
                radius: 16,
                child: IconButton(
                  icon: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    size: 18,
                    color: isFav ? AppColors.primary : Colors.black,
                  ),
                  onPressed: () {
                    final product = store.selectedProduct;
                    if (product != null) {
                      store.toggleFavorite(product);
                    }
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
