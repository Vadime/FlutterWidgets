import 'package:widgets/controllers/selection_controller.dart';

/// gibt liste von ausgewählten elementen zurück
class SingleSelectionController<T> extends SelectionController<T?, T> {
  SingleSelectionController(super.initialState);

  @override
  void toggle(T value) {
    if (state == value) {
      super.emit(null);
    } else {
      super.emit(value);
    }
  }
}
