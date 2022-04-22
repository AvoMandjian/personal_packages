import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import 'circular_progress_indicator.dart';

class BuildCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final Color? color;
  final BoxFit? fit;
  final int? memCacheWidth;
  final Alignment? alignment;
  final bool circularLoader;

  final int? memCacheHeight;

  const BuildCachedNetworkImage(
    this.imageUrl, {
    Key? key,
    this.alignment,
    required this.width,
    required this.height,
    this.memCacheWidth,
    this.memCacheHeight,
    this.color,
    this.fit = BoxFit.cover,
    this.circularLoader = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      alignment: alignment ?? Alignment.center,
      fit: fit,
      width: width,
      height: height,
      memCacheWidth: memCacheWidth ?? width.toInt(),
      memCacheHeight: memCacheHeight ?? height.toInt(),
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          circularLoader
              ? Center(
                  child: BuildCircularProgressIndicator(
                    value: downloadProgress.progress,
                    color: color,
                  ),
                )
              : Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: Colors.grey.shade400,
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
      errorWidget: (context, url, error) => Container(
        color: Colors.black54,
      ),
    );
  }
}
