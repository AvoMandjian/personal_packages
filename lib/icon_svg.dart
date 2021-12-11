import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class BuildSvgIcon extends StatelessWidget {
  final String svgAssetPath;
  final double width;
  final double height;
  const BuildSvgIcon({
    Key? key,
    required this.svgAssetPath,
    required this.width,
    required this.height,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgAssetPath,
      width: width,
      height: height,
    );
  }
}
