library widgets;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/widgets/widgets.dart';

class SegmentedButtonController extends Cubit<String> {
  SegmentedButtonController(super.initialState);

  void set(String value) => super.emit(value);
}

class SegmentedButtonWidget extends StatelessWidget {
  final SegmentedButtonController controller;
  final List<String> segments;
  final EdgeInsets margin;
  const SegmentedButtonWidget({
    required this.controller,
    required this.segments,
    this.margin = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: context.theme.cardColor, width: 4)),
      margin: margin,
      child: BlocBuilder<SegmentedButtonController, String>(
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
                                onTap: () => controller.set(e),
                                child: SizedBox(
                                  width: constraints.maxWidth / segments.length,
                                  child: Center(
                                    child: Text(e),
                                  ),
                                ),
                              ))
                          .toList()),
                ),
                AnimatedPositioned(
                  left: (constraints.maxWidth / segments.length) *
                      segments.indexOf(state),
                  top: 0,
                  bottom: 0,
                  duration: const Duration(milliseconds: 100),
                  child: Container(
                      width: constraints.maxWidth / segments.length,
                      decoration: BoxDecoration(
                        color: context.theme.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        state,
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
