import 'package:flutter_bloc/flutter_bloc.dart';

class CheckboxController extends Cubit<bool> {
  CheckboxController(super.initialState);

  void set(bool value) => super.emit(value);

  void toggle() => super.emit(!super.state);
}
