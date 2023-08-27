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
  const ListTileWidget({
    this.margin = EdgeInsets.zero,
    this.padding,
    this.contentPadding = EdgeInsets.zero,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.backgroundColor,
    this.selectedColor,
    this.subtitleOverflow,
    super.key,
  });

  @override
  Widget build(BuildContext context) => CardWidget.single(
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
                      TextWidget(title!, style: context.textTheme.titleSmall),
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
