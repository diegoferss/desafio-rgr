import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileRouter {
  static const String initialRoute = '/';

  static final router = GoRouter(
    initialLocation: initialRoute,
    routes: [
      GoRoute(
        name: initialRoute,
        path: initialRoute,
        builder: (_, __) => Container(),
      ),
    ],
  );
}
