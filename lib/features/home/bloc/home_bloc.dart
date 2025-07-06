import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../support/services/session_manager.dart';
import 'home_events.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  final SessionManager sessionManager;

  HomeBloc({required this.sessionManager}) : super(HomeState(user: sessionManager.user!));
}
