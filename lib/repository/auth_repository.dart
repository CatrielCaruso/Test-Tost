import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:test_tots/models/models.dart';

class AuthRepository {
  static Future<dynamic> login(
      {required String email, required String password}) async {
    String baseUrl = 'https://agency-coda.uc.r.appspot.com';

    final Dio dio = Dio();

    try {
      var response = await dio.post(
        '$baseUrl/mia-auth/login',
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
        data: {'email': email, 'password': password},
      );
      final responseData = jsonDecode(response.toString());
      if (responseData['success'] == false) {
        return ErrorMessageModel.fromMap(responseData);
      }
      return AuthModel.fromMap(responseData);
    } catch (e) {
      rethrow;
    }
  }
}
