import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:widgets/utils/logging.dart';

enum Gender { male, female, other }

extension GenderExtension on Gender? {
  String toStr() {
    switch (this) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.other:
        return 'Other';
      default:
        return 'Unknown';
    }
  }
}

class GenderController extends Cubit<Gender> {
  GenderController([super.initialState = Gender.male]);

  @override
  void onChange(Change<Gender> change) {
    super.onChange(change);
    Logging.logDetails('GenderController', change);
  }

  FutureOr<void> change(Gender mode) async {
    emit(mode);
  }

  static GenderController of(BuildContext context) =>
      BlocProvider.of<GenderController>(context);

  String get currentStateName {
    switch (state) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.other:
        return 'Other';
      default:
        return 'Unknown';
    }
  }

  // get currentStateIcon
  IconData get currentStateIcon {
    switch (state) {
      case Gender.male:
        return Icons.male_rounded;
      case Gender.female:
        return Icons.female_rounded;
      case Gender.other:
        return FontAwesomeIcons.genderless;
      default:
        return Icons.error;
    }
  }
}
