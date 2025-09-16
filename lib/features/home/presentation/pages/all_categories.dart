import 'package:cerci_online/common/widgets/appBar/secondary_app_bar.dart';
import 'package:cerci_online/features/home/domain/entities/category_item.dart';
import 'package:cerci_online/features/home/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCategoriesPage extends StatelessWidget {
  final List<CategoryItem> categories;
  const AllCategoriesPage({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(title: "Tüm Kategoriler", showBack: true),
      body: Padding(
        padding: EdgeInsets.all(12.r),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return CategoryCard(
              category: category,
              padding: EdgeInsets.all(12),
            );
          },
        ),
      ),
    );
  }
}
