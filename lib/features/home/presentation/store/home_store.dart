import 'package:cerci_online/features/home/domain/entities/banner_item.dart';
import 'package:cerci_online/features/home/domain/entities/category_item.dart';
import 'package:cerci_online/features/home/domain/entities/product_item.dart';
import 'package:cerci_online/features/home/domain/repositories/banner_repository.dart';
import 'package:cerci_online/features/home/domain/repositories/category_repository.dart';
import 'package:cerci_online/features/home/domain/repositories/product_repository.dart';
import 'package:flutter/material.dart';

class HomeStore extends ChangeNotifier {
  final BannerRepository bannerRepository;
  final CategoryRepository categoryRepository;
  final ProductRepository productRepository;

  HomeStore(
    this.bannerRepository,
    this.categoryRepository,
    this.productRepository,
  );

  List<BannerItem> _banners = [];
  List<CategoryItem> _categories = [];
  List<ProductItem> _bestSellers = [];
  bool _isLoading = false;
  String? _error;

  List<BannerItem> get banners => _banners;
  List<CategoryItem> get categories => _categories;
  List<ProductItem> get bestSellers => _bestSellers;
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

  Future<void> loadBanners() async {
    _startLoading();

    try {
      _banners = await bannerRepository.getBanners();
    } catch (e) {
      _error = "Failed to load banners";
    }

    _endLoading();
  }

  Future<void> loadCategories() async {
    _startLoading();

    try {
      _categories = await categoryRepository.getCategories();
    } catch (e) {
      _error = "Failed to load categories";
    }

    _endLoading();
  }

  Future<void> loadBestSellerProducts() async {
    _startLoading();

    try {
      _bestSellers = await productRepository.getBestSellerProducts();
    } catch (e) {
      _error = "Failed to load best seller products";
    }

    _endLoading();
  }

  Future<void> loadAll() async {
    _startLoading();

    try {
      _banners = await bannerRepository.getBanners();
      _categories = await categoryRepository.getCategories();
      _bestSellers = await productRepository.getBestSellerProducts();
    } catch (e) {
      _error = "Failed to load data";
    }

    _endLoading();
  }
}
