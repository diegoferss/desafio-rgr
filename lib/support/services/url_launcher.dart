import 'package:url_launcher/url_launcher.dart';

enum UrlLauncherMode {
  external(LaunchMode.externalApplication);

  final LaunchMode launchMode;

  const UrlLauncherMode(this.launchMode);
}

abstract class UrlLauncher {
  Future<void> redirectUrl({required String url, UrlLauncherMode mode = UrlLauncherMode.external});
}

class UrlLauncherImpl implements UrlLauncher {
  @override
  Future<void> redirectUrl({required String url, UrlLauncherMode mode = UrlLauncherMode.external}) async {
    await launchUrl(Uri.parse(url), mode: mode.launchMode);
  }
}
