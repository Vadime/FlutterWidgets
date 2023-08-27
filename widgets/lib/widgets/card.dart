import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class CardWidget extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets padding, margin;
  final Color? backgroundColor;
  final dynamic Function()? onTap;
  const CardWidget({
    required this.children,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    this.backgroundColor,
    this.onTap,
    super.key,
  });

  factory CardWidget.single({
    required Widget child,
    EdgeInsets padding = const EdgeInsets.all(0),
    EdgeInsets margin = const EdgeInsets.all(0),
    Color? backgroundColor,
    Key? key,
    dynamic Function()? onTap,
  }) =>
      CardWidget(
        padding: padding,
        margin: margin,
        key: key,
        onTap: onTap,
        backgroundColor: backgroundColor,
        children: [child],
      );

  @override
  Widget build(BuildContext context) => Card(
        color: backgroundColor,
        margin: margin,
        child: InkWell(
          borderRadius: BorderRadius.circular(context.config.radius),
          onTap: onTap,
          child: Padding(
            padding: padding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
        ),
      );
}
