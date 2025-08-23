import 'package:cerci_online/features/home/domain/entities/banner_item.dart';
import 'package:cerci_online/features/home/domain/entities/category_item.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<BannerItem> banners;
  final List<CategoryItem> categories;

  const HomeLoaded({required this.banners, required this.categories});

  HomeLoaded copyWith({
    List<BannerItem>? banners,
    List<CategoryItem>? categories,
  }) {
    return HomeLoaded(
      banners: banners ?? this.banners,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [banners, categories];
}

class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
