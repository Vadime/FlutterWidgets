import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class ScrollViewWidget extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets? padding;
  final bool safeArea;
  final double? maxInnerWidth;
  const ScrollViewWidget({
    required this.children,
    this.padding,
    this.safeArea = true,
    this.maxInnerWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: padding ?? EdgeInsets.all(context.config.padding),
      child: SafeArea(
        child: Center(
          child: ColumnWidget(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              maxWidth: maxInnerWidth,
              children: children),
        ),
      ),
    );
  }
}
