import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets padding, margin;
  final Color? backgroundColor;

  const CardWidget({
    required this.children,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    this.backgroundColor,
    super.key,
  });

  factory CardWidget.single({
    required Widget child,
    EdgeInsets padding = const EdgeInsets.all(0),
    EdgeInsets margin = const EdgeInsets.all(0),
    Color? backgroundColor,
    Key? key,
  }) =>
      CardWidget(
        padding: padding,
        margin: margin,
        key: key,
        backgroundColor: backgroundColor,
        children: [child],
      );

  @override
  Widget build(BuildContext context) => Card(
        color: backgroundColor,
        margin: margin,
        child: Padding(
          padding: padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ),
      );
}
