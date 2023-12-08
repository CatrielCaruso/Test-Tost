import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:test_tots/models/models.dart';

class AuthRepository {
  static final String? _apiUrl = dotenv.env['API_URL'];
  static Future<dynamic> login(
      {required String email, required String password}) async {
    final Dio dio = Dio();

    try {
      var response = await dio.post(
        'https://agency-coda.uc.r.appspot.com/mia-auth/login',
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
