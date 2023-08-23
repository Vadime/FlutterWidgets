import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? align;
  final TextOverflow? overflow;
  final int? maxLines;

  final EdgeInsets margin;
  final Function()? onTap;

  final Color? color;
  final double? size;
  final FontWeight? weight;

  const TextWidget(
    this.data, {
    this.style,
    this.align,
    this.overflow,
    this.maxLines,
    this.margin = EdgeInsets.zero,
    this.size,
    this.onTap,
    this.color,
    this.weight,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: margin,
          child: Text(
            data,
            style: style?.copyWith(
              color: color,
              fontSize: size,
              fontWeight: weight,
            ),
            textAlign: align,
            overflow: overflow,
            maxLines: maxLines,
          ),
        ),
      );
}
