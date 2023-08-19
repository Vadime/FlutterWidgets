import 'package:flutter/material.dart';

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
  final double padding;
  final String commercialText;

  const FooterWidget({
    super.key,
    required this.buttons,
    required this.socials,
    required this.commercialText,
    this.padding = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(padding, 20, padding, 0),
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
          SizedBox(height: padding),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(width: padding),
              // social buttons
              ...socials.map(
                (e) => Padding(
                  padding: EdgeInsets.fromLTRB(0, padding, 0, padding),
                  child: IconButton(
                    icon: e.icon,
                    onPressed: e.onPressed,
                  ),
                ),
              ),

              const Spacer(),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  padding,
                  padding,
                  padding,
                  2 * padding,
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
