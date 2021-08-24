import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xr_dumy/Controller/Authentication.dart';

class LoginScreenController extends GetxController{
  Authentication _authentication = Get.find();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();



  Future<void> userLogin() async {
    try {
      if (formKey.currentState!.validate()) {
        log('done done');
        await _authentication.login(
            emailController.text, passwordController.text);
      }
    } catch (e) {
      // AppException.showException(e, st);
      log('error ${e.toString()}');
    }
  }

  //
  //   try {
  //     if (formKey.currentState!.validate()) {
  //       await _authentication.userRegister(
  //         email: emailController.text,
  //         password: passwordController.text,
  //       );
  //     }
  //   } catch (e) {
  //     // AppException.showException(e, st);
  //     log(e.toString());
  //   }
  // }



}