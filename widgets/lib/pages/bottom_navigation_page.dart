import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class BottomNavigationView {
  final String title;
  final Widget view;
  final IconData icon;
  final IconData? actionIcon;
  final Function()? action;

  const BottomNavigationView(
      this.title, this.view, this.icon, this.actionIcon, this.action);

  BottomNavigationBarItem bottomNavigationBarItem(BuildContext context) =>
      BottomNavigationBarItem(
        icon: Icon(icon),
        label: title,
        tooltip: title,
        backgroundColor:
            context.theme.cardColor.withOpacity(ThemeConfig.kOpacity),
      );
}

class BottomNavigationPage extends StatefulWidget {
  final int initialIndex;

  final List<BottomNavigationView> views;
  const BottomNavigationPage({
    required this.initialIndex,
    required this.views,
    super.key,
  });

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: widget.initialIndex);
    controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int get currentIndex =>
      controller.hasClients ? controller.page!.round() : widget.initialIndex;

  void animateTo(int index) async => await controller.animateToPage(index,
      duration: const Duration(milliseconds: 200), curve: Curves.ease);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(
        widget.views[currentIndex].title,
        action: IconButton(
          icon: Icon(widget.views[currentIndex].actionIcon),
          onPressed: widget.views[currentIndex].action,
        ),
      ),
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: widget.views.map((e) => e.view).toList(),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: currentIndex,
        onChange: animateTo,
        items: widget.views
            .map((e) => e.bottomNavigationBarItem(context))
            .toList(),
      ),
    );
  }
}
