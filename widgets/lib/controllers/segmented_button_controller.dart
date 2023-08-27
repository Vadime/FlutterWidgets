import 'package:widgets/controllers/selection_controller.dart';

class SegmentedButtonController<T> extends SelectionController<T, T> {
  SegmentedButtonController(super.initialState);

  @override
  void toggle(T value) => super.emit(value);
}
