import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xr_dumy/Controller/Authentication.dart';

class RegisterController extends GetxController {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formRegisterKey = GlobalKey<FormState>();

  Authentication _authentication = Get.find();

  Future<void> userRegister() async {
    try {
      if (formRegisterKey.currentState!.validate()) {
        await _authentication.userRegister(
          email: emailController.text,
          password: passwordController.text,
        );
      }
    } catch (e) {
      // AppException.showException(e, st);
      log(e.toString());
    }
  }


}
