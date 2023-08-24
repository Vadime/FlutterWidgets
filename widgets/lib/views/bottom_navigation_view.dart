import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class BottomNavigationView {
  final String title;
  final String label;
  final Widget view;
  final IconData icon;
  final IconData? actionIcon;
  final Function()? action;

  const BottomNavigationView({
    required this.title,
    required this.label,
    required this.view,
    required this.icon,
    this.actionIcon,
    this.action,
  });

  BottomNavigationBarItem get bottomNavigationBarItem =>
      BottomNavigationBarItem(icon: Icon(icon), label: title, tooltip: title);

  Widget get actionButton => actionIcon != null
      ? IconButtonWidget(actionIcon!, onPressed: action)
      : const SizedBox.shrink();
}
