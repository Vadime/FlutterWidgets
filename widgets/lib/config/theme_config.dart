import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeConfig {
  final String title;
  final String logoLocation;
  final Color primaryColor;

  final Color darkBackgroundColor;
  final Color darkCardColor;
  final Color darkNeutralColor;
  final Color darkTextColor;
  final Color lightBackgroundColor;
  final Color lightCardColor;
  final Color lightNeutralColor;
  final Color lightTextColor;

  final double padding;
  final double borderWidth = 4;

  final double radius;
  final double opacity;

  const ThemeConfig({
    required this.title,
    required this.logoLocation,
    required this.primaryColor,
    required this.darkBackgroundColor,
    required this.darkCardColor,
    required this.darkNeutralColor,
    required this.darkTextColor,
    required this.lightBackgroundColor,
    required this.lightCardColor,
    required this.lightNeutralColor,
    required this.lightTextColor,
    required this.opacity,
    required this.radius,
    required this.padding,
  });

  ThemeConfig.standard({
    this.title = 'Standard App',
    this.logoLocation = 'res/images/logo.png',
    this.primaryColor = Colors.blue,
    this.darkBackgroundColor = Colors.black,
    this.darkCardColor = Colors.black,
    this.darkNeutralColor = Colors.grey,
    this.darkTextColor = Colors.white,
    this.lightBackgroundColor = Colors.white,
    this.lightCardColor = Colors.white,
    this.lightNeutralColor = Colors.grey,
    this.lightTextColor = Colors.black,
    this.opacity = 0.8,
    this.radius = 10,
    this.padding = 20,
  });

  double get paddingD => padding * 2;
  double get paddingH => padding / 2;

  Color backgroundColor(Brightness brightness) => brightness == Brightness.light
      ? lightBackgroundColor
      : darkBackgroundColor;

  Color cardColor(Brightness brightness) =>
      brightness == Brightness.light ? lightCardColor : darkCardColor;

  Color neutralColor(Brightness brightness) =>
      brightness == Brightness.light ? lightNeutralColor : darkNeutralColor;

  Color textColor(Brightness brightness) =>
      brightness == Brightness.light ? lightTextColor : darkTextColor;

  // copyWith
  ThemeConfig copyWith({
    String? title,
    String? logoLocation,
    Brightness? brightness,
    Color? primaryColor,
    Color? darkBackgroundColor,
    Color? darkCardColor,
    Color? darkNeutralColor,
    Color? darkTextColor,
    Color? lightBackgroundColor,
    Color? lightCardColor,
    Color? lightNeutralColor,
    Color? lightTextColor,
    double? padding,
    double? radius,
    double? opacity,
  }) =>
      ThemeConfig(
        title: title ?? this.title,
        logoLocation: logoLocation ?? this.logoLocation,
        primaryColor: primaryColor ?? this.primaryColor,
        darkBackgroundColor: darkBackgroundColor ?? this.darkBackgroundColor,
        darkCardColor: darkCardColor ?? this.darkCardColor,
        darkNeutralColor: darkNeutralColor ?? this.darkNeutralColor,
        darkTextColor: darkTextColor ?? this.darkTextColor,
        lightBackgroundColor: lightBackgroundColor ?? this.lightBackgroundColor,
        lightCardColor: lightCardColor ?? this.lightCardColor,
        lightNeutralColor: lightNeutralColor ?? this.lightNeutralColor,
        lightTextColor: lightTextColor ?? this.lightTextColor,
        padding: padding ?? this.padding,
        radius: radius ?? this.radius,
        opacity: opacity ?? this.opacity,
      );

  // gen ThemeData
  ThemeData genTheme(Brightness brightness) => ThemeData(
        canvasColor: Colors.transparent,
        shadowColor: Colors.transparent,

        //useMaterial3: true,
        // colors
        primaryColor: primaryColor,
        cardColor: cardColor(brightness),
        scaffoldBackgroundColor: backgroundColor(brightness),

        hintColor: neutralColor(brightness),
        dividerColor: neutralColor(brightness),
        indicatorColor: primaryColor,
        applyElevationOverlayColor: false,
        primaryColorDark: primaryColor,
        primaryColorLight: primaryColor,
        disabledColor: neutralColor(brightness),
        secondaryHeaderColor: primaryColor,
        dialogBackgroundColor: backgroundColor(brightness),
        unselectedWidgetColor: neutralColor(brightness),
        colorScheme: ColorScheme.fromSeed(
            seedColor: primaryColor, brightness: brightness),
        // text
        fontFamily: 'Varela Round',
        textTheme: TextTheme(
          labelSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.9,
            color: textColor(brightness).withOpacity(opacity),
          ),
          labelMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.9,
            color: textColor(brightness),
          ),
          labelLarge: TextStyle(
            fontSize: 12,
            letterSpacing: 0.9,
            fontWeight: FontWeight.w600,
            color: textColor(brightness),
          ),
          bodySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: textColor(brightness).withOpacity(opacity),
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: textColor(brightness),
          ),
          bodyLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: textColor(brightness),
          ),
          titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor(brightness).withOpacity(opacity),
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: textColor(brightness),
          ),
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: textColor(brightness),
          ),
          headlineSmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: textColor(brightness).withOpacity(opacity),
          ),
          headlineMedium: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.normal,
            color: textColor(brightness),
          ),
          headlineLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: textColor(brightness),
          ),
        ),
        // input
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
        ),
        // card
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          elevation: 0,
          color: cardColor(brightness),
          margin: EdgeInsets.zero,
        ),

        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            color: cardColor(brightness),
            borderRadius: BorderRadius.circular(radius),
          ),
          textStyle: TextStyle(
            color: textColor(brightness),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        // button
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          padding: EdgeInsets.zero,
          buttonColor: primaryColor,
          textTheme: ButtonTextTheme.primary,
        ),
        iconButtonTheme: IconButtonThemeData(
            style: IconButton.styleFrom(
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        )),
        // elevatedButton
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
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
              borderRadius: BorderRadius.circular(radius),
            ),
            foregroundColor: primaryColor,
            padding: EdgeInsets.all(paddingH),
            elevation: 0,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        // textButton
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
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
          inactiveTrackColor: neutralColor(brightness),
          thumbColor: primaryColor,
          overlayColor: primaryColor.withOpacity(0.1),
          trackHeight: 2,
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: radius,
          ),
          overlayShape: RoundSliderOverlayShape(
            overlayRadius: radius,
          ),
        ),
        // progress
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: primaryColor,
          circularTrackColor: neutralColor(brightness),
          linearTrackColor: neutralColor(brightness),
        ),
        // divider
        dividerTheme: DividerThemeData(
          color: neutralColor(brightness),
          thickness: 1,
          space: 0,
        ),
        // dialog
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        // bottomSheet
        bottomSheetTheme: BottomSheetThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          backgroundColor: cardColor(brightness),
          elevation: 0,
          modalBackgroundColor: cardColor(brightness),
          modalElevation: 0,
        ),
        // popupMenu
        popupMenuTheme: PopupMenuThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          color: cardColor(brightness),
          elevation: 0,
        ),
        // bottomNavigationBar
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: cardColor(brightness).withOpacity(opacity),
          elevation: 0,
          selectedItemColor: primaryColor,
          unselectedItemColor: neutralColor(brightness),
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
          backgroundColor: cardColor(brightness).withOpacity(opacity),
          systemOverlayStyle: brightness != Brightness.light
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
          iconTheme: IconThemeData(
            color: textColor(brightness),
          ),
          actionsIconTheme: IconThemeData(
            color: textColor(brightness),
          ),
          titleTextStyle: TextStyle(
            color: textColor(brightness),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        // snackBar
        snackBarTheme: SnackBarThemeData(
          elevation: 0,
          backgroundColor: cardColor(brightness),
          showCloseIcon: true,
          closeIconColor: textColor(brightness),
          contentTextStyle: TextStyle(
            color: textColor(brightness),
            fontSize: 14,
          ),
        ),
        // listtile
        listTileTheme: ListTileThemeData(
          contentPadding: EdgeInsets.fromLTRB(padding, 0, padding, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          minLeadingWidth: 0,
          horizontalTitleGap: 0,
          minVerticalPadding: 0,
          tileColor: cardColor(brightness),
          iconColor: textColor(brightness),
          visualDensity: VisualDensity.compact,
        ),
      );
}
