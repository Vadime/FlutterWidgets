import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String title;
  final Widget? action;

  const AppBarWidget(
    this.title, {
    super.key,
    this.leading,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: ThemeConfig.kPaddingD,
        top: context.topInset + (ThemeConfig.kPaddingH),
        right: ThemeConfig.kPaddingD,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ThemeConfig.kRadius),
        child: MediaQuery(
          data: const MediaQueryData(
            padding: EdgeInsets.zero,
          ),
          child: AppBar(
              leading: leading,
              title: FittedBox(child: Text(title)),
              actions: (action != null) ? [action!] : null),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
