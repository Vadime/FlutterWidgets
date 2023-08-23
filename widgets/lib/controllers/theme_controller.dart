import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/config/theme_config.dart';
import 'package:widgets/utils/logging.dart';

abstract class ThemeModeSaver {
  static const String key = 'theme';

  Future<ThemeMode?> load(String key);
  Future<void> save(String key, ThemeMode mode);
}

class ThemeController extends Cubit<ThemeMode> {
  final ThemeModeSaver? saver;
  final ThemeConfig config;
  ThemeController({
    required this.config,
    this.saver,
  }) : super(ThemeMode.system);

  ThemeConfig get currentThemeConfig => config;

  ThemeData get darkTheme => config.genTheme(Brightness.dark);

  ThemeData get lightTheme => config.genTheme(Brightness.light);

  @override
  void onChange(Change<ThemeMode> change) {
    super.onChange(change);
    Logging.logDetails('AuthenticationController', change);
  }

  FutureOr<void> change(ThemeMode mode) async {
    await saver?.save(ThemeModeSaver.key, mode);
    emit(mode);
  }

  FutureOr<void> load() async {
    var mode = await saver?.load(ThemeModeSaver.key);
    if (mode != null) {
      emit(mode);
    }
  }

  static ThemeController of(BuildContext context) =>
      BlocProvider.of<ThemeController>(context);

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
}
