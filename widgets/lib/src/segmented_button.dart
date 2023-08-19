library widgets;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SegmentedButtonController extends Cubit<String> {
  SegmentedButtonController(super.initialState);

  void set(String value) => super.emit(value);
}

class SegmentedButtonWidget extends StatelessWidget {
  final SegmentedButtonController controller;
  final List<String> segments;
  final EdgeInsets margin;
  const SegmentedButtonWidget({
    required this.controller,
    required this.segments,
    this.margin = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: BlocBuilder<SegmentedButtonController, String>(
        bloc: controller,
        builder: (context, state) {
          return SegmentedButton<String>(
            multiSelectionEnabled: false,
            emptySelectionAllowed: false,
            showSelectedIcon: false,
            segments: segments
                .map((e) => ButtonSegment<String>(
                    icon: const SizedBox(), value: e, label: Text(e)))
                .toList(),
            onSelectionChanged: (p0) => controller.set(p0.first),
            selected: {state},
          );
        },
      ),
    );
  }
}
