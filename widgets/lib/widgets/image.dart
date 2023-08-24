import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class ImageWidget extends StatelessWidget {
  final ImageProvider image;
  final double? width;
  final double? height;
  final BoxFit fit;
  final EdgeInsets margin;
  final double? radius;

  const ImageWidget(
    this.image, {
    this.fit = BoxFit.cover,
    this.margin = EdgeInsets.zero,
    this.radius,
    this.height,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? context.config.radius),
        child: Image(
          image: image,
          fit: fit,
          width: width,
          height: height,
          errorBuilder: (context, error, stackTrace) => Container(
            color: context.colorScheme.error.withOpacity(0.6),
            width: width,
            height: height,
          ),
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
              child,
          loadingBuilder: (context, child, loadingProgress) =>
              loadingProgress == null
                  ? child
                  : Container(
                      color: context.config
                          .neutralColor(context.brightness)
                          .withOpacity(0.6),
                      width: width,
                      height: height,
                    ),
        ),
      ),
    );
  }
}
