import 'package:flutter/material.dart';
import 'l10n/localize.dart';
import 'support/services/injector/injector.dart';
import 'l10n/app_localizations.dart';

void main() {
  injector.registerModules();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => Localize.instance.of(context).appName,
    );
  }
}

