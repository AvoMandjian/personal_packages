import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildButton extends StatelessWidget {
  final String buttonText;
  final Color color;
  final TextStyle? textStyle;
  final double width;
  final int height;
  final void Function()? onTap;
  final BorderRadius? borderRadius;
  final AlignmentGeometry? alignment;
  const BuildButton({
    Key? key,
    this.buttonText = '',
    this.color = Colors.black,
    this.textStyle,
    this.width = double.infinity,
    this.height = 60,
    this.onTap,
    this.borderRadius,
    this.alignment,
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
          child: Align(
            alignment: alignment ?? Alignment.center,
            child: AutoSizeText(
              buttonText,
              style: textStyle ??
                  TextStyle(
                    fontFamily: 'MontserratSemiBold',
                    fontSize: 13.sp,
                    letterSpacing: 1,
                    color: Colors.white,
                  ),
              minFontSize: 1,
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
