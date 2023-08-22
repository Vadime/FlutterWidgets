import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class ThemeChangeComponent extends StatefulWidget {
  final ThemeController controller;
  final EdgeInsets margin;
  const ThemeChangeComponent({
    required this.controller,
    this.margin = EdgeInsets.zero,
    super.key,
  });

  @override
  State<ThemeChangeComponent> createState() => _ThemeChangeComponentState();
}

class _ThemeChangeComponentState extends State<ThemeChangeComponent> {
  late SegmentedButtonController<ThemeMode> buttonController;

  @override
  void initState() {
    super.initState();
    buttonController = SegmentedButtonController(widget.controller.state);
    buttonController
        .addListener((mode) => ThemeController.of(context).change(mode));
  }

  @override
  Widget build(BuildContext context) {
    return SlidingSegmentedButton(
        margin: widget.margin,
        controller: buttonController,
        segments: const [
          SegmentedButtonData(
            'System',
            ThemeMode.system,
          ),
          SegmentedButtonData(
            'Light',
            ThemeMode.light,
          ),
          SegmentedButtonData(
            'Dark',
            ThemeMode.dark,
          ),
        ]);
  }
}
