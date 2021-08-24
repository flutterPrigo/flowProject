import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xr_dumy/Screen/HomeScreen/HomeController.dart';
import 'package:xr_dumy/Screen/LoginScreen/LoginController.dart';

class SecondScreen extends StatelessWidget {
  static const routeName = '/SecondScreen';

  final passDataController = Get.put(LoginScreenController());
  final paDataController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              passDataController.emailController.text.toString(),
              style: TextStyle(color: Colors.red),
            ),
            Text(
              paDataController.passController.text.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
