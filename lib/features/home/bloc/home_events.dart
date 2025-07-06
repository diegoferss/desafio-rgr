import '../../../support/enums/services.dart';

sealed class HomeEvents {}

class HomeServiceSelected extends HomeEvents {
  final Services service;

  HomeServiceSelected(this.service);
}

class HomeAddContractSelected extends HomeEvents {}

class HomeContractorsSelected extends HomeEvents {}
