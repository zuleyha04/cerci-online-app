import 'package:cerci_online/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppNavBarTheme {
  static NavigationBarThemeData get light => NavigationBarThemeData(
    height: 64.h,
    elevation: 0,
    backgroundColor: Colors.transparent,
    indicatorColor: Colors.transparent,
    overlayColor: WidgetStateProperty.all(Colors.transparent),
    labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    labelTextStyle: MaterialStateProperty.resolveWith((states) {
      final selected = states.contains(MaterialState.selected);
      return TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
        color: selected ? AppColors.textPrimary : AppColors.hintColor,
      );
    }),
    iconTheme: WidgetStateProperty.resolveWith((states) {
      final selected = states.contains(MaterialState.selected);
      return IconThemeData(
        color: selected ? AppColors.textPrimary : AppColors.hintColor,
        size: 24.sp,
      );
    }),
  );
}
