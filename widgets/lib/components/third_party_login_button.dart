import 'package:flutter/material.dart';
import 'package:widgets/widgets/widgets.dart';

class ThirdPartyLoginButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final IconData icon;
  const ThirdPartyLoginButton(this.text, this.icon,
      {this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: OutlinedButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              const SizedBox(width: 10),
              Text(text, style: context.textTheme.bodyMedium!),
              const SizedBox(width: 10),
            ],
          )),
    );
  }
}
