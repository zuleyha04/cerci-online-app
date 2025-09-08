import 'package:cerci_online/features/product/presentation/widgets/product_card.dart';
import 'package:cerci_online/features/product/domain/entities/product.dart';
import 'package:cerci_online/features/product/presentation/pages/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerSection extends StatelessWidget {
  final List<Product> product;
  const BestSellerSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Text(
            "Çok Satanlar",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 220.h,
          child: ListView.separated(
            separatorBuilder: (_, _) => SizedBox(width: 5.w),
            itemCount: product.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductCard(
                product: product[index],
                showFavorite: true,
                showBestSeller: true,
                width: 145.w,
                height: 200.h,
                margin: EdgeInsets.only(right: 12.w),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) =>
                              ProductDetailPage(productId: product[index].id),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
