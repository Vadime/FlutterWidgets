import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class MatApp extends StatelessWidget {
  const MatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white.withOpacity(0.9),
            ),
            scaffoldBackgroundColor: Colors.grey.shade200,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
            ),
            listTileTheme: ListTileThemeData(
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 0,
              color: Colors.white,
            ),
            segmentedButtonTheme: SegmentedButtonThemeData(
                style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(10),
              visualDensity: VisualDensity.compact,
              side: BorderSide(
                color: Colors.white.withOpacity(0.9),
                width: 4,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
              shadowColor: Colors.transparent,
              animationDuration: const Duration(milliseconds: 100),
            )),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.white.withOpacity(0.9),
              showUnselectedLabels: false,
              showSelectedLabels: false,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              elevation: 0,
              type: BottomNavigationBarType.shifting,
            ),
            bottomAppBarTheme: BottomAppBarTheme(
              color: Colors.white.withOpacity(0.9),
              elevation: 0,
              shape: const CircularNotchedRectangle(),
            ),
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.fromLTRB(4, 8, 4, 8),
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: MaterialStateProperty.all(
                      const Size(20, 20),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    visualDensity: VisualDensity.compact))),
        home: const App());
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
      ],
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SegmentedButtonWidget(
              margin: const EdgeInsets.all(20),
              controller: SegmentedButtonController("Hello"),
              segments: const ["Hello", "World", "Flutter"]),
          Center(
              child: TextButtonWidget(
            "Hello World",
            onPressed: () {},
            margin: const EdgeInsets.all(20),
          )),
          ElevatedButtonWidget(
            "Hello World",
            onPressed: () {},
            margin: const EdgeInsets.all(20),
          )
        ],
      ),
    );
  }
}
