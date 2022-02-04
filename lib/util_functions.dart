import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'circular_progress_indicator.dart';
import 'models/api_error_model.dart';
import 'models/api_success_model.dart';
import 'models/ip_details.dart';

void openLoader({double? value, Color? color}) {
  if (!Get.currentRoute.contains('openLoader')) {
    Get.to(
      () => InkWell(
        onLongPress: () => Get.back(),
        child: Container(
          color: Colors.black45,
          child: BuildCircularProgressIndicator(
            color: color,
            value: value,
          ),
        ),
      ),
      opaque: false,
      fullscreenDialog: true,
      duration: const Duration(
        seconds: 0,
      ),
      routeName: 'openLoader',
    );
  }
}

void closeLoader() {
  if (Get.currentRoute.contains('openLoader')) {
    Get.back();
  }
}

class HexColor extends Color {
  /// takes [hexColor] without # and return Color model
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

getSnackbarError(
  double paddingGlobal, {
  ApiError? apiError,
  String title = 'ERROR',
  String message = '',
  int seconds = 2,
  Color backgroundColor = Colors.red,
  Uri? requestUri,
}) {
  log('\nERROR\n\n\t\tREQUEST:\n\t\t\t$requestUri\n\t\tTITLE:\n\t\t\t${apiError?.error.title ?? title}\n\t\tMESSAGE:\n\t\t\t${apiError?.error.message ?? message}');
  if (!Get.isSnackbarOpen) {
    return Get.snackbar(
      apiError?.error.title ?? title,
      apiError?.error.message ?? message,
      duration: Duration(seconds: seconds),
      backgroundColor: backgroundColor,
      margin:
          EdgeInsets.only(top: 25.h, left: paddingGlobal, right: paddingGlobal),
      colorText: Colors.white,
    );
  }
}

getSnackbarSuccess(
  double paddingGlobal, {
  ApiSuccess? apiSuccess,
  String title = 'SUCCESS',
  String message = '',
  int seconds = 2,
  Color backgroundColor = Colors.green,
  Uri? requestUri,
}) {
  log('\nSUCCESS\n\n\t\tREQUEST:\n\t\t\t$requestUri\n\t\tTITLE:\n\t\t\t${apiSuccess?.success.title ?? title}\n\t\tMESSAGE:\n\t\t\t${apiSuccess?.success.message ?? message}');
  if (!Get.isSnackbarOpen) {
    return Get.snackbar(
      apiSuccess?.success.title ?? title,
      apiSuccess?.success.message ?? message,
      duration: Duration(seconds: seconds),
      backgroundColor: backgroundColor,
      margin:
          EdgeInsets.only(top: 25.h, left: paddingGlobal, right: paddingGlobal),
      colorText: Colors.white,
    );
  }
}

Future<void> handleLogoutOrRestart(
  context,
  Widget myApp, {
  bool facebookAuth = false,
  bool googleSignIn = false,
  bool logOut = true,
}) async {
  if (logOut) {
    if (facebookAuth) await FacebookAuth.instance.logOut();
    if (googleSignIn) await GoogleSignIn().signOut();
    await OneSignal.shared.disablePush(true);
    await GetStorage().erase();
  }
  Get.reset();
  Navigator.of(
    context,
    rootNavigator: true,
  ).pushAndRemoveUntil(
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

Future<IpDetails> getIpDetail() async {
  var data = await http.get(Uri.parse('http://ip-api.com/json'));
  Map<String, dynamic> decodedData = jsonDecode(data.body);
  IpDetails ipDetails = IpDetails.fromMap(decodedData);
  return ipDetails;
}

class BuildSizedBoxWidth extends StatelessWidget {
  const BuildSizedBoxWidth({
    Key? key,
    required this.width,
  }) : super(key: key);

  final int width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
    );
  }
}

class BuildSizedBoxHeight extends StatelessWidget {
  final int height;
  const BuildSizedBoxHeight({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}

void closeKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

/// [countryCode] example lb, usa
String getCountryFlagLink({
  required String countryCode,
  bool isSquare = false,
}) {
  return 'https://flags.twalab.live/${isSquare ? '1x1' : '4x3'}/$countryCode.svg';
}

String getLocale() {
  return Get.locale?.languageCode ?? 'en';
}

void getSnackbarSuccessDelayed(
  paddingGlobal, {
  ApiSuccess? apiSuccess,
  String? message,
  String? title,
  Uri? requestUri,
}) {
  Future.delayed(
    const Duration(milliseconds: 500),
    () => getSnackbarSuccess(
      paddingGlobal,
      apiSuccess: apiSuccess,
      message: message ?? '',
      title: title ?? 'SUCCESS',
      requestUri: requestUri,
    ),
  );
}

void getSnackbarErrorDelayed(
  paddingGlobal, {
  ApiError? apiError,
  String? message,
  String? title,
  Uri? requestUri,
}) {
  Future.delayed(
    const Duration(milliseconds: 500),
    () => getSnackbarError(
      paddingGlobal,
      apiError: apiError,
      message: message ?? '',
      title: title ?? 'ERROR',
      requestUri: requestUri,
    ),
  );
}

// PhoneNumber getPhoneNumber(splashscreenController) {
//   return splashscreenController.phoneNumber ?? PhoneNumber();
// }

void getBack() => Get.back();
