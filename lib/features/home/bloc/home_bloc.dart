import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../support/enums/services.dart';
import '../../../support/services/session_manager.dart';
import '../../../support/services/url_launcher.dart';
import 'home_events.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  final SessionManager sessionManager;
  final UrlLauncher urlLauncher;

  HomeBloc({required this.sessionManager, required this.urlLauncher}) : super(HomeState(user: sessionManager.user!)) {
    on<HomeServiceSelected>(_onHomeServiceSelected);
    on<HomeAddContractSelected>(_onHomeAddContractSelected);
    on<HomeContractorsSelected>(_onHomeContractorsSelected);
    on<HomeDrawerItemSelected>(_onHomeDrawerItemSelected);
    on<HomeDrawerClearItemSelected>(_onHomeDrawerClearItemSelected);
  }

  FutureOr<void> _onHomeServiceSelected(HomeServiceSelected event, Emitter<HomeState> emit) {
    switch (event.service) {
      case Services.automobile:
        if (kIsWeb) {
          urlLauncher.redirectUrl(url: 'https://www.google.com');
        } else {
          emit(state.copyWith(selectedService: event.service));
        }
        break;
      default:
        break;
    }
  }

  FutureOr<void> _onHomeAddContractSelected(HomeAddContractSelected event, Emitter<HomeState> emit) {
    // TODO: Implementar a lógica para adicionar um contrato
  }

  FutureOr<void> _onHomeContractorsSelected(HomeContractorsSelected event, Emitter<HomeState> emit) {
    // TODO: Implementar a lógica para selecionar os contratados
  }

  FutureOr<void> _onHomeDrawerItemSelected(HomeDrawerItemSelected event, Emitter<HomeState> emit) {
    // TODO: Implementar a lógica para selecionar o item do drawer
  }

  FutureOr<void> _onHomeDrawerClearItemSelected(HomeDrawerClearItemSelected event, Emitter<HomeState> emit) {
    emit(state.clearSelectedService());
  }
}
