import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarApp{

  static void showSnackBar ({required String massage, required String title}){

    Get.snackbar(
      title,
      massage,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      borderRadius: 8,
      backgroundColor: Colors.black45,
      animationDuration: const Duration(milliseconds: 500),
      barBlur: 10,
      colorText: Colors.white,
      isDismissible: false,
    );

  }

}