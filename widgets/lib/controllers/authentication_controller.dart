import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/utils/logging.dart';

class AuthenticationController extends Cubit<bool> {
  AuthenticationController([super.initialState = false]);

  void login() => emit(true);

  void logout() => emit(false);

  static AuthenticationController of(context) =>
      BlocProvider.of<AuthenticationController>(context);

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);
    Logging.logDetails('AuthenticationController', change);
  }
}
