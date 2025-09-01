import 'package:cerci_online/features/home/data/datasources/banner_local_data_source.dart';
import 'package:cerci_online/features/home/data/datasources/category_local_data_source.dart';
import 'package:cerci_online/features/home/data/datasources/product_local_data_source.dart';
import 'package:cerci_online/features/home/data/repositories/banner_repository_impl.dart';
import 'package:cerci_online/features/home/data/repositories/category_repository_impl.dart';
import 'package:cerci_online/features/home/data/repositories/product_repository_impl.dart';
import 'package:cerci_online/features/home/domain/repositories/banner_repository.dart';
import 'package:cerci_online/features/home/domain/repositories/category_repository.dart';
import 'package:cerci_online/features/home/domain/repositories/product_repository.dart';
import 'package:cerci_online/features/home/domain/usecases/get_products_by_category.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  _registerHome();
}

void _registerHome() {
  // DataSources
  sl.registerLazySingleton<BannerLocalDataSource>(
    () => BannerLocalDataSource(),
  );
  sl.registerLazySingleton<CategoryLocalDataSource>(
    () => CategoryLocalDataSource(),
  );
  sl.registerLazySingleton<ProductLocalDataSource>(
    () => ProductLocalDataSource(),
  );

  // Repositories
  sl.registerLazySingleton<BannerRepository>(
    () => BannerRepositoryImpl(sl<BannerLocalDataSource>()),
  );
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(sl<CategoryLocalDataSource>()),
  );
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl<ProductLocalDataSource>()),
  );

  //useCases
  sl.registerLazySingleton<GetProductsByCategory>(
    () => GetProductsByCategory(sl()),
  );
}
