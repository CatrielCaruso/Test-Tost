import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:test_tots/core/preference.dart';
import 'package:test_tots/models/error_message.dart';
import 'package:test_tots/models/client_model.dart';

class ClientRepository {
  static Future<dynamic> clients({required int page}) async {
    String baseUrl = 'https://agency-coda.uc.r.appspot.com';

    final Dio dio = Dio();
    String token = Preferences.token;
    try {
      var response = await dio.post(
        '$baseUrl/client/list?page=$page',
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
}
