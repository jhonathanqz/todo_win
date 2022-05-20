import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  static void open({
    required BuildContext context,
    required Widget content,
    bool barrierDismissible = false,
  }) async {
    if (Platform.isAndroid) {
      return showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) => content,
      );
    } else {
      return showCupertinoDialog(
        context: context,
        builder: (context) => content,
      );
    }
  }
}
