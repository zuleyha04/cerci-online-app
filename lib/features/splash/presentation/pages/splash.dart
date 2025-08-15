import 'package:cerci_online/core/configs/assets/app_vectors.dart';
import 'package:cerci_online/core/configs/router/route_names.dart';
import 'package:cerci_online/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, RouteNames.tabs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: SizedBox(
          width: 200.w,
          height: 200.h,
          child: SvgPicture.asset(AppVectors.appLogo, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
