import 'package:cerci_online/core/helpers/flushbar_helper.dart';
import 'package:cerci_online/features/cart/domain/entities/card_item.dart';
import 'package:cerci_online/features/cart/presentation/store/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;
  const CartItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final store = context.read<CartStore>();
    return Card(
      key: ValueKey(item.productId),
      color: Colors.white,
      elevation: 8,
      margin: EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.w),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.imageUrl,
                height: 100.h,
                width: 100.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      IconButton(
                        onPressed: () {
                          store.removeItem(item.productId);
                          FlushbarHelper.showSuccess(
                            context,
                            "Ürün sepetten kaldırıldı!",
                          );
                        },
                        icon: Icon(
                          Icons.delete_outline_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${item.price.toStringAsFixed(2)} ₺",
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          store.decreaseQuantity(item);
                        },
                        icon: Icon(Icons.remove),
                        color: Colors.amber,
                      ),
                      Text(item.quantity.toString()),
                      IconButton(
                        onPressed: () {
                          store.increaseQuantity(item);
                        },
                        icon: Icon(Icons.add),
                        color: Colors.amber,
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
