library widgets;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgets/config/theme_config.dart';
import 'package:widgets/widgets.dart';

class TextFieldController extends TextEditingController {
  final String? labelText;
  final TextInputType? keyboardType;
  final bool obscureText;
  RegExp? errorRegex;
  String? errorText;
  late bool visible;
  TextFieldController(
    this.labelText, {
    this.errorRegex,
    this.errorText,
    this.keyboardType,
    this.obscureText = false,
    super.text,
  }) {
    visible = !obscureText;
  }

  // email congiuration
  factory TextFieldController.email({
    String? labelText = "Email",
    String? errorText = "Invalid email",
    String? text,
  }) =>
      TextFieldController(
        labelText,
        errorRegex: RegExp(r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$'),
        errorText: errorText,
        keyboardType: TextInputType.emailAddress,
        text: text,
      );

  // password congiuration
  factory TextFieldController.password({
    String? labelText = "Password",
    String? errorText = "Invalid password",
    String? text,
  }) =>
      TextFieldController(
        labelText,
        errorRegex: RegExp(r'[0-9a-zA-Z]{6}'),
        errorText: errorText,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        text: text,
      );

  // name congiuration
  factory TextFieldController.name({
    String? labelText = "Name",
    String? errorText = "Invalid name",
    String? text,
  }) =>
      TextFieldController(
        labelText,
        errorRegex: RegExp(r"^[a-zA-Z\s'-]+$"),
        errorText: errorText,
        keyboardType: TextInputType.name,
        text: text,
      );

  // phone congiuration
  factory TextFieldController.phone({
    String? labelText = "Phone",
    String? errorText = "Invalid phone",
    String? text,
  }) =>
      TextFieldController(
        labelText,
        errorRegex: RegExp(r'^[0-9]{10}$'),
        errorText: errorText,
        keyboardType: TextInputType.phone,
        text: text,
      );

  String? get calcErrorText => isValid() ? null : errorText;

  bool isValid() {
    if (errorRegex != null && text.isNotEmpty) {
      return errorRegex!.hasMatch(text);
    }
    return true;
  }
}

class TextFieldWidget extends StatefulWidget {
  final TextFieldController controller;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool? autofocus;
  final bool? autocorrect;
  final bool? enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool? expands;
  final int? maxLength;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final bool? enableInteractiveSelection;
  final GestureTapCallback? onTap;
  final Iterable<String>? autofillHints;
  final EdgeInsets margin;
  final EdgeInsets padding;

  const TextFieldWidget(
    this.controller, {
    this.style,
    this.textAlign,
    this.textAlignVertical,
    this.autofocus,
    this.autocorrect,
    this.enableSuggestions,
    this.maxLines,
    this.minLines,
    this.expands,
    this.maxLength,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.enableInteractiveSelection,
    this.onTap,
    this.autofillHints,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.fromLTRB(ThemeConfig.kPadding,
        ThemeConfig.kPaddingH, ThemeConfig.kPadding, ThemeConfig.kPaddingH),
    super.key,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  void initState() {
    widget.controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CardWidget.single(
        margin: widget.margin,
        padding: widget.padding,
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: widget.controller.labelText,
            errorText: widget.controller.calcErrorText,
            enabled: widget.enabled ?? true,
            errorMaxLines: 1,
            isDense: true,
            contentPadding: EdgeInsets.zero,
          ),
          keyboardType: widget.controller.keyboardType,
          style: widget.style,
          textAlignVertical: widget.textAlignVertical,
          autofocus: widget.autofocus ?? false,
          obscureText: widget.controller.obscureText,
          autocorrect: widget.autocorrect ?? false,
          enableSuggestions: widget.enableSuggestions ?? false,
          maxLines: widget.maxLines ?? 1,
          minLines: widget.minLines,
          expands: widget.expands ?? false,
          maxLength: widget.maxLength,
          onEditingComplete: widget.onEditingComplete,
          onSubmitted: widget.onSubmitted,
          inputFormatters: widget.inputFormatters,
          enabled: widget.enabled,
          enableInteractiveSelection: widget.enableInteractiveSelection ?? true,
          onTap: widget.onTap,
          autofillHints: widget.autofillHints,
        ),
      );
}
