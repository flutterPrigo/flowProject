// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:xr_dumy/Screen/HomeScreen/HomeScreen.dart';
// import 'package:xr_dumy/helper/network_helper.dart';
//
// class AuthService {
//   static final NetworkAPI _networkAPI = NetworkAPI();
//
//   static Future<void> register(
//       {required String email, required String password}) async {
//     try {
//       final registerDetails = {
//         'email': email,
//         'password': password,
//       };
//
//       _networkAPI.post('uri/register', json.encode(registerDetails));
//
//       Get.offAndToNamed(HomeScreen.routeName);
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
