import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_events.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginFormChanged>(_onLoginFormChanged);
  }

  FutureOr<void> _onLoginFormChanged(LoginFormChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(loginForm: event.loginForm));
  }
}
