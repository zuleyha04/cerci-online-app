import 'package:cerci_online/features/cart/presentation/pages/cart.dart';
import 'package:cerci_online/features/favorites/presentation/pages/favorites.dart';
import 'package:cerci_online/features/home/presentation/pages/home.dart';
import 'package:cerci_online/features/profile/presentation/pages/profile.dart';
import 'package:cerci_online/features/search/presentation/pages/search.dart';
import 'package:flutter/material.dart';

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
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.favorite), label: 'Favoriler'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Ara'),
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Keşfet',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Sepet',
          ),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
