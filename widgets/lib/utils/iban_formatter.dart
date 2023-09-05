import 'package:flutter/services.dart';

class IbanFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String inputText = newValue.text;

    // Remove all non-alphanumeric characters except spaces
    String formattedText = inputText.replaceAll(RegExp(r'[^0-9]|\s'), '');
    formattedText = 'DE$formattedText';

    // Insert space after every 4 characters (except at the beginning)
    formattedText = formattedText.replaceAllMapped(
        RegExp(r'.{4}'), (match) => '${match.group(0)} ');

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
