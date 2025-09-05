import 'package:cerci_online/core/widgets/products/product_card.dart';
import 'package:cerci_online/features/product/presentation/pages/product_detail_page.dart';
import 'package:cerci_online/features/product/presentation/store/product_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchResultsPage extends StatelessWidget {
  const SearchResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductStore>(
      builder: (context, store, child) {
        if (store.searchResults.isNotEmpty) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.h,
              childAspectRatio: 0.8,
            ),
            itemCount: store.searchResults.length,
            itemBuilder: (context, index) {
              final product = store.searchResults[index];
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ProductCard(
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
                ),
              );
            },
          );
        } else {
          return Center(child: Text("Ürünn bulunamadı"));
        }
      },
    );
  }
}
