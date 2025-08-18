import 'package:cerci_online/features/home/data/repositories/home_repository_impl.dart';
import 'package:cerci_online/features/home/domain/repositories/home_repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  _registerHome();
}

void _registerHome() {
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());
}
