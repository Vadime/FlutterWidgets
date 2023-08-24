import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
      home: BottomNavigationPage(
    initialIndex: 0,
    views: [
      BottomNavigationView(
          title: 'Work',
          label: 'Work',
          view: Center(child: Text('Work')),
          icon: Icons.work,
          actionIcon: Icons.add,
          action: null),
      BottomNavigationView(
          title: 'Work',
          label: 'Work',
          view: Center(child: Text('Work')),
          icon: Icons.work,
          actionIcon: Icons.add,
          action: null),
      BottomNavigationView(
          title: 'Work',
          label: 'Work',
          view: Center(child: Text('Work')),
          icon: Icons.work,
          actionIcon: Icons.add,
          action: null),
    ],
  )));
}
