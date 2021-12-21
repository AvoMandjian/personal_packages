import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import 'package:personal_packages/circular_progress_indicator.dart';

class BuildImageWithTap extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final Color colorOfLoader;
  final BoxFit? fit;

  const BuildImageWithTap({
    Key? key,
    required this.image,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
    required this.colorOfLoader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Hero(
        tag: image,
        child: BuildCachedNetworkImage(
          imageUrl: image,
          height: height.h,
          width: width.w,
          fit: fit,
          colorOfLoader: colorOfLoader,
        ),
      ),
      onTap: () {
        Get.to(
          BuildImageOnTap(
            image: image,
          ),
          opaque: false,
          fullscreenDialog: true,
        );
      },
    );
  }
}

class BuildImageOnTap extends StatelessWidget {
  final String image;
  const BuildImageOnTap({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Hero(
          tag: image,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: context.width,
                height: context.height / 2,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ExtendedImage.network(
                    image,
                    fit: BoxFit.contain,
                    mode: ExtendedImageMode.gesture,
                    width: context.width / 3,
                    height: context.height / 3,
                    loadStateChanged: (ExtendedImageState state) {
                      switch (state.extendedImageLoadState) {
                        case LoadState.loading:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case LoadState.completed:
                          return null;
                        case LoadState.failed:
                          return GestureDetector(
                            onTap: () => state.reLoadImage(),
                            child: const Center(
                              child: Text(
                                'loading the image failed, click to reload',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                      }
                    },
                    initGestureConfigHandler: (state) {
                      return GestureConfig(
                        minScale: 1,
                        animationMinScale: 0.7,
                        maxScale: 3.0,
                        animationMaxScale: 3.5,
                        inPageView: true,
                        initialAlignment: InitialAlignment.center,
                      );
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: Padding(
                  padding: EdgeInsets.all(15.0.sp),
                  child: Container(
                    width: 20.sp,
                    height: 20.sp,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        CupertinoIcons.xmark,
                        color: Colors.black,
                        size: 13.0.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit? fit;
  final Color colorOfLoader;
  const BuildCachedNetworkImage({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
    required this.colorOfLoader,
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
          color: colorOfLoader,
        ),
      ),
      errorWidget: (context, url, error) =>
          const Icon(LineIcons.exclamationCircle),
    );
  }
}
