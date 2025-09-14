import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class TopSnackbarHelper {
  static void showSuccess(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
        icon: const SizedBox.shrink(),
        backgroundColor: Colors.green,
      ),
      displayDuration: Duration(seconds: 1),
    );
  }

  static void showError(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
        icon: const SizedBox.shrink(),
        backgroundColor: Colors.red,
      ),
      displayDuration: Duration(seconds: 1),
    );
  }

  static void showInfo(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
        icon: const SizedBox.shrink(),
        backgroundColor: Colors.grey,
      ),
      displayDuration: Duration(seconds: 1),
    );
  }
}
