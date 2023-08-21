library widgets;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/config/theme_config.dart';
import 'package:widgets/widgets/widgets.dart';

class SegmentedButtonController<T> extends Cubit<T> {
  Function(T)? _changeCallback;
  SegmentedButtonController(super.initialState);

  void animateTo(T value) => super.emit(value);

  static SegmentedButtonController of(BuildContext context) =>
      BlocProvider.of<SegmentedButtonController>(context);

  void addListener(Function(T state) callback) {
    _changeCallback = callback;
  }

  @override
  void onChange(Change<T> change) {
    super.onChange(change);
    _changeCallback?.call(change.nextState);
  }

  void dispose() {
    _changeCallback = null;
    super.close();
  }
}

class SegmentedButtonData<T> {
  final String text;
  final T value;
  const SegmentedButtonData(this.text, this.value);
}

class SlidingSegmentedButton<T> extends StatelessWidget {
  final SegmentedButtonController<T> controller;
  final List<SegmentedButtonData<T>> segments;
  final EdgeInsets margin;
  final double radius;

  const SlidingSegmentedButton({
    required this.controller,
    required this.segments,
    this.margin = EdgeInsets.zero,
    this.radius = ThemeConfig.kRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: context.theme.cardColor, width: 4)),
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
                      width: constraints.maxWidth / segments.length - 8,
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: context.theme.primaryColor,
                        borderRadius: BorderRadius.circular(max(radius, 0)),
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
