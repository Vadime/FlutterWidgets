import 'package:flutter/material.dart';
import 'package:widgets/widgets/widgets.dart';

class FailWidget extends StatelessWidget {
  final Object error;
  const FailWidget(this.error, {super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          error.toString(),
          style: TextStyle(color: context.config.errorColor),
        ),
      );
}
