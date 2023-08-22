import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final EdgeInsets margin;
  final EdgeInsets? padding;
  final String? title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final Function()? onTap;
  final Color? tileColor;
  final bool selected;
  final Color? selectedTileColor;

  const ListTileWidget({
    this.margin = EdgeInsets.zero,
    this.padding,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.tileColor,
    this.selected = false,
    this.selectedTileColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: ListTile(
          onTap: onTap,
          selected: selected,
          selectedTileColor: selectedTileColor,
          contentPadding: padding,
          tileColor: tileColor,
          title: title == null ? null : Text(title!),
          subtitle: subtitle == null ? null : Text(subtitle!),
          leading: leading,
          minLeadingWidth: 40,
          trailing: trailing,
        ),
      );
}
