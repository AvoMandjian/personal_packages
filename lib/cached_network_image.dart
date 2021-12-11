import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:line_icons/line_icons.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_packages/circular_progress_indicator.dart';

class BuildCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final Color color;
  final BoxFit? fit;
  const BuildCachedNetworkImage({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.color,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      width: width.w,
      height: height.h,
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: BuildCircularProgressIndicator(
          value: downloadProgress.progress,
          color: color,
        ),
      ),
      errorWidget: (context, url, error) =>
          const Icon(LineIcons.exclamationCircle),
    );
  }
}
