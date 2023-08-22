library widgets;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgets/widgets.dart';

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
        errorRegex: RegExp(r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$'),
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
        errorRegex: RegExp(r'[0-9a-zA-Z]{6}'),
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
        errorRegex: RegExp(r"^[a-zA-Z\s'-]+$"),
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
          LengthLimitingTextInputFormatter(12),
        ],
      );

  // one number congiuration
  factory TextFieldController.number({
    String? labelText,
    String? errorText,
    String? text,
  }) =>
      TextFieldController(
        labelText,
        errorRegex: RegExp(r'^[0-9]$'),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: widget.controller.labelText,
                  errorText: widget.controller.calcErrorText,
                  enabled: widget.enabled ?? true,
                  errorMaxLines: 1,
                  isDense: true,
                  labelStyle: context.textTheme.bodyLarge,
                  contentPadding: EdgeInsets.zero,
                ),
                cursorColor: context.theme.primaryColor,
                keyboardType: widget.controller.keyboardType,
                style: widget.style,
                textAlignVertical: widget.textAlignVertical,
                autofocus: widget.autofocus ?? false,
                obscureText:
                    widget.controller.obscureText && widget.controller.visible,
                autocorrect: widget.autocorrect ?? false,
                enableSuggestions: widget.enableSuggestions ?? false,
                maxLines: widget.maxLines ?? 1,
                minLines: widget.minLines,
                expands: widget.expands ?? false,
                maxLength: widget.maxLength,
                onEditingComplete: widget.onEditingComplete,
                onSubmitted: widget.onSubmitted,
                inputFormatters: widget.controller.inputFormatters,
                enabled: widget.enabled,
                enableInteractiveSelection:
                    widget.enableInteractiveSelection ?? true,
                onTap: widget.onTap,
                autofillHints: widget.autofillHints,
              ),
            ),
            const SizedBox(width: ThemeConfig.kPaddingH),
            if (widget.controller.obscureText)
              IconButton(
                padding: const EdgeInsets.all(8),
                iconSize: 20,
                style: const ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: MaterialStatePropertyAll(Size.zero),
                ),
                onPressed: () => setState(() {
                  widget.controller.visible = !widget.controller.visible;
                }),
                icon: Icon(widget.controller.visible
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded),
              )
          ],
        ),
      );
}
