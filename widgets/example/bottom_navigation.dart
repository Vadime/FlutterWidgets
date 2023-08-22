import 'package:flutter/material.dart';
import 'package:widgets/pages/bottom_navigation_page.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
      home: BottomNavigationPage(
    initialIndex: 0,
    views: [
      BottomNavigationView(
          'Work', Center(child: Text('Work')), Icons.work, Icons.add, null),
      BottomNavigationView(
          'School', Center(child: Text('School')), Icons.school, null, null),
      BottomNavigationView('Business', Center(child: Text('Business')),
          Icons.business, null, null),
    ],
  )));
}
