import 'package:flutter/material.dart';
import 'package:widgets/widgets/widgets.dart';

class DividerWidget extends StatelessWidget {
  final String data;
  final double verticalPadding;
  final double outerHorizontalPadding;
  final double innerHorizontalPadding;

  const DividerWidget(
    this.data, {
    this.verticalPadding = 10,
    this.outerHorizontalPadding = 20,
    this.innerHorizontalPadding = 10,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(height: verticalPadding),
          Row(
            children: [
              SizedBox(width: outerHorizontalPadding),
              const Expanded(
                  child: Divider(
                thickness: 2,
              )),
              SizedBox(width: innerHorizontalPadding),
              Text(
                data,
                style: context.textTheme.labelMedium,
              ),
              SizedBox(width: outerHorizontalPadding),
              const Expanded(
                  child: Divider(
                thickness: 2,
              )),
              SizedBox(width: outerHorizontalPadding),
            ],
          ),
          SizedBox(height: verticalPadding),
        ],
      );
}
