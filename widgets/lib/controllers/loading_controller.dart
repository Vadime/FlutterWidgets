import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/widgets.dart';

class AnimatedBool {
  final bool value;
  final bool animationCompleted;
  const AnimatedBool({
    required this.value,
    required this.animationCompleted,
  });
}

class LoadingController extends Cubit<AnimatedBool> {
  static final LoadingController _singleton = LoadingController._internal();
  LoadingController._internal()
      : super(const AnimatedBool(value: false, animationCompleted: true));
  factory LoadingController() => _singleton;

  void enableInput() {
    emit(const AnimatedBool(value: false, animationCompleted: false));
    Future.delayed(const Duration(seconds: 1), () {
      emit(const AnimatedBool(value: false, animationCompleted: true));
    });
  }

  void disableInput() {
    emit(const AnimatedBool(value: true, animationCompleted: true));
  }

  @override
  void onChange(Change<AnimatedBool> change) {
    super.onChange(change);
    Logging.logDetails('LoadingController', change);
  }

  loadingProcess(Function()? onWait) async {
    try {
      LoadingController().disableInput();
      await onWait?.call();
    } catch (_) {
      Logging.log('Error in loading process');
    } finally {
      LoadingController().enableInput();
    }
  }
}
