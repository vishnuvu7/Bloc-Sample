// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'dart:convert';

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  AuthResponse({
    this.token,
    this.reason,
  });

  String? token;
  String? reason;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    token: json["token"],
    reason: json["reason"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "reason": reason,
  };
}
