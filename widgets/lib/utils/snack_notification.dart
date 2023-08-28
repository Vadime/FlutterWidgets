import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class SnackNotification {
  static final GlobalKey<ScaffoldMessengerState> key =
      GlobalKey<ScaffoldMessengerState>();

  SnackNotification._message(String msg, [Color? color]) {
    key.currentState!.removeCurrentSnackBar();
    key.currentState!.showSnackBar(SnackBar(
        margin: const EdgeInsets.all(10),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
            textColor: Colors.white,
            label: 'OK',
            onPressed: () => key.currentState!.clearSnackBars()),
        duration: const Duration(seconds: 3),
        backgroundColor: color,
        content: TextWidget(msg.split(']').last.trim(),
            maxLines: 3, color: Colors.white)));
  }

  SnackNotification.info(String msg)
      : this._message(msg, key.currentContext?.theme.primaryColor);

  SnackNotification.error(String msg)
      : this._message(msg, key.currentContext?.theme.colorScheme.error);

  SnackNotification.success(String msg)
      : this._message(msg, Colors.green.shade900);
}
