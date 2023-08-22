import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class Navigation {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<void> push({required Widget widget}) async =>
      await navigatorKey.currentState!
          .push(MaterialPageRoute(builder: (context) => widget));

  static void pushPopup({required Widget widget}) async {
    await showModalBottomSheet(
      context: navigatorKey.currentContext!,
      backgroundColor: Colors.transparent,
      showDragHandle: false,
      isScrollControlled: true,
      enableDrag: false,
      barrierColor: Colors.black38,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(ThemeConfig.kRadius),
        ),
        margin: EdgeInsets.fromLTRB(
          ThemeConfig.kPaddingH,
          0,
          ThemeConfig.kPaddingH,
          context.bottomInset +
              MediaQuery.of(navigatorKey.currentContext!).viewInsets.bottom +
              ThemeConfig.kPaddingH,
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
      widget: Padding(
        padding: const EdgeInsets.all(ThemeConfig.kPadding),
        child: CalendarDatePicker(
            initialDate: initialDate ?? DateTime.now(),
            firstDate: firstDate,
            lastDate: lastDate,
            initialCalendarMode: initialCalendarMode,
            onDateChanged: (date) {
              onChanged?.call(date);
              Navigation.pop();
            }),
      ),
    );
  }

  static void pushMessage({String? message}) {
    if (message == null) return;
    pushPopup(
      widget: Padding(
        padding: const EdgeInsets.all(ThemeConfig.kPadding),
        child: Row(
          children: [
            Expanded(
                child: Text(message,
                    style: navigatorKey.currentContext!.textTheme.labelLarge!
                        .copyWith(
                            color: navigatorKey
                                .currentContext!.theme.colorScheme.error))),
            const SizedBox(height: ThemeConfig.kPadding),
            TextButtonWidget(
              'OK',
              onPressed: () => Navigation.pop(),
            ),
          ],
        ),
      ),
    );
  }

  static void pushLoading(
          {Widget waitWidget =
              const Center(child: CircularProgressIndicator.adaptive())}) =>
      showDialog(
        context: navigatorKey.currentContext!,
        barrierDismissible: false,
        barrierColor:
            navigatorKey.currentContext!.theme.brightness == Brightness.light
                ? Colors.white38
                : Colors.black38,
        builder: (context) => waitWidget,
      );

  static Future<void> replace({required Widget widget}) async =>
      await navigatorKey.currentState!
          .pushReplacement(MaterialPageRoute(builder: (context) => widget));

  static Future<void> flush({required Widget widget}) async =>
      await navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget),
        (route) => false,
      );

  static void pop() => navigatorKey.currentState!.pop();
}
