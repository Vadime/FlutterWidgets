import 'package:flutter/material.dart';
import 'package:widgets/pages/onboarding_page.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
      home: OnboardingPage(data: [
    OnboardingPageData(
        title: "Hello",
        description: "I love coffee",
        image: 'res/example.png',
        color: Colors.red),
    OnboardingPageData(
        title: "Hello",
        description: "I love coffee",
        image: 'res/example.png',
        color: Colors.blue),
    OnboardingPageData(
        title: "Hello",
        description: "I love coffee",
        image: 'res/example.png',
        color: Colors.green),
  ])));
}
