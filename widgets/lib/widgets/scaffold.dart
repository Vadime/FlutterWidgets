import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';
import 'package:widgets/widgets/scaffold_large_landscape.dart';
import 'package:widgets/widgets/scaffold_large_portrait.dart';
import 'package:widgets/widgets/scaffold_small_landscape.dart';
import 'package:widgets/widgets/scaffold_small_portrait.dart';

double barHeights(BuildContext context) =>
    kToolbarHeight + context.config.paddingH;

double appBarHeight(BuildContext context) => kToolbarHeight;

class ScaffoldWidget extends StatelessWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget body;
  final NavigationBarData? navigationBarData;

  final bool looseFocusOnTap;
  final Color? backgroundColor;
  final List<Widget>? drawerItems;
  final Widget? primaryButton;

  const ScaffoldWidget({
    this.title,
    this.actions,
    this.body = const SizedBox.shrink(),
    this.navigationBarData,
    this.drawerItems,
    this.looseFocusOnTap = false,
    this.backgroundColor,
    this.primaryButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: looseFocusOnTap ? () => Focus.of(context).unfocus() : null,
        child: LayoutBuilder(builder: (context, constraints) {
          bool portrait = constraints.maxWidth < constraints.maxHeight;
          if (portrait) {
            switch (ThemeConfig.screenSize) {
              case ScreenSize.small:
                return ScaffoldSmallPortrait(
                  title: title,
                  actions: actions,
                  body: body,
                  drawerItems: drawerItems,
                  navigationBarData: navigationBarData,
                  looseFocusOnTap: looseFocusOnTap,
                  backgroundColor: backgroundColor,
                  primaryButton: primaryButton,
                );
              case ScreenSize.medium:
                return ScaffoldLargePortrait(
                  title: title,
                  actions: actions,
                  body: body,
                  drawerItems: drawerItems,
                  navigationBarData: navigationBarData,
                  looseFocusOnTap: looseFocusOnTap,
                  backgroundColor: backgroundColor,
                  primaryButton: primaryButton,
                );
              case ScreenSize.large:
                return ScaffoldLargePortrait(
                  title: title,
                  actions: actions,
                  body: body,
                  drawerItems: drawerItems,
                  navigationBarData: navigationBarData,
                  looseFocusOnTap: looseFocusOnTap,
                  backgroundColor: backgroundColor,
                  primaryButton: primaryButton,
                );
              default:
                return ScaffoldSmallPortrait(
                  title: title,
                  actions: actions,
                  body: body,
                  navigationBarData: navigationBarData,
                  drawerItems: drawerItems,
                  looseFocusOnTap: looseFocusOnTap,
                  backgroundColor: backgroundColor,
                  primaryButton: primaryButton,
                );
            }
          } else {
            switch (ThemeConfig.screenSize) {
              case ScreenSize.small:
                return ScaffoldSmallLandscape(
                  title: title,
                  actions: actions,
                  body: body,
                  navigationBarData: navigationBarData,
                  drawerItems: drawerItems,
                  looseFocusOnTap: looseFocusOnTap,
                  backgroundColor: backgroundColor,
                  primaryButton: primaryButton,
                );
              case ScreenSize.medium:
                return ScaffoldLargeLandscape(
                  title: title,
                  actions: actions,
                  body: body,
                  drawerItems: drawerItems,
                  navigationBarData: navigationBarData,
                  looseFocusOnTap: looseFocusOnTap,
                  backgroundColor: backgroundColor,
                  primaryButton: primaryButton,
                );
              case ScreenSize.large:
                return ScaffoldLargeLandscape(
                  title: title,
                  actions: actions,
                  body: body,
                  drawerItems: drawerItems,
                  navigationBarData: navigationBarData,
                  looseFocusOnTap: looseFocusOnTap,
                  backgroundColor: backgroundColor,
                  primaryButton: primaryButton,
                );
              default:
                return ScaffoldSmallLandscape(
                  title: title,
                  actions: actions,
                  body: body,
                  navigationBarData: navigationBarData,
                  drawerItems: drawerItems,
                  looseFocusOnTap: looseFocusOnTap,
                  backgroundColor: backgroundColor,
                  primaryButton: primaryButton,
                );
            }
          }
        }),
      );
}
