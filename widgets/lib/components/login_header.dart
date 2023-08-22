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
      color: context.theme.primaryColor,
      height: (context.mediaQuery.size.height) * 0.3,
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(ThemeConfig.kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: BoxDecoration(
              color: context.theme.cardColor.withOpacity(0.2),
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(ThemeConfig.kRadius)),
            ),
            child: Text(title,
                style: context.textTheme.headlineLarge!.copyWith(
                  color: Colors.white,
                )),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
              color: context.theme.cardColor.withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(ThemeConfig.kRadius),
                bottomRight: Radius.circular(ThemeConfig.kRadius),
                topRight: Radius.circular(ThemeConfig.kRadius),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(subtitle, style: context.textTheme.labelSmall),
                button
              ],
            ),
          ),
        ],
      ),
    );
  }
}
