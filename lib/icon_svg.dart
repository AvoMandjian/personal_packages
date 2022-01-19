import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildSvgIcon extends StatelessWidget {
  final String svgAssetPath;
  final double width;
  final double height;
  final Color? color;
  const BuildSvgIcon({
    Key? key,
    required this.svgAssetPath,
    required this.width,
    required this.height,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgAssetPath,
      width: width.w,
      height: height.h,
      color: color,
    );
  }
}
