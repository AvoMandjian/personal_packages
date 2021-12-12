import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:personal_packages/circular_progress_indicator.dart';
import 'package:personal_packages/models/api_error_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:personal_packages/models/api_success_model.dart';
import 'package:http/http.dart' as http;

void openLoader(Color colorOfLoader) {
  Get.dialog(
    BuildCircularProgressIndicator(
      color: colorOfLoader,
    ),
    barrierColor: Colors.black26,
    barrierDismissible: false,
  );
}

void closeLoader() {
  if (Get.isOverlaysOpen) {
    closeLoader();
  }
}

class GetColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  GetColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Color hexColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor));
}

getSnackbarError(
  double paddingGlobal,
  ApiError apiError, {
  int seconds = 2,
}) {
  Get.closeAllSnackbars();
  closeLoader();

  return Get.snackbar(
    apiError.error.title,
    apiError.error.message,
    duration: Duration(seconds: seconds),
    backgroundColor: Colors.red,
    margin:
        EdgeInsets.only(top: 25.h, left: paddingGlobal, right: paddingGlobal),
    colorText: Colors.white,
  );
}

getSnackbarSuccess(ApiSuccess apiSuccess, paddingGlobal, {int seconds = 2}) {
  Get.closeAllSnackbars();
  closeLoader();

  return Get.snackbar(
    apiSuccess.success.title,
    apiSuccess.success.message,
    duration: Duration(seconds: seconds),
    backgroundColor: Colors.red,
    margin:
        EdgeInsets.only(top: 25.h, left: paddingGlobal, right: paddingGlobal),
    colorText: Colors.white,
  );
}

Future<void> handleLogout(context, Widget myApp) async {
  await FacebookAuth.instance.logOut();
  await GoogleSignIn().signOut();
  await OneSignal.shared.disablePush(true);
  await GetStorage().erase();
  Get.reset();
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => myApp,
      ),
      (route) => false);
}

Future<String> getcountryCodeFromIpInfo() async {
  var data = await http.get(Uri.parse('http://ip-api.com/json'));
  Map decodedData = jsonDecode(data.body);
  String countryCode = decodedData['countryCode'];
  return countryCode;
}

void closeKeyboard() => FocusManager.instance.primaryFocus!.unfocus();
