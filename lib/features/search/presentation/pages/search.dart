import 'package:cerci_online/common/widgets/appBar/common_app_bar.dart';
import 'package:cerci_online/features/product/presentation/store/product_store.dart';
import 'package:cerci_online/features/search/presentation/widgets/search_categories_page.dart';
import 'package:cerci_online/features/search/presentation/widgets/search_results_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Aradığınız ürünün adını yazın",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  onChanged: (value) {
                    context.read<ProductStore>().searchProducts(value);
                  },
                ),
              ),

              SizedBox(height: 15.h),

              Expanded(
                child: Consumer<ProductStore>(
                  builder: (context, store, child) {
                    if (store.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!store.isSearching) {
                      return SearchCategoriesPage();
                    }
                    return SearchResultsPage();
                  },
                ),
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
