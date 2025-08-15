import 'package:cerci_online/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedIcon extends StatelessWidget {
  final IconData icon;

  const SelectedIcon(this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppColors.primary;
    return Container(
      width: 30.r,
      height: 30.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: color.withOpacity(0.35), width: 1.5),
      ),
      child: Icon(icon, size: 20.sp),
    );
  }
}
