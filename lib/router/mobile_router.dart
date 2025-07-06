import 'package:go_router/go_router.dart';
import 'package:rgr/support/services/injector/injector.dart';

import '../features/auth/auth_view.dart';
import '../features/home/home_view.dart';
import '../features/splash/splash_view.dart';
import '../features/webview/webview_view.dart';
import '../support/services/session_manager.dart';

abstract class AppRoutes {
  List<RouteBase> get routes;
}

class MobileRouter {
  static const String auth = '/auth';
  static const String home = '/home';
  static const String splash = '/splash';
  static const String webview = '/webview';

  static final router = GoRouter(
    initialLocation: splash,
    redirect: (_, state) async {
      final sessionManager = injector.get<SessionManager>();

      if (sessionManager.hasSession) return null;

      await sessionManager.loadSession();

      if (!sessionManager.hasSession) {
        return auth;
      }

      return null;
    },

    routes: [
      GoRoute(name: splash, path: splash, builder: (_, __) => SplashView()),
      GoRoute(name: auth, path: auth, builder: (_, __) => AuthView()),
      GoRoute(name: home, path: home, builder: (_, __) => HomeView()),
      GoRoute(
        name: webview,
        path: webview,
        builder: (_, state) {
          return WebviewView(url: state.extra as String);
        },
      ),
    ],
  );
}
