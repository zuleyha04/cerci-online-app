import 'package:cerci_online/core/theme/app_colors.dart';
import 'package:cerci_online/features/home/domain/entities/category_item.dart';
import 'package:cerci_online/features/home/presentation/pages/all_categories.dart';
import 'package:cerci_online/features/home/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryItem> categories;

  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Kategoriler",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AllCategoriesPage(categories: categories),
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 15.sp,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 90.h,
          child: ListView.separated(
            separatorBuilder: (_, _) => SizedBox(width: 10.w),
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final category = categories[index];
              return CategoryCard(
                category: category,
                width: 80.w,
                padding: EdgeInsets.all(8.r),
              );
            },
          ),
        ),
      ],
    );
  }
}
