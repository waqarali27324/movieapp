import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GayaSvgAsset extends StatelessWidget {
  final String assetPath;
  final double? height;
  final double? width;
  final Color? color;

  const GayaSvgAsset(
    this.assetPath, {
    Key? key,
    this.height = 16,
    this.width = 16,
    this.color,
  }) : super(key: key);

  GayaSvgAsset copyWith({
    String? assetPath,
    double? height,
    double? width,
    Color? color,
  }) {
    return GayaSvgAsset(
      assetPath ?? this.assetPath,
      height: height ?? this.height,
      width: width ?? this.width,
      color: color ?? this.color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(assetPath,
        height: height, width: width, colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null);
  }
}