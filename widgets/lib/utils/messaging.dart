import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:widgets/widgets.dart';

class Messaging {
  Messaging._message(
    dynamic message, {
    required BuildContext context,
    Color? color,
  }) {
    if (message == null) return;

    showToast(message.toString(),
        context: context,
        animation: StyledToastAnimation.slideFromTopFade,
        reverseAnimation: StyledToastAnimation.slideToTopFade,
        position: StyledToastPosition.top,
        animDuration: const Duration(milliseconds: 250),
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
        reverseCurve: Curves.easeInOut,
        backgroundColor: context.theme.cardColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(context.config.radius),
        textPadding: EdgeInsets.symmetric(
            vertical: context.config.paddingH,
            horizontal: context.config.padding),
        fullWidth: true,
        toastHorizontalMargin: context.config.paddingD,
        textStyle: context.textTheme.bodySmall!.copyWith(
            color: (color ?? context.theme.primaryColor),
            fontWeight: FontWeight.bold));
  }

  Messaging.info(dynamic message, {required BuildContext context, Color? color})
      : this._message(message,
            context: context, color: context.theme.primaryColor);

  Messaging.error(dynamic message,
      {required BuildContext context, Color? color})
      : this._message(message,
            context: context, color: context.colorScheme.error);

  Messaging.success(dynamic message,
      {required BuildContext context, Color? color})
      : this._message(message, context: context, color: Colors.green.shade900);
}
