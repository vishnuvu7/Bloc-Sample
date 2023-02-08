import 'dart:convert';

class BaseApiResponse<T> {
  int? statusCode;
  String? message;
  T? payload;

  BaseApiResponse({this.statusCode, this.message, this.payload});

  factory BaseApiResponse.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    var payLoadResponse = json["payload"];
    var isPayLoadNull = payLoadResponse == null;
    if (isPayLoadNull) {
      return BaseApiResponse<T>(
        statusCode: json["status_code"],
        message: json["message"],
      );
    } else {
      return BaseApiResponse<T>(
        statusCode: json["status_code"],
        message: json["message"],
        payload: create(json["payload"]),
      );
    }
  }

  factory BaseApiResponse.fromJsonList(Map<String, dynamic> json, Function(List<dynamic>) create) {
    var payLoadResponse = json["payload"];
    var isPayLoadNull = payLoadResponse == null;
    if (isPayLoadNull) {
      return BaseApiResponse<T>(
        statusCode: json["status_code"],
        message: json["message"],
      );
    } else {
      return BaseApiResponse<T>(
        statusCode: json["status_code"],
        message: json["message"],
        payload: create(json["payload"]),
      );
    }
  }

  factory BaseApiResponse.fromJsonWithoutResult(Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return BaseApiResponse(
      statusCode: json["status_code"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "payload": jsonEncode(payload),
      };
}

abstract class Serializable {
  Map<String, dynamic> toJson();
}

enum Status { loading, completed, error }
