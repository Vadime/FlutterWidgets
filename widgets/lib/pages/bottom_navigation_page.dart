import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';


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
        onChange: controller.go,
        items: widget.views.map((e) => e.bottomNavigationBarItem).toList(),
      ),
    );
  }
}
