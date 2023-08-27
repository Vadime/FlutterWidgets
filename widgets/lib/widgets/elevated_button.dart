import 'package:flutter/material.dart';
import 'package:widgets/controllers/loading_controller.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final dynamic Function()? onPressed;
  final EdgeInsets margin;
  final Color? backgroundColor;

  const ElevatedButtonWidget(
    this.text, {
    required this.onPressed,
    this.margin = EdgeInsets.zero,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
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
          child: Text(text),
        ),
      );
}
