import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:widgets/widgets.dart';

class Messaging {
  Messaging._message(
    String? message, {
    required BuildContext context,
    Color? color,
  }) {
    if (message == null) return;

    showToast(message,
        context: context,
        animation: StyledToastAnimation.slideFromTopFade,
        reverseAnimation: StyledToastAnimation.slideToTopFade,
        position: StyledToastPosition.top,
        animDuration: const Duration(milliseconds: 250),
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
        reverseCurve: Curves.easeInOut,
        backgroundColor: (color ?? context.theme.primaryColor).withOpacity(0.8),
        borderRadius: BorderRadius.circular(context.config.radius),
        textPadding: EdgeInsets.symmetric(
            vertical: context.config.paddingH,
            horizontal: context.config.padding),
        fullWidth: true,
        toastHorizontalMargin: context.config.paddingD,
        textStyle: context.textTheme.bodySmall!
            .copyWith(color: Colors.white, fontWeight: FontWeight.bold));
  }

  Messaging.info(String? message, {required BuildContext context, Color? color})
      : this._message(message,
            context: context, color: context.theme.primaryColor);

  Messaging.error(String? message,
      {required BuildContext context, Color? color})
      : this._message(message,
            context: context, color: context.colorScheme.error);

  Messaging.success(String? message,
      {required BuildContext context, Color? color})
      : this._message(message, context: context, color: Colors.green.shade900);
}
