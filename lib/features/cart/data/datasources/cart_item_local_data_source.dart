import 'package:cerci_online/features/cart/data/models/cart_item_model.dart';

abstract class CartItemDataSource {
  Future<List<CartItemModel>> fetchCart();
  Future<void> addItem(CartItemModel item);
  Future<void> removeItem(String productId);
}

class CartItemLocalDataSource implements CartItemDataSource {
  //şimdilik Ram'de
  final List<CartItemModel> _cache = [];

  @override
  Future<List<CartItemModel>> fetchCart() async {
    return _cache;
  }

  @override
  Future<void> addItem(CartItemModel item) async {
    final index = _cache.indexWhere((i) => i.productId == item.productId);

    if (index >= 0) {
      final existing = _cache[index];
      _cache[index] = CartItemModel(
        productId: existing.productId,
        name: existing.name,
        price: existing.price,
        quantity: existing.quantity + item.quantity,
        imageUrl: existing.imageUrl,
      );
    } else {
      _cache.add(item);
    }
  }

  @override
  Future<void> removeItem(String productId) async {
    _cache.removeWhere((i) => i.productId == productId);
  }
}
