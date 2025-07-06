import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/svg_asset.dart';

class SvgViewer extends StatelessWidget {
  final Color? color;
  final BoxFit fit;
  final SvgAsset asset;
  final double? height;
  final double? width;

  const SvgViewer({required this.asset, this.color, this.fit = BoxFit.contain, this.height, this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(asset.path, colorFilter: _colorFilter, fit: fit, width: width, height: height);
  }

  ColorFilter? get _colorFilter {
    final color = this.color;
    if (color == null) return null;

    return ColorFilter.mode(color, BlendMode.srcIn);
  }
}
