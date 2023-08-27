import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class ThemeSelectionComponent extends StatelessWidget {
  final ThemeController controller;
  final EdgeInsets margin;
  const ThemeSelectionComponent({
    required this.controller,
    this.margin = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SlidingSegmentedButton(
        margin: margin,
        controller: controller,
        segments: const [
          ButtonData('System', ThemeMode.system),
          ButtonData('Light', ThemeMode.light),
          ButtonData('Dark', ThemeMode.dark),
        ],
      );
}
