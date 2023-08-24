import 'package:flutter/services.dart';

class IbanFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedText = newValue.text;

    // Remove all non-alphanumeric characters and spaces
    formattedText = formattedText.replaceAll(RegExp(r'[^\w\s]'), '');

    // Add 'DE' prefix if the length is less than 2
    if (formattedText.length < 2) {
      formattedText = 'DE';
    } else if (formattedText.length >= 4) {
      // Insert space after every 4 characters (except at the beginning)
      formattedText = formattedText.replaceRange(
          2,
          formattedText.length,
          formattedText.substring(2).replaceAllMapped(
              RegExp(r'.{4}'), (match) => '${match.group(0)} '));
    }

    // Limit the length to 27 characters
    if (formattedText.length > 27) {
      formattedText = formattedText.substring(0, 27);
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
