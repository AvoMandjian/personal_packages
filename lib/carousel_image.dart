import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:personal_packages/util_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:personal_packages/image_with_tap.dart';

class BuildCarouselWithPageIndicator extends StatelessWidget {
  final int widthOfImage;
  final int heightOfImage;
  final List<String> listOfImages;
  final Color colorOfLoader;
  final dynamic effectAnimatedSmoothIndicator;
  final dynamic controller;
  final EdgeInsetsGeometry paddingOfImage;
  final int paddingBottomOfAnimatedSmoothIndicator;
  final Color backgroundColor;

  /// https://github.com/Milad-Akarie/smooth_page_indicator#effects ///

  const BuildCarouselWithPageIndicator({
    Key? key,
    required this.widthOfImage,
    required this.heightOfImage,
    required this.listOfImages,
    required this.colorOfLoader,
    required this.effectAnimatedSmoothIndicator,
    required this.controller,
    required this.paddingOfImage,
    required this.paddingBottomOfAnimatedSmoothIndicator,
    required this.backgroundColor,
  }) : super(key: key);

  ///   final activeCarouselIndex = 1.obs; ///

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          CarouselSlider(
            items: listOfImages.map(
              (e) {
                return Padding(
                  padding: paddingOfImage,
                  child: BuildImageWithTap(
                    image: e,
                    width: widthOfImage.sp,
                    height: widthOfImage.sp,
                    colorOfLoader: colorOfLoader,
                  ),
                );
              },
            ).toList(),
            options: CarouselOptions(
              height: widthOfImage.sp,
              viewportFraction: 1,
              onPageChanged: (index, reason) =>
                  controller.activeCarouselIndex.value = index,
            ),
          ),
          BuildSizedBoxHeight(height: paddingBottomOfAnimatedSmoothIndicator),
          Obx(
            () => AnimatedSmoothIndicator(
              activeIndex: controller.activeCarouselIndex.value,
              count: listOfImages.length,
              effect: effectAnimatedSmoothIndicator,
            ),
          ),
        ],
      ),
    );
  }
}
