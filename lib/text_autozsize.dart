import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

/// default [maxLines] = 1
class BuildText extends StatelessWidget {
  const BuildText(
    this.text, {
    Key? key,
    required this.style,
    this.maxLines = 1,
    this.textAlign,
  }) : super(key: key);
  final TextStyle style;
  final String text;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: style,
      minFontSize: 1,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
