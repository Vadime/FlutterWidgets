import 'package:flutter/material.dart';
import 'package:url_x_launcher/url_x_launcher.dart';

void main(List<String> args) {
  runApp(const MaterialApp(home: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      if (!(await UrlXLauncher.launchEmail(
                          "example@email.com"))) {
                        if (context.mounted) errorMessage(context, "Email");
                      }
                    },
                    child: const Text("Launch Email")),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      if (!(await UrlXLauncher.launchBrowser("example.com"))) {
                        if (context.mounted) errorMessage(context, "Browser");
                      }
                    },
                    child: const Text("Launch Browser")),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      if (!(await UrlXLauncher.launchPhone("123456789"))) {
                        if (context.mounted) errorMessage(context, "Phone");
                      }
                    },
                    child: const Text("Launch Phone")),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      if (!(await UrlXLauncher.launchMaps(
                          "Example Location"))) {
                        if (context.mounted) errorMessage(context, "Maps");
                      }
                    },
                    child: const Text("Launch Maps")),
              ]),
        ),
      ),
    );
  }

  void errorMessage(BuildContext context, String app) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Could not launch $app app")));
  }
}
