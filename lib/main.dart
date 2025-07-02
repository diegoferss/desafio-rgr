import 'package:flutter/material.dart';

import 'support/services/injector/injector.dart';

void main() {
  injector.registerModules();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    );
  }
}

