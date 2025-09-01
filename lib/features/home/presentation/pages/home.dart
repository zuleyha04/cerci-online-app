import 'package:cerci_online/core/widgets/common_appBar.dart';
import 'package:cerci_online/features/home/presentation/store/home_store.dart';
import 'package:cerci_online/features/home/presentation/widgets/banner_slider.dart';
import 'package:cerci_online/features/home/presentation/widgets/best_seller_section.dart';
import 'package:cerci_online/features/home/presentation/widgets/category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Consumer<HomeStore>(
        builder: (context, store, child) {
          if (store.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (store.error != null) {
            return Center(child: Text(store.error!));
          } else {
            return ListView(
              padding: EdgeInsets.all(12),
              children: [
                BannerSlider(banners: store.banners),
                SizedBox(height: 16.h),
                CategoryList(categories: store.categories),
                SizedBox(height: 8.h),
                BestSellerSection(product: store.bestSellers),
                SizedBox(height: 10.h),
              ],
            );
          }
        },
      ),
    );
  }
}
