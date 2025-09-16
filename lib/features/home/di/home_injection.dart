import 'package:cerci_online/features/home/data/datasources/banner_local_data_source.dart';
import 'package:cerci_online/features/home/data/datasources/category_local_data_source.dart';
import 'package:cerci_online/features/home/data/repositories/banner_repository_impl.dart';
import 'package:cerci_online/features/home/data/repositories/category_repository_impl.dart';
import 'package:cerci_online/features/home/domain/repositories/banner_repository.dart';
import 'package:cerci_online/features/home/domain/repositories/category_repository.dart';
import 'package:cerci_online/features/home/domain/usecases/get_banners.dart';
import 'package:cerci_online/features/home/domain/usecases/get_categories.dart';
import 'package:cerci_online/features/home/presentation/store/home_store.dart';
import 'package:get_it/get_it.dart';

void registerHome(GetIt sl) {
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

  //usecase
  sl.registerLazySingleton<GetBanners>(() => GetBanners(sl()));
  sl.registerLazySingleton<GetCategories>(() => GetCategories(sl()));

  //store
  sl.registerLazySingleton(() => HomeStore(sl(), sl()));
}
