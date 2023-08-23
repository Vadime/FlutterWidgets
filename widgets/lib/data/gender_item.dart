import 'package:flutter/material.dart';

enum Gender { male, female, other }

class GenderItem {
  final String name;
  final Gender gender;
  final IconData icon;

  const GenderItem(this.name, this.gender, this.icon);

  static String genderToString(Gender? gender) {
    String genderStr = '';
    if (gender == Gender.male) {
      genderStr = 'Männlich';
    } else if (gender == Gender.female) {
      genderStr = 'Weiblich';
    } else {
      genderStr = 'Anderes';
    }
    return genderStr;
  }
}
