import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class SegmentedThemeButton extends StatefulWidget {
  final ThemeController controller;
  final EdgeInsets margin;
  const SegmentedThemeButton(
    this.controller, {
    super.key,
    this.margin = EdgeInsets.zero,
  });

  @override
  State<SegmentedThemeButton> createState() => _SegmentedThemeButtonState();
}

class _SegmentedThemeButtonState extends State<SegmentedThemeButton> {
  late SegmentedButtonController<ThemeMode> buttonController;

  @override
  void initState() {
    super.initState();
    buttonController = SegmentedButtonController(widget.controller.state);
    buttonController
        .addListener((state) => widget.controller.changeTheme(state));
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
