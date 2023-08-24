import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class BrigthnessSwitchComponent extends StatelessWidget {
  const BrigthnessSwitchComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.theme.brightness == Brightness.light
          ? ThemeController.of(context).change(ThemeMode.dark)
          : ThemeController.of(context).change(ThemeMode.light),
      child: Container(
        padding: EdgeInsets.fromLTRB(
            context.config.paddingH,
            context.config.paddingH,
            context.config.paddingH,
            context.config.paddingH),
        decoration: BoxDecoration(
          color: context.theme.cardColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(context.config.radius),
        ),
        child: Icon(
          context.theme.brightness == Brightness.light
              ? Icons.light_mode_rounded
              : Icons.dark_mode_rounded,
        ),
      ),
    );
  }
}
