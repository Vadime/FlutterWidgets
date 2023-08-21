library widgets;

import 'package:flutter/material.dart';

extension WidgetBuildContextExtensions on BuildContext {
  /// get theme quickly
  ThemeData get theme => Theme.of(this);

  /// get textTheme quickly
  TextTheme get textTheme => theme.textTheme;

  /// get color scheme quickly
  ColorScheme get colorScheme => theme.colorScheme;

  /// get safeArea quickly
  EdgeInsets get safeArea => MediaQuery.of(this).padding;

  /// get bottom inset quickly
  double get bottomInset => MediaQuery.of(this).padding.bottom;

  /// get top inset quickly
  double get topInset => MediaQuery.of(this).padding.top;
}

extension WidgetTextEditingControllerExtensions on TextEditingController {
  /// set text and set selection to the end of the text
  set textToEnd(String text) {
    this.text = text;
    selectionToEnd();
  }

  /// set selecion to the end of the text
  void selectionToEnd() => selection = TextSelection.fromPosition(
      TextPosition(offset: text.length, affinity: TextAffinity.upstream));
}
