import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:personal_packages/text_autozsize.dart';

class BuildButton extends StatelessWidget {
  final String buttonText;
  final Color color;
  final TextStyle? textStyle;
  final double width;
  final int height;
  final void Function()? onTap;
  final BorderRadius borderRadius;
  final AlignmentGeometry? alignment;
  final TextAlign? textAlign;
  final int maxLines;
  final EdgeInsetsGeometry? paddingAroundTheText;
  const BuildButton({
    Key? key,
    this.buttonText = '',
    this.color = Colors.black,
    this.textStyle,
    this.width = double.infinity,
    this.height = 60,
    this.onTap,
    this.borderRadius = BorderRadius.zero,
    this.alignment,
    this.textAlign,
    this.maxLines = 1,
    this.paddingAroundTheText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: width.w,
          height: height.h,
          color: color,
          child: Padding(
            padding: paddingAroundTheText ?? const EdgeInsets.all(0),
            child: BuildText(
              buttonText,
              style: textStyle ??
                  TextStyle(
                    fontFamily: 'MontserratSemiBold',
                    fontSize: 13.sp,
                    letterSpacing: 1,
                    color: Colors.white,
                  ),
              maxLines: maxLines,
              textAlign: textAlign,
            ),
          ),
        ),
      ),
    );
  }
}
