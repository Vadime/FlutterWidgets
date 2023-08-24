library widgets;

import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

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
  final EdgeInsets? padding;

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
    this.padding,
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
        padding: widget.padding ??
            EdgeInsets.fromLTRB(context.config.padding, context.config.paddingH,
                context.config.padding, context.config.paddingH),
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
            SizedBox(width: context.config.paddingH),
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
