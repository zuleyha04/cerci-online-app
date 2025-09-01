import 'package:cerci_online/core/widgets/product_card.dart';
import 'package:cerci_online/core/widgets/secondary_appBar.dart';
import 'package:cerci_online/features/home/presentation/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatelessWidget {
  final String categoryName;
  const ProductListPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<HomeStore>();
    return Scaffold(
      appBar: SecondaryAppBar(title: categoryName, showBack: true),
      body:
          store.isLoading
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                padding: EdgeInsets.all(12.r),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 0.8,
                ),
                itemCount: store.products.length,
                itemBuilder: (context, index) {
                  final product = store.products[index];
                  return ProductCard(
                    product: product,
                    showFavorite: true,
                    showBestSeller: false,
                    onTap: () {
                      print("${product.name} detay sayfasına yönlendirilecek");
                    },
                  );
                },
              ),
    );
  }
}
