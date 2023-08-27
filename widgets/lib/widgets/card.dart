import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class CardWidget extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets padding, margin;
  final Color? backgroundColor;
  final dynamic Function()? onTap;
  final CrossAxisAlignment crossAxisAlignment;
  final double? radius;
  const CardWidget({
    required this.children,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    this.backgroundColor,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
    this.onTap,
    this.radius,
    super.key,
  });

  factory CardWidget.single({
    required Widget child,
    double? radius,
    EdgeInsets padding = const EdgeInsets.all(0),
    EdgeInsets margin = const EdgeInsets.all(0),
    Color? backgroundColor,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.stretch,
    Key? key,
    dynamic Function()? onTap,
  }) =>
      CardWidget(
        padding: padding,
        margin: margin,
        key: key,
        onTap: onTap,
        crossAxisAlignment: crossAxisAlignment,
        backgroundColor: backgroundColor,
        children: [child],
      );

  @override
  Widget build(BuildContext context) => Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? context.config.radius),
        ),
        elevation: 0,
        margin: margin,
        child: InkWell(
          borderRadius: BorderRadius.circular(context.config.radius),
          onTap: onTap,
          child: Padding(
            padding: padding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: crossAxisAlignment,
              children: children,
            ),
          ),
        ),
      );
}
