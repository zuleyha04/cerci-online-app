import 'package:cerci_online/core/theme/app_colors.dart';
import 'package:cerci_online/features/home/domain/entities/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCategoriesPage extends StatelessWidget {
  final List<CategoryItem> categories;
  const AllCategoriesPage({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO:AppBar'ı özelleştir, CommonWidget haline getir
      appBar: AppBar(
        title: Text("Tüm Kategoriler"),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
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
            //TODO: CategoryList ile tekrar ediyor. ortak bir CommonWidget haline getir ve çağır.
            return GestureDetector(
              onTap: () {
                print("${category.name} seçildi");
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(category.iconUrl, width: 30.w, height: 30.h),
                    SizedBox(height: 10.h),
                    Text(
                      category.name,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
