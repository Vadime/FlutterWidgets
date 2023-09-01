import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:widgets/widgets.dart';

class ThemeApp extends StatelessWidget {
  final ThemeConfig config;
  final ThemeModeSaver? themeModeSaver;
  final Widget home;
  final Widget login;
  final Future<void> Function(BuildContext context)? initialize;
  const ThemeApp({
    required this.config,
    required this.home,
    required this.login,
    this.initialize,
    this.themeModeSaver,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: Future(() async {
      await initialize?.call(context);
      FlutterNativeSplash.remove();
    }), builder: (context, snapshot) {
      if (snapshot.connectionState != ConnectionState.done) {
        return const SizedBox();
      }

      return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  ThemeController(config: config, saver: themeModeSaver)),
        ],
        child: BlocListener<AuthenticationController, bool>(
          bloc: AuthenticationController(),
          listener: (context, state) {
            if (state) {
              ThemeController.of(context).load();
              Navigation.flush(widget: home);
            } else {
              Navigation.flush(widget: login);
            }
          },
          child: BlocBuilder<ThemeController, ThemeMode>(
            builder: (context, themeMode) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: MaterialApp(
                      navigatorKey: Navigation.key,
                      title: context.config.title,
                      themeMode: themeMode,
                      theme: context.config.genTheme(Brightness.light),
                      darkTheme: context.config.genTheme(Brightness.dark),
                      home: AuthenticationController().state ? home : login,
                    ),
                  ),
                  Positioned.fill(child: LoadingPage(context.config)),
                  Positioned.fill(child: ToastPage(context.config)),
                ],
              );
            },
          ),
        ),
      );
    });
  }
}

class ThemeAppRouter extends StatelessWidget {
  final ThemeConfig config;
  final ThemeModeSaver? themeModeSaver;

  final PageRouteInfo home;
  final PageRouteInfo login;
  final RootStackRouter router;
  final Future<void> Function()? initialize;
  const ThemeAppRouter({
    required this.config,
    required this.home,
    required this.login,
    required this.router,
    this.initialize,
    this.themeModeSaver,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: Future(() async {
      Navigation.key = router.navigatorKey;
      await initialize?.call();
      FlutterNativeSplash.remove();
    }), builder: (context, snapshot) {
      if (snapshot.connectionState != ConnectionState.done) {
        return const SizedBox();
      }
      return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  ThemeController(config: config, saver: themeModeSaver)),
        ],
        child: BlocListener<AuthenticationController, bool>(
          bloc: AuthenticationController(),
          listener: (context, state) => router.pushAndPopUntil(
            state ? home : login,
            predicate: (_) => false,
          ),
          child: BlocBuilder<ThemeController, ThemeMode>(
            builder: (context, themeMode) => Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: MaterialApp.router(
                    title: context.config.title,
                    themeMode: themeMode,
                    theme: context.config.genTheme(Brightness.light),
                    darkTheme: context.config.genTheme(Brightness.dark),
                    routerConfig: router.config(
                        deepLinkBuilder: (pdl) => DeepLink(
                            [AuthenticationController().state ? home : login])),
                  ),
                ),
                Positioned.fill(child: LoadingPage(context.config)),
                Positioned.fill(child: ToastPage(context.config)),
              ],
            ),
          ),
        ),
      );
    });
  }
}
