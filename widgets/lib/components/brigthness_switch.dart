import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class BrigthnessSwitch extends StatelessWidget {
  const BrigthnessSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.theme.brightness == Brightness.light
          ? ThemeController.of(context).change(ThemeMode.dark)
          : ThemeController.of(context).change(ThemeMode.light),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          color: context.theme.cardColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(ThemeConfig.kRadius),
        ),
        child: Icon(
            context.theme.brightness == Brightness.light
                ? Icons.light_mode_rounded
                : Icons.dark_mode_rounded,
            color: Colors.white),
      ),
    );
  }
}
