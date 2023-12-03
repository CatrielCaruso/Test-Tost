import 'dart:convert';

class AuthModel {
  final bool success;
  final Auth response;

  AuthModel({
    required this.success,
    required this.response,
  });

  factory AuthModel.fromJson(String str) => AuthModel.fromMap(json.decode(str));

  factory AuthModel.fromMap(Map<String, dynamic> json) => AuthModel(
        success: json["success"],
        response: Auth.fromMap(json["response"]),
      );
}

class Auth {
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String photo;
  final String phone;
  final dynamic facebookId;
  final int role;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int status;
  final int isNotification;
  final dynamic caption;
  final String tokenType;
  final String accessToken;

  Auth({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.photo,
    required this.phone,
    required this.facebookId,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.isNotification,
    required this.caption,
    required this.tokenType,
    required this.accessToken,
  });

  factory Auth.fromJson(String str) => Auth.fromMap(json.decode(str));

  factory Auth.fromMap(Map<String, dynamic> json) => Auth(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        photo: json["photo"],
        phone: json["phone"],
        facebookId: json["facebook_id"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: json["status"],
        isNotification: json["is_notification"],
        caption: json["caption"],
        tokenType: json["token_type"],
        accessToken: json["access_token"],
      );
}
