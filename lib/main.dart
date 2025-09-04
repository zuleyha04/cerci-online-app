import 'package:cerci_online/core/configs/router/route_names.dart';
import 'package:cerci_online/core/di/locator.dart';
import 'package:cerci_online/core/theme/app_theme.dart';
import 'package:cerci_online/features/home/domain/repositories/banner_repository.dart';
import 'package:cerci_online/features/home/domain/repositories/category_repository.dart';
import 'package:cerci_online/features/home/presentation/store/home_store.dart';
import 'package:cerci_online/features/product/domain/usecases/favorite/get_favorites.dart';
import 'package:cerci_online/features/product/domain/usecases/favorite/is_favorite.dart';
import 'package:cerci_online/features/product/domain/usecases/favorite/toggle_favorite.dart';
import 'package:cerci_online/features/product/domain/usecases/product/get_best_seller.dart';
import 'package:cerci_online/features/product/domain/usecases/product/get_product_by_category.dart';
import 'package:cerci_online/features/product/domain/usecases/product/get_product_detail.dart';
import 'package:cerci_online/features/product/domain/usecases/product/get_product_list.dart';
import 'package:cerci_online/features/product/presentation/store/product_store.dart';
import 'package:cerci_online/features/splash/presentation/pages/splash.dart';
import 'package:cerci_online/shell/tabs/presentation/pages/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(
    MultiProvider(
      providers: [
        //TODO: main daha fazla şişerse düzeltilecek
        ChangeNotifierProvider(
          create:
              (_) =>
                  HomeStore(sl<BannerRepository>(), sl<CategoryRepository>()),
        ),

        ChangeNotifierProvider(
          create:
              (_) => ProductStore(
                sl<GetProductList>(),
                sl<GetProductDetail>(),
                sl<GetBestSeller>(),
                sl<GetProductByCategory>(),
                sl<GetFavorites>(),
                sl<IsFavorite>(),
                sl<ToggleFavorite>(),
              ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 740),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RouteNames.splash,
          routes: {
            RouteNames.splash: (_) => const SplashPage(),
            RouteNames.tabs: (_) => const TabsPage(),
          },
          theme: AppTheme.appTheme,
        );
      },
    );
  }
}
