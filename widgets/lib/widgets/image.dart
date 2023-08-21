import 'package:flutter/material.dart';
import 'package:widgets/controllers/theme_controller.dart';

class ImageWidget extends StatelessWidget {
  final String data;
  final double width;
  final double height;
  final BoxFit fit;
  final EdgeInsets margin;
  final double radius;

  const ImageWidget(
    this.data, {
    this.width = double.infinity,
    this.height = double.infinity,
    this.fit = BoxFit.cover,
    this.margin = EdgeInsets.zero,
    this.radius = ThemeConfig.kRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Image.asset(
            data,
            width: width,
            height: height,
            fit: fit,
          ),
        ),
      );
}
