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

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      const Center(child: CircularProgressIndicator.adaptive());
}

class FailWidget extends StatelessWidget {
  final Object error;
  const FailWidget(this.error, {super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          error.toString(),
          style: TextStyle(color: context.colorScheme.error),
        ),
      );
}

class LogoWidget extends StatelessWidget {
  final String data;
  final double size;
  const LogoWidget(
    this.data, {
    this.size = 28,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: Image.asset(
          data,
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      );
}

class DividerWidget extends StatelessWidget {
  final String data;
  final double verticalPadding;
  final double outerHorizontalPadding;
  final double innerHorizontalPadding;

  const DividerWidget(
    this.data, {
    this.verticalPadding = 10,
    this.outerHorizontalPadding = 20,
    this.innerHorizontalPadding = 10,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(height: verticalPadding),
          Row(
            children: [
              SizedBox(width: outerHorizontalPadding),
              const Expanded(
                  child: Divider(
                thickness: 2,
              )),
              SizedBox(width: innerHorizontalPadding),
              Text(
                data,
                style: context.textTheme.labelMedium,
              ),
              SizedBox(width: outerHorizontalPadding),
              const Expanded(
                  child: Divider(
                thickness: 2,
              )),
              SizedBox(width: outerHorizontalPadding),
            ],
          ),
          SizedBox(height: verticalPadding),
        ],
      );
}

class CardWidget extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets padding, margin;
  final Color? backgroundColor;

  const CardWidget({
    required this.children,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    this.backgroundColor,
    super.key,
  });

  factory CardWidget.single({
    required Widget child,
    EdgeInsets padding = const EdgeInsets.all(0),
    EdgeInsets margin = const EdgeInsets.all(0),
    Color? backgroundColor,
    Key? key,
  }) =>
      CardWidget(
        padding: padding,
        margin: margin,
        key: key,
        backgroundColor: backgroundColor,
        children: [child],
      );

  @override
  Widget build(BuildContext context) => Card(
        color: backgroundColor,
        margin: margin,
        child: Padding(
          padding: padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ),
      );
}

class ListTileWidget extends StatelessWidget {
  final EdgeInsets margin;
  final EdgeInsets? padding;
  final String? title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final Function()? onTap;
  final Color? tileColor;
  final bool selected;
  final Color? selectedTileColor;

  const ListTileWidget({
    this.margin = EdgeInsets.zero,
    this.padding,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.tileColor,
    this.selected = false,
    this.selectedTileColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: ListTile(
          onTap: onTap,
          selected: selected,
          selectedTileColor: selectedTileColor,
          contentPadding: padding,
          minVerticalPadding: (padding?.horizontal ?? 0) / 2,
          tileColor: tileColor,
          title: title == null ? null : Text(title!),
          subtitle: subtitle == null ? null : Text(subtitle!),
          leading: leading,
          trailing: trailing,
        ),
      );
}

class LinearProgressWidget extends StatelessWidget {
  final double progress;

  /// The border radius of the progress indicator.
  final double radius;

  /// The duration of the animation in milliseconds.
  final int duration;

  /// margin of the progress indicator.
  final EdgeInsets margin;

  final double? thickness;

  final Color? backgroundColor;

  const LinearProgressWidget(
    this.progress, {
    this.radius = 10,
    this.duration = 200,
    this.margin = EdgeInsets.zero,
    this.thickness,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: duration),
            curve: Curves.easeInOut,
            tween: Tween<double>(
              begin: 0,
              end: progress,
            ),
            builder: (context, value, _) => LinearProgressIndicator(
              value: value,
              minHeight: thickness,
              color: Theme.of(context).primaryColor,
              backgroundColor: backgroundColor,
            ),
          ),
        ),
      );
}

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final EdgeInsets margin;
  final Color? backgroundColor;

  final double? elevation;

  const ElevatedButtonWidget(
    this.text, {
    required this.onPressed,
    this.margin = EdgeInsets.zero,
    this.backgroundColor,
    this.elevation,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            elevation: elevation,
            shadowColor: (elevation == null || elevation == 0)
                ? Colors.transparent
                : context.theme.shadowColor,
          ),
          onPressed: onPressed,
          child: Text(text),
        ),
      );
}

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;

  final Function(int)? onTap;

  final List<BottomNavigationBarItem> items;

  final double radius;

  final double horizontalPadding;

  final double bottomPadding;

  const BottomNavigationBarWidget({
    this.currentIndex = 0,
    this.onTap,
    required this.items,
    this.radius = 10,
    this.horizontalPadding = 40,
    this.bottomPadding = 10,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          left: horizontalPadding,
          bottom: context.bottomInset + bottomPadding,
          right: horizontalPadding,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: MediaQuery(
            data: const MediaQueryData(
              padding: EdgeInsets.zero,
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: onTap,
              items: items,
            ),
          ),
        ),
      );
}

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String title;
  final List<Widget>? actions;

  final double radius;

  final double horizontalPadding;

  final double topPadding;

  const AppBarWidget(
    this.title, {
    super.key,
    this.leading,
    this.actions,
    this.radius = 10,
    this.horizontalPadding = 40,
    this.topPadding = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: horizontalPadding,
        top: context.topInset + topPadding,
        right: horizontalPadding,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: MediaQuery(
          data: const MediaQueryData(
            padding: EdgeInsets.zero,
          ),
          child: Hero(
            tag: 'title',
            child: AppBar(
              leading: leading ??
                  IconButton(
                    icon: Icon(Icons.adaptive.arrow_back_rounded),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
              title: FittedBox(child: Text(title)),
              actions: actions,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class TextWidget extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final TextDirection? textDirection;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  final EdgeInsets margin;

  const TextWidget(
    this.data, {
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.textDirection,
    this.locale,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.margin = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: Text(
          data,
          style: style,
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
          softWrap: softWrap,
          textDirection: textDirection,
          locale: locale,
          strutStyle: strutStyle,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
        ),
      );
}

class IconWidget extends StatelessWidget {
  final IconData data;
  final double size;
  final Color? color;
  final EdgeInsets margin;

  const IconWidget(
    this.data, {
    this.size = 24,
    this.color,
    this.margin = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: Icon(
          data,
          size: size,
          color: color,
        ),
      );
}

class ImageWidget extends StatelessWidget {
  final String data;
  final double width;
  final double height;
  final BoxFit fit;
  final EdgeInsets margin;
  final double radius;

  const ImageWidget(
    this.data, {
    this.width = double.infinity,
    this.height = double.infinity,
    this.fit = BoxFit.cover,
    this.margin = EdgeInsets.zero,
    this.radius = 10,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Image.asset(
            data,
            width: width,
            height: height,
            fit: fit,
          ),
        ),
      );
}

class TextButtonWidget extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final EdgeInsets margin;
  final Color? backgroundColor;

  const TextButtonWidget(
    this.text, {
    required this.onPressed,
    this.margin = EdgeInsets.zero,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
          ),
          onPressed: onPressed,
          child: Text(text),
        ),
      );
}
