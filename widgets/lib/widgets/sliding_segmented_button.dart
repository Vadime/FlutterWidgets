library widgets;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/widgets.dart';

class SlidingSegmentedButton<T> extends StatelessWidget {
  final SegmentedButtonController<T> controller;
  final List<ButtonData<T>> segments;
  final EdgeInsets margin;
  final double? radius;
  final double borderWidth = 4;
  double get borderWIdthD => borderWidth * 2;

  const SlidingSegmentedButton({
    required this.controller,
    required this.segments,
    this.margin = EdgeInsets.zero,
    this.radius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kTextTabBarHeight,
      decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(radius ?? context.config.radius),
          border:
              Border.all(color: context.theme.cardColor, width: borderWidth)),
      margin: margin,
      child: BlocBuilder<SegmentedButtonController<T>, T>(
        bloc: controller,
        builder: (context, state) {
          return LayoutBuilder(builder: (context, constraints) {
            return Stack(
              children: [
                Positioned.fill(
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: segments
                          .map((e) => GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () => controller.animateTo(e.value),
                                child: SizedBox(
                                  width: constraints.maxWidth / segments.length,
                                  child: Center(
                                    child: Text(e.text),
                                  ),
                                ),
                              ))
                          .toList()),
                ),
                AnimatedPositioned(
                  left: (constraints.maxWidth / segments.length) *
                      segments.indexWhere((e) => e.value == state),
                  top: 0,
                  bottom: 0,
                  duration: const Duration(milliseconds: 100),
                  child: Container(
                      width:
                          constraints.maxWidth / segments.length - borderWIdthD,
                      margin: EdgeInsets.all(borderWidth),
                      decoration: BoxDecoration(
                        color: context.theme.primaryColor,
                        borderRadius: BorderRadius.circular(max(
                            (radius ?? context.config.radius - borderWidth),
                            0)),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        segments.firstWhere((e) => e.value == state).text,
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      )),
                ),
              ],
            );
          });
        },
      ),
    );
  }
}
