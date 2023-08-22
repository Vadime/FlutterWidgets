import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final Function()? onPressed;
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
          onPressed: onPressed,
          child: Text(text),
        ),
      );
}
