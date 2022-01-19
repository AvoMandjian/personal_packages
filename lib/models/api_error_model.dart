import 'dart:convert';
import 'dart:developer';

import 'package:flutter_email_sender/flutter_email_sender.dart';

// To parse this JSON data, do
//
//     final apiError = apiErrorFromJson(jsonString);

ApiError apiErrorFromJson(
  String str, {
  bool enableSendEmail = false,
}) {
  log('ERROR:\n\n\n$str\n\n\n');
  // SEND EMAIL MANUALLY
  if (enableSendEmail) {
    final Email email = Email(
      body: str,
      subject: 'Error',
      recipients: ['avo@thewebaddicts.com'],
      isHTML: false,
    );
    FlutterEmailSender.send(email);
  }
  // SEND EMAIL MANUALLY

  return ApiError.fromJson(json.decode(str));
}

String apiErrorToJson(ApiError data) {
  log(jsonEncode(data.error).toString());
  return json.encode(data.toJson());
}

class ApiError {
  ApiError({
    required this.error,
  });

  Error error;

  factory ApiError.fromJson(Map<String, dynamic> json) => ApiError(
        error: Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error.toJson(),
      };
}

class Error {
  Error({
    this.code,
    this.title = 'ERROR',
    required this.message,
    this.debugger,
  });

  int? code = 0;
  String title;
  String message;
  String? debugger = '';

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json["code"],
        title: json["title"],
        message: json["message"],
        debugger: json["debugger"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "title": title,
        "message": message,
        "debugger": debugger,
      };
}
