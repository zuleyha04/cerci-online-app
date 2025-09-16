import 'package:cerci_online/features/cart/data/datasources/cart_item_local_data_source.dart';
import 'package:cerci_online/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:cerci_online/features/cart/domain/repositories/cart_repository.dart';
import 'package:cerci_online/features/cart/domain/usecases/add_to_cart.dart';
import 'package:cerci_online/features/cart/domain/usecases/get_cart_items.dart';
import 'package:cerci_online/features/cart/domain/usecases/get_total_price.dart';
import 'package:cerci_online/features/cart/domain/usecases/get_total_quantity.dart';
import 'package:cerci_online/features/cart/domain/usecases/remove_from_cart.dart';
import 'package:cerci_online/features/cart/presentation/store/cart_store.dart';
import 'package:get_it/get_it.dart';

void registerCart(GetIt sl) {
  //Data sources
  sl.registerLazySingleton<CartItemLocalDataSource>(
    () => CartItemLocalDataSource(),
  );

  //Repository
  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(sl<CartItemLocalDataSource>()),
  );

  //Usecase
  sl.registerLazySingleton<AddToCart>(() => AddToCart(sl()));
  sl.registerLazySingleton<RemoveFromCart>(() => RemoveFromCart(sl()));
  sl.registerLazySingleton<GetCartItems>(() => GetCartItems(sl()));
  sl.registerLazySingleton<GetTotalPrice>(() => GetTotalPrice(sl()));
  sl.registerLazySingleton<GetTotalQuantity>(() => GetTotalQuantity(sl()));

  //store
  sl.registerLazySingleton(() => CartStore(sl(), sl(), sl(), sl(), sl()));
}
