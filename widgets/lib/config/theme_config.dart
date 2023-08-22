import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeConfig {
  final Brightness brightness;

  final Color primaryColor;
  final Color backgroundColor;
  final Color cardColor;
  final Color neutralColor;
  final Color textColor;

  static const double kPaddingD = kPadding * 2;
  static const double kPadding = 20;
  static const double kPaddingH = kPadding / 2;

  static const double kRadius = 10;
  static const double kOpacity = 0.8;

  const ThemeConfig({
    required this.brightness,
    required this.primaryColor,
    required this.backgroundColor,
    required this.cardColor,
    required this.neutralColor,
    required this.textColor,
  });

  static ThemeConfig light = ThemeConfig(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    backgroundColor: Colors.grey.shade200,
    cardColor: Colors.white,
    neutralColor: Colors.grey,
    textColor: Colors.black,
  );

  static ThemeConfig dark = ThemeConfig(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    cardColor: Colors.grey.shade800,
    backgroundColor: Colors.grey.shade900,
    neutralColor: Colors.grey,
    textColor: Colors.white,
  );

  // factory fromTheme
  factory ThemeConfig.fromTheme(ThemeData theme) => ThemeConfig(
        brightness: theme.brightness,
        primaryColor: theme.primaryColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        cardColor: theme.cardColor,
        neutralColor: theme.dividerColor,
        textColor: theme.textTheme.bodyLarge?.color ?? Colors.black,
      );

  // copyWith
  ThemeConfig copyWith({
    Brightness? brightness,
    MaterialColor? primaryColor,
    Color? backgroundColor,
    Color? cardColor,
    Color? neutralColor,
    Color? textColor,
  }) =>
      ThemeConfig(
        brightness: brightness ?? this.brightness,
        primaryColor: primaryColor ?? this.primaryColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        cardColor: cardColor ?? this.cardColor,
        neutralColor: neutralColor ?? this.neutralColor,
        textColor: textColor ?? this.textColor,
      );

  // of context
  static ThemeConfig of(BuildContext context) =>
      ThemeConfig.fromTheme(Theme.of(context));

  // gen ThemeData
  ThemeData genTheme() => ThemeData(
        useMaterial3: true,
        // colors
        primaryColor: primaryColor,
        cardColor: cardColor,
        scaffoldBackgroundColor: backgroundColor,
        shadowColor: Colors.transparent,
        hintColor: neutralColor,
        canvasColor: backgroundColor,
        dividerColor: neutralColor,
        indicatorColor: primaryColor,
        applyElevationOverlayColor: false,
        primaryColorDark: primaryColor,
        primaryColorLight: primaryColor,
        disabledColor: neutralColor,
        secondaryHeaderColor: primaryColor,
        dialogBackgroundColor: backgroundColor,
        unselectedWidgetColor: neutralColor,
        colorScheme: ColorScheme.fromSeed(
            seedColor: primaryColor, brightness: brightness),
        // text
        fontFamily: 'Varela Round',
        textTheme: TextTheme(
          labelSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: textColor.withOpacity(kOpacity),
          ),
          labelMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          labelLarge: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          bodySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: textColor.withOpacity(kOpacity),
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          bodyLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          titleSmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: textColor.withOpacity(kOpacity),
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          headlineSmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: textColor.withOpacity(kOpacity),
          ),
          headlineMedium: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          headlineLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        // input
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
        ),
        // card
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadius),
          ),
          elevation: 0,
          color: cardColor,
          margin: EdgeInsets.zero,
        ),

        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(kRadius),
          ),
          textStyle: TextStyle(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        // button
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadius),
          ),
          padding: EdgeInsets.zero,
          buttonColor: primaryColor,
          textTheme: ButtonTextTheme.primary,
        ),
        // elevatedButton
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kRadius),
            ),
            padding: EdgeInsets.zero,
            elevation: 0,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
          ),
        ),
        // outlinedButton
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kRadius),
            ),
            foregroundColor: primaryColor,
            padding: const EdgeInsets.all(kPaddingH),
            elevation: 0,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        // textButton
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kRadius),
            ),
            padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
            foregroundColor: primaryColor,
            elevation: 0,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        // slider
        sliderTheme: SliderThemeData(
          activeTrackColor: primaryColor,
          inactiveTrackColor: neutralColor,
          thumbColor: primaryColor,
          overlayColor: primaryColor.withOpacity(0.1),
          trackHeight: 2,
          thumbShape: const RoundSliderThumbShape(
            enabledThumbRadius: kRadius,
          ),
          overlayShape: const RoundSliderOverlayShape(
            overlayRadius: kRadius,
          ),
        ),
        // progress
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: primaryColor,
          circularTrackColor: neutralColor,
          linearTrackColor: neutralColor,
        ),
        // divider
        dividerTheme: DividerThemeData(
          color: neutralColor,
          thickness: 1,
          space: 0,
        ),
        // dialog
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadius),
          ),
        ),
        // bottomSheet
        bottomSheetTheme: BottomSheetThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadius),
          ),
          backgroundColor: cardColor,
          elevation: 0,
          modalBackgroundColor: cardColor,
          modalElevation: 0,
        ),
        // popupMenu
        popupMenuTheme: PopupMenuThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadius),
          ),
          color: cardColor,
          elevation: 0,
        ),
        // bottomNavigationBar
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: cardColor.withOpacity(kOpacity),
          elevation: 0,
          selectedItemColor: primaryColor,
          unselectedItemColor: neutralColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
        ),
        // bottomAppBar
        bottomAppBarTheme: const BottomAppBarTheme(
          elevation: 0,
        ),
        // appBar
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: cardColor.withOpacity(kOpacity),
          systemOverlayStyle: brightness != Brightness.light
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
          iconTheme: IconThemeData(
            color: textColor,
          ),
          actionsIconTheme: IconThemeData(
            color: textColor,
          ),
          titleTextStyle: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        // snackBar
        snackBarTheme: SnackBarThemeData(
          elevation: 0,
          backgroundColor: cardColor,
          showCloseIcon: true,
          closeIconColor: textColor,
          contentTextStyle: TextStyle(
            color: textColor,
            fontSize: 14,
          ),
        ),
        // listtile
        listTileTheme: ListTileThemeData(
          contentPadding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadius),
          ),
          minLeadingWidth: 0,
          horizontalTitleGap: 0,
          minVerticalPadding: 0,
          tileColor: cardColor,
          iconColor: textColor,
          visualDensity: VisualDensity.compact,
        ),
      );
}
