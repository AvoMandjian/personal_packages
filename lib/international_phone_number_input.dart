import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class BuildInternationalPhoneNumberInput extends StatelessWidget {
  const BuildInternationalPhoneNumberInput({
    Key? key,
    required this.controller,
    required this.paddingGlobal,
    required this.textStyleLabel,
    required this.textStyleTextInput,
    required this.textStyleSelector,
  }) : super(key: key);

  final dynamic controller;
  final double paddingGlobal;
  final TextStyle textStyleLabel;
  final TextStyle textStyleTextInput;
  final TextStyle textStyleSelector;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width - (2 * paddingGlobal),
      height: 57.3,
      child: Stack(
        children: [
          InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber? phoneNumber) {
              // print(phoneNumber);
            },
            initialValue: controller.splashscreenController.phoneNumber,
            inputBorder: InputBorder.none,
            autoFocusSearch: true,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            selectorConfig: const SelectorConfig(
              showFlags: false,
              selectorType: PhoneInputSelectorType.DIALOG,
              setSelectorButtonAsPrefixIcon: true,
            ),
            inputDecoration: InputDecoration(
              label: Text(
                'PHONE NUMBER',
                style: textStyleLabel,
              ),
              hintText: 'Ex: 03 364 283',
            ),
            searchBoxDecoration: InputDecoration(
              fillColor: Colors.grey[100],
              label: const Text('Search'),
            ),
            textStyle: textStyleTextInput,
            selectorTextStyle: textStyleSelector,
          ),
          AbsorbPointer(
            absorbing: false,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: Get.mediaQuery.size.shortestSide * 0.12,
                  ),
                  child: const Icon(Icons.arrow_drop_down,
                      color: Colors.white, size: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
