import 'package:cerci_online/core/widgets/secondary_appBar.dart';
import 'package:cerci_online/features/home/presentation/store/home_store.dart';
import 'package:flutter/material.dart';
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
              //TODO:Grid ile ürünler cart halinde listelenecek.
              : ListView.builder(
                itemCount: store.products.length,
                itemBuilder: (_, i) {
                  final product = store.products[i];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text("${product.price} ₺"),
                  );
                },
              ),
    );
  }
}
