import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:extended_image/extended_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 15.w),
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
                  padding: EdgeInsets.all(10.0.sp),
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
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.red,
                              ),
                            ),
                          );
                        case LoadState.completed:
                          return null;
                        case LoadState.failed:
                          return GestureDetector(
                            onTap: () => state.reLoadImage(),
                            child: Center(
                              child: Text(
                                'loading the image failed, click to reload',
                                textAlign: TextAlign.center,
                                style:
                                    const TextStyle(color: Colors.red).copyWith(
                                  decoration: TextDecoration.none,
                                ),
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
