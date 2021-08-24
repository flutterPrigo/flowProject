import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xr_dumy/utils/app_config.dart';
import 'package:http/http.dart' as http;

class NetworkAPI{

  static final NetworkAPI  _networkAPICall = NetworkAPI._internal();

  factory NetworkAPI() {
    return _networkAPICall;
  }

  NetworkAPI._internal();


  static const String BASE_URL = AppConfig.baseURL;


  Future<dynamic> post(String url, dynamic body,
      {Map<String, String>? header}) async {
    final client = http.Client();
    try {
      final String fullURL = BASE_URL + url;


      final response =
      await client.post(Uri.parse(fullURL), body: body, headers: header);

      return checkResponse(response);
    } catch (e) {
      client.close();
      rethrow;
    }
  }

  dynamic checkResponse(http.Response response) {
    try {
      if (response.body.isEmpty) {
        // throw AppException(message: 'Response body is empty', errorCode: 0);
      }
      final json = jsonDecode(response.body);
      final bool isSuccess = json['success'] ?? false;
      if (!isSuccess && response.statusCode != 200) {
        // throw AppException(
        //     message: json['error'] ?? 'Unknown Error',
        //     errorCode: response.statusCode);
      }
      return json;
    } catch (e) {
      rethrow;
    }
  }
}