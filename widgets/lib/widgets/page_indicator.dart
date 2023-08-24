import 'package:flutter/material.dart';
import 'package:widgets/widgets/widgets.dart';

class PageIndicatorWidget extends StatelessWidget {
  final PageController controller;
  final int pageCount;
  const PageIndicatorWidget(
      {required this.controller, required this.pageCount, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < pageCount; i++)
          if (i == controller.currentPage)
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.all(2),
              width: 7,
              height: 7,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            )
          else
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.all(2),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
      ],
    );
  }
}
