import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final EdgeInsets margin;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  const TextButtonWidget(
    this.text, {
    required this.onPressed,
    this.margin = EdgeInsets.zero,
    this.backgroundColor,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: padding,
          ),
          onPressed: onPressed,
          child: Text(text),
        ),
      );
}
