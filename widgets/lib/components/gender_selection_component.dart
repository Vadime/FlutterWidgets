import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class GenderSelectionComponent extends StatefulWidget {
  final GenderController controller;
  final EdgeInsets margin;
  const GenderSelectionComponent({
    required this.controller,
    this.margin = EdgeInsets.zero,
    super.key,
  });

  @override
  State<GenderSelectionComponent> createState() =>
      _GenderSelectionComponentState();
}

class _GenderSelectionComponentState extends State<GenderSelectionComponent> {
  late SegmentedButtonController<Gender> buttonController;

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
          ButtonData('Male', Gender.male),
          ButtonData('Female', Gender.female),
          ButtonData('Other', Gender.other),
        ]);
  }
}
