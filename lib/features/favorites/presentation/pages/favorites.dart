import 'package:cerci_online/common/widgets/appBar/common_appBar.dart';
import 'package:cerci_online/features/product/presentation/widgets/product_card.dart';
import 'package:cerci_online/features/product/presentation/pages/product_detail_page.dart';
import 'package:cerci_online/features/product/presentation/store/product_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});
  // TODO: Şu an favoriler RAM’de tutuluyor.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Consumer<ProductStore>(
        builder: (context, store, child) {
          final favorites = store.favorites;
          if (favorites.isEmpty) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite),
                  SizedBox(height: 3.h),
                  Text("Henüz favorilere ürün eklemediniz !"),
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(12),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 0.8,
              ),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final product = favorites[index];
                return ProductCard(
                  product: product,
                  showFavorite: true,
                  showBestSeller: false,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => ProductDetailPage(productId: product.id),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
