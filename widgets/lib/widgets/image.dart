import 'dart:io';

import 'package:flutter/material.dart';
import 'package:widgets/config/theme_config.dart';

class ImageWidget {
  static Widget asset(
    String asset, {
    double width = double.infinity,
    double height = double.infinity,
    BoxFit fit = BoxFit.cover,
    EdgeInsets margin = EdgeInsets.zero,
    double radius = ThemeConfig.kRadius,
  }) =>
      _shell(
        radius: radius,
        margin: margin,
        child: Image.asset(
          asset,
          width: width,
          height: height,
          fit: fit,
        ),
      );

  static Widget network(
    String network, {
    double width = double.infinity,
    double height = double.infinity,
    BoxFit fit = BoxFit.cover,
    EdgeInsets margin = EdgeInsets.zero,
    double radius = ThemeConfig.kRadius,
  }) =>
      _shell(
        radius: radius,
        margin: margin,
        child: Image.network(
          network,
          width: width,
          height: height,
          fit: fit,
        ),
      );

  static Widget file(
    File file, {
    double width = double.infinity,
    double height = double.infinity,
    BoxFit fit = BoxFit.cover,
    EdgeInsets margin = EdgeInsets.zero,
    double radius = ThemeConfig.kRadius,
  }) =>
      _shell(
        radius: radius,
        margin: margin,
        child: Image.file(
          file,
          width: width,
          height: height,
          fit: fit,
        ),
      );

  static Widget _shell({
    required double radius,
    required EdgeInsets margin,
    required Widget child,
  }) =>
      Padding(
          padding: margin,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(radius), child: child));
}
