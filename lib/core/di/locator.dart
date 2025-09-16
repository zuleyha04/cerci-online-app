import 'package:cerci_online/features/cart/di/cart_injection.dart';
import 'package:cerci_online/features/home/di/home_injection.dart';
import 'package:cerci_online/features/product/di/product_injection.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  registerHome(sl);
  registerProduct(sl);
  registerCart(sl);
}
