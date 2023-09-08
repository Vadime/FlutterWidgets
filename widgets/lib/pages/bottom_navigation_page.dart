import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/widgets.dart';

class BottomNavigationPageController extends Cubit<int> {
  late PageController controller;
  BottomNavigationPageController(super.initialState) {
    controller = PageController(initialPage: state);
    controller.addListener(
        () => emit(controller.hasClients ? controller.page!.round() : state));
  }
  set index(int index) => controller.go(index);

  
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
  late BottomNavigationPageController controller;

  late int initialIndex;

  @override
  void initState() {
    super.initState();
    initialIndex = widget.initialIndex;
    controller = BottomNavigationPageController(initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) => controller,
      child: BlocBuilder<BottomNavigationPageController, int>(
        builder: (context, state) => Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: AppBarWidget(
            widget.views[state].title,
            action: widget.views[state].actionIcon == null
                ? null
                : IconButtonWidget(
                    widget.views[state].actionIcon!,
                    onPressed: widget.views[state].action,
                  ),
          ),
          body: PageView(
            controller: controller.controller,
            physics: const NeverScrollableScrollPhysics(),
            children: widget.views.map((e) => e.view).toList(),
          ),
          bottomNavigationBar: BottomNavigationBarWidget(
            currentIndex: state,
            onChange: controller.controller.go,
            items: widget.views.map((e) => e.bottomNavigationBarItem).toList(),
          ),
        ),
      ),
    );
  }
}
