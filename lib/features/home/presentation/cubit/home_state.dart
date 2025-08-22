import 'package:cerci_online/features/home/domain/entities/banner_item.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<BannerItem> banners;
  HomeLoaded(this.banners);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
