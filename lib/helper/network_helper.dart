import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xr_dumy/helper/Snackbar.dart';
import 'package:xr_dumy/utils/app_config.dart';
import 'package:http/http.dart' as http;

class NetworkAPI {
  static final NetworkAPI _networkAPICall = NetworkAPI._internal();

  factory NetworkAPI() {
    return _networkAPICall;
  }

  NetworkAPI._internal();

  static const String baseUrl = AppConfig.baseURL;

  Future<dynamic> post(String url, dynamic body,
      {Map<String, String>? header}) async {
    final client = http.Client();
    try {
      final String fullURL = baseUrl + url;
      final response =
          await client.post(Uri.parse(fullURL), body: body, headers: header);
      return checkResponse(response);
    } catch (e) {
      client.close();
      SnackBarApp.showSnackBar(massage: 'Data Not Available ', title: 'Api Error');
      // rethrow;
    }
  }

  dynamic checkResponse(http.Response response) {
    try {
      if (response.body.isEmpty) {
        throw Exception();
      }
      final json = jsonDecode(response.body);
      final bool isSuccess = json['success'] ?? false;
      if (!isSuccess && response.statusCode != 200) {
        throw Exception();
      }
      return json;
    } catch (e) {
      rethrow;
    }
  }
}
