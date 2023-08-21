import 'package:flutter/material.dart';
import 'package:widgets/widgets/widgets.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String title;
  final Widget? action;

  final double radius;

  final double horizontalPadding;

  final double topPadding;

  const AppBarWidget(
    this.title, {
    super.key,
    this.leading,
    this.action,
    this.radius = 10,
    this.horizontalPadding = 40,
    this.topPadding = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: horizontalPadding,
        top: context.topInset + topPadding,
        right: horizontalPadding,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: MediaQuery(
          data: const MediaQueryData(
            padding: EdgeInsets.zero,
          ),
          child: Hero(
            tag: 'title',
            child: AppBar(
                leading: leading,
                title: FittedBox(child: Text(title)),
                actions: (action != null) ? [action!] : null),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
