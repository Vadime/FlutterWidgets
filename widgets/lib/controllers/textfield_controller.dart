import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgets/utils/iban_formatter.dart';

class TextFieldController extends TextEditingController {
  final String? labelText;
  final TextInputType? keyboardType;
  final bool obscureText;
  RegExp? errorRegex;
  String? errorText;
  late bool visible;
  final List<TextInputFormatter>? inputFormatters;
  bool _emptyAllowed = true;

  TextFieldController(
    this.labelText, {
    this.errorRegex,
    this.errorText,
    this.keyboardType,
    this.obscureText = false,
    this.inputFormatters,
    super.text,
  }) {
    visible = obscureText;
  }

  // email congiuration
  factory TextFieldController.email({
    String? labelText = 'Email',
    String? errorText = 'Invalid email',
    String? text,
  }) =>
      TextFieldController(
        labelText,
        errorRegex: RegExp(r'^[\w\.-]+@[a-zA-Zäßüö\d\.-]+\.[a-zA-Z]{2,}$'),
        errorText: errorText,
        keyboardType: TextInputType.emailAddress,
        text: text,
      );

  // password congiuration
  factory TextFieldController.password({
    String? labelText = 'Password',
    String? errorText = 'Invalid password',
    String? text,
  }) =>
      TextFieldController(
        labelText,
        errorRegex: RegExp(r'[0-9a-zA-Zäßüö]{6}'),
        errorText: errorText,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        text: text,
      );

  // name congiuration
  factory TextFieldController.name({
    String? labelText = 'Name',
    String? errorText = 'Invalid name',
    String? text,
  }) =>
      TextFieldController(
        labelText,
        errorRegex: RegExp(r"^[a-zA-Zäßüö\s'-]+$", unicode: true),
        errorText: errorText,
        keyboardType: TextInputType.name,
        text: text,
      );

  // phone congiuration
  factory TextFieldController.phone({
    String? labelText = 'Phone',
    String? errorText = 'Invalid phone',
    String? text,
  }) =>
      TextFieldController(
        labelText,
        errorRegex: RegExp(r'^[0-9\s\-\(\)+-]+$'),
        errorText: errorText,
        keyboardType: TextInputType.phone,
        text: text,
        inputFormatters: [
          LengthLimitingTextInputFormatter(14),
        ],
      );

  // one number congiuration
  factory TextFieldController.number({
    String? labelText = 'Number',
    String? errorText = 'Invalid number',
    String? text,
  }) =>
      TextFieldController(
        labelText,
        errorRegex: RegExp(r'^[0-9]+$'),
        errorText: errorText,
        keyboardType: TextInputType.number,
        text: text,
      );
  // code congiuration
  factory TextFieldController.code({
    String? labelText = 'Code',
    String? errorText = 'Invalid code',
    String? text,
  }) =>
      TextFieldController(
        labelText,
        errorRegex: RegExp(r'^[0-9]*$'),
        errorText: errorText,
        keyboardType: TextInputType.number,
        text: text,
      );

  // iban congiuration
  factory TextFieldController.iban({
    String? labelText = 'IBAN',
    String? errorText = 'Invalid IBAN',
    String? text,
  }) =>
      TextFieldController(
        labelText,
        errorRegex: RegExp(r'^[A-Z]{2}[0-9]{2}[a-zA-Z0-9]{1,30}$'),
        errorText: errorText,
        keyboardType: TextInputType.text,
        text: text,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(
              r'[A-Za-z0-9\s]')), // Allow only alphanumeric characters and spaces
          LengthLimitingTextInputFormatter(27),
          IbanFormatter(),
        ],
      );

  String? get calcErrorText =>
      isValid(emptyAllowed: _emptyAllowed) ? null : errorText;

  bool isValid({bool emptyAllowed = false}) {
    final condition = emptyAllowed ? text.isNotEmpty : text.isEmpty;
    if (errorRegex != null && condition) {
      return errorRegex!.hasMatch(text);
    }
    return true;
  }

  /// this makes the errorText to show
  /// instead of pushing a popup like we used to do
  set emptyAllowed(bool value) {
    _emptyAllowed = value;
    notifyListeners();
  }
}
