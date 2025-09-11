import 'package:cerci_online/features/cart/data/datasources/cart_item_local_data_source.dart';
import 'package:cerci_online/features/cart/data/models/cart_item_model.dart';
import 'package:cerci_online/features/cart/domain/entities/card_item.dart';
import 'package:cerci_online/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartItemDataSource datasource;
  CartRepositoryImpl(this.datasource);

  @override
  Future<void> addToCart(CartItem item) async {
    final model = CartItemModel.fromEntity(item);
    await datasource.addItem(model);
  }

  @override
  Future<List<CartItem>> getCartItems() async {
    final models = await datasource.fetchCart();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<double> getTotalPrice() async {
    final models = await datasource.fetchCart();
    return models.fold<double>(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }

  @override
  Future<int> getTotalQuantity() async {
    final models = await datasource.fetchCart();
    return models.fold<int>(0, (sum, item) => sum + item.quantity);
  }

  @override
  Future<void> removeFromCart(String productId) {
    return datasource.removeItem(productId);
  }
}
