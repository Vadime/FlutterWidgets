library utils;

import 'package:flutter/material.dart';

extension on BuildContext {
  // get theme quickly
  ThemeData get theme => Theme.of(this);

  // get textTheme quickly
  TextTheme get textTheme => theme.textTheme;

  // get bottom inset quickly
  double get bottomInset => MediaQuery.of(this).padding.bottom;
}

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
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.fromLTRB(
          10,
          0,
          10,
          context.bottomInset +
              MediaQuery.of(navigatorKey.currentContext!).viewInsets.bottom +
              10,
        ),
        child: widget,
      ),
    );
  }

  static void pushMessage({String? message}) {
    if (message == null) return;
    pushPopup(
      widget: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Message',
              style: navigatorKey.currentContext!.textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Text(message),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigation.pop(),
              child: const Text('OK'),
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
