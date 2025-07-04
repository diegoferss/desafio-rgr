import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rgr/support/styles/app_themes.dart';

import 'firebase_options.dart';
import 'l10n/app_localizations.dart';
import 'l10n/localize.dart';
import 'router/mobile_router.dart';
import 'support/services/injector/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  injector.registerModules();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: MobileRouter.router,
      theme: AppThemes.theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => Localize.instance.of(context).appName,
    );
  }
}
