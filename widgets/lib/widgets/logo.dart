import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final String data;
  final double size;
  const LogoWidget(
    this.data, {
    this.size = 28,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: Image.asset(
          data,
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      );
}
