import 'package:cerci_online/common/widgets/appBar/common_app_bar.dart';
import 'package:cerci_online/features/cart/presentation/store/cart_store.dart';
import 'package:cerci_online/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:cerci_online/features/cart/presentation/widgets/cart_total_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CartStore>().loadCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Consumer<CartStore>(
        builder: (context, store, child) {
          if (store.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (store.error != null) {
            return Center(child: Text(store.error!));
          }
          if (store.items.isEmpty) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_basket),
                  SizedBox(height: 3.h),
                  Text("Sepetiniz boş !"),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: store.items.length,
                  itemBuilder:
                      (context, index) =>
                          CartItemCard(item: store.items[index]),
                ),
              ),
              const CartTotalSection(),
            ],
          );
        },
      ),
    );
  }
}
