library widgets;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/controllers/checkbox_controller.dart';

class CheckboxWidget extends StatelessWidget {
  final CheckboxController controller;
  final EdgeInsets margin;

  const CheckboxWidget({
    required this.controller,
    this.margin = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: BlocBuilder<CheckboxController, bool>(
            bloc: controller,
            builder: (context, state) {
              return Checkbox.adaptive(
                value: state,
                onChanged: (value) => controller.toggle(value),
              );
            }),
      );
}
