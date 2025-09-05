import 'package:cerci_online/features/home/presentation/store/home_store.dart';
import 'package:cerci_online/features/home/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchCategoriesPage extends StatelessWidget {
  const SearchCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeStore>(
      builder: (context, store, child) {
        if (store.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (store.error != null) {
          return Center(child: Text(store.error!));
        }
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 1.w,
            mainAxisSpacing: 1.h,
            childAspectRatio: 1,
          ),
          itemCount: store.categories.length,
          itemBuilder: (context, index) {
            final category = store.categories[index];
            return Padding(
              padding: const EdgeInsets.all(12),
              child: CategoryCard(category: category),
            );
          },
        );
      },
    );
  }
}
