import 'dart:ui';

import 'package:widgets/controllers/selection_controller.dart';

class CheckboxController extends SelectionController<bool, bool?> {
  CheckboxController(super.initialState);

  void invert() => toggle(!state);

  @override
  void toggle(bool? value) => super.emit(value ?? false);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
  }
}
