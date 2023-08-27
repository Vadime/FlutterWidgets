library widgets;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/widgets.dart';

class SlidingSegmentedButton<T> extends StatelessWidget {
  final SegmentedButtonController<T> controller;
  final List<ButtonData<T>> segments;
  final EdgeInsets margin;

  const SlidingSegmentedButton({
    required this.controller,
    required this.segments,
    this.margin = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardWidget.single(
        backgroundColor: context.theme.cardColor,
        margin: margin,
        padding: EdgeInsets.all(context.config.borderWidth),
        child: CardWidget.single(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          child: BlocBuilder<SegmentedButtonController<T>, T>(
            bloc: controller,
            builder: (context, state) {
              return LayoutBuilder(builder: (context, constraints) {
                return Stack(
                  children: [
                    Row(
                        mainAxisSize: MainAxisSize.max,
                        children: segments
                            .map((e) => GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () => controller.toggle(e.value),
                                  child: SizedBox(
                                    width:
                                        constraints.maxWidth / segments.length,
                                    child: TextWidget(
                                      e.text,
                                      align: TextAlign.center,
                                      margin: EdgeInsets.fromLTRB(
                                        context.config.paddingH,
                                        context.config.paddingH,
                                        context.config.paddingH,
                                        context.config.paddingH,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList()),
                    AnimatedPositioned(
                      left: (constraints.maxWidth / segments.length) *
                          segments.indexWhere((e) => e.value == state),
                      top: 0,
                      bottom: 0,
                      duration: const Duration(milliseconds: 100),
                      child: Container(
                          width: constraints.maxWidth / segments.length -
                              context.config.paddingH,
                          margin: EdgeInsets.all(context.config.paddingH / 2),
                          decoration: BoxDecoration(
                            color: context.theme.primaryColor,
                            borderRadius:
                                BorderRadius.circular(context.config.radius),
                          ),
                          alignment: Alignment.center,
                          child: TextWidget(
                            segments.firstWhere((e) => e.value == state).text,
                            style: context.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            margin: EdgeInsets.fromLTRB(
                              context.config.paddingH,
                              context.config.paddingH / 2,
                              context.config.paddingH,
                              context.config.paddingH / 2,
                            ),
                          )),
                    ),
                  ],
                );
              });
            },
          ),
        ));
  }
}
