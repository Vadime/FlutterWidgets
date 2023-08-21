library widgets;

import 'package:flutter/material.dart';
import 'package:widgets/config/theme_config.dart';

class FooterSocialButtonWidget {
  final String text;
  final Function()? onPressed;
  final Widget icon;

  const FooterSocialButtonWidget({
    required this.text,
    required this.onPressed,
    required this.icon,
  });
}

class FooterButtonWidget {
  final String text;
  final Function()? onPressed;

  const FooterButtonWidget({required this.text, this.onPressed});
}

class FooterWidget extends StatelessWidget {
  final List<FooterButtonWidget> buttons;
  final List<FooterSocialButtonWidget> socials;
  final String commercialText;

  const FooterWidget({
    super.key,
    required this.buttons,
    required this.socials,
    required this.commercialText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(ThemeConfig.kPaddingH,
          ThemeConfig.kPadding, ThemeConfig.kPaddingH, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceAround,
            children: buttons
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                    child: TextButton(
                      onPressed: e.onPressed,
                      child: Text(
                        e.text,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: ThemeConfig.kPaddingH),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                width: ThemeConfig.kPaddingH,
              ),
              // social buttons
              ...socials.map(
                (e) => Padding(
                  padding: const EdgeInsets.fromLTRB(
                      0, ThemeConfig.kPaddingH, 0, ThemeConfig.kPaddingH),
                  child: IconButton(
                    icon: e.icon,
                    onPressed: e.onPressed,
                  ),
                ),
              ),

              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  ThemeConfig.kPaddingH,
                  ThemeConfig.kPaddingH,
                  ThemeConfig.kPaddingH,
                  ThemeConfig.kPadding,
                ),
                child: Text(
                  commercialText,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
