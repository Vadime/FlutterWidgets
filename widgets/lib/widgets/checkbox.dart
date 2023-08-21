library widgets;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckboxController extends Cubit<bool> {
  CheckboxController(super.initialState);

  void set(bool value) => super.emit(value);

  void toggle() => super.emit(!super.state);
}

class CheckboxWidget extends StatelessWidget {
  final CheckboxController? controller;
  final EdgeInsets margin;

  const CheckboxWidget({
    this.controller,
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
                onChanged: (value) => controller?.set(value ?? false),
              );
            }),
      );
}
