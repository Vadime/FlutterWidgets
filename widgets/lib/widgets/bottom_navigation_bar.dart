import 'package:flutter/material.dart';
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
        left: context.config.paddingD,
        bottom: context.bottomInset + (context.config.paddingH),
        right: context.config.paddingD,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(context.config.radius),
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
