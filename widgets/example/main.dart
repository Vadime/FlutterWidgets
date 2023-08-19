import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class MatApp extends StatelessWidget {
  const MatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0,
            color: Colors.grey.shade200,
          ),
          segmentedButtonTheme: SegmentedButtonThemeData(
              style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            visualDensity: VisualDensity.compact,
            side: BorderSide(
              color: Colors.grey.shade200,
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
            backgroundColor: Colors.grey.shade200,
            showUnselectedLabels: false,
            showSelectedLabels: false,
          ),
        ),
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
  TextEditingController c = TextEditingController();
  CheckboxController cc = CheckboxController(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget("Widgets"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFieldWidget(
            "Email",
            controller: c,
            errorRegex: RegExp(r"^.{6,}$"),
            errorText: "mindestens 6 Zeichen",
            margin: const EdgeInsets.all(20),
          ),
          TextFieldWidget(
            "Password",
            controller: c,
            errorRegex: RegExp(r"^.{6,}$"),
            errorText: "mindestens 6 Zeichen",
            margin: const EdgeInsets.all(20),
          ),
          SegmentedButtonWidget(
              controller: SegmentedButtonController("Segment 1"),
              margin: const EdgeInsets.all(20),
              segments: const ["Segment 1", "Segment 2"]),
          CheckboxWidget(
            controller: cc,
          ),
          ElevatedButtonWidget(
            "Elevated Button",
            onPressed: () {
              c.textToEnd = "Elevated Button";
              setState(() {});
              cc.toggle();
            },
            elevation: 2,
            margin: const EdgeInsets.all(20),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      ),
    );
  }
}
