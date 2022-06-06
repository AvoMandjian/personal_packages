import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

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
  final AutoScrollController? scrollController;
  final int? indexOfAutoscroll;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onFieldChanged;
  final bool? filled;
  final Color? fillColor;
  final bool withOpacity;
  const BuildTextFormField({
    Key? key,
    this.enabled = true,
    this.withOpacity = true,
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
    this.scrollController,
    this.indexOfAutoscroll,
    this.onFieldSubmitted,
    this.onFieldChanged,
    this.filled,
    this.fillColor,
  })  : assert(
          hasValidator ? scrollController != null : scrollController == null,
        ),
        assert(
          hasValidator ? indexOfAutoscroll != null : indexOfAutoscroll == null,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: withOpacity ? (enabled ? 1 : 0.2) : 1,
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
            hasValidator
                ? AutoScrollTag(
                    key: ValueKey(indexOfAutoscroll),
                    controller: scrollController!,
                    index: indexOfAutoscroll!,
                    child: TextFormField(
                      onChanged: onFieldChanged,
                      onFieldSubmitted: onFieldSubmitted,
                      textInputAction: textInputAction,
                      textCapitalization:
                          textCapitalization ?? TextCapitalization.none,
                      enabled: enabled,
                      inputFormatters: inputFormatters,
                      obscureText:
                          textInputType == TextInputType.visiblePassword,
                      keyboardType: textInputType,
                      focusNode: focusNode,
                      validator: (String? value) {
                        if (value?.isNotEmpty ?? false) {
                          return null;
                        } else {
                          if (!scrollController!.isAutoScrolling) {
                            scrollController!
                                .scrollToIndex(indexOfAutoscroll!,
                                    preferPosition: AutoScrollPosition.begin)
                                .then(
                                  (_) => focusNode?.requestFocus(),
                                );
                          }
                          return 'Required';
                        }
                      },
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: hintTextStyle,
                        suffixIcon: suffixIcon,
                        filled: filled,
                        fillColor: fillColor,
                      ),
                    ),
                  )
                : TextFormField(
                    onChanged: onFieldChanged,
                    onFieldSubmitted: onFieldSubmitted,
                    textInputAction: textInputAction,
                    textCapitalization:
                        textCapitalization ?? TextCapitalization.none,
                    enabled: enabled,
                    inputFormatters: inputFormatters,
                    obscureText: textInputType == TextInputType.visiblePassword,
                    keyboardType: textInputType,
                    focusNode: focusNode,
                    validator: validator,
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: hintTextStyle,
                      suffixIcon: suffixIcon,
                      filled: filled,
                      fillColor: fillColor,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
