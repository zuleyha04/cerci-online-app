import 'package:cerci_online/features/home/domain/entities/banner_item.dart';
import 'package:cerci_online/features/home/domain/repositories/banner_repository.dart';
import 'package:cerci_online/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final BannerRepository bannerRepository;

  HomeCubit(this.bannerRepository) : super(HomeInitial());

  Future<void> loadBanners() async {
    emit(HomeLoading());
    try {
      final List<BannerItem> banners = await bannerRepository.getBanners();
      emit(HomeLoaded(banners));
    } catch (e) {
      emit(HomeError("Failed to load banners"));
    }
  }
}
