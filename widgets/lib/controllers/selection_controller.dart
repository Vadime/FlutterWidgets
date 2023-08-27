import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/widgets.dart';

abstract class SelectionController<T, S> extends Cubit<T> {
  List<VoidCallback> listerners = [];
  SelectionController(super.initialState);

  void toggle(S value);

  @override
  void onChange(Change<T> change) {
    super.onChange(change);
    for (var element in listerners) {
      element();
    }
    Logging.logDetails(runtimeType.toString(), change);
  }

  void addListener(VoidCallback listener) {
    listerners.add(listener);
  }

  void dispose() {
    listerners.clear();
  }
}
