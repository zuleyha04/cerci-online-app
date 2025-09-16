import 'package:cerci_online/features/product/data/datasources/product_remote_data_source.dart';
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
import 'package:cerci_online/features/product/presentation/store/product_store.dart';
import 'package:get_it/get_it.dart';

void registerProduct(GetIt sl) {
  // DataSources
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceMock(),
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

  //store
  sl.registerLazySingleton(
    () => ProductStore(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()),
  );
}
