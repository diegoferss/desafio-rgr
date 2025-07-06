import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../support/services/session_manager.dart';
import 'splash_events.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SessionManager sessionManager;

  SplashBloc({required this.sessionManager}) : super(SplashInitial()) {
    on<SplashSessionVerifyRequested>(_onSplashSessionVerifyRequested);
  }

  FutureOr<void> _onSplashSessionVerifyRequested(SplashSessionVerifyRequested event, Emitter<SplashState> emit) async {
    await sessionManager.loadSession();

    emit(SplashSessionVerified(isLoggedIn: sessionManager.hasSession));
  }
}
