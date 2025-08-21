import 'package:cerci_online/core/configs/assets/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      elevation: 0,
      title: SvgPicture.asset(AppVectors.appLogo, height: 22.h),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
