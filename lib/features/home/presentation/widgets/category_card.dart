import 'package:cerci_online/core/theme/app_colors.dart';
import 'package:cerci_online/features/home/domain/entities/category_item.dart';
import 'package:cerci_online/features/home/presentation/pages/product_list_page.dart';
import 'package:cerci_online/features/product/presentation/store/product_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  final CategoryItem category;
  final double? width;
  final EdgeInsets? padding;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.category,
    this.width,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final store = context.read<ProductStore>();

    return GestureDetector(
      onTap: () async {
        await store.fetchProductsByCategory(category.id);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductListPage(categoryName: category.name),
          ),
        );
      },
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: padding ?? EdgeInsets.all(8.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(category.iconUrl, width: 30.w, height: 30.h),
            SizedBox(height: 10.h),
            Text(
              category.name,
              style: TextStyle(fontSize: 10.sp),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
