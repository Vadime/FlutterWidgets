import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class ThemeChangeComponent extends StatefulWidget {
  final ThemeMode currentMode;
  final Function(ThemeMode mode)? onChange;
  final EdgeInsets margin;
  const ThemeChangeComponent({
    required this.currentMode,
    this.onChange,
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
    buttonController = SegmentedButtonController(widget.currentMode);
    if (widget.onChange != null) {
      buttonController.addListener(widget.onChange!);
    }
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
