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
  String? _extraError;

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
        errorRegex: RegExp(r'^[\w\.-]+@[a-zA-ZäßüöÄÜÖ\d\.-]+\.[a-zA-Z]{2,}$'),
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
        errorRegex: RegExp(r'[0-9a-zA-ZäßüöÄÜÖ]{6}'),
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
        errorRegex: RegExp(r"^[a-zA-ZäßüöÄÜÖ\s'-]+$", unicode: true),
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
          LengthLimitingTextInputFormatter(16),
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

  String? calcErrorText(bool allowEmpty) {
    if (_extraError != null) {
      if (!isValid(allowEmpty: allowEmpty)) {
        return errorText;
      }
      return _extraError;
    }
    if (isValid(allowEmpty: allowEmpty)) {
      return null;
    } else {
      return errorText;
    }
  }

  bool isValid({bool allowEmpty = false}) {
    var finalAllowEmpty = allowEmpty ? text.isNotEmpty : text.isEmpty;
    if (errorRegex != null && finalAllowEmpty) {
      return errorRegex!.hasMatch(text);
    }
    return true;
  }

  setError(String error) {
    _extraError = error;
    notifyListeners();
  }
}
