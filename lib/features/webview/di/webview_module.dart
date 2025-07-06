import 'package:rgr/support/services/injector/app_module.dart';
import 'package:rgr/support/services/injector/injector.dart';

import '../bloc/webview_bloc.dart';

class WebviewModule extends AppModule {
  @override
  void registerDependencies() {
    injector.registerFactoryWithParams<WebviewBloc, String>((url) => WebviewBloc(url: url));
  }
}
