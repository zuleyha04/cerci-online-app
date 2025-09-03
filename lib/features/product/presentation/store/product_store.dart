import 'package:cerci_online/features/product/domain/entities/product.dart';
import 'package:cerci_online/features/product/domain/usecases/get_best_seller.dart';
import 'package:cerci_online/features/product/domain/usecases/get_product_by_category.dart';
import 'package:cerci_online/features/product/domain/usecases/get_product_detail.dart';
import 'package:cerci_online/features/product/domain/usecases/get_product_list.dart';
import 'package:flutter/foundation.dart';

class ProductStore extends ChangeNotifier {
  final GetProductList _getProductList;
  final GetProductDetail _getProductDetail;
  final GetBestSeller _getBestSeller;
  final GetProductByCategory _getProductByCategory;

  ProductStore(
    this._getProductList,
    this._getProductDetail,
    this._getBestSeller,
    this._getProductByCategory,
  );

  List<Product> _products = [];
  List<Product> _bestSellers = [];
  Product? _selectedProduct;
  bool _isLoading = false;
  String? _error;

  List<Product> get products => _products;
  List<Product> get bestSellers => _bestSellers;
  Product? get selectedProduct => _selectedProduct;
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

  Future<void> fetchProducts() async {
    _startLoading();

    try {
      _products = await _getProductList();
    } catch (e) {
      _error = "Failed to load products: $e";
    }

    _endLoading();
  }

  Future<void> fetchProductDetails(String id) async {
    _startLoading();

    try {
      _selectedProduct = await _getProductDetail(id);
    } catch (e) {
      _error = "Failed to load product detail: $e";
    }

    _endLoading();
  }

  Future<void> fetchBestSellerProducts() async {
    _startLoading();

    try {
      _bestSellers = await _getBestSeller();
    } catch (e) {
      _error = "Failed to load best seller products: $e";
    }

    _endLoading();
  }

  Future<void> fetchProductsByCategory(String categoryId) async {
    _startLoading();

    try {
      _products = await _getProductByCategory(categoryId);
    } catch (e) {
      _error = "Failed to load products for this category: $e";
    }

    _endLoading();
  }
}
