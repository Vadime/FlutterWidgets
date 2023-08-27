import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  final EdgeInsets margin;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const IconButtonWidget(
    this.icon, {
    required this.onPressed,
    this.margin = EdgeInsets.zero,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: IconButton(
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            padding: padding,
          ),
          onPressed: () async {
            if (onPressed is Future Function()) {
              try {
                LoadingController.instance?.disableInput();
                await onPressed?.call();
              } catch (_) {
              } finally {
                LoadingController.instance?.enableInput();
              }
            } else {
              onPressed?.call();
            }
          },
          icon: Icon(icon),
        ),
      );
}
