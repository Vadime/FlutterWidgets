library widgets;

import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class FooterWidget extends StatelessWidget {
  final List<TextButtonWidget> buttons;
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
          alignment: WrapAlignment.spaceBetween,
          spacing: 4,
          children: buttons,
        ),
        SizedBox(height: context.config.padding),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ...socials,
            const Spacer(),
            TextWidget(commercialText, style: context.textTheme.labelSmall),
          ],
        ),
      ],
    );
  }
}
