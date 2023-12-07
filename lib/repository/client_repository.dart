import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:test_tots/core/preference.dart';
import 'package:test_tots/models/client_model.dart';

class ClientRepository {
  static final Dio dio = Dio();
  static String token = Preferences.token;
  static String baseUrl = 'https://agency-coda.uc.r.appspot.com';
  static Future<dynamic> clients() async {
    try {
      var response = await dio.post(
        '$baseUrl/client/list',
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Authorization": "Bearer $token"
          },
        ),
      );
      final responseData = jsonDecode(response.toString());
      // if (responseData['success'] == false) {
      //   return ErrorMessageModel.fromMap(responseData.);
      // }

      return List<Client>.from(
              responseData["response"]["data"].map((x) => Client.fromMap(x)))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<Client?> newClient({required Map<String, dynamic> data}) async {
    try {
      var response = await dio.post('$baseUrl/client/save',
          options: Options(
            headers: {
              'Accept': 'application/json',
              "Authorization": "Bearer $token"
            },
          ),
          data: data);
      final responseData = jsonDecode(response.toString());
      return Client.fromMap(responseData["response"]);
    } catch (e) {
      rethrow;
    }
  }
}
