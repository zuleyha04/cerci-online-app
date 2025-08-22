import 'package:cerci_online/features/home/data/datasources/banner_local_data_source.dart';
import 'package:cerci_online/features/home/data/repositories/banner_repository_impl.dart';
import 'package:cerci_online/features/home/domain/repositories/banner_repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  _registerHome();
}

void _registerHome() {
  sl.registerLazySingleton<BannerLocalDataSource>(
    () => BannerLocalDataSource(),
  );

  sl.registerLazySingleton<BannerRepository>(
    () => BannerRepositoryImpl(sl<BannerLocalDataSource>()),
  );
}
