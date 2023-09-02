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

  late int initialIndex;

  @override
  void initState() {
    super.initState();
    initialIndex = widget.initialIndex;
    if (initialIndex > widget.views.length) initialIndex = widget.views.length;
    controller = PageController(initialPage: initialIndex);
    controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int get currentIndex =>
      controller.hasClients ? controller.page!.round() : initialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(
        widget.views[currentIndex].title,
        action: widget.views[currentIndex].actionIcon == null
            ? null
            : IconButtonWidget(
                widget.views[currentIndex].actionIcon!,
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
