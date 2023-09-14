import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class BottomNavigationView {
  final String title;
  final Widget view;
  final IconData icon;
  final List<IconButtonWidget>? actions;

  const BottomNavigationView({
    required this.title,
    required this.view,
    required this.icon,
    this.actions,
  });

  NavigationBarItem get navigationBarItem =>
      NavigationBarItem(icon: icon, label: title);
}
