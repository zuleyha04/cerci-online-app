import 'package:cerci_online/core/di/locator.dart';
import 'package:cerci_online/features/cart/presentation/store/cart_store.dart';
import 'package:cerci_online/features/home/presentation/store/home_store.dart';
import 'package:cerci_online/features/product/presentation/store/product_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<Widget> appInitializer(Widget app) async {
  await setupLocator();

  return MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: sl<HomeStore>()),
      ChangeNotifierProvider.value(value: sl<ProductStore>()),
      ChangeNotifierProvider.value(value: sl<CartStore>()),
    ],
    child: app,
  );
}
