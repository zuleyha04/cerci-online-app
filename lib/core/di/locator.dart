import 'package:cerci_online/core/utils/json_loader.dart';
import 'package:cerci_online/features/home/data/datasources/banner_local_data_source.dart';
import 'package:cerci_online/features/home/data/datasources/category_local_data_source.dart';
import 'package:cerci_online/features/home/data/repositories/banner_repository_impl.dart';
import 'package:cerci_online/features/home/data/repositories/category_repository_impl.dart';
import 'package:cerci_online/features/home/domain/repositories/banner_repository.dart';
import 'package:cerci_online/features/home/domain/repositories/category_repository.dart';
import 'package:cerci_online/features/product/data/datasources/product_remote_datasource.dart';
import 'package:cerci_online/features/product/data/repositories/favorite_repository_impl.dart';
import 'package:cerci_online/features/product/data/repositories/product_repository_impl.dart';
import 'package:cerci_online/features/product/domain/repositories/favorite_repository.dart';
import 'package:cerci_online/features/product/domain/repositories/product_repository.dart';
import 'package:cerci_online/features/product/domain/usecases/favorite/get_favorites.dart';
import 'package:cerci_online/features/product/domain/usecases/favorite/is_favorite.dart';
import 'package:cerci_online/features/product/domain/usecases/favorite/toggle_favorite.dart';
import 'package:cerci_online/features/product/domain/usecases/product/get_best_seller.dart';
import 'package:cerci_online/features/product/domain/usecases/product/get_product_by_category.dart';
import 'package:cerci_online/features/product/domain/usecases/product/get_product_detail.dart';
import 'package:cerci_online/features/product/domain/usecases/product/get_product_list.dart';
import 'package:cerci_online/features/product/domain/usecases/search/search_products.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  _registerHome();
  _registerProduct();
}

void _registerHome() {
  // DataSources
  sl.registerLazySingleton<BannerLocalDataSource>(
    () => BannerLocalDataSource(),
  );
  sl.registerLazySingleton<CategoryLocalDataSource>(
    () => CategoryLocalDataSource(),
  );

  // Repositories
  sl.registerLazySingleton<BannerRepository>(
    () => BannerRepositoryImpl(sl<BannerLocalDataSource>()),
  );
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(sl<CategoryLocalDataSource>()),
  );
}

void _registerProduct() {
  // Utils
  sl.registerLazySingleton<JsonLoader>(() => JsonLoader());

  // DataSources
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceMock(sl<JsonLoader>()),
  );

  // Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl<ProductRemoteDataSource>()),
  );
  sl.registerLazySingleton<FavoriteRepository>(() => FavoriteRepositoryImpl());

  // UseCases
  sl.registerLazySingleton<GetProductList>(() => GetProductList(sl()));
  sl.registerLazySingleton<GetProductDetail>(() => GetProductDetail(sl()));
  sl.registerLazySingleton<GetBestSeller>(() => GetBestSeller(sl()));
  sl.registerLazySingleton<GetProductByCategory>(
    () => GetProductByCategory(sl()),
  );

  sl.registerLazySingleton<GetFavorites>(() => GetFavorites(sl()));
  sl.registerLazySingleton<IsFavorite>(() => IsFavorite(sl()));
  sl.registerLazySingleton<ToggleFavorite>(() => ToggleFavorite(sl()));

  sl.registerLazySingleton<SearchProducts>(() => SearchProducts(sl()));
}
