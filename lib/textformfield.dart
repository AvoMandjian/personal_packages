import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildTextFormField extends StatelessWidget {
  final bool enabled;
  final String hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final bool hasValidator;
  final int bottomPadding;
  final TextCapitalization? textCapitalization;
  final TextStyle? labelTextStyle;
  final TextStyle? hintTextStyle;
  final int paddingBetweenLabelAndInput;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  const BuildTextFormField({
    Key? key,
    this.enabled = true,
    required this.hintText,
    this.labelText,
    this.controller,
    this.textInputType,
    this.inputFormatters,
    this.validator,
    this.hasValidator = false,
    this.bottomPadding = 0,
    this.textCapitalization,
    this.labelTextStyle,
    this.hintTextStyle,
    this.paddingBetweenLabelAndInput = 0,
    this.suffixIcon,
    this.textInputAction,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.2,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          bottom: bottomPadding.toDouble(),
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
              height: paddingBetweenLabelAndInput.toDouble(),
            ),
            TextFormField(
              textInputAction: textInputAction,
              textCapitalization: textCapitalization ?? TextCapitalization.none,
              enabled: enabled,
              inputFormatters: inputFormatters,
              obscureText: textInputType == TextInputType.visiblePassword,
              keyboardType: textInputType,
              focusNode: focusNode,
              validator: hasValidator
                  ? (String? value) {
                      if (value?.isNotEmpty ?? false) {
                        return null;
                      } else {
                        return 'Required';
                      }
                    }
                  : validator,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: hintTextStyle,
                suffixIcon: suffixIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
