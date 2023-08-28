import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class Messaging {
  static GlobalKey<ScaffoldMessengerState> key =
      GlobalKey<ScaffoldMessengerState>();

  BuildContext get context => key.currentContext!;

  Messaging._message(String? message, [Color? color]) {
    if (message == null) return;
    key.currentState!.removeCurrentSnackBar();
    key.currentState!.showSnackBar(SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.config.radius)),
        margin: EdgeInsets.fromLTRB(
          context.config.paddingD,
          0,
          context.config.paddingD,
          context.heightWithoutSafeArea - 100 - context.config.padding,
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: color ?? context.config.primaryColor,
        dismissDirection: DismissDirection.up,
        content: TextWidget(message.split(']').last.trim(),
            align: TextAlign.center, maxLines: 3, color: Colors.white)));
  }

  Messaging.info({String? message})
      : this._message(message, key.currentContext?.theme.primaryColor);

  Messaging.error({String? message})
      : this._message(message, key.currentContext?.theme.colorScheme.error);

  Messaging.success({String? message})
      : this._message(message, Colors.green.shade900);
}
