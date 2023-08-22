import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(ThemeConfig.kRadius),
          child: Image.asset(
            data,
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
        ),
      );
}
