import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTextFormField extends StatelessWidget {
  final bool enabled;
  final String hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final int bottomPadding;
  final TextCapitalization? textCapitalization;
  final TextStyle labelTextStyle;
  final int paddingBetweenLabelAndInput;
  const BuildTextFormField({
    Key? key,
    this.enabled = true,
    required this.hintText,
    this.labelText,
    this.controller,
    this.textInputType,
    this.inputFormatters,
    this.validator,
    this.bottomPadding = 0,
    this.textCapitalization,
    required this.labelTextStyle,
    this.paddingBetweenLabelAndInput = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.2,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          bottom: bottomPadding.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              labelText ?? hintText,
              style: labelTextStyle,
            ),
            SizedBox(
              height: paddingBetweenLabelAndInput.h,
            ),
            TextFormField(
              textCapitalization: textCapitalization ?? TextCapitalization.none,
              enabled: enabled,
              inputFormatters: inputFormatters,
              obscureText: textInputType == TextInputType.visiblePassword,
              keyboardType: textInputType,
              validator: validator,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
