import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/login/login_view.dart';

abstract class AppRoutes {
  List<RouteBase> get routes;
}

class MobileRouter {
  static const String login = '/login';
  static const String home = '/home';

  static final router = GoRouter(
    initialLocation: login,
    routes: [
      GoRoute(name: login, path: login, builder: (_, __) => LoginView()),
      GoRoute(
        name: home,
        path: home,
        builder: (_, __) => Container(color: Colors.red),
      ),
    ],
  );
}
