import 'package:flutter/material.dart';
import 'package:widgets/pages/onboarding_page.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
      home: OnboardingPage(data: [
    OnboardingPageData(
        title: 'Hello',
        description: 'I love coffee',
        image: 'res/example.png',
        backgroundColor: Colors.red,
        foregroundColor: Colors.white),
    OnboardingPageData(
        title: 'Hello',
        description: 'I love coffee',
        image: 'res/example.png',
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white),
    OnboardingPageData(
        title: 'Hello',
        description: 'I love coffee',
        image: 'res/example.png',
        backgroundColor: Colors.green,
        foregroundColor: Colors.white),
  ])));
}
