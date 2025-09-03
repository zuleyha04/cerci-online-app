import 'package:cerci_online/core/widgets/appBar/common_appBar.dart';
import 'package:cerci_online/features/home/presentation/store/home_store.dart';
import 'package:cerci_online/features/home/presentation/widgets/banner_slider.dart';
import 'package:cerci_online/features/home/presentation/widgets/best_seller_section.dart';
import 'package:cerci_online/features/home/presentation/widgets/category_list.dart';
import 'package:cerci_online/features/product/presentation/store/product_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeStore = context.read<HomeStore>();
    final productStore = context.read<ProductStore>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeStore.loadAll();
      productStore.fetchBestSellerProducts();
    });

    return Scaffold(
      appBar: CommonAppBar(),
      body: ListView(
        padding: EdgeInsets.all(12.w),
        children: [
          Consumer<HomeStore>(
            builder: (context, store, child) {
              if (store.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (store.error != null) {
                return Center(child: Text(store.error!));
              }
              return Column(
                children: [
                  BannerSlider(banners: store.banners),
                  SizedBox(height: 6.h),
                  CategoryList(categories: store.categories),
                ],
              );
            },
          ),
          SizedBox(height: 6.h),
          Consumer<ProductStore>(
            builder: (context, store, child) {
              if (store.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (store.error != null) {
                return Center(child: Text(store.error!));
              } else {
                return BestSellerSection(product: store.bestSellers);
              }
            },
          ),
        ],
      ),
    );
  }
}
