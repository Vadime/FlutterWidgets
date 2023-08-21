import 'package:flutter/material.dart';
import 'package:widgets/widgets/widgets.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;

  final Function(int index)? onChange;

  final List<BottomNavigationBarItem> items;

  final double radius;

  final double horizontalPadding;

  final double bottomPadding;

  const BottomNavigationBarWidget({
    required this.currentIndex,
    required this.items,
    this.onChange,
    this.radius = 10,
    this.horizontalPadding = 40,
    this.bottomPadding = 10,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          left: horizontalPadding,
          bottom: context.bottomInset + bottomPadding,
          right: horizontalPadding,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: MediaQuery(
            data: const MediaQueryData(
              padding: EdgeInsets.zero,
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: onChange,
              items: items,
            ),
          ),
        ),
      );
}
