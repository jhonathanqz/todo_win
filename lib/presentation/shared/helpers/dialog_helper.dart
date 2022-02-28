import 'package:flutter/material.dart';

class DialogHelper {
  static void open({
    required BuildContext context,
    required Widget content,
    bool barrierDismissible = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => content,
    );
  }
}
