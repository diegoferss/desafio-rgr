import 'package:flutter/material.dart';

import 'app_localizations.dart';

abstract class LocalizeProtocol {
  AppLocalizations get l10n;
}

class Localize extends LocalizeProtocol {
  AppLocalizations? _l10n;

  static Localize instance = Localize._();

  Localize._();

  @override
  AppLocalizations get l10n => _l10n!;

  AppLocalizations of(BuildContext context) {
    _l10n ??= AppLocalizations.of(context);
    return l10n;
  }
}
