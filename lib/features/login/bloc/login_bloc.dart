import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgr/support/inputs/cpf_input.dart';
import 'package:rgr/support/inputs/password_input.dart';

part 'login_events.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginFormChanged>(_onLoginFormChanged);
    on<LoginRememberPasswordChanged>(_onLoginRememberPasswordChanged);
    on<LoginCPFChanged>(_onLoginCPFChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
  }

  FutureOr<void> _onLoginFormChanged(LoginFormChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(loginForm: event.loginForm));
  }

  FutureOr<void> _onLoginRememberPasswordChanged(LoginRememberPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(rememberPassword: !state.rememberPassword));
  }

  FutureOr<void> _onLoginCPFChanged(LoginCPFChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(cpf: CPFInput.dirty(value: event.cpf)));
  }

  FutureOr<void> _onLoginPasswordChanged(LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: PasswordInput.dirty(value: event.password)));
  }
}
