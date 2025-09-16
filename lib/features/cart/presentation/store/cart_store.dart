import 'package:cerci_online/features/cart/domain/entities/card_item.dart';
import 'package:cerci_online/features/cart/domain/usecases/add_to_cart.dart';
import 'package:cerci_online/features/cart/domain/usecases/get_cart_items.dart';
import 'package:cerci_online/features/cart/domain/usecases/get_total_price.dart';
import 'package:cerci_online/features/cart/domain/usecases/get_total_quantity.dart';
import 'package:cerci_online/features/cart/domain/usecases/remove_from_cart.dart';
import 'package:flutter/widgets.dart';

class CartStore extends ChangeNotifier {
  final AddToCart _addToCartUseCase;
  final GetCartItems _getCartItemsUseCase;
  final GetTotalPrice _getCartTotalPriceUseCase;
  final GetTotalQuantity _getCartTotalQuantityUseCase;
  final RemoveFromCart _removeFromCartUseCase;

  CartStore(
    this._addToCartUseCase,
    this._getCartItemsUseCase,
    this._getCartTotalPriceUseCase,
    this._getCartTotalQuantityUseCase,
    this._removeFromCartUseCase,
  );

  List<CartItem> _items = [];
  double _totalPrice = 0;
  int _totalQuantity = 0;
  bool _isLoading = false;
  String? _error;

  List<CartItem> get items => _items;
  double get totalPrice => _totalPrice;
  int get totalQuantity => _totalQuantity;
  bool get isLoading => _isLoading;
  String? get error => _error;

  void _startLoading() {
    _isLoading = true;
    _error = null;
    notifyListeners();
  }

  void _endLoading() {
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadCart() async {
    _startLoading();
    try {
      _items = await _getCartItemsUseCase();
      _totalPrice = await _getCartTotalPriceUseCase();
      _totalQuantity = await _getCartTotalQuantityUseCase();
    } catch (e) {
      _error = "Failed to load the cart. Please try again.";
    }
    _endLoading();
  }

  Future<void> addItem(CartItem item) async {
    _startLoading();

    try {
      await _addToCartUseCase(item);
      await loadCart();
    } catch (e) {
      _error = "Failed to add item to the cart. Please try again.";
    }
    _endLoading();
  }

  Future<void> removeItem(String productId) async {
    _startLoading();
    try {
      await _removeFromCartUseCase(productId);
      await loadCart();
    } catch (e) {
      _error = "Failed to remove item from the cart. Please try again.";
    }
    _endLoading();
  }

  Future<void> increaseQuantity(CartItem item) async {
    _startLoading();

    try {
      await _addToCartUseCase(
        CartItem(
          productId: item.productId,
          name: item.name,
          price: item.price,
          quantity: 1,
          imageUrl: item.imageUrl,
        ),
      );
      await loadCart();
    } catch (e) {
      _error = "Failed to increase item quantity.";
    }
    _endLoading();
  }

  Future<void> decreaseQuantity(CartItem item) async {
    _startLoading();

    try {
      if (item.quantity > 1) {
        await _addToCartUseCase(
          CartItem(
            productId: item.productId,
            name: item.name,
            price: item.price,
            quantity: -1,
            imageUrl: item.imageUrl,
          ),
        );
      }
      await loadCart();
    } catch (e) {
      _error = "Failed to decrease item quantity.";
    }
    _endLoading();
  }
}
