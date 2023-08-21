import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ThemeSaver {
  static const String key = 'theme';

  Future<ThemeMode?> loadTheme(String key);
  Future<void> saveTheme(String key, ThemeMode mode);
}

class ThemeController extends Cubit<ThemeMode> {
  final ThemeSaver? saver;
  ThemeController({this.saver}) : super(ThemeMode.system);

  // changeTheme
  FutureOr<void> changeTheme(ThemeMode mode) async {
    await saver?.saveTheme(ThemeSaver.key, mode);
    emit(mode);
  }

  // changeThemeFromString
  FutureOr<void> changeThemeFromString(String? value) async {
    await saver?.saveTheme(ThemeSaver.key, themeModeFromString(value));
    emit(themeModeFromString(value));
  }

  FutureOr<void> loadTheme() async {
    var mode = await saver?.loadTheme(ThemeSaver.key);
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
