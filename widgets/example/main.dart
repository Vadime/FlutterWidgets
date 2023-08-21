import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/widgets.dart';

class MatApp extends StatelessWidget {
  const MatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeController(),
      child: BlocBuilder<ThemeController, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
              themeMode: state,
              theme: ThemeConfig.light.genTheme(),
              darkTheme: ThemeConfig.dark.genTheme(),
              home: const App());
        },
      ),
    );
  }
}

void main() {
  runApp(const MatApp());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  CheckboxController cc = CheckboxController(false);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationPage(
      initialIndex: 0,
      views: [
        BottomNavigationView(
            "Home", const HomeView(), Icons.home, Icons.add, () {}),
        const BottomNavigationView(
            "Work", Center(child: Text("Work")), Icons.work, null, null),
        const BottomNavigationView(
            "School", Center(child: Text("School")), Icons.school, null, null),
        const BottomNavigationView(
            "School", Center(child: Text("School")), Icons.school, null, null),
      ],
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SegmentedThemeButton(ThemeController.of(context)),
            const Spacer(),
            Center(
                child: TextButtonWidget(
              "Hello World",
              onPressed: () {},
            )),
            const ListTileWidget(
              title: "Hello World",
              //subtitle: "Hello World\n\nadsfdsf",
            ),
            const Spacer(),
            ElevatedButtonWidget(
              "Hello World",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
