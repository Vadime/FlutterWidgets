library widgets;

import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class FooterSocialButtonWidget {
  final String text;
  final Function()? onPressed;
  final IconData icon;

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
      padding: EdgeInsets.fromLTRB(context.config.paddingH,
          context.config.padding, context.config.paddingH, 0),
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
                    child: TextButtonWidget(
                      e.text,
                      onPressed: e.onPressed,
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: context.config.paddingH),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: context.config.paddingH,
              ),
              // social buttons
              ...socials.map(
                (e) => Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, context.config.paddingH, 0, context.config.paddingH),
                  child: IconButtonWidget(
                    e.icon,
                    onPressed: e.onPressed,
                  ),
                ),
              ),

              const Spacer(),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  context.config.paddingH,
                  context.config.paddingH,
                  context.config.paddingH,
                  context.config.padding,
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
