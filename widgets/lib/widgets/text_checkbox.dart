import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class TextCheckboxWidget extends StatelessWidget {
  final CheckboxController controller;
  final Widget child;
  final EdgeInsets? margin;
  const TextCheckboxWidget({
    required this.child,
    this.margin,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin ?? EdgeInsets.all(context.config.padding),
        child: Row(
          children: [
            Expanded(child: child),
            SizedBox(width: context.config.padding),
            CheckboxWidget(controller: controller),
          ],
        ),
      );
}
