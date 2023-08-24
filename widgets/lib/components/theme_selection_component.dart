import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class ThemeSelectionComponent extends StatefulWidget {
  final ThemeController controller;
  final EdgeInsets margin;
  const ThemeSelectionComponent({
    required this.controller,
    this.margin = EdgeInsets.zero,
    super.key,
  });

  @override
  State<ThemeSelectionComponent> createState() =>
      _ThemeSelectionComponentState();
}

class _ThemeSelectionComponentState extends State<ThemeSelectionComponent> {
  late SegmentedButtonController<ThemeMode> buttonController;

  @override
  void initState() {
    super.initState();
    buttonController = SegmentedButtonController(widget.controller.state);
    buttonController.addListener((mode) => widget.controller.change(mode));
  }

  @override
  Widget build(BuildContext context) {
    return SlidingSegmentedButton(
        margin: widget.margin,
        controller: buttonController,
        segments: const [
          ButtonData('System', ThemeMode.system),
          ButtonData('Light', ThemeMode.light),
          ButtonData('Dark', ThemeMode.dark),
        ]);
  }
}
