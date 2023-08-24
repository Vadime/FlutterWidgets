import 'package:flutter/material.dart';

class RefreshWidget extends StatelessWidget {
  final Widget child;
  final bool enabled;
  final Future<void> Function() onRefresh;
  const RefreshWidget(
      {required this.child,
      required this.onRefresh,
      this.enabled = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;
    return RefreshIndicator(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        color: Theme.of(context).primaryColor,
        strokeWidth: 2,
        edgeOffset: MediaQuery.of(context).padding.top,
        onRefresh: onRefresh,
        child: child);
  }
}
