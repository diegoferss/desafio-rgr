import '../../../models/user.dart';
import '../../../support/enums/drawer_item.dart';
import '../../../support/enums/services.dart';

class HomeState {
  final User user;
  final services = Services.values;
  final drawerItems = DrawerItem.values;

  HomeState({required this.user});

  HomeState copyWith({User? user}) {
    return HomeState(user: user ?? this.user);
  }
}
