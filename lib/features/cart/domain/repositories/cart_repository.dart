import 'package:cerci_online/features/cart/domain/entities/card_item.dart';

abstract class CartRepository {
  Future<void> addToCart(CartItem item);
  Future<void> removeFromCart(String productId);
  Future<List<CartItem>> getCartItems();
  Future<double> getTotalPrice();
  Future<int> getTotalQuantity();
}
