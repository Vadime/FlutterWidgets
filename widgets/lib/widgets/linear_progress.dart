import 'package:flutter/material.dart';

class LinearProgressWidget extends StatelessWidget {
  final double progress;

  /// The border radius of the progress indicator.
  final double radius;

  /// The duration of the animation in milliseconds.
  final int duration;

  /// margin of the progress indicator.
  final EdgeInsets margin;

  final double? thickness;

  final Color? backgroundColor;

  const LinearProgressWidget(
    this.progress, {
    this.radius = 10,
    this.duration = 200,
    this.margin = EdgeInsets.zero,
    this.thickness,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: duration),
            curve: Curves.easeInOut,
            tween: Tween<double>(
              begin: 0,
              end: progress,
            ),
            builder: (context, value, _) => LinearProgressIndicator(
              value: value,
              minHeight: thickness,
              color: Theme.of(context).primaryColor,
              backgroundColor: backgroundColor,
            ),
          ),
        ),
      );
}
