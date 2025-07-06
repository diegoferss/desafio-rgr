import '../../../models/user.dart';
import '../../../support/enums/services.dart';

class HomeState {
  final User user;
  final services = Services.values;

  HomeState({required this.user});

  HomeState copyWith({User? user}) {
    return HomeState(user: user ?? this.user);
  }
}
