import 'dart:convert';

// To parse this JSON data, do
//
//     final apisuccess = apisuccessFromJson(jsonString);

ApiSuccess apiSuccessFromJson(String str) =>
    ApiSuccess.fromJson(json.decode(str));

String apiSuccessToJson(ApiSuccess data) => json.encode(data.toJson());

class ApiSuccess {
  ApiSuccess({
    required this.success,
  });

  Success success;

  factory ApiSuccess.fromJson(Map<String, dynamic> json) => ApiSuccess(
        success: Success.fromJson(json["success"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success.toJson(),
      };
}

class Success {
  Success({
    this.code,
    this.title = 'SUCCESS',
    required this.message,
    this.debugger,
  });

  int? code = 0;
  String title;
  String message;
  String? debugger = '';

  factory Success.fromJson(Map<String, dynamic> json) => Success(
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
