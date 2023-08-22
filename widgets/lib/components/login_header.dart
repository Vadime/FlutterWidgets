import 'package:flutter/material.dart';
import 'package:widgets/config/theme_config.dart';
import 'package:widgets/widgets/widgets.dart';

class LoginHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget button;
  const LoginHeader(this.title, this.subtitle, this.button, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(ThemeConfig.kRadius)),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(ThemeConfig.kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SafeArea(bottom: false, child: SizedBox()),
          Text(title,
              style: context.textTheme.headlineLarge!.copyWith(
                color: Colors.white,
              )),
          const SizedBox(height: ThemeConfig.kPaddingH),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(subtitle, style: context.textTheme.labelSmall),
              button
            ],
          ),
        ],
      ),
    );
  }
}
