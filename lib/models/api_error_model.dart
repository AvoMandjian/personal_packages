import 'dart:convert';

// To parse this JSON data, do
//
//     final apiError = apiErrorFromJson(jsonString);

ApiError apiErrorFromJson(String str) => ApiError.fromJson(json.decode(str));

String apiErrorToJson(ApiError data) => json.encode(data.toJson());

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
    required this.title,
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
