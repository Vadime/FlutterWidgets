import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/widgets.dart';

class SingleSelectionButton<T> extends StatelessWidget {
  final SingleSelectionController<T> controller;
  final List<ButtonData<T>> buttons;
  final EdgeInsets margin;
  const SingleSelectionButton({
    required this.buttons,
    required this.controller,
    this.margin = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardWidget.single(
        backgroundColor: context.theme.cardColor,
        margin: margin,
        padding: EdgeInsets.all(context.config.paddingH),
        child: BlocBuilder<SingleSelectionController<T>, T?>(
            bloc: controller,
            builder: (context, state) => Wrap(
                  spacing: context.config.paddingH / 2,
                  runSpacing: context.config.paddingH / 2,
                  alignment: WrapAlignment.center,
                  children: buttons
                      .map(
                        (e) => GestureDetector(
                          onTap: () => controller.toggle(e.value),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            decoration: BoxDecoration(
                                color: state == e.value
                                    ? context.theme.primaryColor
                                    : context.theme.scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(
                                    context.config.radius)),
                            padding: EdgeInsets.fromLTRB(
                              context.config.paddingH,
                              context.config.paddingH / 2,
                              context.config.paddingH,
                              context.config.paddingH / 2,
                            ),
                            child: TextWidget(
                              e.text,
                              style: state == e.value
                                  ? context.textTheme.bodyMedium!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    )
                                  : context.textTheme.bodyMedium!,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )));
  }
}
