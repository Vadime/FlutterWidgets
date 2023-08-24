import 'package:flutter_bloc/flutter_bloc.dart';

/// gibt liste von ausgewählten elementen zurück
class MultiSelectionController<T> extends Cubit<List<T>> {
  MultiSelectionController(super.initialState);

  void toggle(T value) {
    var state = List<T>.from(this.state);
    if (contains(value)) {
      super.emit(state..remove(value));
    } else {
      super.emit(state..add(value));
    }
  }

  bool contains(T value) {
    return state.contains(value);
  }
}
