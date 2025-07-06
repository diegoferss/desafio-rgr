import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../support/services/session_manager.dart';
import 'home_events.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  final SessionManager sessionManager;

  HomeBloc({required this.sessionManager}) : super(HomeState(user: sessionManager.user!)) {
    on<HomeServiceSelected>(_onHomeServiceSelected);
    on<HomeAddContractSelected>(_onHomeAddContractSelected);
    on<HomeContractorsSelected>(_onHomeContractorsSelected);
    on<HomeDrawerItemSelected>(_onHomeDrawerItemSelected);
  }

  FutureOr<void> _onHomeServiceSelected(HomeServiceSelected event, Emitter<HomeState> emit) {
    // TODO: Implementar a lógica para selecionar o serviço
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
}
