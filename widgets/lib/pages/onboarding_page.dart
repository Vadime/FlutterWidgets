import 'package:flutter/material.dart';

extension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  double get shortestDim => MediaQuery.of(this).size.shortestSide;
}

class OnboardingPageData {
  final String title;
  final String description;
  final String image;
  final Color color;
  const OnboardingPageData({
    required this.title,
    required this.description,
    required this.image,
    this.color = Colors.transparent,
  });

  factory OnboardingPageData.fromJson(Map<String, dynamic> json) {
    return OnboardingPageData(
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      color: Color(int.tryParse(json['color']) ?? 0x00000000),
    );
  }

  @override
  int get hashCode =>
      title.hashCode ^ description.hashCode ^ image.hashCode ^ color.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is OnboardingPageData &&
            runtimeType == other.runtimeType &&
            title == other.title &&
            description == other.description &&
            image == other.image &&
            color == other.color;
  }
}

class OnboardingPage extends StatefulWidget {
  final List<OnboardingPageData> data;
  final double padding;
  final double radius;
  final Function()? onDone;

  const OnboardingPage({
    this.padding = 20,
    this.radius = 10,
    this.onDone,
    required this.data,
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

  bool get lastPage => currentPage == widget.data.length - 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.data[currentPage].color,
      body: Stack(
        children: [
          PageView.builder(
            itemCount: widget.data.length,
            itemBuilder: (context, index) => _OnboardingPage(
              data: widget.data[index],
              padding: widget.padding,
              radius: widget.radius,
            ),
            controller: pageController,
            onPageChanged: onPageChanged,
          ),
          Positioned(
            top: widget.padding,
            right: widget.padding,
            child: SafeArea(
              child: TextButton(
                onPressed: widget.onDone,
                child: Text('Skip', style: context.textTheme.labelLarge),
              ),
            ),
          ),
          Positioned(
            bottom: widget.padding,
            left: widget.padding,
            right: widget.padding,
            child: SafeArea(
              child: Row(
                children: [
                  // indicator dots
                  for (int i = 0; i < widget.data.length; i++)
                    if (i == currentPage)
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.all(2),
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      )
                    else
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.all(2),
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                      ),
                  const Spacer(),

                  // nextbutton
                  TextButton(
                    onPressed: lastPage ? widget.onDone : nextPage,
                    child: Text(
                      lastPage ? 'Get Started' : 'Next',
                      style: context.textTheme.labelLarge,
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

class _OnboardingPage extends StatelessWidget {
  final OnboardingPageData data;
  final double padding;
  final double radius;
  const _OnboardingPage(
      {required this.data, required this.padding, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: data.color,
      child: Column(
        children: [
          const Spacer(flex: 2),
          ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: Image.asset(
              data.image,
              width: context.shortestDim / 2,
              height: context.shortestDim / 2,
            ),
          ),
          const Spacer(),
          Text(
            data.title,
            style: context.textTheme.titleLarge,
          ),
          SizedBox(height: padding),
          Text(
            data.description,
            style: context.textTheme.labelSmall,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
