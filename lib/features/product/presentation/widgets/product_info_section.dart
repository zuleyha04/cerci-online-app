import 'package:cerci_online/features/product/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInfoSection extends StatelessWidget {
  final Product product;
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  const ProductInfoSection({
    super.key,
    required this.product,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (quantity > 1) onQuantityChanged(quantity - 1);
                    },
                    icon: Icon(Icons.remove_circle_outline),
                    color: Colors.amber,
                  ),
                  Text("$quantity", style: TextStyle(fontSize: 16.sp)),
                  IconButton(
                    onPressed: () => onQuantityChanged(quantity + 1),
                    icon: Icon(Icons.add_circle_outline),
                    color: Colors.amber,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            product.description ?? '',
            style: TextStyle(fontSize: 15.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
