import 'package:flutter/material.dart';
import 'package:widgets/widgets/widgets.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final EdgeInsets margin;
  final Color? backgroundColor;

  final double? elevation;

  const ElevatedButtonWidget(
    this.text, {
    required this.onPressed,
    this.margin = EdgeInsets.zero,
    this.backgroundColor,
    this.elevation,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            elevation: elevation,
            shadowColor: (elevation == null || elevation == 0)
                ? Colors.transparent
                : context.theme.shadowColor,
          ),
          onPressed: onPressed,
          child: Text(text),
        ),
      );
}
