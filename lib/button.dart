import 'package:flutter/material.dart';

import 'text_autozsize.dart';

/// a simple container with inkwell
class BuildButton extends StatelessWidget {
  final String buttonText;
  final Color color;
  final TextStyle? textStyle;
  final double width;
  final int height;
  final void Function()? onTap;
  final BorderRadius borderRadius;
  final AlignmentGeometry? alignmentOfText;
  final TextAlign? textAlign;
  final int maxLines;
  final EdgeInsetsGeometry? paddingAroundTheText;
  final Widget? child;
  const BuildButton({
    Key? key,
    this.buttonText = '',
    this.color = Colors.black,
    this.textStyle,
    this.width = double.infinity,
    this.height = 60,
    this.onTap,
    this.borderRadius = BorderRadius.zero,
    this.alignmentOfText,
    this.textAlign,
    this.maxLines = 1,
    this.paddingAroundTheText,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: width,
          height: height.toDouble(),
          color: color,
          child: child ??
              Padding(
                padding: paddingAroundTheText ?? const EdgeInsets.all(0),
                child: Align(
                  alignment: alignmentOfText ?? Alignment.center,
                  child: BuildText(
                    buttonText,
                    style: textStyle ??
                        const TextStyle(
                          fontFamily: 'MontserratSemiBold',
                          fontSize: 13,
                          letterSpacing: 1.0,
                          color: Colors.white,
                        ),
                    maxLines: maxLines,
                    textAlign: textAlign,
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
