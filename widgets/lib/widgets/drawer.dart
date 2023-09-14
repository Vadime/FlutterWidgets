import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class DrawerWidget extends StatelessWidget {
  final List<Widget>? drawerItems;
  final bool showNavigation;
  final NavigationBarData? navigationBarData;

  const DrawerWidget({
    required this.drawerItems,
    required this.showNavigation,
    required this.navigationBarData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: ColumnWidget(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (drawerItems != null) ...[
              ...drawerItems!,
              const DividerWidget('Navigation'),
            ],
            if (showNavigation) ...[
              const SizedBox(height: 10),
              for (int i = 0; i < navigationBarData!.items.length; i++)
                ListTileWidget(
                  leading: Icon(navigationBarData!.items[i].icon,
                      color: navigationBarData!.currentIndex == i
                          ? context.config.primaryColor
                          : null),
                  title: navigationBarData!.items[i].label,
                  foregroundColor: navigationBarData!.currentIndex == i
                      ? context.config.primaryColor
                      : null,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  onTap: () => navigationBarData!.onChange?.call(i),
                )
            ]
          ],
        ),
      ),
    );
  }
}
