import 'app_assets.dart';

enum SvgAsset {
  icGoogle(AppAssets.icGooglePath),
  icApple(AppAssets.icApplePath),
  icSadFace(AppAssets.icSadFacePath);

  final String path;

  const SvgAsset(this.path);
}
