import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/widgets.dart';

/// gibt liste von ausgewählten elementen zurück
class SingleSelectionController<T> extends Cubit<T?> {
  SingleSelectionController(super.initialState);

  void toggle(T value) {
    if (state == value) {
      super.emit(null);
    } else {
      super.emit(value);
    }
  }
}

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
      margin: margin,
      padding: const EdgeInsets.all(ThemeConfig.kPaddingH),
      child: BlocBuilder<SingleSelectionController<T>, T?>(
          bloc: controller,
          builder: (context, state) => Wrap(
                spacing: ThemeConfig.kPaddingH,
                runSpacing: ThemeConfig.kPaddingH,
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
                              color: state == e.value
                                  ? context.theme.primaryColor
                                  : context.theme.scaffoldBackgroundColor,
                              borderRadius:
                                  BorderRadius.circular(ThemeConfig.kRadius)),
                          padding: const EdgeInsets.fromLTRB(
                              ThemeConfig.kPaddingH,
                              4,
                              ThemeConfig.kPaddingH,
                              4),
                          child: Text(
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
              )),
    );
  }
}