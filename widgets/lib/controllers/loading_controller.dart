import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/widgets.dart';

class LoadingController extends Cubit<bool> {
  LoadingController() : super(false);

  void toggle() => emit(!state);

  void enableInput() => emit(false);

  void disableInput() => emit(true);

  static LoadingController? get instance =>
      Navigation.navigatorKey.currentContext?.read<LoadingController>();

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);
    Logging.logDetails('LoadingController', change);
  }
}
