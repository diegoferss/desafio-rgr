import 'package:go_router/go_router.dart';

import '../features/auth/auth_view.dart';
import '../features/home/home_view.dart';
import '../features/splash/splash_view.dart';

abstract class AppRoutes {
  List<RouteBase> get routes;
}

class MobileRouter {
  static const String auth = '/auth';
  static const String home = '/home';
  static const String splash = '/splash';

  static final router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(name: splash, path: splash, builder: (_, __) => SplashView()),

      GoRoute(name: auth, path: auth, builder: (_, __) => AuthView()),
      GoRoute(name: home, path: home, builder: (_, __) => HomeView()),
    ],
  );
}
