import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/data/button_data.dart';
import 'package:widgets/widgets.dart';

/// gibt liste von ausgewählten elementen zurück
class MultiSelectionController<T> extends Cubit<List<T>> {
  MultiSelectionController(super.initialState);

  void toggle(T value) {
    var state = List<T>.from(this.state);
    if (contains(value)) {
      super.emit(state..remove(value));
    } else {
      super.emit(state..add(value));
    }
  }

  bool contains(T value) {
    return state.contains(value);
  }
}

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
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<MultiSelectionController<T>, List<T>>(
          bloc: controller,
          builder: (context, state) => Wrap(
                spacing: 10,
                runSpacing: 10,
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
                                  BorderRadius.circular(ThemeConfig.kRadius)),
                          padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
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
