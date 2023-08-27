import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/widgets.dart';

class ThemeApp extends StatelessWidget {
  final ThemeConfig config;
  final Widget home;
  final Widget login;
  final Future<void> Function()? initialize;
  const ThemeApp({
    required this.config,
    required this.home,
    required this.login,
    this.initialize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initialize?.call(),
        builder: (context, snapshot) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => ThemeController(config: config)),
            ],
            child: BlocListener<AuthenticationController, bool>(
              bloc: AuthenticationController(),
              listener: (context, state) => Navigation.flush(
                widget: state ? home : login,
              ),
              child: BlocBuilder<ThemeController, ThemeMode>(
                builder: (context, themeMode) => Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      child: MaterialApp(
                        navigatorKey: Navigation.navigatorKey,
                        title: context.config.title,
                        themeMode: themeMode,
                        theme: context.config.genTheme(Brightness.light),
                        darkTheme: context.config.genTheme(Brightness.dark),
                        home: AuthenticationController().state ? home : login,
                      ),
                    ),
                    Positioned.fill(child: LoadingPage(context.config)),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
