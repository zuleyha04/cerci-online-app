import 'dart:ui';
import 'package:cerci_online/shell/tabs/presentation/widgets/selected_icon.dart';
import 'package:cerci_online/features/cart/presentation/pages/cart.dart';
import 'package:cerci_online/features/favorites/presentation/pages/favorites.dart';
import 'package:cerci_online/features/home/presentation/pages/home.dart';
import 'package:cerci_online/features/profile/presentation/pages/profile.dart';
import 'package:cerci_online/features/search/presentation/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _index = 2;

  final _pages = const [
    FavoritesPage(),
    SearchPage(),
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 4.h),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.80),
            borderRadius: BorderRadius.circular(22.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.09),
                blurRadius: 24.r,
                offset: Offset(0, 10.h),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12.r, sigmaY: 12.r),
              child: NavigationBar(
                backgroundColor: Colors.transparent,
                selectedIndex: _index,
                onDestinationSelected: (i) => setState(() => _index = i),
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.favorite),
                    selectedIcon: SelectedIcon(Icons.favorite),
                    label: 'Favoriler',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.search),
                    selectedIcon: SelectedIcon(Icons.search),
                    label: 'Ara',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: SelectedIcon(Icons.home_outlined),
                    label: 'Keşfet',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.shopping_cart_outlined),
                    selectedIcon: SelectedIcon(Icons.shopping_cart_outlined),
                    label: 'Sepet',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person),
                    selectedIcon: SelectedIcon(Icons.person),
                    label: 'Profil',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
