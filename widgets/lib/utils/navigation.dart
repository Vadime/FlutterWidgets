import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class Navigation {
  static GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  static BuildContext get context => key.currentContext!;

  static NavigatorState get navigator => key.currentState!;

  static MaterialPageRoute standardRoute(Widget widget) {
    LoadingController().enableInput();
    return MaterialPageRoute(builder: (context) => widget);
  }

  static Future<void> push({required Widget widget}) async =>
      await navigator.push(standardRoute(widget));

  static void pushPopup({required Widget widget}) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      showDragHandle: false,
      isScrollControlled: true,
      enableDrag: false,
      barrierColor: context.brightness == Brightness.light
          ? Colors.black38
          : Colors.white38,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(context.config.radius),
        ),
        padding: EdgeInsets.all(context.config.padding),
        margin: EdgeInsets.fromLTRB(
          context.config.paddingH,
          0,
          context.config.paddingH,
          context.bottomInset +
              MediaQuery.of(context).viewInsets.bottom +
              context.config.paddingH,
        ),
        child: widget,
      ),
    );
  }

  static void pushDatePicker({
    DateTime? initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    Function(DateTime)? onChanged,

    /// for dirthdays use DatePickerMode.year
    DatePickerMode initialCalendarMode = DatePickerMode.day,
  }) {
    return pushPopup(
      widget: CalendarDatePicker(
          initialDate: initialDate ?? DateTime.now(),
          firstDate: firstDate,
          lastDate: lastDate,
          initialCalendarMode: initialCalendarMode,
          onDateChanged: (date) {
            onChanged?.call(date);
            Navigation.pop();
          }),
    );
  }

  static void pushErrorMessage({String? message}) =>
      _pushMessage(message: message, color: context.theme.colorScheme.error);

  static void pushMessage({String? message}) =>
      _pushMessage(message: message, color: context.theme.colorScheme.primary);

  static void _pushMessage({String? message, Color? color}) {
    if (message == null) return;
    pushPopup(
      widget: Row(
        children: [
          Expanded(
              child: Text(message,
                  style: context.textTheme.labelLarge!.copyWith(color: color))),
          SizedBox(height: context.config.padding),
          TextButtonWidget(
            'OK',
            onPressed: () => Navigation.pop(),
          ),
        ],
      ),
    );
  }

  static Future<void> replace({required Widget widget}) async =>
      await navigator.pushReplacement(standardRoute(widget));

  static Future<void> flush({required Widget widget}) async => await navigator
      .pushAndRemoveUntil(standardRoute(widget), (route) => false);

  static void pop() => navigator.pop();
}
