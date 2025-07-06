import '../../../models/user.dart';
import '../../../support/enums/drawer_item.dart';
import '../../../support/enums/services.dart';

class HomeState {
  final User user;
  final List<Services> services = Services.values;
  final List<DrawerItem> drawerItems = DrawerItem.values;
  final Services? selectedService;

  HomeState({required this.user, this.selectedService});

  HomeState copyWith({User? user, Services? selectedService}) {
    return HomeState(user: user ?? this.user, selectedService: selectedService ?? this.selectedService);
  }

  HomeState clearSelectedService() {
    return HomeState(user: user);
  }
}
