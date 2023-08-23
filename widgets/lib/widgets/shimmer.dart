import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:widgets/widgets.dart';

class ShimmerWidget extends StatelessWidget {
  final Widget child;
  const ShimmerWidget({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).disabledColor,
      highlightColor: Theme.of(context).highlightColor,
      direction: ShimmerDirection.ltr,
      period: const Duration(milliseconds: 600),
      child: Padding(
          padding: EdgeInsets.all(context.config.padding), child: child),
    );
  }

  // to load ListTiles
  factory ShimmerWidget.listTile() => ShimmerWidget(
        child: Builder(
          builder: (context) => ListTile(
            title: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).disabledColor,
                  ),
                  height: 14,
                  width: 100,
                ),
                const Spacer()
              ],
            ),
            subtitle: Container(
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(AppTheme.borderRadius),
                color: Theme.of(context).disabledColor,
              ),
              height: 10,
              width: 100,
            ),
            trailing: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).disabledColor,
              ),
            ),
          ),
        ),
      );
  // to load Cards
  factory ShimmerWidget.card() =>
      ShimmerWidget(child: CardWidget.single(child: const SizedBox()));
}
