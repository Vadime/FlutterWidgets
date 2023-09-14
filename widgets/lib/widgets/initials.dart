import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class InitialsWidget extends StatelessWidget {
  final double size;
  final String initials;
  final Function()? onTap;
  const InitialsWidget(
    this.initials, {
    this.size = 16,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color:
                context.theme.primaryColor.withOpacity(context.config.opacity),
            borderRadius: BorderRadius.circular(size / 2)),
        alignment: Alignment.center,
        child: TextWidget(initials,
            style: TextStyle(
                fontSize: size / 2,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
