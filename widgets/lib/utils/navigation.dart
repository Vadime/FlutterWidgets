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

  static Future<void> pushPopup(
      {required Widget widget, BuildContext? c}) async {
    return await showModalBottomSheet(
      context: c ?? context,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      showDragHandle: false,
      isScrollControlled: true,
      enableDrag: false,
      barrierColor: (c ?? context).brightness == Brightness.light
          ? Colors.black38
          : Colors.white38,
      builder: (context) => SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: context.theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(context.config.radius),
          ),
          padding: EdgeInsets.all(context.config.padding),
          margin: EdgeInsets.fromLTRB(
            // left
            context.config.paddingH,
            // top
            context.mediaQuery.padding.top + context.config.paddingH,
            // right
            context.config.paddingH,
            // bottom
            context.mediaQuery.viewInsets.bottom + context.config.paddingH,
          ).add(context.safeArea),
          child: widget,
        ),
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
  }) async {
    return await pushPopup(
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

  static Future<void> replace({required Widget widget}) async =>
      await navigator.pushReplacement(standardRoute(widget));

  static Future<void> flush({required Widget widget}) async => await navigator
      .pushAndRemoveUntil(standardRoute(widget), (route) => false);

  static bool pop() {
    if (navigator.canPop()) {
      navigator.pop();
      return true;
    }
    return false;
  }
}
