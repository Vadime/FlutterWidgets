import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class LoginHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget button;
  const LoginHeader(this.title, this.subtitle, this.button, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          context.config.padding,
          context.config.paddingH,
          context.config.padding,
          context.config.paddingH),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Text(subtitle, style: context.textTheme.labelSmall), button],
      ),
    );
  }
}
