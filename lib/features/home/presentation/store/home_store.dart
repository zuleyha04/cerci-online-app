import 'package:cerci_online/features/home/domain/entities/banner_item.dart';
import 'package:cerci_online/features/home/domain/entities/category_item.dart';
import 'package:cerci_online/features/home/domain/usecases/get_banners.dart';
import 'package:cerci_online/features/home/domain/usecases/get_categories.dart';
import 'package:flutter/material.dart';

class HomeStore extends ChangeNotifier {
  final GetBanners _getBanners;
  final GetCategories _getCategories;

  HomeStore(this._getBanners, this._getCategories);

  List<BannerItem> _banners = [];
  List<CategoryItem> _categories = [];
  bool _isLoading = false;
  String? _error;

  List<BannerItem> get banners => _banners;
  List<CategoryItem> get categories => _categories;
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
      _banners = await _getBanners();
    } catch (e) {
      _error = "Failed to load banners";
    }

    _endLoading();
  }

  Future<void> loadCategories() async {
    _startLoading();

    try {
      _categories = await _getCategories();
    } catch (e) {
      _error = "Failed to load categories";
    }

    _endLoading();
  }

  Future<void> loadAll() async {
    _startLoading();

    try {
      _banners = await _getBanners();
      _categories = await _getCategories();
    } catch (e) {
      _error = "Failed to load data";
    }

    _endLoading();
  }
}
