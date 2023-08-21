import 'package:flutter/material.dart';
import 'package:widgets/controllers/theme_controller.dart';
import 'package:widgets/widgets/widgets.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;

  final Function(int index)? onChange;

  final List<BottomNavigationBarItem> items;

  const BottomNavigationBarWidget({
    required this.currentIndex,
    required this.items,
    this.onChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: ThemeConfig.kPaddingD,
        bottom: context.bottomInset + (ThemeConfig.kPaddingH),
        right: ThemeConfig.kPaddingD,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ThemeConfig.kRadius),
        child: MediaQuery(
          data: const MediaQueryData(
            padding: EdgeInsets.zero,
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onChange,
            items: items,
            selectedFontSize: 0,
            unselectedFontSize: 0,
          ),
        ),
      ),
    );
  }
}
