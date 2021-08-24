import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xr_dumy/helper/network_helper.dart';

class AuthService {
  static final NetworkAPI _networkAPICall = NetworkAPI();

  static Future<void> register(
      {required String email, required String password}) async {
    try {
      final registerDetails = {
        'email': email, 'password': password,
      };


    } catch (e) {}
  }
}
