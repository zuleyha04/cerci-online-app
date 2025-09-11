import 'package:cerci_online/common/widgets/appBar/secondary_appBar.dart';
import 'package:cerci_online/features/product/presentation/store/product_store.dart';
import 'package:cerci_online/features/product/presentation/widgets/product_bottom_bar.dart';
import 'package:cerci_online/features/product/presentation/widgets/product_image_section.dart';
import 'package:cerci_online/features/product/presentation/widgets/product_info_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductStore>().fetchProductDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductStore>(
      builder: (context, store, child) {
        if (store.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (store.error != null) {
          return Center(child: Text(store.error!));
        } else if (store.selectedProduct == null) {
          return Center(child: Text("Product not found"));
        }
        final product = store.selectedProduct!;

        return Scaffold(
          appBar: SecondaryAppBar(title: '', showBack: true),
          body: Column(
            children: [
              ProductImageSection(
                imageUrl: product.imageUrl,
                productId: product.id,
              ),
              Expanded(
                child: ProductInfoSection(
                  product: product,
                  quantity: quantity,
                  onQuantityChanged: (newQuantity) {
                    setState(() {
                      quantity = newQuantity;
                    });
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: ProductBottomBar(
            product: product,
            quantity: quantity,
            isActive: product.stock > 0,
          ),
        );
      },
    );
  }
}
