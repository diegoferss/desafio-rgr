import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rgr/features/login/use_cases/create_user_with_email_and_password.dart';
import 'package:rgr/support/inputs/email_input.dart';
import 'package:rgr/support/inputs/password_input.dart';

import '../../../dto/user_dto.dart';
import '../../../support/enums/form_submission_status.dart';
import '../../../support/exceptions/app_exception.dart';
import '../use_cases/login_with_document_and_password.dart';

part 'login_events.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  final LoginUserWithDocumentAndPassword loginUserWithDocumentAndPassword;
  final CreateUserWithEmailAndPassword createUserWithEmailAndPassword;
  LoginBloc({required this.loginUserWithDocumentAndPassword, required this.createUserWithEmailAndPassword})
    : super(LoginState()) {
    on<LoginFormChanged>(_onLoginFormChanged);
    on<LoginRememberPasswordChanged>(_onLoginRememberPasswordChanged);
    on<LoginCPFChanged>(_onLoginCPFChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  FutureOr<void> _onLoginFormChanged(LoginFormChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(loginForm: event.loginForm));
  }

  FutureOr<void> _onLoginRememberPasswordChanged(LoginRememberPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(rememberPassword: !state.rememberPassword));
  }

  FutureOr<void> _onLoginCPFChanged(LoginCPFChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(cpf: EmailInput.dirty(value: event.cpf)));
  }

  FutureOr<void> _onLoginPasswordChanged(LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: PasswordInput.dirty(value: event.password)));
  }

  FutureOr<void> _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: FormSubmissionStatus.inProgress));

    final userDTO = UserDTO(email: state.email.value, password: state.password.value);

    final result = await switch (state.loginForm) {
      LoginForm.login => loginUserWithDocumentAndPassword(userDTO),
      LoginForm.register => createUserWithEmailAndPassword(userDTO),
    };

    result.fold(
      (error) {
        emit(state.copyWith(errorType: error.errorType, status: FormSubmissionStatus.failure));
      },
      (user) {
        // TODO: Salvar sessão
        emit(state.copyWith(status: FormSubmissionStatus.success));
      },
    );
  }
}
