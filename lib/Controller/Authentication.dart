import 'dart:async';
import 'package:get/get.dart';
import 'package:xr_dumy/Controller/AuthService.dart';
import 'package:xr_dumy/Screen/LoginScreen/LoginScreen.dart';

class Authentication extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 2), () {
      Get.offAndToNamed(LoginScreen.routeName);
    });
  }

  Future<void> userRegister({
    required String email,
    required String password,
  }) async {
    try {
      AuthService.register(email: email, password: password);
      Get.offAllNamed(LoginScreen.routeName);
      return;
    } catch (e) {
      // AppSharedPreference.clear();
      rethrow;
    }
  }
}
