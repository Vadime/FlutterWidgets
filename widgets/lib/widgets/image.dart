import 'dart:io';

import 'package:flutter/material.dart';
import 'package:widgets/config/theme_config.dart';
import 'package:widgets/widgets.dart';

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
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.grey.shade300,
            width: width,
            height: height,
          ),
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
              child,
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
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.grey.shade300,
            width: width,
            height: height,
          ),
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
              child,
          loadingBuilder: (context, child, loadingProgress) =>
              loadingProgress == null
                  ? child
                  : Container(
                      color: Colors.grey.shade300,
                      width: width,
                      height: height,
                    ),
          fit: fit,
        ),
      );

  static Widget file(
    File? file, {
    double width = double.infinity,
    double height = double.infinity,
    BoxFit fit = BoxFit.cover,
    EdgeInsets margin = EdgeInsets.zero,
    double radius = ThemeConfig.kRadius,
  }) =>
      _shell(
        radius: radius,
        margin: margin,
        child: file == null
            ? Container(
                color: Colors.grey.shade300, width: width, height: height)
            : Image.file(
                file,
                width: width,
                height: height,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey.shade300,
                  width: width,
                  height: height,
                ),
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
                    child,
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
