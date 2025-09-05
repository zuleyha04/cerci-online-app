import 'package:cerci_online/features/product/domain/entities/product.dart';
import 'package:cerci_online/features/product/domain/usecases/favorite/get_favorites.dart';
import 'package:cerci_online/features/product/domain/usecases/favorite/is_favorite.dart';
import 'package:cerci_online/features/product/domain/usecases/favorite/toggle_favorite.dart';
import 'package:cerci_online/features/product/domain/usecases/product/get_best_seller.dart';
import 'package:cerci_online/features/product/domain/usecases/product/get_product_by_category.dart';
import 'package:cerci_online/features/product/domain/usecases/product/get_product_detail.dart';
import 'package:cerci_online/features/product/domain/usecases/product/get_product_list.dart';
import 'package:cerci_online/features/product/domain/usecases/search/search_products.dart';
import 'package:flutter/foundation.dart';

class ProductStore extends ChangeNotifier {
  final GetProductList _getProductList;
  final GetProductDetail _getProductDetail;
  final GetBestSeller _getBestSeller;
  final GetProductByCategory _getProductByCategory;
  final GetFavorites _getFavorites;
  final IsFavorite _isFavorite;
  final ToggleFavorite _toggleFavorite;
  final SearchProducts _searchProducts;

  ProductStore(
    this._getProductList,
    this._getProductDetail,
    this._getBestSeller,
    this._getProductByCategory,
    this._getFavorites,
    this._isFavorite,
    this._toggleFavorite,
    this._searchProducts,
  );

  List<Product> _products = [];
  List<Product> _bestSellers = [];
  List<Product> _searchResults = [];
  Product? _selectedProduct;
  bool _isSearching = false;
  bool _isLoading = false;
  String? _error;

  List<Product> get products => _products;
  List<Product> get bestSellers => _bestSellers;
  Product? get selectedProduct => _selectedProduct;
  List<Product> get favorites => _getFavorites();
  List<Product> get searchResults => _searchResults;
  bool isFavorite(String productId) => _isFavorite(productId);
  bool get isSearching => _isSearching;
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

  Future<void> toggleFavorite(Product product) async {
    await _toggleFavorite(product);
    notifyListeners();
  }

  Future<void> searchProducts(String keyword) async {
    if (keyword.isEmpty) {
      _isSearching = false;
      notifyListeners();
      return;
    }

    _isSearching = true;
    _startLoading();
    try {
      _searchResults = await _searchProducts(keyword);
    } catch (e) {
      _error = "Failed to search products: $e";
    }
    _endLoading();
  }
}
