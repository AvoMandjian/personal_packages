import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:get/get.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'cached_network_image.dart';
import 'image_with_tap.dart';

final CarouselController _carouselController = CarouselController();

class BuildCarouselWithPageIndicator extends StatelessWidget {
  final int widthOfImage;
  final int heightOfImage;
  final List<String> listOfImages;
  final Color? colorOfLoader;
  final dynamic effectAnimatedSmoothIndicator;
  final dynamic controller;
  final EdgeInsetsGeometry paddingOfCarousel;
  final EdgeInsetsGeometry paddingOfSmoothPageIndicator;
  final Color backgroundColor;
  final bool isPinchToZoom;

  /// https://github.com/Milad-Akarie/smooth_page_indicator#effects ///

  const BuildCarouselWithPageIndicator({
    Key? key,
    required this.widthOfImage,
    required this.heightOfImage,
    required this.listOfImages,
    this.colorOfLoader,
    required this.effectAnimatedSmoothIndicator,
    required this.controller,
    required this.paddingOfCarousel,
    required this.paddingOfSmoothPageIndicator,
    required this.backgroundColor,
    this.isPinchToZoom = false,
  }) : super(key: key);

  ///   final activeCarouselIndex = 1.obs; ///

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          Padding(
            padding: paddingOfCarousel,
            child: CarouselSlider(
              carouselController: _carouselController,
              items: isPinchToZoom
                  ? listOfImages
                      .map(
                        (e) => PinchZoomImage(
                          zoomedBackgroundColor: Colors.black45,
                          image: BuildCachedNetworkImage(
                            e,
                            width: widthOfImage.toDouble(),
                            height: widthOfImage.toDouble(),
                            color: colorOfLoader,
                          ),
                        ),
                      )
                      .toList()
                  : listOfImages.map(
                      (e) {
                        return BuildImageWithTap(
                          image: e,
                          width: widthOfImage.toDouble(),
                          height: widthOfImage.toDouble(),
                          colorOfLoader: colorOfLoader,
                        );
                      },
                    ).toList(),
              options: CarouselOptions(
                scrollPhysics: isPinchToZoom
                    ? const NeverScrollableScrollPhysics()
                    : const ScrollPhysics(),
                height: widthOfImage.toDouble(),
                viewportFraction: 1,
                onPageChanged: (index, reason) =>
                    controller.activeCarouselIndex.value = index,
              ),
            ),
          ),
          Padding(
            padding: paddingOfSmoothPageIndicator,
            child: Obx(
              () => isPinchToZoom
                  ? Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => _carouselController.previousPage(),
                            child: const Align(
                              child: Icon(
                                CupertinoIcons.chevron_left,
                                size: 18
                              ),
                            ),
                          ),
                        ),
                        AnimatedSmoothIndicator(
                          activeIndex: controller.activeCarouselIndex.value,
                          count: listOfImages.length,
                          effect: effectAnimatedSmoothIndicator,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => _carouselController.nextPage(),
                            child: const Align(
                              child: Icon(
                                CupertinoIcons.right_chevron,
                                size: 18
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : AnimatedSmoothIndicator(
                      activeIndex: controller.activeCarouselIndex.value,
                      count: listOfImages.length,
                      effect: effectAnimatedSmoothIndicator,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
