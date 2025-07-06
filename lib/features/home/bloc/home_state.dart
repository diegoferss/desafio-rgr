import '../../../models/user.dart';

class HomeState {
  final User user;

  HomeState({required this.user});

  HomeState copyWith({User? user}) {
    return HomeState(user: user ?? this.user);
  }
}
