import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SegmentedButtonController<T> extends Cubit<T> {
  Function(T)? _changeCallback;
  SegmentedButtonController(super.initialState);

  void animateTo(T value) => super.emit(value);

  static SegmentedButtonController of(BuildContext context) =>
      BlocProvider.of<SegmentedButtonController>(context);

  void addListener(Function(T state) callback) {
    _changeCallback = callback;
  }

  @override
  void onChange(Change<T> change) {
    super.onChange(change);
    _changeCallback?.call(change.nextState);
  }

  void dispose() {
    _changeCallback = null;
    super.close();
  }
}
