import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class OnboardingPage extends StatefulWidget {
  final List<OnboardingView> views;
  final double? padding;
  final double? radius;
  final Function()? onDone;

  const OnboardingPage({
    this.padding,
    this.radius,
    this.onDone,
    required this.views,
    super.key,
  });

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController pageController = PageController(initialPage: 0);

  int currentPage = 0;

  void onPageChanged(int page) => setState(() => currentPage = page);

  void nextPage() => pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );

  bool get lastPage => currentPage == widget.views.length - 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.views[currentPage].backgroundColor,
      body: Stack(
        children: [
          PageView.builder(
            itemCount: widget.views.length,
            itemBuilder: (context, index) => widget.views[index],
            controller: pageController,
            onPageChanged: onPageChanged,
          ),
          Positioned(
            top: widget.padding ?? context.config.padding,
            right: widget.padding ?? context.config.padding,
            child: SafeArea(
              child: TextButton(
                onPressed: widget.onDone,
                child: Text('Skip',
                    style: context.textTheme.labelLarge!.copyWith(
                        color: widget.views[currentPage].foregroundColor)),
              ),
            ),
          ),
          Positioned(
            bottom: widget.padding ?? context.config.padding,
            left: widget.padding ?? context.config.padding,
            right: widget.padding ?? context.config.padding,
            child: SafeArea(
              child: Row(
                children: [
                  // indicator dots
                  PageIndicatorWidget(controller: pageController),
                  const Spacer(),

                  // nextbutton
                  TextButton(
                    onPressed: lastPage ? widget.onDone : nextPage,
                    child: Text(
                      lastPage ? 'Get Started' : 'Next',
                      style: context.textTheme.labelLarge!.copyWith(
                          color: widget.views[currentPage].foregroundColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
