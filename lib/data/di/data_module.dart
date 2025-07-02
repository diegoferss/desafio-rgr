import 'package:rgr/support/services/injector/app_module.dart';

import '../../support/services/injector/injector.dart';
import '../clients/api_provider.dart';
import '../models/api_host.dart';

class DataModule extends AppModule {
  @override
  void registerDependencies() {
    injector.registerSingleton<ApiProviderProtocol>(ApiProvider(baseUrl: ApiHost.baseUrl));
  }
}