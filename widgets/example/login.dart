import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/widgets.dart';

void main() {
  runApp(const MatApp());
}

class MatApp extends StatelessWidget {
  const MatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeController(),
      child: BlocBuilder<ThemeController, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
              navigatorKey: Navigation.navigatorKey,
              themeMode: state,
              theme: ThemeConfig.light.genTheme(),
              darkTheme: ThemeConfig.dark.genTheme(),
              home: const App());
        },
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginPage(
      onEmailSignUp: (email, password) {
        print(email);
        print(password);
      },
      onEmailSignIn: (email, password) {
        print(email);
        print(password);
      },
      onEmailSendPassword: (email) {
        print(email);
      },
      onPhoneSendCode: (phone) {
        print(phone);
      },
      onPhoneVerifyCode: (code) {
        print(code);
      },
      onAppleLogin: () {
        Navigation.pushMessage(message: "Not implemented yet");
      },
    );
  }
}
