import 'package:cerci_online/core/theme/app_colors.dart';
import 'package:cerci_online/features/home/domain/entities/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return GestureDetector(
      onTap: onTap ?? () => print("${category.name} seçildi !"),
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
