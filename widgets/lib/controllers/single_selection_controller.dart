import 'package:flutter_bloc/flutter_bloc.dart';

/// gibt liste von ausgewählten elementen zurück
class SingleSelectionController<T> extends Cubit<T?> {
  SingleSelectionController(super.initialState);

  void toggle(T value) {
    if (state == value) {
      super.emit(null);
    } else {
      super.emit(value);
    }
  }
}
