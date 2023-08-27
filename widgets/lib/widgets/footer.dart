library widgets;

import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class FooterButtonWidget {
  final String text;
  final void Function()? onPressed;

  const FooterButtonWidget({required this.text, this.onPressed});
}

class FooterWidget extends StatelessWidget {
  final List<FooterButtonWidget> buttons;
  final List<IconButtonWidget> socials;
  final String commercialText;

  const FooterWidget({
    super.key,
    required this.buttons,
    required this.socials,
    required this.commercialText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          alignment: WrapAlignment.spaceAround,
          spacing: 4,
          children: buttons
              .map(
                (e) => TextButtonWidget(
                  e.text,
                  onPressed: e.onPressed,
                ),
              )
              .toList(),
        ),
        SizedBox(height: context.config.padding),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // social buttons
            ...socials,
            const Spacer(),
            TextWidget(commercialText, style: context.textTheme.labelSmall),
          ],
        ),
      ],
    );
  }
}
