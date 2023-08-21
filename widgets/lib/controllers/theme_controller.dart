import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ThemeModeSaver {
  static const String key = 'theme';

  Future<ThemeMode?> loadTheme(String key);
  Future<void> saveTheme(String key, ThemeMode mode);
}

class ThemeConfig {
  final Brightness brightness;

  final MaterialColor primaryColor;
  final Color backgroundColor;
  final Color cardColor;
  final Color neutralColor;
  final Color textColor;

  final double radius;
  final double padding;
  final double elevation;
  final double opacity;

  const ThemeConfig({
    required this.brightness,
    required this.primaryColor,
    required this.backgroundColor,
    required this.cardColor,
    required this.neutralColor,
    required this.textColor,
    required this.radius,
    required this.padding,
    required this.elevation,
    required this.opacity,
  });

  static const ThemeConfig light = ThemeConfig(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    backgroundColor: Colors.white,
    cardColor: Colors.white,
    neutralColor: Colors.grey,
    textColor: Colors.black,
    radius: 10,
    padding: 20,
    elevation: 0,
    opacity: 0.9,
  );

  static const ThemeConfig dark = ThemeConfig(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    backgroundColor: Colors.black,
    cardColor: Colors.black,
    neutralColor: Colors.grey,
    textColor: Colors.white,
    radius: 10,
    padding: 20,
    elevation: 0,
    opacity: 0.9,
  );

  // copyWith
  ThemeConfig copyWith({
    Brightness? brightness,
    MaterialColor? primaryColor,
    Color? backgroundColor,
    Color? cardColor,
    Color? neutralColor,
    Color? textColor,
    double? radius,
    double? padding,
    double? elevation,
    double? opacity,
  }) =>
      ThemeConfig(
        brightness: brightness ?? this.brightness,
        primaryColor: primaryColor ?? this.primaryColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        cardColor: cardColor ?? this.cardColor,
        neutralColor: neutralColor ?? this.neutralColor,
        textColor: textColor ?? this.textColor,
        radius: radius ?? this.radius,
        padding: padding ?? this.padding,
        elevation: elevation ?? this.elevation,
        opacity: opacity ?? this.opacity,
      );

  // gen ThemeData
  ThemeData genTheme() => ThemeData(
        useMaterial3: true,
        brightness: brightness,
        // colors
        primaryColor: primaryColor,
        cardColor: cardColor,
        scaffoldBackgroundColor: backgroundColor,
        shadowColor: neutralColor.withOpacity(opacity),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: primaryColor,
          backgroundColor: backgroundColor,
          cardColor: cardColor,
          brightness: brightness,
        ),
        hintColor: neutralColor,
        canvasColor: backgroundColor,
        dividerColor: neutralColor,
        // text
        fontFamily: 'Varela Round',
        textTheme: TextTheme(
          labelSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: textColor,
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
            color: textColor,
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
            color: textColor,
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          headlineSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          headlineMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          headlineLarge: TextStyle(
            fontSize: 20,
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
            borderRadius: BorderRadius.circular(radius),
          ),
          elevation: elevation,
          margin: EdgeInsets.zero,
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
        // slider
        sliderTheme: SliderThemeData(
          activeTrackColor: primaryColor,
          inactiveTrackColor: neutralColor,
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
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        // bottomSheet
        bottomSheetTheme: BottomSheetThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          backgroundColor: cardColor,
          elevation: elevation,
          modalBackgroundColor: cardColor,
          modalElevation: elevation,
        ),
        // popupMenu
        popupMenuTheme: PopupMenuThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          color: cardColor,
          elevation: elevation,
        ),
        // bottomNavigationBar
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: cardColor,
          elevation: elevation,
          selectedItemColor: primaryColor,
          unselectedItemColor: neutralColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
        // bottomAppBar
        bottomAppBarTheme: BottomAppBarTheme(
          elevation: elevation,
        ),
        // appBar
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: cardColor,
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
          elevation: elevation,
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
          contentPadding: EdgeInsets.fromLTRB(padding, 0, padding, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          minLeadingWidth: 0,
          horizontalTitleGap: 0,
          minVerticalPadding: 0,
          tileColor: cardColor,
          iconColor: textColor,
        ),
      );
}

class ThemeController extends Cubit<ThemeMode> {
  final ThemeModeSaver? saver;
  ThemeController({this.saver}) : super(ThemeMode.system);

  // changeTheme
  FutureOr<void> changeTheme(ThemeMode mode) async {
    await saver?.saveTheme(ThemeModeSaver.key, mode);
    emit(mode);
  }

  // changeThemeFromString
  FutureOr<void> changeThemeFromString(String? value) async {
    await saver?.saveTheme(ThemeModeSaver.key, themeModeFromString(value));
    emit(themeModeFromString(value));
  }

  FutureOr<void> loadTheme() async {
    var mode = await saver?.loadTheme(ThemeModeSaver.key);
    if (mode != null) {
      emit(mode);
    }
  }

  static ThemeController of(BuildContext context) =>
      BlocProvider.of<ThemeController>(context);

  // get currentStateName
  String get currentStateName {
    switch (state) {
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.system:
        return 'System';
      default:
        return 'Unknown';
    }
  }

  // get currentStateIcon
  IconData get currentStateIcon {
    switch (state) {
      case ThemeMode.dark:
        return Icons.dark_mode;
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.system:
        return Icons.settings_system_daydream;
      default:
        return Icons.error;
    }
  }

  // stateNames
  static const List<String> stateNames = [
    'System',
    'Light',
    'Dark',
  ];

  // stateIcons
  static const List<IconData> stateIcons = [
    Icons.settings_system_daydream,
    Icons.light_mode,
    Icons.dark_mode,
  ];

  // themeModeFromString
  static ThemeMode themeModeFromString(String? value) {
    switch (value) {
      case 'System':
        return ThemeMode.system;
      case 'Light':
        return ThemeMode.light;
      case 'Dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
