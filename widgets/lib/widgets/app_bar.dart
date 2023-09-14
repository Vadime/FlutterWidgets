import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String title;
  final List<Widget>? actions;
  final EdgeInsets? margin;

  const AppBarWidget(
    this.title, {
    super.key,
    this.leading,
    this.margin,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ??
          EdgeInsets.only(
            left: context.leftInset + context.config.paddingD,
            top: context.topInset + context.config.paddingH,
            right: context.rightInset + context.config.paddingD,
          ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(context.config.radius),
        child: MediaQuery(
          data: context.mediaQuery.copyWith(
            padding: EdgeInsets.zero,
          ),
          child: AppBar(
            leading: leading,
            surfaceTintColor: Colors.transparent,
            title: TextWidget(title),
            actions: actions,
            toolbarHeight: preferredSize.height - 10,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
