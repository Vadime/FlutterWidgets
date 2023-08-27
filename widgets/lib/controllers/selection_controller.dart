import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/widgets.dart';

abstract class SelectionController<T, S> extends Cubit<T> {
  SelectionController(super.initialState);

  void toggle(S value);

  @override
  void onChange(Change<T> change) {
    super.onChange(change);
    Logging.logDetails('MultiSelectionController', change);
  }

  
}
