import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlushbarHelper {
  static Flushbar<dynamic>? _currentFlushBar;

  static void _show(BuildContext context, Flushbar flushBar) {
    _currentFlushBar?.dismiss();
    _currentFlushBar = flushBar..show(context);
  }

  static void showSuccess(BuildContext context, String message) {
    _show(
      context,
      Flushbar(
        message: message,
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
      ),
    );
  }

  static void showError(BuildContext context, String message) {
    _show(
      context,
      Flushbar(
        message: message,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
      ),
    );
  }

  static void showInfo(BuildContext context, String message) {
    _show(
      context,
      Flushbar(
        message: message,
        backgroundColor: Colors.grey,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
      ),
    );
  }
}
