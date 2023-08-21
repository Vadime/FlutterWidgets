import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/widgets/widgets.dart';

abstract class ThemeModeSaver {
  static const String key = 'theme';

  Future<ThemeMode?> loadTheme(String key);
  Future<void> saveTheme(String key, ThemeMode mode);
}

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
        neutralColor: theme.shadowColor,
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
      ThemeConfig.fromTheme(context.theme);

  // gen ThemeData
  ThemeData genTheme() => ThemeData(
        useMaterial3: true,
        brightness: brightness,
        // colors
        primaryColor: primaryColor,
        cardColor: cardColor,
        scaffoldBackgroundColor: backgroundColor,
        shadowColor: neutralColor.withOpacity(kOpacity),
        hintColor: neutralColor,
        canvasColor: backgroundColor,
        dividerColor: neutralColor,

        // text
        fontFamily: 'Varela Round',
        textTheme: TextTheme(
          labelSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
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
            color: textColor.withOpacity(kOpacity),
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
            borderRadius: BorderRadius.circular(kRadius),
          ),
          elevation: 0,
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
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
          ),
        ),
        // textButton
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kRadius),
            ),
            padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
            foregroundColor: textColor,
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
