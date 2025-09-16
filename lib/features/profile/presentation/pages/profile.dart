import 'package:cerci_online/core/configs/router/route_names.dart';
import 'package:cerci_online/common/widgets/appBar/common_app_bar.dart';
import 'package:cerci_online/features/profile/presentation/widgets/profile_menu_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      {"title": "Hakkımda", "route": RouteNames.about},
      {"title": "Siparişlerim", "route": RouteNames.orders},
      {"title": "Adreslerim", "route": RouteNames.addresses},
      {"title": "Kartlarım", "route": RouteNames.cards},
      {"title": "Çıkış", "route": RouteNames.logout},
    ];
    return Scaffold(
      appBar: CommonAppBar(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(12.w),
          children:
              menuItems.map((item) {
                return ProfileMenuTile(
                  title: item["title"]!,
                  onTap: () {
                    // Navigator.pushNamed(context, item["route"]!);
                    print("İlgili sayfaya yönlendirilecek");
                  },
                );
              }).toList(),
        ),
      ),
    );
  }
}
