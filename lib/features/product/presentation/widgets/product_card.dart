import 'package:cerci_online/core/helpers/top_snackbar_helper.dart';
import 'package:cerci_online/core/theme/app_colors.dart';
import 'package:cerci_online/features/cart/domain/entities/card_item.dart';
import 'package:cerci_online/features/cart/presentation/store/cart_store.dart';
import 'package:cerci_online/features/product/domain/entities/product.dart';
import 'package:cerci_online/features/product/presentation/store/product_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool showFavorite;
  final bool showBestSeller;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.showFavorite,
    required this.showBestSeller,
    this.width,
    this.height,
    this.margin,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(4, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.network(
                      product.imageUrl,
                      height: 140.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (showFavorite)
                    Positioned(
                      top: 5,
                      right: 5,
                      child: Consumer<ProductStore>(
                        builder: (context, store, child) {
                          final isFav = store.isFavorite(product.id);
                          return GestureDetector(
                            onTap: () => store.toggleFavorite(product),
                            child: CircleAvatar(
                              backgroundColor: Colors.white.withOpacity(0.9),
                              radius: 16,
                              child: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                size: 18,
                                color: isFav ? AppColors.primary : Colors.black,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "₺ ${product.price.toStringAsFixed(2)}",
                        style: const TextStyle(color: AppColors.textPrimary),
                      ),
                      IconButton(
                        onPressed: () {
                          //TODO:Başarılıysa flashbar göster
                          final cartStore = context.read<CartStore>();

                          cartStore.addItem(
                            CartItem(
                              productId: product.id,
                              name: product.name,
                              price: product.price,
                              imageUrl: product.imageUrl,
                            ),
                          );
                          TopSnackbarHelper.showSuccess(
                            context,
                            "Ürün sepete eklendi !",
                          );

                          print("sepete eklendi");
                        },
                        icon: const Icon(Icons.add, size: 18),
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          minimumSize: Size(30.w, 30.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
