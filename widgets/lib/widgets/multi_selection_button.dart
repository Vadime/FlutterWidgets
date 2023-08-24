import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/widgets.dart';

class MultiSelectionButton<T> extends StatelessWidget {
  final MultiSelectionController<T> controller;
  final List<ButtonData<T>> buttons;
  final EdgeInsets margin;
  const MultiSelectionButton({
    required this.buttons,
    required this.controller,
    this.margin = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardWidget.single(
      margin: margin,
      padding: EdgeInsets.all(context.config.paddingH),
      child: BlocBuilder<MultiSelectionController<T>, List<T>>(
          bloc: controller,
          builder: (context, state) => Wrap(
                spacing: context.config.paddingH,
                runSpacing: context.config.paddingH,
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: buttons
                    .map(
                      (e) => GestureDetector(
                        onTap: () => controller.toggle(e.value),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          decoration: BoxDecoration(
                              color: state.contains(e.value)
                                  ? context.theme.primaryColor
                                  : context.theme.scaffoldBackgroundColor,
                              borderRadius:
                                  BorderRadius.circular(context.config.radius)),
                          padding: EdgeInsets.fromLTRB(context.config.paddingH,
                              4, context.config.paddingH, 4),
                          child: Text(
                            e.text,
                            style: state.contains(e.value)
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
              )),
    );
  }
}
