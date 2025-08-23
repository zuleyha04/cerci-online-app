import 'package:cerci_online/features/home/domain/entities/banner_item.dart';
import 'package:cerci_online/features/home/domain/entities/category_item.dart';
import 'package:cerci_online/features/home/domain/repositories/banner_repository.dart';
import 'package:cerci_online/features/home/domain/repositories/category_repository.dart';
import 'package:cerci_online/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final BannerRepository bannerRepository;
  final CategoryRepository categoryRepository;

  HomeCubit(this.bannerRepository, this.categoryRepository)
    : super(HomeInitial());

  Future<void> loadBanners() async {
    emit(HomeLoading());
    try {
      final List<BannerItem> banners = await bannerRepository.getBanners();
      emit(HomeLoaded(banners: banners, categories: []));
    } catch (e) {
      emit(HomeError("Failed to load banners"));
    }
  }

  Future<void> loadCategories() async {
    emit(HomeLoading());
    try {
      final List<CategoryItem> categories =
          await categoryRepository.getCategories();
      emit(HomeLoaded(banners: [], categories: categories));
    } catch (e) {
      emit(HomeError("Failed to load categories"));
    }
  }

  Future<void> loadAll() async {
    emit(HomeLoading());
    try {
      final banners = await bannerRepository.getBanners();
      final categories = await categoryRepository.getCategories();
      emit(HomeLoaded(banners: banners, categories: categories));
    } catch (e) {
      emit(HomeError("Failed to load data"));
    }
  }
}
