import 'package:cerci_online/core/helpers/top_snackbar_helper.dart';
import 'package:cerci_online/core/theme/app_colors.dart';
import 'package:cerci_online/features/cart/domain/entities/card_item.dart';
import 'package:cerci_online/features/cart/presentation/store/cart_store.dart';
import 'package:cerci_online/features/product/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductBottomBar extends StatelessWidget {
  final Product product;
  final int quantity;
  final bool isActive;
  const ProductBottomBar({
    super.key,
    required this.product,
    required this.quantity,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final totalPrice = product.price * quantity;
    final totalOldPrice =
        product.oldPrice != null ? product.oldPrice! * quantity : null;
    return Container(
      height: 80.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "₺${totalPrice.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              if (totalOldPrice != null)
                Text(
                  "₺${totalOldPrice.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 12.sp,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
            ],
          ),
          //TODO:daha sonra özelleştirilecek
          ElevatedButton(
            onPressed:
                isActive
                    ? () {
                      final cartStore = context.read<CartStore>();

                      cartStore.addItem(
                        CartItem(
                          productId: product.id,
                          name: product.name,
                          price: product.price,
                          quantity: quantity,
                          imageUrl: product.imageUrl,
                        ),
                      );
                      print("${product.name} sepete eklendi");
                      TopSnackbarHelper.showSuccess(
                        context,
                        "Ürün sepete eklendi !",
                      );
                    }
                    : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: isActive ? AppColors.primary : Colors.grey,
              padding: EdgeInsets.symmetric(horizontal: 72.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              isActive ? "Sepete Ekle" : "Stokta Yok",
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
