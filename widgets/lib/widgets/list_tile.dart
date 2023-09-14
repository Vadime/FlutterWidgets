import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class ListTileWidget extends StatelessWidget {
  final EdgeInsets margin;
  final EdgeInsets? padding;
  final EdgeInsets contentPadding;
  final String? title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? selectedColor;
  final TextOverflow? subtitleOverflow;
  final double? maxWidth;
  final List<Widget>? slideMenuItems;
  final Color? foregroundColor;
  const ListTileWidget({
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.contentPadding = EdgeInsets.zero,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.backgroundColor,
    this.selectedColor,
    this.subtitleOverflow,
    this.maxWidth,
    this.slideMenuItems,
    this.foregroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (maxWidth == null) {
      return _build(context);
    } else {
      return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth!),
          child: _build(context),
        ),
      );
    }
  }

  _build(BuildContext context) => CardWidget.single(
        slideMenuItems: slideMenuItems,
        margin: margin,
        onTap: onTap,
        padding: padding ?? EdgeInsets.zero,
        backgroundColor: selectedColor ?? backgroundColor,
        child: Row(
          children: [
            if (leading != null) leading!,
            Expanded(
              child: Padding(
                padding: contentPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (title != null)
                      TextWidget(
                        title!,
                        style: context.textTheme.titleSmall,
                        color: foregroundColor,
                      ),
                    if (subtitle != null)
                      TextWidget(
                        subtitle!,
                        style: context.textTheme.bodySmall,
                        overflow: subtitleOverflow,
                      ),
                  ],
                ),
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      );
}
